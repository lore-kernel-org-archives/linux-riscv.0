Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC85C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 00:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwMyTsNchobYZK0GiwkZ2ePy8OZgfwBfEJ66VHScHqo=; b=DyWjvvmsoobF+Y
	0CtoB/5lE7P6MQOXX1KsRn0EO7gJK21eFFTwrmyoSagiyJWGVPag2yrmLPfEyuyk+9+VGpJm2gkG6
	TfwgyTXj/vYbSOVmxuMzu4HcylWO8XtAxFIJ4i0kFYOvvWtgGCxjaq1yyPrFPR/7kYAFXNFNpT2+d
	GMiMyhAvxNiOG+y/+ogyqKGb68xAYqEEt0yLMfh7cfmSZf84x91WQRohl3dkPFYrDhDbfD67au2DI
	YcvaMVNgIQH7h9dekTMLF3istXgv1omUx0oIF6lfFtrr399DQadE9fWCwIR6wK9anaz+ef4b2YlW1
	n9XyjN7EBRVtAhU7pRew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCqww-00AOoW-08;
	Tue, 12 Dec 2023 00:48:38 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCqwp-00AOnu-0v
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 00:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702342111; x=1733878111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jQOI600A4meekimHAfIuWHVBDyEa00WuwZPad0eKMYw=;
  b=m+NjzUQf7xSZECzti+0y/XKF10b79k+hA8NyKZV5lFOqCQurvF34IAU0
   cRZVR0s8sR/RqydA1ifRbUNzfVmiEF68gNJA6Zn8vtpp3GiJ9ZQbKMa4a
   EVNS1peIhZRgd5ZIBfu6NeSFGUPmOSdUG9by9d7oJMdzWbFvDk6Yn7SzR
   mSV2t8Zw2y06tY3rmgwM4IdQMhXqxu4c0LlfRqddR0r+oUWgAeaxMucqE
   x+dweiKfcBzV7cYOU0wSIQMROMb9yB2g4oCqq/X+g09JTCr6ijy4PZpgH
   s7iYQdNXlu3OQM50zA49K5yCUuqWaaahr49HZGhEMQV1Nahb0nmeU3J1f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="379729784"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="379729784"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 16:48:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1104690469"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="1104690469"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 11 Dec 2023 16:48:25 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCqwh-000IcZ-2L;
	Tue, 12 Dec 2023 00:48:23 +0000
Date: Tue, 12 Dec 2023 08:48:16 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	syzbot+afb726d49f84c8d95ee1@syzkaller.appspotmail.com
Subject: Re: [PATCH -fixes] riscv: Fix wrong usage of lm_alias() when
 splitting a huge linear mapping
Message-ID: <202312120825.UkTJCa1g-lkp@intel.com>
References: <20231211141929.74027-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231211141929.74027-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_164831_392554_DD5DB1D9 
X-CRM114-Status: GOOD (  17.58  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc5 next-20231211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Fix-wrong-usage-of-lm_alias-when-splitting-a-huge-linear-mapping/20231211-222156
base:   linus/master
patch link:    https://lore.kernel.org/r/20231211141929.74027-1-alexghiti%40rivosinc.com
patch subject: [PATCH -fixes] riscv: Fix wrong usage of lm_alias() when splitting a huge linear mapping
config: riscv-alldefconfig (https://download.01.org/0day-ci/archive/20231212/202312120825.UkTJCa1g-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231212/202312120825.UkTJCa1g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312120825.UkTJCa1g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/mm/pageattr.c:311:14: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     311 |                 } else if (is_linear_mapping(start)) {
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:130:2: note: expanded from macro 'is_linear_mapping'
     130 |         ((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < PAGE_OFFSET + KERN_VIRT_SIZE))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/mm/pageattr.c:348:9: note: uninitialized use occurs here
     348 |         return ret;
         |                ^~~
   arch/riscv/mm/pageattr.c:311:10: note: remove the 'if' if its condition is always true
     311 |                 } else if (is_linear_mapping(start)) {
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     312 |                         lm_start = start;
     313 |                         lm_end = end;
     314 |                 } else {
         |                  ~~~~~~~
     315 |                         goto unlock;
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     316 |                 }
         | ~~~~~~~~~~~~~~~~~
>> arch/riscv/mm/pageattr.c:311:14: warning: variable 'ret' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     311 |                 } else if (is_linear_mapping(start)) {
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:130:3: note: expanded from macro 'is_linear_mapping'
     130 |         ((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < PAGE_OFFSET + KERN_VIRT_SIZE))
         |          ^~~~~~~~~~~~~~~~~~
   arch/riscv/mm/pageattr.c:348:9: note: uninitialized use occurs here
     348 |         return ret;
         |                ^~~
   arch/riscv/mm/pageattr.c:311:14: note: remove the '&&' if its condition is always true
     311 |                 } else if (is_linear_mapping(start)) {
         |                            ^
   arch/riscv/include/asm/page.h:130:3: note: expanded from macro 'is_linear_mapping'
     130 |         ((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < PAGE_OFFSET + KERN_VIRT_SIZE))
         |          ^
   arch/riscv/mm/pageattr.c:265:9: note: initialize the variable 'ret' to silence this warning
     265 |         int ret;
         |                ^
         |                 = 0
   2 warnings generated.


vim +311 arch/riscv/mm/pageattr.c

   261	
   262	static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
   263				pgprot_t clear_mask)
   264	{
   265		int ret;
   266		unsigned long start = addr;
   267		unsigned long end = start + PAGE_SIZE * numpages;
   268		unsigned long __maybe_unused lm_start;
   269		unsigned long __maybe_unused lm_end;
   270		struct pageattr_masks masks = {
   271			.set_mask = set_mask,
   272			.clear_mask = clear_mask
   273		};
   274	
   275		if (!numpages)
   276			return 0;
   277	
   278		mmap_write_lock(&init_mm);
   279	
   280	#ifdef CONFIG_64BIT
   281		/*
   282		 * We are about to change the permissions of a kernel mapping, we must
   283		 * apply the same changes to its linear mapping alias, which may imply
   284		 * splitting a huge mapping.
   285		 */
   286	
   287		if (is_vmalloc_or_module_addr((void *)start)) {
   288			struct vm_struct *area = NULL;
   289			int i, page_start;
   290	
   291			area = find_vm_area((void *)start);
   292			page_start = (start - (unsigned long)area->addr) >> PAGE_SHIFT;
   293	
   294			for (i = page_start; i < page_start + numpages; ++i) {
   295				lm_start = (unsigned long)page_address(area->pages[i]);
   296				lm_end = lm_start + PAGE_SIZE;
   297	
   298				ret = split_linear_mapping(lm_start, lm_end);
   299				if (ret)
   300					goto unlock;
   301	
   302				ret = walk_page_range_novma(&init_mm, lm_start, lm_end,
   303							    &pageattr_ops, NULL, &masks);
   304				if (ret)
   305					goto unlock;
   306			}
   307		} else {
   308			if (is_kernel_mapping(start)) {
   309				lm_start = (unsigned long)lm_alias(start);
   310				lm_end = (unsigned long)lm_alias(end);
 > 311			} else if (is_linear_mapping(start)) {
   312				lm_start = start;
   313				lm_end = end;
   314			} else {
   315				goto unlock;
   316			}
   317	
   318			ret = split_linear_mapping(lm_start, lm_end);
   319			if (ret)
   320				goto unlock;
   321	
   322			ret = walk_page_range_novma(&init_mm, lm_start, lm_end,
   323						    &pageattr_ops, NULL, &masks);
   324			if (ret)
   325				goto unlock;
   326		}
   327	
   328		ret =  walk_page_range_novma(&init_mm, start, end, &pageattr_ops, NULL,
   329					     &masks);
   330	
   331	unlock:
   332		mmap_write_unlock(&init_mm);
   333	
   334		/*
   335		 * We can't use flush_tlb_kernel_range() here as we may have split a
   336		 * hugepage that is larger than that, so let's flush everything.
   337		 */
   338		flush_tlb_all();
   339	#else
   340		ret =  walk_page_range_novma(&init_mm, start, end, &pageattr_ops, NULL,
   341					     &masks);
   342	
   343		mmap_write_unlock(&init_mm);
   344	
   345		flush_tlb_kernel_range(start, end);
   346	#endif
   347	
   348		return ret;
   349	}
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
