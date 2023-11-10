Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF75C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 06:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wUCOZBqWRKbtZ7R1PO6xhzEN9Fm6TnxqM5ULwbVSIUw=; b=k/BLWQ7sLbPx3l
	uyM5IBrMdOs78pBLop3NOmkwxjQ94rEK3L8HJkRqOQbFqmwVoiKRWBW+eFP4TfdfJBQVD5OURbG6K
	lzRoOdBQNSAT7KNsyk3c1u79QiLsnupWhmGesUwPw9YkFXHywIta94eoK3lLheCLp/D4K3gBVeLW/
	K8CK7KdX7HQ6ykoeq2idCZ0pjltYl+j0tVOy4NhEndkKREByjrhL8y/iI2kI4mfeVM8OJ5zaB/30+
	e6kcAJsOKYb8MJHiYKI926IM0Ey03YyZU/mK/QroSqhajlnJz/RZYeI3UebgSISKXJ02sPs3LwAPM
	4GTWmLs8+qm4D4e7kqkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1L5a-007yJz-08;
	Fri, 10 Nov 2023 06:33:58 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1L5X-007yJU-2E
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 06:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699598035; x=1731134035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=66YBL6PfrqVg04K0JChX/7lt+q7ycdrEOKTR8Zp9r54=;
  b=k3KYcLUKJ4vTlF34s21nnBVBbMu96P94/ChLGKtarvz4hA2yZ57Corep
   Hub2SYzBdGIlzQMa2L07AzV2lhIv8FPLYkJeaG/wkG0mCEqxRBzvKfTRh
   rgAjQdSd+TM4VFR6QluVyYSz3XDjULZ+AfgyxBiTuMTl/Zje1N09XOdbg
   JRQdZC8j1Mls9hgNIO4ROJrXet5204MVb6UF2C93H/WgEk3a3lDgiESO7
   PscuT9eaXWTVJUu4cMnpl9J8ZroTplkkJWZ5YVIFhztJa1i92HkFiLhVw
   ghIbbfms0L365I6bYLSMlQK+/Kg2wUB7ofJInVuhMKITBvs1L9GbNw2Fp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="393014372"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="393014372"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 22:33:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="834073028"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="834073028"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2023 22:33:49 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1L5P-0009Sm-2I;
	Fri, 10 Nov 2023 06:33:47 +0000
Date: Fri, 10 Nov 2023 14:33:01 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Parri <parri.andrea@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	charlie@rivosinc.com, rehn@rivosinc.com, paulmck@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	mmaas@google.com, hboehm@google.com, striker@us.ibm.com
Subject: Re: [PATCH 1/2] locking: Introduce prepare_sync_core_cmd()
Message-ID: <202311101405.3plnlyj4-lkp@intel.com>
References: <ZU0sliwUQJyNAH1y@andrea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZU0sliwUQJyNAH1y@andrea>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_223355_771946_86FBEAB1 
X-CRM114-Status: GOOD (  13.40  )
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

Hi Andrea,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-Parri/locking-Introduce-prepare_sync_core_cmd/20231110-035816
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/ZU0sliwUQJyNAH1y%40andrea
patch subject: [PATCH 1/2] locking: Introduce prepare_sync_core_cmd()
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20231110/202311101405.3plnlyj4-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311101405.3plnlyj4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311101405.3plnlyj4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sync_core.h:6,
                    from include/linux/sched/mm.h:10,
                    from include/linux/xarray.h:19,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1075,
                    from arch/riscv/kernel/asm-offsets.c:10:
   arch/riscv/include/asm/sync_core.h: In function 'prepare_sync_core_cmd':
>> arch/riscv/include/asm/sync_core.h:20:36: error: 'mm_context_t' has no member named 'icache_stale_mask'
      20 |         cpumask_setall(&mm->context.icache_stale_mask);
         |                                    ^
   make[3]: *** [scripts/Makefile.build:116: arch/riscv/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +20 arch/riscv/include/asm/sync_core.h

    13	
    14	/*
    15	 * Ensure the next switch_mm() on every CPU issues a core serializing
    16	 * instruction for the given @mm.
    17	 */
    18	static inline void prepare_sync_core_cmd(struct mm_struct *mm)
    19	{
  > 20		cpumask_setall(&mm->context.icache_stale_mask);
    21	}
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
