Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C863AD4663C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 23:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RCuWnq1VqSe8MRkn0YhIU8KhkWZwnqljza7tmEZndcI=; b=uctaLVbahQsyhP
	Yv/16EiDFlGvffsBncE6DPwP4KL9Zl07yI6GTI2IWpVdAXfW+qlZHDtPKuCxTckd0QvRDa2fIp3tu
	8pU6Okn7AAQ1LxVYrv43QX/inVgIUAnjk7XeAGBOkKTDWC7J7Bb+BfUAGuZ05BexQJEi0Kug/O5on
	6jFcn7q7pT44y/5RreBi/4ZdFBIfLM/a2yTD1vPpbLAj9NCvJZJRyH89PrOWyMhpO9HWO/lcvMB9J
	tsQmEBc5efWxNEc0UOjmnuAy1J/gbHFg2N8sdYNXhfB/FbH40qDfZ2yI0FtVAuyQZYq50qrCD4GjJ
	L5TP2uIXBOkrLdgWkmvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWzP-0000000DKKY-3kJg;
	Thu, 15 Jan 2026 23:42:55 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWzM-0000000DKJI-474h
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 23:42:54 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-79275e61c2cso15934767b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 15:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768520572; x=1769125372; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YuXosatL7jUspS52kKMFA09e6GoDFcrqO+bX2qZbTEM=;
        b=gzwDPs7QJizWb58q69U8or+j+DPvnspqDkEq3f4yIKHQN5jwxmTwoWaSUICCqc7LiT
         sfWxAXSwkhzp9hKNVglZa1SqzTWqZNtolnxRIC4qakF2wMrUQXiqcbBOgOqTicKYbE7F
         dsP1c9Jy/Aj6yVvnHprNIQT7T3yV53kOsNROtQLvreAfqjpYIsyF+cR/m5Yngl/uaPYw
         5RWMiU1EdW5MLShk7ABilw4VhdA1MhaZnMEqy0QzY59fwLFK8T8TpA/pEhgx6qjlHP17
         6/wCbMo/LG5S9FvIdNrFqb0E9PnNiXUvWy/6MUwn37kmcN0QhQ9PwFSU9RzfHX+4Yrto
         u5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768520572; x=1769125372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YuXosatL7jUspS52kKMFA09e6GoDFcrqO+bX2qZbTEM=;
        b=k8tj7o9TTOT2O2PecOus/JWvW0zOs1ecsai+NYED8sSxaHj8ajEy2VcvxZcOScjgXP
         f47wSBgYtwft++vUwD3KcXImet3i9vOCMEpsVtBSRQtOZWWwmsmdgtqwArhdgoKgcLwK
         Wk0Pwer3JobtqMqkVMTtFX2iQCLYTDFB/ToKyKW5S8Z93sxFcX4nKA+u5z+PKvoDFAtW
         8rW3xxF0YByiNsTutEbsJH1p5LpUNpIyf9awPJx3dNx/hQR8Cek1UZKZB02mLBaqjk7M
         BKZKDLZVd+V04w/Pg9Quj9Xu0F1ePYaMNN42HlNzxgN5H5jwV6oMHeLpU9uitcYeWiG2
         6ILg==
X-Gm-Message-State: AOJu0Yze97ZbWIvrmhSQhmTAxs1/X9ax+qNA87vOj7046EdVnIurrFxt
	+4dddN0v7zTFa0+j0HSLek8nXQe5vuJO8d0fT9qJNr9hX8lhciSiM4L5qneyVWR+AAY=
X-Gm-Gg: AY/fxX6Jg6xloPlqoub8U8dDcQucePuovNzOTVxy3J+wkNghLYbYaI15pJKJis0y5fU
	hmGB0j1kdURGHXfFpyNhAXmq/yvzGVQvqjpfuoTXxtTEHHFycLGto9YPypsMJdF1AmzHB1c3Okv
	Q2xQ9iaGTbC61cQiU/s7xLGshUtA244N8cH1p6NjqqBkKIhEgzDTOApu2xS5CstIsi0INP6ChPI
	r/wpeha4GBO7g7bXnZO6oKKd+vRy4Tb5V5ofzOP2lbq+WiIcvMT9sisKA1fdzsqAKkRqMugixIJ
	rHhnLVqoP+R7nVi+nww//Ph/T5SRDBtYb9QURRkv+ZLlet1ljYdESGSbMrULAzI8WFxMuRJpnMd
	sQ6PS/E/pB3VAk18D3QDa1ildzLW7E1O+GPtRciGxZcZZZExHOIe/EBx9C+FhwHeatTPZ9lY+LZ
	4sJW6Caahb10rz3bKvi1te7Xoyg60oT/ZwMw83Lzpa1kfjuUqjsPDS9fQGGrFAh8WsNEMhPq4=
X-Received: by 2002:a05:690c:e3e9:b0:792:7374:7ff4 with SMTP id 00721157ae682-793c66ac5e1mr8413757b3.11.1768520571893;
        Thu, 15 Jan 2026 15:42:51 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66c72aesm3027117b3.11.2026.01.15.15.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:42:51 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 15 Jan 2026 17:42:06 -0600
Subject: [PATCH 7/8] reset: tenstorrent: Add reset controller for Atlantis
MIME-Version: 1.0
Message-Id: <20260115-atlantis-clocks-v1-7-7356e671f28b@oss.tenstorrent.com>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
In-Reply-To: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
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
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_154253_046691_C487FF3C 
X-CRM114-Status: GOOD (  18.40  )
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

Implement reset controller as an auxiliary device of the clock
controller, sharing the same regmap interface. This version of the
driver covers resets from the RCPU syscon.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 MAINTAINERS                                |   1 +
 drivers/reset/Kconfig                      |  11 ++
 drivers/reset/Makefile                     |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c | 164 +++++++++++++++++++++++++++++
 4 files changed, 177 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93d941d2886b..31c3e5bcb32d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22538,6 +22538,7 @@ F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
 F:	drivers/clk/tenstorrent/
+F:	drivers/reset/reset-tenstorrent-atlantis.c
 F:	include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
 F:	include/soc/tenstorrent/
 
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
index 000000000000..b1e934a5b054
--- /dev/null
+++ b/drivers/reset/reset-tenstorrent-atlantis.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Tenstorrent
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/module.h>
+#include <linux/reset-controller.h>
+#include <linux/regmap.h>
+
+#include <soc/tenstorrent/atlantis-syscon.h>
+#include <dt-bindings/clock/tenstorrent,atlantis-syscon.h>
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
+	[RST_SMNDMA0] = RESET_DATA(RCPU_BLK_RST_REG, 0, true),
+	[RST_SMNDMA1] = RESET_DATA(RCPU_BLK_RST_REG, 1, true),
+	[RST_WDT0] = RESET_DATA(RCPU_BLK_RST_REG, 2, true),
+	[RST_WDT1] = RESET_DATA(RCPU_BLK_RST_REG, 3, true),
+	[RST_TMR] = RESET_DATA(RCPU_BLK_RST_REG, 4, true),
+	[RST_PVTC] = RESET_DATA(RCPU_BLK_RST_REG, 12, true),
+	[RST_PMU] = RESET_DATA(RCPU_BLK_RST_REG, 13, true),
+	[RST_MAILBOX] = RESET_DATA(RCPU_BLK_RST_REG, 14, true),
+	[RST_SPACC] = RESET_DATA(RCPU_BLK_RST_REG, 26, true),
+	[RST_OTP] = RESET_DATA(RCPU_BLK_RST_REG, 28, true),
+	[RST_TRNG] = RESET_DATA(RCPU_BLK_RST_REG, 29, true),
+	[RST_CRC] = RESET_DATA(RCPU_BLK_RST_REG, 30, true),
+
+	[RST_QSPI] = RESET_DATA(LSIO_BLK_RST_REG, 0, true),
+	[RST_I2C0] = RESET_DATA(LSIO_BLK_RST_REG, 1, true),
+	[RST_I2C1] = RESET_DATA(LSIO_BLK_RST_REG, 2, true),
+	[RST_I2C2] = RESET_DATA(LSIO_BLK_RST_REG, 3, true),
+	[RST_I2C3] = RESET_DATA(LSIO_BLK_RST_REG, 4, true),
+	[RST_I2C4] = RESET_DATA(LSIO_BLK_RST_REG, 5, true),
+	[RST_UART0] = RESET_DATA(LSIO_BLK_RST_REG, 6, true),
+	[RST_UART1] = RESET_DATA(LSIO_BLK_RST_REG, 7, true),
+	[RST_UART2] = RESET_DATA(LSIO_BLK_RST_REG, 8, true),
+	[RST_UART3] = RESET_DATA(LSIO_BLK_RST_REG, 9, true),
+	[RST_UART4] = RESET_DATA(LSIO_BLK_RST_REG, 10, true),
+	[RST_SPI0] = RESET_DATA(LSIO_BLK_RST_REG, 11, true),
+	[RST_SPI1] = RESET_DATA(LSIO_BLK_RST_REG, 12, true),
+	[RST_SPI2] = RESET_DATA(LSIO_BLK_RST_REG, 13, true),
+	[RST_SPI3] = RESET_DATA(LSIO_BLK_RST_REG, 14, true),
+	[RST_GPIO] = RESET_DATA(LSIO_BLK_RST_REG, 15, true),
+	[RST_CAN0] = RESET_DATA(LSIO_BLK_RST_REG, 17, true),
+	[RST_CAN1] = RESET_DATA(LSIO_BLK_RST_REG, 18, true),
+	[RST_I2S0] = RESET_DATA(LSIO_BLK_RST_REG, 19, true),
+	[RST_I2S1] = RESET_DATA(LSIO_BLK_RST_REG, 20, true),
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
+		val = ~mask;
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
+	struct atlantis_ccu_adev *rdev = to_atlantis_ccu_adev(adev);
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
+	{ .name = "atlantis_ccu.rcpu-reset",
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
+MODULE_DESCRIPTION("Atlantis reset controller driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
