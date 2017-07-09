# FAKEBOOK

A simple facebook clone, with the following features:

* User authentication using Devise.
* Log in requirement to use core functions
* Friends (with friend requests).
* Ability to submit text posts.
* Ability to like posts.
* Ability to comment on posts.
* A user profile, showing a users submitted posts.
* A feed, showing posts from the user and their friends.

# View the app live on [Heroku](https://whispering-bastion-95435.herokuapp.com/):

Log in with the seeded accounts:

* example@example.com
* hands@example.com
* duchess@example.com
* boss@example.com

All with the password:

password

Or create your own account.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Optionally, seed the database (edit db/seeds.rb to create your own seeds):

```
$ rails db:seed
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
