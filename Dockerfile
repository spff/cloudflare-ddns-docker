FROM alpine:3.11

COPY update_record.sh /update_record.sh
COPY blocker.sh /blocker.sh
RUN apk add --no-cache curl &&\
 chmod 755 /update_record.sh &&\
 chmod 755 /blocker.sh

# http://mywiki.wooledge.org/SignalTrap#When_is_the_signal_handled.3F
CMD ["/blocker.sh"]


