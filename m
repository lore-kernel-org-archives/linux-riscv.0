From: lkp@intel.com (kbuild test robot)
Date: Thu, 15 Mar 2018 01:34:14 +0800
Subject: [PATCH 02/11] RISC-V: Add section of GOT.PLT for kernel module
In-Reply-To: <66eb534368782f411021e1a59f3292761d6576cd.1520928420.git.zong@andestech.com>
References: <66eb534368782f411021e1a59f3292761d6576cd.1520928420.git.zong@andestech.com>
Message-ID: <201803150146.vzdp4sme%fengguang.wu@intel.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Zong,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v4.16-rc5 next-20180314]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Zong-Li/RISC-V-Resolve-the-issue-of-loadable-module-on-64-bit/20180314-203750
config: riscv-defconfig (attached as .config)
compiler: riscv64-linux-gcc (GCC) 7.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=riscv 

All errors (new ones prefixed by >>):

   In file included from include/linux/module.h:25:0,
                    from fs/notify/fsnotify.c:23:
   arch/riscv/include/asm/module.h:38:25: warning: 'struct mod_section' declared inside parameter list will not be visible outside of this definition or declaration
               const struct mod_section *sec)
                            ^~~~~~~~~~~
   arch/riscv/include/asm/module.h: In function 'get_got_entry':
   arch/riscv/include/asm/module.h:40:49: error: dereferencing pointer to incomplete type 'const struct mod_section'
     struct got_entry *got = (struct got_entry *)sec->shdr->sh_addr;
                                                    ^~
   arch/riscv/include/asm/module.h: At top level:
   arch/riscv/include/asm/module.h:89:57: warning: 'struct mod_section' declared inside parameter list will not be visible outside of this definition or declaration
    static inline int get_got_plt_idx(u64 val, const struct mod_section *sec)
                                                            ^~~~~~~~~~~
   arch/riscv/include/asm/module.h: In function 'get_got_plt_idx':
   arch/riscv/include/asm/module.h:91:53: error: dereferencing pointer to incomplete type 'const struct mod_section'
     struct got_entry *got_plt = (struct got_entry *)sec->shdr->sh_addr;
                                                        ^~
   arch/riscv/include/asm/module.h: At top level:
   arch/riscv/include/asm/module.h:101:24: warning: 'struct mod_section' declared inside parameter list will not be visible outside of this definition or declaration
              const struct mod_section *sec_plt,
                           ^~~~~~~~~~~
   arch/riscv/include/asm/module.h: In function 'get_plt_entry':
   arch/riscv/include/asm/module.h:104:53: error: dereferencing pointer to incomplete type 'const struct mod_section'
     struct plt_entry *plt = (struct plt_entry *)sec_plt->shdr->sh_addr;
                                                        ^~
>> arch/riscv/include/asm/module.h:105:41: error: passing argument 2 of 'get_got_plt_idx' from incompatible pointer type [-Werror=incompatible-pointer-types]
     int got_plt_idx = get_got_plt_idx(val, sec_got_plt);
                                            ^~~~~~~~~~~
   arch/riscv/include/asm/module.h:89:19: note: expected 'const struct mod_section *' but argument is of type 'const struct mod_section *'
    static inline int get_got_plt_idx(u64 val, const struct mod_section *sec)
                      ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/get_got_plt_idx +105 arch/riscv/include/asm/module.h

    99	
   100	static inline struct plt_entry *get_plt_entry(u64 val,
 > 101					      const struct mod_section *sec_plt,
   102					      const struct mod_section *sec_got_plt)
   103	{
   104		struct plt_entry *plt = (struct plt_entry *)sec_plt->shdr->sh_addr;
 > 105		int got_plt_idx = get_got_plt_idx(val, sec_got_plt);
   106		if (got_plt_idx >= 0)
   107			return plt + got_plt_idx;
   108		else
   109			return NULL;
   110	}
   111	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 16430 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180315/d9501cc0/attachment.gz>
