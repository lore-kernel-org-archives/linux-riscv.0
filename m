Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7D5606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 02:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NSYW091Z;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SPKOMHwK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E/EF1sYOmOwOJNmebsjDLbUpu36FAzfXh461oa0MUWY=; b=NSYW091ZM9G26irzLmts+hiXbr
	1zLcb2DcdmmwxBJqFdJ4gflnlO5UQeZoOiq3/fHOhx2RUglbtdf3tyH8EQYHmLQKtu5VPCZJE8vFQ
	+4+lgPNnxyvZIMJbWI6Yr/d7bfAyHBsrJmOzMNQxtu7i+Daj8EiqHjkpOZljswTvm1MS/dVejiMQp
	Wl/aQBg/h9yrd46scwzmjU6Fnj49S7x4CLECjg0VoNJvGAxCx8IjsHi8kGga0XiIEjFBda/KNHYcr
	TiLcs/c18V1B0XbXX6nAE7X171Tw9JMWuAL9iuS1NRlWS2JpwVHmraSxe7KBUQJTPoMoewvgvMVGC
	qzsZuqDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMFtC-00000008CIo-1FQ0;
	Thu, 29 Oct 2026 02:29:14 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMFt7-00000008CIU-1VKN
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 02:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793240949; x=1824776949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T9gdfsQMp6W/ayVj5uDJFH5wzK4XwY/ukHerPwjIVRU=;
  b=SPKOMHwK75TotAHOWWYERPKQJZWJ40Br4xa2HjKiwF5SMESHCL/Jvh0v
   k0uQgd0XsilAvwyIRVD46y/QFp0ZK6T7liZ+n+kXb78IlhTuCq4aJwX5M
   WYZlv3yfJjqaKSHHXMG9jcTfRMPO1itTj3JhEf+rZxeiS/HZIkFvPiZ+0
   9cLk/FarX0J2q5rBvCxz9+luA5kVfJIRInf+eKvsD8neGV+14r20zp3+9
   tUMom+Kh1jHUKQ7EHSH15fsU5jn8Nu5wl98omjWq2mwhVpZ9wSfRpfkba
   0l+Mk0xZ8fJjTWDqmuxNayC6hfF1Opxu9O34buOFu85App+1LYXE+g+Eg
   A==;
X-CSE-ConnectionGUID: fYzIBTYWTL+xg1aSQpnJpA==
X-CSE-MsgGUID: 5/jMNoRWQWSfvgVyL+9McA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1965863"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1965863"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 19:29:08 -0700
X-CSE-ConnectionGUID: rzefarvVSo+KCk5pir41Dw==
X-CSE-MsgGUID: M9dYC7nJRtiKJkrfwxub3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5393002"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Oct 2026 19:29:05 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMFsz-00000000ZVs-0VAF;
	Thu, 29 Oct 2026 02:29:01 +0000
Date: Thu, 29 Oct 2026 10:28:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jackie Liu <liu.yun@linux.dev>, glider@google.com
Cc: oe-kbuild-all@lists.linux.dev, dvyukov@google.com, elver@google.com,
	pjw@kernel.org, alex@ghiti.fr, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	kasan-dev@googlegroups.com, muchun.song@linux.dev,
	liu.yun@linux.dev
Subject: Re: [PATCH 3/3] riscv: keep booting if KFENCE pool reservation fails
Message-ID: <202610290904.wbrEL97y-lkp@intel.com>
References: <58e3baebbf4e454725e6bde8b7a267fb71cfdaae.1793017074.git.liuyun01@kylinos.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58e3baebbf4e454725e6bde8b7a267fb71cfdaae.1793017074.git.liuyun01@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_192909_446852_5408FD64 
X-CRM114-Status: GOOD (  10.10  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jackie,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614]

url:    https://github.com/intel-lab-lkp/linux/commits/Jackie-Liu/kfence-fix-pool-cleanup-on-metadata-allocation-failure/20261026-202302
base:   7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
patch link:    https://lore.kernel.org/r/58e3baebbf4e454725e6bde8b7a267fb71cfdaae.1793017074.git.liuyun01%40kylinos.cn
patch subject: [PATCH 3/3] riscv: keep booting if KFENCE pool reservation fails
config: riscv-randconfig-1001-20261029 (https://download.01.org/0day-ci/archive/20261029/202610290904.wbrEL97y-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610290904.wbrEL97y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610290904.wbrEL97y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/mm/init.c:30:
   arch/riscv/include/asm/kfence.h: In function 'kfence_protect_page':
>> arch/riscv/include/asm/kfence.h:21:22: error: implicit declaration of function 'virt_to_kpte'; did you mean 'virt_to_page'? [-Wimplicit-function-declaration]
      21 |         pte_t *pte = virt_to_kpte(addr);
         |                      ^~~~~~~~~~~~
         |                      virt_to_page
>> arch/riscv/include/asm/kfence.h:21:22: error: initialization of 'pte_t *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>> arch/riscv/include/asm/kfence.h:24:17: error: implicit declaration of function 'set_pte'; did you mean 'set_pgd'? [-Wimplicit-function-declaration]
      24 |                 set_pte(pte, __pte(pte_val(ptep_get(pte)) & ~_PAGE_PRESENT));
         |                 ^~~~~~~
         |                 set_pgd
   In file included from arch/riscv/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:107,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:8,
                    from arch/riscv/mm/init.c:10:
>> arch/riscv/include/asm/kfence.h:24:44: error: implicit declaration of function 'ptep_get' [-Wimplicit-function-declaration]
      24 |                 set_pte(pte, __pte(pte_val(ptep_get(pte)) & ~_PAGE_PRESENT));
         |                                            ^~~~~~~~
   arch/riscv/include/asm/page.h:75:37: note: in definition of macro '__pte'
      75 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   arch/riscv/include/asm/kfence.h:24:36: note: in expansion of macro 'pte_val'
      24 |                 set_pte(pte, __pte(pte_val(ptep_get(pte)) & ~_PAGE_PRESENT));
         |                                    ^~~~~~~
>> arch/riscv/include/asm/page.h:71:29: error: request for member 'pte' in something not a structure or union
      71 | #define pte_val(x)      ((x).pte)
         |                             ^
   arch/riscv/include/asm/page.h:75:37: note: in definition of macro '__pte'
      75 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   arch/riscv/include/asm/kfence.h:24:36: note: in expansion of macro 'pte_val'
      24 |                 set_pte(pte, __pte(pte_val(ptep_get(pte)) & ~_PAGE_PRESENT));
         |                                    ^~~~~~~
>> arch/riscv/include/asm/page.h:71:29: error: request for member 'pte' in something not a structure or union
      71 | #define pte_val(x)      ((x).pte)
         |                             ^
   arch/riscv/include/asm/page.h:75:37: note: in definition of macro '__pte'
      75 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   arch/riscv/include/asm/kfence.h:26:36: note: in expansion of macro 'pte_val'
      26 |                 set_pte(pte, __pte(pte_val(ptep_get(pte)) | _PAGE_PRESENT));
         |                                    ^~~~~~~
>> arch/riscv/include/asm/kfence.h:27:17: error: implicit declaration of function 'mark_new_valid_map' [-Wimplicit-function-declaration]
      27 |                 mark_new_valid_map();
         |                 ^~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/kfence.h:31:9: error: implicit declaration of function 'local_flush_tlb_kernel_range'; did you mean 'local_flush_icache_range'? [-Wimplicit-function-declaration]
      31 |         local_flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         local_flush_icache_range


vim +21 arch/riscv/include/asm/kfence.h

47513f243b452a Liu Shixin      2021-06-15  18  
47513f243b452a Liu Shixin      2021-06-15  19  static inline bool kfence_protect_page(unsigned long addr, bool protect)
47513f243b452a Liu Shixin      2021-06-15  20  {
47513f243b452a Liu Shixin      2021-06-15 @21  	pte_t *pte = virt_to_kpte(addr);
47513f243b452a Liu Shixin      2021-06-15  22  
8d6c8c40e733b3 Vivian Wang     2026-03-03  23  	if (protect) {
edf95564726942 Alexandre Ghiti 2023-12-13 @24  		set_pte(pte, __pte(pte_val(ptep_get(pte)) & ~_PAGE_PRESENT));
8d6c8c40e733b3 Vivian Wang     2026-03-03  25  	} else {
edf95564726942 Alexandre Ghiti 2023-12-13  26  		set_pte(pte, __pte(pte_val(ptep_get(pte)) | _PAGE_PRESENT));
8d6c8c40e733b3 Vivian Wang     2026-03-03 @27  		mark_new_valid_map();
8d6c8c40e733b3 Vivian Wang     2026-03-03  28  	}
47513f243b452a Liu Shixin      2021-06-15  29  
b3431a8bb336ce Alexandre Ghiti 2024-12-09  30  	preempt_disable();
b3431a8bb336ce Alexandre Ghiti 2024-12-09 @31  	local_flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
b3431a8bb336ce Alexandre Ghiti 2024-12-09  32  	preempt_enable();
47513f243b452a Liu Shixin      2021-06-15  33  
47513f243b452a Liu Shixin      2021-06-15  34  	return true;
47513f243b452a Liu Shixin      2021-06-15  35  }
47513f243b452a Liu Shixin      2021-06-15  36  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
