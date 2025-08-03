Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AA7C87FD3
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Aug 2025 02:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TeoiRS/3TrBUZe/rEMgYgz4s/XTm7Rg+FZR9w0CRnsc=; b=qwDU5BuGAht6zZ
	kgksAiP9UYBMhGf1Uh0I8xBgf1egm5ulTOAq/Rj7hYmqWR6/P3eNm1dMvLEO58ZmUB8JctIebHves
	iyMSuNc0vw1OsAt39z7UHq265wUgYSAdgAvYdhgP2gh7PxoLzPS9hT8fuvL26oO3jDEH2ZX6coA0d
	dmqzGWz9EgV91oANi2ednc3DBJXyGzqSxWAfT+3oGJkwPjpyJ0dMkT2lnS9q+qhQmtdYMjUkc5RvZ
	LrD75yU59xJ10GLoNeQJU9aFhQJQfg+XhhCrBkGp4bQL+liKciGMggcBkAZDTz/NUd/nc2An/Ag9y
	b9ReXLJTUJhcRmVqK/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiOvY-000000085Ss-4Adp;
	Sun, 03 Aug 2025 02:58:24 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiOvW-000000085SB-3EQ2
	for linux-riscv@lists.infradead.org;
	Sun, 03 Aug 2025 02:58:23 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-87c0166df31so123277139f.3
        for <linux-riscv@lists.infradead.org>; Sat, 02 Aug 2025 19:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754189902; x=1754794702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTjkzoV10rjE6lcy9S8u9FeqDjqd4PCbzY0LRqD3f3g=;
        b=LCSosia1EkqX+JFdzYNALYGuPvWer04PqM7+bDbLi8RZPht6Ws6YxUeQz3WUxXq+HY
         6tKm9saxMnkR2OfyvYbNRBZPiTeRJ8pH3y4f9xxk4tHPXQm8bkN9HayCU3JL5tSYCow2
         ue+fy19MC3MTuFOE1knQlw5dvKWl1XtYC7l+B69qDbiZzGobxKAxJBNUHdiSnq3EaxW7
         PP7t/X/H/AoBNoNLXDnh78atcyts7KMU3c1oXeccF7c4wdGMB0uqfBORQSkco6sVCQC4
         AE22dXYUXw1QB2h7yZZJNr7wLJGulGztZHYb+B9yqBW99H1tWImnVc5mgS3PP68PT/4g
         ndcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754189902; x=1754794702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTjkzoV10rjE6lcy9S8u9FeqDjqd4PCbzY0LRqD3f3g=;
        b=YO1yFnrZz9F9+6sxqe6ai4KRYQpGMsFv9Cir05zw1y0eOs7okoy/tyTWz+IrMduehj
         LMFlkgqlHHRWS/1QAy5Y/AxFSFbvvxwwL7uRH671+Jp9Y4X2h8Ge5GW8lcOvLtUQwlbn
         AS8j6e8xU5SsPkk98205rXCunLCVphGsAwnoihPifp0LlckKXqGwTIaAo9DLVEFYaEv+
         4xzHL/ABIqnY2wYXoByrj0HXvf5yfAurTvJ54va1gL4uoKBaMq+inZeDv1JRUx6hfLWS
         ELgCAx4wEht8RZU66D9H8tLmiX5Bl2h3D21YF94IAU0mS2NYIqbSCPPTf2GvA/cB39BA
         QzSA==
X-Forwarded-Encrypted: i=1; AJvYcCWvybtZmJ4F0GPiCwaPbbFkD3P5WzSaYCMKX/UyKdmoyOmY9Nctqrz+dz1Jl1RS1H5C5Qi/eJRcPS69dA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiPvetiD/J5+/RtxSVpW5b8ZM5wYnbCU69dr4tTvHATH8dQaYl
	2drVjQw0oxtBkQp7hfsgCU0dmx8uCE5Y6p90lUnoBf8CfSwetF+0Q/N8YrYYaviIHHE=
X-Gm-Gg: ASbGncsg/F9L0h3Cz2zqllZFB54gPnPADu+mNWGk/+d4ncGa7FNwXM28WiZV0XUT2oE
	J0GqqeaaYsRsufHPGmsIrGByhLSpE3X+pTd7y0mGmG77IRwSc8NTeFrGIkoVJqdomtyZ77GxmDL
	7LjLaEFm7QQN0ldpFsIVCt4WKJMTqlGvUQ+NcaAdBO4mHIyzQSwWiWhrYpbyA5k/ErYhG0w00b+
	vY9Am2Uwr1kHU6o9scjHQs3JBAoPLwZ8Z4x4+N/DUQ56bfe4cNYoTHM/bH7To/mfOkZsfSuRBAW
	gJP6QRJYfcI+/GrY4rPvmGyj/WH56l4Nuil5Me5rkNUFnuOQfKIUdNfsd3mGituOLoSR235IlpY
	0xdNld2vZLsBFijTr5+qvkm9DOIYbJ3Mpyq9d4xHa5T7C52zTbqB9A+PNMf2YlWUeDw==
X-Google-Smtp-Source: AGHT+IGpE0X8lOCZpACwsCjw3h1bri88EfxOnWYpLR9x8+tuWwey+IA1oiI5AmqNBuai+0sTDjVo3Q==
X-Received: by 2002:a05:6602:a01a:b0:881:7837:6058 with SMTP id ca18e2360f4ac-881783762abmr198744539f.0.1754189901896;
        Sat, 02 Aug 2025 19:58:21 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55b1ac2esm2251906173.1.2025.08.02.19.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 19:58:21 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 3/7] regulator: spacemit: support SpacemiT P1 regulators
Date: Sat,  2 Aug 2025 21:58:07 -0500
Message-ID: <20250803025812.373029-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250803025812.373029-1-elder@riscstar.com>
References: <20250803025812.373029-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_195822_833854_7C4D94D6 
X-CRM114-Status: GOOD (  22.16  )
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

Add support for the regulators found in the SpacemiT P1 PMIC.  This
PMIC provides 6 buck converters and 12 LDO regulators.

The PMIC is implemented as a multi-function device.  These regulators
are probed based on this driver being named in a MFD cell in the simple
MFD I2C driver.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
v11:  Make REGULATOR_SPACEMIT_P1 depend on I2C

 drivers/regulator/Kconfig       |  13 +++
 drivers/regulator/Makefile      |   1 +
 drivers/regulator/spacemit-p1.c | 157 ++++++++++++++++++++++++++++++++
 3 files changed, 171 insertions(+)
 create mode 100644 drivers/regulator/spacemit-p1.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index eaa6df1c9f806..3af99bc3a9ece 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1395,6 +1395,19 @@ config REGULATOR_SLG51000
 	  The SLG51000 is seven compact and customizable low dropout
 	  regulators.
 
+config REGULATOR_SPACEMIT_P1
+	tristate "SpacemiT P1 regulators"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on I2C
+	select MFD_SPACEMIT_P1
+	default ARCH_SPACEMIT
+	help
+	  Enable support for regulators implemented by the SpacemiT P1
+	  power controller.  The P1 implements 6 high-efficiency buck
+	  converters and 12 programmable LDO regulators.  To compile this
+	  driver as a module, choose M here.  The module will be called
+	  "spacemit-pmic".
+
 config REGULATOR_STM32_BOOSTER
 	tristate "STMicroelectronics STM32 BOOSTER"
 	depends on ARCH_STM32 || COMPILE_TEST
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index be98b29d6675d..278f5b8d1c7d7 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -162,6 +162,7 @@ obj-$(CONFIG_REGULATOR_S5M8767) += s5m8767.o
 obj-$(CONFIG_REGULATOR_SC2731) += sc2731-regulator.o
 obj-$(CONFIG_REGULATOR_SKY81452) += sky81452-regulator.o
 obj-$(CONFIG_REGULATOR_SLG51000) += slg51000-regulator.o
+obj-$(CONFIG_REGULATOR_SPACEMIT_P1) += spacemit-p1.o
 obj-$(CONFIG_REGULATOR_STM32_BOOSTER) += stm32-booster.o
 obj-$(CONFIG_REGULATOR_STM32_VREFBUF) += stm32-vrefbuf.o
 obj-$(CONFIG_REGULATOR_STM32_PWR) += stm32-pwr.o
diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
new file mode 100644
index 0000000000000..d437e6738ea1e
--- /dev/null
+++ b/drivers/regulator/spacemit-p1.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for regulators found in the SpacemiT P1 PMIC
+ *
+ * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
+ * Derived from code from SpacemiT.
+ *	Copyright (c) 2023, SPACEMIT Co., Ltd
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/linear_range.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+
+#define MOD_NAME	"spacemit-p1-regulator"
+
+enum p1_regulator_id {
+	P1_BUCK1,
+	P1_BUCK2,
+	P1_BUCK3,
+	P1_BUCK4,
+	P1_BUCK5,
+	P1_BUCK6,
+
+	P1_ALDO1,
+	P1_ALDO2,
+	P1_ALDO3,
+	P1_ALDO4,
+
+	P1_DLDO1,
+	P1_DLDO2,
+	P1_DLDO3,
+	P1_DLDO4,
+	P1_DLDO5,
+	P1_DLDO6,
+	P1_DLDO7,
+};
+
+static const struct regulator_ops p1_regulator_ops = {
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+	.set_voltage_time_sel   = regulator_set_voltage_time_sel,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+};
+
+/* Selector value 255 can be used to disable the buck converter on sleep */
+static const struct linear_range p1_buck_ranges[] = {
+	REGULATOR_LINEAR_RANGE(500000, 0, 170, 5000),
+	REGULATOR_LINEAR_RANGE(1375000, 171, 254, 25000),
+};
+
+/* Selector value 0 can be used for suspend */
+static const struct linear_range p1_ldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(500000, 11, 127, 25000),
+};
+
+/* These define the voltage selector field for buck and LDO regulators */
+#define BUCK_MASK		GENMASK(7, 0)
+#define LDO_MASK		GENMASK(6, 0)
+
+#define P1_ID(_TYPE, _n)	P1_ ## _TYPE ## _n
+#define P1_ENABLE_REG(_off, _n)	((_off) + 3 * ((_n) - 1))
+
+#define P1_REG_DESC(_TYPE, _type, _n, _s, _off, _mask, _nv, _ranges)	\
+	{								\
+		.name			= #_type #_n,			\
+		.supply_name		= _s,				\
+		.of_match		= of_match_ptr(#_type #_n),	\
+		.regulators_node	= of_match_ptr("regulators"),	\
+		.id			= P1_ID(_TYPE, _n),		\
+		.n_voltages		= _nv,				\
+		.ops			= &p1_regulator_ops,		\
+		.owner			= THIS_MODULE,			\
+		.linear_ranges		= _ranges,			\
+		.n_linear_ranges	= ARRAY_SIZE(_ranges),		\
+		.vsel_reg		= P1_ENABLE_REG(_off, _n) + 1,	\
+		.vsel_mask		= _mask,			\
+		.enable_reg		= P1_ENABLE_REG(_off, _n),	\
+		.enable_mask		= BIT(0),			\
+	}
+
+#define P1_BUCK_DESC(_n) \
+	P1_REG_DESC(BUCK, buck, _n, "vcc", 0x47, BUCK_MASK, 254, p1_buck_ranges)
+
+#define P1_ALDO_DESC(_n) \
+	P1_REG_DESC(ALDO, aldo, _n, "vcc", 0x5b, LDO_MASK, 117, p1_ldo_ranges)
+
+#define P1_DLDO_DESC(_n) \
+	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 117, p1_ldo_ranges)
+
+static const struct regulator_desc p1_regulator_desc[] = {
+	P1_BUCK_DESC(1),
+	P1_BUCK_DESC(2),
+	P1_BUCK_DESC(3),
+	P1_BUCK_DESC(4),
+	P1_BUCK_DESC(5),
+	P1_BUCK_DESC(6),
+
+	P1_ALDO_DESC(1),
+	P1_ALDO_DESC(2),
+	P1_ALDO_DESC(3),
+	P1_ALDO_DESC(4),
+
+	P1_DLDO_DESC(1),
+	P1_DLDO_DESC(2),
+	P1_DLDO_DESC(3),
+	P1_DLDO_DESC(4),
+	P1_DLDO_DESC(5),
+	P1_DLDO_DESC(6),
+	P1_DLDO_DESC(7),
+};
+
+static int p1_regulator_probe(struct platform_device *pdev)
+{
+	struct regulator_config config = { };
+	struct device *dev = &pdev->dev;
+	u32 i;
+
+	/*
+	 * The parent device (PMIC) owns the regmap.  Since we don't
+	 * provide one in the config structure, that one will be used.
+	 */
+	config.dev = dev->parent;
+
+	for (i = 0; i < ARRAY_SIZE(p1_regulator_desc); i++) {
+		const struct regulator_desc *desc = &p1_regulator_desc[i];
+		struct regulator_dev *rdev;
+
+		rdev = devm_regulator_register(dev, desc, &config);
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "error registering regulator %s\n",
+					     desc->name);
+	}
+
+	return 0;
+}
+
+static struct platform_driver p1_regulator_driver = {
+	.probe = p1_regulator_probe,
+	.driver = {
+		.name = MOD_NAME,
+	},
+};
+
+module_platform_driver(p1_regulator_driver);
+
+MODULE_DESCRIPTION("SpacemiT P1 regulator driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" MOD_NAME);
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
