Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93639D6CFA6
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 22:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+X+vBKoKQNP4gyk52EvjGj8bfs3T/rD43z9Za/Y4fw=; b=x/XqzfRiXDCffC
	4ZMpCVAa3yTthCV5C+KwSPFtHupthj8RhuCZGYbcGeqGHeNXKQ/pD58ZiZu/AwjGNnQsZVGWnqTLy
	sQpYRmdO27OSnVrL3nbSWNCRvsX2EPPn45wx+ODjBxOs38nrQ4GsMYu/XRfcOF8Nct9ghxSBk9go/
	xYhmue0nkPzJr95jsyZ0SnkhsB7Fa4JIu9vsdf8yZqFCkgJ26vDYaJt7gJAwCa+33BNkai1g07Edc
	mBQy5PKR0kYgaqD2Cx+/Sa22yslbgHApGq+gGXx471DCmhKsAhXyws/Q5U8bSCwCfD5gLu+RWmPEX
	grQpZy59k1XUZ3boMO5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj3Ii-00000007qoK-1Wel;
	Thu, 22 Jan 2026 22:37:16 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj3Ic-00000007qmb-1iZH
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 22:37:11 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-794265fb73bso14875617b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 14:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769121429; x=1769726229; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFuE/Ue22jMLFn8jDio4s3sGtCW+4e1hKG320llZvAk=;
        b=QQyHNDSCxAvpsjJObYEBViYV+Qw/Cy0P8i4E3+JPEDiqgi0tr6EVwbd0UY5Hrj0Jay
         2IGz2K4DbtaX2jZuAchDFKOCXtbcvd/IMk6Vp2gXsPbkoWweEWAh7sJrQlY3zrfsFM9u
         q+1IJ1cPtwA6+kcWZprb1Zz1rqcyWqrlkTDRfQBhxK+fO0Q7nFwRYm3bqAzwIeC38cDG
         E19hL8WBEAXG8JM0qmOvze5akIRbDEf9gku3nRNu8FXskPOThlwthv5yMd53/IaBMS2L
         oGmA5rrNGe4HjP9YDeLarmAkKf3+U1Skz/v3OhM2AnIeA9NVMG52DEy/fMejMj9JVhkQ
         N5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769121429; x=1769726229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nFuE/Ue22jMLFn8jDio4s3sGtCW+4e1hKG320llZvAk=;
        b=S3ILpZPV6XAO1vwbrBWXwko8Qe680X0PsgswtMuIhU2/jwUZhCZA7hf82TrTmReUkL
         eL7oN8oVcOfP+sisuAEosDasdck31ZHPtPl9cIGA9HGeHhZk+dSXJ0t+w2e1xFoXh1VR
         fZTN/JBat0760tHl0kAmOd8/XUOiBrKxdIC7YcJqZFPPGwBONesYnJBRcinI+9UDO8Nr
         CW+02ewEx/SLSEBO8GAdMkQQ8gx6rnUvEDZzU00JDSf95ThYAu6/NCF/VDKqFagfX8SX
         oUIg5C8ZNfUQKcFK1DSg6O+7SdpRNRecqLisfY6fTbD/iW1wHQFmds4Icr4iliWCwQNV
         qDvg==
X-Gm-Message-State: AOJu0YwKNzAA4ZKciFwRm+/btoQLsoaogUwCuoY+W1VNes58X+jnW0qa
	yzzuey7VyuTg8lX2hbooaTJ6XD4IHAkdYIToVtntaOuTuWlqg23igx+H9arMbCVdHbk=
X-Gm-Gg: AZuq6aLZ2JfntimLKEBE4A5VAIBZ3Uunagl3blBqgRvo+dkStGzTvnlwcuzgcNmoHJK
	r1k5DdOoonm61df9iTSXUpB1MalQYhCcyQbCHAoa5t4Aqa+Q/FE52lkNv41mQ/jV+tn4GMplwtf
	Qa+8c+cXGHNZx6FpBb5a8G3johNgCkZ+4wwlelNeKhq3nLuVav5/+Ow0TeTDzAbLE4N5Hs+KQPA
	iNDlojG2+0nsZuGXoYApZcpgouHRLLTwn9TDzYoHx5NpXUD3z0hOUCfBTNM9WkgghgEMLGTEhgO
	onuBK9EKhz+kwPpSdyS9kHMdkeSMyLx/ak5Rl66YsBRZYehebYgSetuWkw0r/dvS6N6iQfVUlfm
	OBmwaRflUVMxKCn6A3Q8LmkbOr+Et9x8rkdx/eWD57+R1PEL2iWtwQNtH9E14WJMq8hGq1E0By/
	1ghHooRbc6ldHZ2GQYFEDosJU9+ZkkCQs3W+JR51tagXFuuXlcy/t8zx13+P2IgpX2h+UrjJM=
X-Received: by 2002:a05:690c:6f0a:b0:794:2169:10e0 with SMTP id 00721157ae682-79439a1a818mr8718407b3.46.1769121429549;
        Thu, 22 Jan 2026 14:37:09 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7943b01b09csm2766167b3.15.2026.01.22.14.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 14:37:09 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 22 Jan 2026 16:36:38 -0600
Subject: [PATCH v2 2/3] reset: tenstorrent: Add reset controller for
 Atlantis
MIME-Version: 1.0
Message-Id: <20260122-atlantis-clocks-v2-2-c66371639e66@oss.tenstorrent.com>
References: <20260122-atlantis-clocks-v2-0-c66371639e66@oss.tenstorrent.com>
In-Reply-To: <20260122-atlantis-clocks-v2-0-c66371639e66@oss.tenstorrent.com>
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
X-CRM114-CacheID: sfid-20260122_143710_476787_B5C832C4 
X-CRM114-Status: GOOD (  18.56  )
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
reset to share same regmap interface as clock controller.

This version of the reset controller driver covers resets from the RCPU
syscon.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 MAINTAINERS                                |   2 +
 drivers/reset/Kconfig                      |  11 ++
 drivers/reset/Makefile                     |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c | 158 +++++++++++++++++++++++++++++
 include/soc/tenstorrent/atlantis-syscon.h  |  26 +++++
 5 files changed, 198 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 19a98b1fa456..cf7c8e2153dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22537,7 +22537,9 @@ T:	git https://github.com/tenstorrent/linux.git
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
+F:	drivers/reset/reset-tenstorrent-atlantis.c
 F:	include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
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
index 000000000000..2e7f09409f79
--- /dev/null
+++ b/drivers/reset/reset-tenstorrent-atlantis.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Tenstorrent
+ */
+
+#include <dt-bindings/clock/tenstorrent,atlantis-syscon.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/reset-controller.h>
+#include <linux/regmap.h>
+#include <soc/tenstorrent/atlantis-syscon.h>
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
diff --git a/include/soc/tenstorrent/atlantis-syscon.h b/include/soc/tenstorrent/atlantis-syscon.h
new file mode 100644
index 000000000000..2c6387e5c21a
--- /dev/null
+++ b/include/soc/tenstorrent/atlantis-syscon.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 Tenstorrent
+ */
+#ifndef __SOC_ATLANTIS_SYSCON_H__
+#define __SOC_ATLANTIS_SYSCON_H__
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+struct atlantis_ccu_adev {
+	struct auxiliary_device adev;
+	struct regmap *regmap;
+};
+
+#define to_atlantis_ccu_adev(_adev) \
+	container_of((_adev), struct atlantis_ccu_adev, adev)
+
+/* RCPU Reset Register Offsets */
+#define RCPU_BLK_RST_REG	0x001c
+#define LSIO_BLK_RST_REG	0x0020
+#define HSIO_BLK_RST_REG	0x000c
+#define PCIE_SUBS_RST_REG	0x0000
+#define MM_RSTN_REG		0x0014
+
+#endif

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
