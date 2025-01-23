Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B170C02182
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 17:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzIeQZx2mvQ7TkZBwPdl/1CSzOCq7azzPFFKWgGHTVk=; b=a886t3VaB1MrCU
	QinjTVOplUq1ZWvSkvDBKNCL56S5kiM1LnDVKIkznkhrvQMOh+ASuCt/sC9r8CjCtVfJXFdl2hxJj
	oHXCe9jvmvMxfe4BDObL7eMjk9nH2jMEmee3o6GOrTTC+esy7hj3DpnZNeVDqCa1mI+CEcc6+KJyB
	2mTzGmxNRvLhSOteSzxF5oiAVPtYBRI0Q/5OG6Q1gWU2HcqL2deDg++UjlgfLcBeqt+3mytY0nOn9
	DTO2DvbZcC2fXCNnNhD1emA50FEbY6rLAtDN7scQ0ju3ZTTEqwQ+gOv8JrFWfiLMeR+GGFnYqiX8x
	+D3iJFChRRxYnV5PZ1CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb0oh-0000000CuVs-177C;
	Thu, 23 Jan 2025 17:16:31 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb0lA-0000000CtoK-1nvF
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 17:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737652373; x=1769188373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=72EgORSnANnV38wbPsZBehRg9IUMQUAma7ZLXPqx6k4=;
  b=Sw62OaGPgj43N3kHLSv1uQjnSqbg/BpJCl0E/4UJpCRxPkcSVyRNUOf5
   st9ixmD72mFecPHoJRn2I0c+PtwGxEHl+ZBA9QdjwBqUR+SejMkGb+nQq
   KmJhxawBQ4ddcw19MRGegwevqJLxgy+SxpPOufayEnvMw4+lBcnT5qx3n
   5cU0sRWlwL5+FeObHORXKdM34swxAlaBph1vrFqVWU67uqPcKs6wyjMlb
   OqP1BMLWVNgaHLdwYu239d6w7KZMKvdWLx36ZfnkuqWnnoMwCWw3nYCiv
   FqDkr8adey83RVhMloIowCWFbeiuIYbKqSx/aNPBBncbWMFBARZwsTn4E
   g==;
X-CSE-ConnectionGUID: rzmIuO65Q1iYklsZy4RIeA==
X-CSE-MsgGUID: rw/1ICnbSO63qXcATJlKzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38053850"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="38053850"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 09:12:50 -0800
X-CSE-ConnectionGUID: 6vxV2VRDR8mPAsL5dwom+Q==
X-CSE-MsgGUID: tBoXpY+EQ2Kj/C0jM/xkzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144764755"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Jan 2025 09:12:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb0l0-000bQs-1A;
	Thu, 23 Jan 2025 17:12:42 +0000
Date: Fri, 24 Jan 2025 01:12:23 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH 4/4] entry: Inline syscall_exit_to_user_mode()
Message-ID: <202501240036.hxoscXJM-lkp@intel.com>
References: <20250122-riscv_optimize_entry-v1-4-4ee95559cfd0@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250122-riscv_optimize_entry-v1-4-4ee95559cfd0@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_091252_523355_278CFE10 
X-CRM114-Status: GOOD (  12.57  )
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

Hi Charlie,

kernel test robot noticed the following build errors:

[auto build test ERROR on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/riscv-entry-Convert-ret_from_fork-to-C/20250123-065957
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250122-riscv_optimize_entry-v1-4-4ee95559cfd0%40rivosinc.com
patch subject: [PATCH 4/4] entry: Inline syscall_exit_to_user_mode()
config: x86_64-randconfig-071-20250123 (https://download.01.org/0day-ci/archive/20250124/202501240036.hxoscXJM-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240036.hxoscXJM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240036.hxoscXJM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/ptrace.c:40:
   In file included from arch/x86/include/asm/traps.h:9:
   In file included from arch/x86/include/asm/idtentry.h:11:
>> include/linux/entry-common.h:397:27: error: use of undeclared identifier 'CONTEXT_KERNEL'
     397 |         CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
         |                                  ^
   1 error generated.


vim +/CONTEXT_KERNEL +397 include/linux/entry-common.h

   378	
   379	/**
   380	 * syscall_exit_to_user_mode_work - Handle work before returning to user mode
   381	 * @regs:	Pointer to currents pt_regs
   382	 *
   383	 * Same as step 1 and 2 of syscall_exit_to_user_mode() but without calling
   384	 * exit_to_user_mode() to perform the final transition to user mode.
   385	 *
   386	 * Calling convention is the same as for syscall_exit_to_user_mode() and it
   387	 * returns with all work handled and interrupts disabled. The caller must
   388	 * invoke exit_to_user_mode() before actually switching to user mode to
   389	 * make the final state transitions. Interrupts must stay disabled between
   390	 * return from this function and the invocation of exit_to_user_mode().
   391	 */
   392	static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
   393	{
   394		unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
   395		unsigned long nr = syscall_get_nr(current, regs);
   396	
 > 397		CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
   398	
   399		if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
   400			if (WARN(irqs_disabled(), "syscall %lu left IRQs disabled", nr))
   401				local_irq_enable();
   402		}
   403	
   404		rseq_syscall(regs);
   405	
   406		/*
   407		 * Do one-time syscall specific work. If these work items are
   408		 * enabled, we want to run them exactly once per syscall exit with
   409		 * interrupts enabled.
   410		 */
   411		if (unlikely(work & SYSCALL_WORK_EXIT))
   412			syscall_exit_work(regs, work);
   413		local_irq_disable_exit_to_user();
   414		exit_to_user_mode_prepare(regs);
   415	}
   416	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
