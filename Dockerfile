#FROM allows you to build your image up on base image
FROM node

#all commands will be executed from inside that folder
WORKDIR /app

#which files lives on our local machine that should go in to the image COPY
#first . is the path outside of the image where the files live that should be copied into the image
#so . means that it is the same folder that contains the docker file -excluding the docker file-
#second . is the path inside of the image where those files should be stored
#you can name it however you want, ex rather than . you can name it /app
#and this folder will be created in the image and the container if it doesn't exists yet
#since we set WORKDIR the we can replace /app with . or ./
# COPY . ./
COPY . /app

RUN npm install

#when we listen to a specific port, the container doesn't expose that port to our local machine
#so we won't be able to listen on that port just because something is listening inside of a container
EXPOSE 80

#RUN node server.js
#this is incorrect because this will be executed whenever this image is being built
#below means that this will not be executed when an image is being created but when a container is started based on the image
#note that if you don't specify a CMD, the CMD of the base image will be executed.
# with no base image and no CMD, you'd get an error.
CMD [ "node", "server.js" ]