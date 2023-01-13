Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96B9C6379F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 21:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XtHlrR7ITKMORAPbYVGcioDLytKcA2h25nEyQd++Deo=; b=h4aOBYvdN+BIxI
	L1UvnZ/IWQmg/ebOCRpV9WSkyA4IyFZGlHUm+3+wqxXsythRqkKRQjHzuFTzBhmvSQ3qHHH0V2Hfx
	SOsGK3Kws0aDpkqBK3ZzOeiTNr3g/R1cXf0tzLcu3yheO2yml0Nrp0arCWXJFv6/FFr1vVWnh0KlA
	sNGB9GkUfSo/WP5w/ikhyk6h7CO/EeGF/Gu6e7PZfbN6X7Go8JtZ6+dAHZtiYE+deLATIKzLEl614
	Pb5vsTNVTYrMhw3UHWpsiJdEKJXeZ98fR7ams/1u88bfRMcwPZ/sqU1XR9T/WpMMv6NpFYkxOCxot
	FHsbZ2nG+pXLDaVhXUFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRWG-004afO-MJ; Fri, 13 Jan 2023 21:23:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRVz-004aVs-6Y
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 21:23:10 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pGRVx-0003VT-Oh; Fri, 13 Jan 2023 22:23:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v5 2/2] RISC-V: add zbb support to string functions
Date: Fri, 13 Jan 2023 22:23:01 +0100
Message-Id: <20230113212301.3534711-3-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230113212301.3534711-1-heiko@sntech.de>
References: <20230113212301.3534711-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_132307_449052_2EBC79AD 
X-CRM114-Status: GOOD (  24.72  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

Add handling for ZBB extension and add support for using it as a
variant for optimized string functions.

Support for the Zbb-str-variants is limited to the GNU-assembler
for now, as LLVM has not yet acquired the functionality to
selectively change the arch option in assembler code.
This is still under review at
    https://reviews.llvm.org/D123515

Co-developed-by: Christoph Muellner <christoph.muellner@vrull.eu>
Signed-off-by: Christoph Muellner <christoph.muellner@vrull.eu>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/Kconfig                   |  24 ++++++
 arch/riscv/include/asm/errata_list.h |   3 +-
 arch/riscv/include/asm/hwcap.h       |   1 +
 arch/riscv/kernel/cpu.c              |   1 +
 arch/riscv/kernel/cpufeature.c       |  18 +++++
 arch/riscv/lib/strcmp.S              |  85 ++++++++++++++++++++++
 arch/riscv/lib/strlen.S              | 105 +++++++++++++++++++++++++++
 arch/riscv/lib/strncmp.S             |  98 +++++++++++++++++++++++++
 8 files changed, 334 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e2b656043abf..7c814fbf9527 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -416,6 +416,30 @@ config RISCV_ISA_SVPBMT
 
 	   If you don't know what to do here, say Y.
 
+config TOOLCHAIN_HAS_ZBB
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
+	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+	depends on AS_IS_GNU
+
+config RISCV_ISA_ZBB
+	bool "Zbb extension support for bit manipulation instructions"
+	depends on TOOLCHAIN_HAS_ZBB
+	depends on !XIP_KERNEL && MMU
+	select RISCV_ALTERNATIVE
+	default y
+	help
+	   Adds support to dynamically detect the presence of the ZBB
+	   extension (basic bit manipulation) and enable its usage.
+
+	   The Zbb extension provides instructions to accelerate a number
+	   of bit-specific operations (count bit population, sign extending,
+	   bitrotation, etc).
+
+	   If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZICBOM
 	bool
 	default y
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 4180312d2a70..95e626b7281e 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -24,7 +24,8 @@
 
 #define	CPUFEATURE_SVPBMT 0
 #define	CPUFEATURE_ZICBOM 1
-#define	CPUFEATURE_NUMBER 2
+#define	CPUFEATURE_ZBB 2
+#define	CPUFEATURE_NUMBER 3
 
 #ifdef __ASSEMBLY__
 
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 57439da71c77..462d6cde9bac 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -58,6 +58,7 @@ enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_SSTC,
 	RISCV_ISA_EXT_SVINVAL,
 	RISCV_ISA_EXT_SVPBMT,
+	RISCV_ISA_EXT_ZBB,
 	RISCV_ISA_EXT_ZICBOM,
 	RISCV_ISA_EXT_ZIHINTPAUSE,
 	RISCV_ISA_EXT_ID_MAX
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 0bf1c7f663fc..420228e219f7 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -185,6 +185,7 @@ arch_initcall(riscv_cpuinfo_init);
  * New entries to this struct should follow the ordering rules described above.
  */
 static struct riscv_isa_ext_data isa_ext_arr[] = {
+	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index dde0e91d7668..9899806cef29 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -227,6 +227,7 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
 				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
+				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
 			}
@@ -302,6 +303,20 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
 	return true;
 }
 
+static bool __init_or_module cpufeature_probe_zbb(unsigned int stage)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZBB))
+		return false;
+
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+		return false;
+
+	if (!riscv_isa_extension_available(NULL, ZBB))
+		return false;
+
+	return true;
+}
+
 /*
  * Probe presence of individual extensions.
  *
@@ -320,6 +335,9 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
 	if (cpufeature_probe_zicbom(stage))
 		cpu_req_feature |= BIT(CPUFEATURE_ZICBOM);
 
+	if (cpufeature_probe_zbb(stage))
+		cpu_req_feature |= BIT(CPUFEATURE_ZBB);
+
 	return cpu_req_feature;
 }
 
diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
index 8babd712b958..8148b6418f61 100644
--- a/arch/riscv/lib/strcmp.S
+++ b/arch/riscv/lib/strcmp.S
@@ -3,9 +3,14 @@
 #include <linux/linkage.h>
 #include <asm/asm.h>
 #include <asm-generic/export.h>
+#include <asm/alternative-macros.h>
+#include <asm/errata_list.h>
 
 /* int strcmp(const char *cs, const char *ct) */
 SYM_FUNC_START(strcmp)
+
+	ALTERNATIVE("nop", "j strcmp_zbb", 0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
+
 	/*
 	 * Returns
 	 *   a0 - comparison result, value like strcmp
@@ -33,4 +38,84 @@ SYM_FUNC_START(strcmp)
 	 */
 	sub	a0, t0, t1
 	ret
+
+/*
+ * Variant of strcmp using the ZBB extension if available
+ */
+#ifdef CONFIG_RISCV_ISA_ZBB
+strcmp_zbb:
+
+.option push
+.option arch,+zbb
+
+	/*
+	 * Returns
+	 *   a0 - comparison result, value like strcmp
+	 *
+	 * Parameters
+	 *   a0 - string1
+	 *   a1 - string2
+	 *
+	 * Clobbers
+	 *   t0, t1, t2, t3, t4, t5
+	 */
+
+	or	t2, a0, a1
+	li	t4, -1
+	and	t2, t2, SZREG-1
+	bnez	t2, 3f
+
+	/* Main loop for aligned string.  */
+	.p2align 3
+1:
+	REG_L	t0, 0(a0)
+	REG_L	t1, 0(a1)
+	orc.b	t3, t0
+	bne	t3, t4, 2f
+	addi	a0, a0, SZREG
+	addi	a1, a1, SZREG
+	beq	t0, t1, 1b
+
+	/*
+	 * Words don't match, and no null byte in the first
+	 * word. Get bytes in big-endian order and compare.
+	 */
+#ifndef CONFIG_CPU_BIG_ENDIAN
+	rev8	t0, t0
+	rev8	t1, t1
+#endif
+
+	/* Synthesize (t0 >= t1) ? 1 : -1 in a branchless sequence. */
+	sltu	a0, t0, t1
+	neg	a0, a0
+	ori	a0, a0, 1
+	ret
+
+2:
+	/*
+	 * Found a null byte.
+	 * If words don't match, fall back to simple loop.
+	 */
+	bne	t0, t1, 3f
+
+	/* Otherwise, strings are equal. */
+	li	a0, 0
+	ret
+
+	/* Simple loop for misaligned strings. */
+	.p2align 3
+3:
+	lbu	t0, 0(a0)
+	lbu	t1, 0(a1)
+	addi	a0, a0, 1
+	addi	a1, a1, 1
+	bne	t0, t1, 4f
+	bnez	t0, 3b
+
+4:
+	sub	a0, t0, t1
+	ret
+
+.option pop
+#endif
 SYM_FUNC_END(strcmp)
diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
index 0a3b11853efd..0f9dbf93301a 100644
--- a/arch/riscv/lib/strlen.S
+++ b/arch/riscv/lib/strlen.S
@@ -3,9 +3,14 @@
 #include <linux/linkage.h>
 #include <asm/asm.h>
 #include <asm-generic/export.h>
+#include <asm/alternative-macros.h>
+#include <asm/errata_list.h>
 
 /* int strlen(const char *s) */
 SYM_FUNC_START(strlen)
+
+	ALTERNATIVE("nop", "j strlen_zbb", 0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
+
 	/*
 	 * Returns
 	 *   a0 - string length
@@ -25,4 +30,104 @@ SYM_FUNC_START(strlen)
 2:
 	sub	a0, t1, a0
 	ret
+
+/*
+ * Variant of strlen using the ZBB extension if available
+ */
+#ifdef CONFIG_RISCV_ISA_ZBB
+strlen_zbb:
+
+#ifdef CONFIG_CPU_BIG_ENDIAN
+# define CZ	clz
+# define SHIFT	sll
+#else
+# define CZ	ctz
+# define SHIFT	srl
+#endif
+
+.option push
+.option arch,+zbb
+
+	/*
+	 * Returns
+	 *   a0 - string length
+	 *
+	 * Parameters
+	 *   a0 - String to measure
+	 *
+	 * Clobbers
+	 *   t0, t1, t2, t3
+	 */
+
+	/* Number of irrelevant bytes in the first word. */
+	andi	t2, a0, SZREG-1
+
+	/* Align pointer. */
+	andi	t0, a0, -SZREG
+
+	li	t3, SZREG
+	sub	t3, t3, t2
+	slli	t2, t2, 3
+
+	/* Get the first word.  */
+	REG_L	t1, 0(t0)
+
+	/*
+	 * Shift away the partial data we loaded to remove the irrelevant bytes
+	 * preceding the string with the effect of adding NUL bytes at the
+	 * end of the string's first word.
+	 */
+	SHIFT	t1, t1, t2
+
+	/* Convert non-NUL into 0xff and NUL into 0x00. */
+	orc.b	t1, t1
+
+	/* Convert non-NUL into 0x00 and NUL into 0xff. */
+	not	t1, t1
+
+	/*
+	 * Search for the first set bit (corresponding to a NUL byte in the
+	 * original chunk).
+	 */
+	CZ	t1, t1
+
+	/*
+	 * The first chunk is special: compare against the number
+	 * of valid bytes in this chunk.
+	 */
+	srli	a0, t1, 3
+	bgtu	t3, a0, 3f
+
+	/* Prepare for the word comparison loop. */
+	addi	t2, t0, SZREG
+	li	t3, -1
+
+	/*
+	 * Our critical loop is 4 instructions and processes data in
+	 * 4 byte or 8 byte chunks.
+	 */
+	.p2align 3
+1:
+	REG_L	t1, SZREG(t0)
+	addi	t0, t0, SZREG
+	orc.b	t1, t1
+	beq	t1, t3, 1b
+2:
+	not	t1, t1
+	CZ	t1, t1
+
+	/* Get number of processed words.  */
+	sub	t2, t0, t2
+
+	/* Add number of characters in the first word.  */
+	add	a0, a0, t2
+	srli	t1, t1, 3
+
+	/* Add number of characters in the last word.  */
+	add	a0, a0, t1
+3:
+	ret
+
+.option pop
+#endif
 SYM_FUNC_END(strlen)
diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
index 1f644d0a93f6..7940ddab2d48 100644
--- a/arch/riscv/lib/strncmp.S
+++ b/arch/riscv/lib/strncmp.S
@@ -3,9 +3,14 @@
 #include <linux/linkage.h>
 #include <asm/asm.h>
 #include <asm-generic/export.h>
+#include <asm/alternative-macros.h>
+#include <asm/errata_list.h>
 
 /* int strncmp(const char *cs, const char *ct, size_t count) */
 SYM_FUNC_START(strncmp)
+
+	ALTERNATIVE("nop", "j strncmp_zbb", 0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
+
 	/*
 	 * Returns
 	 *   a0 - comparison result, value like strncmp
@@ -38,4 +43,97 @@ SYM_FUNC_START(strncmp)
 	 */
 	sub	a0, t0, t1
 	ret
+
+/*
+ * Variant of strncmp using the ZBB extension if available
+ */
+#ifdef CONFIG_RISCV_ISA_ZBB
+strncmp_zbb:
+
+.option push
+.option arch,+zbb
+
+	/*
+	 * Returns
+	 *   a0 - comparison result, like strncmp
+	 *
+	 * Parameters
+	 *   a0 - string1
+	 *   a1 - string2
+	 *   a2 - number of characters to compare
+	 *
+	 * Clobbers
+	 *   t0, t1, t2, t3, t4, t5, t6
+	 */
+
+	or	t2, a0, a1
+	li	t5, -1
+	and	t2, t2, SZREG-1
+	add	t4, a0, a2
+	bnez	t2, 4f
+
+	/* Adjust limit for fast-path.  */
+	andi	t6, t4, -SZREG
+
+	/* Main loop for aligned string.  */
+	.p2align 3
+1:
+	bgt	a0, t6, 3f
+	REG_L	t0, 0(a0)
+	REG_L	t1, 0(a1)
+	orc.b	t3, t0
+	bne	t3, t5, 2f
+	addi	a0, a0, SZREG
+	addi	a1, a1, SZREG
+	beq	t0, t1, 1b
+
+	/*
+	 * Words don't match, and no null byte in the first
+	 * word. Get bytes in big-endian order and compare.
+	 */
+#ifndef CONFIG_CPU_BIG_ENDIAN
+	rev8	t0, t0
+	rev8	t1, t1
+#endif
+
+	/* Synthesize (t0 >= t1) ? 1 : -1 in a branchless sequence.  */
+	sltu	a0, t0, t1
+	neg	a0, a0
+	ori	a0, a0, 1
+	ret
+
+2:
+	/*
+	 * Found a null byte.
+	 * If words don't match, fall back to simple loop.
+	 */
+	bne	t0, t1, 3f
+
+	/* Otherwise, strings are equal.  */
+	li	a0, 0
+	ret
+
+	/* Simple loop for misaligned strings.  */
+3:
+	/* Restore limit for slow-path.  */
+	.p2align 3
+4:
+	bge	a0, t4, 6f
+	lbu	t0, 0(a0)
+	lbu	t1, 0(a1)
+	addi	a0, a0, 1
+	addi	a1, a1, 1
+	bne	t0, t1, 5f
+	bnez	t0, 4b
+
+5:
+	sub	a0, t0, t1
+	ret
+
+6:
+	li	a0, 0
+	ret
+
+.option pop
+#endif
 SYM_FUNC_END(strncmp)
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
