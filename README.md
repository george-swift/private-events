![](https://img.shields.io/badge/Microverse-blueviolet)

## Project Name: Private Events

### Objective:
To put in practice the main concepts of Associations in rails through an app similar to Eventbrite

![screenshot](./app/assets/images/screenshot.png)

## Features

> The front end ( `http://localhost:3000/` ) displays the list of all events, categorized by upcoming and past ones.
> Only signed-in users can register to events.
> Links in the nav bar lets users `Join`, `Sign In`, view `Popular Events` and `Logout` if signed in. When Signed in, a user can access private pages via `Create Event` and `My Events` links.
> Every signed-in user can invite other users to an event.
> Only upcoming events show the option to invite users.
> After an event is successfully created, the user gets redirected to the event's show page.
> When viewing an event, the user can see a list of all the attendees.

## Prerequisites
- Ruby 3.0.
- Rails 6.1.3
- SQLite3
- Node.js
- Yarn

## Getting Started & Troubleshooting
- Open your terminal - Windows: `Win + R`, then type `cmd` | Mac: `Command + space`, then type `Terminal`
- Navigate to a directory of your choosing using the `cd` command
- Run this command in your OS terminal: `git clone git@github.com:george-swift/private-events.git` to get a copy of the project.
- Navigate to the project's directory using the `cd` command
- Migrate the database to your environment using: `rails db:migrate`
- Run `raº` to configure Webpacker for your environment. Otherwise, an error like so `Webpacker::Manifest::MissingEntryError` will appear if you attempt to run the server.
- The Rails asset pipeline works in parallel with Webpack and Yarn, and you need both jQuery and Bootstrap’s JavaScript library installed for the app to work. To begin execute `yarn add jquery@3.4.1 bootstrap@3.4.1`.
- Next, to make jQuery available in your application, you need to edit Webpack’s environment file. Navigate to `config/webpack/environment.js` and include the following snippet below the first line:
```
  const webpack = require('webpack')
  environment.plugins.append('Provide',
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
      Popper: ['popper.js', 'default']
    })
  )

```
- Then install dependencies by running `bundle install` in the terminal
- Finally, run the test suite to verify that everything is working correctly: `rails test`
- If the test suite passes, you are ready to run the app in a local server. Execute `rails s` to fire up the server
- Visit `http://localhost:3000/` in your browser to get into the app 
- Users can interact with the app using the links in the nav bar. To access private pages, sign up by clicking the `Join` link
- To terminate the server, enter `Ctrl + C` in your terminal


## Authors

👤  &nbsp; **Miguel Ricardo Gomez**
- GitHub: [@MiguelArgentina](https://github.com/MiguelArgentina)
- Twitter: [@Qete_arg](https://twitter.com/Qete_arg)
- LinkedIn: [Miguel Ricardo Gomez](https://www.linkedin.com/in/miguelricardogomez/)

👤 &nbsp; **Ubong George**
- GitHub: [@george-swift](https://github.com/george-swift)
- Twitter: [@\_\_pragmaticdev](https://twitter.com/__pragmaticdev)

## Acknowledgments

Ruby on Rails Guide for technical information on how to be productive with Rails

## Show your support

Give a :star:️ &nbsp; if you like this project!

## License

Available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

