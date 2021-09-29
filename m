Return-Path: <SRS0=hgxb=OT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D340C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 00:11:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AF796124A
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 00:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1AF796124A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9oyWnLPfzcjVtrLIxkdQDyMMQEb5g+qz+ffgVXWAN58=; b=ht7AQrX7I70xhlPNbt6MY5OUrs
	QjPUnb7WmjfxpUq2tOLNEVZJ4UoUZZVoP7vgknN4KGXEG2iHyhG20GC2UjHFoVIlinZwDjfrFLJPb
	/V0DO8RaWLAt+yRZ1vVDaQ+2PVEKyWFpB5fa+Zm2GWXc1W3UDLBGzQfSiZEmgNjsk2pvf8qg8P2bh
	uSohgjvG4qviPq3h5wM60R6oT/2MBzCkM+2SMeAO+Caq0UOW8cCHNIt7Ini7mOEo2BlZdifEcKhnR
	QIX7b23+cairzp3Nv7KCahs6W5icsTAjyp0Uf5FqL5Oo2rGr1DTF17CqUeiOfvIvvIJ4rcVzZNC9N
	KBZ31RTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVNBx-009T5a-HN; Wed, 29 Sep 2021 00:11:21 +0000
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVN8U-009Rwf-FN
 for linux-riscv@lists.infradead.org; Wed, 29 Sep 2021 00:07:48 +0000
Received: by mail-qk1-x749.google.com with SMTP id
 k3-20020a05620a414300b0045e623cd1afso3126823qko.20
 for <linux-riscv@lists.infradead.org>; Tue, 28 Sep 2021 17:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=pkFTuk+TNQNm+gOgPOs6LK/YFjb2sUYttyn3WHOqJrE=;
 b=Shkn2BNqy0Z/1QlOaPNVHfGvNL2ujb+W4/KsDcUnxjOImmY0e6EvSbte/WgKpzf0G0
 MQJItXxtQkS3OOLRbjBi0NDTbqGG4qZ0j/ySUwTAKw6tmUsDbU07fUu1FX8x6GuhfQ58
 0CLtmE3kgKQxORVv9PBN22k18Ulkb+j6GTQMzbNVUV6YXSslUxSIhc4hsa9YjFkNkz93
 HaH86K/xcVXCcbxRPRBwYQ45RA8Kev/Md3eQcx+CEnajY2rlvU2yVjWXwhi664QVGb/j
 LkB21ATwKA9dg2/KR3bZc6ucPWb5iv1E35ofbgEk2cxDIRJhUNtbwZyKXOo3dt0RNvaQ
 HcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=pkFTuk+TNQNm+gOgPOs6LK/YFjb2sUYttyn3WHOqJrE=;
 b=DusQpC2JtdB6m3FtzyiNDS04F6onMIUe4JaVZSYeh/QtwLG2drDi61L1xXTLCnkHKT
 2olXdPayYKhxacwljkXpFJCscU3lS2hMHe26jri92kSc+ixz7jNOLx3DJ48RIurQ3tsA
 KCEKRUBjg28luKv3lQGBJ0jPzEY1ahAhz7OKAPDB60F0KbqHOgs7vGme07Wbqro8tbPC
 54H28xw+1bl7UyOM87joEL8S/EcZhi2eYkVBUBmI3jWyOduyV1XDvy2wXDgM3BmOqazF
 +Bp3YU8sin1HL6a7TTqSuq2mTDpuBWcH/QE/OnqW6k4tXSMlvhv41W9zlz43rCraLy7+
 bTng==
X-Gm-Message-State: AOAM531NW+zGYk+6OVNRkxdPrhf+HNxBemNM/j2zWCuc0UeV3M5bBCOt
 /cskkDIC23rsZL17GZztM9quMWYDv+m8mP4=
X-Google-Smtp-Source: ABdhPJxKqfXo3iQNgHrvCi7VnP8x5LUCg5ZseTj4zS2VOEiSyA3rRupZVRg7ZXrdqS1hqlyo3hFdXgX8bZj5Q+g=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:5241:a7e9:90c9:9c91])
 (user=saravanak job=sendgmr) by 2002:a05:6214:406:: with SMTP id
 z6mr8713464qvx.34.1632874064532; Tue, 28 Sep 2021 17:07:44 -0700 (PDT)
Date: Tue, 28 Sep 2021 17:07:34 -0700
In-Reply-To: <20210929000735.585237-1-saravanak@google.com>
Message-Id: <20210929000735.585237-3-saravanak@google.com>
Mime-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v4 2/2] drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
From: Saravana Kannan <saravanak@google.com>
To: Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_170746_564861_632E40FF 
X-CRM114-Status: GOOD (  14.18  )
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

The simple-pm-bus driver is mandatory for CONFIG_OF based platforms to work
with fw_devlink. So, always compile it in for CONFIG_OF and delete the
config since it's no longer necessary.

Signed-off-by: Saravana Kannan <saravanak@google.com>
Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
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
2.33.0.685.g46640cef36-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
