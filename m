From: lkp@intel.com (kbuild test robot)
Date: Sun, 29 Jul 2018 05:12:09 +0800
Subject: [PATCH 9/9] clocksource: new RISC-V SBI timer driver
In-Reply-To: <20180726143723.16585-10-hch@lst.de>
References: <20180726143723.16585-10-hch@lst.de>
Message-ID: <201807290520.3PlEPkxa%fengguang.wu@intel.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Palmer,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v4.18-rc6 next-20180727]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Christoph-Hellwig/RISC-V-remove-timer-leftovers/20180729-021511
config: sparc-allyesconfig (attached as .config)
compiler: sparc64-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.2.0 make.cross ARCH=sparc 

All errors (new ones prefixed by >>):

   drivers/clocksource/riscv_timer.c: In function 'riscv_clock_next_event':
>> drivers/clocksource/riscv_timer.c:32:2: error: implicit declaration of function 'csr_set' [-Werror=implicit-function-declaration]
     csr_set(sie, SIE_STIE);
     ^~~~~~~
>> drivers/clocksource/riscv_timer.c:32:10: error: 'sie' undeclared (first use in this function)
     csr_set(sie, SIE_STIE);
             ^~~
   drivers/clocksource/riscv_timer.c:32:10: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/clocksource/riscv_timer.c:32:15: error: 'SIE_STIE' undeclared (first use in this function); did you mean 'S_CTIME'?
     csr_set(sie, SIE_STIE);
                  ^~~~~~~~
                  S_CTIME
>> drivers/clocksource/riscv_timer.c:33:2: error: implicit declaration of function 'sbi_set_timer'; did you mean 'do_setitimer'? [-Werror=implicit-function-declaration]
     sbi_set_timer(get_cycles64() + delta);
     ^~~~~~~~~~~~~
     do_setitimer
>> drivers/clocksource/riscv_timer.c:33:16: error: implicit declaration of function 'get_cycles64'; did you mean 'get_cycles'? [-Werror=implicit-function-declaration]
     sbi_set_timer(get_cycles64() + delta);
                   ^~~~~~~~~~~~
                   get_cycles
   drivers/clocksource/riscv_timer.c: In function 'timer_riscv_starting_cpu':
>> drivers/clocksource/riscv_timer.c:67:38: error: 'riscv_timebase' undeclared (first use in this function); did you mean 'init_timers'?
     clockevents_config_and_register(ce, riscv_timebase, MINDELTA, MAXDELTA);
                                         ^~~~~~~~~~~~~~
                                         init_timers
   drivers/clocksource/riscv_timer.c:68:10: error: 'sie' undeclared (first use in this function)
     csr_set(sie, SIE_STIE);
             ^~~
   drivers/clocksource/riscv_timer.c:68:15: error: 'SIE_STIE' undeclared (first use in this function); did you mean 'S_CTIME'?
     csr_set(sie, SIE_STIE);
                  ^~~~~~~~
                  S_CTIME
   drivers/clocksource/riscv_timer.c: In function 'timer_riscv_dying_cpu':
>> drivers/clocksource/riscv_timer.c:74:2: error: implicit declaration of function 'csr_clear'; did you mean 'cap_clear'? [-Werror=implicit-function-declaration]
     csr_clear(sie, SIE_STIE);
     ^~~~~~~~~
     cap_clear
>> drivers/clocksource/riscv_timer.c:74:12: error: 'sie' undeclared (first use in this function); did you mean 'ksize'?
     csr_clear(sie, SIE_STIE);
               ^~~
               ksize
   drivers/clocksource/riscv_timer.c:74:17: error: 'SIE_STIE' undeclared (first use in this function); did you mean 'S_CTIME'?
     csr_clear(sie, SIE_STIE);
                    ^~~~~~~~
                    S_CTIME
   drivers/clocksource/riscv_timer.c: In function 'riscv_timer_interrupt':
   drivers/clocksource/riscv_timer.c:83:12: error: 'sie' undeclared (first use in this function); did you mean 'ksize'?
     csr_clear(sie, SIE_STIE);
               ^~~
               ksize
   drivers/clocksource/riscv_timer.c:83:17: error: 'SIE_STIE' undeclared (first use in this function); did you mean 'S_CTIME'?
     csr_clear(sie, SIE_STIE);
                    ^~~~~~~~
                    S_CTIME
   drivers/clocksource/riscv_timer.c: In function 'timer_riscv_init_dt':
   drivers/clocksource/riscv_timer.c:110:30: error: 'riscv_timebase' undeclared (first use in this function); did you mean 'init_timers'?
     clocksource_register_hz(cs, riscv_timebase);
                                 ^~~~~~~~~~~~~~
                                 init_timers
   cc1: some warnings being treated as errors

vim +/csr_set +32 drivers/clocksource/riscv_timer.c

    28	
    29	static int riscv_clock_next_event(unsigned long delta,
    30			struct clock_event_device *ce)
    31	{
  > 32		csr_set(sie, SIE_STIE);
  > 33		sbi_set_timer(get_cycles64() + delta);
    34		return 0;
    35	}
    36	
    37	static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
    38		.name			= "riscv_timer_clockevent",
    39		.features		= CLOCK_EVT_FEAT_ONESHOT,
    40		.rating			= 100,
    41		.set_next_event		= riscv_clock_next_event,
    42	};
    43	
    44	/*
    45	 * It is guarnteed that all the timers across all the harts are synchronized
    46	 * within one tick of each other, so while this could technically go
    47	 * backwards when hopping between CPUs, practically it won't happen.
    48	 */
    49	static unsigned long long riscv_clocksource_rdtime(struct clocksource *cs)
    50	{
    51		return get_cycles64();
    52	}
    53	
    54	static DEFINE_PER_CPU(struct clocksource, riscv_clocksource) = {
    55		.name		= "riscv_clocksource",
    56		.rating		= 300,
    57		.mask		= CLOCKSOURCE_MASK(BITS_PER_LONG),
    58		.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
    59		.read		= riscv_clocksource_rdtime,
    60	};
    61	
    62	static int timer_riscv_starting_cpu(unsigned int cpu)
    63	{
    64		struct clock_event_device *ce = per_cpu_ptr(&riscv_clock_event, cpu);
    65	
    66		ce->cpumask = cpumask_of(cpu);
  > 67		clockevents_config_and_register(ce, riscv_timebase, MINDELTA, MAXDELTA);
  > 68		csr_set(sie, SIE_STIE);
    69		return 0;
    70	}
    71	
    72	static int timer_riscv_dying_cpu(unsigned int cpu)
    73	{
  > 74		csr_clear(sie, SIE_STIE);
    75		return 0;
    76	}
    77	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 54283 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180729/95f621ac/attachment.gz>
