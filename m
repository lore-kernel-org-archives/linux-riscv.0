From: lkp@intel.com (kbuild test robot)
Date: Sun, 29 Jul 2018 05:16:21 +0800
Subject: [PATCH 9/9] clocksource: new RISC-V SBI timer driver
In-Reply-To: <20180726143723.16585-10-hch@lst.de>
References: <20180726143723.16585-10-hch@lst.de>
Message-ID: <201807290553.B0ofZ6cm%fengguang.wu@intel.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Palmer,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v4.18-rc6 next-20180727]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Christoph-Hellwig/RISC-V-remove-timer-leftovers/20180729-021511
config: powerpc64-allmodconfig (attached as .config)
compiler: powerpc64-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.2.0 make.cross ARCH=powerpc64 

All errors (new ones prefixed by >>):

>> drivers/clocksource/riscv_timer.c:11:10: fatal error: asm/sbi.h: No such file or directory
    #include <asm/sbi.h>
             ^~~~~~~~~~~
   compilation terminated.

vim +11 drivers/clocksource/riscv_timer.c

  > 11	#include <asm/sbi.h>
    12	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 57495 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180729/5378254a/attachment.gz>
