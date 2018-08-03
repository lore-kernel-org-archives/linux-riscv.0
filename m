From: lkp@intel.com (kbuild test robot)
Date: Fri, 3 Aug 2018 14:42:56 +0800
Subject: [PATCH v3 2/4] Refactor FPU codes in signal setup/return
 procedures
In-Reply-To: <1533188391-5932-3-git-send-email-alankao@andestech.com>
References: <1533188391-5932-3-git-send-email-alankao@andestech.com>
Message-ID: <201808031430.WGz9wpcD%fengguang.wu@intel.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Alan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v4.18-rc7 next-20180802]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Alan-Kao/Extract-FPU-context-operations-from-entry-S/20180803-064749
config: riscv-defconfig (attached as .config)
compiler: riscv64-linux-gcc (GCC) 8.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=8.1.0 make.cross ARCH=riscv 

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:18,
                    from arch/riscv/include/asm/bug.h:75,
                    from include/linux/bug.h:5,
                    from include/linux/signal.h:5,
                    from arch/riscv/kernel/signal.c:22:
   arch/riscv/kernel/signal.c: In function 'save_fp_state':
>> arch/riscv/kernel/signal.c:80:38: error: 'sc_fpregs' is a pointer; did you mean to use '->'?
     for (i = 0; i < ARRAY_SIZE(sc_fpregs.q.reserved); i++) {
                                         ^
   include/linux/kernel.h:72:33: note: in definition of macro 'ARRAY_SIZE'
    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                    ^~~
>> arch/riscv/kernel/signal.c:80:38: error: 'sc_fpregs' is a pointer; did you mean to use '->'?
     for (i = 0; i < ARRAY_SIZE(sc_fpregs.q.reserved); i++) {
                                         ^
   include/linux/kernel.h:72:48: note: in definition of macro 'ARRAY_SIZE'
    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                                   ^~~
   In file included from include/linux/kernel.h:15,
                    from include/asm-generic/bug.h:18,
                    from arch/riscv/include/asm/bug.h:75,
                    from include/linux/bug.h:5,
                    from include/linux/signal.h:5,
                    from arch/riscv/kernel/signal.c:22:
>> arch/riscv/kernel/signal.c:80:38: error: 'sc_fpregs' is a pointer; did you mean to use '->'?
     for (i = 0; i < ARRAY_SIZE(sc_fpregs.q.reserved); i++) {
                                         ^
   include/linux/build_bug.h:29:56: note: in definition of macro 'BUILD_BUG_ON_ZERO'
    #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:(-!!(e)); }))
                                                           ^
   include/linux/compiler-gcc.h:65:46: note: in expansion of macro '__same_type'
    #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
                                                 ^~~~~~~~~~~
   include/linux/kernel.h:72:59: note: in expansion of macro '__must_be_array'
    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                                              ^~~~~~~~~~~~~~~
   arch/riscv/kernel/signal.c:80:18: note: in expansion of macro 'ARRAY_SIZE'
     for (i = 0; i < ARRAY_SIZE(sc_fpregs.q.reserved); i++) {
                     ^~~~~~~~~~
>> arch/riscv/kernel/signal.c:80:38: error: 'sc_fpregs' is a pointer; did you mean to use '->'?
     for (i = 0; i < ARRAY_SIZE(sc_fpregs.q.reserved); i++) {
                                         ^
   include/linux/build_bug.h:29:56: note: in definition of macro 'BUILD_BUG_ON_ZERO'
    #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:(-!!(e)); }))
                                                           ^
   include/linux/compiler-gcc.h:65:46: note: in expansion of macro '__same_type'
    #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
                                                 ^~~~~~~~~~~
   include/linux/kernel.h:72:59: note: in expansion of macro '__must_be_array'
    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                                              ^~~~~~~~~~~~~~~
   arch/riscv/kernel/signal.c:80:18: note: in expansion of macro 'ARRAY_SIZE'
     for (i = 0; i < ARRAY_SIZE(sc_fpregs.q.reserved); i++) {
                     ^~~~~~~~~~
   include/linux/build_bug.h:29:45: error: bit-field '<anonymous>' width not an integer constant
    #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:(-!!(e)); }))
                                                ^
   include/linux/compiler-gcc.h:65:28: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
    #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
                               ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:72:59: note: in expansion of macro '__must_be_array'
    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                                              ^~~~~~~~~~~~~~~
   arch/riscv/kernel/signal.c:80:18: note: in expansion of macro 'ARRAY_SIZE'
     for (i = 0; i < ARRAY_SIZE(sc_fpregs.q.reserved); i++) {
                     ^~~~~~~~~~
   In file included from include/linux/uaccess.h:14,
                    from arch/riscv/kernel/signal.c:23:
   arch/riscv/kernel/signal.c:81:33: error: 'sc_fpregs' is a pointer; did you mean to use '->'?
      err = __put_user(0, &sc_fpregs.q.reserved[i]);
                                    ^
   arch/riscv/include/asm/uaccess.h:348:15: note: in definition of macro '__put_user'
     __typeof__(*(ptr)) __user *__gu_ptr = (ptr);  \
                  ^~~
   arch/riscv/kernel/signal.c:81:33: error: 'sc_fpregs' is a pointer; did you mean to use '->'?
      err = __put_user(0, &sc_fpregs.q.reserved[i]);
                                    ^
   arch/riscv/include/asm/uaccess.h:348:41: note: in definition of macro '__put_user'
     __typeof__(*(ptr)) __user *__gu_ptr = (ptr);  \
                                            ^~~

vim +80 arch/riscv/kernel/signal.c

  > 22	#include <linux/signal.h>
    23	#include <linux/uaccess.h>
    24	#include <linux/syscalls.h>
    25	#include <linux/tracehook.h>
    26	#include <linux/linkage.h>
    27	
    28	#include <asm/ucontext.h>
    29	#include <asm/vdso.h>
    30	#include <asm/switch_to.h>
    31	#include <asm/csr.h>
    32	
    33	#define DEBUG_SIG 0
    34	
    35	struct rt_sigframe {
    36		struct siginfo info;
    37		struct ucontext uc;
    38	};
    39	
    40	static long restore_fp_state(struct pt_regs *regs,
    41		union __riscv_fp_state *sc_fpregs)
    42	{
    43		long err;
    44		struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
    45		size_t i;
    46	
    47		err = __copy_from_user(&current->thread.fstate, state, sizeof(*state));
    48		if (unlikely(err))
    49			return err;
    50	
    51		fstate_restore(current, regs);
    52	
    53		/* We support no other extension state at this time. */
    54		for (i = 0; i < ARRAY_SIZE(sc_fpregs->q.reserved); i++) {
    55			u32 value;
    56	
    57			err = __get_user(value, &sc_fpregs->q.reserved[i]);
    58			if (unlikely(err))
    59				break;
    60			if (value != 0)
    61				return -EINVAL;
    62		}
    63	
    64		return err;
    65	}
    66	
    67	static long save_fp_state(struct pt_regs *regs,
    68		union __riscv_fp_state *sc_fpregs)
    69	{
    70		long err;
    71		struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
    72		size_t i;
    73	
    74		fstate_save(current, regs);
    75		err = __copy_to_user(state, &current->thread.fstate, sizeof(*state));
    76		if (unlikely(err))
    77			return err;
    78	
    79		/* We support no other extension state at this time. */
  > 80		for (i = 0; i < ARRAY_SIZE(sc_fpregs.q.reserved); i++) {
    81			err = __put_user(0, &sc_fpregs.q.reserved[i]);
    82			if (unlikely(err))
    83				break;
    84		}
    85	
    86		return err;
    87	}
    88	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 16318 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180803/3deefe91/attachment.gz>
