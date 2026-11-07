Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC57606A334
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 07:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MQJKFLFp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iKYsJ7SP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KnznnhxzVk0+4RWhDUI+08f3VGC9l9Uiste1rnxzdGA=; b=MQJKFLFpM8GhBnJA56Lzvl0wtS
	6s3nRDD0vOU19OrLKORNYQ9Lm6z25W+ipOztj+fR1KLbJxru43RaPb/dTX+eeah7CMhY/0LCWzLM0
	wYpbXx583UpwUHickgSzd1I3MTx56B8pGPvc3JMTXz18MMOt5KgxI4UGOCu/sv5vuXMyGBUxsT8r+
	tiQUlWafOIfzlDviBs/x4jb8V78XYNBrWpslYCYh85qpm+rieY5sWt8oSbk9Hdenv+1nWyolXpzq5
	XBZH9vxg/mNsdiXm2q3GCAsOjVFl+EuyJ4DwDymoxc7bf07WURr6sjKBeOwGkfeeY5QT/Yn+w1E9H
	BQtXAYjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPaUQ-0000000EIfO-2dab;
	Sat, 07 Nov 2026 07:05:26 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPaUN-0000000EIey-2aK9
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 07:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794035124; x=1825571124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MlHqtS8cT8ajIw/2dp1+/XcpibT8MY0x6er6vc3ClcU=;
  b=iKYsJ7SP6Hn4ud6os2ZCmYEudN7O/wTzu5fOEDVaubq7qT2dGF1ADb8r
   s0CN7UWLZJIsp8Gs+adrUkKgnFrHtT7zWw6FdThGDFoFuxQYJP10+7rTi
   OFxCtM+3jo/dU6TqQYDLY22JQJiL2pGS2IhDdEi67/1OfSqu2UIPrwAI6
   ICQd4qj+9LimlUcNbX8teOVh8ktwZ/6yo5/+FwnDYeu/YWSxwjm4odVJN
   /23cvFgwfxIw+AActBad6QKwMS/dN1k0FOAcFsHEQ7w1EEFS+LwQIgVpl
   egH+BUkeQ2Vu1zcA9AUZ7sz27WCohMFUAZwZyLHpSymJED69i2oNKZ97u
   w==;
X-CSE-ConnectionGUID: /54BX+i5RjuMmXxVMH4sZg==
X-CSE-MsgGUID: PHgAgtC3TmG/SjFwxBvYHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2734848"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2734848"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 23:05:22 -0800
X-CSE-ConnectionGUID: 9+2ftNMKQAqc50tJyR7fxg==
X-CSE-MsgGUID: pNt5NwnMSVqZrahXN4gQYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7444739"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2026 23:05:16 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPaUC-00000000qZf-2cVD;
	Sat, 07 Nov 2026 07:05:12 +0000
Date: Sat, 7 Nov 2026 15:04:50 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Alexandre Ghiti <alex@ghiti.fr>,
	Jesse Taube <jtaubepe@redhat.com>, Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/8] riscv: add ptrace requests for hardware
 breakpoints
Message-ID: <202611071408.gyIRvq10-lkp@intel.com>
References: <20261107023917.40606-4-himanshu.chauhan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261107023917.40606-4-himanshu.chauhan@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_230523_822062_4BDD72C9 
X-CRM114-Status: GOOD (  11.70  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Himanshu,

kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/next]
[also build test ERROR on shuah-kselftest/fixes perf-tools-next/perf-tools-next linus/master v7.4-rc1 next-20261105]
[cannot apply to kees/for-next/execve tip/perf/core perf-tools/perf-tools acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himanshu-Chauhan/riscv-Introduce-support-for-hardware-break-watchpoints/20261107-080910
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20261107023917.40606-4-himanshu.chauhan%40oss.qualcomm.com
patch subject: [PATCH v8 3/8] riscv: add ptrace requests for hardware breakpoints
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20261107/202611071408.gyIRvq10-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611071408.gyIRvq10-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611071408.gyIRvq10-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/exit.c:57:
>> include/linux/hw_breakpoint.h:137:20: error: redefinition of 'flush_ptrace_hw_breakpoint'
     137 | static inline void flush_ptrace_hw_breakpoint(struct task_struct *tsk)  { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/include/asm/processor.h:18,
                    from arch/riscv/include/asm/cmpxchg.h:16,
                    from arch/riscv/include/asm/barrier.h:14,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:107,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:8,
                    from kernel/exit.c:8:
   arch/riscv/include/asm/hw_breakpoint.h:58:20: note: previous definition of 'flush_ptrace_hw_breakpoint' with type 'void(struct task_struct *)'
      58 | static inline void flush_ptrace_hw_breakpoint(struct task_struct *task) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/flush_ptrace_hw_breakpoint +137 include/linux/hw_breakpoint.h

24f1e32c60c45c include/linux/hw_breakpoint.h       Frederic Weisbecker 2009-09-09  136  
24f1e32c60c45c include/linux/hw_breakpoint.h       Frederic Weisbecker 2009-09-09 @137  static inline void flush_ptrace_hw_breakpoint(struct task_struct *tsk)	{ }
b332828c39326b include/asm-generic/hw_breakpoint.h K.Prasad            2009-06-01  138  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
