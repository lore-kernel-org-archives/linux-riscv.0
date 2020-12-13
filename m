Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE006C4361B
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:10:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E48022D72
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E48022D72
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IaRXAWQE3W+14HzY5bCxv0TfK7Cea3XDWuwrR4PYdTk=; b=tYeFbDlsDB4v6oqYAFJsPLSi3
	uePjLUnt+Dr9697M0Xo3LEr8omZ4jYs4g1ixjAvQ5BVpmsYu94OSTfUanaY90XxtgQiVXUa/9/Jvr
	yMDxi1x2/3kM7mBP4GjFX6T4Fn68TBpkp5YJNJcXdK+9Go+orj5aWVzycQUAspybGXCgTi5X9z5aA
	VR78wz1EKdEGqxirX2NAx/Dpu44T2GupmMVNfZasTsp+aHINy3OpgnLBH/Q1cH9ATMlH/IZBBPHA9
	PxRnbjGNafNoL8ICzwuqGrK5ume789LaW3zuR1YOLkz5J67/pPLxSLPmJA/LMJjbI5S3WKm7C8DWa
	E5SwleCIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koMSq-0002Ye-NU; Sun, 13 Dec 2020 08:10:44 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koMSd-0002SE-Ci
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 08:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607847031; x=1639383031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eeINbOnqE9Jv0U8jbtRISU/Rfa1oaopzr8SoCMB8Y6A=;
 b=NKujHtNzAxkqIDIkziJRhdMrL+FEpz2bOrdS6hqUUVUNXeIqiZlCD9KX
 0CyF+JjZA5PhQkfFNrSIecPEfuPRdgrnsuVBCRex4vYu6BU8OHA5w8IPu
 VxDz+QWWQG9nVOyAV00h2STnSdpzF/02wDGkDlBInEEdOytdqHsYIM2wp
 BPWEnbZyFfT7ZeqdWoU+3TGnqEirL+e+n/Xpjk7+YKZMAh3I+bCNgmbHk
 iqxKIgNudLk8hBkscfMNK/MrzfhMjx4DT/+6/hDjYbLyTr7UVU1kq3fo5
 YztpGq7oRc5H94PI9S9PWI7mjPw3K9MAWeFo4Nnv8Yl2lJte+zZ3cXPTY Q==;
IronPort-SDR: Cf9FuktoZpPHCFysLd9XdOJ99GzzQA0w425c6eF2xyGSCt/2Zk8FK92Ed3B4bfU4w5vhnIxZy0
 QXUorDo7AGhdOyJ3uJuUKwc3hJnjzjDlakkN//lr3Jt+Be/0Jhn/steGWgv5EsD32AxsCTrb0U
 v+3/1ZMOEGIrar0bSZZF/Z75AVd/YDY8PxfhSIjlQeg1kb7BYoZi4R+6Si66Bg+t69TlBhDfMW
 IY1R9fJmA14ahqErCoJ8A3xYlzhLLHzGgLmhLHuIsrOSBA8fANSZKLQDfmPW0MM7/Aos6WrrOi
 Dig=
X-IronPort-AV: E=Sophos;i="5.78,415,1599494400"; d="scan'208";a="156235146"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 16:10:31 +0800
IronPort-SDR: z+Sy75cFAt1C9UCCtCU8frnYMbZ8tkUaqXEXx6m9bXLoh5jEX2ypvH6W5P7Pw3XzkQ8sp85tem
 jw/uEvuFKu5iZxkER6YDaRILLQvh3CTqm5iPyosHHkMpeRjfFoqQzfdZ3UvuKWJo1Icm2MTyoc
 mDh3CVO8kHgOP4Uzpi+OHK6QCGGyh6/FViPB7zhuREbFljpwat/5af1i1lHzyQKml3V3+nCpg3
 ekCmHPpzhyBzx/Z2Le7IwE+EEtlp95PDuSbGgA173zjozX+ueyoPbQaeQyBAl0iK7proAHA6fv
 6pNiDtX4sinpls7fXQYZIS0N
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2020 23:54:19 -0800
IronPort-SDR: tXZQ7PPxNtt+7EUBXW6GQBn/pw8TY8xf35YR+p2XEaxPQNGFd/NPbChCk35y7GLUTzPvQMe9/s
 XUiQB4XFwsMwbzCjhUmvLDc89XMpQtTOR5sMlklFnry8LwKYq1zjL3E0N3hTdPYKPaPWhztU1y
 IUUgp+pntuAaL8voX/aGuGqR57/Ic/yMMmLCp9Hckm7d0JFU64pSU/e0kFkX4jzknlpCXgtwz6
 dIR1EYxCyfFN1uz1+HHKDf7Vz7imtHX1ywKPuQGl5xRbRMtryrmW3lJcR/LiOPGI5nPtuwQvUY
 uqY=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.197])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2020 00:10:30 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v9 05/22] riscv: Use vendor name for K210 SoC support
Date: Sun, 13 Dec 2020 17:09:59 +0900
Message-Id: <20201213081016.179192-6-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213081016.179192-1-damien.lemoal@wdc.com>
References: <20201213081016.179192-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_031031_755976_93A63FDC 
X-CRM114-Status: GOOD (  21.15  )
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
index 21e3905f1c44..4da40691c55b 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += sifive
-subdir-$(CONFIG_SOC_KENDRYTE) += kendryte
+subdir-$(CONFIG_SOC_CANAAN) += canaan
 
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
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
