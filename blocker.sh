#!/bin/sh
# http://mywiki.wooledge.org/SignalTrap#When_is_the_signal_handled.3F
trap 'echo "we get signal"; rm -f ~/fifo' EXIT
mkfifo -m 0400 ~/fifo || exit
echo "sleeping"
true < ~/fifo
