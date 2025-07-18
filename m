Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2069EC83F34
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 16:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MX/mHhucn2mFNtLOhFs8qUmNlen5qm98XJENj7J4n+s=; b=c2uoyy34rvKIR9
	yH1A3Q7xMtoYsc5nbPVhF9J89Q40taBVmXx228egdvzi3o4/9XpJXEGKVqp88wYK9VKaBLd4kjJrw
	aE7R/ki83j4C3TwQAyP7EUz47U1S7GSnI7sKDKWDalHM2TxrQLUWU8uGCwEdp/1Oo/3BupcgQH6D9
	h6GpBrUqsgd+3PiOLa7iFA3yBhYaMM9RK3zi2t0SAshg83+CiiUvl9v3eKn+QTOJ/aDw/rTXrwvLP
	/Yhlz4YImccdXYziH8i29sYIHcaT1hlHsmm6PAUiqLRyq9RfQOzjdyapLCuMcw+0sBY+0WLlNFmIv
	PNKn6g69P38D2RuwZI1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucoES-0000000D91f-3mcH;
	Fri, 18 Jul 2025 16:46:48 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucnvv-0000000D5fr-0AGe
	for linux-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 16:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752856059; x=1784392059;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sgPMbwJvnaL1alGhdQ3Wko/dR2pBLFkjVgHr0eRTfR8=;
  b=ItTMp6je2AGZQ1JxUOik04f4iOoLIvS4adJMXt2zrBcJ/F5YvcmxaB3I
   JRM3bgXFlo9Yo4aY76Xq7c7YIgrO03obG4bKKUmH3S4vs1YTYQcfmldmD
   BFFXBY+n0+beHzokSIAAafgxuIqXf8SIRztntgMLbInV9+s3AHrUbDyqt
   GMYFQAtvqbt5PdatCBsg03sgf6IBEOCFElCagY2MpkZV6qAsMjOO+MAt7
   gyiYs6tTLUunm8KX5zNFiLwCvl0mKLPvFMuzWRqrDZufpWgdfWIL04N1z
   w2KbZ/cPFIOp61YurfAk+fACKI5MpSLxVYwQhcLicU5epiE0yLSE5hru5
   A==;
X-CSE-ConnectionGUID: ecVBEShMSl6V1ZF0FhqPgg==
X-CSE-MsgGUID: APQmV4IaQdaWvELz5ZtN1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="55009653"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="55009653"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 09:27:34 -0700
X-CSE-ConnectionGUID: 6So0Y9EzRUmt2UAE95XL+g==
X-CSE-MsgGUID: HlQsLTziQVqSbrkQhss03Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="195228715"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jul 2025 09:27:32 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucnvl-000EqZ-0L;
	Fri, 18 Jul 2025 16:27:29 +0000
Date: Sat, 19 Jul 2025 00:26:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ignacio Encinas <ignacio@iencinas.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ignacio Encinas <ignacio@iencinas.com>
Subject: Re: [PATCH v5] riscv: introduce asm/swab.h
Message-ID: <202507190051.ejnrjSs3-lkp@intel.com>
References: <20250717-riscv-swab-v5-1-1d5bb7c42f38@iencinas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250717-riscv-swab-v5-1-1d5bb7c42f38@iencinas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_092739_150433_3D6224E5 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

Hi Ignacio,

kernel test robot noticed the following build errors:

[auto build test ERROR on 155a3c003e555a7300d156a5252c004c392ec6b0]

url:    https://github.com/intel-lab-lkp/linux/commits/Ignacio-Encinas/riscv-introduce-asm-swab-h/20250718-024715
base:   155a3c003e555a7300d156a5252c004c392ec6b0
patch link:    https://lore.kernel.org/r/20250717-riscv-swab-v5-1-1d5bb7c42f38%40iencinas.com
patch subject: [PATCH v5] riscv: introduce asm/swab.h
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20250719/202507190051.ejnrjSs3-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190051.ejnrjSs3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190051.ejnrjSs3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/decompress_unlzo.c:28:
   In file included from include/linux/decompress/mm.h:79:
   In file included from include/linux/kernel.h:23:
   In file included from include/linux/bitops.h:28:
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
   In file included from arch/riscv/include/asm/barrier.h:14:
   In file included from arch/riscv/include/asm/cmpxchg.h:9:
   In file included from include/linux/bug.h:5:
   In file included from arch/riscv/include/asm/bug.h:83:
   In file included from include/asm-generic/bug.h:22:
   In file included from include/linux/printk.h:9:
   In file included from include/linux/ratelimit_types.h:7:
   In file included from include/linux/spinlock_types_raw.h:7:
   In file included from ./arch/riscv/include/generated/asm/spinlock_types.h:1:
   In file included from include/asm-generic/spinlock_types.h:7:
   In file included from include/asm-generic/qrwlock_types.h:6:
   In file included from arch/riscv/include/uapi/asm/byteorder.h:10:
   In file included from include/linux/byteorder/little_endian.h:5:
   In file included from include/uapi/linux/byteorder/little_endian.h:14:
   In file included from include/linux/swab.h:5:
   In file included from include/uapi/linux/swab.h:8:
   arch/riscv/include/asm/swab.h:53:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return ARCH_SWAB(16, value);
                  ^
   arch/riscv/include/asm/swab.h:40:11: note: expanded from macro 'ARCH_SWAB'
                                 ".option arch,+zbb\n"                     \
                                  ^
   <inline asm>:2:9: note: instantiated into assembly here
   .option arch,+zbb
           ^
   In file included from lib/decompress_unlzo.c:28:
   In file included from include/linux/decompress/mm.h:79:
   In file included from include/linux/kernel.h:23:
   In file included from include/linux/bitops.h:28:
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
   In file included from arch/riscv/include/asm/barrier.h:14:
   In file included from arch/riscv/include/asm/cmpxchg.h:9:
   In file included from include/linux/bug.h:5:
   In file included from arch/riscv/include/asm/bug.h:83:
   In file included from include/asm-generic/bug.h:22:
   In file included from include/linux/printk.h:9:
   In file included from include/linux/ratelimit_types.h:7:
   In file included from include/linux/spinlock_types_raw.h:7:
   In file included from ./arch/riscv/include/generated/asm/spinlock_types.h:1:
   In file included from include/asm-generic/spinlock_types.h:7:
   In file included from include/asm-generic/qrwlock_types.h:6:
   In file included from arch/riscv/include/uapi/asm/byteorder.h:10:
   In file included from include/linux/byteorder/little_endian.h:5:
   In file included from include/uapi/linux/byteorder/little_endian.h:14:
   In file included from include/linux/swab.h:5:
   In file included from include/uapi/linux/swab.h:8:
>> arch/riscv/include/asm/swab.h:53:9: error: instruction requires the following: 'Zbb' (Basic Bit-Manipulation) or 'Zbkb' (Bitmanip instructions for Cryptography)
           return ARCH_SWAB(16, value);
                  ^
   arch/riscv/include/asm/swab.h:41:11: note: expanded from macro 'ARCH_SWAB'
                                 "rev8 %0, %1\n"                           \
                                  ^
   <inline asm>:3:1: note: instantiated into assembly here
   rev8 a0, s1
   ^
   In file included from lib/decompress_unlzo.c:28:
   In file included from include/linux/decompress/mm.h:79:
   In file included from include/linux/kernel.h:23:
   In file included from include/linux/bitops.h:28:
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
   In file included from arch/riscv/include/asm/barrier.h:14:
   In file included from arch/riscv/include/asm/cmpxchg.h:9:
   In file included from include/linux/bug.h:5:
   In file included from arch/riscv/include/asm/bug.h:83:
   In file included from include/asm-generic/bug.h:22:
   In file included from include/linux/printk.h:9:
   In file included from include/linux/ratelimit_types.h:7:
   In file included from include/linux/spinlock_types_raw.h:7:
   In file included from ./arch/riscv/include/generated/asm/spinlock_types.h:1:
   In file included from include/asm-generic/spinlock_types.h:7:
   In file included from include/asm-generic/qrwlock_types.h:6:
   In file included from arch/riscv/include/uapi/asm/byteorder.h:10:
   In file included from include/linux/byteorder/little_endian.h:5:
   In file included from include/uapi/linux/byteorder/little_endian.h:14:
   In file included from include/linux/swab.h:5:
   In file included from include/uapi/linux/swab.h:8:
   arch/riscv/include/asm/swab.h:58:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return ARCH_SWAB(32, value);
                  ^
   arch/riscv/include/asm/swab.h:40:11: note: expanded from macro 'ARCH_SWAB'
                                 ".option arch,+zbb\n"                     \
                                  ^
   <inline asm>:2:9: note: instantiated into assembly here
   .option arch,+zbb
           ^
   In file included from lib/decompress_unlzo.c:28:
   In file included from include/linux/decompress/mm.h:79:
   In file included from include/linux/kernel.h:23:
   In file included from include/linux/bitops.h:28:
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
   In file included from arch/riscv/include/asm/barrier.h:14:
   In file included from arch/riscv/include/asm/cmpxchg.h:9:
   In file included from include/linux/bug.h:5:
   In file included from arch/riscv/include/asm/bug.h:83:
   In file included from include/asm-generic/bug.h:22:
   In file included from include/linux/printk.h:9:
   In file included from include/linux/ratelimit_types.h:7:
   In file included from include/linux/spinlock_types_raw.h:7:
   In file included from ./arch/riscv/include/generated/asm/spinlock_types.h:1:
   In file included from include/asm-generic/spinlock_types.h:7:
   In file included from include/asm-generic/qrwlock_types.h:6:
   In file included from arch/riscv/include/uapi/asm/byteorder.h:10:
   In file included from include/linux/byteorder/little_endian.h:5:
   In file included from include/uapi/linux/byteorder/little_endian.h:14:
   In file included from include/linux/swab.h:5:
   In file included from include/uapi/linux/swab.h:8:
   arch/riscv/include/asm/swab.h:58:9: error: instruction requires the following: 'Zbb' (Basic Bit-Manipulation) or 'Zbkb' (Bitmanip instructions for Cryptography)
           return ARCH_SWAB(32, value);
                  ^
   arch/riscv/include/asm/swab.h:41:11: note: expanded from macro 'ARCH_SWAB'
                                 "rev8 %0, %1\n"                           \
                                  ^
   <inline asm>:3:1: note: instantiated into assembly here
   rev8 a0, s1
   ^
   In file included from lib/decompress_unlzo.c:28:
   In file included from include/linux/decompress/mm.h:79:
   In file included from include/linux/kernel.h:23:
   In file included from include/linux/bitops.h:28:
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
   In file included from arch/riscv/include/asm/barrier.h:14:
   In file included from arch/riscv/include/asm/cmpxchg.h:9:
   In file included from include/linux/bug.h:5:
   In file included from arch/riscv/include/asm/bug.h:83:
   In file included from include/asm-generic/bug.h:22:
   In file included from include/linux/printk.h:9:
   In file included from include/linux/ratelimit_types.h:7:
   In file included from include/linux/spinlock_types_raw.h:7:
   In file included from ./arch/riscv/include/generated/asm/spinlock_types.h:1:
   In file included from include/asm-generic/spinlock_types.h:7:
   In file included from include/asm-generic/qrwlock_types.h:6:
   In file included from arch/riscv/include/uapi/asm/byteorder.h:10:
   In file included from include/linux/byteorder/little_endian.h:5:
   In file included from include/uapi/linux/byteorder/little_endian.h:14:
   In file included from include/linux/swab.h:5:
   In file included from include/uapi/linux/swab.h:8:
   arch/riscv/include/asm/swab.h:58:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return ARCH_SWAB(32, value);
                  ^
   arch/riscv/include/asm/swab.h:40:11: note: expanded from macro 'ARCH_SWAB'
                                 ".option arch,+zbb\n"                     \
                                  ^
   <inline asm>:2:9: note: instantiated into assembly here
   .option arch,+zbb
           ^
   In file included from lib/decompress_unlzo.c:28:
   In file included from include/linux/decompress/mm.h:79:
--
   In file included from include/linux/ratelimit_types.h:7:
   In file included from include/linux/spinlock_types_raw.h:7:
   In file included from ./arch/riscv/include/generated/asm/spinlock_types.h:1:
   In file included from include/asm-generic/spinlock_types.h:7:
   In file included from include/asm-generic/qrwlock_types.h:6:
   In file included from arch/riscv/include/uapi/asm/byteorder.h:10:
   In file included from include/linux/byteorder/little_endian.h:5:
   In file included from include/uapi/linux/byteorder/little_endian.h:14:
   In file included from include/linux/swab.h:5:
   In file included from include/uapi/linux/swab.h:8:
   arch/riscv/include/asm/swab.h:58:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return ARCH_SWAB(32, value);
                  ^
   arch/riscv/include/asm/swab.h:40:11: note: expanded from macro 'ARCH_SWAB'
                                 ".option arch,+zbb\n"                     \
                                  ^
   <inline asm>:2:9: note: instantiated into assembly here
   .option arch,+zbb
           ^
   In file included from lib/vsprintf.c:22:
   In file included from include/linux/clk.h:13:
   In file included from include/linux/kernel.h:23:
   In file included from include/linux/bitops.h:28:
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
   In file included from arch/riscv/include/asm/barrier.h:14:
   In file included from arch/riscv/include/asm/cmpxchg.h:9:
   In file included from include/linux/bug.h:5:
   In file included from arch/riscv/include/asm/bug.h:83:
   In file included from include/asm-generic/bug.h:22:
   In file included from include/linux/printk.h:9:
   In file included from include/linux/ratelimit_types.h:7:
   In file included from include/linux/spinlock_types_raw.h:7:
   In file included from ./arch/riscv/include/generated/asm/spinlock_types.h:1:
   In file included from include/asm-generic/spinlock_types.h:7:
   In file included from include/asm-generic/qrwlock_types.h:6:
   In file included from arch/riscv/include/uapi/asm/byteorder.h:10:
   In file included from include/linux/byteorder/little_endian.h:5:
   In file included from include/uapi/linux/byteorder/little_endian.h:14:
   In file included from include/linux/swab.h:5:
   In file included from include/uapi/linux/swab.h:8:
   arch/riscv/include/asm/swab.h:58:9: error: instruction requires the following: 'Zbb' (Basic Bit-Manipulation) or 'Zbkb' (Bitmanip instructions for Cryptography)
           return ARCH_SWAB(32, value);
                  ^
   arch/riscv/include/asm/swab.h:41:11: note: expanded from macro 'ARCH_SWAB'
                                 "rev8 %0, %1\n"                           \
                                  ^
   <inline asm>:3:1: note: instantiated into assembly here
   rev8 a0, s7
   ^
   In file included from lib/vsprintf.c:22:
   In file included from include/linux/clk.h:13:
   In file included from include/linux/kernel.h:23:
   In file included from include/linux/bitops.h:28:
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
   In file included from arch/riscv/include/asm/barrier.h:14:
   In file included from arch/riscv/include/asm/cmpxchg.h:9:
   In file included from include/linux/bug.h:5:
   In file included from arch/riscv/include/asm/bug.h:83:
   In file included from include/asm-generic/bug.h:22:
   In file included from include/linux/printk.h:9:
   In file included from include/linux/ratelimit_types.h:7:
   In file included from include/linux/spinlock_types_raw.h:7:
   In file included from ./arch/riscv/include/generated/asm/spinlock_types.h:1:
   In file included from include/asm-generic/spinlock_types.h:7:
   In file included from include/asm-generic/qrwlock_types.h:6:
   In file included from arch/riscv/include/uapi/asm/byteorder.h:10:
   In file included from include/linux/byteorder/little_endian.h:5:
   In file included from include/uapi/linux/byteorder/little_endian.h:14:
   In file included from include/linux/swab.h:5:
   In file included from include/uapi/linux/swab.h:8:
   arch/riscv/include/asm/swab.h:53:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return ARCH_SWAB(16, value);
                  ^
   arch/riscv/include/asm/swab.h:40:11: note: expanded from macro 'ARCH_SWAB'
                                 ".option arch,+zbb\n"                     \
                                  ^
   <inline asm>:2:9: note: instantiated into assembly here
   .option arch,+zbb
           ^
   In file included from lib/vsprintf.c:22:
   In file included from include/linux/clk.h:13:
   In file included from include/linux/kernel.h:23:
   In file included from include/linux/bitops.h:28:
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
   In file included from arch/riscv/include/asm/barrier.h:14:
   In file included from arch/riscv/include/asm/cmpxchg.h:9:
   In file included from include/linux/bug.h:5:
   In file included from arch/riscv/include/asm/bug.h:83:
   In file included from include/asm-generic/bug.h:22:
   In file included from include/linux/printk.h:9:
   In file included from include/linux/ratelimit_types.h:7:
   In file included from include/linux/spinlock_types_raw.h:7:
   In file included from ./arch/riscv/include/generated/asm/spinlock_types.h:1:
   In file included from include/asm-generic/spinlock_types.h:7:
   In file included from include/asm-generic/qrwlock_types.h:6:
   In file included from arch/riscv/include/uapi/asm/byteorder.h:10:
   In file included from include/linux/byteorder/little_endian.h:5:
   In file included from include/uapi/linux/byteorder/little_endian.h:14:
   In file included from include/linux/swab.h:5:
   In file included from include/uapi/linux/swab.h:8:
>> arch/riscv/include/asm/swab.h:53:9: error: instruction requires the following: 'Zbb' (Basic Bit-Manipulation) or 'Zbkb' (Bitmanip instructions for Cryptography)
           return ARCH_SWAB(16, value);
                  ^
   arch/riscv/include/asm/swab.h:41:11: note: expanded from macro 'ARCH_SWAB'
                                 "rev8 %0, %1\n"                           \
                                  ^
   <inline asm>:3:1: note: instantiated into assembly here
   rev8 a0, s2
   ^
   In file included from lib/vsprintf.c:22:
   In file included from include/linux/clk.h:13:
   In file included from include/linux/kernel.h:23:
   In file included from include/linux/bitops.h:28:
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
   In file included from arch/riscv/include/asm/barrier.h:14:
   In file included from arch/riscv/include/asm/cmpxchg.h:9:
   In file included from include/linux/bug.h:5:
   In file included from arch/riscv/include/asm/bug.h:83:
   In file included from include/asm-generic/bug.h:22:
   In file included from include/linux/printk.h:9:
   In file included from include/linux/ratelimit_types.h:7:
   In file included from include/linux/spinlock_types_raw.h:7:
   In file included from ./arch/riscv/include/generated/asm/spinlock_types.h:1:
   In file included from include/asm-generic/spinlock_types.h:7:
   In file included from include/asm-generic/qrwlock_types.h:6:
   In file included from arch/riscv/include/uapi/asm/byteorder.h:10:
   In file included from include/linux/byteorder/little_endian.h:5:
   In file included from include/uapi/linux/byteorder/little_endian.h:14:
   In file included from include/linux/swab.h:5:
   In file included from include/uapi/linux/swab.h:8:
   arch/riscv/include/asm/swab.h:53:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return ARCH_SWAB(16, value);
                  ^
   arch/riscv/include/asm/swab.h:40:11: note: expanded from macro 'ARCH_SWAB'
                                 ".option arch,+zbb\n"                     \
                                  ^
   <inline asm>:2:9: note: instantiated into assembly here
   .option arch,+zbb
           ^
   In file included from lib/vsprintf.c:22:
   In file included from include/linux/clk.h:13:
   In file included from include/linux/kernel.h:23:
   In file included from include/linux/bitops.h:28:
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
   In file included from arch/riscv/include/asm/barrier.h:14:
   In file included from arch/riscv/include/asm/cmpxchg.h:9:
   In file included from include/linux/bug.h:5:
   In file included from arch/riscv/include/asm/bug.h:83:
   In file included from include/asm-generic/bug.h:22:
   In file included from include/linux/printk.h:9:
   In file included from include/linux/ratelimit_types.h:7:
   In file included from include/linux/spinlock_types_raw.h:7:
   In file included from ./arch/riscv/include/generated/asm/spinlock_types.h:1:
   In file included from include/asm-generic/spinlock_types.h:7:
   In file included from include/asm-generic/qrwlock_types.h:6:
   In file included from arch/riscv/include/uapi/asm/byteorder.h:10:
   In file included from include/linux/byteorder/little_endian.h:5:
   In file included from include/uapi/linux/byteorder/little_endian.h:14:
   In file included from include/linux/swab.h:5:
   In file included from include/uapi/linux/swab.h:8:
>> arch/riscv/include/asm/swab.h:53:9: error: instruction requires the following: 'Zbb' (Basic Bit-Manipulation) or 'Zbkb' (Bitmanip instructions for Cryptography)
           return ARCH_SWAB(16, value);
                  ^
   arch/riscv/include/asm/swab.h:41:11: note: expanded from macro 'ARCH_SWAB'
                                 "rev8 %0, %1\n"                           \
                                  ^
   <inline asm>:3:1: note: instantiated into assembly here
   rev8 a0, s2
   ^
   In file included from lib/vsprintf.c:22:
   In file included from include/linux/clk.h:13:
   In file included from include/linux/kernel.h:23:
   In file included from include/linux/bitops.h:28:
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
   In file included from arch/riscv/include/asm/barrier.h:14:
   In file included from arch/riscv/include/asm/cmpxchg.h:9:
   In file included from include/linux/bug.h:5:
   In file included from arch/riscv/include/asm/bug.h:83:
   In file included from include/asm-generic/bug.h:22:
   In file included from include/linux/printk.h:9:
   In file included from include/linux/ratelimit_types.h:7:
   In file included from include/linux/spinlock_types_raw.h:7:
   In file included from ./arch/riscv/include/generated/asm/spinlock_types.h:1:
   In file included from include/asm-generic/spinlock_types.h:7:
   In file included from include/asm-generic/qrwlock_types.h:6:
   In file included from arch/riscv/include/uapi/asm/byteorder.h:10:
   In file included from include/linux/byteorder/little_endian.h:5:
   In file included from include/uapi/linux/byteorder/little_endian.h:14:
   In file included from include/linux/swab.h:5:
   In file included from include/uapi/linux/swab.h:8:
   arch/riscv/include/asm/swab.h:58:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return ARCH_SWAB(32, value);
                  ^
   arch/riscv/include/asm/swab.h:40:11: note: expanded from macro 'ARCH_SWAB'
                                 ".option arch,+zbb\n"                     \
                                  ^
   <inline asm>:2:9: note: instantiated into assembly here
   .option arch,+zbb
           ^
   In file included from lib/vsprintf.c:22:
   In file included from include/linux/clk.h:13:
   In file included from include/linux/kernel.h:23:
   In file included from include/linux/bitops.h:28:
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
   In file included from arch/riscv/include/asm/barrier.h:14:
   In file included from arch/riscv/include/asm/cmpxchg.h:9:
   In file included from include/linux/bug.h:5:
   In file included from arch/riscv/include/asm/bug.h:83:
   In file included from include/asm-generic/bug.h:22:
   In file included from include/linux/printk.h:9:
   In file included from include/linux/ratelimit_types.h:7:
   In file included from include/linux/spinlock_types_raw.h:7:
   In file included from ./arch/riscv/include/generated/asm/spinlock_types.h:1:
   In file included from include/asm-generic/spinlock_types.h:7:
   In file included from include/asm-generic/qrwlock_types.h:6:
   In file included from arch/riscv/include/uapi/asm/byteorder.h:10:
   In file included from include/linux/byteorder/little_endian.h:5:
   In file included from include/uapi/linux/byteorder/little_endian.h:14:
   In file included from include/linux/swab.h:5:
   In file included from include/uapi/linux/swab.h:8:
   arch/riscv/include/asm/swab.h:58:9: error: instruction requires the following: 'Zbb' (Basic Bit-Manipulation) or 'Zbkb' (Bitmanip instructions for Cryptography)
           return ARCH_SWAB(32, value);
                  ^
   arch/riscv/include/asm/swab.h:41:11: note: expanded from macro 'ARCH_SWAB'
                                 "rev8 %0, %1\n"                           \
                                  ^
   <inline asm>:3:1: note: instantiated into assembly here
   rev8 a0, s1
   ^
   In file included from lib/vsprintf.c:22:
   In file included from include/linux/clk.h:13:
   In file included from include/linux/kernel.h:23:
   In file included from include/linux/bitops.h:28:
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
   In file included from arch/riscv/include/asm/barrier.h:14:
   In file included from arch/riscv/include/asm/cmpxchg.h:9:
   In file included from include/linux/bug.h:5:
   In file included from arch/riscv/include/asm/bug.h:83:
   In file included from include/asm-generic/bug.h:22:
   In file included from include/linux/printk.h:9:
   In file included from include/linux/ratelimit_types.h:7:
   In file included from include/linux/spinlock_types_raw.h:7:
   In file included from ./arch/riscv/include/generated/asm/spinlock_types.h:1:
   In file included from include/asm-generic/spinlock_types.h:7:
   In file included from include/asm-generic/qrwlock_types.h:6:
   In file included from arch/riscv/include/uapi/asm/byteorder.h:10:
   In file included from include/linux/byteorder/little_endian.h:5:
   In file included from include/uapi/linux/byteorder/little_endian.h:14:
   In file included from include/linux/swab.h:5:
   In file included from include/uapi/linux/swab.h:8:
   arch/riscv/include/asm/swab.h:53:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return ARCH_SWAB(16, value);
                  ^
   arch/riscv/include/asm/swab.h:40:11: note: expanded from macro 'ARCH_SWAB'
                                 ".option arch,+zbb\n"                     \
                                  ^
   <inline asm>:2:9: note: instantiated into assembly here
   .option arch,+zbb
           ^
   In file included from lib/vsprintf.c:22:
   In file included from include/linux/clk.h:13:
   In file included from include/linux/kernel.h:23:
   In file included from include/linux/bitops.h:28:
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
   In file included from arch/riscv/include/asm/barrier.h:14:
   In file included from arch/riscv/include/asm/cmpxchg.h:9:
   In file included from include/linux/bug.h:5:
   In file included from arch/riscv/include/asm/bug.h:83:
   In file included from include/asm-generic/bug.h:22:
   In file included from include/linux/printk.h:9:
   In file included from include/linux/ratelimit_types.h:7:
   In file included from include/linux/spinlock_types_raw.h:7:
   In file included from ./arch/riscv/include/generated/asm/spinlock_types.h:1:
   In file included from include/asm-generic/spinlock_types.h:7:
   In file included from include/asm-generic/qrwlock_types.h:6:
   In file included from arch/riscv/include/uapi/asm/byteorder.h:10:
   In file included from include/linux/byteorder/little_endian.h:5:
   In file included from include/uapi/linux/byteorder/little_endian.h:14:
   In file included from include/linux/swab.h:5:
   In file included from include/uapi/linux/swab.h:8:
>> arch/riscv/include/asm/swab.h:53:9: error: instruction requires the following: 'Zbb' (Basic Bit-Manipulation) or 'Zbkb' (Bitmanip instructions for Cryptography)
           return ARCH_SWAB(16, value);
                  ^
   arch/riscv/include/asm/swab.h:41:11: note: expanded from macro 'ARCH_SWAB'
                                 "rev8 %0, %1\n"                           \
                                  ^
   <inline asm>:3:1: note: instantiated into assembly here
   rev8 s1, s1
   ^
   7 warnings and 7 errors generated.
..


vim +53 arch/riscv/include/asm/swab.h

    50	
    51	static __always_inline __u16 __arch_swab16(__u16 value)
    52	{
  > 53		return ARCH_SWAB(16, value);
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
