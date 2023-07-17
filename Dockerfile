FROM python:3.8-slim-buster

# set a directory for the app
WORKDIR /app

# copy all the files to the container
COPY . /app

# install dependencies
RUN pip install -r requirements.txt


# define the port number the container should expose
#EXPOSE 5000

# run the command
EXPOSE 5000
ENV FLASK_APP=flask_app.py
CMD ["flask", "run", "--host", "0.0.0.0"]