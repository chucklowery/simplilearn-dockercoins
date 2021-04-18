FROM ruby:alpine

RUN apk add build-base && gem install thin sinatra 

# Copy the source code from the git repo into the Docker image
COPY . .

# Metadata for the container
ENTRYPOINT ["ruby"]
CMD ["hasher.rb"]
EXPOSE 8080
