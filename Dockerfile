FROM ruby:3.3.4 as ruby 
LABEL ctname="docker_prac"
RUN apt update && apt install -y nodejs libvips cron
RUN mkdir /app
WORKDIR /app 
COPY . /app 
RUN RAILS_ENV=production bundle install 
# RUN whenever --update-crontab
COPY entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh
EXPOSE 3000
ENTRYPOINT [ "/opt/entrypoint.sh" ]