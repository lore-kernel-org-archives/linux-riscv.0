Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C4FC3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 08:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uYeW2PbNBG5YSpGGO1Awijc/KwuDjPoz5s6uukHaz6Q=; b=Jb5POjl1NGPjua
	IAEHHbiLdhNGINYOO9tYmCu5htGmT6el05ZK+ZCyOeKDwcphGVkr7bwwJOWNY6bxr8GhWOxg8WmKP
	HbKDtO6060aSX6O7omXWue/wpq9iVEYoc091EqC/kdDwUufghJgkag1YRYNGX2fXBqZ9cjFOA5DFq
	YbmhAchIlg8VvWjjO0RKQ5u7SJCo3a5dHjEB/0k8wfvYlP28Q+UjoNzV/crwyjwqZuskXKnnmW3/A
	Bb+bI+pFfsBxNXHXBHAl0HtDjHotfr4MIMRXTbQ5F/Oto6Ph54JoGHVtZHsDTZ3RDS3jf8MpQrfRV
	+7w1adP3DeO1sOi96cdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLfFr-00GCvx-2J;
	Fri, 05 Jan 2024 08:08:35 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLfFn-00GCvX-1j
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 08:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704442112; x=1735978112;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kymNFyxc7X83e2Q6Vv/6p38yrdsPo+9Xr3wdkAOH7Vk=;
  b=DszAvp/5fqkWRmqlevM+kyFV3rB053yWTqXA3cCsDO0S0+J2TQRoSX/v
   8j70xBmg6bqwE6Pbd4KfLTMPD4v5BozUVvD4YjHAX79wNHspJLDlcbr7d
   /ijHEHjAGL0P4L6dX3eHi+0Gtg/u8PnosK7/DWVekJiu2ucW+V9Oelo2T
   wbN1hXZDy1ZwmHm7FPHbr9KdDjiSROvH82vkkv/2rhxMhgcOzSifviJ6c
   MDwr7FJKTmfTswSx2AJrPXk18OTecbvb+S5nCPlHM0JP6c4Hg4deom8WM
   xipuPCRGoH1RJM6WrmQki61cdAqxJbKrY5IwZwnhm8E2Hs9u+tnx7ZvcE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4228140"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4228140"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 00:08:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="756872709"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="756872709"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by orsmga006.jf.intel.com with ESMTP; 05 Jan 2024 00:08:26 -0800
From: Xiao Wang <xiao.w.wang@intel.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: conor.dooley@microchip.com,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	haicheng.li@intel.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH] riscv: Optimize crc32 with Zbc extension
Date: Fri,  5 Jan 2024 16:08:30 +0800
Message-Id: <20240105080830.3738117-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_000831_621293_495C3AC8 
X-CRM114-Status: GOOD (  22.76  )
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

As suggested by the B-ext spec, the Zbc (carry-less multiplication)
instructions can be used to accelerate CRC calculations. Currently, the
crc32 is the most widely used crc function inside kernel, so this patch
focuses on the optimization of just the crc32 APIs.

Compared with the current table-lookup based optimization, Zbc based
optimization can also achieve large stride during CRC calculation loop,
meantime, it avoids the memory access latency of the table-lookup based
implementation and it reduces memory footprint.

If Zbc feature is not supported in a runtime environment, then the
table-lookup based implementation would serve as fallback via alternative
mechanism. To avoid the performance concern of unalignment access, we also
use the fallback implementation to handle the head and tail bytes if any,
the main body is accelerated by Zbc extension.

This patch is tested on QEMU VM with the kernel CRC32 selftest.

Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
---
 arch/riscv/Kconfig      |  23 +++++
 arch/riscv/lib/Makefile |   1 +
 arch/riscv/lib/crc32.c  | 216 ++++++++++++++++++++++++++++++++++++++++
 include/linux/crc32.h   |   3 +
 4 files changed, 243 insertions(+)
 create mode 100644 arch/riscv/lib/crc32.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 95a2a06acc6a..d8b4fb697df2 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -549,6 +549,29 @@ config RISCV_ISA_ZBB
 
 	   If you don't know what to do here, say Y.
 
+config TOOLCHAIN_HAS_ZBC
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbc)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbc)
+	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_ZBC
+	bool "Zbc extension support for carry-less multiplication instructions"
+	depends on TOOLCHAIN_HAS_ZBC
+	depends on MMU
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	   Adds support to dynamically detect the presence of the Zbc
+	   extension (carry-less multiplication) and enable its usage.
+
+	   The Zbc extension could accelerate CRC (cyclic redundancy check)
+	   calculations.
+
+	   If you don't know what to do here, say Y.
+
 config RISCV_ISA_ZICBOM
 	bool "Zicbom extension support for non-coherent DMA operation"
 	depends on MMU
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 26cb2502ecf8..183bf2097d57 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -9,5 +9,6 @@ lib-y			+= strncmp.o
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
 lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
+lib-$(CONFIG_RISCV_ISA_ZBC)	+= crc32.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
diff --git a/arch/riscv/lib/crc32.c b/arch/riscv/lib/crc32.c
new file mode 100644
index 000000000000..1a24994df826
--- /dev/null
+++ b/arch/riscv/lib/crc32.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Accelerated CRC32 implementation with Zbc extension.
+ *
+ * Copyright (C) 2024 Intel Corporation
+ *
+ * Authors:
+ *     Xiao Wang <xiao.w.wang@intel.com>
+ */
+
+#include <asm/hwcap.h>
+#include <asm/alternative-macros.h>
+#include <asm/byteorder.h>
+
+#include <linux/types.h>
+#include <linux/crc32poly.h>
+#include <linux/crc32.h>
+#include <linux/byteorder/generic.h>
+
+#define MIN(a, b) ((a) < (b) ? (a) : (b))
+
+#if (BITS_PER_LONG == 64)
+/* Slide by XLEN bits per iteration */
+# define STEP_ORDER 3
+
+/* Each below polynomial quotient has an implicit bit for 2^XLEN */
+
+/* Polynomial quotient of (2^(XLEN+32))/CRC32_POLY, in LE format */
+# define CRC32_POLY_QT_LE	0x5a72d812fb808b20
+
+/* Polynomial quotient of (2^(XLEN+32))/CRC32C_POLY, in LE format */
+# define CRC32C_POLY_QT_LE	0xa434f61c6f5389f8
+
+/* Polynomial quotient of (2^(XLEN+32))/CRC32_POLY, in BE format, it should be
+ * the same as the bit-reversed version of CRC32_POLY_QT_LE
+ */
+# define CRC32_POLY_QT_BE	0x04d101df481b4e5a
+#elif (BITS_PER_LONG == 32)
+# define STEP_ORDER 2
+/* Each quotient should match the upper half of its analog in RV64 */
+# define CRC32_POLY_QT_LE	0xfb808b20
+# define CRC32C_POLY_QT_LE	0x6f5389f8
+# define CRC32_POLY_QT_BE	0x04d101df
+#else
+# error "Unexpected BITS_PER_LONG"
+#endif
+
+#define STEP (1 << STEP_ORDER)
+#define OFFSET_MASK (STEP - 1)
+
+/*
+ * Refer to https://www.corsix.org/content/barrett-reduction-polynomials for
+ * better understanding of how this math works.
+ *
+ * let "+" denotes polynomial add (XOR)
+ * let "-" denotes polynomial sub (XOR)
+ * let "*" denotes polynomial multiplication
+ * let "/" denotes polynomial floor division
+ * let "S" denotes source data, XLEN bit wide
+ * let "P" denotes CRC32 polynomial
+ * let "T" denotes 2^(XLEN+32)
+ * let "QT" denotes quotient of T/P, with the bit for 2^XLEN being implicit
+ *
+ * crc32(S, P)
+ * => S * (2^32) - S * (2^32) / P * P
+ * => lowest 32 bits of: S * (2^32) / P * P
+ * => lowest 32 bits of: S * (2^32) * (T / P) / T * P
+ * => lowest 32 bits of: S * (2^32) * quotient / T * P
+ * => lowest 32 bits of: S * quotient / 2^XLEN * P
+ * => lowest 32 bits of: (clmul_high_part(S, QT) + S) * P
+ * => clmul_low_part(clmul_high_part(S, QT) + S, P)
+ *
+ * In terms of below implementations, the BE case is more intuitive, since the
+ * higher order bit sits at more significant position.
+ */
+
+typedef u32 (*fallback)(u32 crc, unsigned char const *p, size_t len);
+
+static inline u32 __pure crc32_le_generic(u32 crc, unsigned char const *p,
+#if (BITS_PER_LONG == 64)
+					  size_t len, u32 poly, u64 poly_qt,
+#else
+					  size_t len, u32 poly, u32 poly_qt,
+#endif
+					  fallback crc_fb)
+{
+	size_t offset, head_len, tail_len;
+	const unsigned long *p_ul;
+	unsigned long s;
+
+	asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
+				      RISCV_ISA_EXT_ZBC, 1)
+			  : : : : legacy);
+
+	/* Handle the unalignment head. */
+	offset = (unsigned long)p & OFFSET_MASK;
+	if (offset) {
+		head_len = MIN(STEP - offset, len);
+		crc = crc_fb(crc, p, head_len);
+		len -= head_len;
+		p += head_len;
+	}
+
+	tail_len = len & OFFSET_MASK;
+	len = len >> STEP_ORDER;
+	p_ul = (unsigned long *)p;
+
+	for (int i = 0; i < len; i++) {
+#if (BITS_PER_LONG == 64)
+		s = (unsigned long)crc ^ __cpu_to_le64(*p_ul++);
+		/* We don't have a "clmulrh" insn, so use clmul + slli instead.
+		 */
+		asm volatile (".option push\n"
+			      ".option arch,+zbc\n"
+			      "clmul	%0, %1, %2\n"
+			      "slli	%0, %0, 1\n"
+			      "xor	%0, %0, %1\n"
+			      "clmulr	%0, %0, %3\n"
+			      "srli	%0, %0, 32\n"
+			      ".option pop\n"
+			      : "=&r" (crc)
+			      : "r" (s),
+				"r" (poly_qt),
+				"r" ((u64)poly << 32)
+			      :);
+#else
+		s = crc ^ __cpu_to_le32(*p_ul++);
+		/* We don't have a "clmulrh" insn, so use clmul + slli instead.
+		 */
+		asm volatile (".option push\n"
+			      ".option arch,+zbc\n"
+			      "clmul	%0, %1, %2\n"
+			      "slli	%0, %0, 1\n"
+			      "xor	%0, %0, %1\n"
+			      "clmulr	%0, %0, %3\n"
+			      ".option pop\n"
+			      : "=&r" (crc)
+			      : "r" (s),
+				"r" (poly_qt),
+				"r" (poly)
+			      :);
+#endif
+	}
+
+	/* Handle the tail bytes. */
+	if (tail_len)
+		crc = crc_fb(crc, (unsigned char const *)p_ul, tail_len);
+	return crc;
+
+legacy:
+	return crc_fb(crc, p, len);
+}
+
+u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
+{
+	return crc32_le_generic(crc, p, len, CRC32_POLY_LE, CRC32_POLY_QT_LE,
+				crc32_le_base);
+}
+
+u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len)
+{
+	return crc32_le_generic(crc, p, len, CRC32C_POLY_LE,
+				CRC32C_POLY_QT_LE, __crc32c_le_base);
+}
+
+u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len)
+{
+	size_t offset, head_len, tail_len;
+	const unsigned long *p_ul;
+	unsigned long s;
+
+	asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
+				      RISCV_ISA_EXT_ZBC, 1)
+			  : : : : legacy);
+
+	/* Handle the unalignment head. */
+	offset = (unsigned long)p & OFFSET_MASK;
+	if (offset) {
+		head_len = MIN(STEP - offset, len);
+		crc = crc32_be_base(crc, p, head_len);
+		len -= head_len;
+		p += head_len;
+	}
+
+	tail_len = len & OFFSET_MASK;
+	len = len >> STEP_ORDER;
+	p_ul = (unsigned long *)p;
+
+	for (int i = 0; i < len; i++) {
+#if (BITS_PER_LONG == 64)
+		s = (unsigned long)crc << 32;
+		s ^= __cpu_to_be64(*p_ul++);
+#else
+		s = crc ^ __cpu_to_be32(*p_ul++);
+#endif
+		asm volatile (".option push\n"
+			      ".option arch,+zbc\n"
+			      "clmulh	%0, %1, %2\n"
+			      "xor	%0, %0, %1\n"
+			      "clmul	%0, %0, %3\n"
+			      ".option pop\n"
+			      : "=&r" (crc)
+			      : "r" (s),
+				"r" (CRC32_POLY_QT_BE),
+				"r" (CRC32_POLY_BE)
+			      :);
+	}
+
+	/* Handle the tail bytes. */
+	if (tail_len)
+		crc = crc32_be_base(crc, (unsigned char const *)p_ul, tail_len);
+	return crc;
+
+legacy:
+	return crc32_be_base(crc, p, len);
+}
diff --git a/include/linux/crc32.h b/include/linux/crc32.h
index 9e8a032c1788..87f788c0d607 100644
--- a/include/linux/crc32.h
+++ b/include/linux/crc32.h
@@ -9,7 +9,9 @@
 #include <linux/bitrev.h>
 
 u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len);
+u32 __pure crc32_le_base(u32 crc, unsigned char const *p, size_t len);
 u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len);
+u32 __pure crc32_be_base(u32 crc, unsigned char const *p, size_t len);
 
 /**
  * crc32_le_combine - Combine two crc32 check values into one. For two
@@ -37,6 +39,7 @@ static inline u32 crc32_le_combine(u32 crc1, u32 crc2, size_t len2)
 }
 
 u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len);
+u32 __pure __crc32c_le_base(u32 crc, unsigned char const *p, size_t len);
 
 /**
  * __crc32c_le_combine - Combine two crc32c check values into one. For two
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
