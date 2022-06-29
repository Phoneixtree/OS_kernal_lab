# 操作系统内核实验2_1
修改kernal/vmm.c
```C
void *user_va_to_pa(pagetable_t page_dir, void *va) {
  // TODO (lab2_1): implement user_va_to_pa to convert a given user virtual address "va"
  // to its corresponding physical address, i.e., "pa". To do it, we need to walk
  // through the page table, starting from its directory "page_dir", to locate the PTE
  // that maps "va". If found, returns the "pa" by using:
  // pa = PYHS_ADDR(PTE) + (va - va & (1<<PGSHIFT -1))
  // Here, PYHS_ADDR() means retrieving the starting address (4KB aligned), and
  // (va - va & (1<<PGSHIFT -1)) means computing the offset of "va" in its page.
  // Also, it is possible that "va" is not mapped at all. in such case, we can find
  // invalid PTE, and should return NULL.

  uint64 va_tmp = (uint64)va;
  pte_t* pte = page_walk(page_dir,va_tmp,0); 
  
  if(pte){   
    uint64 pa=PTE2PA(*pte) + (va_tmp & ((1 << PGSHIFT) - 1));
    return (void*)pa;
  }
  else{
    return NULL;
  }
   //panic( "You have to implement user_va_to_pa (convert user va to pa) to print messages in lab2_1.\n" );
}
```
重新编译即可成功执行