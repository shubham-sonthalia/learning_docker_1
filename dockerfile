# base version of the application
# it's an image that can be found on hub.docker.com
FROM node:20

#working directory
WORKDIR /app 

# copy everything over to the working directory
COPY . .

RUN npm install
RUN npm run build
RUN npx prisma generate


EXPOSE 3000 

#runs when you start the container. hence CMD is used 
# instead of RUN 
# RUN is used for bootstrapping the image. 
# CMD is used as a command when we want to 
CMD ["node", "dist/index.js"]