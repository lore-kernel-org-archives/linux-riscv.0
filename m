Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E433EE75434
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 07:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tzx+To+pRgHzN3z3d/brR09bDAFF3apIpVXdfmZc0x0=; b=nFbREXGg7R6CZm
	juSm13D6T1MZnE3XItx/Ne1mmaIhtapBFZJCl1DfPI4cQItfwVu4gpu3+Wnc4PAXt6EAoaRYAotfi
	I6/f2YXiw9T6xsJPyxCnG9TDguQ/cE0wym+9Vy45HOc8c0jXANi/7Wj9Bz0Yu37jPSW7a61FwaABp
	9G/QKsNhVuued/4dfBQBvjBCimMBTv/OvKeMCkcKO3qtIdqgVLJVBV6m6hItHklGz1oV3K22VkkGY
	wvXCWFUIZAmfnNRrVQf7tZZFQiwr6cXAMCMRtpX0QqTldUyeZHPlzf7i2NABroJjqabohiXrlQEMx
	kohE5AeyF8yldgjFT76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaDw-00E1aA-11;
	Tue, 03 Oct 2023 07:53:44 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaDr-00E1ZZ-0v;
	Tue, 03 Oct 2023 07:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696319619; x=1727855619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cn4FFoJx/oeaBVpP42T/THT0z776pI2L6x7rZsA/yMk=;
  b=d9JouVs60T/yVkck5vfaBOcbQdkx/wa/Vn4+nedhIVzzwam3KIkCX+2u
   50vZ1CAU3tivVIn+gQhies9Uj0iGJ3Qpz5/iK1CZIqFaox/ALGonK7dj5
   wydOR18nA3D7Q3Kv1mYVLZa0lNyyoEh+lL2MeKRn1q9Mu/oQjtRVLaKFS
   UKTcVvcYYUa0D1q7TjOLfunIobmu6wnhWLPMutk6ZRmA8jB9cENLd97OS
   QrUXMKYbM3SeLCwFBqAjr6Npf7dG7w6Chzwibfw6Kw3YwyhJa5iAqboIH
   /geiTHyHUWS8SJ3RNdkiw+YTJ35UVHeQ2w97m3z8mXRp5XmVQEu+Ho75a
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="385639776"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="385639776"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 00:53:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="754323419"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="754323419"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 03 Oct 2023 00:52:57 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnaD7-0006tx-2G;
	Tue, 03 Oct 2023 07:52:54 +0000
Date: Tue, 3 Oct 2023 15:52:46 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-efi@vger.kernel.org,
	linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH 2/5] mm: Introduce pudp/p4dp/pgdp_get() functions
Message-ID: <202310031548.53wZmUUH-lkp@intel.com>
References: <20231002151031.110551-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231002151031.110551-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_005339_393876_58A3D825 
X-CRM114-Status: GOOD (  12.58  )
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

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc4 next-20231003]
[cannot apply to efi/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Use-WRITE_ONCE-when-setting-page-table-entries/20231002-231725
base:   linus/master
patch link:    https://lore.kernel.org/r/20231002151031.110551-3-alexghiti%40rivosinc.com
patch subject: [PATCH 2/5] mm: Introduce pudp/p4dp/pgdp_get() functions
config: arm-moxart_defconfig (https://download.01.org/0day-ci/archive/20231003/202310031548.53wZmUUH-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310031548.53wZmUUH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310031548.53wZmUUH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:29:
>> include/linux/pgtable.h:310:29: error: function cannot return array type 'pgd_t' (aka 'unsigned int[2]')
     310 | static inline pgd_t pgdp_get(pgd_t *pgdp)
         |                             ^
>> include/linux/pgtable.h:312:9: error: incompatible pointer to integer conversion returning 'const volatile pmdval_t *' (aka 'const volatile unsigned int *') from a function with result type 'int' [-Wint-conversion]
     312 |         return READ_ONCE(*pgdp);
         |                ^~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:47:28: note: expanded from macro 'READ_ONCE'
      47 | #define READ_ONCE(x)                                                    \
         |                                                                         ^
      48 | ({                                                                      \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |         __READ_ONCE(x);                                                 \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      51 | })
         | ~~
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1075:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      97 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1075:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      97 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1075:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     113 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1075:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     113 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1075:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1075:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1075:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     156 | _SIG_SET_BINOP(sigorsets, _sig_or)


vim +310 include/linux/pgtable.h

   308	
   309	#ifndef pgdp_get
 > 310	static inline pgd_t pgdp_get(pgd_t *pgdp)
   311	{
 > 312		return READ_ONCE(*pgdp);
   313	}
   314	#endif
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
