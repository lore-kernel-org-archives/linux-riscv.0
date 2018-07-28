From: lkp@intel.com (kbuild test robot)
Date: Sun, 29 Jul 2018 00:20:55 +0800
Subject: [PATCH] riscv: Convert uses of REG_FMT to %p
In-Reply-To: <db0636b3290bbc72084f170a28e4dee5a22a622d.1532714999.git.joe@perches.com>
References: <db0636b3290bbc72084f170a28e4dee5a22a622d.1532714999.git.joe@perches.com>
Message-ID: <201807290050.A99Vnu5d%fengguang.wu@intel.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Joe,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v4.18-rc6 next-20180727]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Joe-Perches/riscv-Convert-uses-of-REG_FMT-to-p/20180728-104236
config: riscv-defconfig (attached as .config)
compiler: riscv64-linux-gcc (GCC) 8.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=8.1.0 make.cross ARCH=riscv 

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:14,
                    from include/asm-generic/bug.h:18,
                    from arch/riscv/include/asm/bug.h:75,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from arch/riscv/mm/fault.c:23:
   arch/riscv/mm/fault.c: In function 'do_page_fault':
>> arch/riscv/mm/fault.c:197:60: error: expected ')' before 'REG_FMT'
     pr_alert("Unable to handle kernel %s at virtual address " REG_FMT "\n",
                                                               ^~~~~~~
   include/linux/printk.h:288:21: note: in definition of macro 'pr_fmt'
    #define pr_fmt(fmt) fmt
                        ^~~
   arch/riscv/mm/fault.c:197:2: note: in expansion of macro 'pr_alert'
     pr_alert("Unable to handle kernel %s at virtual address " REG_FMT "\n",
     ^~~~~~~~
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:14,
                    from include/asm-generic/bug.h:18,
                    from arch/riscv/include/asm/bug.h:75,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from arch/riscv/mm/fault.c:23:
>> include/linux/kern_levels.h:5:18: warning: format '%s' expects a matching 'char *' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^~~~~~
   include/linux/kern_levels.h:9:20: note: in expansion of macro 'KERN_SOH'
    #define KERN_ALERT KERN_SOH "1" /* action must be taken immediately */
                       ^~~~~~~~
   include/linux/printk.h:300:9: note: in expansion of macro 'KERN_ALERT'
     printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~~~
   arch/riscv/mm/fault.c:197:2: note: in expansion of macro 'pr_alert'
     pr_alert("Unable to handle kernel %s at virtual address " REG_FMT "\n",
     ^~~~~~~~
   arch/riscv/mm/fault.c:197:37: note: format string is defined here
     pr_alert("Unable to handle kernel %s at virtual address " REG_FMT "\n",
                                       ~^

vim +197 arch/riscv/mm/fault.c

07037db5 Palmer Dabbelt    2017-07-10  @23  #include <linux/mm.h>
07037db5 Palmer Dabbelt    2017-07-10   24  #include <linux/kernel.h>
07037db5 Palmer Dabbelt    2017-07-10   25  #include <linux/interrupt.h>
07037db5 Palmer Dabbelt    2017-07-10   26  #include <linux/perf_event.h>
07037db5 Palmer Dabbelt    2017-07-10   27  #include <linux/signal.h>
07037db5 Palmer Dabbelt    2017-07-10   28  #include <linux/uaccess.h>
07037db5 Palmer Dabbelt    2017-07-10   29  
07037db5 Palmer Dabbelt    2017-07-10   30  #include <asm/pgalloc.h>
07037db5 Palmer Dabbelt    2017-07-10   31  #include <asm/ptrace.h>
07037db5 Palmer Dabbelt    2017-07-10   32  
07037db5 Palmer Dabbelt    2017-07-10   33  /*
07037db5 Palmer Dabbelt    2017-07-10   34   * This routine handles page faults.  It determines the address and the
07037db5 Palmer Dabbelt    2017-07-10   35   * problem, and then passes it off to one of the appropriate routines.
07037db5 Palmer Dabbelt    2017-07-10   36   */
07037db5 Palmer Dabbelt    2017-07-10   37  asmlinkage void do_page_fault(struct pt_regs *regs)
07037db5 Palmer Dabbelt    2017-07-10   38  {
07037db5 Palmer Dabbelt    2017-07-10   39  	struct task_struct *tsk;
07037db5 Palmer Dabbelt    2017-07-10   40  	struct vm_area_struct *vma;
07037db5 Palmer Dabbelt    2017-07-10   41  	struct mm_struct *mm;
07037db5 Palmer Dabbelt    2017-07-10   42  	unsigned long addr, cause;
07037db5 Palmer Dabbelt    2017-07-10   43  	unsigned int flags = FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
07037db5 Palmer Dabbelt    2017-07-10   44  	int fault, code = SEGV_MAPERR;
07037db5 Palmer Dabbelt    2017-07-10   45  
07037db5 Palmer Dabbelt    2017-07-10   46  	cause = regs->scause;
07037db5 Palmer Dabbelt    2017-07-10   47  	addr = regs->sbadaddr;
07037db5 Palmer Dabbelt    2017-07-10   48  
07037db5 Palmer Dabbelt    2017-07-10   49  	tsk = current;
07037db5 Palmer Dabbelt    2017-07-10   50  	mm = tsk->mm;
07037db5 Palmer Dabbelt    2017-07-10   51  
07037db5 Palmer Dabbelt    2017-07-10   52  	/*
07037db5 Palmer Dabbelt    2017-07-10   53  	 * Fault-in kernel-space virtual memory on-demand.
07037db5 Palmer Dabbelt    2017-07-10   54  	 * The 'reference' page table is init_mm.pgd.
07037db5 Palmer Dabbelt    2017-07-10   55  	 *
07037db5 Palmer Dabbelt    2017-07-10   56  	 * NOTE! We MUST NOT take any locks for this case. We may
07037db5 Palmer Dabbelt    2017-07-10   57  	 * be in an interrupt or a critical region, and should
07037db5 Palmer Dabbelt    2017-07-10   58  	 * only copy the information from the master page table,
07037db5 Palmer Dabbelt    2017-07-10   59  	 * nothing more.
07037db5 Palmer Dabbelt    2017-07-10   60  	 */
07037db5 Palmer Dabbelt    2017-07-10   61  	if (unlikely((addr >= VMALLOC_START) && (addr <= VMALLOC_END)))
07037db5 Palmer Dabbelt    2017-07-10   62  		goto vmalloc_fault;
07037db5 Palmer Dabbelt    2017-07-10   63  
07037db5 Palmer Dabbelt    2017-07-10   64  	/* Enable interrupts if they were enabled in the parent context. */
1125203c Christoph Hellwig 2018-01-04   65  	if (likely(regs->sstatus & SR_SPIE))
07037db5 Palmer Dabbelt    2017-07-10   66  		local_irq_enable();
07037db5 Palmer Dabbelt    2017-07-10   67  
07037db5 Palmer Dabbelt    2017-07-10   68  	/*
07037db5 Palmer Dabbelt    2017-07-10   69  	 * If we're in an interrupt, have no user context, or are running
07037db5 Palmer Dabbelt    2017-07-10   70  	 * in an atomic region, then we must not take the fault.
07037db5 Palmer Dabbelt    2017-07-10   71  	 */
07037db5 Palmer Dabbelt    2017-07-10   72  	if (unlikely(faulthandler_disabled() || !mm))
07037db5 Palmer Dabbelt    2017-07-10   73  		goto no_context;
07037db5 Palmer Dabbelt    2017-07-10   74  
07037db5 Palmer Dabbelt    2017-07-10   75  	if (user_mode(regs))
07037db5 Palmer Dabbelt    2017-07-10   76  		flags |= FAULT_FLAG_USER;
07037db5 Palmer Dabbelt    2017-07-10   77  
07037db5 Palmer Dabbelt    2017-07-10   78  	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
07037db5 Palmer Dabbelt    2017-07-10   79  
07037db5 Palmer Dabbelt    2017-07-10   80  retry:
07037db5 Palmer Dabbelt    2017-07-10   81  	down_read(&mm->mmap_sem);
07037db5 Palmer Dabbelt    2017-07-10   82  	vma = find_vma(mm, addr);
07037db5 Palmer Dabbelt    2017-07-10   83  	if (unlikely(!vma))
07037db5 Palmer Dabbelt    2017-07-10   84  		goto bad_area;
07037db5 Palmer Dabbelt    2017-07-10   85  	if (likely(vma->vm_start <= addr))
07037db5 Palmer Dabbelt    2017-07-10   86  		goto good_area;
07037db5 Palmer Dabbelt    2017-07-10   87  	if (unlikely(!(vma->vm_flags & VM_GROWSDOWN)))
07037db5 Palmer Dabbelt    2017-07-10   88  		goto bad_area;
07037db5 Palmer Dabbelt    2017-07-10   89  	if (unlikely(expand_stack(vma, addr)))
07037db5 Palmer Dabbelt    2017-07-10   90  		goto bad_area;
07037db5 Palmer Dabbelt    2017-07-10   91  
07037db5 Palmer Dabbelt    2017-07-10   92  	/*
07037db5 Palmer Dabbelt    2017-07-10   93  	 * Ok, we have a good vm_area for this memory access, so
07037db5 Palmer Dabbelt    2017-07-10   94  	 * we can handle it.
07037db5 Palmer Dabbelt    2017-07-10   95  	 */
07037db5 Palmer Dabbelt    2017-07-10   96  good_area:
07037db5 Palmer Dabbelt    2017-07-10   97  	code = SEGV_ACCERR;
07037db5 Palmer Dabbelt    2017-07-10   98  
07037db5 Palmer Dabbelt    2017-07-10   99  	switch (cause) {
07037db5 Palmer Dabbelt    2017-07-10  100  	case EXC_INST_PAGE_FAULT:
07037db5 Palmer Dabbelt    2017-07-10  101  		if (!(vma->vm_flags & VM_EXEC))
07037db5 Palmer Dabbelt    2017-07-10  102  			goto bad_area;
07037db5 Palmer Dabbelt    2017-07-10  103  		break;
07037db5 Palmer Dabbelt    2017-07-10  104  	case EXC_LOAD_PAGE_FAULT:
07037db5 Palmer Dabbelt    2017-07-10  105  		if (!(vma->vm_flags & VM_READ))
07037db5 Palmer Dabbelt    2017-07-10  106  			goto bad_area;
07037db5 Palmer Dabbelt    2017-07-10  107  		break;
07037db5 Palmer Dabbelt    2017-07-10  108  	case EXC_STORE_PAGE_FAULT:
07037db5 Palmer Dabbelt    2017-07-10  109  		if (!(vma->vm_flags & VM_WRITE))
07037db5 Palmer Dabbelt    2017-07-10  110  			goto bad_area;
07037db5 Palmer Dabbelt    2017-07-10  111  		flags |= FAULT_FLAG_WRITE;
07037db5 Palmer Dabbelt    2017-07-10  112  		break;
07037db5 Palmer Dabbelt    2017-07-10  113  	default:
07037db5 Palmer Dabbelt    2017-07-10  114  		panic("%s: unhandled cause %lu", __func__, cause);
07037db5 Palmer Dabbelt    2017-07-10  115  	}
07037db5 Palmer Dabbelt    2017-07-10  116  
07037db5 Palmer Dabbelt    2017-07-10  117  	/*
07037db5 Palmer Dabbelt    2017-07-10  118  	 * If for any reason at all we could not handle the fault,
07037db5 Palmer Dabbelt    2017-07-10  119  	 * make sure we exit gracefully rather than endlessly redo
07037db5 Palmer Dabbelt    2017-07-10  120  	 * the fault.
07037db5 Palmer Dabbelt    2017-07-10  121  	 */
07037db5 Palmer Dabbelt    2017-07-10  122  	fault = handle_mm_fault(vma, addr, flags);
07037db5 Palmer Dabbelt    2017-07-10  123  
07037db5 Palmer Dabbelt    2017-07-10  124  	/*
07037db5 Palmer Dabbelt    2017-07-10  125  	 * If we need to retry but a fatal signal is pending, handle the
07037db5 Palmer Dabbelt    2017-07-10  126  	 * signal first. We do not need to release the mmap_sem because it
07037db5 Palmer Dabbelt    2017-07-10  127  	 * would already be released in __lock_page_or_retry in mm/filemap.c.
07037db5 Palmer Dabbelt    2017-07-10  128  	 */
07037db5 Palmer Dabbelt    2017-07-10  129  	if ((fault & VM_FAULT_RETRY) && fatal_signal_pending(tsk))
07037db5 Palmer Dabbelt    2017-07-10  130  		return;
07037db5 Palmer Dabbelt    2017-07-10  131  
07037db5 Palmer Dabbelt    2017-07-10  132  	if (unlikely(fault & VM_FAULT_ERROR)) {
07037db5 Palmer Dabbelt    2017-07-10  133  		if (fault & VM_FAULT_OOM)
07037db5 Palmer Dabbelt    2017-07-10  134  			goto out_of_memory;
07037db5 Palmer Dabbelt    2017-07-10  135  		else if (fault & VM_FAULT_SIGBUS)
07037db5 Palmer Dabbelt    2017-07-10  136  			goto do_sigbus;
07037db5 Palmer Dabbelt    2017-07-10  137  		BUG();
07037db5 Palmer Dabbelt    2017-07-10  138  	}
07037db5 Palmer Dabbelt    2017-07-10  139  
07037db5 Palmer Dabbelt    2017-07-10  140  	/*
07037db5 Palmer Dabbelt    2017-07-10  141  	 * Major/minor page fault accounting is only done on the
07037db5 Palmer Dabbelt    2017-07-10  142  	 * initial attempt. If we go through a retry, it is extremely
07037db5 Palmer Dabbelt    2017-07-10  143  	 * likely that the page will be found in page cache at that point.
07037db5 Palmer Dabbelt    2017-07-10  144  	 */
07037db5 Palmer Dabbelt    2017-07-10  145  	if (flags & FAULT_FLAG_ALLOW_RETRY) {
07037db5 Palmer Dabbelt    2017-07-10  146  		if (fault & VM_FAULT_MAJOR) {
07037db5 Palmer Dabbelt    2017-07-10  147  			tsk->maj_flt++;
07037db5 Palmer Dabbelt    2017-07-10  148  			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MAJ,
07037db5 Palmer Dabbelt    2017-07-10  149  				      1, regs, addr);
07037db5 Palmer Dabbelt    2017-07-10  150  		} else {
07037db5 Palmer Dabbelt    2017-07-10  151  			tsk->min_flt++;
07037db5 Palmer Dabbelt    2017-07-10  152  			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN,
07037db5 Palmer Dabbelt    2017-07-10  153  				      1, regs, addr);
07037db5 Palmer Dabbelt    2017-07-10  154  		}
07037db5 Palmer Dabbelt    2017-07-10  155  		if (fault & VM_FAULT_RETRY) {
07037db5 Palmer Dabbelt    2017-07-10  156  			/*
07037db5 Palmer Dabbelt    2017-07-10  157  			 * Clear FAULT_FLAG_ALLOW_RETRY to avoid any risk
07037db5 Palmer Dabbelt    2017-07-10  158  			 * of starvation.
07037db5 Palmer Dabbelt    2017-07-10  159  			 */
07037db5 Palmer Dabbelt    2017-07-10  160  			flags &= ~(FAULT_FLAG_ALLOW_RETRY);
07037db5 Palmer Dabbelt    2017-07-10  161  			flags |= FAULT_FLAG_TRIED;
07037db5 Palmer Dabbelt    2017-07-10  162  
07037db5 Palmer Dabbelt    2017-07-10  163  			/*
07037db5 Palmer Dabbelt    2017-07-10  164  			 * No need to up_read(&mm->mmap_sem) as we would
07037db5 Palmer Dabbelt    2017-07-10  165  			 * have already released it in __lock_page_or_retry
07037db5 Palmer Dabbelt    2017-07-10  166  			 * in mm/filemap.c.
07037db5 Palmer Dabbelt    2017-07-10  167  			 */
07037db5 Palmer Dabbelt    2017-07-10  168  			goto retry;
07037db5 Palmer Dabbelt    2017-07-10  169  		}
07037db5 Palmer Dabbelt    2017-07-10  170  	}
07037db5 Palmer Dabbelt    2017-07-10  171  
07037db5 Palmer Dabbelt    2017-07-10  172  	up_read(&mm->mmap_sem);
07037db5 Palmer Dabbelt    2017-07-10  173  	return;
07037db5 Palmer Dabbelt    2017-07-10  174  
07037db5 Palmer Dabbelt    2017-07-10  175  	/*
07037db5 Palmer Dabbelt    2017-07-10  176  	 * Something tried to access memory that isn't in our memory map.
07037db5 Palmer Dabbelt    2017-07-10  177  	 * Fix it, but check if it's kernel or user first.
07037db5 Palmer Dabbelt    2017-07-10  178  	 */
07037db5 Palmer Dabbelt    2017-07-10  179  bad_area:
07037db5 Palmer Dabbelt    2017-07-10  180  	up_read(&mm->mmap_sem);
07037db5 Palmer Dabbelt    2017-07-10  181  	/* User mode accesses just cause a SIGSEGV */
07037db5 Palmer Dabbelt    2017-07-10  182  	if (user_mode(regs)) {
07037db5 Palmer Dabbelt    2017-07-10  183  		do_trap(regs, SIGSEGV, code, addr, tsk);
07037db5 Palmer Dabbelt    2017-07-10  184  		return;
07037db5 Palmer Dabbelt    2017-07-10  185  	}
07037db5 Palmer Dabbelt    2017-07-10  186  
07037db5 Palmer Dabbelt    2017-07-10  187  no_context:
07037db5 Palmer Dabbelt    2017-07-10  188  	/* Are we prepared to handle this kernel fault? */
07037db5 Palmer Dabbelt    2017-07-10  189  	if (fixup_exception(regs))
07037db5 Palmer Dabbelt    2017-07-10  190  		return;
07037db5 Palmer Dabbelt    2017-07-10  191  
07037db5 Palmer Dabbelt    2017-07-10  192  	/*
07037db5 Palmer Dabbelt    2017-07-10  193  	 * Oops. The kernel tried to access some bad page. We'll have to
07037db5 Palmer Dabbelt    2017-07-10  194  	 * terminate things with extreme prejudice.
07037db5 Palmer Dabbelt    2017-07-10  195  	 */
07037db5 Palmer Dabbelt    2017-07-10  196  	bust_spinlocks(1);
07037db5 Palmer Dabbelt    2017-07-10 @197  	pr_alert("Unable to handle kernel %s at virtual address " REG_FMT "\n",

:::::: The code at line 197 was first introduced by commit
:::::: 07037db5d479f90377c998259a4f9a469c404edf RISC-V: Paging and MMU

:::::: TO: Palmer Dabbelt <palmer@dabbelt.com>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 16327 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180729/f20d3281/attachment.gz>
