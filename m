Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE94DD2ED12
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 11:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DH9CuUh3ldbCc7nzsO1uTgH+T/XxDIvv9+PlNYEgr10=; b=sqg1FVJocEzijI
	EeEZdpabcOBV8HFiTTQInSwUqIw5sR3syvtgG5Qhi4eAXSRL21JN9crVR/3XlXjiXRwl/Nb1hPtRK
	bAU1yag+ak6HYWYnGgRB6ZoyMiV0HxUssQXi+8YbZip46iXCx8Qit+NwX6HhEOLLtPeZNQJhTKZ+3
	P0pm0MGjQlLxTIZsuZj1EESvhpDVUHhnfeNObZ7O8U2SMO/h7foGraTtbNKcKtBeWUwscgfP0ctZP
	u9OOg+x5p0q3mcdQmMqrl0fRpH6F/11CMt4nzhTfUrfSGmbaS2F4+0t8LkURzLIPnhLFmrRomVpAR
	q2tZgI9F1lc1oYT73XrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9dq-00000003g6a-1vCC;
	Tue, 20 Jan 2026 11:11:22 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9do-00000003g63-17Ia
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 11:11:21 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-81f223c70d8so4382244b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 03:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768907479; x=1769512279; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JaBSZVkVDpyEFk0K6mei2gWdyNIGdA1b2fG0c+mMO1c=;
        b=sC37AZx1KNLACmmuaoSFBYOKC6Ve5QLIfTuQwBbMXonhkQIu9NUqht7m5TaKogkIC1
         3bColTJUZkgb5SUaCoQ6foiIf+O9t5TP25Jsc609qQzbEeHATMJOdMBH7Mz6DQsqYzgi
         BYbyS0RiwvpqBXgrNNSWt1bvGSAgMj36sUVGoXbuQyQ453J4iRpTMWLol56M9yvFZm5G
         40fsW9Jy3jqXASLW6lJlxBBMWDrbhe9UoAZhhPF04RqVVoq6qaqwtFjGqYQ5HGJecj56
         nDvO1D45T8UvcAl5Xztm6vq1dfhejZlgjewZq0/4LRGF3C2W25l/PhIYlbWoE9sMEOMu
         ZBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907479; x=1769512279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JaBSZVkVDpyEFk0K6mei2gWdyNIGdA1b2fG0c+mMO1c=;
        b=u9A//UEr6gzi4sPMyQiumX+FWWLTNCO5MI2LQBO59Kq6+ItO6W7HOd6skK1RC8B0J2
         VevmBu7KNw6RmR6S/O+RZ+7ZARr/cEjd8gEPEc5uXYih6tyLvdRz0f3uLZS7pfv2GXCm
         OXrwGV759urc8H95tp5rjenm4cli5yafA78VCEulWVU1PBzOxq+Y3iP978m8RdeF2gl6
         JOzfIQgGvaFbJ24juH1dGIGeHtvhGEbubZsTz2bBoLCXIdwTPf1TvXJE0FAPfbPPGn7+
         iAQ6P6921uXUDf2dFxeGypCE+4K8SW9UA3yr58FG+DXdaKcuPDMjeqSisDvpX2+Y9NaP
         ckDA==
X-Forwarded-Encrypted: i=1; AJvYcCUZmOY/OUugTu6UMxOh3oHb9bHs8aLjxT40cqfDtR/LVMO0iKyKlxL8hJHbQYNmWvMuKyHrBubOusQRLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwP5j8B6HBhhGCxCwLcpCa3O61q8/bsJfOas0ecCa+CkmJqGSQP
	aTm6Bsqy0fhd4L03GQAn2gkPwhyxF6q1b+nfewTqufNJKL3TNFNYCtYRkfzlpjhr1Hc=
X-Gm-Gg: AY/fxX7ugUDIF/Vipe0YqhwghkgnQ9liSiSQGF56nE5i9YH6nIHyjyDfAA7M7Jf3iqU
	W5q/arQhhff253rufqedIF8eZe+Hn871ZKJWDceWyCj+dxCHTMKcvtm3rDLG9uEVTJeOsicXyx0
	vYxbuN+GAxB7bljyMZ74irhrAO+GjquEz8bEx9bv4OtvXvJRMx77nCyz96IbkuaZsOKZCTdI1OU
	rBrGDeF+SR9xgIFZF6aO8bh0kJwJ6cv4+cmtmvD7JSEP11tnKI6ErSZAih4a33RANXbmpF+xk4R
	3c1XpAibrPtgPr+KMGaszOe8hbXZkvduetvPMP8jGZ90EJgmLlnAFifOp52VFfeoBEM78mjlrkH
	s01T30VkvP9OpTgGFJxhSvDao7LwK9pWhhh4Tt/qpMaZLvDPsvMCb2zxfY38fdNzwilivkqIYWQ
	XYMpV5cigvsu9OMhqi/qlHuJ2oDjoDGYbdqoGS1i6I+A==
X-Received: by 2002:a05:6a00:3a25:b0:81f:4063:f1e4 with SMTP id d2e1a72fcca58-81fa184efc7mr11353743b3a.56.1768907479280;
        Tue, 20 Jan 2026 03:11:19 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4015])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10efc6bsm11398349b3a.29.2026.01.20.03.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:11:18 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 20 Jan 2026 19:10:50 +0800
Subject: [PATCH v3 2/4] reset: Create subdirectory for SpacemiT drivers
MIME-Version: 1.0
Message-Id: <20260120-k3-reset-v3-2-effe87f4bdbe@riscstar.com>
References: <20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com>
In-Reply-To: <20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Haylen Chu <heylenay@4d2.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_031120_316730_02587E82 
X-CRM114-Status: GOOD (  16.50  )
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

Create a dedicated subdirectory for SpacemiT reset drivers to allow
for better organization as support for more SoCs is added.

Move the existing K1 reset driver into this new directory and rename
it to reset-spacemit-k1.c.

Rename the Kconfig symbol to RESET_SPACEMIT_K1 and update its default
from ARCH_SPACEMIT to SPACEMIT_K1_CCU. The reset driver depends on the
clock driver to register reset devices as an auxiliary device, so the
default should reflect this dependency.

Also sort the drivers/reset/Kconfig entries alphabetically.

Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Add Alex's reviewed-by.
    Remove the trailing empty newline in Makefile to keep constant style
     with others in the reset folder.
v2: No change.
---
 drivers/reset/Kconfig                                      | 12 ++----------
 drivers/reset/Makefile                                     |  2 +-
 drivers/reset/spacemit/Kconfig                             | 14 ++++++++++++++
 drivers/reset/spacemit/Makefile                            |  2 ++
 .../{reset-spacemit.c => spacemit/reset-spacemit-k1.c}     |  0
 5 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 6e5d6deffa7d..b110f0fa7bb1 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -299,15 +299,6 @@ config RESET_SOCFPGA
 	  This enables the reset driver for the SoCFPGA ARMv7 platforms. This
 	  driver gets initialized early during platform init calls.
 
-config RESET_SPACEMIT
-	tristate "SpacemiT reset driver"
-	depends on ARCH_SPACEMIT || COMPILE_TEST
-	select AUXILIARY_BUS
-	default ARCH_SPACEMIT
-	help
-	  This enables the reset controller driver for SpacemiT SoCs,
-	  including the K1.
-
 config RESET_SUNPLUS
 	bool "Sunplus SoCs Reset Driver" if COMPILE_TEST
 	default ARCH_SUNPLUS
@@ -406,9 +397,10 @@ config RESET_ZYNQMP
 	  This enables the reset controller driver for Xilinx ZynqMP SoCs.
 
 source "drivers/reset/amlogic/Kconfig"
+source "drivers/reset/hisilicon/Kconfig"
+source "drivers/reset/spacemit/Kconfig"
 source "drivers/reset/starfive/Kconfig"
 source "drivers/reset/sti/Kconfig"
-source "drivers/reset/hisilicon/Kconfig"
 source "drivers/reset/tegra/Kconfig"
 
 endif
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 9c3e484dfd81..fc0cc99f8514 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -2,6 +2,7 @@
 obj-y += core.o
 obj-y += amlogic/
 obj-y += hisilicon/
+obj-y += spacemit/
 obj-y += starfive/
 obj-y += sti/
 obj-y += tegra/
@@ -38,7 +39,6 @@ obj-$(CONFIG_RESET_RZV2H_USB2PHY) += reset-rzv2h-usb2phy.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
-obj-$(CONFIG_RESET_SPACEMIT) += reset-spacemit.o
 obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
 obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
new file mode 100644
index 000000000000..552884e8b72a
--- /dev/null
+++ b/drivers/reset/spacemit/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config RESET_SPACEMIT_K1
+	tristate "SpacemiT K1 reset driver"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on SPACEMIT_K1_CCU
+	select AUXILIARY_BUS
+	default SPACEMIT_K1_CCU
+	help
+	  Support for reset controller in SpacemiT K1 SoC.
+	  This driver works with the SpacemiT K1 clock controller
+	  unit (CCU) driver to provide reset control functionality
+	  for various peripherals and subsystems in the SoC.
+
diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
new file mode 100644
index 000000000000..34e3350136bb
--- /dev/null
+++ b/drivers/reset/spacemit/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_RESET_SPACEMIT_K1)		+= reset-spacemit-k1.o
diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/spacemit/reset-spacemit-k1.c
similarity index 100%
rename from drivers/reset/reset-spacemit.c
rename to drivers/reset/spacemit/reset-spacemit-k1.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
