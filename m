Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BAFC64E90
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 04:37:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 254CC2085B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 04:37:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PFug/tFv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="FKLoK1uD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 254CC2085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CGKwYPaIKUc7ogSQTQqPR7JC2N09r4IAOpW3T54O1Nw=; b=PFug/tFvEH6Un9u1d7T7dJOi0
	8zMArBWraW2MGwQkFs6p7hVs+H5jrZNRFw83aG/gtSTKYz14Rr0yFUGWn3eWd92Sx4D0rlOeuxU5D
	Q7qAPrEuy8ZVT0RkTvJ6q135N+hCl6V4qk2+AR35ydFWhBRcaYrBKEP8KrR4/RgwyV1r7hl2/5iLx
	NOoSXkYolG7FM4HXj+6HB1GajzZf1eDia6K6r4xv5vkVlqwrAiWL/pLoiYhUlqJ1t9u5QXoaVgn07
	/99vYf0X4FfYZqgDiXBclUq5VhcEE/j7roPYb+dxRt2AR0s8zlU66jsLoXGOndojZBU2AhJkb+o8m
	kY+nIr9gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khQ5K-0007SP-FA; Tue, 24 Nov 2020 04:37:46 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khQ5G-0007Nj-7X
 for linux-riscv@lists.infradead.org; Tue, 24 Nov 2020 04:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606192662; x=1637728662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QdVZhGyz7d4HNs3K/uKznCHECssdqovxvpbfByiuAFQ=;
 b=FKLoK1uDsJZUd11TuGT3xKwFDWVSrooOuAFWp5Z4uB9ivO6XruAGK86q
 VYMbzGXPoPrmxJqrdheJOuZgdh9ebmCNxbgH0X4r4b9s9QFOXRzuVi9s9
 CuJ5QKcB50c600SP0R5AUKaJCBkwj+pP+2Yalfnd/jzhCQLR8D/a0p4Rk
 +cb5iYFMjJDGG1E0RIkFjYchTIFwFTU+A3yFgAwMw1vXbHZxfrk7KPyJI
 OscDPisla80AlF5uZqrTQe2rSRFC7mwZd0bTB4TCHEulNR4CLVrsB/nA1
 +iLe1tMKz4TDkU0fLUTFNvRcIJgF2tRD1W1i8aXaGlER0uNO/SWEDHlTK Q==;
IronPort-SDR: jFNs+kEZCdtTtQWHcEwr0nHtp8dRE/vWB8x6XiX9fBdalf4oHEAd901F1n9oBIkB4kJq61O4bi
 NBmu5sXMa9DRwx0vnswylXfim/hlaCNFuW9b7/EZw7Wj8qrPC1IarINOwO58dfeRyeH6thIRum
 ymzMnjV9Fq6lp+zhhNRyIi2eaOeOtZud66Ybgmjwd6fefOgxizXFOqVN6rkmDg/yoFU8mgPNCF
 hq13WQBn0nwyxupbAyEuMxr1p4O1cmAeQthvSJgGLWBz9rJijy4GLWA92sYLwPqW1IVuupzKe2
 kQc=
X-IronPort-AV: E=Sophos;i="5.78,365,1599494400"; d="scan'208";a="157768580"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Nov 2020 12:37:41 +0800
IronPort-SDR: 4QeS1blNEc3PpsSr31xg+Dms3zvX/7Esv01Bw8QHWUTArq8BWDhtBjkPRaLNOxPlKb1SiXAEck
 OPeC6UMBx8edHWR2ctV5YXnqi5T/j6NLA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 20:22:06 -0800
IronPort-SDR: cLFLro7btt9+GdDLlN3lN+I/UcZ9ww2bumA2qdb/fvJLnJG7q3RXsUsrczWL+4S38/BN137pSV
 /NlCWpMnxjwg==
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.163])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Nov 2020 20:37:39 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 05/21] riscv: Use vendor name for K210 SoC support
Date: Tue, 24 Nov 2020 13:37:12 +0900
Message-Id: <20201124043728.199852-6-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201124043728.199852-1-damien.lemoal@wdc.com>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_233742_528350_AE8F17BE 
X-CRM114-Status: GOOD (  20.62  )
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

Rename configuration options and directories related to the Kendryte
K210 SoC to use the SoC vendor name (canaan) instead of the "kendryte"
branding name.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/Kconfig.socs                       | 24 +++++++++----------
 arch/riscv/Makefile                           |  2 +-
 arch/riscv/boot/dts/Makefile                  |  2 +-
 arch/riscv/boot/dts/canaan/Makefile           |  5 ++++
 .../boot/dts/{kendryte => canaan}/k210.dts    |  0
 .../boot/dts/{kendryte => canaan}/k210.dtsi   |  0
 arch/riscv/boot/dts/kendryte/Makefile         |  5 ----
 arch/riscv/configs/nommu_k210_defconfig       |  2 +-
 drivers/soc/Kconfig                           |  2 +-
 drivers/soc/Makefile                          |  2 +-
 drivers/soc/{kendryte => canaan}/Kconfig      |  4 ++--
 drivers/soc/{kendryte => canaan}/Makefile     |  0
 .../soc/{kendryte => canaan}/k210-sysctl.c    |  0
 13 files changed, 24 insertions(+), 24 deletions(-)
 create mode 100644 arch/riscv/boot/dts/canaan/Makefile
 rename arch/riscv/boot/dts/{kendryte => canaan}/k210.dts (100%)
 rename arch/riscv/boot/dts/{kendryte => canaan}/k210.dtsi (100%)
 delete mode 100644 arch/riscv/boot/dts/kendryte/Makefile
 rename drivers/soc/{kendryte => canaan}/Kconfig (79%)
 rename drivers/soc/{kendryte => canaan}/Makefile (100%)
 rename drivers/soc/{kendryte => canaan}/k210-sysctl.c (100%)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 0bc3e28581f2..88ac0d1a5da4 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -22,21 +22,21 @@ config SOC_VIRT
 	help
 	  This enables support for QEMU Virt Machine.
 
-config SOC_KENDRYTE
-	bool "Kendryte K210 SoC"
+config SOC_CANAAN
+	bool "Canaan Kendryte K210 SoC"
 	depends on !MMU
 	select CLINT_TIMER if RISCV_M_MODE
 	select SERIAL_SIFIVE if TTY
 	select SERIAL_SIFIVE_CONSOLE if TTY
 	select SIFIVE_PLIC
 	help
-	  This enables support for Kendryte K210 SoC platform hardware.
+	  This enables support for Canaan Kendryte K210 SoC platform hardware.
 
-if SOC_KENDRYTE
+if SOC_CANAAN
 
-config SOC_KENDRYTE_K210_DTB_BUILTIN
-	bool "Builtin device tree for the Kendryte K210"
-	depends on SOC_KENDRYTE
+config SOC_CANAAN_K210_DTB_BUILTIN
+	bool "Builtin device tree for the Canaan Kendryte K210"
+	depends on SOC_CANAAN
 	default y
 	select OF
 	select BUILTIN_DTB
@@ -45,13 +45,13 @@ config SOC_KENDRYTE_K210_DTB_BUILTIN
 	  This option should be selected if no bootloader is being used.
 	  If unsure, say Y.
 
-config SOC_KENDRYTE_K210_DTB_SOURCE
-	string "Source file for the Kendryte K210 builtin DTB"
-	depends on SOC_KENDRYTE
-	depends on SOC_KENDRYTE_K210_DTB_BUILTIN
+config SOC_CANAAN_K210_DTB_SOURCE
+	string "Source file for the Canaan Kendryte K210 builtin DTB"
+	depends on SOC_CANAAN
+	depends on SOC_CANAAN_K210_DTB_BUILTIN
 	default "k210"
 	help
-	  Base name (without suffix, relative to arch/riscv/boot/dts/kendryte)
+	  Base name (without suffix, relative to arch/riscv/boot/dts/canaan)
 	  for the DTS file that will be used to produce the DTB linked into the
 	  kernel.
 
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 0289a97325d1..cd08dc40e8d8 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -83,7 +83,7 @@ PHONY += vdso_install
 vdso_install:
 	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
 
-ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_KENDRYTE),yy)
+ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN),yy)
 KBUILD_IMAGE := $(boot)/loader.bin
 else
 KBUILD_IMAGE := $(boot)/Image.gz
diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index ca1f8cbd78c0..7b164f287a74 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += sifive
-subdir-y += kendryte
+subdir-y += canaan
 
 obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
diff --git a/arch/riscv/boot/dts/canaan/Makefile b/arch/riscv/boot/dts/canaan/Makefile
new file mode 100644
index 000000000000..9ee7156c0c31
--- /dev/null
+++ b/arch/riscv/boot/dts/canaan/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+ifneq ($(CONFIG_SOC_CANAAN_K210_DTB_SOURCE),"")
+dtb-y += $(strip $(shell echo $(CONFIG_SOC_CANAAN_K210_DTB_SOURCE))).dtb
+obj-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .o, $(dtb-y))
+endif
diff --git a/arch/riscv/boot/dts/kendryte/k210.dts b/arch/riscv/boot/dts/canaan/k210.dts
similarity index 100%
rename from arch/riscv/boot/dts/kendryte/k210.dts
rename to arch/riscv/boot/dts/canaan/k210.dts
diff --git a/arch/riscv/boot/dts/kendryte/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
similarity index 100%
rename from arch/riscv/boot/dts/kendryte/k210.dtsi
rename to arch/riscv/boot/dts/canaan/k210.dtsi
diff --git a/arch/riscv/boot/dts/kendryte/Makefile b/arch/riscv/boot/dts/kendryte/Makefile
deleted file mode 100644
index 83636693166d..000000000000
--- a/arch/riscv/boot/dts/kendryte/Makefile
+++ /dev/null
@@ -1,5 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-ifneq ($(CONFIG_SOC_KENDRYTE_K210_DTB_SOURCE),"")
-dtb-y += $(strip $(shell echo $(CONFIG_SOC_KENDRYTE_K210_DTB_SOURCE))).dtb
-obj-$(CONFIG_SOC_KENDRYTE_K210_DTB_BUILTIN) += $(addsuffix .o, $(dtb-y))
-endif
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index cd1df62b13c7..368a28cf1467 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -27,7 +27,7 @@ CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 # CONFIG_SLAB_MERGE_DEFAULT is not set
 # CONFIG_MMU is not set
-CONFIG_SOC_KENDRYTE=y
+CONFIG_SOC_CANAAN=y
 CONFIG_MAXPHYSMEM_2GB=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index 425ab6f7e375..f43886fec32b 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -6,6 +6,7 @@ source "drivers/soc/amlogic/Kconfig"
 source "drivers/soc/aspeed/Kconfig"
 source "drivers/soc/atmel/Kconfig"
 source "drivers/soc/bcm/Kconfig"
+source "drivers/soc/canaan/Kconfig"
 source "drivers/soc/fsl/Kconfig"
 source "drivers/soc/imx/Kconfig"
 source "drivers/soc/ixp4xx/Kconfig"
@@ -22,6 +23,5 @@ source "drivers/soc/ux500/Kconfig"
 source "drivers/soc/versatile/Kconfig"
 source "drivers/soc/xilinx/Kconfig"
 source "drivers/soc/zte/Kconfig"
-source "drivers/soc/kendryte/Kconfig"
 
 endmenu
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 36452bed86ef..dec90fca120b 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -28,4 +28,4 @@ obj-$(CONFIG_ARCH_U8500)	+= ux500/
 obj-$(CONFIG_PLAT_VERSATILE)	+= versatile/
 obj-y				+= xilinx/
 obj-$(CONFIG_ARCH_ZX)		+= zte/
-obj-$(CONFIG_SOC_KENDRYTE)	+= kendryte/
+obj-$(CONFIG_SOC_CANAAN)	+= canaan/
diff --git a/drivers/soc/kendryte/Kconfig b/drivers/soc/canaan/Kconfig
similarity index 79%
rename from drivers/soc/kendryte/Kconfig
rename to drivers/soc/canaan/Kconfig
index 49785b1b0217..5232d13f07e5 100644
--- a/drivers/soc/kendryte/Kconfig
+++ b/drivers/soc/canaan/Kconfig
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
-if SOC_KENDRYTE
+if SOC_CANAAN
 
 config K210_SYSCTL
-	bool "Kendryte K210 system controller"
+	bool "Canaan Kendryte K210 SoC system controller"
 	default y
 	depends on RISCV
 	help
diff --git a/drivers/soc/kendryte/Makefile b/drivers/soc/canaan/Makefile
similarity index 100%
rename from drivers/soc/kendryte/Makefile
rename to drivers/soc/canaan/Makefile
diff --git a/drivers/soc/kendryte/k210-sysctl.c b/drivers/soc/canaan/k210-sysctl.c
similarity index 100%
rename from drivers/soc/kendryte/k210-sysctl.c
rename to drivers/soc/canaan/k210-sysctl.c
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
