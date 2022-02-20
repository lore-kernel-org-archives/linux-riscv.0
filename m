Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0471C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Feb 2022 17:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zPv8RABNl0+UwVLGqNa7TJRgnUgsLT3ZPPz7EsAXnuY=; b=1ON6dNRqP8He8T
	LgvKcwjzht/3eN50cD1WJAnytntmX6uFHFlJoKh+Oz2JtAAH7y1tJJJCvOx2JfWSga04RC2mhXVWH
	wMyiTc63Z1ZGAlPBFb3JeXYCSL93QRWxbC4DUHK2bg/bV8QBA0jO1hBlcPcVt/TrdbxNp7Q+MXdbA
	0efrPZrDTvS3DbG6xxrU5mOF4Grlwq30gEeaPpc6EydGTteVrIawresWcg23w77YIejq6Y9c8LLYO
	Jynn1hEPDgTdnZ95gTYOAg3HQPDTK31UpjtbFJLifZqG802INaEGDDhq4H5ZMnIh/WBtXSioZigzL
	UsX4LtpewT4z5m9aAJcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLqR8-0021up-L2; Sun, 20 Feb 2022 17:55:54 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLqR6-0021uI-81
 for linux-riscv@lists.infradead.org; Sun, 20 Feb 2022 17:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645379752; x=1676915752;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=InSw3Uyo9gVpWR3B5ntUZxtaVXeszMm6nW3C6kITxuo=;
 b=kU/DVg/oBXSUtlcyg4onFJWE3UB7wV2/sNcTk8tU+l9bP0M6ZktZ5Do6
 bJ2AGZ6ZFsDja+UbPnkYCfHT6cwPAa6fZAwffqjXtAC2jDwW5tOIJf+xk
 x/rO7BiPRY2kYF+12tbyP446uP77SDxyBweYWWALkg9vOxnZuqP9KzBje
 E1qb/CXkXkoiKMvWibbwUAtnQ2VM5g+8avhoRL4Uoj+MHuRCwHs77AV9W
 wchG79QEq9BDs0Hu2hCZQO9oxbdQpPek6eqdCPzj5E9FygRoaRz4QheXO
 k0ATpXl8YXVwqvlmHtEuSMRStm/rxRY0PvgkCsfKOPSywMRDaemdSCKQK A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="275980804"
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; d="scan'208";a="275980804"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2022 09:55:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; d="scan'208";a="636422461"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 20 Feb 2022 09:55:45 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nLqQz-0000Xm-5R; Sun, 20 Feb 2022 17:55:45 +0000
Date: Mon, 21 Feb 2022 01:55:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Aleksandr Nogikh <nogikh@google.com>,
 Nick Hu <nickhu@andestech.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH -fixes 1/4] riscv: Fix is_linear_mapping with recent move
 of KASAN region
Message-ID: <202202210123.ilPycxXe-lkp@intel.com>
References: <20220218133513.1762929-2-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218133513.1762929-2-alexandre.ghiti@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_095552_336932_BD711287 
X-CRM114-Status: GOOD (  17.15  )
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

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.17-rc4 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alexandre-Ghiti/Fixes-KASAN-and-other-along-the-way/20220220-181628
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 4f12b742eb2b3a850ac8be7dc4ed52976fc6cb0b
config: riscv-nommu_virt_defconfig (https://download.01.org/0day-ci/archive/20220221/202202210123.ilPycxXe-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/de8a909a9eabf9066802a3396b7009cbf4fa4369
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alexandre-Ghiti/Fixes-KASAN-and-other-along-the-way/20220220-181628
        git checkout de8a909a9eabf9066802a3396b7009cbf4fa4369
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
>> include/linux/mm.h:837:22: error: use of undeclared identifier 'KERN_VIRT_SIZE'; did you mean 'KERN_VERSION'?
           struct page *page = virt_to_page(x);
                               ^
   arch/riscv/include/asm/page.h:165:42: note: expanded from macro 'virt_to_page'
   #define virt_to_page(vaddr)     (pfn_to_page(virt_to_pfn(vaddr)))
                                                ^
   arch/riscv/include/asm/page.h:162:41: note: expanded from macro 'virt_to_pfn'
   #define virt_to_pfn(vaddr)      (phys_to_pfn(__pa(vaddr)))
                                                ^
   arch/riscv/include/asm/page.h:156:18: note: expanded from macro '__pa'
   #define __pa(x)         __virt_to_phys((unsigned long)(x))
                           ^
   arch/riscv/include/asm/page.h:151:27: note: expanded from macro '__virt_to_phys'
   #define __virt_to_phys(x)       __va_to_pa_nodebug(x)
                                   ^
   arch/riscv/include/asm/page.h:143:2: note: expanded from macro '__va_to_pa_nodebug'
           is_linear_mapping(_x) ?                                                 \
           ^
   arch/riscv/include/asm/page.h:122:75: note: expanded from macro 'is_linear_mapping'
           ((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < PAGE_OFFSET + KERN_VIRT_SIZE))
                                                                                    ^
   include/uapi/linux/sysctl.h:88:2: note: 'KERN_VERSION' declared here
           KERN_VERSION=4,         /* string: compile time info */
           ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   include/linux/mm.h:844:22: error: use of undeclared identifier 'KERN_VIRT_SIZE'; did you mean 'KERN_VERSION'?
           struct page *page = virt_to_page(x);
                               ^
   arch/riscv/include/asm/page.h:165:42: note: expanded from macro 'virt_to_page'
   #define virt_to_page(vaddr)     (pfn_to_page(virt_to_pfn(vaddr)))
                                                ^
   arch/riscv/include/asm/page.h:162:41: note: expanded from macro 'virt_to_pfn'
   #define virt_to_pfn(vaddr)      (phys_to_pfn(__pa(vaddr)))
                                                ^
   arch/riscv/include/asm/page.h:156:18: note: expanded from macro '__pa'
   #define __pa(x)         __virt_to_phys((unsigned long)(x))
                           ^
   arch/riscv/include/asm/page.h:151:27: note: expanded from macro '__virt_to_phys'
   #define __virt_to_phys(x)       __va_to_pa_nodebug(x)
                                   ^
   arch/riscv/include/asm/page.h:143:2: note: expanded from macro '__va_to_pa_nodebug'
           is_linear_mapping(_x) ?                                                 \
           ^
   arch/riscv/include/asm/page.h:122:75: note: expanded from macro 'is_linear_mapping'
           ((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < PAGE_OFFSET + KERN_VIRT_SIZE))
                                                                                    ^
   include/uapi/linux/sysctl.h:88:2: note: 'KERN_VERSION' declared here
           KERN_VERSION=4,         /* string: compile time info */
           ^
   2 errors generated.
   make[2]: *** [scripts/Makefile.build:121: arch/riscv/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1191: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +837 include/linux/mm.h

70b50f94f1644e Andrea Arcangeli   2011-11-02  834  
b49af68ff9fc5d Christoph Lameter  2007-05-06  835  static inline struct page *virt_to_head_page(const void *x)
b49af68ff9fc5d Christoph Lameter  2007-05-06  836  {
b49af68ff9fc5d Christoph Lameter  2007-05-06 @837  	struct page *page = virt_to_page(x);
ccaafd7fd039ae Joonsoo Kim        2015-02-10  838  
1d798ca3f16437 Kirill A. Shutemov 2015-11-06  839  	return compound_head(page);
b49af68ff9fc5d Christoph Lameter  2007-05-06  840  }
b49af68ff9fc5d Christoph Lameter  2007-05-06  841  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
