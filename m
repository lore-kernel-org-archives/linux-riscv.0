Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789D8C0218B
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 17:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/MjlbqBsLM55EQzcn5oJPf/wvz8LYOtZTteQn0mCgA=; b=2pcOb2o7Wi7d3Q
	+rf7XQ/DzRbi6LLDU7QupPuE3CIs7FZuy08NGsMk+6bXzDwUy/lw0FS9p8KKLjR4WKh0O39kT3OJj
	pVP1uMeTlYiI30/zb8pyZHE0nQGP/q+2/f5WNPnHrRz1Y0o895E8SfFoGG6Nynh9kBiSvjrDt+xGL
	yvmoynC/X+xJEiRcr/dsommTUClhV3aHeDtbEPuYQTheA8Ht3tf55WQyYl5ZfZQzSzvIVfTzHF0hM
	chKvHngg5qv79bezXsiw3Oe9+l3Mj7HkR83vccmOj1GJ7/C9GdPwivKP8Vv5WOisLl93/lkrcM6e3
	oAGKQSCscqGsR2r+k4IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb16T-0000000CxMN-49mm;
	Thu, 23 Jan 2025 17:34:53 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb16S-0000000CxLY-12K5
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 17:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737653692; x=1769189692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vi0yvCwo30fwVsqjLO0cONScA/8TLk0SHxBzQlbNSOA=;
  b=NIVTlryw+8tzOvlKaGlPelDh6OlMObfPFCjzbkS917BeGkV5Z05Uj275
   wvme1THRLKZpojfrPdQlqsPVY25Ll+ZGGUWz1HqlvBXYbDBvtLq+7zQOm
   LIr9EE9gRODqg8cRXKl5c/MhK2a9XG9r4cvylAE95FWaGhWpj7TtF5ZlT
   a8tZuiVawlhMrUz/RjnZkL6toIkGE3ahWQJrdoHDgXL40Uq5wgGaqwIZn
   U+ymY36zqSBrcL1+f5kFt9drK41QIOzH0ldfPN4rBkO39CmE3GVpi8Xl3
   Z9by0bk4kNyj2JCtEAENkuzVmnQWDUOIF1BeSa4VUWbZ4IAQTWbkPic4s
   w==;
X-CSE-ConnectionGUID: f5+XfUw5RFSEV3CisHEojw==
X-CSE-MsgGUID: IdOVPbMmS0aYPkD1ve2/ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55715292"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="55715292"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 09:34:51 -0800
X-CSE-ConnectionGUID: fCU09iDaQ72rUo9Zyl9MFA==
X-CSE-MsgGUID: t4CAraI5QsqUroLarf1qXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108403010"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Jan 2025 09:34:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb16L-000bRf-1R;
	Thu, 23 Jan 2025 17:34:45 +0000
Date: Fri, 24 Jan 2025 01:34:04 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH 4/4] entry: Inline syscall_exit_to_user_mode()
Message-ID: <202501240101.mSdGpEoH-lkp@intel.com>
References: <20250122-riscv_optimize_entry-v1-4-4ee95559cfd0@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250122-riscv_optimize_entry-v1-4-4ee95559cfd0@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_093452_327707_15906735 
X-CRM114-Status: GOOD (  16.26  )
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
config: x86_64-randconfig-072-20250123 (https://download.01.org/0day-ci/archive/20250124/202501240101.mSdGpEoH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240101.mSdGpEoH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240101.mSdGpEoH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from arch/x86/mm/fault.c:7:
   include/linux/entry-common.h: In function 'syscall_exit_to_user_mode_work':
>> include/linux/entry-common.h:397:34: error: 'CONTEXT_KERNEL' undeclared (first use in this function); did you mean 'PERF_CONTEXT_KERNEL'?
     397 |         CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
         |                                  ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/entry-common.h:397:9: note: in expansion of macro 'CT_WARN_ON'
     397 |         CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
         |         ^~~~~~~~~~
   include/linux/entry-common.h:397:34: note: each undeclared identifier is reported only once for each function it appears in
     397 |         CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
         |                                  ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/entry-common.h:397:9: note: in expansion of macro 'CT_WARN_ON'
     397 |         CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
         |         ^~~~~~~~~~


vim +397 include/linux/entry-common.h

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
