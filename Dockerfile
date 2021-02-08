FROM debian:stable-slim as base

COPY ./build ./thr_build

RUN chmod a+x /thr_build/*.sh \
  && /thr_build/add_user.sh \
  && /thr_build/setup.sh \
  && /thr_build/cleanup.sh \
  && rm -rf /thr_build

COPY ./supervisord.conf ./

FROM azuracast/icecast-kh-ac:2.4.0-kh15-ac1 as icecast

FROM base

COPY --from=icecast /usr/local/bin/icecast /usr/local/bin/icecast
COPY --from=icecast /usr/local/share/icecast /usr/local/share/icecast

EXPOSE 9001
EXPOSE 8000-8999

CMD ["supervisord", "-c", "./supervisord.conf"]
