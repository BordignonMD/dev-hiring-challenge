# ExGitHubTop10

Application created to search and list the top 10 repositories of 5 languages (C, Elixir, Javascript, Java and Python) on GitHub. In addition, the application stores the results in a database and makes it possible to consult the 10 main repositories among the languages searched.
This project is divided into two parts, backend and frontend.

  * [Idea and Challenge](#Idea-and-Challenge)
  * [Operation](#Operation)
  * [Technologies](#Technologies)
  * [API documentation](#API-documentation)
  * [Installation Local](#Installation-Local)
  * [Support](#Support)

## Idea and Challenge

  Build a new application, using the framework of your choice (Ruby on Rails, Elixir Phoenix, Python Django or Flask, NodeJS Sails, Java Spring, ASP.NET or other), which should connect to the GitHub API and provide the following features :

  * Button to search and store the highlighted repositories of 5 languages ​​of your choice;
  * List the repositories found;
  * View details for each repository.
  * Some requirements:

  * It must be an entirely new application;
  * The solution must be in a public GitHub repository;
  * The application must store the information found;
  * Use PostgreSQL, MySQL or SQL Server;
  * Deploy should preferably be done on Heroku, AWS or Azure;
  * The application needs to have automated testing;

## Operation
  * Project on Heroku: <a href="https://exgithubtop10.herokuapp.com/">ExGitHubTop10</a>

  * When opening the page, 5 buttons are displayed, which when clicked show the 10 projects with the most stars on GitHub for the chosen language: C, Elixir, Javascript, Java and Python.

  * At the top of the page, there is a toggle button that allows you to view the history, with the 10 projects with the most stars among the 5 languages ​​researched.

  * To see the details of a project, click on its title.

## Technologies

This project was developed with the following technologies:

  * [Elixir](https://elixir-lang.org/)
  * [Javascript](https://www.javascript.com/)
  * [Phoenix](https://phoenixframework.org/)
  * [PostgreSQL](https://www.postgresql.org/)
  * [ReactJS](https://pt-br.reactjs.org/)

The backend of this project is built using Elixir through the Phoenix web framework. For database PostgreSQL is used.
The frontend of this project uses Javascript through the ReactJS library.

## API documentation

The API was documented using <a href="https://www.postman.com/">Postman</a> and can be found <a href="https://documenter.getpostman.com/view/16102124/TzsbMoJY">here</a>.

## Installation Local

1. Clone this repository

```
git clone https://github.com/BordignonMD/ExGitHubTop10.git
```

2. Start the backend

2.1. Access the backend folder

```
cd /path/to/backend
```

2.2. Install and compile dependencies

```
mix do deps.get, deps.compile
```

2.3. Create, migrate, and seed the database

```
mix ecto.create
mix ecto.migrate
mix ecto.seed
```

2.4. Start the server backend

```
mix phx.server
```

3. Start the frontend

3.1. Access the frontend folder

```
cd /path/to/frontend
```

3.2. Start the application frontend

```
npm dev
```
## Tests

1. Access the backend folder

```
cd /path/to/backend
```

2. Run the tests

```
mix test
```

## Support

Bug reports and feature requests can be filed with the rest for the project here:

  * [File Bug Reports and Features](https://github.com/BordignonMD/ExGitHubTop10./issues)

