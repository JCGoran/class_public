# NOTE: if you are building this Dockerfile directly, a lot or warnings may be displayed;
# to turn them off, use "docker build -q [PATH]", where [PATH] is the location of this Dockerfile;
# most of the warnings are harmless and do not affect the outcome of the build
FROM gcc:latest
# get all the standard required libraries
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    python-pip \
    python-dev \
    && apt-get clean && apt-get autoremove -y
RUN pip install cython numpy
# get CLASS and set it up
WORKDIR /
RUN git clone https://github.com/lesgourg/class_public class
WORKDIR /class/
RUN make all
RUN cp libclass.a /usr/lib/x86_64-linux-gnu/
RUN cp include/*.h /usr/include/
RUN ln -s /class/class /usr/bin/class
