Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE9CEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 20:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NdDDmCT0UntKw8AkFmVtf0amwfpu2wzVN3Vb+oLJ3ZI=; b=OH8E++bcSp6j/H
	yfAx3jjI6niCmFg0EEGYmt/y4Pi0o8pQyy69ADF0fWkxjxlbdVvv6h9NQ9Ds/Yvdausda+HM482Hm
	V2wZn4STVBXWdGczlSOCimP0UR07wIWoGgmVXXUiXlP7nDk1zPytsQh6/OnGD7VLEYKzo2qdHTGdL
	QnbRNXjFtfUwFfcGqyy6hlcNrFnQu7u2K/Ozbvza8xlv5XBQTxphtp1IrihfKjZz4eVTHSIzyvRv6
	qdlqGk7TCpCQ1A9bJ7oBatZwEbGE5E7m7LvWUhdWmLT2rDOTOgaGrGMJrK0Vu01AJ+pw7nrh7pduJ
	uBXRVBB0KzkTkUvNjGxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC452-00Fckb-1V;
	Wed, 21 Jun 2023 20:05:28 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC44x-00Fcis-22;
	Wed, 21 Jun 2023 20:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687377922; x=1718913922;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aUFm6KPq9IvsRQ99jHoURsxZubS26tpLZrj0RUPfm1A=;
  b=F/EgX5xyb1Q2c6NfG/4SJShvMpEWdT35YzcldViKRv7ECMklW7rrmFz2
   NW4TIeOYeRe0JK2I1z5//whuw9ygELMTLgVwHKsfQF2JZzjJoMijUvxWI
   aGA8UHMQ8NHSoOK0VvE92PYsWQwDw2Y2Dcrg77m5eZ707+jHG8vZCFgSl
   fghXt5h6z0k+hgB+eOSw2c1X3PowUAH5Rpqmzs2gwhwRzkS9Z7o7lZgQK
   HAHme/1G/6i9ulmCUofI4RppPvZ6bxIadfbV2f9tOeaYoCvYdrt2uX8n/
   mPMgVKf+UQtYpU0kuAFRZyaqeIcSZqa7v5pXt7y/5gsCNtZSF2BMvMIsa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="350016592"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="350016592"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 13:05:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="859129494"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="859129494"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Jun 2023 13:05:18 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC44r-00074B-20;
	Wed, 21 Jun 2023 20:05:17 +0000
Date: Thu, 22 Jun 2023 04:04:28 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org, bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH v2 1/2] asm-generic: Unify uapi bitsperlong.h for arm64,
 riscv and loongarch
Message-ID: <202306220334.C80BpATp-lkp@intel.com>
References: <1687336748-4898-2-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1687336748-4898-2-git-send-email-yangtiezhu@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_130523_809499_8373DB63 
X-CRM114-Status: GOOD (  16.25  )
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

Hi Tiezhu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arnd-asm-generic/master]
[also build test WARNING on soc/for-next arm64/for-next/core linus/master v6.4-rc7 next-20230621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tiezhu-Yang/asm-generic-Unify-uapi-bitsperlong-h-for-arm64-riscv-and-loongarch/20230621-172223
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/1687336748-4898-2-git-send-email-yangtiezhu%40loongson.cn
patch subject: [PATCH v2 1/2] asm-generic: Unify uapi bitsperlong.h for arm64, riscv and loongarch
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230622/202306220334.C80BpATp-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220334.C80BpATp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220334.C80BpATp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/kunit/test.c:9:
   In file included from include/kunit/resource.h:12:
   In file included from include/kunit/test.h:12:
   In file included from include/kunit/assert.h:12:
   In file included from include/linux/err.h:5:
   In file included from include/linux/compiler.h:246:
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1:
   In file included from include/asm-generic/rwonce.h:26:
   In file included from include/linux/kasan-checks.h:5:
   In file included from include/linux/types.h:6:
   In file included from include/uapi/linux/types.h:5:
   In file included from ./arch/x86/include/generated/uapi/asm/types.h:1:
   In file included from include/uapi/asm-generic/types.h:7:
   In file included from include/asm-generic/int-ll64.h:11:
   In file included from include/uapi/asm-generic/int-ll64.h:12:
   In file included from arch/x86/include/uapi/asm/bitsperlong.h:11:
   In file included from include/asm-generic/bitsperlong.h:5:
>> include/uapi/asm-generic/bitsperlong.h:13:9: warning: '__BITS_PER_LONG' macro redefined [-Wmacro-redefined]
   #define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
           ^
   arch/x86/include/uapi/asm/bitsperlong.h:6:10: note: previous definition is here
   # define __BITS_PER_LONG 64
            ^
   1 warning generated.
--
>> include/uapi/asm-generic/bitsperlong.h:13:9: warning: '__BITS_PER_LONG' macro redefined [-Wmacro-redefined], err: false
--
   In file included from lib/decompress_inflate.c:21:
   In file included from include/linux/zutil.h:17:
   In file included from include/linux/string.h:5:
   In file included from include/linux/compiler.h:246:
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1:
   In file included from include/asm-generic/rwonce.h:26:
   In file included from include/linux/kasan-checks.h:5:
   In file included from include/linux/types.h:6:
   In file included from include/uapi/linux/types.h:5:
   In file included from ./arch/x86/include/generated/uapi/asm/types.h:1:
   In file included from include/uapi/asm-generic/types.h:7:
   In file included from include/asm-generic/int-ll64.h:11:
   In file included from include/uapi/asm-generic/int-ll64.h:12:
   In file included from arch/x86/include/uapi/asm/bitsperlong.h:11:
   In file included from include/asm-generic/bitsperlong.h:5:
>> include/uapi/asm-generic/bitsperlong.h:13:9: warning: '__BITS_PER_LONG' macro redefined [-Wmacro-redefined]
   #define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
           ^
   arch/x86/include/uapi/asm/bitsperlong.h:6:10: note: previous definition is here
   # define __BITS_PER_LONG 64
            ^
   lib/decompress_inflate.c:42:17: warning: no previous prototype for function '__gunzip' [-Wmissing-prototypes]
   STATIC int INIT __gunzip(unsigned char *buf, long len,
                   ^
   lib/decompress_inflate.c:42:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   STATIC int INIT __gunzip(unsigned char *buf, long len,
          ^
          static 
   2 warnings generated.
--
   In file included from lib/decompress_unxz.c:107:
   In file included from include/linux/decompress/mm.h:79:
   In file included from include/linux/kernel.h:16:
   In file included from include/linux/limits.h:6:
   In file included from include/linux/types.h:6:
   In file included from include/uapi/linux/types.h:5:
   In file included from ./arch/x86/include/generated/uapi/asm/types.h:1:
   In file included from include/uapi/asm-generic/types.h:7:
   In file included from include/asm-generic/int-ll64.h:11:
   In file included from include/uapi/asm-generic/int-ll64.h:12:
   In file included from arch/x86/include/uapi/asm/bitsperlong.h:11:
   In file included from include/asm-generic/bitsperlong.h:5:
>> include/uapi/asm-generic/bitsperlong.h:13:9: warning: '__BITS_PER_LONG' macro redefined [-Wmacro-redefined]
   #define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
           ^
   arch/x86/include/uapi/asm/bitsperlong.h:6:10: note: previous definition is here
   # define __BITS_PER_LONG 64
            ^
   lib/decompress_unxz.c:251:17: warning: no previous prototype for function 'unxz' [-Wmissing-prototypes]
   STATIC int INIT unxz(unsigned char *in, long in_size,
                   ^
   lib/decompress_unxz.c:251:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   STATIC int INIT unxz(unsigned char *in, long in_size,
          ^
          static 
   2 warnings generated.
--
   In file included from lib/decompress_unzstd.c:74:
   In file included from include/linux/decompress/mm.h:79:
   In file included from include/linux/kernel.h:16:
   In file included from include/linux/limits.h:6:
   In file included from include/linux/types.h:6:
   In file included from include/uapi/linux/types.h:5:
   In file included from ./arch/x86/include/generated/uapi/asm/types.h:1:
   In file included from include/uapi/asm-generic/types.h:7:
   In file included from include/asm-generic/int-ll64.h:11:
   In file included from include/uapi/asm-generic/int-ll64.h:12:
   In file included from arch/x86/include/uapi/asm/bitsperlong.h:11:
   In file included from include/asm-generic/bitsperlong.h:5:
>> include/uapi/asm-generic/bitsperlong.h:13:9: warning: '__BITS_PER_LONG' macro redefined [-Wmacro-redefined]
   #define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
           ^
   arch/x86/include/uapi/asm/bitsperlong.h:6:10: note: previous definition is here
   # define __BITS_PER_LONG 64
            ^
   lib/decompress_unzstd.c:331:17: warning: no previous prototype for function 'unzstd' [-Wmissing-prototypes]
   STATIC int INIT unzstd(unsigned char *buf, long len,
                   ^
   lib/decompress_unzstd.c:331:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   STATIC int INIT unzstd(unsigned char *buf, long len,
          ^
          static 
   2 warnings generated.
--
   In file included from lib/maple_tree.c:54:
   In file included from include/linux/maple_tree.h:11:
   In file included from include/linux/kernel.h:16:
   In file included from include/linux/limits.h:6:
   In file included from include/linux/types.h:6:
   In file included from include/uapi/linux/types.h:5:
   In file included from ./arch/x86/include/generated/uapi/asm/types.h:1:
   In file included from include/uapi/asm-generic/types.h:7:
   In file included from include/asm-generic/int-ll64.h:11:
   In file included from include/uapi/asm-generic/int-ll64.h:12:
   In file included from arch/x86/include/uapi/asm/bitsperlong.h:11:
   In file included from include/asm-generic/bitsperlong.h:5:
>> include/uapi/asm-generic/bitsperlong.h:13:9: warning: '__BITS_PER_LONG' macro redefined [-Wmacro-redefined]
   #define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
           ^
   arch/x86/include/uapi/asm/bitsperlong.h:6:10: note: previous definition is here
   # define __BITS_PER_LONG 64
            ^
   lib/maple_tree.c:331:21: warning: unused function 'mte_set_full' [-Wunused-function]
   static inline void *mte_set_full(const struct maple_enode *node)
                       ^
   lib/maple_tree.c:336:21: warning: unused function 'mte_clear_full' [-Wunused-function]
   static inline void *mte_clear_full(const struct maple_enode *node)
                       ^
   lib/maple_tree.c:341:20: warning: unused function 'mte_has_null' [-Wunused-function]
   static inline bool mte_has_null(const struct maple_enode *node)
                      ^
   4 warnings generated.
--
   In file included from lib/radix-tree.c:12:
   In file included from include/linux/bitmap.h:8:
   In file included from include/linux/bitops.h:5:
   In file included from ./arch/x86/include/generated/uapi/asm/types.h:1:
   In file included from include/uapi/asm-generic/types.h:7:
   In file included from include/asm-generic/int-ll64.h:11:
   In file included from include/uapi/asm-generic/int-ll64.h:12:
   In file included from arch/x86/include/uapi/asm/bitsperlong.h:11:
   In file included from include/asm-generic/bitsperlong.h:5:
>> include/uapi/asm-generic/bitsperlong.h:13:9: warning: '__BITS_PER_LONG' macro redefined [-Wmacro-redefined]
   #define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
           ^
   arch/x86/include/uapi/asm/bitsperlong.h:6:10: note: previous definition is here
   # define __BITS_PER_LONG 64
            ^
   lib/radix-tree.c:288:6: warning: no previous prototype for function 'radix_tree_node_rcu_free' [-Wmissing-prototypes]
   void radix_tree_node_rcu_free(struct rcu_head *head)
        ^
   lib/radix-tree.c:288:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void radix_tree_node_rcu_free(struct rcu_head *head)
   ^
   static 
   lib/radix-tree.c:1134:50: warning: parameter 'slot' set but not used [-Wunused-but-set-parameter]
   void __rcu **radix_tree_iter_resume(void __rcu **slot,
                                                    ^
   3 warnings generated.
--
   In file included from lib/zstd/compress/huf_compress.c:23:
   In file included from lib/zstd/compress/../common/zstd_deps.h:29:
   In file included from include/linux/limits.h:6:
   In file included from include/linux/types.h:6:
   In file included from include/uapi/linux/types.h:5:
   In file included from ./arch/x86/include/generated/uapi/asm/types.h:1:
   In file included from include/uapi/asm-generic/types.h:7:
   In file included from include/asm-generic/int-ll64.h:11:
   In file included from include/uapi/asm-generic/int-ll64.h:12:
   In file included from arch/x86/include/uapi/asm/bitsperlong.h:11:
   In file included from include/asm-generic/bitsperlong.h:5:
>> include/uapi/asm-generic/bitsperlong.h:13:9: warning: '__BITS_PER_LONG' macro redefined [-Wmacro-redefined]
   #define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
           ^
   arch/x86/include/uapi/asm/bitsperlong.h:6:10: note: previous definition is here
   # define __BITS_PER_LONG 64
            ^
   lib/zstd/compress/huf_compress.c:471:16: warning: unused function 'HUF_isSorted' [-Wunused-function]
   MEM_STATIC int HUF_isSorted(nodeElt huffNode[], U32 const maxSymbolValue1) {
                  ^
   2 warnings generated.
--
   In file included from lib/zstd/compress/zstd_lazy.c:11:
   In file included from lib/zstd/compress/zstd_compress_internal.h:21:
   In file included from lib/zstd/compress/../common/zstd_internal.h:23:
   In file included from lib/zstd/compress/../common/cpu.h:19:
   In file included from lib/zstd/compress/../common/mem.h:18:
   In file included from ./arch/x86/include/generated/asm/unaligned.h:1:
   In file included from include/asm-generic/unaligned.h:9:
   In file included from include/linux/unaligned/packed_struct.h:4:
   In file included from include/linux/types.h:6:
   In file included from include/uapi/linux/types.h:5:
   In file included from ./arch/x86/include/generated/uapi/asm/types.h:1:
   In file included from include/uapi/asm-generic/types.h:7:
   In file included from include/asm-generic/int-ll64.h:11:
   In file included from include/uapi/asm-generic/int-ll64.h:12:
   In file included from arch/x86/include/uapi/asm/bitsperlong.h:11:
   In file included from include/asm-generic/bitsperlong.h:5:
>> include/uapi/asm-generic/bitsperlong.h:13:9: warning: '__BITS_PER_LONG' macro redefined [-Wmacro-redefined]
   #define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
           ^
   arch/x86/include/uapi/asm/bitsperlong.h:6:10: note: previous definition is here
   # define __BITS_PER_LONG 64
            ^
   lib/zstd/compress/zstd_lazy.c:835:16: warning: unused function 'ZSTD_isAligned' [-Wunused-function]
   MEM_STATIC int ZSTD_isAligned(void const* ptr, size_t align) {
                  ^
   2 warnings generated.
--
   In file included from arch/x86/kernel/cpu/common.c:5:
   In file included from include/linux/memblock.h:11:
   In file included from include/linux/init.h:5:
   In file included from include/linux/build_bug.h:5:
   In file included from include/linux/compiler.h:246:
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1:
   In file included from include/asm-generic/rwonce.h:26:
   In file included from include/linux/kasan-checks.h:5:
   In file included from include/linux/types.h:6:
   In file included from include/uapi/linux/types.h:5:
   In file included from ./arch/x86/include/generated/uapi/asm/types.h:1:
   In file included from include/uapi/asm-generic/types.h:7:
   In file included from include/asm-generic/int-ll64.h:11:
   In file included from include/uapi/asm-generic/int-ll64.h:12:
   In file included from arch/x86/include/uapi/asm/bitsperlong.h:11:
   In file included from include/asm-generic/bitsperlong.h:5:
>> include/uapi/asm-generic/bitsperlong.h:13:9: warning: '__BITS_PER_LONG' macro redefined [-Wmacro-redefined]
   #define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
           ^
   arch/x86/include/uapi/asm/bitsperlong.h:6:10: note: previous definition is here
   # define __BITS_PER_LONG 64
            ^
   arch/x86/kernel/cpu/common.c:366:19: warning: unused function 'flag_is_changeable_p' [-Wunused-function]
   static inline int flag_is_changeable_p(u32 flag)
                     ^
   2 warnings generated.
--
   In file included from lib/mpi/mpi-inv.c:20:
   In file included from lib/mpi/mpi-internal.h:20:
   In file included from include/linux/module.h:12:
   In file included from include/linux/list.h:5:
   In file included from include/linux/container_of.h:5:
   In file included from include/linux/build_bug.h:5:
   In file included from include/linux/compiler.h:246:
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1:
   In file included from include/asm-generic/rwonce.h:26:
   In file included from include/linux/kasan-checks.h:5:
   In file included from include/linux/types.h:6:
   In file included from include/uapi/linux/types.h:5:
   In file included from ./arch/x86/include/generated/uapi/asm/types.h:1:
   In file included from include/uapi/asm-generic/types.h:7:
   In file included from include/asm-generic/int-ll64.h:11:
   In file included from include/uapi/asm-generic/int-ll64.h:12:
   In file included from arch/x86/include/uapi/asm/bitsperlong.h:11:
   In file included from include/asm-generic/bitsperlong.h:5:
>> include/uapi/asm-generic/bitsperlong.h:13:9: warning: '__BITS_PER_LONG' macro redefined [-Wmacro-redefined]
   #define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
           ^
   arch/x86/include/uapi/asm/bitsperlong.h:6:10: note: previous definition is here
   # define __BITS_PER_LONG 64
            ^
   lib/mpi/mpi-inv.c:34:15: warning: variable 'k' set but not used [-Wunused-but-set-variable]
           unsigned int k;
                        ^
   2 warnings generated.
..


vim +/__BITS_PER_LONG +13 include/uapi/asm-generic/bitsperlong.h

     4	
     5	/*
     6	 * In order to keep safe and avoid regression, only unify uapi
     7	 * bitsperlong.h for some archs which are using newer toolchains
     8	 * that have the definitions of __CHAR_BIT__ and __SIZEOF_LONG__.
     9	 * See the following link for more info:
    10	 * https://lore.kernel.org/linux-arch/b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com/
    11	 */
    12	#if defined(__CHAR_BIT__) && defined(__SIZEOF_LONG__)
  > 13	#define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
    14	#else
    15	/*
    16	 * There seems to be no way of detecting this automatically from user
    17	 * space, so 64 bit architectures should override this in their
    18	 * bitsperlong.h. In particular, an architecture that supports
    19	 * both 32 and 64 bit user space must not rely on CONFIG_64BIT
    20	 * to decide it, but rather check a compiler provided macro.
    21	 */
    22	#ifndef __BITS_PER_LONG
    23	#define __BITS_PER_LONG 32
    24	#endif
    25	#endif
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
