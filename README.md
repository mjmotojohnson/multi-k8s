docker run -it -v $(pwd):/app ruby:2.3 sh
gem install travis --no-rdoc --no-ri
gem install travis
travis login
copy json file into the 'volumed' directory so we can use it in the containers
travis encrypt-file service-account.json
