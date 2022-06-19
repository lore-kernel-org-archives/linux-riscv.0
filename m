Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A50CCCA47A
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jun 2022 16:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fIhr0XssLx2bpfRd6RfjTKNyjOEVVtjTu4wywwjsS9c=; b=MVwg268JEiS28h
	nbgxabukOaSLvDrJObrcE87PTTHHAn9cLDa0H/LP/qN5VdVg4NQ52ZxV5UEBPNNOfHOVgFfJVLwei
	QdYz5GruNmFO1LRmfkWB6aTpNU6MSvX9ki4VcTta/rjaRgN7pYaslHwR6zYoN/YSiyNGIruM6nh85
	/EUCnc0UsL4y/8qu0z4dUs/9JTGNQxFlM58ey/Ha3Ug+EhSyCaM9CiaFmQpUkTJ7O4KPcbhj9huW8
	jr3JbTMrmANI5AOGGgcGZMHSed19jrLn8JPmqtNe/H1TgebYWRAA/+lY7eYyEp39rE1h3wreskYzj
	Qk0cG8BfSLE5IcvjoYUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2y86-00EjQn-CZ; Sun, 19 Jun 2022 16:50:30 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2y7z-00EjNm-JP
	for linux-riscv@lists.infradead.org; Sun, 19 Jun 2022 16:50:25 +0000
Received: by mail-wm1-x333.google.com with SMTP id j5-20020a05600c1c0500b0039c5dbbfa48so6673030wms.5
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jun 2022 09:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c4IVWtzGIGF6T142Ol1WYlyrcvd4gV9KicOgInUHMp4=;
        b=fi7iBkKkuE5lWRMzFlkGl9ONXI/rnRp7THWSvCbt0oMVjHWsP/PogJvrdTC0xhYuPI
         G2vJuqusrjZauCPKKn0Z8/oTU0OgTEeH9nLVimEochDedA0t1+JEDWlfTQG/8fKxPlrZ
         VzGNGFNCxWCg2wybkTJ6ShiWP8of4H7gfBwaAr8cPDeJ4IO1F+8dh7jufnvozlTnFdPC
         7JpDsg6OWMimJCXvRrKNDbRI9x6MzTudPZ9ZPTwySNpw3h6TIqMcBO71xK26uVHXHORE
         0GSFiiYkokwDWh49z096UY1jRRdtkxhOtxsO2mdxN48cvbjInzNovP1kkaMZ1hKlm0Or
         Y8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c4IVWtzGIGF6T142Ol1WYlyrcvd4gV9KicOgInUHMp4=;
        b=byzJ1BcA7/eaV36dymtnT9Jla+LRKMagFfx+cKVNr5bn8ns9llwj1qGXXKJ5d25BTp
         fMOjZvNeL7WRwWeMlLkgkdDMgQPHGjWtT/hdxyXlPKi8+fU9sLtfXuKVutVBrm0gxlwf
         Ec/y5uLv5Pe+uodbIDeBDSYeVOEZ9dYpgrhUl6BWj/MvdK6Z91aF6NnaBbLNQd+4+ho2
         /gWq/QE111O6i+evlbdby1+AgzM5ZJEOGrYfn4teNZIgdANGgazJ/Hgi5OTVnClbM4wH
         BuVrqi0WGngvWjK+6FDoyBQT78Fzg4hTOycHU5OY/DwQdZqyO4v/frjvcbOxJ8W4+P6f
         EXjA==
X-Gm-Message-State: AJIora81rn3Ndeaw8FvWu/wr9iiU34YGo8MtSGXkSNUl3NoQABblj3ts
	ot10G2yWw9pBDS0umJJN7uBOjA==
X-Google-Smtp-Source: AGRyM1uoTs4zbDrAZOYYa/tC0jlGDutAZWrGhM0SGtfaRxoo30vm5y8mGymmfL7WbNpvzcUmmWDEqA==
X-Received: by 2002:a05:600c:34cc:b0:39c:832c:bd92 with SMTP id d12-20020a05600c34cc00b0039c832cbd92mr20591963wmq.24.1655657421871;
        Sun, 19 Jun 2022 09:50:21 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id m14-20020adfdc4e000000b0021a3c960214sm9189510wrj.6.2022.06.19.09.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 09:50:21 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC 4/6] reset: add polarfire soc reset support
Date: Sun, 19 Jun 2022 17:49:34 +0100
Message-Id: <20220619164935.1492823-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220619164935.1492823-1-mail@conchuod.ie>
References: <20220619164935.1492823-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_095023_688764_7891719F 
X-CRM114-Status: GOOD (  26.36  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add support for the resets on Microchip's PolarFire SoC (MPFS).
Reset control is a single register, wedged in between registers for
clock control. To fit with existed DT etc, the reset controller is
created using the aux device framework & set up in the clock driver.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/reset/Kconfig      |   9 +++
 drivers/reset/Makefile     |   2 +-
 drivers/reset/reset-mpfs.c | 155 +++++++++++++++++++++++++++++++++++++
 3 files changed, 165 insertions(+), 1 deletion(-)
 create mode 100644 drivers/reset/reset-mpfs.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 93c8d07ee328..8f7d7cda690d 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -122,6 +122,15 @@ config RESET_MCHP_SPARX5
 	help
 	  This driver supports switch core reset for the Microchip Sparx5 SoC.
 
+config RESET_POLARFIRE_SOC
+	bool "Microchip PolarFire SoC (MPFS) Reset Driver"
+	depends on AUXILIARY_BUS
+	default MCHP_CLK_MPFS
+	help
+	  This driver supports switch core reset for the Microchip PolarFire SoC
+
+	  CONFIG_RESET_MPFS
+
 config RESET_MESON
 	tristate "Meson Reset Driver"
 	depends on ARCH_MESON || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index a80a9c4008a7..5fac3a753858 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_RESET_K210) += reset-k210.o
 obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
 obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
 obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
+obj-$(CONFIG_RESET_POLARFIRE_SOC) += reset-mpfs.o
 obj-$(CONFIG_RESET_MESON) += reset-meson.o
 obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
 obj-$(CONFIG_RESET_NPCM) += reset-npcm.o
@@ -38,4 +39,3 @@ obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
 obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
 obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
 obj-$(CONFIG_ARCH_ZYNQMP) += reset-zynqmp.o
-
diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
new file mode 100644
index 000000000000..6c9c10cd9077
--- /dev/null
+++ b/drivers/reset/reset-mpfs.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * PolarFire SoC (MPFS) Peripheral Clock Reset Controller
+ *
+ * Author: Conor Dooley <conor.dooley@microchip.com>
+ * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries.
+ *
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <dt-bindings/clock/microchip,mpfs-clock.h>
+#include <soc/microchip/mpfs.h>
+
+/*
+ * The ENVM reset is the lowest bit in the register & I am using the CLK_FOO
+ * defines in the dt to make things easier to configure - so this is accounting
+ * for the offset of 3 there.
+ */
+#define MPFS_PERIPH_OFFSET	CLK_ENVM
+#define MPFS_NUM_RESETS		30u
+
+/*
+ * Peripheral clock resets
+ */
+
+static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	u32 reg;
+
+	reg = mpfs_reset_read(rcdev->dev);
+	reg |= (1u << id);
+	mpfs_reset_write(rcdev->dev, reg);
+
+	dev_dbg(rcdev->dev,
+		"Asserting reset for device with REG_SUBBLK_RESET_CR index: %u\n",
+		id);
+	return 0;
+}
+
+static int mpfs_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	u32 reg, val;
+
+	reg = mpfs_reset_read(rcdev->dev);
+	val = reg & ~(1u << id);
+	mpfs_reset_write(rcdev->dev, val);
+
+	dev_dbg(rcdev->dev,
+		"Deasserting device with REG_SUBBLK_RESET_CR index: %u\n",
+		id);
+
+	return 0;
+}
+
+static int mpfs_status(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	u32 reg = mpfs_reset_read(rcdev->dev);
+
+	return (reg & (1u << id));
+}
+
+static int mpfs_reset(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	dev_dbg(rcdev->dev,
+		"Resetting device with REG_SUBBLK_RESET_CR index: %u\n",
+		id);
+
+	mpfs_assert(rcdev, id);
+
+	/* Value is stolen from the rcar reset driver, will need changing after RFC */
+	udelay(35);
+
+	mpfs_deassert(rcdev, id);
+
+	return 0;
+}
+
+static const struct reset_control_ops mpfs_reset_ops = {
+	.reset = mpfs_reset,
+	.assert = mpfs_assert,
+	.deassert = mpfs_deassert,
+	.status = mpfs_status,
+};
+
+static int mpfs_reset_xlate(struct reset_controller_dev *rcdev,
+			    const struct of_phandle_args *reset_spec)
+{
+	unsigned int index = reset_spec->args[0];
+
+	/*
+	 * CLK_RESERVED does not map to a clock, but it does map to a reset,
+	 * so it has to be accounted for here. It is the reset for the fabric,
+	 * so if this reset gets called - do not reset it.
+	 */
+	if (index == CLK_RESERVED) {
+		dev_err(rcdev->dev, "Resetting the fabric is not supported\n");
+		return -EINVAL;
+	}
+
+	if (index < MPFS_PERIPH_OFFSET || index >= (MPFS_PERIPH_OFFSET + rcdev->nr_resets)) {
+		dev_err(rcdev->dev, "Invalid reset index %u\n", reset_spec->args[0]);
+		return -EINVAL;
+	}
+
+	return index - MPFS_PERIPH_OFFSET;
+}
+
+static int mpfs_reset_probe(struct auxiliary_device *adev,
+			    const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct reset_controller_dev *rcdev;
+	int ret;
+
+	rcdev = devm_kzalloc(dev, sizeof(*rcdev), GFP_KERNEL);
+	if (!rcdev)
+		return -ENOMEM;
+
+	rcdev->dev = dev;
+	rcdev->dev->parent = adev->dev.parent;
+	rcdev->ops = &mpfs_reset_ops;
+	rcdev->of_node = adev->dev.parent->of_node;
+	rcdev->of_reset_n_cells = 1;
+	rcdev->of_xlate = mpfs_reset_xlate;
+	rcdev->nr_resets = MPFS_NUM_RESETS;
+
+	ret = devm_reset_controller_register(dev, rcdev);
+	if (!ret)
+		dev_info(dev, "Registered MPFS reset controller\n");
+
+	return ret;
+}
+
+static const struct auxiliary_device_id mpfs_reset_ids[] = {
+	{
+		.name = "clk_mpfs.reset-mpfs",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, mpfs_reset_ids);
+
+static struct auxiliary_driver mpfs_reset_driver = {
+	.probe		= mpfs_reset_probe,
+	.id_table	= mpfs_reset_ids,
+};
+
+module_auxiliary_driver(mpfs_reset_driver);
+
+MODULE_DESCRIPTION("Microchip PolarFire SoC Reset Driver");
+MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(MCHP_CLK_MPFS);
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
