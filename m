Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CCDC64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 18:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxuYqsMJ6F6Yeb6sF2YYc43h9nhhtk6mw7p6KIUJBw0=; b=Pa/WX45RlVPr5i
	xDpjiaRAvDmRFKAqf4aGkzTY2WPynWe6rwZFjR2pMVjP1yx/HBKmGnLT0Lz/urgG5GNJujZn5bf0F
	t5m/GMocJYODu0b/cBXRRvCWeUCXQDg6RHheFFmZvnjmbiwvtRJqk2k0kvO+qAk79a4iAS1FhBGVw
	LWaCI5ceUcMjjaFI6vgFpDPXSenDh8vvX44uqoR12eKti33uHenW/nGV4elQ56Y33QCSRUfDqLp0A
	dYHX5yPvLBLOv3DOdFIsIQYvJTIAHyPDH43byqTUVvl1N0+wKYO0sr32FWPCTU/17pr1VdkZ+4LYa
	rnrpAEj+ViChmmEifoEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXoM-009RnT-6H; Tue, 21 Feb 2023 18:56:22 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXoA-009Rgq-Dd
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 18:56:12 +0000
Received: by mail-ed1-x52e.google.com with SMTP id g1so20995393edz.7
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 10:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGwBxo7OcBRhOdIXwXXtPxjsoCQeaadZRw3ZvkvtyNc=;
        b=Fa4yY+KfFWKhap+E/OVFBWgQtpqV8H1llQbd/GBZjGkREQbjiyAVke82qo03cUeJkM
         ZIHmz9xXbjB8qYQColepfoonzBqhtXcWu/uksTZ8zxcYkPcQd7tw2GaHhwWI0hslB2np
         nwE66cNfAorRXDNr3zOcTzzHSUNmbEXafbbLFB44drzLWEak/MAxfPEiUriWKs0dBgiX
         SsXEooCz6+Pd7Rxk1fRbXeaIRNmQDvRZhVPB1sSb0+dNyeyYLR7E2atgGwNMi9N21YDD
         ifroh9xcYSDSCx/GYIWCWV8LxMUBBvMHOIiQ3KMHHsu0A2jHxDYodQL5X8JRbkwXHkI8
         ZpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGwBxo7OcBRhOdIXwXXtPxjsoCQeaadZRw3ZvkvtyNc=;
        b=DuopbCIEwdhMCS1Xh8dowzSYCFQgzJJ/sIeWRdvDAUjbRadUpG4rmRF2uYnMVcqRb3
         fpXzDfScRHRnX0YEo/BLrG1f3oDad8/N5AE2+DHGbX6AiQTMtPfpHe2DMw0tk4Zl4QLg
         DQoag9c16CR0kpc6Dr+o6/CcS8av78UJNePj1LpXcnW3GScViIFSQzcq5VH/3xXqLh+K
         iSSP4CShZp/f8JevwDi8bzz38Wi8rkux8ARQIyghGMERWCER0E7lGDwqa/VuFtcWMYM6
         P51bzJhKgHha62IidS4BhsSwnCIFIfp0SPhA4/Hvb8Qe6i6Lp8DadtJcWtABi8Nu8h7F
         PLKA==
X-Gm-Message-State: AO0yUKV6fb/t827GyEO2+A3C5tPL4fO/f9VsBaiIF+GoiZEnGbOE+KrR
	vQujzRW2czCITjl3OJ+ev2VEVsc0CJDgOqtW
X-Google-Smtp-Source: AK7set/LPmrUQFVHQiN6+GJvEJSw5KyUgSFz+PSCfo9+cCLp1FkNaf644XLw7VBl5pxXL81ogi0J9g==
X-Received: by 2002:aa7:cc0f:0:b0:4ab:4bb7:6ee8 with SMTP id q15-20020aa7cc0f000000b004ab4bb76ee8mr6073351edt.25.1677005769645;
        Tue, 21 Feb 2023 10:56:09 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id 19-20020a508e13000000b004aef609f747sm3564501edw.3.2023.02.21.10.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:56:09 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: 'Jisheng Zhang ' <jszhang@kernel.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: [PATCH 3/5] riscv: alternatives: Rename errata_id to patch_id
Date: Tue, 21 Feb 2023 19:56:01 +0100
Message-Id: <20230221185603.570882-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221185603.570882-1-ajones@ventanamicro.com>
References: <20230221185603.570882-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_105610_532259_D2C293F8 
X-CRM114-Status: GOOD (  17.63  )
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

Alternatives are used for both errata and cpufeatures. Use a more
generic name, 'patch_id', as in "ID of code patching site", to
avoid confusion when alternatives are used for cpufeatures.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig                          |  6 +-
 arch/riscv/errata/sifive/errata.c           |  6 +-
 arch/riscv/errata/thead/errata.c            |  4 +-
 arch/riscv/include/asm/alternative-macros.h | 72 ++++++++++-----------
 arch/riscv/include/asm/alternative.h        |  2 +-
 arch/riscv/kernel/cpufeature.c              |  6 +-
 6 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 736f42f572aa..0c494c36e911 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -377,9 +377,9 @@ config RISCV_ALTERNATIVE
 	depends on !XIP_KERNEL
 	help
 	  This Kconfig allows the kernel to automatically patch the
-	  errata required by the execution platform at run time. The
-	  code patching is performed once in the boot stages. It means
-	  that the overhead from this mechanism is just taken once.
+	  erratum or cpufeature required by the execution platform at run
+	  time. The code patching is performed once in the boot stages. It
+	  means that the overhead from this mechanism is just taken once.
 
 config RISCV_ALTERNATIVE_EARLY
 	bool
diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index 9e7dffa800f2..3fe8bab5bb9e 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -100,12 +100,12 @@ void __init_or_module sifive_errata_patch_func(struct alt_entry *begin,
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != SIFIVE_VENDOR_ID)
 			continue;
-		if (alt->errata_id >= ERRATA_SIFIVE_NUMBER) {
-			WARN(1, "This errata id:%d is not in kernel errata list", alt->errata_id);
+		if (alt->patch_id >= ERRATA_SIFIVE_NUMBER) {
+			WARN(1, "This errata id:%d is not in kernel errata list", alt->patch_id);
 			continue;
 		}
 
-		tmp = (1U << alt->errata_id);
+		tmp = (1U << alt->patch_id);
 		if (cpu_req_errata & tmp) {
 			patch_text_nosync(ALT_OLD_PTR(alt), ALT_ALT_PTR(alt),
 					  alt->alt_len);
diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index 1dd90a5f86f0..39fc144f1b1f 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -92,10 +92,10 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != THEAD_VENDOR_ID)
 			continue;
-		if (alt->errata_id >= ERRATA_THEAD_NUMBER)
+		if (alt->patch_id >= ERRATA_THEAD_NUMBER)
 			continue;
 
-		tmp = (1U << alt->errata_id);
+		tmp = (1U << alt->patch_id);
 		if (cpu_req_errata & tmp) {
 			oldptr = ALT_OLD_PTR(alt);
 			altptr = ALT_ALT_PTR(alt);
diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 51c6867e02f3..993a44a8fdac 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -6,18 +6,18 @@
 
 #ifdef __ASSEMBLY__
 
-.macro ALT_ENTRY oldptr newptr vendor_id errata_id new_len
+.macro ALT_ENTRY oldptr newptr vendor_id patch_id new_len
 	.4byte \oldptr - .
 	.4byte \newptr - .
 	.2byte \vendor_id
 	.2byte \new_len
-	.4byte \errata_id
+	.4byte \patch_id
 .endm
 
-.macro ALT_NEW_CONTENT vendor_id, errata_id, enable = 1, new_c : vararg
+.macro ALT_NEW_CONTENT vendor_id, patch_id, enable = 1, new_c : vararg
 	.if \enable
 	.pushsection .alternative, "a"
-	ALT_ENTRY 886b, 888f, \vendor_id, \errata_id, 889f - 888f
+	ALT_ENTRY 886b, 888f, \vendor_id, \patch_id, 889f - 888f
 	.popsection
 	.subsection 1
 888 :
@@ -33,7 +33,7 @@
 	.endif
 .endm
 
-.macro ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, enable
+.macro ALTERNATIVE_CFG old_c, new_c, vendor_id, patch_id, enable
 886 :
 	.option push
 	.option norvc
@@ -41,13 +41,13 @@
 	\old_c
 	.option pop
 887 :
-	ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, \new_c
+	ALT_NEW_CONTENT \vendor_id, \patch_id, \enable, \new_c
 .endm
 
-.macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
-				new_c_2, vendor_id_2, errata_id_2, enable_2
-	ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \errata_id_1, \enable_1
-	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
+.macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, patch_id_1, enable_1,	\
+				new_c_2, vendor_id_2, patch_id_2, enable_2
+	ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \patch_id_1, \enable_1
+	ALT_NEW_CONTENT \vendor_id_2, \patch_id_2, \enable_2, \new_c_2
 .endm
 
 #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
@@ -58,17 +58,17 @@
 #include <asm/asm.h>
 #include <linux/stringify.h>
 
-#define ALT_ENTRY(oldptr, newptr, vendor_id, errata_id, newlen)		\
+#define ALT_ENTRY(oldptr, newptr, vendor_id, patch_id, newlen)		\
 	".4byte	((" oldptr ") - .) \n"					\
 	".4byte	((" newptr ") - .) \n"					\
 	".2byte	" vendor_id "\n"					\
 	".2byte " newlen "\n"						\
-	".4byte	" errata_id "\n"
+	".4byte	" patch_id "\n"
 
-#define ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)		\
+#define ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)		\
 	".if " __stringify(enable) " == 1\n"				\
 	".pushsection .alternative, \"a\"\n"				\
-	ALT_ENTRY("886b", "888f", __stringify(vendor_id), __stringify(errata_id), "889f - 888f") \
+	ALT_ENTRY("886b", "888f", __stringify(vendor_id), __stringify(patch_id), "889f - 888f") \
 	".popsection\n"							\
 	".subsection 1\n"						\
 	"888 :\n"							\
@@ -83,7 +83,7 @@
 	".previous\n"							\
 	".endif\n"
 
-#define __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, enable)	\
+#define __ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, enable)	\
 	"886 :\n"							\
 	".option push\n"						\
 	".option norvc\n"						\
@@ -91,22 +91,22 @@
 	old_c "\n"							\
 	".option pop\n"							\
 	"887 :\n"							\
-	ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
+	ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
 
-#define __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
-				   new_c_2, vendor_id_2, errata_id_2, enable_2)	\
-	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1)	\
-	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
+#define __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1,	\
+				   new_c_2, vendor_id_2, patch_id_2, enable_2)	\
+	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1)	\
+	ALT_NEW_CONTENT(vendor_id_2, patch_id_2, enable_2, new_c_2)
 
 #endif /* __ASSEMBLY__ */
 
-#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)	\
-	__ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
+#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, CONFIG_k)	\
+	__ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, IS_ENABLED(CONFIG_k))
 
-#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
-				  new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2)		\
-	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),	\
-				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2))
+#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, CONFIG_k_1,		\
+				  new_c_2, vendor_id_2, patch_id_2, CONFIG_k_2)		\
+	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),	\
+				   new_c_2, vendor_id_2, patch_id_2, IS_ENABLED(CONFIG_k_2))
 
 #else /* CONFIG_RISCV_ALTERNATIVE */
 #ifdef __ASSEMBLY__
@@ -137,19 +137,19 @@
 
 /*
  * Usage:
- *   ALTERNATIVE(old_content, new_content, vendor_id, errata_id, CONFIG_k)
+ *   ALTERNATIVE(old_content, new_content, vendor_id, patch_id, CONFIG_k)
  * in the assembly code. Otherwise,
- *   asm(ALTERNATIVE(old_content, new_content, vendor_id, errata_id, CONFIG_k));
+ *   asm(ALTERNATIVE(old_content, new_content, vendor_id, patch_id, CONFIG_k));
  *
  * old_content: The old content which is probably replaced with new content.
  * new_content: The new content.
  * vendor_id: The CPU vendor ID.
- * errata_id: The errata ID.
- * CONFIG_k: The Kconfig of this errata. When Kconfig is disabled, the old
+ * patch_id: The patch ID (erratum ID or cpufeature ID).
+ * CONFIG_k: The Kconfig of this patch ID. When Kconfig is disabled, the old
  *	     content will alwyas be executed.
  */
-#define ALTERNATIVE(old_content, new_content, vendor_id, errata_id, CONFIG_k) \
-	_ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
+#define ALTERNATIVE(old_content, new_content, vendor_id, patch_id, CONFIG_k) \
+	_ALTERNATIVE_CFG(old_content, new_content, vendor_id, patch_id, CONFIG_k)
 
 /*
  * A vendor wants to replace an old_content, but another vendor has used
@@ -158,9 +158,9 @@
  * on the following sample code and then replace ALTERNATIVE() with
  * ALTERNATIVE_2() to append its customized content.
  */
-#define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
-				   new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)		\
-	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,	\
-					new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)
+#define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,		\
+				   new_content_2, vendor_id_2, patch_id_2, CONFIG_k_2)		\
+	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,	\
+					new_content_2, vendor_id_2, patch_id_2, CONFIG_k_2)
 
 #endif
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 3beef400a971..8f39d4e8598d 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -38,7 +38,7 @@ struct alt_entry {
 	s32 alt_offset;		/* offset relative to replacement instruction or data */
 	u16 vendor_id;		/* cpu vendor id */
 	u16 alt_len;		/* The replacement size */
-	u32 errata_id;		/* The errata id */
+	u32 patch_id;		/* The patch ID (erratum ID or cpufeature ID) */
 };
 
 void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 21fb567e1b22..85c99ae64017 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -281,13 +281,13 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != 0)
 			continue;
-		if (alt->errata_id >= RISCV_ISA_EXT_MAX) {
+		if (alt->patch_id >= RISCV_ISA_EXT_MAX) {
 			WARN(1, "This extension id:%d is not in ISA extension list",
-				alt->errata_id);
+				alt->patch_id);
 			continue;
 		}
 
-		if (!__riscv_isa_extension_available(NULL, alt->errata_id))
+		if (!__riscv_isa_extension_available(NULL, alt->patch_id))
 			continue;
 
 		oldptr = ALT_OLD_PTR(alt);
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
