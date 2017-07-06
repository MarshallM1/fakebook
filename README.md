# FAKEBOOK

A simple facebook clone, with the following features:

User authentication using Devise.
Friends (with friend requests).
Ability to submit text posts.
A user profile, showing a users submitted posts.
A feed, showing posts from the user and their friends.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
