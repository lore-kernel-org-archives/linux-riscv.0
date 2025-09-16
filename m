Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C16CAC598
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 09:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDQE+Vtmy+zGsy6eqGvf+pgs3ByqJX8wDEXOYCVxL+g=; b=z+IMjat5wVqvZ5
	MyFZstuXpOol7WSU8pj8qyMucTf21r8Wfg2yoyZPYjEwOJL2B12goBeiE71kev4A6Ues3q5vYEu4a
	kzeqHpTCWp/9Ixbno4ZsEhwyt/nrLJB5eeB7dIryVOpjxTJCwNPrfGWrUKCkwacpwRQbAl9KnkPRT
	N0n5eGEOmfzSJ2mOQbBrKBlHHcqWmqmA5Txn+hYqXTns+opdLH63yP57cDuYZqW7bE+tudpbsGhX8
	FODMAK30BUfOH6g6D3GM2TqryLa4uTTsxyjVn24SOh8UAIaxuPRf1Dm8ahlJSFraUr0Ecs+8iW5J9
	hc1RtysBZ6hEhDBkTnPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRj6-00000007K9f-0a99;
	Tue, 16 Sep 2025 09:11:52 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRj2-00000007K83-13j5
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 09:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758013908; x=1789549908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zMt+lj07w4o0jqg5XJ/ynsRarpPmoVl62tOzbhSFTo4=;
  b=mQ6C4vPi6xTlDTcKuPQfIf6NvmgiV5F08dExvsSP4iUu4ooHyzqYjgxJ
   CErfwJM3tmZgIlb7S3mQKPV2838CTIEq4n4X2LYsM9f6cjMVaijVR6KRW
   XMO9Y6A+eGPLXRpc/iG+ezFdUCaGf5zSBZyQGH05dQSrb3HgA9xvbl0sx
   fMekRHN23vIW8HdyZ999BpOCdDlKf1X+rlir1pEuhAwINnc78TtKeqBfS
   3yrDez06Vj5ad8FH/e98D5pkh1Bc9TuefBbvy4Cu+VEaBhOwY3x/kPtr2
   WXDX/9dX1NDGm04XgOufn0eMqfYWUMOMkpMwYyimqWCoIex+hUg2HoNtr
   Q==;
X-CSE-ConnectionGUID: Ff6eorUpStSH7rKk+x408w==
X-CSE-MsgGUID: E4ccY2jOTuChuS2c/GyAlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60156183"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="60156183"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 02:11:42 -0700
X-CSE-ConnectionGUID: uZhwW8IrSsG2Bt+G9sPI2Q==
X-CSE-MsgGUID: vXVH7QybRG+5S4cYC1RT9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="205672250"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Sep 2025 02:11:40 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyRir-00008V-1z;
	Tue, 16 Sep 2025 09:11:37 +0000
Date: Tue, 16 Sep 2025 17:10:50 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel =?iso-8859-1?Q?Sabat=E9_Sol=E0?= <mikisabate@gmail.com>,
	linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr,
	wangyuli@uniontech.com, chenhuacai@kernel.org, mikisabate@gmail.com
Subject: Re: [PATCH] riscv: kgdb: Prefer strscpy instead of strcpy
Message-ID: <202509161619.eJeLbfU0-lkp@intel.com>
References: <20250915200644.200498-1-mikisabate@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250915200644.200498-1-mikisabate@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_021148_354550_4163DD62 
X-CRM114-Status: GOOD (  11.16  )
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

Hi Miquel,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.17-rc6 next-20250915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miquel-Sabat-Sol/riscv-kgdb-Prefer-strscpy-instead-of-strcpy/20250916-040750
base:   linus/master
patch link:    https://lore.kernel.org/r/20250915200644.200498-1-mikisabate%40gmail.com
patch subject: [PATCH] riscv: kgdb: Prefer strscpy instead of strcpy
config: riscv-randconfig-002-20250916 (https://download.01.org/0day-ci/archive/20250916/202509161619.eJeLbfU0-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509161619.eJeLbfU0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509161619.eJeLbfU0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/ptrace.h:5,
                    from arch/riscv/kernel/kgdb.c:6:
   arch/riscv/kernel/kgdb.c: In function 'kgdb_arch_handle_qxfer_pkt':
>> include/linux/compiler.h:197:67: error: static assertion failed: "must be array"
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                   ^~~~~~~~~~~~~~
   include/linux/compiler.h:202:28: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     202 | #define __must_be_array(a) __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/string.h:80:40: note: in expansion of macro '__must_be_array'
      80 |  sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst) + \
         |                                        ^~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__strscpy0'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/string.h:114:2: note: in expansion of macro 'CONCATENATE'
     114 |  CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |  ^~~~~~~~~~~
   arch/riscv/kernel/kgdb.c:268:3: note: in expansion of macro 'strscpy'
     268 |   strscpy(remcom_out_buffer, riscv_gdb_stub_target_desc);
         |   ^~~~~~~
>> include/linux/compiler.h:197:67: error: static assertion failed: "must be array"
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                   ^~~~~~~~~~~~~~
   include/linux/compiler.h:202:28: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     202 | #define __must_be_array(a) __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/string.h:80:40: note: in expansion of macro '__must_be_array'
      80 |  sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst) + \
         |                                        ^~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__strscpy0'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/string.h:114:2: note: in expansion of macro 'CONCATENATE'
     114 |  CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |  ^~~~~~~~~~~
   arch/riscv/kernel/kgdb.c:271:3: note: in expansion of macro 'strscpy'
     271 |   strscpy(remcom_out_buffer, riscv_gdb_stub_cpuxml);
         |   ^~~~~~~


vim +197 include/linux/compiler.h

230fa253df6352 Christian Borntraeger 2014-11-25  193  
cb7380de9e4cbc Kees Cook             2025-02-05  194  #ifdef __CHECKER__
243c90e917f5cf Vincent Mailhol       2025-03-29  195  #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) (0)
cb7380de9e4cbc Kees Cook             2025-02-05  196  #else /* __CHECKER__ */
243c90e917f5cf Vincent Mailhol       2025-03-29 @197  #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
cb7380de9e4cbc Kees Cook             2025-02-05  198  #endif /* __CHECKER__ */
cb7380de9e4cbc Kees Cook             2025-02-05  199  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
