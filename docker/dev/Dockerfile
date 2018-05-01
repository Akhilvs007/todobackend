

FROM jmenga/todobackend-base:latest
MAINTAINER Akhil VS <akhil.vs7@gmail.com>


#install dev/build dependencies
RUN apt-get update && \
    apt-get install -qy python-dev libmysqlclient-dev python-setuptools build-essential
    

#Activate virtual env and install whell support
RUN . /appenv/bin/activate && \
    pip install wheel --upgrade

#INstall setup tools

RUN pip install setuptools --upgrade

# pip environment variables (NOTE: must be set after installing wheel)
ENV WHEELHOUSE=/wheelhouse PIP_WHEEL_DIR=/wheelhouse PIP_FIND_LINKS=/wheelhouse XDG_CACHE_HOME=/cache



#output : build artifacts (wheels) are output here
VOLUME /wheelhouse


#OUTPUT : Build Cache
VOLUME /build

#output: Test reports are output here
VOLUME /reports


#Add test entrypoint script
COPY scripts/test.sh /usr/local/bin/test.sh
RUN chmod +x /usr/local/bin/test.sh

#Set defaults for entrypoint and command string
ENTRYPOINT ["test.sh"]
CMD ["python", "manage.py", "test", "--noinput"]



#Add application source
COPY src /application
WORKDIR /application
