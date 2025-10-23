FROM registry.redhat.io/ubi10/ruby-33

USER 0
ADD . ./
RUN bundle install

ENV RACK_ENV=production

CMD ["bundle", "exec", "puma"]
