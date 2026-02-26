Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAFDFD8FFA
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 19:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1N0bDXAY/MNxGSGuW9UrRgxh/1crXY3YdUj7VsokZeo=; b=09ud5ycC6aVcp6
	OyxqYT9hJwA/Jy/6/m2YQdhYGTGCXOXQDvSIBSj23Wny6ghFiqoSoa702+1R2U1OSllYE5O2F315q
	1GK/wmap14f6pu7aZxdVatAwYtGErlWLca87LAsvfKsvtdmK6oEoOzBqWLccs/0u+bIsCakkQdXpA
	tjDgmvyZl1JVKmAfHjmAO3Onn+JNziP5PTOZe5vU4vQWED89saaI+BhdZv7to0e3gPkstQsjZqTUz
	5Ur8/Syl5LApMQ20Y8QkCyoTu6amxKboij7ClJoj/iY7biVa/XEMEwmTUCu2dUl6yurNh2GSjBMXV
	QgoOdTA8cnqljyTfH1yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvgk0-000000071Uy-1rII;
	Thu, 26 Feb 2026 19:09:40 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvgjx-000000071US-3tOh
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 19:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772132978; x=1803668978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+Qh4hrPxf2csFk7l+Yv36sFqLv+jWtc8xUqmcxjBL90=;
  b=QgFH5kSCWKwZGdmBFo8py2AARIYJnMZNehAZvl8WMgJR8lUi861EfZT+
   h3X98X9yOp/bHGtRHa1dKTPuWMGwDwbrNdIo1a46Wd56gBhTBzjVhqt3p
   qpeMtd4GlMuJK8V6WrMhI2L5pNMtgVCRNPjzmfvqcxOe3nYJnyzqDEXIm
   CUVOuinaTZmb7Rzl9aNITRMsBIDOQiRL9nYJejVZulJLK1Z5TRpppu9IR
   YflBMugcMnNNvaxH0WnM14nWhvmAr3rvfpA+WkWcW/J9w7oFLpozX99V+
   EjfDYis66B5wP3NlNelPSlptrmr6FfR61nq27M2cyCEF079gXk3dkxfi7
   A==;
X-CSE-ConnectionGUID: R2Xo0/FDR/2SnbIuWwB35w==
X-CSE-MsgGUID: bvCfdpGJSpCcnLCpqaNu/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="75808681"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="75808681"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 11:09:37 -0800
X-CSE-ConnectionGUID: h1bTSjSBQJKUkTEZeLrEUQ==
X-CSE-MsgGUID: UcUjbMz5TL25U93Fajby4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="214596013"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Feb 2026 11:09:33 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvgjq-000000009n3-1ZOv;
	Thu, 26 Feb 2026 19:09:30 +0000
Date: Fri, 27 Feb 2026 03:09:28 +0800
From: kernel test robot <lkp@intel.com>
To: Rui Qi <qirui.001@bytedance.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	cyrilbur@tenstorrent.com, tglx@kernel.org, peterz@infradead.org,
	debug@rivosinc.com, andybnac@gmail.com, charlie@rivosinc.com,
	geomatsi@gmail.com, thuth@redhat.com, bjorn@rivosinc.com,
	songshuaishuai@tinylab.org, martin@kaiser.cx, masahiroy@kernel.org,
	kees@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rui Qi <qirui.001@bytedance.com>
Subject: Re: [PATCH] riscv: add system error interrupt handler support
Message-ID: <202602270355.h8QSG2vl-lkp@intel.com>
References: <20260226082735.56108-1-qirui.001@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260226082735.56108-1-qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_110937_977376_FBBE21F5 
X-CRM114-Status: GOOD (  14.55  )
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

Hi Rui,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on tip/smp/core v7.0-rc1 next-20260226]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rui-Qi/riscv-add-system-error-interrupt-handler-support/20260226-163131
base:   linus/master
patch link:    https://lore.kernel.org/r/20260226082735.56108-1-qirui.001%40bytedance.com
patch subject: [PATCH] riscv: add system error interrupt handler support
config: riscv-randconfig-r064-20260226 (https://download.01.org/0day-ci/archive/20260227/202602270355.h8QSG2vl-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270355.h8QSG2vl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270355.h8QSG2vl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/errata_list.h:8,
                    from arch/riscv/include/asm/vdso/processor.h:8,
                    from include/vdso/processor.h:10,
                    from arch/riscv/include/asm/processor.h:13,
                    from arch/riscv/include/asm/cmpxchg.h:16,
                    from arch/riscv/include/asm/barrier.h:14,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/kernel.h:23,
                    from arch/riscv/kernel/sys_error.c:7:
   arch/riscv/kernel/sys_error.c: In function 'riscv_serror_starting_cpu':
>> arch/riscv/kernel/sys_error.c:28:22: error: 'RV_IRQ_SYS_ERROR' undeclared (first use in this function); did you mean 'IRQ_SYS_ERROR'?
     csr_set(CSR_IE, BIT(RV_IRQ_SYS_ERROR));
                         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/csr.h:588:38: note: in definition of macro 'csr_set'
     unsigned long __v = (unsigned long)(val);  \
                                         ^~~
   arch/riscv/kernel/sys_error.c:28:18: note: in expansion of macro 'BIT'
     csr_set(CSR_IE, BIT(RV_IRQ_SYS_ERROR));
                     ^~~
   arch/riscv/kernel/sys_error.c:28:22: note: each undeclared identifier is reported only once for each function it appears in
     csr_set(CSR_IE, BIT(RV_IRQ_SYS_ERROR));
                         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/csr.h:588:38: note: in definition of macro 'csr_set'
     unsigned long __v = (unsigned long)(val);  \
                                         ^~~
   arch/riscv/kernel/sys_error.c:28:18: note: in expansion of macro 'BIT'
     csr_set(CSR_IE, BIT(RV_IRQ_SYS_ERROR));
                     ^~~
   arch/riscv/kernel/sys_error.c: In function 'riscv_serror_dying_cpu':
   arch/riscv/kernel/sys_error.c:35:24: error: 'RV_IRQ_SYS_ERROR' undeclared (first use in this function); did you mean 'IRQ_SYS_ERROR'?
     csr_clear(CSR_IE, BIT(RV_IRQ_SYS_ERROR));
                           ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/csr.h:605:38: note: in definition of macro 'csr_clear'
     unsigned long __v = (unsigned long)(val);  \
                                         ^~~
   arch/riscv/kernel/sys_error.c:35:20: note: in expansion of macro 'BIT'
     csr_clear(CSR_IE, BIT(RV_IRQ_SYS_ERROR));
                       ^~~
   arch/riscv/kernel/sys_error.c: In function 'sys_error_init':
   arch/riscv/kernel/sys_error.c:52:51: error: 'RV_IRQ_SYS_ERROR' undeclared (first use in this function); did you mean 'IRQ_SYS_ERROR'?
     riscv_sys_error_irq = irq_create_mapping(domain, RV_IRQ_SYS_ERROR);
                                                      ^~~~~~~~~~~~~~~~
                                                      IRQ_SYS_ERROR


vim +28 arch/riscv/kernel/sys_error.c

    25	
    26	static int riscv_serror_starting_cpu(unsigned int cpu)
    27	{
  > 28		csr_set(CSR_IE, BIT(RV_IRQ_SYS_ERROR));
    29		enable_percpu_irq(riscv_sys_error_irq, irq_get_trigger_type(riscv_sys_error_irq));
    30		return 0;
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
