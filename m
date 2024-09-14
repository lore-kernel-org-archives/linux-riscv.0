Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA1BEE0202
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Sep 2024 03:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7TK2WAI4ON1/eUlpy/4UxHIUJ+lQ5HhZYC44SCrJF2E=; b=thbtNqZbvHQ02G
	nHnBT6c+aoSGaq35pVh1GcyIra+JR6+fTo8VSMs9LvTGJuLk6caR/7aSzlk/LpJl53karNJtaui3b
	fPByc56Wi1jjF1Q7zw8Dxt07FmKSvWRupYAWFfRCtlvZr9UgnvCjqL56KPneQX03dKiEXChZ5WZO2
	V6QKxGOP+GmoC9k3X7+zCwkJ516k0ChJ15+95F6rAP6NUIIlJ/O80WuDYPEplwDkmJ4/YDblxoGrI
	IHQlnuIhDFwGTP21KZqFP+BEUjmhGfzxE/J92+LgyptLgt8w/QNHe7+Mvw7UNh8VmMJgJg1Cv50Sy
	zp9YHSGdmyJgYz1sKoqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spJQt-0000000HaQW-2y9S;
	Sat, 14 Sep 2024 03:26:47 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spJQq-0000000HaQ9-2lLt
	for linux-riscv@lists.infradead.org;
	Sat, 14 Sep 2024 03:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726284404; x=1757820404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=omgqvgzzouQEUhPUfMey5nnTnVKYeEVzaU01hZPxRW0=;
  b=frI+/C/AHpjnEFMGmznTEwGIfY1dQ7q4F3TV4T7xBBqhL8EPJv+NVHgy
   v2TMIIin4yjxofF4NalOTDGdbqZZ2mIWF6z9hymvkuqiEJkVNDj16G09x
   jOUaL+J9bbkcaTidnRuxXn0hMNm3WEKUAZHJvIBBsSZOUcxxcWla1tYGx
   xTJ6lYs4N/KwC4DVAbvfifJqy+81d6G115802eiORVpnY4WZN9RI7NVX5
   J7VzYHZW5HMv8qGjHa9fKAlanQUM4lHoYNbnfgHbwextX5rmG47bRbtGU
   jev7Ts7Y/JshGhTIL9iIgLAJ2t8XeBJQtL5038x5XyDgUwHi5MTPMALvs
   w==;
X-CSE-ConnectionGUID: DbUkuyTyRG6Oc0UdwaShYg==
X-CSE-MsgGUID: h249z3t1SRehe+znLgi6Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="24681066"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="24681066"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 20:26:43 -0700
X-CSE-ConnectionGUID: izKp/OBXQm66DzDaFEJEaQ==
X-CSE-MsgGUID: sqg/QmHsTlGKouqptM4I1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="91566204"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Sep 2024 20:26:37 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spJQh-0007Je-0z;
	Sat, 14 Sep 2024 03:26:35 +0000
Date: Sat, 14 Sep 2024 11:26:33 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>, paul.walmsley@sifive.com,
	palmer@sifive.com, conor@kernel.org, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh@kernel.org, krzk+dt@kernel.org,
	oleg@redhat.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	kees@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz
Subject: Re: [PATCH v4 16/30] riscv/shstk: If needed allocate a new shadow
 stack on clone
Message-ID: <202409141139.mn5fTYCl-lkp@intel.com>
References: <20240912231650.3740732-17-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240912231650.3740732-17-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_202644_786359_2507335B 
X-CRM114-Status: GOOD (  13.82  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Deepak,

kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/next]
[also build test ERROR on shuah-kselftest/fixes tip/x86/core robh/for-next arnd-asm-generic/master tip/smp/core kees/for-next/execve linus/master v6.11-rc7]
[cannot apply to akpm-mm/mm-everything next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/mm-Introduce-ARCH_HAS_USER_SHADOW_STACK/20240913-072124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20240912231650.3740732-17-debug%40rivosinc.com
patch subject: [PATCH v4 16/30] riscv/shstk: If needed allocate a new shadow stack on clone
config: riscv-randconfig-r071-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141139.mn5fTYCl-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141139.mn5fTYCl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141139.mn5fTYCl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/processor.h:17,
                    from arch/riscv/include/asm/thread_info.h:37,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/riscv/kernel/asm-offsets.c:10:
>> arch/riscv/include/asm/usercfi.h:44:15: warning: no previous prototype for 'get_shstk_base' [-Wmissing-prototypes]
      44 | unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
         |               ^~~~~~~~~~~~~~
--
   In file included from arch/riscv/include/asm/processor.h:17,
                    from include/linux/sched.h:13,
                    from kernel/ptrace.c:13:
>> arch/riscv/include/asm/usercfi.h:44:15: warning: no previous prototype for 'get_shstk_base' [-Wmissing-prototypes]
      44 | unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
         |               ^~~~~~~~~~~~~~
   In file included from include/linux/string.h:374,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from arch/riscv/include/asm/processor.h:79:
   In function 'fortify_memcpy_chk',
       inlined from 'syscall_get_arguments.isra' at arch/riscv/include/asm/syscall.h:66:2:
   include/linux/fortify-string.h:580:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     580 |                         __read_overflow2_field(q_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/riscv/include/asm/processor.h:17,
                    from include/linux/mutex.h:19,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from lib/vsprintf.c:22:
>> arch/riscv/include/asm/usercfi.h:44:15: warning: no previous prototype for 'get_shstk_base' [-Wmissing-prototypes]
      44 | unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
         |               ^~~~~~~~~~~~~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1683:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1683 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
--
   In file included from arch/riscv/include/asm/processor.h:17,
                    from include/linux/sched.h:13,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from lib/string_helpers.c:13:
>> arch/riscv/include/asm/usercfi.h:44:15: warning: no previous prototype for 'get_shstk_base' [-Wmissing-prototypes]
      44 | unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
         |               ^~~~~~~~~~~~~~
   lib/string_helpers.c: In function 'string_get_size':
   lib/string_helpers.c:124:46: warning: '%03u' directive output may be truncated writing between 3 and 10 bytes into a region of size 7 [-Wformat-truncation=]
     124 |                 snprintf(tmp, sizeof(tmp), ".%03u", remainder);
         |                                              ^~~~
   lib/string_helpers.c:124:44: note: directive argument in the range [0, 4294966295]
     124 |                 snprintf(tmp, sizeof(tmp), ".%03u", remainder);
         |                                            ^~~~~~~
   lib/string_helpers.c:124:17: note: 'snprintf' output between 5 and 12 bytes into a destination of size 8
     124 |                 snprintf(tmp, sizeof(tmp), ".%03u", remainder);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/riscv/include/asm/processor.h:17,
                    from arch/riscv/include/asm/thread_info.h:37,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_bitops.c:10:
>> arch/riscv/include/asm/usercfi.h:44:15: error: no previous prototype for 'get_shstk_base' [-Werror=missing-prototypes]
      44 | unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
         |               ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from arch/riscv/include/asm/processor.h:17,
                    from include/linux/mutex.h:19,
                    from kernel/locking/lockdep.c:30:
>> arch/riscv/include/asm/usercfi.h:44:15: warning: no previous prototype for 'get_shstk_base' [-Wmissing-prototypes]
      44 | unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
         |               ^~~~~~~~~~~~~~
   In file included from kernel/locking/lockdep.c:62:
   kernel/locking/lockdep_internals.h:69:28: warning: 'LOCKF_USED_IN_IRQ_READ' defined but not used [-Wunused-const-variable=]
      69 | static const unsigned long LOCKF_USED_IN_IRQ_READ =
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep_internals.h:63:28: warning: 'LOCKF_ENABLED_IRQ_READ' defined but not used [-Wunused-const-variable=]
      63 | static const unsigned long LOCKF_ENABLED_IRQ_READ =
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep_internals.h:57:28: warning: 'LOCKF_USED_IN_IRQ' defined but not used [-Wunused-const-variable=]
      57 | static const unsigned long LOCKF_USED_IN_IRQ =
         |                            ^~~~~~~~~~~~~~~~~
   kernel/locking/lockdep_internals.h:51:28: warning: 'LOCKF_ENABLED_IRQ' defined but not used [-Wunused-const-variable=]
      51 | static const unsigned long LOCKF_ENABLED_IRQ =
         |                            ^~~~~~~~~~~~~~~~~
--
   In file included from arch/riscv/include/asm/processor.h:17,
                    from arch/riscv/include/asm/thread_info.h:37,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from net/sunrpc/clnt.c:22:
>> arch/riscv/include/asm/usercfi.h:44:15: warning: no previous prototype for 'get_shstk_base' [-Wmissing-prototypes]
      44 | unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
         |               ^~~~~~~~~~~~~~
   net/sunrpc/clnt.c: In function 'rpc_create':
   net/sunrpc/clnt.c:582:75: warning: '%s' directive output may be truncated writing up to 107 bytes into a region of size 48 [-Wformat-truncation=]
     582 |                                 snprintf(servername, sizeof(servername), "%s",
         |                                                                           ^~
   net/sunrpc/clnt.c:582:33: note: 'snprintf' output between 1 and 108 bytes into a destination of size 48
     582 |                                 snprintf(servername, sizeof(servername), "%s",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     583 |                                          sun->sun_path);
         |                                          ~~~~~~~~~~~~~~
--
   In file included from arch/riscv/include/asm/processor.h:17,
                    from arch/riscv/include/asm/thread_info.h:37,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/clk/clkdev.c:9:
>> arch/riscv/include/asm/usercfi.h:44:15: warning: no previous prototype for 'get_shstk_base' [-Wmissing-prototypes]
      44 | unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
         |               ^~~~~~~~~~~~~~
   drivers/clk/clkdev.c: In function 'vclkdev_alloc':
   drivers/clk/clkdev.c:185:17: warning: function 'vclkdev_alloc' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     185 |                 res = vsnprintf(cla->dev_id, sizeof(cla->dev_id), dev_fmt, ap);
         |                 ^~~
--
   riscv64-linux-ld: net/dns_resolver/dns_query.o: in function `get_shstk_base':
>> arch/riscv/include/asm/usercfi.h:45: multiple definition of `get_shstk_base'; net/dns_resolver/dns_key.o:arch/riscv/include/asm/usercfi.h:45: first defined here
--
   In file included from arch/riscv/include/asm/processor.h:17,
                    from include/linux/sched.h:13,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/miscdevice.h:7,
                    from drivers/misc/xilinx_sdfec.c:13:
>> arch/riscv/include/asm/usercfi.h:44:15: warning: no previous prototype for 'get_shstk_base' [-Wmissing-prototypes]
      44 | unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
         |               ^~~~~~~~~~~~~~
   drivers/misc/xilinx_sdfec.c: In function 'xsdfec_probe':
   drivers/misc/xilinx_sdfec.c:1404:57: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 6 [-Wformat-truncation=]
    1404 |         snprintf(xsdfec->dev_name, DEV_NAME_LEN, "xsdfec%d", xsdfec->dev_id);
         |                                                         ^~
   drivers/misc/xilinx_sdfec.c:1404:50: note: directive argument in the range [0, 2147483647]
    1404 |         snprintf(xsdfec->dev_name, DEV_NAME_LEN, "xsdfec%d", xsdfec->dev_id);
         |                                                  ^~~~~~~~~~
   drivers/misc/xilinx_sdfec.c:1404:9: note: 'snprintf' output between 8 and 17 bytes into a destination of size 12
    1404 |         snprintf(xsdfec->dev_name, DEV_NAME_LEN, "xsdfec%d", xsdfec->dev_id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/riscv/include/asm/processor.h:17,
                    from include/linux/sched.h:13,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/hrtimer.c:25:
>> arch/riscv/include/asm/usercfi.h:44:15: warning: no previous prototype for 'get_shstk_base' [-Wmissing-prototypes]
      44 | unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
         |               ^~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:35: warning: initialized field overwritten [-Woverride-init]
     121 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:122:35: warning: initialized field overwritten [-Woverride-init]
     122 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:123:35: warning: initialized field overwritten [-Woverride-init]
     123 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:124:35: warning: initialized field overwritten [-Woverride-init]
     124 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:124:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
..


vim +/get_shstk_base +44 arch/riscv/include/asm/usercfi.h

    43	
  > 44	unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
  > 45	{
    46		return 0;
    47	}
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
