import React, {useState, useEffect} from "react";
import "./styles.css";
import api from '../../services/api';

import Linkedin from '@material-ui/icons/LinkedIn';
import ToggleOff from '@material-ui/icons/ToggleOff';
import ToggleOn  from '@material-ui/icons/ToggleOn';

interface Repository {
  id: number,
  name: string,
  description: string,
  language: string,
  stars: number,
  last_update: string,
  url: string
}

const Home = () => {

  const [selectedLanguage, setSelectedLanguage] = useState("");

  const [repoView, setRepoView] = useState(false);

  const [buttonSelected, setButtonSelected] = useState("0");

  const [repoSearchList, setRepoSearchList] = useState<Repository[]>([]);
  const [repoHistoryList, setRepoHistoryList] = useState<Repository[]>([]);

  // Loading the history repositories 
  useEffect(() => {
    api.get('/repositories')
    .then(response => {
      setRepoHistoryList(response.data.data)
    })
  });

  // Loading the repositories from language selected
  useEffect(() => {
    if (selectedLanguage === "") return;

    api.get(`/repositories?language=${selectedLanguage}`)
    .then(response => {
      setRepoSearchList(response.data.data)
    })
  }, [selectedLanguage]);

  function handleSearchLanguage(language: string, button: string) {
    setSelectedLanguage(language)
    setButtonSelected(button)
  }

  function handleChangeView(option: boolean) {
    setRepoView(option)
  }

  function convert_date(data_string: string) {
    const data = new Date(data_string)

    return data.getDate().toString().padStart(2, '0') + "/" + data.getMonth().toString().padStart(2, '0') + "/" + data.getFullYear();
  }

  return (
    <div id="home" className="home">

      <div className="header">
        <div className="header_button">
          <p onClick={() => handleChangeView(false)}><b>Consulta</b></p>
          {repoView
            ?  <ToggleOn  onClick={() => handleChangeView(!repoView)} style={css_toggleLayout} />
            : <ToggleOff onClick={() => handleChangeView(!repoView)} style={css_toggleLayout} />
          }
          
          <p onClick={() => handleChangeView(true)}><b>Histórico</b></p>
        </div>
      </div>

      <div className="repositories">
        {repoView
          ? 
          <div className="list">
            <h1>Histórico de repositórios destaques</h1>
            <h3>Repositórios mais destacados já buscados</h3>

            <section>
              {repoHistoryList.map((repository, index) =>(
                <div className="repository">
                  <div className="repository_header">
                    <h2>{index + 1}</h2>

                    <a href={repository.url}>{repository.name}</a>

                    <p><b>Stars:</b> {repository.stars}</p>
                  </div>
                  <div className="repository_body">
                    <p><b>Descrição:</b> {repository.description}</p>
                  </div>
                  <div className="repository_footer">
                    <p><b>Linguagem:&nbsp;</b>{repository.language}</p>
                    <p><b>Última alteração:&nbsp;</b>{convert_date(repository.last_update)}</p>
                  </div>
                </div>
              ))}
            </section>
          </div>
          
          :
          <div className="list">
            <h1>Repositórios Destaques</h1>
            <h3>Selecione a linguagem para visualizar os Top10 repositórios em destaque</h3>

            <div className="buttons">
              <div className={buttonSelected === "1" ? "button_selected" : "button"} onClick={() => handleSearchLanguage("C", "1")}>C</div>
              <div className={buttonSelected === "2" ? "button_selected" : "button"} onClick={() => handleSearchLanguage("Elixir", "2")}>Elixir</div>
              <div className={buttonSelected === "3" ? "button_selected" : "button"} onClick={() => handleSearchLanguage("Javascript", "3")}>Javascript</div>
              <div className={buttonSelected === "4" ? "button_selected" : "button"} onClick={() => handleSearchLanguage("Java", "4")}>Java</div>
              <div className={buttonSelected === "5" ? "button_selected" : "button"} onClick={() => handleSearchLanguage("Python", "5")}>Python</div>
            </div>

            <section>
              {repoSearchList.map((repository, index) =>(
                <div className="repository">
                  <div className="repository_header">
                    <h2>{index + 1}</h2>

                    <a href={repository.url}>{repository.name}</a>

                    <p><b>Stars:</b> {repository.stars}</p>
                  </div>
                  <div className="repository_body">
                    <p><b>Descrição:</b> {repository.description}</p>
                  </div>
                  <div className="repository_footer">
                    <p><b>Linguagem:&nbsp;</b>{repository.language}</p>
                    <p><b>Última alteração:&nbsp;</b>{convert_date(repository.last_update)}</p>
                  </div>
                </div>
              ))}
            </section>
          </div>
        }
      </div>

      <div className="footer">
        <div>
          <a  href="https://www.linkedin.com/in/matheusdb/">Linked</a>
          <Linkedin style={css_linkedinLayout} />
        </div>
        <p>Powered by Matheus Deon Bordignon</p>
      </div>
    </div>
  );
};

const css_toggleLayout: React.CSSProperties = {
  fontSize: "7rem"
};

const css_linkedinLayout: React.CSSProperties = {
  fontSize: "2.8rem"
};

export default Home;