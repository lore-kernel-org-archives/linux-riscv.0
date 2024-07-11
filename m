Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9919DC3271E
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 03:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZKNoHrGbhjQSYwx7zKXI/KP4Flrv5PSCZrZXbKksBQ=; b=tmXw2B1POLLknk
	HuFpTxAi07iP0K5WWLciO6uHLZm9kvYrcoc/++sIkHZgMYvR7J9aY9OtCUtCvgkMrpLgqFNAhs85x
	Z7SwN4QvBckEFZKldU38PhoM4WbYjsowhz/9FHwkpf0CxQ+u27cu2aKu7QICdg5BQruL8R28BlwXJ
	BEwJYvrRg3xSlwt2ewb/ua5rIEEoya5qOEOwa5ER648bi4zYsD5aupY7bO4KD2Pt8mP3O3wp5OIsw
	ffNB/4EFOcp3/Suq4HibIv4GAAaIiI51wr16VnuuE51FKzkZU+TyzJoDAbZ5cSieh1JbPSj2tDaPQ
	LN2px5tPKoNnlY6/5oNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRkxb-0000000Ccyv-1nep;
	Thu, 11 Jul 2024 03:59:11 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRkxX-0000000CcyF-22u1
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 03:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720670347; x=1752206347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2hTfSLerBEhuvk5r/a+JgnS4n9dpEaBnFa1d1Xb3oi4=;
  b=Hq9w+bPYRoREvXv4arm/WtEFmCaYaNnD9r4rb0unAL4es22yH2q713OF
   fb5x48ireSd0rM5pPsNyJLiiWBqm0slBt0/fUXmSBeJlW/1VCmHvyczAL
   K2GngKcnzdb8gFsfsYWzzY8D8a0x2ffnkeD0tJqU4Shtj6Y8EPNvlLUpv
   zHBvh27KDzwbXWLYYDoV/c84ym+AKZ8ynhmI+/pMFKWpCoTs1AzRgSfze
   spJT3zKYYqL96Kx3Wp43EYkVYaqegpa1vucd8aPuIImVYOpuggXxvh+/R
   wA7DtK8iOmtbCDetS7p/6ru27wObcE7iIdkYEhtSk/PnK+zVRMfW7vLTn
   g==;
X-CSE-ConnectionGUID: 5Jrz/H4jQHCdQSt0SNyZQg==
X-CSE-MsgGUID: XsvrwIYWTv6zoID6Y9y1uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18168821"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="18168821"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 20:59:05 -0700
X-CSE-ConnectionGUID: ALcnlCyMQ7uK0Tk2qQQtpw==
X-CSE-MsgGUID: 5del/KQDQQ+K0/aVdZeUkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="52730050"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jul 2024 20:59:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRkxP-000Yiy-31;
	Thu, 11 Jul 2024 03:58:59 +0000
Date: Thu, 11 Jul 2024 11:58:24 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ved Shanbhogue <ved@rivosinc.com>, Matt Evans <mev@rivosinc.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v3 4/4] riscv: Stop emitting preventive sfence.vma for
 new userspace mappings with Svvptc
Message-ID: <202407111151.m5cK0E6R-lkp@intel.com>
References: <20240702085034.48395-5-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240702085034.48395-5-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_205907_569270_1ACA298F 
X-CRM114-Status: GOOD (  13.80  )
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

Hi Alexandre,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.10-rc7]
[cannot apply to next-20240710]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Add-ISA-extension-parsing-for-Svvptc/20240702-171920
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240702085034.48395-5-alexghiti%40rivosinc.com
patch subject: [PATCH v3 4/4] riscv: Stop emitting preventive sfence.vma for new userspace mappings with Svvptc
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240711/202407111151.m5cK0E6R-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111151.m5cK0E6R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111151.m5cK0E6R-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/test_bitops.c:10:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/riscv/include/asm/uaccess.h:12:
>> arch/riscv/include/asm/pgtable.h:498:1: error: label at end of compound statement is a C23 extension [-Werror,-Wc23-extensions]
     498 | }
         | ^
   1 error generated.


vim +498 arch/riscv/include/asm/pgtable.h

07037db5d479f9 Palmer Dabbelt          2017-07-10  469  
07037db5d479f9 Palmer Dabbelt          2017-07-10  470  #define pgd_ERROR(e) \
07037db5d479f9 Palmer Dabbelt          2017-07-10  471  	pr_err("%s:%d: bad pgd " PTE_FMT ".\n", __FILE__, __LINE__, pgd_val(e))
07037db5d479f9 Palmer Dabbelt          2017-07-10  472  
07037db5d479f9 Palmer Dabbelt          2017-07-10  473  
07037db5d479f9 Palmer Dabbelt          2017-07-10  474  /* Commit new configuration to MMU hardware */
864609c6a0b5f0 Matthew Wilcox (Oracle  2023-08-02  475) static inline void update_mmu_cache_range(struct vm_fault *vmf,
864609c6a0b5f0 Matthew Wilcox (Oracle  2023-08-02  476) 		struct vm_area_struct *vma, unsigned long address,
864609c6a0b5f0 Matthew Wilcox (Oracle  2023-08-02  477) 		pte_t *ptep, unsigned int nr)
07037db5d479f9 Palmer Dabbelt          2017-07-10  478  {
b5bdff9ee1fdca Alexandre Ghiti         2024-07-02  479  	asm goto(ALTERNATIVE("nop", "j %l[svvptc]", 0, RISCV_ISA_EXT_SVVPTC, 1)
b5bdff9ee1fdca Alexandre Ghiti         2024-07-02  480  		 : : : : svvptc);
b5bdff9ee1fdca Alexandre Ghiti         2024-07-02  481  
07037db5d479f9 Palmer Dabbelt          2017-07-10  482  	/*
07037db5d479f9 Palmer Dabbelt          2017-07-10  483  	 * The kernel assumes that TLBs don't cache invalid entries, but
07037db5d479f9 Palmer Dabbelt          2017-07-10  484  	 * in RISC-V, SFENCE.VMA specifies an ordering constraint, not a
07037db5d479f9 Palmer Dabbelt          2017-07-10  485  	 * cache flush; it is necessary even after writing invalid entries.
07037db5d479f9 Palmer Dabbelt          2017-07-10  486  	 * Relying on flush_tlb_fix_spurious_fault would suffice, but
07037db5d479f9 Palmer Dabbelt          2017-07-10  487  	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
07037db5d479f9 Palmer Dabbelt          2017-07-10  488  	 */
864609c6a0b5f0 Matthew Wilcox (Oracle  2023-08-02  489) 	while (nr--)
864609c6a0b5f0 Matthew Wilcox (Oracle  2023-08-02  490) 		local_flush_tlb_page(address + nr * PAGE_SIZE);
b5bdff9ee1fdca Alexandre Ghiti         2024-07-02  491  
b5bdff9ee1fdca Alexandre Ghiti         2024-07-02  492  svvptc:
b5bdff9ee1fdca Alexandre Ghiti         2024-07-02  493  	/*
b5bdff9ee1fdca Alexandre Ghiti         2024-07-02  494  	 * Svvptc guarantees that the new valid pte will be visible within
b5bdff9ee1fdca Alexandre Ghiti         2024-07-02  495  	 * a bounded timeframe, so when the uarch does not cache invalid
b5bdff9ee1fdca Alexandre Ghiti         2024-07-02  496  	 * entries, we don't have to do anything.
b5bdff9ee1fdca Alexandre Ghiti         2024-07-02  497  	 */
07037db5d479f9 Palmer Dabbelt          2017-07-10 @498  }
864609c6a0b5f0 Matthew Wilcox (Oracle  2023-08-02  499) #define update_mmu_cache(vma, addr, ptep) \
864609c6a0b5f0 Matthew Wilcox (Oracle  2023-08-02  500) 	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
07037db5d479f9 Palmer Dabbelt          2017-07-10  501  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
