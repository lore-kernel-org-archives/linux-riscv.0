Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D7CC5DF9D
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FFFB20704
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cK33C2iq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="lSpjTg8c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FFFB20704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9bobN0jHN7qZ0ckAp9HCWWQJ5liIipVaenDI1mMCaR8=; b=cK33C2iqQexg6qS8XgEkNcpAF
	DA+59GFKGUs4CSXfB/9hL7+Be0qUCTpyfZZe23sQbtgIW/tPOtbI3QiVqACOW3wdwME0IZMp2LDoo
	dMXyNpbm6DJS2Utw00VZPznf1QVlTTL9rAPtyJM9BQPtcolp3NulX+OcRRB6OAWCIT0VHT8mAKA0W
	KGk+Fkd9qcrIDOAA54/0jRsO1oqb6OGtzoramQuJjcumUCvNZEcic0coQBw4Bs+5euhEqrFHu5Q8b
	bX4gzLp5d5XnDqXGbAjaeURTJlgGSJHL8PEf1cN07vSXBv9Yj3WDhkFvIUvCF+9yf1plyGUXNDjr6
	jpM0EaHOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJNH-0000iZ-DX; Sat, 07 Nov 2020 08:15:03 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJND-0000PH-0l
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736898; x=1636272898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BBotgl9u6Ee4WQKcqLY3PIUza5hjv/SR3kFV9rZnZOg=;
 b=lSpjTg8cVnsrpI/YPV1Ouz6yR83sLcKTHw3Zvi6KIlDcYDR8wnT7La8V
 nleEg5dXoCd/5vDifB3mpJHs+wmlbPral9BxiuCjln9PYFSfrq7Ai1Rqd
 qvlzcIhkM9W42wBd5/VWG847pgaqv320//uPf8Wva2yatVSUcSOUkvuco
 l5Ci7NxAYXRtCV6WdGr3K6mLZTXyA/7eKOqV7Fqrv0sOpgbFVowXg2Ait
 0Ccy4yUqvGwGvAn2vZHUygh6fDC+5zmsDBe5Q1sQfOOdHeHhc1Dge8mjN
 ZmzYHwtnJeahzHrAjqYqdsCVcSYH70CFus5uRp3ZtPh4eT3fv5edV3G4x g==;
IronPort-SDR: S/Zmd7FIM3YYIWlMY68pMxvEEE/9yPZ2JBSNZHQJafxnrJRkDGnxn2jir0GADS0YviGlEynJ7Y
 l2EAI329hti5XNSrGRbhCvLiXqFrdCwpvWPOnxK9r6xmEqNA6R3mMUFFowmEHKv9i8+ntRJw5c
 mYEL6nCcSaqoas9sRCJOmRykgKixRfWCNPxPz3H9LBAPhCpL0AfxeabHcZzdePw/VcXlXiW/n/
 Q+F4DU/1E6LJiR5UalvUymMaDBj10gZOXDDKRydZGaztX9rNruzhPhYsLriklru5fauyQs83jL
 phk=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079294"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:14:58 +0800
IronPort-SDR: SKFDENj727uOe7jd7tP2WsihxfXEcwvE1u/NOaLmMQjA7nOb901HrBmHDrbE/PrQtvOaCCRKTM
 m61hO/PjnW0xH4grWPTbZXfkCKBo7YY8Li8JjaqM7pn7oLw2hf+YYqdJIBclK1SrIH/rpEbnA/
 QY0gypNnp0mVswPOhXnN5vXKdIhsZSJjBYlG6MtYJ9SLITm3x3asvZZUM+kS0VY4bgysBWh/tk
 dMELyWJebwd1B/3Fopn2eUXRBLjCwvRVsTLybC1uXqX+ugWRW3+v4CSiV2CeRMKDQWiM9f5hew
 XEaq8mBDEoOlFpoX4wH+xeFH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:01:03 -0800
IronPort-SDR: BjWEbz725IVXr60UmKHYWFPaQ0JG9Y5DmepU/3LakjotVZSZNa3TsEvhch9efEdMsqQXLDgZZw
 LfNxJVQdDHiaH0A9z6WmLDW2wOu0V4PSeb3HYIxh/gEvDOvx0TVSsQZQ6eWVMqHaa30JTu3ayw
 hyFHPS/W0iAq2huzgNc7jE4htyhf9yT2732ooxixckscNXOIlcfpmqlIvqe+v8xpeCI+VceOcR
 Wu9lxXoRl3aj/2R+5aZwrkA7Uj768KBX2xsfyFmOpdXsrQGVgsr3138v1Vb9SLMoyCe0TqHsEZ
 eiE=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:14:56 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 13/32] riscv: Fix builtin DTB handling
Date: Sat,  7 Nov 2020 17:14:01 +0900
Message-Id: <20201107081420.60325-14-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031459_300140_AC633A2A 
X-CRM114-Status: GOOD (  20.92  )
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

All SiPeed K210 boards have the exact same vendor, arch and
implementation IDs, preventing differentiation of the device tree to use
through the SOC_BUILTIN_DTB_DECLARE() macro. This result in this macro,
used only for Kendryte, to be useless and to prevent changing the
builtin device tree without also changing the code of the sysctl soc
driver.

Fix this problem by removing the SOC_BUILTIN_DTB_DECLARE() macro and
associated code, falling back to a simpler, and more traditional
handling of builtin DTB similar to other architectures.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/Kconfig.socs               | 22 ++++++++++++----
 arch/riscv/boot/dts/kendryte/Makefile |  5 ++--
 arch/riscv/include/asm/soc.h          | 38 ---------------------------
 arch/riscv/kernel/soc.c               | 27 -------------------
 arch/riscv/mm/init.c                  |  6 +----
 drivers/soc/kendryte/k210-sysctl.c    | 12 ---------
 6 files changed, 21 insertions(+), 89 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index e724fddc44ba..97ef393d0ed0 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -33,9 +33,10 @@ config SOC_KENDRYTE
 	help
 	  This enables support for Kendryte K210 SoC platform hardware.
 
-config SOC_KENDRYTE_K210_DTB
-	def_bool y
-	depends on SOC_KENDRYTE_K210_DTB_BUILTIN
+config BUILTIN_DTB
+	def_bool n
+
+if SOC_KENDRYTE
 
 config SOC_KENDRYTE_K210_DTB_BUILTIN
 	bool "Builtin device tree for the Kendryte K210"
@@ -43,10 +44,21 @@ config SOC_KENDRYTE_K210_DTB_BUILTIN
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
index ea933b789a88..d9c8d8819ed8 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -591,11 +591,7 @@ static void __init setup_vm_final(void)
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
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
