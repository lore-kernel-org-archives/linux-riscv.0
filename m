Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED59E94139
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 23:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HopUPpe8Wey4unoljKJ8IUZBD/FUmx0unotfifnY5nA=; b=zTEMd/GNOyqArp
	9fsyk0PK9DqjPEgEMoGtjhQJ/sxPa3yZoxAeHg3UjR0RYI7fBoELEiNWuGThh8qGYaJFJNXAmfMm6
	ZgTCqjk/+hC00HQ2/WK3s+w8/Mnd5h+/7iIKzKUQ4KxSmFloyadZzFosbRXXI6lWDkyBDOdV7SeMy
	UawYDE/9cUMa5IhN0IhjB2MVsqJV+9vlo6uWbu3l/sHa+J++TdeZ3CpsYNeXl9SP1HLAktbZVZg3Q
	CuaN4haS6Pf3hqqWk35dEXxbECGRhY0WUzkNsBCxqdwVBBPDgjaUzvnc4toeOLkbFr5go9ECG5ngL
	ofwxPFDeE1cow6dn5NTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qouSI-006f3E-1A;
	Fri, 06 Oct 2023 23:42:02 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qouSF-006f2o-1L
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 23:42:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696635719; x=1728171719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nElLuMBGoWtnmj1DMPKjn0OV1ZCOk5EPpvoFTql0yfI=;
  b=dG73Agd75iAGZH3U3fArq5F9gJF7QZPBKI9o+XJ5mOfJ716HSO7Q3sKX
   OO7mdoYmewnOXR3soXggF6W/rQdagxZA6075BGSpMnIKFK0sgv+Drx/a7
   YoeAleNcrjzRcniI/DUJ6tt5ktI4/IU2nQKyVD/MQntJlEJhNVP+tlPvj
   0e13Ir2/qwCPJr9zsGyAxKWAGtykjH4R42OTai8lhV0Ny5QJh+vETHm2t
   9QZxks2GaLWgr4s9RKhs4+Gvp4uie3u6tEOhOfuL8vMnm9chxGrz98SpQ
   5sW2JVZ+N8dAMcEVq8LQ+NaBCttEu6Y5UaPKVkjqdyz7B7Ihp29SsNvqk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="374191562"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="374191562"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 16:41:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="818170702"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="818170702"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Oct 2023 16:41:36 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qouRq-0003kD-0G;
	Fri, 06 Oct 2023 23:41:34 +0000
Date: Sat, 7 Oct 2023 07:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Mike Rapoport <rppt@kernel.org>,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH 2/2] riscv: Fix set_memory_XX() and set_direct_map_XX()
 by splitting huge linear mappings
Message-ID: <202310070700.4hSXftFh-lkp@intel.com>
References: <20231006092930.15850-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231006092930.15850-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_164159_530430_7391613F 
X-CRM114-Status: GOOD (  16.60  )
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
[also build test WARNING on v6.6-rc4 next-20231006]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Don-t-use-PGD-entries-for-the-linear-mapping/20231006-173223
base:   linus/master
patch link:    https://lore.kernel.org/r/20231006092930.15850-3-alexghiti%40rivosinc.com
patch subject: [PATCH 2/2] riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear mappings
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20231007/202310070700.4hSXftFh-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231007/202310070700.4hSXftFh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310070700.4hSXftFh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/mm/pageattr.c: In function '__split_linear_mapping_pmd':
   arch/riscv/mm/pageattr.c:112:45: error: implicit declaration of function '_pmd_pfn'; did you mean 'pmd_pfn'? [-Werror=implicit-function-declaration]
     112 |                         unsigned long pfn = _pmd_pfn(*pmdp);
         |                                             ^~~~~~~~
         |                                             pmd_pfn
   arch/riscv/mm/pageattr.c:127:39: error: implicit declaration of function 'pfn_pmd'; did you mean 'pfn_pgd'? [-Werror=implicit-function-declaration]
     127 |                         set_pmd(pmdp, pfn_pmd(page_to_pfn(pte_page), PAGE_TABLE));
         |                                       ^~~~~~~
         |                                       pfn_pgd
   arch/riscv/mm/pageattr.c:127:39: error: incompatible type for argument 2 of 'set_pmd'
     127 |                         set_pmd(pmdp, pfn_pmd(page_to_pfn(pte_page), PAGE_TABLE));
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                       |
         |                                       int
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from include/linux/pagewalk.h:5,
                    from arch/riscv/mm/pageattr.c:6:
   arch/riscv/include/asm/pgtable.h:249:47: note: expected 'pmd_t' but argument is of type 'int'
     249 | static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
         |                                         ~~~~~~^~~
   arch/riscv/mm/pageattr.c: In function '__split_linear_mapping_pud':
   arch/riscv/mm/pageattr.c:152:45: error: implicit declaration of function '_pud_pfn'; did you mean 'pud_pfn'? [-Werror=implicit-function-declaration]
     152 |                         unsigned long pfn = _pud_pfn(*pudp);
         |                                             ^~~~~~~~
         |                                             pud_pfn
   arch/riscv/mm/pageattr.c:164:41: error: incompatible type for argument 2 of 'set_pmd'
     164 |                                         pfn_pmd(pfn + ((i * PMD_SIZE) >> PAGE_SHIFT), prot));
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         int
   arch/riscv/include/asm/pgtable.h:249:47: note: expected 'pmd_t' but argument is of type 'int'
     249 | static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
         |                                         ~~~~~~^~~
   In file included from arch/riscv/include/asm/pgtable-32.h:9,
                    from arch/riscv/include/asm/pgtable.h:141:
   arch/riscv/mm/pageattr.c:168:39: error: implicit declaration of function 'pfn_pud'; did you mean 'pfn_pgd'? [-Werror=implicit-function-declaration]
     168 |                         set_pud(pudp, pfn_pud(page_to_pfn(pmd_page), PAGE_TABLE));
         |                                       ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:44:86: note: in definition of macro 'set_pud'
      44 | #define set_pud(pudptr, pudval)                 set_pmd((pmd_t *)(pudptr), (pmd_t) { pudval })
         |                                                                                      ^~~~~~
>> include/asm-generic/pgtable-nopmd.h:44:76: warning: missing braces around initializer [-Wmissing-braces]
      44 | #define set_pud(pudptr, pudval)                 set_pmd((pmd_t *)(pudptr), (pmd_t) { pudval })
         |                                                                            ^
   arch/riscv/mm/pageattr.c:168:25: note: in expansion of macro 'set_pud'
     168 |                         set_pud(pudp, pfn_pud(page_to_pfn(pmd_page), PAGE_TABLE));
         |                         ^~~~~~~
   arch/riscv/mm/pageattr.c: In function '__split_linear_mapping_p4d':
   arch/riscv/mm/pageattr.c:201:45: error: implicit declaration of function '_p4d_pfn'; did you mean '_pgd_pfn'? [-Werror=implicit-function-declaration]
     201 |                         unsigned long pfn = _p4d_pfn(*p4dp);
         |                                             ^~~~~~~~
         |                                             _pgd_pfn
>> include/asm-generic/pgtable-nopmd.h:44:76: warning: missing braces around initializer [-Wmissing-braces]
      44 | #define set_pud(pudptr, pudval)                 set_pmd((pmd_t *)(pudptr), (pmd_t) { pudval })
         |                                                                            ^
   arch/riscv/mm/pageattr.c:216:33: note: in expansion of macro 'set_pud'
     216 |                                 set_pud(pudp_new,
         |                                 ^~~~~~~
   arch/riscv/mm/pageattr.c:226:39: error: implicit declaration of function 'pfn_p4d'; did you mean 'pfn_pgd'? [-Werror=implicit-function-declaration]
     226 |                         set_p4d(p4dp, pfn_p4d(page_to_pfn(pud_page), PAGE_TABLE));
         |                                       ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:44:86: note: in definition of macro 'set_pud'
      44 | #define set_pud(pudptr, pudval)                 set_pmd((pmd_t *)(pudptr), (pmd_t) { pudval })
         |                                                                                      ^~~~~~
   arch/riscv/mm/pageattr.c:226:25: note: in expansion of macro 'set_p4d'
     226 |                         set_p4d(p4dp, pfn_p4d(page_to_pfn(pud_page), PAGE_TABLE));
         |                         ^~~~~~~
>> include/asm-generic/pgtable-nopud.h:40:60: warning: missing braces around initializer [-Wmissing-braces]
      40 | #define set_p4d(p4dptr, p4dval) set_pud((pud_t *)(p4dptr), (pud_t) { p4dval })
         |                                                            ^
   include/asm-generic/pgtable-nopmd.h:44:86: note: in definition of macro 'set_pud'
      44 | #define set_pud(pudptr, pudval)                 set_pmd((pmd_t *)(pudptr), (pmd_t) { pudval })
         |                                                                                      ^~~~~~
   arch/riscv/mm/pageattr.c:226:25: note: in expansion of macro 'set_p4d'
     226 |                         set_p4d(p4dp, pfn_p4d(page_to_pfn(pud_page), PAGE_TABLE));
         |                         ^~~~~~~
>> include/asm-generic/pgtable-nopmd.h:44:76: warning: missing braces around initializer [-Wmissing-braces]
      44 | #define set_pud(pudptr, pudval)                 set_pmd((pmd_t *)(pudptr), (pmd_t) { pudval })
         |                                                                            ^
   include/asm-generic/pgtable-nopud.h:40:33: note: in expansion of macro 'set_pud'
      40 | #define set_p4d(p4dptr, p4dval) set_pud((pud_t *)(p4dptr), (pud_t) { p4dval })
         |                                 ^~~~~~~
   arch/riscv/mm/pageattr.c:226:25: note: in expansion of macro 'set_p4d'
     226 |                         set_p4d(p4dp, pfn_p4d(page_to_pfn(pud_page), PAGE_TABLE));
         |                         ^~~~~~~
   cc1: some warnings being treated as errors


vim +44 include/asm-generic/pgtable-nopmd.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  39  
^1da177e4c3f41 Linus Torvalds 2005-04-16  40  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16  41   * (pmds are folded into puds so this doesn't get actually called,
^1da177e4c3f41 Linus Torvalds 2005-04-16  42   * but the define is needed for a generic inline function.)
^1da177e4c3f41 Linus Torvalds 2005-04-16  43   */
^1da177e4c3f41 Linus Torvalds 2005-04-16 @44  #define set_pud(pudptr, pudval)			set_pmd((pmd_t *)(pudptr), (pmd_t) { pudval })
^1da177e4c3f41 Linus Torvalds 2005-04-16  45  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
