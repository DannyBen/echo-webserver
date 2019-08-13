FROM dannyben/alpine-ruby

ENV PS1 "\n\n>> echo \W \$ "

COPY Gemfile* ./
RUN bundle install --jobs=3 --retry=3 --without development test 

COPY config.ru .

EXPOSE 3000
CMD rackup -p 3000 -o 0.0.0.0
