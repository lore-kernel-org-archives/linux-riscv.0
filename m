Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B4FE6BF2F
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 17:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ukenbs7aUc5mjijqbJ7ZHHbmd9itemju/w1sz4gT6go=; b=KlZvVfJjfzckhy
	m4rNsHaHE1lnvjqbyMh5YWwa1Mhnx1xTMqOsmhNTo7oxSU26x9G56Gxgmu6XIetfAJ/wYcTTkyzwS
	xJHHKu84GX1IWwHaBiTGzdhETrAs1neWNhb3sObR40WI1cyTRifcMQbCLmK1sTk9tpX6vi+yIO92E
	LxezD8Ja9tKCrL56PsvXVfUcVPlwuPQpBwfCNWsVTJbR59aOOMdJIvCVHnKO/6SuPsp7TzIxuOieK
	Z3gDl+aTHK01JNKKgm8akdw59Bp9be4J9gMcoy7mCo7ljfwh0mi5QorTXRxcGpvd44kNEKJeZ3E4x
	8d99iZOuvagzHP5+34Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsdh-00000001nI2-3QAS;
	Fri, 30 Jan 2026 17:50:37 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsdf-00000001nHB-1KUN
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 17:50:36 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-649ae700ba0so585990d50.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jan 2026 09:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769795434; x=1770400234; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZMMTz+zEnEaVc0tT9uLbJMYSdAwAyWPF8xhmiLxTpo=;
        b=Qfn6eUUtt2k+Sw/HFbSikra7MFV+iE+Yol7qsHI2to8be5B+HtqXvtBSylliYqd4C+
         UPhQIvxzvGIJ0DL3Rr4hnUnmbfMAgfsvOArYVGiuhkHynNS4A9I2rmYrnpehQkB958EP
         t6dtBl/WXbLn9e2s8+9Z2kRJwYjSzgvIkIKBnTOL6MWACxdzwrrSwdIz9brbmjtILQ1j
         sw8EhgilwkUoPUkJe+KANPSGR9yqRWp9paoaPHqn74Xw0KWa/bWK0gDFBbnZjj8ylG4W
         1en4z9y/UpyxGZbAhK+zJ08iLz8yASMOkPtJLlWd4KpgaNP65acMlWRoM6D5ujetj2JA
         q1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769795434; x=1770400234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UZMMTz+zEnEaVc0tT9uLbJMYSdAwAyWPF8xhmiLxTpo=;
        b=FPlzpaHcPj9G6clFicabBvk4e3pnQ8737sieAqixveQ8FmqaOvdVwo+KdenfQsnNVh
         b5BVz+L3eBjFhZeY/OQt/0vhc4ktKcMlUmncAKZFnxBMpc8RNRG6ns42mTMmVMBxwxQJ
         IzDc4Ot66NzSbhdOqph23O0wofVMaN8Irtlh5eUtUpwZ7hCIUMgMxyKezozgI/Wq9gge
         wnlodg4Aa1ydwevW2TYrFxqhD4YeJpnRMl5WIS76YQB6Xe05IlSt/37uHRaxqN5yKIpV
         yV7HFOS90yQEMqPq1fu7V33DyJ0yiO/2uTMhFRTK5zR1dHje1L6YtT/wjGnljpoWDU8B
         1m2w==
X-Gm-Message-State: AOJu0Yz8MIINGKNkD5DDkOGDE6kMJKwvkBglWmKtQvXcHVsK10LSSqL9
	XEacwPMsA0z+QdF6hwiTiUe1CzUxBFBukbk4BJJMKgInY5ILhqHTqB8ES8dAJxHUGqs=
X-Gm-Gg: AZuq6aJA3nLYPHsLsC2PBQgk6F/iIsbFfPt35S9Ul5ULf09Asw7FTNBJxzqcwmjEQdk
	NGJCJb5Xw+AwIm91jFjEjmk48ZVOUehVT0ZchGE6SXzufhlIicEuqkkVCl5jeDONicBhojlaDMq
	frwnEYLb7oLSB09ECTgLPJ+UKhPk54IEtUOw0RwWmKc37HK/n5p6RK8q1wp/URNpJadnhMTNCRm
	hjIeovZuCCnTuBzDfdbO0gC/XqKXi0XoLY2dP9Fo73dHNPc4xye+GYSyf7Iy+nUTZGz87WZaoz6
	Y9rNG+FeRszGl3GDgsFmdbNBfruHnEiT99Wc9QNOZ6pDhfn3GpdeKwtup/Y0SmMqrDB3O2hwdLb
	Cv5kAeAZ+eOYzoV80cWKcH8WutBtXtjE4hKZfkyLokUA/KHHsjmeSJdbgi3Oc/SYXsqIGbRD4xk
	hX6wi0liyPemVeN8cWgIoptch3NlQEjYKB+8M+rwhhN9/zCCYVtV0h4CipHVhKYSRGXf6OnlBzH
	EjugWNp5+7DD5E=
X-Received: by 2002:a05:690c:c513:b0:794:25c:2cc4 with SMTP id 00721157ae682-7949df4f9d2mr69480157b3.31.1769795434000;
        Fri, 30 Jan 2026 09:50:34 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649960e0965sm3939108d50.13.2026.01.30.09.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 09:50:33 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 30 Jan 2026 11:50:22 -0600
Subject: [PATCH v4 2/3] reset: tenstorrent: Add reset controller for
 Atlantis
MIME-Version: 1.0
Message-Id: <20260130-atlantis-clocks-v4-2-46de52d52924@oss.tenstorrent.com>
References: <20260130-atlantis-clocks-v4-0-46de52d52924@oss.tenstorrent.com>
In-Reply-To: <20260130-atlantis-clocks-v4-0-46de52d52924@oss.tenstorrent.com>
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com, 
 bmasney@redhat.com
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_095035_383846_45349CA9 
X-CRM114-Status: GOOD (  18.55  )
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

Adds Atlantis Reset Controller and auxiliary device definitions for
reset to share same regmap interface as prcm (clock controller).

This version of the reset controller driver covers resets from the RCPU
prcm.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 MAINTAINERS                                |   2 +
 drivers/reset/Kconfig                      |  11 ++
 drivers/reset/Makefile                     |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c | 160 +++++++++++++++++++++++++++++
 include/soc/tenstorrent/atlantis-prcm.h    |  31 ++++++
 5 files changed, 205 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0fc7bc6d0458..0cde1774567d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22537,7 +22537,9 @@ T:	git https://github.com/tenstorrent/linux.git
 F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
+F:	drivers/reset/reset-tenstorrent-atlantis.c
 F:	include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
+F:	include/soc/tenstorrent/
 
 RISC-V THEAD SoC SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 6e5d6deffa7d..cade77717492 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -324,6 +324,17 @@ config RESET_SUNXI
 	help
 	  This enables the reset driver for Allwinner SoCs.
 
+config RESET_TENSTORRENT_ATLANTIS
+	tristate "Tenstorrent atlantis reset driver"
+	depends on ARCH_TENSTORRENT || COMPILE_TEST
+	select AUXILIARY_BUS
+	default ARCH_TENSTORRENT
+	help
+	  This enables the driver for the reset controller
+	  present in the Tenstorrent Atlantis SoC.
+	  Enable this option to be able to use hardware
+	  resets on Atalantis based systems.
+
 config RESET_TH1520
 	tristate "T-HEAD TH1520 reset controller"
 	depends on ARCH_THEAD || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 9c3e484dfd81..a31959da0a88 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
 obj-$(CONFIG_RESET_SPACEMIT) += reset-spacemit.o
 obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
+obj-$(CONFIG_RESET_TENSTORRENT_ATLANTIS) += reset-tenstorrent-atlantis.o
 obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
 obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
 obj-$(CONFIG_RESET_TI_SYSCON) += reset-ti-syscon.o
diff --git a/drivers/reset/reset-tenstorrent-atlantis.c b/drivers/reset/reset-tenstorrent-atlantis.c
new file mode 100644
index 000000000000..6fe9143ad76c
--- /dev/null
+++ b/drivers/reset/reset-tenstorrent-atlantis.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Tenstorrent Atlantis PRCM Reset Driver
+ *
+ * Copyright (c) 2026 Tenstorrent
+ */
+
+#include <dt-bindings/clock/tenstorrent,atlantis-prcm.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/reset-controller.h>
+#include <linux/regmap.h>
+#include <soc/tenstorrent/atlantis-prcm.h>
+
+struct atlantis_reset_data {
+	u8 bit;
+	u16 reg;
+	bool active_low;
+};
+
+struct atlantis_reset_controller_data {
+	const struct atlantis_reset_data *reset_data;
+	size_t count;
+};
+
+struct atlantis_reset_controller {
+	struct reset_controller_dev rcdev;
+	const struct atlantis_reset_controller_data *data;
+	struct regmap *regmap;
+};
+
+#define to_atlantis_reset_controller(_rcdev) \
+	container_of((_rcdev), struct atlantis_reset_controller, rcdev)
+
+#define RESET_DATA(_reg, _bit, _active_low)                          \
+	{                                                            \
+		.bit = _bit, .reg = _reg, .active_low = _active_low, \
+	}
+
+static const struct atlantis_reset_data atlantis_rcpu_resets[] = {
+	[RST_SMNDMA0]	= RESET_DATA(RCPU_BLK_RST_REG, 0, true),
+	[RST_SMNDMA1]	= RESET_DATA(RCPU_BLK_RST_REG, 1, true),
+	[RST_WDT0]	= RESET_DATA(RCPU_BLK_RST_REG, 2, true),
+	[RST_WDT1]	= RESET_DATA(RCPU_BLK_RST_REG, 3, true),
+	[RST_TMR]	= RESET_DATA(RCPU_BLK_RST_REG, 4, true),
+	[RST_PVTC]	= RESET_DATA(RCPU_BLK_RST_REG, 12, true),
+	[RST_PMU]	= RESET_DATA(RCPU_BLK_RST_REG, 13, true),
+	[RST_MAILBOX]	= RESET_DATA(RCPU_BLK_RST_REG, 14, true),
+	[RST_SPACC]	= RESET_DATA(RCPU_BLK_RST_REG, 26, true),
+	[RST_OTP]	= RESET_DATA(RCPU_BLK_RST_REG, 28, true),
+	[RST_TRNG]	= RESET_DATA(RCPU_BLK_RST_REG, 29, true),
+	[RST_CRC]	= RESET_DATA(RCPU_BLK_RST_REG, 30, true),
+	[RST_QSPI]	= RESET_DATA(LSIO_BLK_RST_REG, 0, true),
+	[RST_I2C0]	= RESET_DATA(LSIO_BLK_RST_REG, 1, true),
+	[RST_I2C1]	= RESET_DATA(LSIO_BLK_RST_REG, 2, true),
+	[RST_I2C2]	= RESET_DATA(LSIO_BLK_RST_REG, 3, true),
+	[RST_I2C3]	= RESET_DATA(LSIO_BLK_RST_REG, 4, true),
+	[RST_I2C4]	= RESET_DATA(LSIO_BLK_RST_REG, 5, true),
+	[RST_UART0]	= RESET_DATA(LSIO_BLK_RST_REG, 6, true),
+	[RST_UART1]	= RESET_DATA(LSIO_BLK_RST_REG, 7, true),
+	[RST_UART2]	= RESET_DATA(LSIO_BLK_RST_REG, 8, true),
+	[RST_UART3]	= RESET_DATA(LSIO_BLK_RST_REG, 9, true),
+	[RST_UART4]	= RESET_DATA(LSIO_BLK_RST_REG, 10, true),
+	[RST_SPI0]	= RESET_DATA(LSIO_BLK_RST_REG, 11, true),
+	[RST_SPI1]	= RESET_DATA(LSIO_BLK_RST_REG, 12, true),
+	[RST_SPI2]	= RESET_DATA(LSIO_BLK_RST_REG, 13, true),
+	[RST_SPI3]	= RESET_DATA(LSIO_BLK_RST_REG, 14, true),
+	[RST_GPIO]	= RESET_DATA(LSIO_BLK_RST_REG, 15, true),
+	[RST_CAN0]	= RESET_DATA(LSIO_BLK_RST_REG, 17, true),
+	[RST_CAN1]	= RESET_DATA(LSIO_BLK_RST_REG, 18, true),
+	[RST_I2S0]	= RESET_DATA(LSIO_BLK_RST_REG, 19, true),
+	[RST_I2S1]	= RESET_DATA(LSIO_BLK_RST_REG, 20, true),
+
+};
+
+static const struct atlantis_reset_controller_data atlantis_rcpu_reset_data = {
+	.reset_data = atlantis_rcpu_resets,
+	.count = ARRAY_SIZE(atlantis_rcpu_resets),
+};
+
+static int atlantis_reset_update(struct reset_controller_dev *rcdev,
+				 unsigned long id, bool assert)
+{
+	unsigned int val;
+	struct atlantis_reset_controller *rst =
+		to_atlantis_reset_controller(rcdev);
+	const struct atlantis_reset_data *data = &rst->data->reset_data[id];
+	unsigned int mask = BIT(data->bit);
+	struct regmap *regmap = rst->regmap;
+
+	if (data->active_low ^ assert)
+		val = mask;
+	else
+		val = 0;
+
+	return regmap_update_bits(regmap, data->reg, mask, val);
+}
+
+static int atlantis_reset_assert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	return atlantis_reset_update(rcdev, id, true);
+}
+
+static int atlantis_reset_deassert(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	return atlantis_reset_update(rcdev, id, false);
+}
+
+static const struct reset_control_ops atlantis_reset_control_ops = {
+	.assert = atlantis_reset_assert,
+	.deassert = atlantis_reset_deassert,
+};
+
+static int
+atlantis_reset_controller_register(struct device *dev,
+				   struct atlantis_reset_controller *controller)
+{
+	struct reset_controller_dev *rcdev = &controller->rcdev;
+
+	rcdev->ops = &atlantis_reset_control_ops;
+	rcdev->owner = THIS_MODULE;
+	rcdev->of_node = dev->of_node;
+	rcdev->nr_resets = controller->data->count;
+
+	return devm_reset_controller_register(dev, &controller->rcdev);
+}
+static int atlantis_reset_probe(struct auxiliary_device *adev,
+				const struct auxiliary_device_id *id)
+{
+	struct atlantis_prcm_adev *rdev = to_atlantis_prcm_adev(adev);
+	struct atlantis_reset_controller *controller;
+	struct device *dev = &adev->dev;
+
+	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
+	if (!controller)
+		return -ENOMEM;
+	controller->data =
+		(const struct atlantis_reset_controller_data *)id->driver_data;
+	controller->regmap = rdev->regmap;
+
+	return atlantis_reset_controller_register(dev, controller);
+}
+
+static const struct auxiliary_device_id atlantis_reset_ids[] = {
+	{ .name = "atlantis_prcm.rcpu-reset",
+	  .driver_data = (kernel_ulong_t)&atlantis_rcpu_reset_data },
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, atlantis_reset_ids);
+
+static struct auxiliary_driver atlantis_reset_driver = {
+	.probe = atlantis_reset_probe,
+	.id_table = atlantis_reset_ids,
+};
+module_auxiliary_driver(atlantis_reset_driver);
+
+MODULE_AUTHOR("Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>");
+MODULE_DESCRIPTION("Atlantis PRCM reset controller driver");
+MODULE_LICENSE("GPL");
diff --git a/include/soc/tenstorrent/atlantis-prcm.h b/include/soc/tenstorrent/atlantis-prcm.h
new file mode 100644
index 000000000000..841516cbefd9
--- /dev/null
+++ b/include/soc/tenstorrent/atlantis-prcm.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Shared definitions for Atlantis PRCM Clock and Reset Drivers
+ *
+ * Copyright (c) 2026 Tenstorrent
+ */
+#ifndef __SOC_ATLANTIS_PRCM_H__
+#define __SOC_ATLANTIS_PRCM_H__
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+struct atlantis_prcm_adev {
+	struct auxiliary_device adev;
+	struct regmap *regmap;
+};
+
+static inline struct atlantis_prcm_adev *
+to_atlantis_prcm_adev(struct auxiliary_device *adev)
+{
+	return container_of(adev, struct atlantis_prcm_adev, adev);
+}
+
+/* RCPU Reset Register Offsets */
+#define RCPU_BLK_RST_REG 0x001c
+#define LSIO_BLK_RST_REG 0x0020
+#define HSIO_BLK_RST_REG 0x000c
+#define PCIE_SUBS_RST_REG 0x0000
+#define MM_RSTN_REG 0x0014
+
+#endif

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
