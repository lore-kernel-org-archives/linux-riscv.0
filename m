Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3A7C001DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 17:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=llM5v0VSaM8fLcr12s6Ui+TCX2CJQ6eW1G/Q1LpfqXw=; b=wukTgTjWSvR/NN
	PhrdXwrQ+r4lA8pVmLUOSlt2g4PDDcaGQgHxtcR3pEMPvaf0rYjmfWjb0623+lOV9Qh8Q9y/wmoyi
	RNLXweJtRGuh3O7l0f2mkBrVq3ZVuoxb9j875nMmyHxcPhdYR+2s2p2lEXwb+2D4zgjEZUcENiEjt
	AtHKVqfCLPICVzobxykUdYUp5bDjVT4I0fbt9bWAehwCAW1MIuHCfK7hnlOxP86g20fDdb+fpPFx+
	xbGpxHRUn2HTnCeZRd4AgAp7PXyoZ+W2ELDg+cjd5Tijfsiq2+O69REIlTCpuORyIsqDx8Hrl3f+4
	iIY4FPG149Pef6yi+BnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMvu-006qgf-2L;
	Fri, 14 Jul 2023 17:50:22 +0000
Received: from mail-il1-f180.google.com ([209.85.166.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMvi-006qVk-2t;
	Fri, 14 Jul 2023 17:50:14 +0000
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-345df4e68afso9814165ab.0;
        Fri, 14 Jul 2023 10:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689357008; x=1691949008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JTGowGQ+gnh0je21trugV/Og1PbGM9FG4W2OVva7pw0=;
        b=JkgFovSAJZnhh7nwuQfE7PMpUxJCWO1qFBqx1SnNzuTzW3SIn2uMFRyn1X+B+pEP2t
         Rq84YqnL8rftybTTwVANXFIjRRDuXYcKhiCR9vwaM5sqZKQCqgnEDo5mIz9z8ihfoi2g
         Q2jGvvjl6CG7kbHEBLa/grb6LY+5tgJ7YvMY47Uki9ZZcG5/bCd+ojInhQNlPCiPieSG
         LiV2wl5WKj493DQwVpQCjb+YhfatA457Oe3ytSdOsr2k5fYxNrJNZmICxNwi1viL2lUO
         F3x4c+AQV6WCjAKEY7xKHTXw4rSfH8Thg/s9vPWgo1uwx1HwIOhO0dxhh0OJ+0rrvRW7
         ODvg==
X-Gm-Message-State: ABy/qLbc+As12V6BFgxrifEyMbG998InYmBurS/IXoLvnCjJ0mZhB5+i
	To5zeszyQvxFHfqSY8vgJw==
X-Google-Smtp-Source: APBJJlEhOhChoEvuUEdONUTP5S4YdsfARFzKRecNc/9FDDY+IbgGFDh0FTj4W3Ikt2N9GuNQT2V8ig==
X-Received: by 2002:a92:d181:0:b0:346:3920:5df2 with SMTP id z1-20020a92d181000000b0034639205df2mr4814067ilz.21.1689357007895;
        Fri, 14 Jul 2023 10:50:07 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id c4-20020a02a404000000b0042b3e04510asm2694786jal.98.2023.07.14.10.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:50:07 -0700 (PDT)
Received: (nullmailer pid 4063785 invoked by uid 1000);
	Fri, 14 Jul 2023 17:49:41 -0000
From: Rob Herring <robh@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Damien Le Moal <dlemoal@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Lars Povlsen <lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] reset: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:49:37 -0600
Message-Id: <20230714174939.4063667-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_105010_976271_0345F46A 
X-CRM114-Status: GOOD (  13.19  )
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

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/reset/hisilicon/hi6220_reset.c | 1 -
 drivers/reset/hisilicon/reset-hi3660.c | 2 +-
 drivers/reset/reset-imx7.c             | 2 +-
 drivers/reset/reset-intel-gw.c         | 2 +-
 drivers/reset/reset-k210.c             | 1 -
 drivers/reset/reset-meson-audio-arb.c  | 3 ++-
 drivers/reset/reset-meson.c            | 1 -
 drivers/reset/reset-microchip-sparx5.c | 3 ++-
 drivers/reset/reset-mpfs.c             | 1 +
 drivers/reset/reset-qcom-aoss.c        | 2 +-
 drivers/reset/reset-qcom-pdc.c         | 2 +-
 drivers/reset/reset-simple.c           | 1 -
 drivers/reset/reset-uniphier-glue.c    | 2 +-
 drivers/reset/reset-uniphier.c         | 1 -
 drivers/reset/reset-zynqmp.c           | 1 -
 15 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/reset/hisilicon/hi6220_reset.c b/drivers/reset/hisilicon/hi6220_reset.c
index 5ca145b64e63..8d1fce18ded7 100644
--- a/drivers/reset/hisilicon/hi6220_reset.c
+++ b/drivers/reset/hisilicon/hi6220_reset.c
@@ -13,7 +13,6 @@
 #include <linux/module.h>
 #include <linux/bitops.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
 #include <linux/reset-controller.h>
diff --git a/drivers/reset/hisilicon/reset-hi3660.c b/drivers/reset/hisilicon/reset-hi3660.c
index 965f5ceba7d8..087f28e326ee 100644
--- a/drivers/reset/hisilicon/reset-hi3660.c
+++ b/drivers/reset/hisilicon/reset-hi3660.c
@@ -6,7 +6,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
diff --git a/drivers/reset/reset-imx7.c b/drivers/reset/reset-imx7.c
index d2408725eb2c..dd01fe11c5cb 100644
--- a/drivers/reset/reset-imx7.c
+++ b/drivers/reset/reset-imx7.c
@@ -9,7 +9,7 @@
 
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/regmap.h>
diff --git a/drivers/reset/reset-intel-gw.c b/drivers/reset/reset-intel-gw.c
index effc177db80a..a5a01388ae7f 100644
--- a/drivers/reset/reset-intel-gw.c
+++ b/drivers/reset/reset-intel-gw.c
@@ -6,7 +6,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/init.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/regmap.h>
diff --git a/drivers/reset/reset-k210.c b/drivers/reset/reset-k210.c
index 1b6e03522b40..b62a2fd44e4e 100644
--- a/drivers/reset/reset-k210.c
+++ b/drivers/reset/reset-k210.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2020 Western Digital Corporation or its affiliates.
  */
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/delay.h>
diff --git a/drivers/reset/reset-meson-audio-arb.c b/drivers/reset/reset-meson-audio-arb.c
index 6a3f6a6a3bbf..7e46dbc04998 100644
--- a/drivers/reset/reset-meson-audio-arb.c
+++ b/drivers/reset/reset-meson-audio-arb.c
@@ -5,7 +5,8 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/spinlock.h>
 
diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 13878ca2779d..89ac99789a3c 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -14,7 +14,6 @@
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
 #include <linux/types.h>
-#include <linux/of_device.h>
 
 #define BITS_PER_REG	32
 
diff --git a/drivers/reset/reset-microchip-sparx5.c b/drivers/reset/reset-microchip-sparx5.c
index ead25942061d..636e85c388b0 100644
--- a/drivers/reset/reset-microchip-sparx5.c
+++ b/drivers/reset/reset-microchip-sparx5.c
@@ -7,9 +7,10 @@
  * https://github.com/microchip-ung/sparx-5_reginfo
  */
 #include <linux/mfd/syscon.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
 
diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
index e71ab73092ab..7f3fb2d472f4 100644
--- a/drivers/reset/reset-mpfs.c
+++ b/drivers/reset/reset-mpfs.c
@@ -9,6 +9,7 @@
 #include <linux/auxiliary_bus.h>
 #include <linux/delay.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <dt-bindings/clock/microchip,mpfs-clock.h>
diff --git a/drivers/reset/reset-qcom-aoss.c b/drivers/reset/reset-qcom-aoss.c
index 9333b923dda0..f52e90e36194 100644
--- a/drivers/reset/reset-qcom-aoss.c
+++ b/drivers/reset/reset-qcom-aoss.c
@@ -8,7 +8,7 @@
 #include <linux/reset-controller.h>
 #include <linux/delay.h>
 #include <linux/io.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <dt-bindings/reset/qcom,sdm845-aoss.h>
 
 struct qcom_aoss_reset_map {
diff --git a/drivers/reset/reset-qcom-pdc.c b/drivers/reset/reset-qcom-pdc.c
index f22bb49a4ac8..a3aae3f902e6 100644
--- a/drivers/reset/reset-qcom-pdc.c
+++ b/drivers/reset/reset-qcom-pdc.c
@@ -4,7 +4,7 @@
  */
 
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 361a68314265..7ea5adbf2097 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -16,7 +16,6 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/reset/reset-simple.h>
diff --git a/drivers/reset/reset-uniphier-glue.c b/drivers/reset/reset-uniphier-glue.c
index 15abac9fc72c..38aa953855aa 100644
--- a/drivers/reset/reset-uniphier-glue.c
+++ b/drivers/reset/reset-uniphier-glue.c
@@ -6,7 +6,7 @@
 
 #include <linux/clk.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/reset/reset-simple.h>
diff --git a/drivers/reset/reset-uniphier.c b/drivers/reset/reset-uniphier.c
index ff7580f38056..79c43c204d46 100644
--- a/drivers/reset/reset-uniphier.c
+++ b/drivers/reset/reset-uniphier.c
@@ -7,7 +7,6 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
diff --git a/drivers/reset/reset-zynqmp.c b/drivers/reset/reset-zynqmp.c
index 59dc0ff9af9e..f0f64ad3472b 100644
--- a/drivers/reset/reset-zynqmp.c
+++ b/drivers/reset/reset-zynqmp.c
@@ -9,7 +9,6 @@
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/firmware/xlnx-zynqmp.h>
-#include <linux/of_device.h>
 
 #define ZYNQMP_NR_RESETS (ZYNQMP_PM_RESET_END - ZYNQMP_PM_RESET_START)
 #define ZYNQMP_RESET_ID ZYNQMP_PM_RESET_START
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
