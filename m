Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C430DD32D7E
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 09:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGzxr4YKdQOydvbodko4WiRxMAQO3+e6GQ2o7NvyyXI=; b=ihlFzXWLT4JUJA
	qgD9pjFx998KsL+VYF3+4MSiBiDfcLYSIbIgYh2Tks5ov3oMptZ0Y7OmLNO2IpqtSEhh2WW9DiPGA
	R4L6Z9q8djPSvE/6M6Gc5E4FxQSLEBTaxKVRThrcHEjt0FgZ6Dy+uW7t5xTPKUnVQbySSWwZnQak9
	5fxNm1ZIqq1AAq0MmI6IfXTRPutZjx4e12K6H9BKMH0srUV16Lr0DoTGL6sVIX4K5WoBEiBswE/c9
	2VWhVXvsEYB6hJrYX/ggG2sGy5qKSAPPkTxRdgVwr1S4ZYR4UfIVpKwl6zcVX3jw/3Xxmttok3ong
	SWAYdiAfk1UAqiLUA53Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnYQ-00000002wCx-0VKh;
	Tue, 12 Nov 2024 09:51:22 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnUW-00000002vTu-2cCB
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 09:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731404841; x=1762940841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RgQLgKteT7/0JHP5evKwF5/pwbWHfdTs6vICOeDbino=;
  b=AwkhUxjSHZZedRP5iZgTVTETHgHC3rxpZmAKB3JmrheOJxjCNAU1DwsH
   Gxukmwd4wl5nHayDFPHTzJk/9M6tDXYAgoUzpaDp9A3h/tDyl9W/OC+Rr
   5lp7YqHon3shAMHYgkljuCoA2QZbhe8cTX2TuTvhLKJnijPyL0XP9y8ra
   McAZ8ks29l7su+slAWOl8USjAN7QVgM4w7+3GZjyvzkMtT2FmoCz5da2v
   VvjzeZv08fKVOPorMiY53oBPoO+xB7EcerhwRbx34apsPVowlWm4QXAwh
   Bju7JlHmvHS8+uTRAIkpyPAZd0VW0ws2boD76kiYL1IivBE6OMutUr3Ua
   A==;
X-CSE-ConnectionGUID: ov2Vs7rTTtK3s7JTjKfzyA==
X-CSE-MsgGUID: ufgqeabmRaqA3hy+oo5zoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31383944"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31383944"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 01:47:19 -0800
X-CSE-ConnectionGUID: cjOcukJIT+iEm5UhVBFeeA==
X-CSE-MsgGUID: iQePexooTqeMVx3w9gipNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="92318207"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Nov 2024 01:47:12 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAnUL-0000gd-0p;
	Tue, 12 Nov 2024 09:47:09 +0000
Date: Tue, 12 Nov 2024 17:47:06 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v8 12/29] riscv/shstk: If needed allocate a new shadow
 stack on clone
Message-ID: <202411121717.INT1geTN-lkp@intel.com>
References: <20241111-v5_user_cfi_series-v8-12-dce14aa30207@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241111-v5_user_cfi_series-v8-12-dce14aa30207@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_014720_731804_E19C6ADC 
X-CRM114-Status: GOOD (  16.14  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 64f7b77f0bd9271861ed9e410e9856b6b0b21c48]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/mm-Introduce-ARCH_HAS_USER_SHADOW_STACK/20241112-050530
base:   64f7b77f0bd9271861ed9e410e9856b6b0b21c48
patch link:    https://lore.kernel.org/r/20241111-v5_user_cfi_series-v8-12-dce14aa30207%40rivosinc.com
patch subject: [PATCH v8 12/29] riscv/shstk: If needed allocate a new shadow stack on clone
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20241112/202411121717.INT1geTN-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411121717.INT1geTN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411121717.INT1geTN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/process.c:17:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/riscv/kernel/process.c:245:36: warning: expression result unused [-Wunused-value]
     245 |                 ssp ? set_active_shstk(p, ssp) : 0;
         |                                                  ^
   2 warnings generated.


vim +245 arch/riscv/kernel/process.c

   209	
   210	int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
   211	{
   212		unsigned long clone_flags = args->flags;
   213		unsigned long usp = args->stack;
   214		unsigned long tls = args->tls;
   215		unsigned long ssp = 0;
   216		struct pt_regs *childregs = task_pt_regs(p);
   217	
   218		/* Ensure all threads in this mm have the same pointer masking mode. */
   219		if (IS_ENABLED(CONFIG_RISCV_ISA_SUPM) && p->mm && (clone_flags & CLONE_VM))
   220			set_bit(MM_CONTEXT_LOCK_PMLEN, &p->mm->context.flags);
   221	
   222		memset(&p->thread.s, 0, sizeof(p->thread.s));
   223	
   224		/* p->thread holds context to be restored by __switch_to() */
   225		if (unlikely(args->fn)) {
   226			/* Kernel thread */
   227			memset(childregs, 0, sizeof(struct pt_regs));
   228			/* Supervisor/Machine, irqs on: */
   229			childregs->status = SR_PP | SR_PIE;
   230	
   231			p->thread.s[0] = (unsigned long)args->fn;
   232			p->thread.s[1] = (unsigned long)args->fn_arg;
   233		} else {
   234			/* allocate new shadow stack if needed. In case of CLONE_VM we have to */
   235			ssp = shstk_alloc_thread_stack(p, args);
   236			if (IS_ERR_VALUE(ssp))
   237				return PTR_ERR((void *)ssp);
   238	
   239			*childregs = *(current_pt_regs());
   240			/* Turn off status.VS */
   241			riscv_v_vstate_off(childregs);
   242			if (usp) /* User fork */
   243				childregs->sp = usp;
   244			/* if needed, set new ssp */
 > 245			ssp ? set_active_shstk(p, ssp) : 0;
   246			if (clone_flags & CLONE_SETTLS)
   247				childregs->tp = tls;
   248			childregs->a0 = 0; /* Return value of fork() */
   249			p->thread.s[0] = 0;
   250		}
   251		p->thread.riscv_v_flags = 0;
   252		if (has_vector())
   253			riscv_v_thread_alloc(p);
   254		p->thread.ra = (unsigned long)ret_from_fork;
   255		p->thread.sp = (unsigned long)childregs; /* kernel sp */
   256		return 0;
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
