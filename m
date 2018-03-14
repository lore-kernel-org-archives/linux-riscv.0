From: lkp@intel.com (kbuild test robot)
Date: Thu, 15 Mar 2018 01:20:01 +0800
Subject: [PATCH 01/11] RISC-V: Add sections of PLT and GOT for kernel
 module
In-Reply-To: <135c18787ccbe7a87e99d408e49e0df0b510d573.1520928420.git.zong@andestech.com>
References: <135c18787ccbe7a87e99d408e49e0df0b510d573.1520928420.git.zong@andestech.com>
Message-ID: <201803150111.G017fhXz%fengguang.wu@intel.com>
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

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/module.h:25:0,
                    from fs/notify/fsnotify.c:23:
>> arch/riscv/include/asm/module.h:37:25: warning: 'struct mod_section' declared inside parameter list will not be visible outside of this definition or declaration
               const struct mod_section *sec)
                            ^~~~~~~~~~~
   arch/riscv/include/asm/module.h: In function 'get_got_entry':
>> arch/riscv/include/asm/module.h:39:49: error: dereferencing pointer to incomplete type 'const struct mod_section'
     struct got_entry *got = (struct got_entry *)sec->shdr->sh_addr;
                                                    ^~
   arch/riscv/include/asm/module.h: At top level:
   arch/riscv/include/asm/module.h:91:25: warning: 'struct mod_section' declared inside parameter list will not be visible outside of this definition or declaration
               const struct mod_section *sec)
                            ^~~~~~~~~~~
   arch/riscv/include/asm/module.h: In function 'get_plt_entry':
   arch/riscv/include/asm/module.h:93:49: error: dereferencing pointer to incomplete type 'const struct mod_section'
     struct plt_entry *plt = (struct plt_entry *)sec->shdr->sh_addr;
                                                    ^~

vim +39 arch/riscv/include/asm/module.h

    35	
    36	static inline struct got_entry *get_got_entry(u64 val,
  > 37						      const struct mod_section *sec)
    38	{
  > 39		struct got_entry *got = (struct got_entry *)sec->shdr->sh_addr;
    40		int i;
    41		for (i = 0; i < sec->num_entries; i++) {
    42			if (got[i].symbol_addr == val)
    43				return &got[i];
    44		}
    45		return NULL;
    46	}
    47	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 16430 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180315/76182765/attachment.gz>
