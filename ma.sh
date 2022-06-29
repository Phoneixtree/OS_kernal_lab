#!/bin/bash
clear
make clean
make
$spike ./obj/riscv-pke ./obj/app_naive_malloc
