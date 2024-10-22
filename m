Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D3CCDD0CB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 19:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cs/uAzFyIWRJAjBhB2kuu4XNqr/LW1RO5zPjUfCQlXY=; b=Q/IPD2ZfQsH9RN
	UipIMxZcEFkYi9EL1ojH5S3Z8HcDqbxYCYdeQiiIr9pBNH1hWPwnyjjNghb9cFauuymYp6ErWmT5W
	+xB/m20KNk4laJ96ccwYLCdteo9JKQtGTHgLuw8VUozo8O8WmUxbz4luol6Yo2nvo+nbzOPTpqXFM
	wpjf8ZiRIMh22Yo//1v/VWyD15n9/dIDfhmij8AQw9rfAlMgLzMwGyuub168jLMNf692K8AOhuWwZ
	nyORPtUmt8VymTva9eSxM19NSu+d9sAH/Cg8Mb0zgUHQIDoWUl/vLijHiBBfhwpaS3o0sXtSxFWqL
	ZYOeWxqzFVnZaVDbICCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Kaz-0000000BwFU-3AyD;
	Tue, 22 Oct 2024 19:31:09 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Kaw-0000000BwD8-1v3Y;
	Tue, 22 Oct 2024 19:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729625466; x=1761161466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5IQ/ppc7+JlLPx+hkAOzlEt+fDBk4swp5GV5ul9evFw=;
  b=BuZJv+DWWQsIiMzXDThVVuLiou2ktCq6uBysycTmSOX4lE0C07x9T10E
   lTWVqq/lTcjiAdDGw/fgcXMAfuZt37cfl1IoPvsXiKyfzqpRnf4VdRyvU
   dWNu7bTOcLKvXV+99h2ShDaIkAmtIsLRK7SKtxrzrif66+YSNFQ+bU8c1
   Io1MYXZKuDQsdLj7vd8d0jDotZ9qYJDC9bkzcTiKri5wvXGedLYtxZrym
   dtYJ8l6rERSdGiX8/r1UZhPqat8aXC+pAiWKk6a+iaQ2u29GsNQnwClRB
   hD0v4ZkLuXRrTCClP5MhE/a606P7goTNsJLoaWWW8wRWWkOSy/v47avcA
   g==;
X-CSE-ConnectionGUID: 5G0sR3dATTmlZreSaFpzxg==
X-CSE-MsgGUID: WqKs+k5zQmaBFLvpNb1dag==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="29077396"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="29077396"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 12:31:04 -0700
X-CSE-ConnectionGUID: Pwm7nuaRS+OM+Ao/bzXSFQ==
X-CSE-MsgGUID: VwQ5hbwkRxu5oP8/NSHLAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="84759782"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Oct 2024 12:31:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3Kan-000U0d-2J;
	Tue, 22 Oct 2024 19:30:57 +0000
Date: Wed, 23 Oct 2024 03:30:45 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev,
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
Message-ID: <202410230354.sjewoFxA-lkp@intel.com>
References: <20241022015913.3524425-5-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241022015913.3524425-5-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_123106_555694_10FE2A3B 
X-CRM114-Status: GOOD (  12.22  )
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241023/202410230354.sjewoFxA-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230354.sjewoFxA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410230354.sjewoFxA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kasan.h:7,
                    from include/linux/mm.h:31,
                    from arch/sh/kernel/asm-offsets.c:14:
>> include/linux/kasan-tags.h:5:10: fatal error: asm/kasan.h: No such file or directory
       5 | #include <asm/kasan.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:102: arch/sh/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +5 include/linux/kasan-tags.h

     4	
   > 5	#include <asm/kasan.h>
     6	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
