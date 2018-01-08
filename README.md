# Talk

#### App by [Aram Anderson](https://github.com/Aram-Anderson)

#### About

This app allows users to create an account through Facebook OAuth, then answer a bunch of social and political questions about themselves. The app then matches people with very different ideas, with the intention that they go have a coffee or something and just talk to one and other. The conversations don't need to be political in nature. The idea is just to get people to recognize each other as human beings who actually have a lot in common.

The app was built in Elixir using the Phoenix framework. This was my first attempt at building something in Elixir, and my first app using functional programming. As such, I'm sure there is a lot of code here that is not idiomatic. In total, this app was built in about 1 week. It was a 2 week project, but I spent about a week just learning Elixir and Phoenix, and not actually building the project. If you want to scan the codebase and let me know what I could have done better, I'm 100% great with that. I really like Elixir and Phoenix, and I'd love to get better at it.

To get this app running locally:

  * Clone this repo
  * `cd talk`
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Create an `.env` file at the root.
  * Go to [Facebook developer](https://developers.facebook.com/) and follow the instructions for adding an app. You'll need to whitelist `localhost:4000/auth/facebook/callback` in the app settings.
  * Get the App ID and App secret from the Facebook page, and add them to the `.env` file as: `export FACEBOOK_CLIENT_ID="YOUR APP ID HERE"` and `export FACEBOOK_CLIENT_SECRET="YOUR APP SECRET HERE"`
  * run `source .env` to make Phoenix look for a `.env` for those secrets.
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

To visit the production version of the app, go [here](https://cap-talk-app.herokuapp.com/). You will not be able to log in on production, however. Facebook OAuth will only allow whitelisted accounts to log in on an app in development mode, and I couldn't get approval to go into prod mode with Facebook.

## Things I'd like to add
  * Test coverage! In my scramble to learn how to build an app in a new language, I didn't write any tests. I really want to learn to test Elixir/Phoenix properly.
  * I'd love to break some of the view stuff into React components. Particularly the questions and the matches. Right now, the page reloads on each question being answered, which is less than ideal. I'll probably tackle that first.
  * I'd like to add in chat functionality using websockets. That's another thing I'll tackle soon. Phoenix does websockets really well, and I want to get that going.
  * There's a ton of frontend work that could be done to make things look better.
  * I'd like to work on the matching algorithm more. It works, but it could be a lot better.
  * I'd like to add a `user_questions` table to the DB that tracks what questions the user has answered, and only serves up unanswered questions.
  * Speaking of questions, I'd like to redo the ones that are there, and add a lot more. Because this was a short project, I just didn't have the time to spend a few days coming up with good social and political questions. I just used a sample of questions from the GSS, which I'm not crazy about.

## Contribution

  * Optionally message me and tell me what you want to do.
  * Fork the repo and do whatever.
  * Make a PR.
  * If it's something cool, I'll merge it.
