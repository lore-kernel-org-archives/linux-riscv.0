Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D4BC27C76
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 14:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukM9Zxk0bDvKY3sGeyoME5v03E1lTbyYlu4zKOknibk=; b=OfjAo8HGZYAWpR
	znv4QXJ9+drtc/ZRB0IFkwPIbhFIyN71eTmrKw3V/sB9nj/vkQyqaQhNyG1w/e85aGH9M2bRcOpeG
	wK/Mm6TqTdKKjR/6/IUgAFJNfjeDlHgX0sMdsQeHM/AxlPaaJywFUNuL2QOPdaWqXXdhoLAEGcqBN
	V+DQXmbdZJh5/bZg5Y+LeTTFGHj2JqQNMBcUt/xwKS0BzHfcoBGrQLnGKFTao8ob7negjH4C4d2cS
	ji/Rxgd05fiYxDg1DsOb1kT3MTJPv0VcD5NXD7jPR1wqTcDKE4fQODdVhdhnGkR8mKKnNhN1gr/hv
	aZtRfCi071vHRdA443xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLlrt-000FrA-C7; Sat, 28 Jan 2023 14:07:45 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLlrp-000FqZ-EC
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 14:07:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674914861; x=1706450861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WTDpRVa0MveJVfjoRUs5+0aclQZKli4cwvlT+d+/Siw=;
  b=Hww+V1sf4GZQzPJJrwCbqxxvWmuFocDzwgzr9ghN3hnThRkwPtiQywpM
   o434huE89nv13AR73/LWZJOJ4BUpk5b7D/wh/i+jDJcWuWXW6enD2ochn
   4CjQ4p1CIxt2YlFFq0Bd9Ruyy4prIFfXix5wc+iRxOVaR2ubI56VF+sDm
   rlbC2oplTdwaQAUhQZW/sLo5CFMzVSS1LrIs0uu9r6YOlf5noAxLxRD7Y
   BTgnv8vw1Ahkf3JXEkDf3mn6E/OdArF/WscVlNHjh3l96LARDRMJicz0A
   zAe1tHggPquZLI18TBnxcLfZPxXMCyf5ed4R4dIcvjnXOJNpCqGb9/MfC
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="324986369"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="324986369"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 06:07:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="656938599"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="656938599"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Jan 2023 06:07:32 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLlrf-0000ip-2O;
	Sat, 28 Jan 2023 14:07:31 +0000
Date: Sat, 28 Jan 2023 22:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v5 1/2] riscv: Get rid of riscv_pfn_base variable
Message-ID: <202301282132.46rygx9x-lkp@intel.com>
References: <20230125081214.1576313-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230125081214.1576313-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_060741_566483_97456128 
X-CRM114-Status: GOOD (  15.82  )
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

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.2-rc5 next-20230127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Get-rid-of-riscv_pfn_base-variable/20230125-161537
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230125081214.1576313-2-alexghiti%40rivosinc.com
patch subject: [PATCH v5 1/2] riscv: Get rid of riscv_pfn_base variable
config: riscv-randconfig-r014-20230123 (https://download.01.org/0day-ci/archive/20230128/202301282132.46rygx9x-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/90b21402dc8a7e6e36a62ad19c4969ff13fad168
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexandre-Ghiti/riscv-Get-rid-of-riscv_pfn_base-variable/20230125-161537
        git checkout 90b21402dc8a7e6e36a62ad19c4969ff13fad168
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/mmc/host/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/debug.c:95:25: warning: format specifies type 'unsigned long' but the argument has type 'phys_addr_t' (aka 'unsigned long long') [-Wformat]
                           page_to_pgoff(page), page_to_pfn(page));
                                                ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:510:37: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                      ~~~     ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   include/asm-generic/memory_model.h:52:21: note: expanded from macro 'page_to_pfn'
   #define page_to_pfn __page_to_pfn
                       ^
   include/asm-generic/memory_model.h:19:29: note: expanded from macro '__page_to_pfn'
   #define __page_to_pfn(page)     ((unsigned long)((page) - mem_map) + \
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
--
>> mm/page_alloc.c:695:18: warning: format specifies type 'unsigned long' but the argument has type 'phys_addr_t' (aka 'unsigned long long') [-Wformat]
                   current->comm, page_to_pfn(page));
                                  ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:480:35: note: expanded from macro 'pr_alert'
           printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   include/asm-generic/memory_model.h:52:21: note: expanded from macro 'page_to_pfn'
   #define page_to_pfn __page_to_pfn
                       ^
   include/asm-generic/memory_model.h:19:29: note: expanded from macro '__page_to_pfn'
   #define __page_to_pfn(page)     ((unsigned long)((page) - mem_map) + \
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
--
>> mm/page_isolation.c:174:26: warning: comparison of distinct pointer types ('typeof (((unsigned long)((page) - mem_map) + (((phys_ram_base) >> (12))))) *' (aka 'unsigned long long *') and 'typeof (start_pfn) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           check_unmovable_start = max(page_to_pfn(page), start_pfn);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
>> mm/page_isolation.c:175:24: warning: comparison of distinct pointer types ('typeof ((((((((unsigned long)((page) - mem_map) + (((phys_ram_base) >> (12))))) + 1)) + ((typeof (((((unsigned long)((page) - mem_map) + (((phys_ram_base) >> (12))))) + 1)))(((1UL << __builtin_choose_expr(((!!(sizeof ((typeof ((unsigned int)((21 - (12)))) *)1 == (typeof ((unsigned int)(11 - 1)) *)1))) && ((sizeof(int) == sizeof (*(8 ? ((void *)((long)((unsigned int)((21 - (12)))) * 0L)) : (int *)8))) && (sizeof(int) == sizeof (*(8 ? ((void *)((long)((unsigned int)(11 - 1)) * 0L)) : (int *)8))))), (((unsigned int)((21 - (12)))) < ((unsigned int)(11 - 1)) ? ((unsigned int)((21 - (12)))) : ((unsigned int)(11 - 1))), ({
       typeof ((unsigned int)((21 - (12)))) __UNIQUE_ID___x304 = ((unsigned int)((21 - (12))));
       typeof ((unsigned int)(11 - 1)) __UNIQUE_ID___y305 = ((unsigned int)(11 - 1));
       ((__UNIQUE_ID___x304) < (__UNIQUE_ID___y305) ? (__UNIQUE_ID___x304) : (__UNIQUE_ID___y305));
   }))))) - 1)) & ~((typeof (((((unsigned long)((page) - mem_map) + (((phys_ram_base) >> (12))))) + 1)))(((1UL << __builtin_choose_expr(((!!(sizeof ((typeof ((unsigned int)((21 - (12)))) *)1 == (typeof ((unsigned int)(11 - 1)) *)1))) && ((sizeof(int) == sizeof (*(8 ? ((void *)((long)((unsigned int)((21 - (12)))) * 0L)) : (int *)8))) && (sizeof(int) == sizeof (*(8 ? ((void *)((long)((unsigned int)(11 - 1)) * 0L)) : (int *)8))))), (((unsigned int)((21 - (12)))) < ((unsigned int)(11 - 1)) ? ((unsigned int)((21 - (12)))) : ((unsigned int)(11 - 1))), ({
       typeof ((unsigned int)((21 - (12)))) __UNIQUE_ID___x304 = ((unsigned int)((21 - (12))));
       typeof ((unsigned int)(11 - 1)) __UNIQUE_ID___y305 = ((unsigned int)(11 - 1));
       ((__UNIQUE_ID___x304) < (__UNIQUE_ID___y305) ? (__UNIQUE_ID___x304) : (__UNIQUE_ID___y305));
   }))))) - 1))) *' (aka 'unsigned long long *') and 'typeof (end_pfn) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
           check_unmovable_end = min(pageblock_end_pfn(page_to_pfn(page)),
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   2 warnings generated.
--
>> drivers/mmc/host/usdhi6rol0.c:388:18: warning: format specifies type 'unsigned long' but the argument has type 'phys_addr_t' (aka 'unsigned long long') [-Wformat]
                   host->pg.page, page_to_pfn(host->pg.page), host->pg.mapped,
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                        ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:273:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                   ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:59: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
                                                                    ^~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:223:15: note: expanded from macro '__dynamic_func_call_cls'
                   func(&id, ##__VA_ARGS__);                       \
                               ^~~~~~~~~~~
   include/asm-generic/memory_model.h:52:21: note: expanded from macro 'page_to_pfn'
   #define page_to_pfn __page_to_pfn
                       ^
   include/asm-generic/memory_model.h:19:29: note: expanded from macro '__page_to_pfn'
   #define __page_to_pfn(page)     ((unsigned long)((page) - mem_map) + \
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:511:18: warning: format specifies type 'unsigned long' but the argument has type 'phys_addr_t' (aka 'unsigned long long') [-Wformat]
                   host->pg.page, page_to_pfn(host->pg.page), host->pg.mapped,
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                        ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:273:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                   ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:59: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
                                                                    ^~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:223:15: note: expanded from macro '__dynamic_func_call_cls'
                   func(&id, ##__VA_ARGS__);                       \
                               ^~~~~~~~~~~
   include/asm-generic/memory_model.h:52:21: note: expanded from macro 'page_to_pfn'
   #define page_to_pfn __page_to_pfn
                       ^
   include/asm-generic/memory_model.h:19:29: note: expanded from macro '__page_to_pfn'
   #define __page_to_pfn(page)     ((unsigned long)((page) - mem_map) + \
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +174 mm/page_isolation.c

b48d8a8e5ce53e Zi Yan                    2022-05-12  141  
844fbae63e468e Zi Yan                    2022-05-12  142  /*
844fbae63e468e Zi Yan                    2022-05-12  143   * This function set pageblock migratetype to isolate if no unmovable page is
844fbae63e468e Zi Yan                    2022-05-12  144   * present in [start_pfn, end_pfn). The pageblock must intersect with
844fbae63e468e Zi Yan                    2022-05-12  145   * [start_pfn, end_pfn).
844fbae63e468e Zi Yan                    2022-05-12  146   */
844fbae63e468e Zi Yan                    2022-05-12  147  static int set_migratetype_isolate(struct page *page, int migratetype, int isol_flags,
844fbae63e468e Zi Yan                    2022-05-12  148  			unsigned long start_pfn, unsigned long end_pfn)
ee6f509c327401 Minchan Kim               2012-07-31  149  {
1c31cb493c3144 David Hildenbrand         2020-10-13  150  	struct zone *zone = page_zone(page);
1c31cb493c3144 David Hildenbrand         2020-10-13  151  	struct page *unmovable;
3f9903b9ca5e98 David Hildenbrand         2020-01-30  152  	unsigned long flags;
844fbae63e468e Zi Yan                    2022-05-12  153  	unsigned long check_unmovable_start, check_unmovable_end;
ee6f509c327401 Minchan Kim               2012-07-31  154  
ee6f509c327401 Minchan Kim               2012-07-31  155  	spin_lock_irqsave(&zone->lock, flags);
ee6f509c327401 Minchan Kim               2012-07-31  156  
2c7452a075d4db Mike Kravetz              2018-04-05  157  	/*
2c7452a075d4db Mike Kravetz              2018-04-05  158  	 * We assume the caller intended to SET migrate type to isolate.
2c7452a075d4db Mike Kravetz              2018-04-05  159  	 * If it is already set, then someone else must have raced and
51030a53d81e30 David Hildenbrand         2020-10-13  160  	 * set it before us.
2c7452a075d4db Mike Kravetz              2018-04-05  161  	 */
51030a53d81e30 David Hildenbrand         2020-10-13  162  	if (is_migrate_isolate_page(page)) {
51030a53d81e30 David Hildenbrand         2020-10-13  163  		spin_unlock_irqrestore(&zone->lock, flags);
51030a53d81e30 David Hildenbrand         2020-10-13  164  		return -EBUSY;
51030a53d81e30 David Hildenbrand         2020-10-13  165  	}
2c7452a075d4db Mike Kravetz              2018-04-05  166  
ee6f509c327401 Minchan Kim               2012-07-31  167  	/*
ee6f509c327401 Minchan Kim               2012-07-31  168  	 * FIXME: Now, memory hotplug doesn't call shrink_slab() by itself.
ee6f509c327401 Minchan Kim               2012-07-31  169  	 * We just check MOVABLE pages.
844fbae63e468e Zi Yan                    2022-05-12  170  	 *
844fbae63e468e Zi Yan                    2022-05-12  171  	 * Pass the intersection of [start_pfn, end_pfn) and the page's pageblock
844fbae63e468e Zi Yan                    2022-05-12  172  	 * to avoid redundant checks.
ee6f509c327401 Minchan Kim               2012-07-31  173  	 */
844fbae63e468e Zi Yan                    2022-05-12 @174  	check_unmovable_start = max(page_to_pfn(page), start_pfn);
4f9bc69ac5ce34 Kefeng Wang               2022-09-07 @175  	check_unmovable_end = min(pageblock_end_pfn(page_to_pfn(page)),
844fbae63e468e Zi Yan                    2022-05-12  176  				  end_pfn);
844fbae63e468e Zi Yan                    2022-05-12  177  
844fbae63e468e Zi Yan                    2022-05-12  178  	unmovable = has_unmovable_pages(check_unmovable_start, check_unmovable_end,
844fbae63e468e Zi Yan                    2022-05-12  179  			migratetype, isol_flags);
4a55c0474a92d5 Qian Cai                  2020-01-30  180  	if (!unmovable) {
2139cbe627b891 Bartlomiej Zolnierkiewicz 2012-10-08  181  		unsigned long nr_pages;
4da2ce250f9860 Michal Hocko              2017-11-15  182  		int mt = get_pageblock_migratetype(page);
2139cbe627b891 Bartlomiej Zolnierkiewicz 2012-10-08  183  
a458431e176ddb Bartlomiej Zolnierkiewicz 2013-01-04  184  		set_pageblock_migratetype(page, MIGRATE_ISOLATE);
ad53f92eb416d8 Joonsoo Kim               2014-11-13  185  		zone->nr_isolate_pageblock++;
02aa0cdd72483c Vlastimil Babka           2017-05-08  186  		nr_pages = move_freepages_block(zone, page, MIGRATE_ISOLATE,
02aa0cdd72483c Vlastimil Babka           2017-05-08  187  									NULL);
2139cbe627b891 Bartlomiej Zolnierkiewicz 2012-10-08  188  
4da2ce250f9860 Michal Hocko              2017-11-15  189  		__mod_zone_freepage_state(zone, -nr_pages, mt);
1c31cb493c3144 David Hildenbrand         2020-10-13  190  		spin_unlock_irqrestore(&zone->lock, flags);
1c31cb493c3144 David Hildenbrand         2020-10-13  191  		return 0;
ee6f509c327401 Minchan Kim               2012-07-31  192  	}
ee6f509c327401 Minchan Kim               2012-07-31  193  
ee6f509c327401 Minchan Kim               2012-07-31  194  	spin_unlock_irqrestore(&zone->lock, flags);
1c31cb493c3144 David Hildenbrand         2020-10-13  195  	if (isol_flags & REPORT_FAILURE) {
4a55c0474a92d5 Qian Cai                  2020-01-30  196  		/*
3d680bdf60a5ba Qian Cai                  2020-01-30  197  		 * printk() with zone->lock held will likely trigger a
4a55c0474a92d5 Qian Cai                  2020-01-30  198  		 * lockdep splat, so defer it here.
4a55c0474a92d5 Qian Cai                  2020-01-30  199  		 */
4a55c0474a92d5 Qian Cai                  2020-01-30  200  		dump_page(unmovable, "unmovable page");
3d680bdf60a5ba Qian Cai                  2020-01-30  201  	}
4a55c0474a92d5 Qian Cai                  2020-01-30  202  
1c31cb493c3144 David Hildenbrand         2020-10-13  203  	return -EBUSY;
ee6f509c327401 Minchan Kim               2012-07-31  204  }
ee6f509c327401 Minchan Kim               2012-07-31  205  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
