Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E545C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 02:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=moV4ZlWKKYAji5FggcS0oXDYW3zA4inM8PzXmdviD4M=; b=XHKwvqtzdyljOo
	vBpF/1efOJGfPjPiMw+VJp5JlzbtTdBCU/BQU9FHnKGjZkWKsZymw3qrPengZWwdiT/h3uStrdC65
	a1WqpEsTUcxkhaOTTE6GvneK+A3prPuTSoXdmZPIKKInXJXwSXMIUA/iajh8Y8SdHihJFCO/AFKdF
	6vfikNLmhOd+tiu5HNKsUkN7OfZaRPS+00g6a8s440XctW1OCpS6Mha6F8mIduQRuKidvFONfSvn6
	wAWqChK4LKNPPifdYfmTnVSqxxs4DEbgYqbKYhHZFZoE60UeXI4GerZeSqyo48zELpLTQ1yTuTl39
	+z8qltqqxVP6HaTQZpNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptfeh-00HSln-39;
	Tue, 02 May 2023 02:22:15 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptfec-00HSjg-2r;
	Tue, 02 May 2023 02:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682994130; x=1714530130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=85LkbDK+KApuWepVvTrNKkbkOtRXRZZHLuh2xgotSTc=;
  b=nwqKegsP0FYwI/O9UMptNhx52Qh6ZPwaTrFShYhU0H4Nplhblc+73R80
   EbYgIKzfGc4eAj7nFxt1Ro9/zkD8PhgGx1av99XrR8u3ZNVWRPX8UihoY
   rNq6+0VOx9j6ORnr5qUOA2K4szy0KIdtjdD5/FVZ0Qd+NzDHF3xRlutRv
   Xp8DP7t90hfIXfTzDh/ZR6RPyXvacARY8tcmEo9iYV7T/wtQgsYrL6/gI
   /UAQy+ZNunZz85iubO6aXtvtCeu3eoOAj6xHA3rHNGQDfxz2u5F0LDG09
   Nsvaq9F0Zr13eZfMvwvoqRM+Zfp8j4CS79wFM1yapWv/VWq+7I+mgn9eL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="376342292"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="376342292"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 19:22:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="646346632"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="646346632"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 May 2023 19:22:01 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptfeS-0000m8-1s;
	Tue, 02 May 2023 02:22:00 +0000
Date: Tue, 2 May 2023 10:21:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2 21/34] arm64: Convert various functions to use ptdescs
Message-ID: <202305021038.c9jfVDsv-lkp@intel.com>
References: <20230501192829.17086-22-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230501192829.17086-22-vishal.moola@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_192210_989175_90553C8B 
X-CRM114-Status: GOOD (  15.54  )
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

Hi Vishal,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master next-20230428]
[cannot apply to s390/features powerpc/next powerpc/fixes geert-m68k/for-next geert-m68k/for-linus v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishal-Moola-Oracle/mm-Add-PAGE_TYPE_OP-folio-functions/20230502-033042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230501192829.17086-22-vishal.moola%40gmail.com
patch subject: [PATCH v2 21/34] arm64: Convert various functions to use ptdescs
config: arm64-randconfig-r023-20230430 (https://download.01.org/0day-ci/archive/20230502/202305021038.c9jfVDsv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/8e9481b63b5773d7c914836dcd7fbec2449902bc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vishal-Moola-Oracle/mm-Add-PAGE_TYPE_OP-folio-functions/20230502-033042
        git checkout 8e9481b63b5773d7c914836dcd7fbec2449902bc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305021038.c9jfVDsv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/mm/mmu.c:440:10: error: invalid argument type 'void' to unary expression
                   BUG_ON(!ptdesc_pte_dtor(ptdesc));
                          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   arch/arm64/mm/mmu.c:442:10: error: invalid argument type 'void' to unary expression
                   BUG_ON(!ptdesc_pte_dtor(ptdesc));
                          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   2 errors generated.


vim +/void +440 arch/arm64/mm/mmu.c

   425	
   426	static phys_addr_t pgd_pgtable_alloc(int shift)
   427	{
   428		phys_addr_t pa = __pgd_pgtable_alloc(shift);
   429		struct ptdesc *ptdesc = page_ptdesc(phys_to_page(pa));
   430	
   431		/*
   432		 * Call proper page table ctor in case later we need to
   433		 * call core mm functions like apply_to_page_range() on
   434		 * this pre-allocated page table.
   435		 *
   436		 * We don't select ARCH_ENABLE_SPLIT_PMD_PTLOCK if pmd is
   437		 * folded, and if so ptdesc_pte_dtor() becomes nop.
   438		 */
   439		if (shift == PAGE_SHIFT)
 > 440			BUG_ON(!ptdesc_pte_dtor(ptdesc));
   441		else if (shift == PMD_SHIFT)
   442			BUG_ON(!ptdesc_pte_dtor(ptdesc));
   443	
   444		return pa;
   445	}
   446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
