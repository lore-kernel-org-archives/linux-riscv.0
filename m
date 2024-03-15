Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECF5C54E58
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 08:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePELaUVCuwZzGgxbuvPjh7SWspEskgIJl01uonaJERQ=; b=LR/CeuqjPRhhSg
	DGCw5tQExOzIpMnAvvR4nELNcXrd/p/Qniv0TQ1RJyxJcYzcpi8vgXVXFwC47HoCQvJEgY05QXBxC
	KVee2P34mJO/gQq85vBn0UQI7iVeWMYk+Nf2MQ4sg6XcG5F4fUPtunW3V0P5eHhbOvxKkUp8tN9o2
	Q7Hbv/ZMwnYKAPTsk5rMAtyo9FQHyqGTED4n7yNxbvimO0IjBBrnGXP1icOfGa31Wbc7cC4D/8gRZ
	8dj8eUWSo0KAJC5ivcs1LaiMyhDhcfAnG1l1bJj3GL1FRzlZtG35IXH5p8o8CQAYlJLu9+44Gyfd2
	/OVZbi7k59Q1/2kImkDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl2qN-0000000H9Ej-0jGJ;
	Fri, 15 Mar 2024 08:23:11 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl2qJ-0000000H9Dr-1z91
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 08:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710490987; x=1742026987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yXZH8RAtGsBHoBi0Ar7G6PRNfK452YQsTJc6LoedWUk=;
  b=EERxz13Afk63SPAyA65wPgepjjG0FgWSYHXcQeJCtgC7Of1Cdg7a90Rb
   nAbrjwjD4tpx2eNZTJFKVFqaNbkMg5kq5HRvNuNMgGBFguEvwvAvcn+/u
   4HeURDNejnnr1GkY455+BuOtVdD6FDemcvnSGIby0ssAoy5aBK1L5sWBm
   +tYL+XfLr2nXIlkvddXbb2Oh0Fq227yMuB4UFgtvjGV/iaJg2gyz/zKFH
   rncapwNy/FFzsvCEKnfIjkYcU4pulQ/W9fWYbilpEOdriqitOR0KmbWka
   y758ZWeTTVdeSekEPrUbTFU5SNrjaF3SBmMyts5B/kAB/fsfCZpzUEzjs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="15896614"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="15896614"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 01:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="13217521"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Mar 2024 01:23:01 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl2qA-000EFx-1q;
	Fri, 15 Mar 2024 08:22:58 +0000
Date: Fri, 15 Mar 2024 16:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Yeong <joshua.yeong@starfivetech.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, geert+renesas@glider.be,
	prabhakar.mahadev-lad.rj@bp.renesas.com, conor.dooley@microchip.com,
	alexghiti@rivosinc.com, evan@rivosinc.com, ajones@ventanamicro.com,
	heiko@sntech.de, guoren@kernel.org, uwu@icenowy.me,
	jszhang@kernel.org, conor@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	leyfoon.tan@starfivetech.com, jeeheng.sia@starfivetech.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] cache: Add StarLink-500 cache management for
 StarFive  JH8100 RISC-V core
Message-ID: <202403151625.boKDjHGr-lkp@intel.com>
References: <20240314061205.26143-4-joshua.yeong@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240314061205.26143-4-joshua.yeong@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_012307_613195_30DC05CF 
X-CRM114-Status: GOOD (  13.23  )
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

Hi Joshua,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.8 next-20240314]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Yeong/riscv-asm-vendorid_list-Add-StarFive-Technology-to-vendors-list/20240314-165125
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240314061205.26143-4-joshua.yeong%40starfivetech.com
patch subject: [PATCH 3/4] cache: Add StarLink-500 cache management for StarFive  JH8100 RISC-V core
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240315/202403151625.boKDjHGr-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151625.boKDjHGr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151625.boKDjHGr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/cache/starlink500_cache.c:11:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/riscv/include/asm/cacheflush.h:9:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/cache/starlink500_cache.c:59:6: warning: no previous prototype for function 'starfive_sl500_dma_cache_wback' [-Wmissing-prototypes]
      59 | void starfive_sl500_dma_cache_wback(phys_addr_t paddr, unsigned long size)
         |      ^
   drivers/cache/starlink500_cache.c:59:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      59 | void starfive_sl500_dma_cache_wback(phys_addr_t paddr, unsigned long size)
         | ^
         | static 
>> drivers/cache/starlink500_cache.c:74:6: warning: no previous prototype for function 'starfive_sl500_dma_cache_invalidate' [-Wmissing-prototypes]
      74 | void starfive_sl500_dma_cache_invalidate(phys_addr_t paddr, unsigned long size)
         |      ^
   drivers/cache/starlink500_cache.c:74:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      74 | void starfive_sl500_dma_cache_invalidate(phys_addr_t paddr, unsigned long size)
         | ^
         | static 
>> drivers/cache/starlink500_cache.c:89:6: warning: no previous prototype for function 'starfive_sl500_dma_cache_wback_inv' [-Wmissing-prototypes]
      89 | void starfive_sl500_dma_cache_wback_inv(phys_addr_t paddr, unsigned long size)
         |      ^
   drivers/cache/starlink500_cache.c:89:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      89 | void starfive_sl500_dma_cache_wback_inv(phys_addr_t paddr, unsigned long size)
         | ^
         | static 
   8 warnings generated.


vim +/starfive_sl500_dma_cache_wback +59 drivers/cache/starlink500_cache.c

    58	
  > 59	void starfive_sl500_dma_cache_wback(phys_addr_t paddr, unsigned long size)
    60	{
    61		writeq(FIELD_PREP(STARFIVE_SL500_ADDRESS_RANGE_MASK, paddr),
    62		       starfive_sl500_cache_priv.base_addr + STARFIVE_SL500_CMO_FLUSH_START_ADDR);
    63		writeq(FIELD_PREP(STARFIVE_SL500_ADDRESS_RANGE_MASK, paddr + size),
    64		       starfive_sl500_cache_priv.base_addr + STARFIVE_SL500_CMO_FLUSH_END_ADDR);
    65	
    66		mb();
    67		writeq(FIELD_PREP(STARFIVE_SL500_FLUSH_CTL_MODE_MASK,
    68		       STARFIVE_SL500_FLUSH_CTL_CLEAN_SHARED),
    69		       starfive_sl500_cache_priv.base_addr + STARFIVE_SL500_CMO_FLUSH_CTL);
    70	
    71		starfive_sl500_cmo_flush_complete();
    72	}
    73	
  > 74	void starfive_sl500_dma_cache_invalidate(phys_addr_t paddr, unsigned long size)
    75	{
    76		writeq(FIELD_PREP(STARFIVE_SL500_ADDRESS_RANGE_MASK, paddr),
    77		       starfive_sl500_cache_priv.base_addr + STARFIVE_SL500_CMO_FLUSH_START_ADDR);
    78		writeq(FIELD_PREP(STARFIVE_SL500_ADDRESS_RANGE_MASK, paddr + size),
    79		       starfive_sl500_cache_priv.base_addr + STARFIVE_SL500_CMO_FLUSH_END_ADDR);
    80	
    81		mb();
    82		writeq(FIELD_PREP(STARFIVE_SL500_FLUSH_CTL_MODE_MASK,
    83		       STARFIVE_SL500_FLUSH_CTL_MAKE_INVALIDATE),
    84		       starfive_sl500_cache_priv.base_addr + STARFIVE_SL500_CMO_FLUSH_CTL);
    85	
    86		starfive_sl500_cmo_flush_complete();
    87	}
    88	
  > 89	void starfive_sl500_dma_cache_wback_inv(phys_addr_t paddr, unsigned long size)
    90	{
    91		writeq(FIELD_PREP(STARFIVE_SL500_ADDRESS_RANGE_MASK, paddr),
    92		       starfive_sl500_cache_priv.base_addr + STARFIVE_SL500_CMO_FLUSH_START_ADDR);
    93		writeq(FIELD_PREP(STARFIVE_SL500_ADDRESS_RANGE_MASK, paddr + size),
    94		       starfive_sl500_cache_priv.base_addr + STARFIVE_SL500_CMO_FLUSH_END_ADDR);
    95	
    96		mb();
    97		writeq(FIELD_PREP(STARFIVE_SL500_FLUSH_CTL_MODE_MASK,
    98		       STARFIVE_SL500_FLUSH_CTL_CLEAN_INVALIDATE),
    99		       starfive_sl500_cache_priv.base_addr + STARFIVE_SL500_CMO_FLUSH_CTL);
   100	
   101		starfive_sl500_cmo_flush_complete();
   102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
