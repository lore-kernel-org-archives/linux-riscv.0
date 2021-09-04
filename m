Return-Path: <SRS0=w10S=N2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B19BC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Sep 2021 00:06:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38473610CF
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Sep 2021 00:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38473610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uFXKObergPZzzjp8BVcwEgme1F/8NuHiSjfS6JT9p3E=; b=t/uaT6k/GgHdUC7tSyCgT3FxD8
	hI95BBX5rd365YaghDBpc7SIenpHFFq07s9xM24GQUNkzZpyDU7+a0ILJCV3Q40LpN0q0FuwptXcm
	BtctxBM+l0pdW+vbUQ+Q64bCJeSvZnoZOYx7WT1CuUIjQozsXvIV5K02DyXtd83uvgJIcCXR7FPRV
	OZZvAmh/OXfW16Qt1m/Gt1RhQtKoWW39V4s10Mvp6sZzlVzE+r8+iNYBxv7ekVT/QROHcowy2Ytw0
	KXE4cHrN74Gb0isRE69EOA6ZAft4FIBeDI66TniZ9C/uZi+KnbbbEz6qSjbSwmyAqzbRTdC+ei/gU
	/5jOi4Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMJCW-00DDMF-O6; Sat, 04 Sep 2021 00:06:28 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMJBy-00DDDh-GD
 for linux-riscv@lists.infradead.org; Sat, 04 Sep 2021 00:05:56 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 r15-20020a056902154f00b00598b87f197cso939104ybu.13
 for <linux-riscv@lists.infradead.org>; Fri, 03 Sep 2021 17:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=SfbHJEWQeRliBoQsEhXHv1u4n2Ik1OMNCo9r1o66Q/M=;
 b=GZ0vA80A2Z6y+ef/rz+ER1DjhGiMBo8Unx54I5q93wBFk5a1Z+4+yOIbK6F8i6ml2Z
 huiMjvHV8w71Q3r8BTQ/7TSElsFnHWLQDvxTnX+hKAiCZ254RixITRjqZ/IkeQDEa6Xa
 ZHq5gAWBcLx2sATUvcX6LCd5uJwhAibNyPK+H1uI1wDW2vOEQs5tun/Diez11Orwu/Mj
 2YGwWwNS6bgr7AHu7BQ0hkDZZcShVMOj8cb659TQVcsEXS6doanhqlsyn3p8XcHOx0/l
 7WZRAHbvWGlOrm6KJSi1Nlvvtq8mjZIHmKkwItCNckxL3rBNLO4+NL0/ug488Wqf9rZm
 Ud7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=SfbHJEWQeRliBoQsEhXHv1u4n2Ik1OMNCo9r1o66Q/M=;
 b=NKWg2DcyOciHgKQHoS8J/OpEkQoNTTJd+7M+G5HvF/ZAznZC0ZZNyuYPjdRKvLVbGT
 AOTuUZ9b7MLxC2W6cfbMloTW4uKUALh1CPxjRErltzri9KtVskPsEm3aAxlw90zi5qOx
 A7ovasuMHX5lXDZRKyk111ViwnUNSXWqa9rplv1qs3uQhK9TroDe4EM+r7tmZjGojiti
 C8KhX8aIjVGYGroYcnRC1SipT49+DGdYgubHwt8ddr+393/iOtYub7EJpBTeWqO8nlLG
 sv60ZjaQo2e97nRi4PsXtIf1VZ1vaAxUHszoXI+F6k3th0Uq7pbzecIRPI9iK9HkjsQP
 hFIg==
X-Gm-Message-State: AOAM5301pQAmFD5NUMQoeZsxtpKR2Q2ZqkOHpJ0WzUDbhn049wHj3IIz
 b71ddlk+3JQjrkXkIlVzBqZdiRSnSB8Fnl8=
X-Google-Smtp-Source: ABdhPJxMnuM52qVl21b48kLxkv3AyKumezraz5sUmqPRmVkkOO34LbbxoyfV+PPzFtSDDybtmhFrOnQR8bYDu7Y=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:b45b:ca56:952a:2176])
 (user=saravanak job=sendgmr) by 2002:a25:268c:: with SMTP id
 m134mr2133217ybm.298.1630713952840; Fri, 03 Sep 2021 17:05:52 -0700 (PDT)
Date: Fri,  3 Sep 2021 17:05:42 -0700
In-Reply-To: <20210904000543.2019010-1-saravanak@google.com>
Message-Id: <20210904000543.2019010-3-saravanak@google.com>
Mime-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH v3 2/2] drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
From: Saravana Kannan <saravanak@google.com>
To: Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>
Cc: Saravana Kannan <saravanak@google.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_170554_593688_288028BD 
X-CRM114-Status: GOOD (  13.67  )
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

The simple-pm-bus driver is mandatory for CONFIG_OF based platforms to
work with fw_devlink. So, always compile it in for CONFIG_OF and delete
the config since it's no longer necessary.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 arch/arm/configs/multi_v7_defconfig |  1 -
 arch/arm/configs/oxnas_v6_defconfig |  1 -
 arch/arm/configs/shmobile_defconfig |  1 -
 arch/arm/mach-omap2/Kconfig         |  1 -
 arch/arm64/configs/defconfig        |  1 -
 drivers/bus/Kconfig                 | 12 ------------
 drivers/bus/Makefile                |  2 +-
 drivers/soc/canaan/Kconfig          |  1 -
 8 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index d9abaae118dd..362720ae8d65 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -196,7 +196,6 @@ CONFIG_PCI_EPF_TEST=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_OMAP_OCP2SCP=y
-CONFIG_SIMPLE_PM_BUS=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/arm/configs/oxnas_v6_defconfig b/arch/arm/configs/oxnas_v6_defconfig
index cae0db6b4eaf..de37f7e90999 100644
--- a/arch/arm/configs/oxnas_v6_defconfig
+++ b/arch/arm/configs/oxnas_v6_defconfig
@@ -46,7 +46,6 @@ CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=64
-CONFIG_SIMPLE_PM_BUS=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index d9a27e4e0914..18d2a960b2d2 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -40,7 +40,6 @@ CONFIG_PCI_RCAR_GEN2=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_SIMPLE_PM_BUS=y
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index 7df8f5276ddf..02f2f3157f07 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -112,7 +112,6 @@ config ARCH_OMAP2PLUS
 	select PM_GENERIC_DOMAINS
 	select PM_GENERIC_DOMAINS_OF
 	select RESET_CONTROLLER
-	select SIMPLE_PM_BUS
 	select SOC_BUS
 	select TI_SYSC
 	select OMAP_IRQCHIP
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f423d08b9a71..474b1f2e3f06 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -245,7 +245,6 @@ CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y
 CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
 CONFIG_HISILICON_LPC=y
-CONFIG_SIMPLE_PM_BUS=y
 CONFIG_FSL_MC_BUS=y
 CONFIG_TEGRA_ACONNECT=m
 CONFIG_GNSS=m
diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index e7f7eee6ee9a..dc3801369488 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -141,18 +141,6 @@ config QCOM_EBI2
 	  Interface 2, which can be used to connect things like NAND Flash,
 	  SRAM, ethernet adapters, FPGAs and LCD displays.
 
-config SIMPLE_PM_BUS
-	tristate "Simple Power-Managed Bus Driver"
-	depends on OF && PM
-	help
-	  Driver for transparent busses that don't need a real driver, but
-	  where the bus controller is part of a PM domain, or under the control
-	  of a functional clock, and thus relies on runtime PM for managing
-	  this PM domain and/or clock.
-	  An example of such a bus controller is the Renesas Bus State
-	  Controller (BSC, sometimes called "LBSC within Bus Bridge", or
-	  "External Bus Interface") as found on several Renesas ARM SoCs.
-
 config SUN50I_DE2_BUS
 	bool "Allwinner A64 DE2 Bus Driver"
 	  default ARM64
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index 397e35392bff..86aacd36a56d 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -26,7 +26,7 @@ obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
 obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
 obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
 obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
-obj-$(CONFIG_SIMPLE_PM_BUS)	+= simple-pm-bus.o
+obj-$(CONFIG_OF)		+= simple-pm-bus.o
 obj-$(CONFIG_TEGRA_ACONNECT)	+= tegra-aconnect.o
 obj-$(CONFIG_TEGRA_GMI)		+= tegra-gmi.o
 obj-$(CONFIG_TI_PWMSS)		+= ti-pwmss.o
diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig
index 8179b69518b4..853096b7e84c 100644
--- a/drivers/soc/canaan/Kconfig
+++ b/drivers/soc/canaan/Kconfig
@@ -5,7 +5,6 @@ config SOC_K210_SYSCTL
 	depends on RISCV && SOC_CANAAN && OF
 	default SOC_CANAAN
         select PM
-        select SIMPLE_PM_BUS
         select SYSCON
         select MFD_SYSCON
 	help
-- 
2.33.0.153.gba50c8fa24-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
