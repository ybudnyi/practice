FROM ruby:2.4.1
RUN apt-get update && apt-get install -y build-essential git libmysqlclient-dev libpq-dev ruby-dev nodejs postgresql-client
RUN git clone https://github.com/ybudnyi/demo2.git
RUN cd demo2/bin && ./setup
EXPOSE 3000/tcp
CMD ["/demo2/bin/start"]