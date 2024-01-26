Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E407FC47258
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 01:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9CJq0iK5IJkTd5A7+p4ncYFvNOlv9e9FtfEQQQPnL1k=; b=w9H9gjc9RE+lFf
	Bu7MTJ7jv3jMV29GaghZJF/d0POznnKbKOOQYY4dcoJNuTEsOiFaK4BzpKpTwxRMI3VRjtEwV3NTt
	RI3t+8eAugtycLVENWd1Zwro45gD/TbUQfa0rPB7NwzPP/zirgVUsc3e/VmD1g3Vo1j/ur3EYx/C6
	Pow3crBuTOasRqrTCFZ6Q2xm1gXwUCrYNJuRZGg3PfkQNiZxRyUKJQmfSba5NVfhvqc02qclSQEXI
	NYfYWIgKyoHGgJsJEUDXC4gY4qHgqM8TJdEpV3LCY9XebjjtHnuRetowA0Yr4fQ+urnA3v1rAFA4I
	RfoID+c1rJ6wWM0PfqGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTBHA-00000002mjP-10Zp;
	Fri, 26 Jan 2024 01:45:00 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTBH7-00000002mil-1Bw8
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jan 2024 01:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706233497; x=1737769497;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OfEmR3OKexpuuhIWPTk0v6zJ1lFL0N5Ci1PZ6O0rrIg=;
  b=D4RjaI/E7cltChsOtLOO1X8hqcKd/VAvrWcfKtgFRW7PpGfnniDCM6Ve
   22CBP9dk/21EnDnrpTjg0H0dh9M468It3oggeKM23hb0x8yxmoFxqH3+P
   LlYvGq5zMthy85Qu3d7iFtqLryognPXjfqcH3TfNH2LwBS0DdGGYF+CBF
   Z5CNCt2+OtedG9IWWrxXQ+GTcG2uTrMECj02gmJGJpH/KnnChhDyXnrc0
   5OD4hzDaQ7rSXypt47W24Tao2BR88MSh3PLdiQYXgKngBsNjyMdhXn8bt
   0CcmppMOjdOw24eYti6SIm8JsfN5FcpBdoWdUH9yArihjhz80iYZbSZqc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="15886972"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="15886972"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 17:44:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="857270036"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="857270036"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by fmsmga004.fm.intel.com with ESMTP; 25 Jan 2024 17:44:47 -0800
From: Xiao Wang <xiao.w.wang@intel.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: conor.dooley@microchip.com,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	haicheng.li@intel.com,
	david.laight@aculab.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH v2] riscv: Optimize crc32 with Zbc extension
Date: Fri, 26 Jan 2024 09:44:39 +0800
Message-Id: <20240126014439.1389033-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_174457_388732_79039F23 
X-CRM114-Status: GOOD (  27.44  )
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

By inspecting the vmlinux built by gcc v12.2.0 with default optimization
level (-O2), we can see below instruction count change for each 8-byte
stride in the CRC32 loop:

rv64: crc32_be (54->31), crc32_le (54->13), __crc32c_le (54->13)
rv32: crc32_be (50->32), crc32_le (50->16), __crc32c_le (50->16)

The compile target CPU is little endian, so there's extra effort needed to
do byte swapping for the crc32_be API, so the instruction count change is
not as significant as that in the *_le cases.

This patch is tested on QEMU VM with the kernel CRC32 selftest.

Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
---
v2:
- Fix sparse warnings about type casting. (lkp)
- Add info about instruction count change in commit log. (Andrew)
- Use the min() helper from linux/minmax.h. (Andrew)
- Use "#if __riscv_xlen == 64" macro check to differentiate rv64 and rv32. (Andrew)
- Line up several macro values by tab. (Andrew)
- Make poly_qt as "unsigned long" to unify the code for rv64 and rv32. (David)
- Fix the style of comment wing. (Andrew)
- Add function wrappers for the asm code for the *_le cases. (Andrew)
---
 arch/riscv/Kconfig      |  23 ++++
 arch/riscv/lib/Makefile |   1 +
 arch/riscv/lib/crc32.c  | 226 ++++++++++++++++++++++++++++++++++++++++
 include/linux/crc32.h   |   3 +
 4 files changed, 253 insertions(+)
 create mode 100644 arch/riscv/lib/crc32.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a82bc8bed503..436fad3432a5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -604,6 +604,29 @@ config RISCV_ISA_ZBB
 
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
index bd6e6c1b0497..2b369f51b0a5 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -13,6 +13,7 @@ endif
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
 lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
+lib-$(CONFIG_RISCV_ISA_ZBC)	+= crc32.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
diff --git a/arch/riscv/lib/crc32.c b/arch/riscv/lib/crc32.c
new file mode 100644
index 000000000000..4cd102572450
--- /dev/null
+++ b/arch/riscv/lib/crc32.c
@@ -0,0 +1,226 @@
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
+#include <linux/minmax.h>
+#include <linux/crc32poly.h>
+#include <linux/crc32.h>
+#include <linux/byteorder/generic.h>
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
+#if __riscv_xlen == 64
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
+
+static inline u32 crc32_le_zbc(u32 crc, const unsigned long *ptr, u32 poly,
+			       unsigned long poly_qt)
+{
+		u64 s = (u64)crc ^ (__force u64)__cpu_to_le64(*ptr);
+		/*
+		 * We don't have a "clmulrh" insn, so use clmul + slli instead.
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
+		return crc;
+}
+
+#elif __riscv_xlen == 32
+# define STEP_ORDER 2
+/* Each quotient should match the upper half of its analog in RV64 */
+# define CRC32_POLY_QT_LE	0xfb808b20
+# define CRC32C_POLY_QT_LE	0x6f5389f8
+# define CRC32_POLY_QT_BE	0x04d101df
+
+static inline u32 crc32_le_zbc(u32 crc, const unsigned long *ptr, u32 poly,
+			       unsigned long poly_qt)
+{
+		u32 s = crc ^ (__force u32)__cpu_to_le32(*ptr);
+		/*
+		 * We don't have a "clmulrh" insn, so use clmul + slli instead.
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
+		return crc;
+}
+
+#else
+# error "Unexpected __riscv_xlen"
+#endif
+
+#define STEP		(1 << STEP_ORDER)
+#define OFFSET_MASK	(STEP - 1)
+
+typedef u32 (*fallback)(u32 crc, unsigned char const *p, size_t len);
+
+static inline u32 __pure crc32_le_generic(u32 crc, unsigned char const *p,
+					  size_t len, u32 poly,
+					  unsigned long poly_qt,
+					  fallback crc_fb)
+{
+	size_t offset, head_len, tail_len;
+	const unsigned long *p_ul;
+
+	asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
+				      RISCV_ISA_EXT_ZBC, 1)
+			  : : : : legacy);
+
+	/* Handle the unalignment head. */
+	offset = (unsigned long)p & OFFSET_MASK;
+	if (offset) {
+		head_len = min(STEP - offset, len);
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
+		crc = crc32_le_zbc(crc, p_ul, poly, poly_qt);
+		p_ul++;
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
+		head_len = min(STEP - offset, len);
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
+#if __riscv_xlen == 64
+		s = (u64)crc << 32;
+		s ^= (__force u64)__cpu_to_be64(*p_ul++);
+#else
+		s = crc ^ (__force u32)__cpu_to_be32(*p_ul++);
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
