# 操作系统内核实验3_2
修改kernal/syscall.c
```C
ssize_t sys_user_yield() {
  // TODO (lab3_2): implment the syscall of yield.
  // hint: the functionality of yield is to give up the processor. therefore,
  // we should set the status of currently running process to READY, insert it in
  // the rear of ready queue, and finally, schedule a READY process to run.
  current->status = READY;
  insert_to_ready_queue( current );
  schedule();
  //panic( "You need to implement the yield syscall in lab3_2.\n" );
  return 0;
}
```
重新编译即可成功执行或运行./ma.sh脚本执行