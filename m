Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02546EE4993
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 18:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRhYPatZoJApqU1MC3EnnGGHGIeQeMTycj1e9uJPJYU=; b=A0HDpaNFmddXoR
	GRFYDb4dlwE5GchIffR7+tuLnvdPbPBQVaeLPpG6KrzcGmshd62dTPQV/ycBG62tg50g00Ea3nE7r
	jzNaXVjULP1OnVkuQ62QE+TqfvJsJ0kG8j5tP3XVSCcBKiMmCVzhsnYBUC3sbnIr5awOqSM/LQZ5A
	A9XeoJtDBrkuRFmcswDNcB9QaIUKgF8T2BVG2n9kTtqcvoi72qJge0DiKHLN12v07Y3Rasv3N+q8b
	L9+NTP4ewKWORx/Zs7ZJ4VP+AFxwi4KDRbX990i4uSAyyfQwogYyIwxmhdcIOcDjfoZFqUJW+0AAz
	RTi4N+40yRyea3ljKl3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYVmN-00GcqY-1N;
	Tue, 22 Aug 2023 18:06:59 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYVmK-00Gcpy-37
	for linux-riscv@lists.infradead.org;
	Tue, 22 Aug 2023 18:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692727616; x=1724263616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cwGhR5AwafMsuOw+p9j0rPog41N/qRISE816aZR6K+Q=;
  b=edxg1lfGPikF1Oa+gvzWfNbr8Da2XUZUbuTfPp49oi1QV7JjzCiyp63+
   MA6WaL7aomF7ghnIAcB21BKJtZ6QxVk1Oal933FjMLUlJsfm+pb2XEjuC
   5RJsuUnAAdYqN9nNbXZMHaCh568ON8Xk8SDiFN6EdMJh8SY8U/sSmc+oP
   yqikjs7yhdm2M/qLh8EGR9Y3JLPwSuw+b8fXurBueyf6B8UnWptyaNFqs
   DhSZgt0IH82p7NhX2Xyw1bjUBF5yJYz8mIGKElfMMch5gGUxKZZZ/z/sM
   11joQrMqQDBZmAeQck1hWTP4w13+OZ4+8IF+0hl4b2ebWDIS91XiLn+UC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354291551"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="354291551"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 11:06:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="801773724"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="801773724"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 22 Aug 2023 11:06:48 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYVmB-0000PM-0w;
	Tue, 22 Aug 2023 18:06:47 +0000
Date: Wed, 23 Aug 2023 02:06:01 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Hu <nick.hu@sifive.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com,
	conor.dooley@microchip.com, jeeheng.sia@starfivetech.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	zong.li@sifive.com
Cc: oe-kbuild-all@lists.linux.dev, Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH v2] riscv: suspend: Add syscore ops for suspend
Message-ID: <202308230107.1L1ahyas-lkp@intel.com>
References: <20230822054739.33552-1-nick.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230822054739.33552-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_110657_015786_B9762663 
X-CRM114-Status: GOOD (  10.68  )
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

Hi Nick,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5-rc7 next-20230822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Hu/riscv-suspend-Add-syscore-ops-for-suspend/20230822-135024
base:   linus/master
patch link:    https://lore.kernel.org/r/20230822054739.33552-1-nick.hu%40sifive.com
patch subject: [PATCH v2] riscv: suspend: Add syscore ops for suspend
config: riscv-randconfig-r121-20230822 (https://download.01.org/0day-ci/archive/20230823/202308230107.1L1ahyas-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230107.1L1ahyas-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230107.1L1ahyas-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/suspend.c: In function 'riscv_cpu_resume':
>> arch/riscv/kernel/suspend.c:114:25: warning: unused variable 'regs' [-Wunused-variable]
     114 |         struct pt_regs *regs = task_pt_regs(cur_task);
         |                         ^~~~


vim +/regs +114 arch/riscv/kernel/suspend.c

   110	
   111	static void riscv_cpu_resume(void)
   112	{
   113		struct task_struct *cur_task = get_current();
 > 114		struct pt_regs *regs = task_pt_regs(cur_task);
   115	
   116		if (has_fpu())
   117			fstate_restore(cur_task, regs);
   118		if (has_vector())
   119			riscv_v_vstate_restore(cur_task, regs);
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
