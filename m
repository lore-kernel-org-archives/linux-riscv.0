From: lkp@intel.com (kbuild test robot)
Date: Fri, 19 Oct 2018 17:55:54 +0800
Subject: [PATCH 2/2] tty: serial: add driver for the SiFive UART
In-Reply-To: <20181018234352.26788-3-paul.walmsley@sifive.com>
References: <20181018234352.26788-3-paul.walmsley@sifive.com>
Message-ID: <201810191752.QgAYljOJ%fengguang.wu@intel.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Paul,

I love your patch! Yet something to improve:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on v4.19-rc8 next-20181019]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Paul-Walmsley/dt-bindings-serial-add-documentation-for-the-SiFive-UART-driver/20181019-165529
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
config: i386-allmodconfig (attached as .config)
compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All errors (new ones prefixed by >>):

>> drivers/tty/serial/sifive.c:891:20: error: 'sifive_serial_poll_put_char' undeclared here (not in a function); did you mean 'sifive_serial_clk_notifier'?
     .poll_put_char  = sifive_serial_poll_put_char,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
                       sifive_serial_clk_notifier
>> drivers/tty/serial/sifive.c:892:20: error: 'sifive_serial_poll_get_char' undeclared here (not in a function); did you mean 'sifive_serial_poll_put_char'?
     .poll_get_char  = sifive_serial_poll_get_char,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
                       sifive_serial_poll_put_char
   In file included from drivers/tty/serial/sifive.c:47:0:
   drivers/tty/serial/sifive.c:1028:25: error: 'sifive_serial_match' undeclared here (not in a function); did you mean 'sifive_serial_of_match'?
    MODULE_DEVICE_TABLE(of, sifive_serial_match);
                            ^
   include/linux/module.h:213:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
    extern typeof(name) __mod_##type##__##name##_device_table  \
                  ^~~~
   include/linux/module.h:213:21: error: '__mod_of__sifive_serial_match_device_table' aliased to undefined symbol 'sifive_serial_match'
    extern typeof(name) __mod_##type##__##name##_device_table  \
                        ^
   drivers/tty/serial/sifive.c:1028:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
    MODULE_DEVICE_TABLE(of, sifive_serial_match);
    ^~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/sifive.c:522:13: warning: '__ssp_wait_for_xmitr' defined but not used [-Wunused-function]
    static void __ssp_wait_for_xmitr(struct sifive_serial_port *ssp)
                ^~~~~~~~~~~~~~~~~~~~

vim +891 drivers/tty/serial/sifive.c

   873	
   874	static const struct uart_ops sifive_serial_uops = {
   875		.tx_empty	= sifive_serial_tx_empty,
   876		.set_mctrl	= sifive_serial_set_mctrl,
   877		.get_mctrl	= sifive_serial_get_mctrl,
   878		.stop_tx	= sifive_serial_stop_tx,
   879		.start_tx	= sifive_serial_start_tx,
   880		.stop_rx	= sifive_serial_stop_rx,
   881		.break_ctl	= sifive_serial_break_ctl,
   882		.startup	= sifive_serial_startup,
   883		.shutdown	= sifive_serial_shutdown,
   884		.set_termios	= sifive_serial_set_termios,
   885		.type		= sifive_serial_type,
   886		.release_port	= sifive_serial_release_port,
   887		.request_port	= sifive_serial_request_port,
   888		.config_port	= sifive_serial_config_port,
   889		.verify_port	= sifive_serial_verify_port,
   890	#ifdef CONFIG_CONSOLE_POLL
 > 891		.poll_put_char  = sifive_serial_poll_put_char,
 > 892		.poll_get_char  = sifive_serial_poll_get_char,
   893	#endif
   894	};
   895	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 65228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20181019/a9951260/attachment.gz>
