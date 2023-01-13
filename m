Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96081C3DA78
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 21:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lznts5J8MYI+VeLOLlDV3RF1RojlMG8y/54Ydtip3Zc=; b=M4S3LNzj82JbOv
	Uf8IJEG97mW1xAWYPPXNAdJ6PDq/JrxTMCm4fP3zmCFSkwFrE4EeA7/RDzvLEc9+L1fZ1Gq/BpNVy
	1JKTYyt0+vQzsrdl+7G/zxHdBpu4al30l0SiOnyMGJ7CSU5pEDeqLd0DX8dohgeHfRHELNgvSP1/n
	xBIMW4sRp8HXvGzrqWI2CXi+aiN7yvcZil+8ZCSAgHRq4+FttBNkn6kTEWK8VZFpXamjNRg+V1tZs
	nDOhujOLOCIg+46PbTXD12gWgY4mT4FdQMwjcWDa/8KjTZqTj1A6x3QEYxYCZyyvU9jjTwJyt9Hen
	Zy8biY11kI5TPJnVa/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRXQ-004bIg-FT; Fri, 13 Jan 2023 21:24:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRWm-004axY-Dh
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 21:24:03 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pGRWk-0003WV-Ms; Fri, 13 Jan 2023 22:23:54 +0100
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
Subject: [PATCH 2/4] RISC-V: add alternative-field for bits to not match against
Date: Fri, 13 Jan 2023 22:23:49 +0100
Message-Id: <20230113212351.3534769-3-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230113212351.3534769-1-heiko@sntech.de>
References: <20230113212351.3534769-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_132356_647569_2661614A 
X-CRM114-Status: GOOD (  20.47  )
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

Alternatives on RISC-V do not necessarily know about each other. So an
alternative is always defined by the new code and a vendor+"errata"
identifier and this whole block then points to the old code it wants to
possibly replace.

This is actually also a nice feature, as it reduces complexity and allows
different sources for alternatives (cpu-features, vendor-errata) to
co-exist.

When using a bitfield for cpufeatures to support combinations it creates
the need to also specify what to not match against.

For example an alternative for zbb could simply work for any core supporting
zbb but on the other hand it could also have a still better variant for
zbb + extension-x.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/alternative-macros.h | 64 +++++++++++----------
 arch/riscv/include/asm/alternative.h        |  1 +
 arch/riscv/include/asm/errata_list.h        | 18 +++---
 arch/riscv/kernel/cpufeature.c              |  3 +-
 arch/riscv/lib/strcmp.S                     |  2 +-
 arch/riscv/lib/strlen.S                     |  2 +-
 arch/riscv/lib/strncmp.S                    |  2 +-
 7 files changed, 48 insertions(+), 44 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 2c0f4c887289..b80ea0d15c67 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -6,18 +6,19 @@
 
 #ifdef __ASSEMBLY__
 
-.macro ALT_ENTRY oldptr newptr vendor_id errata_id new_len
+.macro ALT_ENTRY oldptr newptr new_len vendor_id errata_id errata_not
 	RISCV_PTR \oldptr
 	RISCV_PTR \newptr
 	REG_ASM \vendor_id
 	REG_ASM \new_len
 	.word	\errata_id
+	.word	\errata_not
 .endm
 
-.macro ALT_NEW_CONTENT vendor_id, errata_id, enable = 1, new_c : vararg
+.macro ALT_NEW_CONTENT vendor_id, errata_id, errata_not, enable = 1, new_c : vararg
 	.if \enable
 	.pushsection .alternative, "a"
-	ALT_ENTRY 886b, 888f, \vendor_id, \errata_id, 889f - 888f
+	ALT_ENTRY 886b, 888f, 889f - 888f, \vendor_id, \errata_id, \errata_not
 	.popsection
 	.subsection 1
 888 :
@@ -33,7 +34,7 @@
 	.endif
 .endm
 
-.macro ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, enable
+.macro ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, errata_not, enable
 886 :
 	.option push
 	.option norvc
@@ -41,13 +42,13 @@
 	\old_c
 	.option pop
 887 :
-	ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, \new_c
+	ALT_NEW_CONTENT \vendor_id, \errata_id, \errata_not, \enable, \new_c
 .endm
 
-.macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
-				new_c_2, vendor_id_2, errata_id_2, enable_2
-	ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \errata_id_1, \enable_1
-	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
+.macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, errata_not_1, enable_1,	\
+				new_c_2, vendor_id_2, errata_id_2, errata_not_2, enable_2
+	ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \errata_id_1, \errata_not_1, \enable_1
+	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \errata_not_2, \enable_2, \new_c_2
 .endm
 
 #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
@@ -58,17 +59,18 @@
 #include <asm/asm.h>
 #include <linux/stringify.h>
 
-#define ALT_ENTRY(oldptr, newptr, vendor_id, errata_id, newlen)		\
+#define ALT_ENTRY(oldptr, newptr, newlen, vendor_id, errata_id, errata_not) \
 	RISCV_PTR " " oldptr "\n"					\
 	RISCV_PTR " " newptr "\n"					\
 	REG_ASM " " vendor_id "\n"					\
 	REG_ASM " " newlen "\n"						\
-	".word " errata_id "\n"
+	".word " errata_id "\n"						\
+	".word " errata_not "\n"
 
-#define ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)		\
+#define ALT_NEW_CONTENT(vendor_id, errata_id, errata_not, enable, new_c) \
 	".if " __stringify(enable) " == 1\n"				\
 	".pushsection .alternative, \"a\"\n"				\
-	ALT_ENTRY("886b", "888f", __stringify(vendor_id), __stringify(errata_id), "889f - 888f") \
+	ALT_ENTRY("886b", "888f", "889f - 888f", __stringify(vendor_id), __stringify(errata_id), __stringify(errata_not)) \
 	".popsection\n"							\
 	".subsection 1\n"						\
 	"888 :\n"							\
@@ -83,7 +85,7 @@
 	".previous\n"							\
 	".endif\n"
 
-#define __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, enable)	\
+#define __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, errata_not, enable) \
 	"886 :\n"							\
 	".option push\n"						\
 	".option norvc\n"						\
@@ -91,22 +93,22 @@
 	old_c "\n"							\
 	".option pop\n"							\
 	"887 :\n"							\
-	ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
+	ALT_NEW_CONTENT(vendor_id, errata_id, errata_not, enable, new_c)
 
-#define __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
-				   new_c_2, vendor_id_2, errata_id_2, enable_2)	\
-	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1)	\
-	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
+#define __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, errata_not_1, enable_1,	\
+				   new_c_2, vendor_id_2, errata_id_2, errata_not_2, enable_2)	\
+	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, errata_not_1, enable_1)	\
+	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, errata_not_2, enable_2, new_c_2)
 
 #endif /* __ASSEMBLY__ */
 
-#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)	\
-	__ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
+#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, errata_not, CONFIG_k)	\
+	__ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, errata_not, IS_ENABLED(CONFIG_k))
 
-#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
-				  new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2)		\
-	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),	\
-				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2))
+#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, errata_not_1, CONFIG_k_1,		\
+				  new_c_2, vendor_id_2, errata_id_2, errata_not_2, CONFIG_k_2)		\
+	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, errata_not_1, IS_ENABLED(CONFIG_k_1),	\
+				   new_c_2, vendor_id_2, errata_id_2, errata_not_2, IS_ENABLED(CONFIG_k_2))
 
 #else /* CONFIG_RISCV_ALTERNATIVE */
 #ifdef __ASSEMBLY__
@@ -148,8 +150,8 @@
  * CONFIG_k: The Kconfig of this errata. When Kconfig is disabled, the old
  *	     content will alwyas be executed.
  */
-#define ALTERNATIVE(old_content, new_content, vendor_id, errata_id, CONFIG_k) \
-	_ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
+#define ALTERNATIVE(old_content, new_content, vendor_id, errata_id, errata_not, CONFIG_k) \
+	_ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, errata_not, CONFIG_k)
 
 /*
  * A vendor wants to replace an old_content, but another vendor has used
@@ -158,9 +160,9 @@
  * on the following sample code and then replace ALTERNATIVE() with
  * ALTERNATIVE_2() to append its customized content.
  */
-#define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
-				   new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)		\
-	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,	\
-					new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)
+#define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1, errata_id_1, errata_not_1, CONFIG_k_1,		\
+				   new_content_2, vendor_id_2, errata_id_2, errata_not_2, CONFIG_k_2)		\
+	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, errata_id_1, errata_not_1, CONFIG_k_1,	\
+					new_content_2, vendor_id_2, errata_id_2, errata_not_2, CONFIG_k_2)
 
 #endif
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 1bd4027d34ca..d08c563ab7d8 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -36,6 +36,7 @@ struct alt_entry {
 	unsigned long vendor_id; /* cpu vendor id */
 	unsigned long alt_len;   /* The replacement size */
 	unsigned int errata_id;  /* The errata id */
+	unsigned int errata_not; /* Errata id not to match against */
 } __packed;
 
 struct errata_checkfunc_id {
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 40c9e9c3295b..043b79c79824 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -32,19 +32,19 @@
 #define ALT_INSN_FAULT(x)						\
 ALTERNATIVE(__stringify(RISCV_PTR do_trap_insn_fault),			\
 	    __stringify(RISCV_PTR sifive_cip_453_insn_fault_trp),	\
-	    SIFIVE_VENDOR_ID, ERRATA_SIFIVE_CIP_453,			\
+	    SIFIVE_VENDOR_ID, ERRATA_SIFIVE_CIP_453, 0,			\
 	    CONFIG_ERRATA_SIFIVE_CIP_453)
 
 #define ALT_PAGE_FAULT(x)						\
 ALTERNATIVE(__stringify(RISCV_PTR do_page_fault),			\
 	    __stringify(RISCV_PTR sifive_cip_453_page_fault_trp),	\
-	    SIFIVE_VENDOR_ID, ERRATA_SIFIVE_CIP_453,			\
+	    SIFIVE_VENDOR_ID, ERRATA_SIFIVE_CIP_453, 0,			\
 	    CONFIG_ERRATA_SIFIVE_CIP_453)
 #else /* !__ASSEMBLY__ */
 
 #define ALT_FLUSH_TLB_PAGE(x)						\
 asm(ALTERNATIVE("sfence.vma %0", "sfence.vma", SIFIVE_VENDOR_ID,	\
-		ERRATA_SIFIVE_CIP_1200, CONFIG_ERRATA_SIFIVE_CIP_1200)	\
+		ERRATA_SIFIVE_CIP_1200, 0, CONFIG_ERRATA_SIFIVE_CIP_1200) \
 		: : "r" (addr) : "memory")
 
 /*
@@ -56,9 +56,9 @@ asm(ALTERNATIVE("sfence.vma %0", "sfence.vma", SIFIVE_VENDOR_ID,	\
 #define ALT_SVPBMT(_val, prot)						\
 asm(ALTERNATIVE_2("li %0, 0\t\nnop",					\
 		  "li %0, %1\t\nslli %0,%0,%3", 0,			\
-			CPUFEATURE_SVPBMT, CONFIG_RISCV_ISA_SVPBMT,	\
+			CPUFEATURE_SVPBMT, 0, CONFIG_RISCV_ISA_SVPBMT,	\
 		  "li %0, %2\t\nslli %0,%0,%4", THEAD_VENDOR_ID,	\
-			ERRATA_THEAD_PBMT, CONFIG_ERRATA_THEAD_PBMT)	\
+			ERRATA_THEAD_PBMT, 0, CONFIG_ERRATA_THEAD_PBMT)	\
 		: "=r"(_val)						\
 		: "I"(prot##_SVPBMT >> ALT_SVPBMT_SHIFT),		\
 		  "I"(prot##_THEAD >> ALT_THEAD_PBMT_SHIFT),		\
@@ -82,7 +82,7 @@ asm volatile(ALTERNATIVE(						\
 	"slli    t3, t3, %3\n\t"					\
 	"or      %0, %0, t3\n\t"					\
 	"2:",  THEAD_VENDOR_ID,						\
-		ERRATA_THEAD_PBMT, CONFIG_ERRATA_THEAD_PBMT)		\
+		ERRATA_THEAD_PBMT, 0, CONFIG_ERRATA_THEAD_PBMT)		\
 	: "+r"(_val)							\
 	: "I"(_PAGE_MTMASK_THEAD >> ALT_THEAD_PBMT_SHIFT),		\
 	  "I"(_PAGE_PMA_THEAD >> ALT_THEAD_PBMT_SHIFT),			\
@@ -130,7 +130,7 @@ asm volatile(ALTERNATIVE_2(						\
 	"add a0, a0, %0\n\t"						\
 	"2:\n\t"							\
 	"bltu a0, %2, 3b\n\t"						\
-	"nop", 0, CPUFEATURE_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,		\
+	"nop", 0, CPUFEATURE_ZICBOM, 0, CONFIG_RISCV_ISA_ZICBOM,	\
 	"mv a0, %1\n\t"							\
 	"j 2f\n\t"							\
 	"3:\n\t"							\
@@ -139,7 +139,7 @@ asm volatile(ALTERNATIVE_2(						\
 	"2:\n\t"							\
 	"bltu a0, %2, 3b\n\t"						\
 	THEAD_SYNC_S, THEAD_VENDOR_ID,					\
-			ERRATA_THEAD_CMO, CONFIG_ERRATA_THEAD_CMO)	\
+			ERRATA_THEAD_CMO, 0, CONFIG_ERRATA_THEAD_CMO)	\
 	: : "r"(_cachesize),						\
 	    "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),	\
 	    "r"((unsigned long)(_start) + (_size))			\
@@ -152,7 +152,7 @@ asm volatile(ALTERNATIVE_2(						\
 asm volatile(ALTERNATIVE(						\
 	"csrr %0, " __stringify(CSR_SSCOUNTOVF),			\
 	"csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),		\
-		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
+		THEAD_VENDOR_ID, ERRATA_THEAD_PMU, 0,			\
 		CONFIG_ERRATA_THEAD_PMU)				\
 	: "=r" (__ovl) :						\
 	: "memory")
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 8c83bd9d0e22..a65bebdadb68 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -377,7 +377,8 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 			continue;
 		}
 
-		if ((cpu_req_feature & alt->errata_id) == alt->errata_id) {
+		if ((cpu_req_feature & alt->errata_id) == alt->errata_id &&
+		    (~cpu_req_feature & alt->errata_not)) {
 			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
 			riscv_alternative_fix_offsets(alt->old_ptr, alt->alt_len,
 						      alt->old_ptr - alt->alt_ptr);
diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
index 8148b6418f61..ce85bbbee4b9 100644
--- a/arch/riscv/lib/strcmp.S
+++ b/arch/riscv/lib/strcmp.S
@@ -9,7 +9,7 @@
 /* int strcmp(const char *cs, const char *ct) */
 SYM_FUNC_START(strcmp)
 
-	ALTERNATIVE("nop", "j strcmp_zbb", 0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
+	ALTERNATIVE_2("nop", "j strcmp_zbb", 0, CPUFEATURE_ZBB, 0, CONFIG_RISCV_ISA_ZBB)
 
 	/*
 	 * Returns
diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
index 0f9dbf93301a..8fdd53a734b4 100644
--- a/arch/riscv/lib/strlen.S
+++ b/arch/riscv/lib/strlen.S
@@ -9,7 +9,7 @@
 /* int strlen(const char *s) */
 SYM_FUNC_START(strlen)
 
-	ALTERNATIVE("nop", "j strlen_zbb", 0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
+	ALTERNATIVE("nop", "j strlen_zbb", 0, CPUFEATURE_ZBB, 0, CONFIG_RISCV_ISA_ZBB)
 
 	/*
 	 * Returns
diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
index 7940ddab2d48..e46ad168f1e4 100644
--- a/arch/riscv/lib/strncmp.S
+++ b/arch/riscv/lib/strncmp.S
@@ -9,7 +9,7 @@
 /* int strncmp(const char *cs, const char *ct, size_t count) */
 SYM_FUNC_START(strncmp)
 
-	ALTERNATIVE("nop", "j strncmp_zbb", 0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
+	ALTERNATIVE("nop", "j strncmp_zbb", 0, CPUFEATURE_ZBB, 0, CONFIG_RISCV_ISA_ZBB)
 
 	/*
 	 * Returns
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
