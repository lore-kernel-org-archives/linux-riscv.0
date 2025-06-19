Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74518C7EE2C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uk4pKiqhG6wP6bWRWgkcRjU97c6Hcf6uoqFnwRtpTjA=; b=bLb3uY6mVPieG7
	nbkg8TJei6S+qwaNBDJaytyRoSxoIpQ7clwF1IwB2QHGmhPulv+Ti/y3EC5X4QEgBtb72XlJgHlZN
	eBnG728fp2U8r839TwcJWttSU88rYPASgnlKZuyBW+1JJ8LISJY2YiK9jMzU1+fA7o1nZXCSfXKSa
	S3//SW9EHH0W18eudcBE1si9m2vQkK+IUHROvYioRb7HE0Su/ZKcJiv0agWO9FRkjqyO3SngnphyJ
	Np07Bln5NVXW59fQxBEAj6UbIcDKIih2knyJ3zH0GsFAlbGPOX6a0S0JyD5l2zncLdmt6XWEPJKg7
	C5FWDdWaV7ChZO/6ESOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIek-0000000Detu-298n;
	Thu, 19 Jun 2025 17:02:30 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFgO-0000000DDyU-1jDn
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 13:52:01 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-875f57e0cb9so73992439f.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jun 2025 06:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750341119; x=1750945919; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpqmHlB7kUfZax7xIOqdQVroVOVmtL6b9W451Ta9WWc=;
        b=IT7EL0IKLOmK2TcsVlhZRzfl+nukHE4sGRhsCBDCJKnhnJewHTXYaI1ctaXwo7LtKL
         ZMrp+iaWdoowai3Rr4BWCNb/2sRgK8i5XFi1Cu7lYQsjBU+vmuYAFvIFE2GIn6I45Z9Q
         ocu/iJg05VNh2EOuP+HbawPeFlpiNz3EPz21FiPVjHnsIrjSgfCepvkiFNnYAkhU/hzc
         q3OZOz+IjLjM3d2kVEuEQ0pR1AVbHlaMG38uO52BdhSZ1qqDTPDHP7hah589RMueeqj9
         k6U6PXzxYpPqZsnUDFgsdhXRKuqWrsmUdGfGAoF+67N/JA5MnJcHi8N0Q1eFBiEsaQo/
         HmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341119; x=1750945919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpqmHlB7kUfZax7xIOqdQVroVOVmtL6b9W451Ta9WWc=;
        b=tE9dVXERtKT9DAKu2T2K/fsZGhhCP1qGowpkM2or+5Yq7HOrNoiolG0i8vLtfkkU76
         tG9sb6JcpYXZ3J6EP6T66hV65RCTJSlBdjs4Uiw/dmydPDia3ilC50YK0J2uRV3zz1Hd
         1GIxn4Dk+AbGQ2UR8zE3TO8wP194ZKxtT4Tq3OTV4Jc7/LJMbQufSHPSY9YNllaVjXF5
         v8zwKHLOWfYBOlfYcJpfWcp+11/NEqjtMa4Y4l3Gbo5wt4uWchDkbUcVap2OXfrq27Ea
         1E62ZKiewh377jmTeN8hxykEn8b4sSEBVaWfv8b57lazwMX0UwjgRA7OVuoJ5yExSR6M
         dhWg==
X-Forwarded-Encrypted: i=1; AJvYcCWOe/Ro6h3PHI1p0S7zT/7vN53x+hQ0O5izt4e4S2034rW2DOK6h9TbROqySOT69TE/b7+SoAhjlO1FtA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdr6heLRpbE2M2b07AarTfroLI9iaXU/6cH/YGSpACMwMzflWv
	BUkgbzP/9LG3GwGq/DPHeNYhyGRHxbHlWQWu7GnLa0HawZcLdbSdQ5639Xzkxb1bH4w=
X-Gm-Gg: ASbGncuuGfvFHtrjT8ftfzZTt5ifxsUkD5ztMou0mAj0dI1zePzg4bBOgCSpIkaiH+f
	DXlfP6n4baJJBWboIT6VtfJiGOmTNguakYTq5SYMnChPTR5ahyx3M9YEKXE0JaR+Glb2YWIrfLs
	uFS8hBLrRrPPNHprkWvvPwM1by3oNb41YSYS3mPNYOEIUliiSsB2+FrhmCOczvibg9WZJbBH0wd
	4We4+9MgMby4Qlm6pHIPqzBmQMaIYHMRYbQxETR5JpF/SsFlaJnKztaJ0waQdHKpKNrT72iWQJr
	XXyEwIo9SdIbtz4PE8Xpy/I2aY/YK86c9JJqHgEULwaUHJY5y2NrWU+cxKjHo7BKbMeqYU+2Tn2
	+qPH5eESkyt18X1V2iYnvxImRuhyQ4dk=
X-Google-Smtp-Source: AGHT+IEKAN1uUQp+lG9Cqo4Kum5y7O8nXA5FH3izpDzjNH9aliRXxwD7/DXQAndjFP1ELdYThgP6oQ==
X-Received: by 2002:a05:6e02:330e:b0:3dd:cdf2:fea4 with SMTP id e9e14a558f8ab-3de07cc010amr242759375ab.14.1750341119379;
        Thu, 19 Jun 2025 06:51:59 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a453b4sm38246015ab.47.2025.06.19.06.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:51:58 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: wangruikang@iscas.ac.cn,
	dlan@gentoo.org,
	troymitchell988@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] regulator: spacemit: support SpacemiT P1 regulators
Date: Thu, 19 Jun 2025 08:51:47 -0500
Message-ID: <20250619135151.3206258-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619135151.3206258-1-elder@riscstar.com>
References: <20250619135151.3206258-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_065200_454203_0A8D8225 
X-CRM114-Status: GOOD (  22.26  )
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
PMIC provides six buck converters and 12 LDO regulators.

The PMIC is implemented as a multi-function device.  These regulators
are probed based on this driver being named in a MFD cell in the P1
PMIC driver.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
v2: - Added Mark's Reviewed-by tag
    - Expanded Kconfig module help text
    - Add MODULE_ALIAS(), and define and use DRV_NAME

 drivers/regulator/Kconfig       |  11 +++
 drivers/regulator/Makefile      |   1 +
 drivers/regulator/spacemit-p1.c | 157 ++++++++++++++++++++++++++++++++
 3 files changed, 169 insertions(+)
 create mode 100644 drivers/regulator/spacemit-p1.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 7423954153b07..ee283339f4e1e 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1395,6 +1395,17 @@ config REGULATOR_SLG51000
 	  The SLG51000 is seven compact and customizable low dropout
 	  regulators.
 
+config REGULATOR_SPACEMIT_P1
+	tristate "SpacemiT P1 regulators"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
