#!/bin/bash

aerolab attach shell --name dc1 --node=1 -- asbench -p 3100 -n test
aerolab attach shell --name dc1 --node=2 -- asbench -p 3101 -n test

aerolab attach shell --name dc2 --node=1 -- asbench -p 3102 -n test
