Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B89C4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 157F222A84
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 157F222A84
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bni3GkE8H+5FnaoX8T+euLEiiXxrg7NYwH70Ffh705I=; b=ndG5yaon82ID4XkIWIgqxcB0D
	zTssq/YDwDw+3robTkBYz8KuPKANMpAJvgVY3G2ukP19OEsFC/PjGQ+1nzcunb025KpOM3f3XQL8t
	5G7PJUppLRTlQaNs5JMqNJFxuyL1Z4iYdPC1VSQOqceYIYt7mXb40S7ruIDtuuh/rW7iNJJl28WUa
	AtraS9L9wCuFPvxC0r1tWHPfuQ5qnfZ1W/N1WYV6ZdW3+99jxc/HKWeYlAbucpswb/RPLtUhfMID1
	q0KXRX7w1FuMtGQbBZfyyGZ5ssA2FEv29DD1vlTNSOHbooL4A0mtJiWDZQ+pgexC5re9HrTfuvPtd
	snHN7MDcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koRmK-0000Cn-JU; Sun, 13 Dec 2020 13:51:12 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koRmG-0000AJ-Nl
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 13:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607867469; x=1639403469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9HLLil2FdLt0C+guCFzM2bWksJSdqkJONJJEOtFGzT0=;
 b=p4+piuJx6B5wHlK0az+ZGKZvUWVmRdKpZXER3H7GcyIJSrTo+aMO5BJ/
 V6S3xhD5SuXAip1m6PW6/9+CV7VzUivPioubzaWZk/3EKdd650o5AcILa
 p2GjwfFV9r5SFCcYMiaIwYl4g6hWrzh8B0OAl8gPNyxS3zwHyTo5paC4Z
 K2Gwq5E2rlDC7Ch6yZFcQbY/QpJDEMDrZ/VblJoImMyHLR2F59R/WDY5C
 Kh02vLBm8EyE7G9yKyla5S35kNcYadVXvsD4KzBU+Z96CWwIFqvtdTILl
 z/6Lo0JzDbIU8uDYknv/FLlArFz/GwxhRU8QOZP8w/XIj8dc5ovhactUm w==;
IronPort-SDR: La5PGKpd8tOv3qawVfRt/uLPq/7jSoMfp/I00IfWMLow3StZtNQxeRMo7jDR/zM3d3V7s67WhK
 lzYvBcYMNx/RLOl8h0JfrOYYdwWQtFMw3Ff3wtSYajs/Als28qcdxBlrL+1gh2Dz5LLVNc18Qf
 7VoWKjNpp6QeqfgeaDQDFkFBLDHpRVAURAK1HqpnSHVdohTwbjqGjgsrOJeZnWFO4i36huuYps
 GQtByEKVXEnS3F03JYlBoS/FQ168NGaEq66cyPp3IkMemEZJtJsmX07yRHBP6a65Zw83cfAgXY
 YaE=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; d="scan'208";a="156242558"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:09 +0800
IronPort-SDR: Q4TYH78u8tZ2foYhZ+lYP/GsnDaUbn4ex+V9DtUN1TuLFLvA47unVkBjNedOx2EVpkaL5eGXVq
 WRxrOQaKzprkbLALuLyEA3CetCJj8YReqT/5V8RbZ+5opE2IdfJVtS5KGijVywARQ1ZZkthf44
 Jx9Iy4DyDTQoOq34j6nbD+alAkiIcAnTQ5kG+BFHF1ao5EkqVcfSzCao2Vji1rkl/ZAoZ8VAOk
 Z9UBI6UOag7X3spKepPGjlrldoNmyU5k9VZcwPv/1gLRqgEz4yOIske3uQL2sNn4j4LQ9FD3tZ
 r52X/85D5jKUlEVt1q4ZcRrb
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2020 05:34:53 -0800
IronPort-SDR: H+SacK5nIi8lFtzH7ZmjMJUoYuxEI3juEYSsIcEbcE0sEwG99bhP+kcF63NO9o3FYPwdkizyqL
 4qjnmg3WHrWzDwLEIfe6Amhemlxxor0tZvdXAxM7/hFzg1+mTSb5Jz/c0HAQZsr21cjkksJxoO
 eQZmaKeRZUJsgITwgLr4cOxNo7VCRSfimiqSRMc2F8uIbp/5Z861kYQLa7eVU621iRlmTaWUxq
 xRAYFRuA6V/LLk5gx2mRLmBCHU7BH7/UQgPW9ADLXDX0wBX7bpOC2CgusdBtxwiI0c04lv5Hak
 O9s=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.197])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:06 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v10 04/23] riscv: Fix builtin DTB handling
Date: Sun, 13 Dec 2020 22:50:37 +0900
Message-Id: <20201213135056.24446-5-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_085108_994506_2DB0E35D 
X-CRM114-Status: GOOD (  23.86  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

All SiPeed K210 MAIX boards have the exact same vendor, arch and
implementation IDs, preventing differentiation to select the correct
device tree to use through the SOC_BUILTIN_DTB_DECLARE() macro. This
result in this macro to be useless and mandates changing the code of
the sysctl driver to change the builtin device tree suitable for the
target board.

Fix this problem by removing the SOC_BUILTIN_DTB_DECLARE() macro since
it is used only for the K210 support. The code searching the builtin
DTBs using the vendor, arch an implementation IDs is also removed.
Support for builtin DTB falls back to the simpler and more traditional
handling of builtin DTB using the CONFIG_BUILTIN_DTB option, similarly
to other architectures.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/Kconfig.socs               | 19 ++++++++++----
 arch/riscv/boot/dts/Makefile          |  2 +-
 arch/riscv/boot/dts/kendryte/Makefile |  5 ++--
 arch/riscv/include/asm/soc.h          | 38 ---------------------------
 arch/riscv/kernel/soc.c               | 27 -------------------
 arch/riscv/mm/init.c                  |  6 +----
 drivers/soc/kendryte/k210-sysctl.c    | 12 ---------
 7 files changed, 19 insertions(+), 90 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 8a55f6156661..0bc3e28581f2 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -32,9 +32,7 @@ config SOC_KENDRYTE
 	help
 	  This enables support for Kendryte K210 SoC platform hardware.
 
-config SOC_KENDRYTE_K210_DTB
-	def_bool y
-	depends on SOC_KENDRYTE_K210_DTB_BUILTIN
+if SOC_KENDRYTE
 
 config SOC_KENDRYTE_K210_DTB_BUILTIN
 	bool "Builtin device tree for the Kendryte K210"
@@ -42,10 +40,21 @@ config SOC_KENDRYTE_K210_DTB_BUILTIN
 	default y
 	select OF
 	select BUILTIN_DTB
-	select SOC_KENDRYTE_K210_DTB
 	help
-	  Builds a device tree for the Kendryte K210 into the Linux image.
+	  Build a device tree for the Kendryte K210 into the Linux image.
 	  This option should be selected if no bootloader is being used.
 	  If unsure, say Y.
 
+config SOC_KENDRYTE_K210_DTB_SOURCE
+	string "Source file for the Kendryte K210 builtin DTB"
+	depends on SOC_KENDRYTE
+	depends on SOC_KENDRYTE_K210_DTB_BUILTIN
+	default "k210"
+	help
+	  Base name (without suffix, relative to arch/riscv/boot/dts/kendryte)
+	  for the DTS file that will be used to produce the DTB linked into the
+	  kernel.
+
+endif
+
 endmenu
diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index ca1f8cbd78c0..21e3905f1c44 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += sifive
-subdir-y += kendryte
+subdir-$(CONFIG_SOC_KENDRYTE) += kendryte
 
 obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
diff --git a/arch/riscv/boot/dts/kendryte/Makefile b/arch/riscv/boot/dts/kendryte/Makefile
index 1a88e616f18e..83636693166d 100644
--- a/arch/riscv/boot/dts/kendryte/Makefile
+++ b/arch/riscv/boot/dts/kendryte/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_KENDRYTE_K210_DTB) += k210.dtb
-
+ifneq ($(CONFIG_SOC_KENDRYTE_K210_DTB_SOURCE),"")
+dtb-y += $(strip $(shell echo $(CONFIG_SOC_KENDRYTE_K210_DTB_SOURCE))).dtb
 obj-$(CONFIG_SOC_KENDRYTE_K210_DTB_BUILTIN) += $(addsuffix .o, $(dtb-y))
+endif
diff --git a/arch/riscv/include/asm/soc.h b/arch/riscv/include/asm/soc.h
index 6c8363b1f327..f494066051a2 100644
--- a/arch/riscv/include/asm/soc.h
+++ b/arch/riscv/include/asm/soc.h
@@ -21,42 +21,4 @@ void soc_early_init(void);
 extern unsigned long __soc_early_init_table_start;
 extern unsigned long __soc_early_init_table_end;
 
-/*
- * Allows Linux to provide a device tree, which is necessary for SOCs that
- * don't provide a useful one on their own.
- */
-struct soc_builtin_dtb {
-	unsigned long vendor_id;
-	unsigned long arch_id;
-	unsigned long imp_id;
-	void *(*dtb_func)(void);
-};
-
-/*
- * The argument name must specify a valid DTS file name without the dts
- * extension.
- */
-#define SOC_BUILTIN_DTB_DECLARE(name, vendor, arch, impl)		\
-	extern void *__dtb_##name##_begin;				\
-									\
-	static __init __used						\
-	void *__soc_builtin_dtb_f__##name(void)				\
-	{								\
-		return (void *)&__dtb_##name##_begin;			\
-	}								\
-									\
-	static const struct soc_builtin_dtb __soc_builtin_dtb__##name	\
-		__used __section("__soc_builtin_dtb_table") =		\
-	{								\
-		.vendor_id = vendor,					\
-		.arch_id   = arch,					\
-		.imp_id    = impl,					\
-		.dtb_func  = __soc_builtin_dtb_f__##name,		\
-	}
-
-extern unsigned long __soc_builtin_dtb_table_start;
-extern unsigned long __soc_builtin_dtb_table_end;
-
-void *soc_lookup_builtin_dtb(void);
-
 #endif
diff --git a/arch/riscv/kernel/soc.c b/arch/riscv/kernel/soc.c
index c7b0a73e382e..a0516172a33c 100644
--- a/arch/riscv/kernel/soc.c
+++ b/arch/riscv/kernel/soc.c
@@ -26,30 +26,3 @@ void __init soc_early_init(void)
 		}
 	}
 }
-
-static bool soc_builtin_dtb_match(unsigned long vendor_id,
-				unsigned long arch_id, unsigned long imp_id,
-				const struct soc_builtin_dtb *entry)
-{
-	return entry->vendor_id == vendor_id &&
-	       entry->arch_id == arch_id &&
-	       entry->imp_id == imp_id;
-}
-
-void * __init soc_lookup_builtin_dtb(void)
-{
-	unsigned long vendor_id, arch_id, imp_id;
-	const struct soc_builtin_dtb *s;
-
-	__asm__ ("csrr %0, mvendorid" : "=r"(vendor_id));
-	__asm__ ("csrr %0, marchid" : "=r"(arch_id));
-	__asm__ ("csrr %0, mimpid" : "=r"(imp_id));
-
-	for (s = (void *)&__soc_builtin_dtb_table_start;
-	     (void *)s < (void *)&__soc_builtin_dtb_table_end; s++) {
-		if (soc_builtin_dtb_match(vendor_id, arch_id, imp_id, s))
-			return s->dtb_func();
-	}
-
-	return NULL;
-}
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 8e577f14f120..c32ff32cf9ab 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -601,11 +601,7 @@ static void __init setup_vm_final(void)
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 {
 #ifdef CONFIG_BUILTIN_DTB
-	dtb_early_va = soc_lookup_builtin_dtb();
-	if (!dtb_early_va) {
-		/* Fallback to first available DTS */
-		dtb_early_va = (void *) __dtb_start;
-	}
+	dtb_early_va = (void *) __dtb_start;
 #else
 	dtb_early_va = (void *)dtb_pa;
 #endif
diff --git a/drivers/soc/kendryte/k210-sysctl.c b/drivers/soc/kendryte/k210-sysctl.c
index 707019223dd8..4608fbca20e1 100644
--- a/drivers/soc/kendryte/k210-sysctl.c
+++ b/drivers/soc/kendryte/k210-sysctl.c
@@ -246,15 +246,3 @@ static void __init k210_soc_early_init(const void *fdt)
 	iounmap(regs);
 }
 SOC_EARLY_INIT_DECLARE(generic_k210, "kendryte,k210", k210_soc_early_init);
-
-#ifdef CONFIG_SOC_KENDRYTE_K210_DTB_BUILTIN
-/*
- * Generic entry for the default k210.dtb embedded DTB for boards with:
- *   - Vendor ID: 0x4B5
- *   - Arch ID: 0xE59889E6A5A04149 (= "Canaan AI" in UTF-8 encoded Chinese)
- *   - Impl ID:	0x4D41495832303030 (= "MAIX2000")
- * These values are reported by the SiPEED MAXDUINO, SiPEED MAIX GO and
- * SiPEED Dan dock boards.
- */
-SOC_BUILTIN_DTB_DECLARE(k210, 0x4B5, 0xE59889E6A5A04149, 0x4D41495832303030);
-#endif
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
