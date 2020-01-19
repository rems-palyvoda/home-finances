# README

This README would normally document whatever steps are necessary to get the
application up and running.

https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-two

# Attempt to access API without a token
$ http :3000/transactions
# Signup a new user - get token from here
$ http :3000/signup name=ash email=ash@email.com password=foobar password_confirmation=foobar
# Get new user transactions
$ http :3000/transactions Authorization:'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE0ODg5MDEyNjR9.7txvLgDzFdX5NIUGYb3W45oNIXinwB_ITu3jdlG5Dds'
# create transaction for new user
$ http POST :3000/transactions title=Beethoven direction='expence' Authorization:'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE0ODg5MDEyNjR9.7txvLgDzFdX5NIUGYb3W45oNIXinwB_ITu3jdlG5Dds'
# Get created transactions
$ http :3000/transactions Authorization:'eyJ0eXAiOiJKV1QiLC
# Login created user
$ http POST :3000/auth/login email='ivan@example.com' password='password'