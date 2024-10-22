Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAC8CDD0DD
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 19:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=46ZDipjWKFNb3tTJd4mgOYl6Zv//xgVOwcB8szBDmzQ=; b=C5SP9Iqh3JgYnz
	HoLkR772/gqem/LAXCu/3pBpqkGRUrpP7Kz0sLuPwV7cpmUJCqtrdR/8SnC0gmVE4aIRgZwMq3MCa
	d2rSZZUbJXvoZxIfQU82eMYTjEBwEshBaE7FAmz9+AGsfT65iEvDd7PjZsHVmFvCp7xilqpKkc/kj
	YoEWD5vzte3J4g6OCXAxpWxZt0y3bK4tfMknNwtAstWfTlzowZp0djyHYhETg/gkhs0kH3z0NvDKX
	H1WcciPeqD2XySZD2q4keuc4C/C3MlhScGyGZHqoEToX7xKKytNa0chzdohTo4k3Fefy8K63lBmC6
	nY+CAvgVcPoONVKmTcPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3KvJ-0000000C0Vl-1mdo;
	Tue, 22 Oct 2024 19:52:09 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3KvG-0000000C0VC-0Cok;
	Tue, 22 Oct 2024 19:52:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729626726; x=1761162726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UlSzvYSwUTwKszAfPfGtBb/1Wy2hu7cv8ILTCepA7tU=;
  b=JtlWFGJ9nWJ0EcgIti86rNaRYRbOUALBUtnpc/+mfzxt/HNVY6ThkxCx
   lnWhZC0SbZtLTrd0V5xqvU0JwVwCBW8hCU6riQEf9aCwKTn1c7wPy4c6d
   ULF8vji1qQ+CJhEfgwB/kBCFK8sB0J7wH8AIViMsT5/ZGjz3Sv4TiUrO+
   hs8Dw3rQoOqo3PwyPyyRn9fZs1I8DzIIX3q457bWkR+ztETf+28VYSbJ0
   AKB+PsMIKkv5MZdiQPzqq57ndVpapFl5MtzLwIWg+tkTG1BFLZjO48CYq
   jEEAL/HElzyjXWS0otcdujp5jbHIkP8c4kbTpKpqCeYwx3xPwLZjZxXq5
   Q==;
X-CSE-ConnectionGUID: wIdrcPZfThGIpc4IZjHA8Q==
X-CSE-MsgGUID: N19GkZlGQxmGo70pQR6pgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28965275"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28965275"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 12:52:05 -0700
X-CSE-ConnectionGUID: Hd7C0uazSJyFDhVm50mY0g==
X-CSE-MsgGUID: 5xrvzvoTRWWzZR0ykl21Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79538027"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Oct 2024 12:52:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3Kv9-000U2M-0D;
	Tue, 22 Oct 2024 19:51:59 +0000
Date: Wed, 23 Oct 2024 03:51:25 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2 4/9] kasan: sw_tags: Support tag widths less than 8
 bits
Message-ID: <202410230319.eQozBGh7-lkp@intel.com>
References: <20241022015913.3524425-5-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241022015913.3524425-5-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_125206_159052_F3AEE9A2 
X-CRM114-Status: GOOD (  13.42  )
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

Hi Samuel,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on arm64/for-next/core masahiroy-kbuild/for-next masahiroy-kbuild/fixes linus/master v6.12-rc4 next-20241022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Holland/kasan-sw_tags-Use-arithmetic-shift-for-shadow-computation/20241022-100129
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241022015913.3524425-5-samuel.holland%40sifive.com
patch subject: [PATCH v2 4/9] kasan: sw_tags: Support tag widths less than 8 bits
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20241023/202410230319.eQozBGh7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230319.eQozBGh7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410230319.eQozBGh7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:5:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:234:
   In file included from include/linux/kasan.h:7:
   In file included from include/linux/kasan-tags.h:5:
>> arch/um/include/asm/kasan.h:19:2: error: "KASAN_SHADOW_SIZE is not defined for this sub-architecture"
      19 | #error "KASAN_SHADOW_SIZE is not defined for this sub-architecture"
         |  ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:102: arch/um/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +19 arch/um/include/asm/kasan.h

5b301409e8bc5d7 Patricia Alfonso 2022-07-01  12  
5b301409e8bc5d7 Patricia Alfonso 2022-07-01  13  #ifdef CONFIG_X86_64
5b301409e8bc5d7 Patricia Alfonso 2022-07-01  14  #define KASAN_HOST_USER_SPACE_END_ADDR 0x00007fffffffffffUL
5b301409e8bc5d7 Patricia Alfonso 2022-07-01  15  /* KASAN_SHADOW_SIZE is the size of total address space divided by 8 */
5b301409e8bc5d7 Patricia Alfonso 2022-07-01  16  #define KASAN_SHADOW_SIZE ((KASAN_HOST_USER_SPACE_END_ADDR + 1) >> \
5b301409e8bc5d7 Patricia Alfonso 2022-07-01  17  			KASAN_SHADOW_SCALE_SHIFT)
5b301409e8bc5d7 Patricia Alfonso 2022-07-01  18  #else
5b301409e8bc5d7 Patricia Alfonso 2022-07-01 @19  #error "KASAN_SHADOW_SIZE is not defined for this sub-architecture"
5b301409e8bc5d7 Patricia Alfonso 2022-07-01  20  #endif /* CONFIG_X86_64 */
5b301409e8bc5d7 Patricia Alfonso 2022-07-01  21  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
