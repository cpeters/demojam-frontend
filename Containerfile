FROM registry.redhat.io/ubi10/ruby-33

USER 0
ADD . /tmp/src
RUN chown -R 1001:0 /tmp/src
USER 1001

RUN /usr/libexec/s2i/assemble

ENV RACK_ENV=production

CMD /usr/libexec/s2i/run
