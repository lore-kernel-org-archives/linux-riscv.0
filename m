Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D75E7D271
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 09:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3QqhLLkIrvv4jQeroy9SN4cf2w70AShByoC8bNquN94=; b=AJJ5ZUdTfhFWc4
	GdVAMzFFkBWt97MegTXiXnFt6NxdpEDXi7iwH8f2RuyUWZ2DIg46Unl7HuU8r/CYlQH1VnvpYXjO1
	ONJ2gu+d0RTO4balKCRahZqbVqoqX+bqKyJSEaP2oWVDGvuS2XF11ZnoMZ9MQ1XdRS+8ETCL5CpJO
	Pd1ERQHPEhXGSEL1DC3RqfnrHu3dZSPoQaHvb0cw2Ij60unuHfy3LcXHFR8InvFVAzGqz0pqsQJJq
	fHmXc8yabCylu3SonhhYKCercA6/YcLn6oO40ahTKm0PyUFuAo4nHPO3NND6tfPocl6EHAJx3Da/f
	X5bsp+VjyPV1IgjL1tzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4Wk-00FzBb-2k;
	Tue, 26 Sep 2023 09:38:46 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4Wh-00Fz8z-1p
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 09:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695721123; x=1727257123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D6J5R/1H9NYmwj1HBb/6nCFtRveDV5ws9Ss+Z61Hsv4=;
  b=SWcNJ2+XF6d3nEB0mPf+3yFGrik6yA5YHXeHG3+3B2B/E/Dy7iotwRdG
   5k3DdIgmT92eU006og4YCJ7J3OynrJBQcX9gJDUYvoNeTM3XiYKhIDdKP
   UsoHvmhqo6mULzBOZ5Vb8QNV7hi8PlkR5bqgxSSJ9a8fH0BCo+aXxiAwb
   DxNKl/+quCeTc+kdoPCFjB2NB5tkWoaMVN+Jz5+8VGSTUwTq4b4zDzabQ
   LoCXqX2MPxAy9hxJ5jQDP/Ihdrp2sj1qASwBtiZgiHCe6jtW69lGH/I84
   Tl2MVoHDclKpESPQshV4o4KynMkcE4vzrVPKi7IgkllNVpoXhHJ2dGUdZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="361773058"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="361773058"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 02:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="995767959"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="995767959"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by fmsmga006.fm.intel.com with ESMTP; 26 Sep 2023 02:38:40 -0700
From: Xiao Wang <xiao.w.wang@intel.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org
Cc: anup@brainfault.org,
	haicheng.li@intel.com,
	ajones@ventanamicro.com,
	yujie.liu@intel.com,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH v3 2/2] riscv: Optimize bitops with Zbb extension
Date: Tue, 26 Sep 2023 17:46:55 +0800
Message-Id: <20230926094655.3102758-3-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230926094655.3102758-1-xiao.w.wang@intel.com>
References: <20230926094655.3102758-1-xiao.w.wang@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_023843_623483_FAE9AB0C 
X-CRM114-Status: GOOD (  19.23  )
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

This patch leverages the alternative mechanism to dynamically optimize
bitops (including __ffs, __fls, ffs, fls) with Zbb instructions. When
Zbb ext is not supported by the runtime CPU, legacy implementation is
used. If Zbb is supported, then the optimized variants will be selected
via alternative patching.

The legacy bitops support is taken from the generic C implementation as
fallback.

If the parameter is a build-time constant, we leverage compiler builtin to
calculate the result directly, this approach is inspired by x86 bitops
implementation.

EFI stub runs before the kernel, so alternative mechanism should not be
used there, this patch introduces a macro NO_ALTERNATIVE for this purpose.

Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
---
 arch/riscv/include/asm/bitops.h       | 266 +++++++++++++++++++++++++-
 drivers/firmware/efi/libstub/Makefile |   2 +-
 2 files changed, 264 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index 3540b690944b..c97e774cb647 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -15,13 +15,273 @@
 #include <asm/barrier.h>
 #include <asm/bitsperlong.h>
 
+#if !defined(CONFIG_RISCV_ISA_ZBB) || defined(NO_ALTERNATIVE)
 #include <asm-generic/bitops/__ffs.h>
-#include <asm-generic/bitops/ffz.h>
-#include <asm-generic/bitops/fls.h>
 #include <asm-generic/bitops/__fls.h>
+#include <asm-generic/bitops/ffs.h>
+#include <asm-generic/bitops/fls.h>
+
+#else
+#include <asm/alternative-macros.h>
+#include <asm/hwcap.h>
+
+#if (BITS_PER_LONG == 64)
+#define CTZW	"ctzw "
+#define CLZW	"clzw "
+#elif (BITS_PER_LONG == 32)
+#define CTZW	"ctz "
+#define CLZW	"clz "
+#else
+#error "Unexpected BITS_PER_LONG"
+#endif
+
+static __always_inline unsigned long variable__ffs(unsigned long word)
+{
+	int num;
+
+	asm_volatile_goto(
+		ALTERNATIVE("j %l[legacy]", "nop", 0, RISCV_ISA_EXT_ZBB, 1)
+		: : : : legacy);
+
+	asm volatile (
+		".option push\n"
+		".option arch,+zbb\n"
+		"ctz %0, %1\n"
+		".option pop\n"
+		: "=r" (word) : "r" (word) :);
+
+	return word;
+
+legacy:
+	num = 0;
+#if BITS_PER_LONG == 64
+	if ((word & 0xffffffff) == 0) {
+		num += 32;
+		word >>= 32;
+	}
+#endif
+	if ((word & 0xffff) == 0) {
+		num += 16;
+		word >>= 16;
+	}
+	if ((word & 0xff) == 0) {
+		num += 8;
+		word >>= 8;
+	}
+	if ((word & 0xf) == 0) {
+		num += 4;
+		word >>= 4;
+	}
+	if ((word & 0x3) == 0) {
+		num += 2;
+		word >>= 2;
+	}
+	if ((word & 0x1) == 0)
+		num += 1;
+	return num;
+}
+
+/**
+ * __ffs - find first set bit in a long word
+ * @word: The word to search
+ *
+ * Undefined if no set bit exists, so code should check against 0 first.
+ */
+#define __ffs(word)				\
+	(__builtin_constant_p(word) ?		\
+	 (unsigned long)__builtin_ctzl(word) :	\
+	 variable__ffs(word))
+
+static __always_inline unsigned long variable__fls(unsigned long word)
+{
+	int num;
+
+	asm_volatile_goto(
+		ALTERNATIVE("j %l[legacy]", "nop", 0, RISCV_ISA_EXT_ZBB, 1)
+		: : : : legacy);
+
+	asm volatile (
+		".option push\n"
+		".option arch,+zbb\n"
+		"clz %0, %1\n"
+		".option pop\n"
+		: "=r" (word) : "r" (word) :);
+
+	return BITS_PER_LONG - 1 - word;
+
+legacy:
+	num = BITS_PER_LONG - 1;
+#if BITS_PER_LONG == 64
+	if (!(word & (~0ul << 32))) {
+		num -= 32;
+		word <<= 32;
+	}
+#endif
+	if (!(word & (~0ul << (BITS_PER_LONG-16)))) {
+		num -= 16;
+		word <<= 16;
+	}
+	if (!(word & (~0ul << (BITS_PER_LONG-8)))) {
+		num -= 8;
+		word <<= 8;
+	}
+	if (!(word & (~0ul << (BITS_PER_LONG-4)))) {
+		num -= 4;
+		word <<= 4;
+	}
+	if (!(word & (~0ul << (BITS_PER_LONG-2)))) {
+		num -= 2;
+		word <<= 2;
+	}
+	if (!(word & (~0ul << (BITS_PER_LONG-1))))
+		num -= 1;
+	return num;
+}
+
+/**
+ * __fls - find last set bit in a long word
+ * @word: the word to search
+ *
+ * Undefined if no set bit exists, so code should check against 0 first.
+ */
+#define __fls(word)							\
+	(__builtin_constant_p(word) ?					\
+	 (unsigned long)(BITS_PER_LONG - 1 - __builtin_clzl(word)) :	\
+	 variable__fls(word))
+
+static __always_inline int variable_ffs(int x)
+{
+	int r;
+
+	asm_volatile_goto(
+		ALTERNATIVE("j %l[legacy]", "nop", 0, RISCV_ISA_EXT_ZBB, 1)
+		: : : : legacy);
+
+	asm volatile (
+		".option push\n"
+		".option arch,+zbb\n"
+		"bnez %1, 1f\n"
+		"li %0, 0\n"
+		"j 2f\n"
+		"1:\n"
+		CTZW "%0, %1\n"
+		"addi %0, %0, 1\n"
+		"2:\n"
+		".option pop\n"
+		: "=r" (r) : "r" (x) :);
+
+	return r;
+
+legacy:
+	r = 1;
+	if (!x)
+		return 0;
+	if (!(x & 0xffff)) {
+		x >>= 16;
+		r += 16;
+	}
+	if (!(x & 0xff)) {
+		x >>= 8;
+		r += 8;
+	}
+	if (!(x & 0xf)) {
+		x >>= 4;
+		r += 4;
+	}
+	if (!(x & 3)) {
+		x >>= 2;
+		r += 2;
+	}
+	if (!(x & 1)) {
+		x >>= 1;
+		r += 1;
+	}
+	return r;
+}
+
+/**
+ * ffs - find first set bit in a word
+ * @x: the word to search
+ *
+ * This is defined the same way as the libc and compiler builtin ffs routines.
+ *
+ * ffs(value) returns 0 if value is 0 or the position of the first set bit if
+ * value is nonzero. The first (least significant) bit is at position 1.
+ */
+#define ffs(x) (__builtin_constant_p(x) ? __builtin_ffs(x) : variable_ffs(x))
+
+static __always_inline int variable_fls(unsigned int x)
+{
+	int r;
+
+	asm_volatile_goto(
+		ALTERNATIVE("j %l[legacy]", "nop", 0, RISCV_ISA_EXT_ZBB, 1)
+		: : : : legacy);
+
+	asm volatile (
+		".option push\n"
+		".option arch,+zbb\n"
+		"bnez %1, 1f\n"
+		"li %0, 0\n"
+		"j 2f\n"
+		"1:\n"
+		CLZW "%0, %1\n"
+		"neg %0, %0\n"
+		"addi %0, %0, 32\n"
+		"2:\n"
+		".option pop\n"
+		: "=r" (r) : "r" (x) :);
+
+	return r;
+
+legacy:
+	r = 32;
+	if (!x)
+		return 0;
+	if (!(x & 0xffff0000u)) {
+		x <<= 16;
+		r -= 16;
+	}
+	if (!(x & 0xff000000u)) {
+		x <<= 8;
+		r -= 8;
+	}
+	if (!(x & 0xf0000000u)) {
+		x <<= 4;
+		r -= 4;
+	}
+	if (!(x & 0xc0000000u)) {
+		x <<= 2;
+		r -= 2;
+	}
+	if (!(x & 0x80000000u)) {
+		x <<= 1;
+		r -= 1;
+	}
+	return r;
+}
+
+/**
+ * fls - find last set bit in a word
+ * @x: the word to search
+ *
+ * This is defined in a similar way as ffs, but returns the position of the most
+ * significant set bit.
+ *
+ * fls(value) returns 0 if value is 0 or the position of the last set bit if
+ * value is nonzero. The last (most significant) bit is at position 32.
+ */
+#define fls(x)								\
+	(__builtin_constant_p(x) ?					\
+	 (int)(((x) != 0) ?						\
+	  (sizeof(unsigned int) * 8 - __builtin_clz(x)) : 0) :		\
+	 variable_fls(x))
+
+#endif
+
+#include <asm-generic/bitops/ffz.h>
 #include <asm-generic/bitops/fls64.h>
 #include <asm-generic/bitops/sched.h>
-#include <asm-generic/bitops/ffs.h>
 
 #include <asm-generic/bitops/hweight.h>
 
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index a1157c2a7170..d68cacd4e3af 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -28,7 +28,7 @@ cflags-$(CONFIG_ARM)		+= -DEFI_HAVE_STRLEN -DEFI_HAVE_STRNLEN \
 				   -DEFI_HAVE_MEMCHR -DEFI_HAVE_STRRCHR \
 				   -DEFI_HAVE_STRCMP -fno-builtin -fpic \
 				   $(call cc-option,-mno-single-pic-base)
-cflags-$(CONFIG_RISCV)		+= -fpic
+cflags-$(CONFIG_RISCV)		+= -fpic -DNO_ALTERNATIVE
 cflags-$(CONFIG_LOONGARCH)	+= -fpie
 
 cflags-$(CONFIG_EFI_PARAMS_FROM_FDT)	+= -I$(srctree)/scripts/dtc/libfdt
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
