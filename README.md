# 操作系统内核实验2_2
修改kernal/vmm.c
```C
void user_vm_unmap(pagetable_t page_dir, uint64 va, uint64 size, int free) {
  // TODO (lab2_2): implement user_vm_unmap to disable the mapping of the virtual pages
  // in [va, va+size], and free the corresponding physical pages used by the virtual
  // addresses when if 'free' (the last parameter) is not zero.
  // basic idea here is to first locate the PTEs of the virtual pages, and then reclaim
  // (use free_page() defined in pmm.c) the physical pages. lastly, invalidate the PTEs.
  // as naive_free reclaims only one page at a time, you only need to consider one page
  // to make user/app_naive_malloc to behave correctly.
  pte_t* pte = page_walk(page_dir,va,0); 
  if(pte){
    uint64 pa=PTE2PA(*pte) + (va & ((1 << PGSHIFT) - 1));
    if(free){
      free_page((void *)pa);
    }
    *pte &= 0xfffffffffffffffe; 
  }
  //panic( "You have to implement user_vm_unmap to free pages using naive_free in lab2_2.\n" );
}
```
重新编译即可成功执行