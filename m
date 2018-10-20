From: lkp@intel.com (kbuild test robot)
Date: Sat, 20 Oct 2018 10:47:11 +0800
Subject: [PATCH v2 2/2] tty: serial: add driver for the SiFive UART
In-Reply-To: <20181019184827.12351-3-paul.walmsley@sifive.com>
References: <20181019184827.12351-3-paul.walmsley@sifive.com>
Message-ID: <201810201038.0mjWAilW%fengguang.wu@intel.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Paul,

I love your patch! Yet something to improve:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on v4.19-rc8 next-20181019]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Paul-Walmsley/tty-serial-add-DT-bindings-and-serial-driver-for-the-SiFive-FU540-UART/20181020-071123
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
config: mips-allmodconfig (attached as .config)
compiler: mips-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.2.0 make.cross ARCH=mips 

All errors (new ones prefixed by >>):

   In file included from drivers/tty/serial/sifive.c:47:0:
>> drivers/tty/serial/sifive.c:1025:25: error: 'sifive_serial_match' undeclared here (not in a function); did you mean 'sifive_serial_of_match'?
    MODULE_DEVICE_TABLE(of, sifive_serial_match);
                            ^
   include/linux/module.h:213:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
    extern typeof(name) __mod_##type##__##name##_device_table  \
                  ^~~~
>> include/linux/module.h:213:21: error: '__mod_of__sifive_serial_match_device_table' aliased to undefined symbol 'sifive_serial_match'
    extern typeof(name) __mod_##type##__##name##_device_table  \
                        ^
   drivers/tty/serial/sifive.c:1025:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
    MODULE_DEVICE_TABLE(of, sifive_serial_match);
    ^~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/tty//serial/sifive.c:47:0:
   drivers/tty//serial/sifive.c:1025:25: error: 'sifive_serial_match' undeclared here (not in a function); did you mean 'sifive_serial_of_match'?
    MODULE_DEVICE_TABLE(of, sifive_serial_match);
                            ^
   include/linux/module.h:213:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
    extern typeof(name) __mod_##type##__##name##_device_table  \
                  ^~~~
>> include/linux/module.h:213:21: error: '__mod_of__sifive_serial_match_device_table' aliased to undefined symbol 'sifive_serial_match'
    extern typeof(name) __mod_##type##__##name##_device_table  \
                        ^
   drivers/tty//serial/sifive.c:1025:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
    MODULE_DEVICE_TABLE(of, sifive_serial_match);
    ^~~~~~~~~~~~~~~~~~~

vim +1025 drivers/tty/serial/sifive.c

  1019	
  1020	static const struct of_device_id sifive_serial_of_match[] = {
  1021		{ .compatible = "sifive,fu540-c000-uart0" },
  1022		{ .compatible = "sifive,uart0" },
  1023		{},
  1024	};
> 1025	MODULE_DEVICE_TABLE(of, sifive_serial_match);
  1026	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 57462 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20181020/e8fb1852/attachment.gz>
