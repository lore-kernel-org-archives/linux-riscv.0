Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6ED0C001DB
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Aug 2023 02:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iNrX7ZThd1PjZV0xyjjt2m+2IpamKlq8KD7O+5c1k9U=; b=RRj1dGNxZAjzMN
	qQ1V9Zx+D+/ThhT4twi444PGIJreFMcRiMmofIxi46Gkh43RDs12nHAR0neqdYObouiPxrfZZAEBU
	kvGJwxwpzDu/fgoOa9FMzIkXqiRU+bGD8v8+W23Hn26nJ875EmzrNufVOUB8uG1hpVBp5f9LlT5dh
	3a931USQFwJg+siqlltWOrw5SpJr/M/TUrwQOmzgdHlElHCS6ph9CjkXkLIOXVqKOJpVvVnWY6+r3
	qXe00dt3eLKBMmj7CNtD/ZmmRab9gwSHvWXtsAcxiahaJVOIQrfM4F+nQvXjAkCnkD3SLp+lO4fn4
	SQj1h4eZr17PASyZQTQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSTg2-00EnBf-0Z;
	Sun, 06 Aug 2023 02:39:30 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSTfy-00EnBD-2G
	for linux-riscv@lists.infradead.org;
	Sun, 06 Aug 2023 02:39:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691289566; x=1722825566;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tay5dkvntw3AjcFDhiXZE3t/h3WXy5Q2ggqsZ9PrX0o=;
  b=WM/Y042WxB9iv4FcYw0BxjdEfpUufWwtgnK7XKG9Y+Ine2A3hMCOtKuf
   qUSBSRlz7680sTQjuZM+JdiEZcunUa7Wn25LfWzSAvEXxrnYfmoKChJkn
   g9LUuNCiZkfob8kKiNO0DqkrADQibmuiTCFFOPTj+KyYpuXnPC5W7tGS/
   dMjsYqSekvC7uPqaRJyVm6kEbojw+KZ9ZG0Ct/hHVMcp8McqbEIejxeKe
   eYDI0sOLI4TtK0HauT/JVnqEaTtyJSmYiiOZhwEbjB8LeIxrEqZndBHuQ
   XBGlw8oyOT1S7yXNUTHNWdBmk22Gl7aQIxTS4mkEQv9GAbaGlWo/bnqLD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="373100371"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="373100371"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 19:39:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="724106192"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="724106192"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by orsmga007.jf.intel.com with ESMTP; 05 Aug 2023 19:39:20 -0700
From: Xiao Wang <xiao.w.wang@intel.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org
Cc: anup@brainfault.org,
	haicheng.li@intel.com,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH] RISC-V: Optimize bitops with Zbb extension
Date: Sun,  6 Aug 2023 10:47:15 +0800
Message-Id: <20230806024715.3061589-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_193926_834472_A3666657 
X-CRM114-Status: GOOD (  18.12  )
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
used there, this patch introduces a macro EFI_NO_ALTERNATIVE for this
purpose.

Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
---
 arch/riscv/include/asm/bitops.h       | 266 +++++++++++++++++++++++++-
 drivers/firmware/efi/libstub/Makefile |   2 +-
 2 files changed, 264 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index 3540b690944b..f727f6489cd5 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -15,13 +15,273 @@
 #include <asm/barrier.h>
 #include <asm/bitsperlong.h>
 
+#if !defined(CONFIG_RISCV_ISA_ZBB) || defined(EFI_NO_ALTERNATIVE)
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
index 16d64a34d1e1..b0f8c495c10f 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -28,7 +28,7 @@ cflags-$(CONFIG_ARM)		+= -DEFI_HAVE_STRLEN -DEFI_HAVE_STRNLEN \
 				   -DEFI_HAVE_MEMCHR -DEFI_HAVE_STRRCHR \
 				   -DEFI_HAVE_STRCMP -fno-builtin -fpic \
 				   $(call cc-option,-mno-single-pic-base)
-cflags-$(CONFIG_RISCV)		+= -fpic
+cflags-$(CONFIG_RISCV)		+= -fpic -DEFI_NO_ALTERNATIVE
 cflags-$(CONFIG_LOONGARCH)	+= -fpie
 
 cflags-$(CONFIG_EFI_PARAMS_FROM_FDT)	+= -I$(srctree)/scripts/dtc/libfdt
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
