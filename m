Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A4CC49EA1
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Aug 2024 01:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CIXNIgMWHRkOVJ1KxjdQHDz0Tq0lNG547AkKGma0lPo=; b=kZEziqiubhjlVx
	HWhEPzLvuZXKf/hppDHDwilyQUK+uM5SP7v7VOmGg+aS6nD8t3LMLt67vPs1DSm887EqmluN6jvNW
	TtpfNeNfvv6NUI7QUNkFrkiHnZydQJRaPaGLLyWIdw9D12ARkAlNTaMfUwY+bxCAeSWUn+WX+4vbM
	wAuwXiEqMDkKjrTolyVG7Hp9hs/F+TsNlwILZ95OqZh2zwWlvPYGQwrltZfcsuqqKN9O4/BGU0uRE
	nGOmo591DzCDc1lHyK/gh3+PTrygsJpyHRAUwmG9SNkgnRSZa7Z58feUOBTHJopz7GKyt5U156klb
	LozqMbhs2Nhqm3lIzxmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saQR7-0000000CSsn-1r4q;
	Sun, 04 Aug 2024 01:53:29 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saQR3-0000000CSrM-3s5g
	for linux-riscv@lists.infradead.org;
	Sun, 04 Aug 2024 01:53:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722736406; x=1754272406;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hTtyj+2GN06nhbjwGVCPDIwDUGx6x7DaNGHBdYvzvBk=;
  b=DS185uXnpYlqWbJXHa0er+vxH/D1kojGplOJdv1WCbNbp3juLOt54Tz5
   4zqiCiD0vHWAMu2FLhF7Uq/k337VqCHD/XccZWiatvmST87yMUhxyy1Sn
   HvsJ095ZE+nQTzqKeD/EWkbDMiRUyCcy9L115QcTzUn6+BgYY6gaCVo7x
   ALuTuA922WdeEtL8KQyJY8gcyuk3n6+zmW/vz89+3taxomkqZOTsYgpGS
   0Hw2vt8eD1Z6rcvcBx6n2UpZeOcI5Smcq9aQaOpmjv9MAutGazYwL1vAj
   2qYIj+DI7387+j01eMEtoC292Zshvvk7wnmCUzkbni20c9cE6R7iImY09
   w==;
X-CSE-ConnectionGUID: LOM80qOpQHGG/roKWMbkeA==
X-CSE-MsgGUID: fXpzR48cTAOu8+/7E4HNPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="24514666"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="24514666"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 18:53:10 -0700
X-CSE-ConnectionGUID: Fdba3fbbRNe6RuSy69AN9g==
X-CSE-MsgGUID: GiM87j/KQjOA0AI4n3fL3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="59943608"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 03 Aug 2024 18:53:07 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saQQi-000142-2I;
	Sun, 04 Aug 2024 01:53:04 +0000
Date: Sun, 4 Aug 2024 09:52:15 +0800
From: kernel test robot <lkp@intel.com>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH V2 2/3] riscv: mm: Add soft-dirty page tracking support
Message-ID: <202408040937.f2DDJjCu-lkp@intel.com>
References: <20240731040444.3384790-3-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240731040444.3384790-3-zhangchunyan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240803_185326_033896_A2F08810 
X-CRM114-Status: GOOD (  11.87  )
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

Hi Chunyan,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chunyan-Zhang/riscv-mm-Prepare-for-reuse-PTE-RSW-bit-9/20240801-231628
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240731040444.3384790-3-zhangchunyan%40iscas.ac.cn
patch subject: [PATCH V2 2/3] riscv: mm: Add soft-dirty page tracking support
config: riscv-randconfig-r133-20240802 (https://download.01.org/0day-ci/archive/20240804/202408040937.f2DDJjCu-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce: (https://download.01.org/0day-ci/archive/20240804/202408040937.f2DDJjCu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408040937.f2DDJjCu-lkp@intel.com/

All errors (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from lib/vsprintf.c:36:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:752:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     752 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from lib/vsprintf.c:36:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:760:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     760 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from lib/vsprintf.c:36:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:769:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     769 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from lib/vsprintf.c:36:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:778:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from lib/vsprintf.c:36:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:787:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     787 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from lib/vsprintf.c:36:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1115:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1115 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from lib/vsprintf.c:50:
   In file included from lib/../mm/internal.h:13:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from lib/vsprintf.c:50:
>> lib/../mm/internal.h:1332:41: error: call to undeclared function 'pmd_soft_dirty'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1332 |         return vma_soft_dirty_enabled(vma) && !pmd_soft_dirty(pmd);
         |                                                ^
   lib/../mm/internal.h:1332:41: note: did you mean 'pmd_swp_soft_dirty'?
   include/linux/pgtable.h:1415:19: note: 'pmd_swp_soft_dirty' declared here
    1415 | static inline int pmd_swp_soft_dirty(pmd_t pmd)
         |                   ^
   In file included from lib/vsprintf.c:50:
>> lib/../mm/internal.h:1337:41: error: call to undeclared function 'pte_soft_dirty'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1337 |         return vma_soft_dirty_enabled(vma) && !pte_soft_dirty(pte);
         |                                                ^
   16 warnings and 2 errors generated.


vim +/pmd_soft_dirty +1332 lib/../mm/internal.h

76aefad628aae1 Peter Xu   2022-07-25  1329  
f38ee285191813 Barry Song 2024-06-08  1330  static inline bool pmd_needs_soft_dirty_wp(struct vm_area_struct *vma, pmd_t pmd)
f38ee285191813 Barry Song 2024-06-08  1331  {
f38ee285191813 Barry Song 2024-06-08 @1332  	return vma_soft_dirty_enabled(vma) && !pmd_soft_dirty(pmd);
f38ee285191813 Barry Song 2024-06-08  1333  }
f38ee285191813 Barry Song 2024-06-08  1334  
f38ee285191813 Barry Song 2024-06-08  1335  static inline bool pte_needs_soft_dirty_wp(struct vm_area_struct *vma, pte_t pte)
f38ee285191813 Barry Song 2024-06-08  1336  {
f38ee285191813 Barry Song 2024-06-08 @1337  	return vma_soft_dirty_enabled(vma) && !pte_soft_dirty(pte);
f38ee285191813 Barry Song 2024-06-08  1338  }
f38ee285191813 Barry Song 2024-06-08  1339  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
