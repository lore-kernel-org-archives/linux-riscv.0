From: zongbox@gmail.com (Zong Li)
Date: Thu, 15 Mar 2018 17:35:48 +0800
Subject: [PATCH 02/11] RISC-V: Add section of GOT.PLT for kernel module
In-Reply-To: <201803150146.vzdp4sme%fengguang.wu@intel.com>
References: <66eb534368782f411021e1a59f3292761d6576cd.1520928420.git.zong@andestech.com>
 <201803150146.vzdp4sme%fengguang.wu@intel.com>
Message-ID: <CA+ZOyajf3sLf_0q4GGqFGz5XHmtZjacC6T4eGdPLYSJ7wUZagg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

2018-03-15 1:34 GMT+08:00 kbuild test robot <lkp@intel.com>:
> Hi Zong,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v4.16-rc5 next-20180314]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Zong-Li/RISC-V-Resolve-the-issue-of-loadable-module-on-64-bit/20180314-203750
> config: riscv-defconfig (attached as .config)
> compiler: riscv64-linux-gcc (GCC) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=riscv
>
> All errors (new ones prefixed by >>):
>
>    In file included from include/linux/module.h:25:0,
>                     from fs/notify/fsnotify.c:23:
>    arch/riscv/include/asm/module.h:38:25: warning: 'struct mod_section' declared inside parameter list will not be visible outside of this definition or declaration
>                const struct mod_section *sec)
>                             ^~~~~~~~~~~
>    arch/riscv/include/asm/module.h: In function 'get_got_entry':
>    arch/riscv/include/asm/module.h:40:49: error: dereferencing pointer to incomplete type 'const struct mod_section'
>      struct got_entry *got = (struct got_entry *)sec->shdr->sh_addr;
>                                                     ^~
>    arch/riscv/include/asm/module.h: At top level:
>    arch/riscv/include/asm/module.h:89:57: warning: 'struct mod_section' declared inside parameter list will not be visible outside of this definition or declaration
>     static inline int get_got_plt_idx(u64 val, const struct mod_section *sec)
>                                                             ^~~~~~~~~~~
>    arch/riscv/include/asm/module.h: In function 'get_got_plt_idx':
>    arch/riscv/include/asm/module.h:91:53: error: dereferencing pointer to incomplete type 'const struct mod_section'
>      struct got_entry *got_plt = (struct got_entry *)sec->shdr->sh_addr;
>                                                         ^~
>    arch/riscv/include/asm/module.h: At top level:
>    arch/riscv/include/asm/module.h:101:24: warning: 'struct mod_section' declared inside parameter list will not be visible outside of this definition or declaration
>               const struct mod_section *sec_plt,
>                            ^~~~~~~~~~~
>    arch/riscv/include/asm/module.h: In function 'get_plt_entry':
>    arch/riscv/include/asm/module.h:104:53: error: dereferencing pointer to incomplete type 'const struct mod_section'
>      struct plt_entry *plt = (struct plt_entry *)sec_plt->shdr->sh_addr;
>                                                         ^~
>>> arch/riscv/include/asm/module.h:105:41: error: passing argument 2 of 'get_got_plt_idx' from incompatible pointer type [-Werror=incompatible-pointer-types]
>      int got_plt_idx = get_got_plt_idx(val, sec_got_plt);
>                                             ^~~~~~~~~~~
>    arch/riscv/include/asm/module.h:89:19: note: expected 'const struct mod_section *' but argument is of type 'const struct mod_section *'
>     static inline int get_got_plt_idx(u64 val, const struct mod_section *sec)
>                       ^~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
>
> vim +/get_got_plt_idx +105 arch/riscv/include/asm/module.h
>
>     99
>    100  static inline struct plt_entry *get_plt_entry(u64 val,
>  > 101                                        const struct mod_section *sec_plt,
>    102                                        const struct mod_section *sec_got_plt)
>    103  {
>    104          struct plt_entry *plt = (struct plt_entry *)sec_plt->shdr->sh_addr;
>  > 105          int got_plt_idx = get_got_plt_idx(val, sec_got_plt);
>    106          if (got_plt_idx >= 0)
>    107                  return plt + got_plt_idx;
>    108          else
>    109                  return NULL;
>    110  }
>    111
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

The config default is enable the MODULES, but also need to consider
the MODULES disable situation.
Modify the include/asm/module.h in PATCH v2

+u64 module_emit_got_entry(struct module *mod, u64 val);
+u64 module_emit_plt_entry(struct module *mod, u64 val);

 #ifdef CONFIG_MODULE_SECTIONS
 struct mod_section {
@@ -23,6 +21,10 @@ struct mod_arch_specific {
        struct mod_section plt;
        struct mod_section got_plt;
 };
-#endif

-u64 module_emit_got_entry(struct module *mod, u64 val);
-u64 module_emit_plt_entry(struct module *mod, u64 val);

 struct got_entry {
         u64 symbol_addr;        /* the real variable address */
@@ -108,6 +109,5 @@ static inline struct plt_entry *get_plt_entry(u64 val,
                 return NULL;
 }

+#endif /* CONFIG_MODULE_SECTIONS */

 #endif /* _ASM_RISCV_MODULE_H */
