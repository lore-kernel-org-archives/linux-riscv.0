Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B768C04A68
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jul 2022 00:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BxKaR4lWazAZuMBXSbTmTO5AlxheJy0sDIHUfkT6VZQ=; b=s67Bqf62YIRwx/
	ABhb5E8UMj4xKaEQhVPKM04eIsj1SskHHlitakm9LsoPDSD7Yqve1R9mMQIv/7nyJd+vQLwxK6a23
	PLGaoBa4ZMeDTJudQVYakisf0BNPhLUA8lvPEkOFC2EeSdnWy2K0j3L6KwEPVVSEsdZy+OrixFgXL
	+JS/gtw/fn8+4npwIWpP+ieEXTqxVAn3wjUaZSUCo/UuZZ7JPEvbSkZ29R1OTAuzdH9S/jzlBuqVw
	qxspoZ2vNR+X5OiuijHoiXrZJJt8oWizm2F5kv2X57hnPHE7NZhFkBmSmVfRfe8zU3dZslCGzjCsd
	gu2JHFY/Sf94xvJzGPNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGr1f-001kKH-R6; Thu, 28 Jul 2022 00:05:15 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGr1b-001kGj-9z
	for linux-riscv@lists.infradead.org; Thu, 28 Jul 2022 00:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658966711; x=1690502711;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WmEjuSFZahSX7NszEhwt1CcdJvJ9iADss3GKQ2aj9io=;
  b=PXvQv/962n0hYMp6++rWTdnvs9WSgEZ/iq87XkkA6Erg1qU22JeG6Ify
   8TOtkWtawGG+0ogmzIX7hIrRDxR+BlyimN5enlKM3O09NKUGdKSZiaGyf
   xkTxKJsda0VMPlQ2VHv8lL0JfyUBP/cvhf6FkS9R5caTZgIGQUfRFhP8C
   9iSdWdQKtkUj4qdrL8FXstYZ6GsHQpO0p2uNIK/hUG0WAvkqJtXSpHXFj
   Xket8yahdqeUqFnughdBNCY2cdg3RqcdSxwbOkwyvZjXxCY9ojnw+CIRG
   um5lPQvhErXli8eUDFolTIrz5VaIs8O2AzffLAj/FLBubRVi+8AmSmKfa
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="275257641"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="275257641"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2022 17:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="668565341"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Jul 2022 17:05:03 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oGr1T-0009GM-04;
	Thu, 28 Jul 2022 00:05:03 +0000
Date: Thu, 28 Jul 2022 08:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: guoren@kernel.org, palmer@rivosinc.com, heiko@sntech.de,
	hch@infradead.org, arnd@arndb.de, peterz@infradead.org,
	will@kernel.org, boqun.feng@gmail.com, longman@redhat.com,
	mingo@redhat.com, philipp.tomsich@vrull.eu, cmuellner@linux.com,
	linux-kernel@vger.kernel.org, David.Laight@aculab.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V8 07/10] riscv: Add qspinlock support
Message-ID: <202207280822.VHS6qieH-lkp@intel.com>
References: <20220724122517.1019187-8-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220724122517.1019187-8-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_170511_528120_F1CFC58E 
X-CRM114-Status: GOOD (  13.90  )
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

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on arnd-asm-generic/master]
[also build test WARNING on linus/master v5.19-rc8 next-20220727]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/guoren-kernel-org/arch-Add-qspinlock-support-with-combo-style/20220724-202743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
config: riscv-randconfig-r026-20220727 (https://download.01.org/0day-ci/archive/20220728/202207280822.VHS6qieH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8dfaecc4c24494337933aff9d9166486ca0949f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/980c0acb7f432777e3473ab9a5696044e03b3f3d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review guoren-kernel-org/arch-Add-qspinlock-support-with-combo-style/20220724-202743
        git checkout 980c0acb7f432777e3473ab9a5696044e03b3f3d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/wireguard/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireguard/queueing.c:6:
   In file included from drivers/net/wireguard/queueing.h:9:
   In file included from drivers/net/wireguard/peer.h:9:
   In file included from drivers/net/wireguard/device.h:9:
   In file included from drivers/net/wireguard/noise.h:8:
   In file included from drivers/net/wireguard/messages.h:10:
   In file included from include/crypto/chacha20poly1305.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/net/wireguard/queueing.c:6:
   In file included from drivers/net/wireguard/queueing.h:9:
   In file included from drivers/net/wireguard/peer.h:9:
   In file included from drivers/net/wireguard/device.h:9:
   In file included from drivers/net/wireguard/noise.h:8:
   In file included from drivers/net/wireguard/messages.h:10:
   In file included from include/crypto/chacha20poly1305.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/net/wireguard/queueing.c:6:
   In file included from drivers/net/wireguard/queueing.h:9:
   In file included from drivers/net/wireguard/peer.h:9:
   In file included from drivers/net/wireguard/device.h:9:
   In file included from drivers/net/wireguard/noise.h:8:
   In file included from drivers/net/wireguard/messages.h:10:
   In file included from include/crypto/chacha20poly1305.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1107:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/net/wireguard/queueing.c:68:18: warning: cast to smaller integer type 'u32' (aka 'unsigned int') from 'typeof (_x_)' (aka 'struct sk_buff *') [-Wpointer-to-int-cast]
           WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1901:2: note: expanded from macro 'xchg_release'
           arch_xchg_release(__ai_ptr, __VA_ARGS__); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:24:2: note: expanded from macro 'arch_xchg_release'
           __atomic_op_release(arch_xchg, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:68:2: note: expanded from macro '__atomic_op_release'
           op##_relaxed(args);                                             \
           ^~~~~~~~~~~~~~~~~~
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:352:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:340:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:332:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/net/wireguard/queueing.c:68:18: warning: cast to 'typeof (*((__ai_ptr)))' (aka 'struct sk_buff *') from smaller integer type 'unsigned int' [-Wint-to-pointer-cast]
           WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
           ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1901:2: note: expanded from macro 'xchg_release'
           arch_xchg_release(__ai_ptr, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:24:2: note: expanded from macro 'arch_xchg_release'
           __atomic_op_release(arch_xchg, __VA_ARGS__)
           ^
   include/linux/atomic.h:68:2: note: expanded from macro '__atomic_op_release'
           op##_relaxed(args);                                             \
           ^
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:352:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:340:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:332:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/net/wireguard/queueing.c:68:18: warning: cast to smaller integer type 'u32' (aka 'unsigned int') from 'typeof (_x_)' (aka 'struct sk_buff *') [-Wpointer-to-int-cast]
           WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1901:2: note: expanded from macro 'xchg_release'
           arch_xchg_release(__ai_ptr, __VA_ARGS__); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:24:2: note: expanded from macro 'arch_xchg_release'
           __atomic_op_release(arch_xchg, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:68:2: note: expanded from macro '__atomic_op_release'
           op##_relaxed(args);                                             \
           ^~~~~~~~~~~~~~~~~~
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:352:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:340:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:332:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/net/wireguard/queueing.c:68:18: warning: cast to 'typeof (*((__ai_ptr)))' (aka 'struct sk_buff *') from smaller integer type 'unsigned int' [-Wint-to-pointer-cast]
           WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
           ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1901:2: note: expanded from macro 'xchg_release'
           arch_xchg_release(__ai_ptr, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:24:2: note: expanded from macro 'arch_xchg_release'
           __atomic_op_release(arch_xchg, __VA_ARGS__)
           ^
   include/linux/atomic.h:68:2: note: expanded from macro '__atomic_op_release'
           op##_relaxed(args);                                             \
           ^
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:352:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:340:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:332:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/net/wireguard/queueing.c:68:18: warning: cast to smaller integer type 'u32' (aka 'unsigned int') from 'typeof (_x_)' (aka 'struct sk_buff *') [-Wpointer-to-int-cast]
           WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1901:2: note: expanded from macro 'xchg_release'
           arch_xchg_release(__ai_ptr, __VA_ARGS__); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:24:2: note: expanded from macro 'arch_xchg_release'
           __atomic_op_release(arch_xchg, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:68:2: note: expanded from macro '__atomic_op_release'
           op##_relaxed(args);                                             \
           ^~~~~~~~~~~~~~~~~~
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:352:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:340:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:332:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/net/wireguard/queueing.c:68:18: warning: cast to 'typeof (*((__ai_ptr)))' (aka 'struct sk_buff *') from smaller integer type 'unsigned int' [-Wint-to-pointer-cast]
           WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
           ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1901:2: note: expanded from macro 'xchg_release'
           arch_xchg_release(__ai_ptr, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:24:2: note: expanded from macro 'arch_xchg_release'
           __atomic_op_release(arch_xchg, __VA_ARGS__)
           ^
   include/linux/atomic.h:68:2: note: expanded from macro '__atomic_op_release'
           op##_relaxed(args);                                             \
           ^
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:352:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:340:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:332:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/net/wireguard/queueing.c:68:18: warning: cast to smaller integer type 'u32' (aka 'unsigned int') from 'typeof (_x_)' (aka 'struct sk_buff *') [-Wpointer-to-int-cast]
           WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1901:2: note: expanded from macro 'xchg_release'
           arch_xchg_release(__ai_ptr, __VA_ARGS__); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:24:2: note: expanded from macro 'arch_xchg_release'
           __atomic_op_release(arch_xchg, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:68:2: note: expanded from macro '__atomic_op_release'
           op##_relaxed(args);                                             \
           ^~~~~~~~~~~~~~~~~~
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:352:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:340:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:332:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/net/wireguard/queueing.c:68:18: warning: cast to 'typeof (*((__ai_ptr)))' (aka 'struct sk_buff *') from smaller integer type 'unsigned int' [-Wint-to-pointer-cast]
           WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
           ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1901:2: note: expanded from macro 'xchg_release'
           arch_xchg_release(__ai_ptr, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:24:2: note: expanded from macro 'arch_xchg_release'
           __atomic_op_release(arch_xchg, __VA_ARGS__)
           ^
   include/linux/atomic.h:68:2: note: expanded from macro '__atomic_op_release'
           op##_relaxed(args);                                             \
           ^
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:352:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:340:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:332:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/net/wireguard/queueing.c:68:18: warning: cast to smaller integer type 'u32' (aka 'unsigned int') from 'typeof (_x_)' (aka 'struct sk_buff *') [-Wpointer-to-int-cast]
           WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1901:2: note: expanded from macro 'xchg_release'
           arch_xchg_release(__ai_ptr, __VA_ARGS__); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:24:2: note: expanded from macro 'arch_xchg_release'
           __atomic_op_release(arch_xchg, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:68:2: note: expanded from macro '__atomic_op_release'
           op##_relaxed(args);                                             \
           ^~~~~~~~~~~~~~~~~~
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:352:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:340:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:332:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/net/wireguard/queueing.c:68:18: warning: cast to 'typeof (*((__ai_ptr)))' (aka 'struct sk_buff *') from smaller integer type 'unsigned int' [-Wint-to-pointer-cast]
           WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
           ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1901:2: note: expanded from macro 'xchg_release'
           arch_xchg_release(__ai_ptr, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:24:2: note: expanded from macro 'arch_xchg_release'
           __atomic_op_release(arch_xchg, __VA_ARGS__)
           ^
   include/linux/atomic.h:68:2: note: expanded from macro '__atomic_op_release'
           op##_relaxed(args);                                             \
           ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:352:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:340:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:332:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/net/wireguard/queueing.c:68:18: warning: cast to smaller integer type 'u32' (aka 'unsigned int') from 'typeof (_x_)' (aka 'struct sk_buff *') [-Wpointer-to-int-cast]
           WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1901:2: note: expanded from macro 'xchg_release'
           arch_xchg_release(__ai_ptr, __VA_ARGS__); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:24:2: note: expanded from macro 'arch_xchg_release'
           __atomic_op_release(arch_xchg, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:68:2: note: expanded from macro '__atomic_op_release'
           op##_relaxed(args);                                             \
           ^~~~~~~~~~~~~~~~~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/wireguard/queueing.c:49:21: note: expanded from macro 'NEXT'
   #define NEXT(skb) ((skb)->prev)
                       ^~~
   include/asm-generic/rwonce.h:61:15: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
                        ^
   include/asm-generic/rwonce.h:55:20: note: expanded from macro '__WRITE_ONCE'
           *(volatile typeof(x) *)&(x) = (val);                            \
                             ^
>> drivers/net/wireguard/queueing.c:68:18: warning: cast to 'typeof (*((__ai_ptr)))' (aka 'struct sk_buff *') from smaller integer type 'unsigned int' [-Wint-to-pointer-cast]
           WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
           ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1901:2: note: expanded from macro 'xchg_release'
           arch_xchg_release(__ai_ptr, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:24:2: note: expanded from macro 'arch_xchg_release'
           __atomic_op_release(arch_xchg, __VA_ARGS__)
           ^
   include/linux/atomic.h:68:2: note: expanded from macro '__atomic_op_release'
           op##_relaxed(args);                                             \
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/wireguard/queueing.c:49:21: note: expanded from macro 'NEXT'
   #define NEXT(skb) ((skb)->prev)
                       ^
   include/asm-generic/rwonce.h:61:15: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ~~~~~~~~~~~~~^~~~~~~
   include/asm-generic/rwonce.h:55:20: note: expanded from macro '__WRITE_ONCE'
           *(volatile typeof(x) *)&(x) = (val);                            \
                             ^
>> drivers/net/wireguard/queueing.c:68:18: warning: cast to smaller integer type 'u32' (aka 'unsigned int') from 'typeof (_x_)' (aka 'struct sk_buff *') [-Wpointer-to-int-cast]
           WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1901:2: note: expanded from macro 'xchg_release'
           arch_xchg_release(__ai_ptr, __VA_ARGS__); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:24:2: note: expanded from macro 'arch_xchg_release'
           __atomic_op_release(arch_xchg, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:68:2: note: expanded from macro '__atomic_op_release'
           op##_relaxed(args);                                             \
           ^~~~~~~~~~~~~~~~~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/wireguard/queueing.c:49:21: note: expanded from macro 'NEXT'
   #define NEXT(skb) ((skb)->prev)
                       ^~~
   include/asm-generic/rwonce.h:61:15: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
                        ^
   include/asm-generic/rwonce.h:55:27: note: expanded from macro '__WRITE_ONCE'
           *(volatile typeof(x) *)&(x) = (val);                            \
                                    ^
>> drivers/net/wireguard/queueing.c:68:18: warning: cast to 'typeof (*((__ai_ptr)))' (aka 'struct sk_buff *') from smaller integer type 'unsigned int' [-Wint-to-pointer-cast]
           WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
           ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1901:2: note: expanded from macro 'xchg_release'
           arch_xchg_release(__ai_ptr, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:24:2: note: expanded from macro 'arch_xchg_release'
           __atomic_op_release(arch_xchg, __VA_ARGS__)
           ^
   include/linux/atomic.h:68:2: note: expanded from macro '__atomic_op_release'
           op##_relaxed(args);                                             \
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/net/wireguard/queueing.c:49:21: note: expanded from macro 'NEXT'
   #define NEXT(skb) ((skb)->prev)
                       ^
   include/asm-generic/rwonce.h:61:15: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ~~~~~~~~~~~~~^~~~~~~
   include/asm-generic/rwonce.h:55:27: note: expanded from macro '__WRITE_ONCE'
           *(volatile typeof(x) *)&(x) = (val);                            \
                                    ^
   21 warnings generated.


vim +68 drivers/net/wireguard/queueing.c

8b5553ace83cced7 Jason A. Donenfeld 2021-02-22  64  
8b5553ace83cced7 Jason A. Donenfeld 2021-02-22  65  static void __wg_prev_queue_enqueue(struct prev_queue *queue, struct sk_buff *skb)
8b5553ace83cced7 Jason A. Donenfeld 2021-02-22  66  {
8b5553ace83cced7 Jason A. Donenfeld 2021-02-22  67  	WRITE_ONCE(NEXT(skb), NULL);
8b5553ace83cced7 Jason A. Donenfeld 2021-02-22 @68  	WRITE_ONCE(NEXT(xchg_release(&queue->head, skb)), skb);
8b5553ace83cced7 Jason A. Donenfeld 2021-02-22  69  }
8b5553ace83cced7 Jason A. Donenfeld 2021-02-22  70  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
