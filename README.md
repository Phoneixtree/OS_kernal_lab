# 操作系统内核实验3_3
修改kernal/strap.c
```C
void rrsched() {
  // TODO (lab3_3): implements round-robin scheduling.
  // hint: increase the tick_count member of current process by one, if it is bigger than
  // TIME_SLICE_LEN (means it has consumed its time slice), change its status into READY,
  // place it in the rear of ready queue, and finally schedule next process to run.
  while(current->tick_count<=TIME_SLICE_LEN)
  {
    current->tick_count+=1;
  }
  current->status = READY;
  insert_to_ready_queue(current);
  schedule();
  //panic( "You need to further implement the timer handling in lab3_3.\n" );
}
```
重新编译即可成功执行或运行./ma.sh脚本执行