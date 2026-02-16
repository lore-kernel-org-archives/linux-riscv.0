Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AA0E83841
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Feb 2026 22:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U83cagYF/ATvS21XCVo2edt4FWlvvhrvNZv8XTAm21c=; b=IVNreJPxe5MUEb
	1rlvUJ0OPcMqysqMNpeaAiC/uZAHBzeJPk3zgQ5tCcMkEJj31vSu5tNcInMeyKwMRBc5egx33i50x
	eGh/I+jB1N10z51JDHAQzVNh9OyJAcXleucRLxSgi6OeLIVLKrjgOyCPse+9pSrCjoYKgpoQrrJlh
	qCzQtCT9+eaem8XSKz9pIeIvlOWv2MO5p5RXn6rzEfSEQGguZiHzmM2CQoJfBwpjEkBGEY7/GNka2
	u4AASXVvK4H3/aXLvC18gZBloi8TLsJd4xyEdGU0GJ0iVFebzWAIxrLtZYMbvai5tPUrRy4aGyh2m
	AguHeHSUZyRl8lyZh9Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs6td-00000007Ke4-1CeY;
	Mon, 16 Feb 2026 22:16:49 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs6tb-00000007Kd8-0lPA
	for linux-riscv@lists.infradead.org;
	Mon, 16 Feb 2026 22:16:48 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-7946a1f2430so29283407b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Feb 2026 14:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1771280206; x=1771885006; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QU90MQWAl93DOAWC+lPTJbwL0gbIXlpAiKhxQBMuK6k=;
        b=XrYaNm35OgM7cXeSOKY4T28zyP+qOL9D5SqiJxymDOLpAypitJK37xCuTxypefozFW
         YdSfvib8WOiyecmRv7MmdbD73ILjb6tKp2Fq0b/gFDYUXQ8yfgxD5Kwl3ifyhh2DpkrG
         EyQckrsWrr/1X3bLuu3dlbd6M6OMDweDHBkGte7+XvPrX6gSyypr/wDkytqj7tCFiKXG
         ZLdz8wHZjsOZd6dPt5BPmDoCgDCAaFj+B4PUUE+IGLBRlAKX1W398o8cgzm6NLshArNl
         m4Sp00Zoy+x0V96fbtKLjFWtsI4JWkN+v5wxqF5R0NkA85KtoxUqHW5QzHl5a5W6Pdw8
         nLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771280206; x=1771885006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QU90MQWAl93DOAWC+lPTJbwL0gbIXlpAiKhxQBMuK6k=;
        b=S6MuEbj235mssMlxg+VLaaWuDz1D6uZaJqKVap2Zy04jAImoUeXUM5DQc+mVGO/Cii
         uUkMypcEMdDruVtS8cXmZDK2+WhYtlQN1Y94a38wZLNg886PyBLSgdOpo/nQlSBIrwX8
         /CrIw5q4PaLQ6Izcs85cSE++g8d/y0woAPi7lKS0BxOLUco4rDYcK7rVB+tQjEXqIlM/
         q2VuTWvzNiCm0blnDlJyVAGkU/BtrSMB11izdNZl6QBf1SX0OvuwcZB8k3i526LEQ6wK
         f8pk8UXLBg5u+oc5ITNV4aNlv9DON+yvFhUqKsuL7so87rVuFbI1kPohGfzFDqN3NFLZ
         W1YA==
X-Gm-Message-State: AOJu0YyDICD5DWUh9Qx5A2Im3vaMpHMJx9/nPfcdl0Xvnslvju9TkmFI
	CiwefJ3FeeyAPhzA97+fLjYFUVNlxfcdqpJbU1ZqZjjESq4OL7WvH6WtJpgY45gNUKYETyTTNKz
	66gra
X-Gm-Gg: AZuq6aJXOttlAFicDQgR+bahTNCv4HvHeyZu3KqlRZYvj2x6jVhlQ4S/8i7XlCYpXM5
	Lu4vHiHaV2hGx38llSu8kN49I41kFOAoRfujOosjm8+SA7rUTGDDjdCrJ/YfhdZmFqDKcswBUMU
	50OpIwnEZfo5OPe8j2AFwqu50fTksMNToVdSyHLSdEa5CXpuAZEtYWvVylXDXp96MiPyUdgTd+m
	WmVCTOEBBfixj+CzjMQsGbXDnxskQS2agcrJTT577UcCsBMRn/fhL9iM2IuP0xQ0HB7eMl03yhA
	dEk0uh/wzE39hSd4KsPiTPpX60fAcZ7s9eYEe+tEEmY06U5NBSaFh4UTRYbmWo6IAURr2C8fifD
	tnT9BgPI6rBY3Bofo1ewfMRUuTd/F8xqhDQKxAz38tfOl8mKbvFTb2Ixs4ELkKlR7RU5BjuN6y1
	LgIax977o6KUvtrDmuGQATn6drlB0XW28o8j8MyIyusBIzg2EokWk2BF2smUjpxlIwnsK5pdXo5
	82/ZFnQ/eI=
X-Received: by 2002:a05:690c:6a0c:b0:796:3d5f:a2be with SMTP id 00721157ae682-797ac66c027mr80356017b3.64.1771280205751;
        Mon, 16 Feb 2026 14:16:45 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c1a8222sm106705757b3.23.2026.02.16.14.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 14:16:45 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 16 Feb 2026 16:16:33 -0600
Subject: [PATCH v6 2/3] reset: tenstorrent: Add reset controller for
 Atlantis
MIME-Version: 1.0
Message-Id: <20260216-atlantis-clocks-v6-2-cb46d6a59c73@oss.tenstorrent.com>
References: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
In-Reply-To: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
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
X-CRM114-CacheID: sfid-20260216_141647_248105_4BB9997C 
X-CRM114-Status: GOOD (  18.30  )
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

Adds Atlantis Reset Controller driver, which shares the same regmap as
prcm ( clock controller).

This version of the reset controller driver covers resets from the RCPU
prcm.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 MAINTAINERS                                |   1 +
 drivers/reset/Kconfig                      |  11 ++
 drivers/reset/Makefile                     |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c | 173 +++++++++++++++++++++++++++++
 4 files changed, 186 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 24cd2bbe1c78..93f4e860e589 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22537,6 +22537,7 @@ T:	git https://github.com/tenstorrent/linux.git
 F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
+F:	drivers/reset/reset-tenstorrent-atlantis.c
 F:	include/dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h
 
 RISC-V THEAD SoC SUPPORT
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
index 000000000000..ab8be52fdd5e
--- /dev/null
+++ b/drivers/reset/reset-tenstorrent-atlantis.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Tenstorrent Atlantis PRCM Reset Driver
+ *
+ * Copyright (c) 2026 Tenstorrent
+ */
+
+#include <dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/reset-controller.h>
+#include <linux/regmap.h>
+
+/* RCPU Reset Register Offsets */
+#define RCPU_BLK_RST_REG 0x001c
+#define LSIO_BLK_RST_REG 0x0020
+#define HSIO_BLK_RST_REG 0x000c
+#define PCIE_SUBS_RST_REG 0x0000
+#define MM_RSTN_REG 0x0014
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
+static inline struct atlantis_reset_controller *
+to_atlantis_reset_controller(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct atlantis_reset_controller, rcdev);
+}
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
+	struct atlantis_reset_controller *controller;
+	struct device *dev = &adev->dev;
+	struct regmap *regmap;
+
+	regmap = dev_get_regmap(dev->parent, NULL);
+	if (!regmap)
+		return -ENODEV;
+
+	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
+	if (!controller)
+		return -ENOMEM;
+	controller->data =
+		(const struct atlantis_reset_controller_data *)id->driver_data;
+	controller->regmap = regmap;
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

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
