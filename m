Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BFDC83F01
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 10:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSxU/5e5yujy5Fj6bXToGZUpZHbU0Ry7eNC3QxcVXYc=; b=sCsVQZO2ClxnGi
	wE45cz6L5dqbb7/zw64UiGxIG/yS1inxfyFIbxJyeYvVo8mNvWh/PQjMXzDVyrAiotArGlVwHlRGw
	UZdcZD2vn9/zmTDCtn/Z2nHQQQMQc3WbOhVdKHFCI4T9x9m5MejTTWzNJUSNdwOC4dgqOTmAle4y6
	2ibYY15BfyATtl4CrMfeVOnD0cPX875C+8N7483nQXII6ynwrNmdKS1wQZZ9w6rTNM6CcH3euzL7C
	5wtG2Dhm8IS6/uhexo4/mcpn9GkIJSEUQ0fNJwrnVRt5C1UlWLByCdIJROpZ1BAh48/K5Pun8xWxC
	a2PpjlsGHhrg5A3Du5Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaDIL-007xLP-0q;
	Sun, 27 Aug 2023 10:47:01 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaDII-007xKa-11
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 10:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693133218; x=1724669218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sDDzkQzb757ene7HMEX/SXvVxG8zNuK5WjwaRpDHGik=;
  b=aKQ1zVQcuj+9vDYqaBLgdsrsLh/oDO/rXaUWHH4SxRs92nSncx2mzDxm
   CvMcYdEenn24CXVkkeTmD6wxyW9Q70cB4xGijUKMsWir8m246sDN0xBdj
   hhFUYD0eW6QlWL9fdtqPh2tsnoHJ5r1vvlsaFiwswT3+GEIxL1S5x8UHf
   iot7eO7hf/MrP8PmLsZhFN2/mY2m5bNoc6Q6WJHqeNsfrV0LGa4gAA8/H
   Gz7RbCM7Yiod0vP6g2OVLPMOhQI1OPEcwsxH840wu/LwpWkmMoGb8nqim
   j/qy9MeWj6eQciU2rXBf5gONXd9Mi46/C0dR8rUjsPCjkOpW/uYDJf8Ny
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="359926534"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="359926534"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 03:46:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="731527841"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="731527841"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 27 Aug 2023 03:46:54 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaDI9-0005hL-2I;
	Sun, 27 Aug 2023 10:46:50 +0000
Date: Sun, 27 Aug 2023 18:46:48 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Nam Cao <namcaov@gmail.com>
Subject: Re: [PATCH] riscv: Only consider swbp/ss handlers for correct
 privileged mode
Message-ID: <202308271841.HlnnHFL7-lkp@intel.com>
References: <20230827083949.204927-1-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827083949.204927-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_034658_429467_C78552E3 
X-CRM114-Status: GOOD (  10.55  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Bj=F6rn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7d2f353b2682dcfe5f9bc71e5b61d5b61770d98e]

url:    https://github.com/intel-lab-lkp/linux/commits/Bj-rn-T-pel/riscv-On=
ly-consider-swbp-ss-handlers-for-correct-privileged-mode/20230827-164313
base:   7d2f353b2682dcfe5f9bc71e5b61d5b61770d98e
patch link:    https://lore.kernel.org/r/20230827083949.204927-1-bjorn%40ke=
rnel.org
patch subject: [PATCH] riscv: Only consider swbp/ss handlers for correct pr=
ivileged mode
config: riscv-randconfig-001-20230827 (https://download.01.org/0day-ci/arch=
ive/20230827/202308271841.HlnnHFL7-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a=
5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271841.H=
lnnHFL7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271841.HlnnHFL7-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:49:
   In file included from include/linux/kprobes.h:32:
>> arch/riscv/include/asm/kprobes.h:44:62: warning: omitting the parameter =
name in a function definition is a C2x extension [-Wc2x-extensions]
      44 | static inline bool kprobe_breakpoint_handler(struct pt_regs *)
         |                                                              ^
   arch/riscv/include/asm/kprobes.h:49:63: warning: omitting the parameter =
name in a function definition is a C2x extension [-Wc2x-extensions]
      49 | static inline bool kprobe_single_step_handler(struct pt_regs *)
         |                                                               ^
   kernel/sched/core.c:3695:20: warning: unused function 'rq_has_pinned_tas=
ks' [-Wunused-function]
    3695 | static inline bool rq_has_pinned_tasks(struct rq *rq)
         |                    ^
   kernel/sched/core.c:5821:20: warning: unused function 'sched_tick_start'=
 [-Wunused-function]
    5821 | static inline void sched_tick_start(int cpu) { }
         |                    ^
   kernel/sched/core.c:5822:20: warning: unused function 'sched_tick_stop' =
[-Wunused-function]
    5822 | static inline void sched_tick_stop(int cpu) { }
         |                    ^
   kernel/sched/core.c:6522:20: warning: unused function 'sched_core_cpu_st=
arting' [-Wunused-function]
    6522 | static inline void sched_core_cpu_starting(unsigned int cpu) {}
         |                    ^
   kernel/sched/core.c:6523:20: warning: unused function 'sched_core_cpu_de=
activate' [-Wunused-function]
    6523 | static inline void sched_core_cpu_deactivate(unsigned int cpu) {}
         |                    ^
   kernel/sched/core.c:6524:20: warning: unused function 'sched_core_cpu_dy=
ing' [-Wunused-function]
    6524 | static inline void sched_core_cpu_dying(unsigned int cpu) {}
         |                    ^
   8 warnings generated.


vim +44 arch/riscv/include/asm/kprobes.h

    38	=

    39	void arch_remove_kprobe(struct kprobe *p);
    40	int kprobe_fault_handler(struct pt_regs *regs, unsigned int trapnr);
    41	bool kprobe_breakpoint_handler(struct pt_regs *regs);
    42	bool kprobe_single_step_handler(struct pt_regs *regs);
    43	#else
  > 44	static inline bool kprobe_breakpoint_handler(struct pt_regs *)
    45	{
    46		return false;
    47	}
    48	=


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
