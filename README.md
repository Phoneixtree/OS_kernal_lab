# WHU 2022 OSkernal_LAB
## 操作系统内核实验1_1
修改kernal/strap.c
```C++
static void handle_syscall(trapframe *tf) {
  // tf->epc points to the address that our computer will jump to after the trap handling.
  // for a syscall, we should return to the NEXT instruction after its handling.
  // in RV64G, each instruction occupies exactly 32 bits (i.e., 4 Bytes)
  tf->epc += 4;

  // TODO (lab1_1): remove the panic call below, and call do_syscall (defined in
  // kernel/syscall.c) to conduct real operations of the kernel side for a syscall.
  // IMPORTANT: return value should be returned to user app, or else, you will encounter
  // problems in later experiments!
  long a0=tf->regs.a0;
  long a1=tf->regs.a1;
  long a2=tf->regs.a2;
  long a3=tf->regs.a3;
  long a4=tf->regs.a4;
  long a5=tf->regs.a5;
  long a6=tf->regs.a6;
  long a7=tf->regs.a7;
  do_syscall(a0,a1,a2,a3,a4,a5,a6,a7);
  //panic( "call do_syscall to accomplish the syscall and lab1_1 here.\n" );
}
```
重新编译即可成功执行