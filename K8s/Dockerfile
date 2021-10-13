FROM ruby:2.4.1
RUN apt-get update && apt-get install -y build-essential git libmysqlclient-dev libpq-dev ruby-dev nodejs postgresql-client
RUN git clone https://github.com/ybudnyi/demo2.git
RUN cd demo2/bin && ./setup
ENV PORT=3000
ENV RAILS_SERVE_STATIC_FILES="true"
ENV RAILS_ENV=production
ENV DB_USERNAME=postgres
ENV DB_PASSWORD=1111
ENV DB_DATABASE=app
ENV DB_HOST=db
ENV DOMAIN_NAME=yurii
ENV SECRET_KEY_BASE=bb87d94301d5653e011d281e01bab94f2b35808ed42b92654ad95c88da33a9c21a3267abc125d69ed3768ffb73992873b1058870b7f036467ffcb8060f13ff20
ENV OMNIAUTH_CLIENT_GOOGLE=586017836604-ivqenr04o0uu3oijlt2h3edphdeus6j3.apps.googleusercontent.com
ENV OMNIAUTH_SECRET_GOOGLE=KuMlVxS0U0M8Rpw8YqCoxcyr
EXPOSE 3000/tcp
CMD ["/demo2/bin/start"]

