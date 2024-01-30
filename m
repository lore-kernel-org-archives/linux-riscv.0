Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1752C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 21:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQMIUb7K/+jltwgmTwd0AdGnqpXJNTplJaj8xt6bxFI=; b=KSgxF1lUoicHa5
	kvSnN1/+MTONz+7Hr3JAlQZ2LY//o9jGiDocTFSO4n7oe9+yTi4krk/tBCDQJ/D7PdathD+OqSdln
	NmSt0D25QLAKAP5cVKmyW51P9vAn6EC8rpmds5AA95ds77S7MSkUQGo8CMQ8fNe40BiIPS819vpLU
	nHNnE9d5amvFJOiWTOWyGtAse7+5MdHOrjg4j2aGySffko8azHWKfpvae7z6indw5AGYzs9PFMuTY
	1JYwEzVZ8aqpgkNW3Ljo1mwjH20t1ZyspbmqwaVM8C4bHwEAEH5JjZAxza6885k1o+zoYL47bIRP/
	/3sRQSX8rUc17skgCx0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUvJb-00000000a3N-3KPF;
	Tue, 30 Jan 2024 21:06:43 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUvJZ-00000000a2x-0oVY
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 21:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706648801; x=1738184801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gM2k755jodQt1/XCCpHAG09gohkbqOUKelwFkZoypLo=;
  b=DCLfR4Z9y1DWo9ESMZIqU1oz/W3PhW1uloK0pCCk0F7lcW5Ttd3P2OGF
   XVjv7PImvA3llTbjB9Oslsigj8rLjWFOfViOmEsF+cCvmAFSDRxJ5lkvY
   Jxota14GpNHWC6TJT00dqnsqqfI8TMLCZInbDUtBeIJbE66Azej2rEU4c
   Nu2XRyDtQlJFFpjz2k6Ve9MLIOU2aQ9Cg3lpc3ZadPAYAOi1YgWvuzpgL
   BlBjwSpSU3AcuP7obKcpXEsmLFoMogaLrGr7GvFJ/s1QFL10LiTuiogn/
   gXsi4mJ/GT8eCwrEEfpEir+ZylrW8StdDHhoCSBJlJJ7dR5lJ8+c7yAzJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10788271"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="10788271"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 13:06:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911559025"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="911559025"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Jan 2024 13:06:34 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUvJQ-0000pY-1M;
	Tue, 30 Jan 2024 21:06:32 +0000
Date: Wed, 31 Jan 2024 05:05:35 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Yangyu Chen <cyy@cyyself.name>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH 1/3] riscv: mm: Use hint address in mmap if available
Message-ID: <202401310404.eNJvHoC9-lkp@intel.com>
References: <20240129-use_mmap_hint_address-v1-1-4c74da813ba1@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129-use_mmap_hint_address-v1-1-4c74da813ba1@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_130641_309518_ED702610 
X-CRM114-Status: GOOD (  10.40  )
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

Hi Charlie,

kernel test robot noticed the following build errors:

[auto build test ERROR on 556e2d17cae620d549c5474b1ece053430cd50bc]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/riscv-mm-Use-hint-address-in-mmap-if-available/20240130-084208
base:   556e2d17cae620d549c5474b1ece053430cd50bc
patch link:    https://lore.kernel.org/r/20240129-use_mmap_hint_address-v1-1-4c74da813ba1%40rivosinc.com
patch subject: [PATCH 1/3] riscv: mm: Use hint address in mmap if available
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240131/202401310404.eNJvHoC9-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310404.eNJvHoC9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310404.eNJvHoC9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/irqflags.h:10,
                    from include/linux/irqflags.h:18,
                    from arch/riscv/include/asm/bitops.h:14,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from mm/mmap.c:12:
   mm/mmap.c: In function 'generic_get_unmapped_area':
>> arch/riscv/include/asm/processor.h:28:9: error: expected expression before 'else'
      28 |         else                                                    \
         |         ^~~~
   mm/mmap.c:1703:40: note: in expansion of macro 'arch_get_mmap_end'
    1703 |         const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
         |                                        ^~~~~~~~~~~~~~~~~
   mm/mmap.c: In function 'generic_get_unmapped_area_topdown':
>> arch/riscv/include/asm/processor.h:28:9: error: expected expression before 'else'
      28 |         else                                                    \
         |         ^~~~
   mm/mmap.c:1751:40: note: in expansion of macro 'arch_get_mmap_end'
    1751 |         const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
         |                                        ^~~~~~~~~~~~~~~~~
--
   In file included from arch/riscv/include/asm/irqflags.h:10,
                    from include/linux/irqflags.h:18,
                    from arch/riscv/include/asm/bitops.h:14,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from fs/hugetlbfs/inode.c:12:
   fs/hugetlbfs/inode.c: In function 'hugetlb_get_unmapped_area_bottomup':
>> arch/riscv/include/asm/processor.h:28:9: error: expected expression before 'else'
      28 |         else                                                    \
         |         ^~~~
   fs/hugetlbfs/inode.c:173:27: note: in expansion of macro 'arch_get_mmap_end'
     173 |         info.high_limit = arch_get_mmap_end(addr, len, flags);
         |                           ^~~~~~~~~~~~~~~~~
   fs/hugetlbfs/inode.c: In function 'hugetlb_get_unmapped_area_topdown':
>> arch/riscv/include/asm/processor.h:28:9: error: expected expression before 'else'
      28 |         else                                                    \
         |         ^~~~
   fs/hugetlbfs/inode.c:204:35: note: in expansion of macro 'arch_get_mmap_end'
     204 |                 info.high_limit = arch_get_mmap_end(addr, len, flags);
         |                                   ^~~~~~~~~~~~~~~~~
   fs/hugetlbfs/inode.c: In function 'generic_hugetlb_get_unmapped_area':
>> arch/riscv/include/asm/processor.h:28:9: error: expected expression before 'else'
      28 |         else                                                    \
         |         ^~~~
   fs/hugetlbfs/inode.c:219:40: note: in expansion of macro 'arch_get_mmap_end'
     219 |         const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
         |                                        ^~~~~~~~~~~~~~~~~


vim +/else +28 arch/riscv/include/asm/processor.h

add2cc6b6515f7 Charlie Jenkins 2023-08-09  20  
add2cc6b6515f7 Charlie Jenkins 2023-08-09  21  #define arch_get_mmap_end(addr, len, flags)			\
add2cc6b6515f7 Charlie Jenkins 2023-08-09  22  ({								\
add2cc6b6515f7 Charlie Jenkins 2023-08-09  23  	unsigned long mmap_end;					\
add2cc6b6515f7 Charlie Jenkins 2023-08-09  24  	typeof(addr) _addr = (addr);				\
c5712238cfe3f5 Charlie Jenkins 2024-01-29  25  	if ((_addr) == 0 ||					\
c5712238cfe3f5 Charlie Jenkins 2024-01-29  26  		(IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
c5712238cfe3f5 Charlie Jenkins 2024-01-29  27  		((_addr + len) > BIT(VA_BITS - 1)))		\
add2cc6b6515f7 Charlie Jenkins 2023-08-09 @28  	else							\
c5712238cfe3f5 Charlie Jenkins 2024-01-29  29  		mmap_end = (_addr + len);			\
add2cc6b6515f7 Charlie Jenkins 2023-08-09  30  	mmap_end;						\
add2cc6b6515f7 Charlie Jenkins 2023-08-09  31  })
add2cc6b6515f7 Charlie Jenkins 2023-08-09  32  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
