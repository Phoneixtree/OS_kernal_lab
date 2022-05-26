# WHU 2022 OSkernal_LAB
## 操作系统内核实验1_3
在lab1_2修改的基础上
修改kernal/strap.c
```C++
static uint64 g_ticks = 0;
void handle_mtimer_trap() {
  sprint("Ticks %d\n", g_ticks);
  // TODO (lab1_3): increase g_ticks to record this "tick", and then clear the "SIP"
  // field in sip register.
  // hint: use write_csr to disable the SIP_SSIP bit in sip.
  g_ticks++;
  write_csr(sip, 0);
  //panic( "lab1_3: increase g_ticks by one, and clear SIP field in sip register.\n" );
}
```
重新编译即可成功执行