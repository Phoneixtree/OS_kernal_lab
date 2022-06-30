# 操作系统内核实验2_3
修改kernal/strap.c
```C
void handle_user_page_fault(uint64 mcause, uint64 sepc, uint64 stval) {
  sprint("handle_page_fault: %lx\n", stval);
  switch (mcause) {
    case CAUSE_STORE_PAGE_FAULT:
      // TODO (lab2_3): implement the operations that solve the page fault to
      // dynamically increase application stack.
      // hint: first allocate a new physical page, and then, maps the new page to the
      // virtual address that causes the page fault.
      if((stval<0x7ffff000)&&(stval>=(0x7ffff000-0x14000))) //#define USER_STACK_TOP 0x7ffff000,set user_stack's volume 20*4kb 
        {
        void* pa = alloc_page();
        uint64 va = stval&0xfffffffffffff000;//aligned to 4kb
        user_vm_map((pagetable_t)current->pagetable, va, PGSIZE, (uint64)pa,
        prot_to_type(PROT_WRITE | PROT_READ, 1));
        }
      else{
        panic("illegal logical address.\n");
      }
      //panic( "You need to implement the operations that actually handle the page fault in lab2_3.\n" );
      break;
    default:
      sprint("unknown page fault.\n");
      break;
  }
}
```
重新编译即可成功执行
或运行./ma.sh脚本执行