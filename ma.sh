#!/bin/bash
clear
make clean
make
$spike ./obj/riscv-pke ./obj/app_helloworld_no_lds
