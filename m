Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D62BC433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 22:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=If1oAOL4kyUeNp1l0CFurKOCQ6LU77LD5xXysMb4fqI=; b=2mL4x//cfCj6xp
	XXApr4auRE6aIRTEdCA6lHWhvOL3YsvRIaue8+RznI+lQTgQ+GJHi7t3vodep4YQFNzHKHDbPc0vQ
	JLeqtzlfchT+zR4HeibzaOdfMgaFA8p/AY++9IU/st/++e8ug4qPuXcoN/elmRCEkovnAwrafNWWo
	6o9QWnfdLVamXmM9Z3etpGOxNBO7Q+iGgipoPtjNHVflgK9ZK9d9dp4U2VApDtf7wt5ooQeu2Ewcj
	rqid54ZAHKgu/asP+3bPVEZ9OzDF6X70bEnpgipg3huLH/QgZSGTeCzmtV3U7cg8KO+zQkmtvhPip
	oDs39Qvgmm4vj1buxwAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5Xu-005QFi-Dx; Fri, 04 Nov 2022 22:52:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5Xl-005QB0-UJ
	for linux-riscv@lists.infradead.org; Fri, 04 Nov 2022 22:52:12 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1or5Xi-0001sc-6V; Fri, 04 Nov 2022 23:52:06 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	prabhakar.csengg@gmail.com,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH RFC 8/9] HACK: RISC-V: add zbb support to string functions
Date: Fri,  4 Nov 2022 23:51:52 +0100
Message-Id: <20221104225153.2710873-9-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104225153.2710873-1-heiko@sntech.de>
References: <20221104225153.2710873-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_155210_471690_57DC7692 
X-CRM114-Status: GOOD (  28.96  )
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

Preliminary work on using ZBB to optimize some string functions.
The ZBB-optimized variants itself do not like me yet, so I'm
using copies of the generic functions to test the call-offset
adaptions.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/Kconfig                   | 23 ++++++++
 arch/riscv/include/asm/errata_list.h |  3 +-
 arch/riscv/include/asm/hwcap.h       |  1 +
 arch/riscv/include/asm/string.h      | 27 +++++++--
 arch/riscv/kernel/cpu.c              |  1 +
 arch/riscv/kernel/cpufeature.c       | 18 ++++++
 arch/riscv/lib/Makefile              |  6 ++
 arch/riscv/lib/strcmp_tmp.S          | 25 ++++++++
 arch/riscv/lib/strcmp_zbb.S          | 70 +++++++++++++++++++++++
 arch/riscv/lib/strlen_tmp.S          | 17 ++++++
 arch/riscv/lib/strlen_zbb.S          | 80 ++++++++++++++++++++++++++
 arch/riscv/lib/strncmp_tmp.S         | 27 +++++++++
 arch/riscv/lib/strncmp_zbb.S         | 85 ++++++++++++++++++++++++++++
 13 files changed, 378 insertions(+), 5 deletions(-)
 create mode 100644 arch/riscv/lib/strcmp_tmp.S
 create mode 100644 arch/riscv/lib/strcmp_zbb.S
 create mode 100644 arch/riscv/lib/strlen_tmp.S
 create mode 100644 arch/riscv/lib/strlen_zbb.S
 create mode 100644 arch/riscv/lib/strncmp_tmp.S
 create mode 100644 arch/riscv/lib/strncmp_zbb.S

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index acfc4d298aab..9efb1d4844df 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -411,6 +411,29 @@ config RISCV_ISA_SVPBMT
 
 	   If you don't know what to do here, say Y.
 
+config TOOLCHAIN_HAS_ZBB
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
+	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+
+config RISCV_ISA_ZBB
+	bool "Zbb extension support for "
+	depends on TOOLCHAIN_HAS_ZBB
+	depends on !XIP_KERNEL && MMU
+	select RISCV_ALTERNATIVE
+	default y
+	help
+	   Adds support to dynamically detect the presence of the ZBB
+	   extension (...) and enable its
+	   usage.
+
+	   The Zbb extension can be used to handle for example
+	   ...
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
index b22525290073..ac5555fd9788 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -59,6 +59,7 @@ enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_ZIHINTPAUSE,
 	RISCV_ISA_EXT_SSTC,
 	RISCV_ISA_EXT_SVINVAL,
+	RISCV_ISA_EXT_ZBB,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
index 41eef000d18f..25c8ab2cba2d 100644
--- a/arch/riscv/include/asm/string.h
+++ b/arch/riscv/include/asm/string.h
@@ -6,6 +6,8 @@
 #ifndef _ASM_RISCV_STRING_H
 #define _ASM_RISCV_STRING_H
 
+#include <asm/alternative-macros.h>
+#include <asm/errata_list.h>
 #include <linux/types.h>
 #include <linux/linkage.h>
 
@@ -21,6 +23,7 @@ extern asmlinkage void *__memmove(void *, const void *, size_t);
 
 #define __HAVE_ARCH_STRCMP
 extern asmlinkage int __strcmp_generic(const char *cs, const char *ct);
+extern asmlinkage int __strcmp_tmp(const char *cs, const char *ct);
 
 static __always_inline int strcmp(const char *cs, const char *ct)
 {
@@ -31,7 +34,11 @@ static __always_inline int strcmp(const char *cs, const char *ct)
 	register const char* a1 asm("a1") = ct;
 	register int a0_out asm("a0");
 
-	asm volatile("call __strcmp_generic\n\t"
+	asm volatile(
+		ALTERNATIVE(
+			"call __strcmp_generic\n\t",
+			"call __strcmp_tmp\n\t",
+			0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
 		: "=r"(a0_out)
 		: "r"(a0), "r"(a1)
 		: "ra", "t0", "t1", "t2");
@@ -43,7 +50,7 @@ static __always_inline int strcmp(const char *cs, const char *ct)
 #define __HAVE_ARCH_STRNCMP
 extern asmlinkage int __strncmp_generic(const char *cs,
 					const char *ct, size_t count);
-extern asmlinkage int __strncmp_zbb(const char *cs,
+extern asmlinkage int __strncmp_tmp(const char *cs,
 				    const char *ct, size_t count);
 
 static __always_inline int strncmp(const char *cs, const char *ct, size_t count)
@@ -56,7 +63,11 @@ static __always_inline int strncmp(const char *cs, const char *ct, size_t count)
 	register size_t a2 asm("a2") = count;
 	register int a0_out asm("a0");
 
-	asm volatile("call __strncmp_generic\n\t"
+	asm volatile(
+		ALTERNATIVE(
+			"call __strncmp_generic\n\t",
+			"call __strncmp_tmp\n\t",
+			0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
 		: "=r"(a0_out)
 		: "r"(a0), "r"(a1), "r"(a2)
 		: "ra", "t0", "t1", "t2");
@@ -67,19 +78,27 @@ static __always_inline int strncmp(const char *cs, const char *ct, size_t count)
 
 #define __HAVE_ARCH_STRLEN
 extern asmlinkage __kernel_size_t __strlen_generic(const char *);
+extern asmlinkage __kernel_size_t __strlen_tmp(const char *);
 
 static __always_inline __kernel_size_t strlen(const char *s)
 {
+#ifdef RISCV_EFISTUB
+	return __strlen_generic(s);
+#else
 	register const char* a0 asm("a0") = s;
 	register int a0_out asm("a0");
 
 	asm volatile(
-		"call __strlen_generic\n\t"
+		ALTERNATIVE(
+			"call __strlen_generic\n\t",
+			"call __strlen_tmp\n\t",
+			0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
 		: "=r"(a0_out)
 		: "r"(a0)
 		: "ra", "t0", "t1");
 
 	return a0_out;
+#endif
 }
 
 #define __HAVE_ARCH_STRSTARTS
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index bf9dd6764bad..66ff36a57e20 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -166,6 +166,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 22f3453d6db8..0c296fd1b1a5 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -201,6 +201,7 @@ void __init riscv_fill_hwcap(void)
 			} else {
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
+				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
@@ -278,6 +279,20 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
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
@@ -295,6 +310,9 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
 	if (cpufeature_probe_zicbom(stage))
 		cpu_req_feature |= BIT(CPUFEATURE_ZICBOM);
 
+	if (cpufeature_probe_zbb(stage))
+		cpu_req_feature |= BIT(CPUFEATURE_ZBB);
+
 	return cpu_req_feature;
 }
 
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 38a18ce9acef..e9701fcec72c 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -5,8 +5,14 @@ lib-y			+= memset.o
 lib-y			+= memmove.o
 lib-y			+= string.o
 lib-y			+= strcmp.o
+lib-y			+= strcmp_tmp.o
+lib-$(CONFIG_RISCV_ISA_ZBB) += strcmp_zbb.o
 lib-y			+= strlen.o
+lib-y			+= strlen_tmp.o
+lib-$(CONFIG_RISCV_ISA_ZBB) += strlen_zbb.o
 lib-y			+= strncmp.o
+lib-y			+= strncmp_tmp.o
+lib-$(CONFIG_RISCV_ISA_ZBB) += strncmp_zbb.o
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
 
diff --git a/arch/riscv/lib/strcmp_tmp.S b/arch/riscv/lib/strcmp_tmp.S
new file mode 100644
index 000000000000..b8a6cfdc261b
--- /dev/null
+++ b/arch/riscv/lib/strcmp_tmp.S
@@ -0,0 +1,25 @@
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm-generic/export.h>
+
+/* int __strcmp_tmp(const char *cs, const char *ct) */
+ENTRY(__strcmp_tmp)
+	mv	t2, a1
+1:
+	lbu	t1, 0(a0)
+	lbu	t0, 0(a1)
+	addi	a0, a0, 1
+	addi	a1, a1, 1
+	beq	t1, t0, 3f
+	li	a0, 1
+	bgeu	t1, t0, 2f
+	li	a0, -1
+2:
+	mv	a1, t2
+	ret
+3:
+	bnez	t1, 1b
+	li	a0, 0
+	j	2b
+END(__strcmp_tmp)
+EXPORT_SYMBOL(__strcmp_tmp)
diff --git a/arch/riscv/lib/strcmp_zbb.S b/arch/riscv/lib/strcmp_zbb.S
new file mode 100644
index 000000000000..3137d0912a90
--- /dev/null
+++ b/arch/riscv/lib/strcmp_zbb.S
@@ -0,0 +1,70 @@
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm-generic/export.h>
+
+#define src1		a0
+#define result		a0
+#define src2		a1
+#define data1		a2
+#define data2		a3
+#define align		a4
+#define data1_orcb	t0
+#define m1		t2
+
+.option push
+.option arch,+zbb
+
+ENTRY(__strcmp_zbb)
+	or	align, src1, src2
+	li	m1, -1
+	and	align, align, SZREG-1
+	bnez	align, 3f
+	/* Main loop for aligned string.  */
+	.p2align 3
+1:
+	REG_L	data1, 0(src1)
+	REG_L	data2, 0(src2)
+	orc.b	data1_orcb, data1
+	bne	data1_orcb, m1, 2f
+	addi	src1, src1, SZREG
+	addi	src2, src2, SZREG
+	beq	data1, data2, 1b
+
+	/* Words don't match, and no null byte in the first
+	 * word. Get bytes in big-endian order and compare.  */
+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+	rev8	data1, data1
+	rev8	data2, data2
+#endif
+	/* Synthesize (data1 >= data2) ? 1 : -1 in a branchless sequence.  */
+	sltu	result, data1, data2
+	neg	result, result
+	ori	result, result, 1
+	ret
+
+2:
+	/* Found a null byte.
+	 * If words don't match, fall back to simple loop.  */
+	bne	data1, data2, 3f
+
+	/* Otherwise, strings are equal.  */
+	li	result, 0
+	ret
+
+	/* Simple loop for misaligned strings.  */
+	.p2align 3
+3:
+	lbu	data1, 0(src1)
+	lbu	data2, 0(src2)
+	addi	src1, src1, 1
+	addi	src2, src2, 1
+	bne	data1, data2, 4f
+	bnez	data1, 3b
+
+4:
+	sub	result, data1, data2
+	ret
+END(__strcmp_zbb)
+EXPORT_SYMBOL(__strcmp_zbb)
+
+.option pop
diff --git a/arch/riscv/lib/strlen_tmp.S b/arch/riscv/lib/strlen_tmp.S
new file mode 100644
index 000000000000..45a7d1f6dfad
--- /dev/null
+++ b/arch/riscv/lib/strlen_tmp.S
@@ -0,0 +1,17 @@
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm-generic/export.h>
+
+/* int __strlen_tmp(const char *s) */
+ENTRY(__strlen_tmp)
+	mv	t1, a0
+1:
+	lbu	t0, 0(t1)
+	bnez	t0, 2f
+	sub	a0, t1, a0
+	ret
+2:
+	addi	t1, t1, 1
+	j	1b
+END(__strlen_tmp)
+EXPORT_SYMBOL(__strlen_tmp)
diff --git a/arch/riscv/lib/strlen_zbb.S b/arch/riscv/lib/strlen_zbb.S
new file mode 100644
index 000000000000..9bcd3fecd099
--- /dev/null
+++ b/arch/riscv/lib/strlen_zbb.S
@@ -0,0 +1,80 @@
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm-generic/export.h>
+
+#define src		a0
+#define result		a0
+#define addr		a1
+#define data		a2
+#define offset		a3
+#define offset_bits	a3
+#define valid_bytes	a4
+#define m1		a4
+
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
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
+ENTRY(__strlen_zbb)
+	/* Number of irrelevant bytes in the first word.  */
+	andi	offset, src, SZREG-1
+	/* Align pointer.  */
+	andi	addr, src, -SZREG
+
+	li	valid_bytes, SZREG
+	sub	valid_bytes, valid_bytes, offset
+	slli	offset_bits, offset, RISCV_LGPTR
+
+	/* Get the first word.  */
+	REG_L	data, 0(addr)
+	/* Shift away the partial data we loaded to remove the irrelevant bytes
+	 * preceeding the string with the effect of adding NUL bytes at the
+	 * end of the string.  */
+	SHIFT	data, data, offset_bits
+	/* Convert non-NUL into 0xff and NUL into 0x00.  */
+	orc.b	data, data
+	/* Convert non-NUL into 0x00 and NUL into 0xff.  */
+	not	data, data
+	/* Search for the first set bit (corresponding to a NUL byte in the
+	 * original chunk).  */
+	CZ	data, data
+	/* The first chunk is special: commpare against the number
+	 * of valid bytes in this chunk.  */
+	srli	result, data, 3
+	bgtu	valid_bytes, result, 3f
+
+	/* Prepare for the word comparison loop.  */
+	addi	offset, addr, SZREG
+	li	m1, -1
+
+	/* Our critical loop is 4 instructions and processes data in
+	 * 4 byte or 8 byte chunks.  */
+	.p2align 3
+1:
+	REG_L	data, SZREG(addr)
+	addi	addr, addr, SZREG
+	orc.b	data, data
+	beq	data, m1, 1b
+2:
+	not	data, data
+	CZ	data, data
+	/* Get number of processed words.  */
+	sub	offset, addr, offset
+	/* Add number of characters in the first word.  */
+	add	result, result, offset
+	srli	data, data, 3
+	/* Add number of characters in the last word.  */
+	add	result, result, data
+3:
+	ret
+END(__strlen_zbb)
+EXPORT_SYMBOL(__strlen_zbb)
+
+.option pop
diff --git a/arch/riscv/lib/strncmp_tmp.S b/arch/riscv/lib/strncmp_tmp.S
new file mode 100644
index 000000000000..01c10c8b58b0
--- /dev/null
+++ b/arch/riscv/lib/strncmp_tmp.S
@@ -0,0 +1,27 @@
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm-generic/export.h>
+
+/* int __strncmp_tmp(const char *cs, const char *ct, size_t count) */
+ENTRY(__strncmp_tmp)
+	li	t0, 0
+1:
+	beq	a2, t0, 4f
+	add	t1, a0, t0
+	add	t2, a1, t0
+	lbu	t1, 0(t1)
+	lbu	t2, 0(t2)
+	beq	t1, t2, 3f
+	li	a0, 1
+	bgeu	t1, t2, 2f
+	li	a0, -1
+2:
+	ret
+3:
+	addi	t0, t0, 1
+	bnez	t1, 1b
+4:
+	li	a0, 0
+	j	2b
+END(__strncmp_tmp)
+EXPORT_SYMBOL(__strncmp_tmp)
diff --git a/arch/riscv/lib/strncmp_zbb.S b/arch/riscv/lib/strncmp_zbb.S
new file mode 100644
index 000000000000..e9bd94ebac25
--- /dev/null
+++ b/arch/riscv/lib/strncmp_zbb.S
@@ -0,0 +1,85 @@
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm-generic/export.h>
+
+#define src1		a0
+#define result		a0
+#define src2		a1
+#define len		a2
+#define data1		a2
+#define data2		a3
+#define align		a4
+#define data1_orcb	a5
+#define limit		t0
+#define m1		t1
+
+.option push
+.option arch,+zbb
+
+ENTRY(__strncmp_zbb)
+	or	align, src1, src2
+	li	m1, -1
+	and	align, align, SZREG-1
+	add	limit, src1, len
+	bnez	align, 4f
+
+	/* Adjust limit for fast-path.  */
+	addi	limit, limit, -SZREG
+	/* Main loop for aligned string.  */
+	.p2align 3
+1:
+	bgt	src1, limit, 3f
+	REG_L	data1, 0(src1)
+	REG_L	data2, 0(src2)
+	orc.b	data1_orcb, data1
+	bne	data1_orcb, m1, 2f
+	addi	src1, src1, SZREG
+	addi	src2, src2, SZREG
+	beq	data1, data2, 1b
+
+	/* Words don't match, and no null byte in the first
+	 * word. Get bytes in big-endian order and compare.  */
+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+	rev8	data1, data1
+	rev8	data2, data2
+#endif
+	/* Synthesize (data1 >= data2) ? 1 : -1 in a branchless sequence.  */
+	sltu	result, data1, data2
+	neg	result, result
+	ori	result, result, 1
+	ret
+
+2:
+	/* Found a null byte.
+	 * If words don't match, fall back to simple loop.  */
+	bne	data1, data2, 3f
+
+	/* Otherwise, strings are equal.  */
+	li	result, 0
+	ret
+
+	/* Simple loop for misaligned strings.  */
+3:
+	/* Restore limit for slow-path.  */
+	addi	limit, limit, SZREG
+	.p2align 3
+4:
+	bge	src1, limit, 6f
+	lbu	data1, 0(src1)
+	lbu	data2, 0(src2)
+	addi	src1, src1, 1
+	addi	src2, src2, 1
+	bne	data1, data2, 5f
+	bnez	data1, 4b
+
+5:
+	sub	result, data1, data2
+	ret
+
+6:
+	li	result, 0
+	ret
+END(__strncmp_zbb)
+EXPORT_SYMBOL(__strncmp_zbb)
+
+.option pop
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
