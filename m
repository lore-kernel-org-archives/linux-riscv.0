Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729A8C71150
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 21:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T/q+gYVkTo22P+Da4iqGrmnJMucxolfYLhI1Bm6BlL4=; b=nzzP92Wyf63wSx
	96NddNNibg/nPT7+prGuG/xMe4JhBg9BoLXz4guRJQmY/dJV/RjKWfA2P1j9121oFFa6Deajy/YQZ
	x2q4h318vW54ombBfKqy+LyfpaPpQIA9RWe5quBWzbA+mGf7SlZH8VhHxIDsnv5RGd/UMONVw+QjP
	STWc3nLrkfEXrpntD4FyqieUmw4abYdOSN1lGTI9NQ/XevDRH3FL0uOVBdFOgYvhj9qUxAnBYwBpT
	AjMGTBL+PDXesMkICgXVSd+dwSk1ljZ3Z6H7dhCfU8JcS6ydA71sW4CbhTDYSin9REXzx8DkpWOSZ
	o7WW8saERuu+ZPEyafkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBaA-000000003vb-2VGq;
	Fri, 13 Jun 2025 21:05:02 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBXC-000000003Jc-28VA
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 21:01:59 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3d8020ba858so26849495ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jun 2025 14:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749848517; x=1750453317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi6K0d2gbDCkO0xyzWEymKA3zwyl78Rkz9g9qNQNf5w=;
        b=PkEJXn09N2L8S/qPVt1jUjoL22qnhxppWSs/qqelY1h2mUG7L7mEpnlKigAsDc4eaK
         T42HfVJrr8QOIFl8jdGX+O/IWZA38ppcN9HS/8B7D2+XWdquGdvCs9KHOxh0vT1Wtvr8
         KR6czol3kL82rTxXBn//OHVknVw/9fsiOYh+N96acao1Fz/OvQNqe5vHlK1/ubASjsOK
         GPeGRZvOMIS0YZtBvU4ne9kmeb9rxvPTxyovzDmC48m/SPpWBfwbyjvzvqDhCyampiZn
         hBYQZoI1rAR+CqPhLUA3xMiqmTpiIlcvJrTuSsSmmf0Lued8HbJHK8xvtlN6tFOl9AWA
         cLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848517; x=1750453317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gi6K0d2gbDCkO0xyzWEymKA3zwyl78Rkz9g9qNQNf5w=;
        b=XO7GMTOfTiF2trphLIGV2cx7U6PvGiNckERTMTaU5C/3SMhPMHeGb2xgKcCMgp2QzD
         6q6FHqZvWjuvGoat9YTCqdql+Ucp7kfrA4oYMcIQjYwZ+bm5M4SA1DSc02Xf4b+YdUvE
         ra9XryxMSeshD7QVzSRk9hKufje7Brj9rGAxbso4brZtXd4zqsnd6ZLf0nw4Wnh9tSnP
         bsCWl240WTMLYwYURFR6Wwk6Na6dUBgyTdcUmMHPDzs9GJRB8w31XEJJ6GYoG3kUxRvL
         riXxNmGmK5T67UKDJwDqR+hNrcV57U5A7l5aWelxcmMFu8piwQRpF+DFhWri2fhA3x9a
         QdwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/fRFlF/l+fK4VdheYJCshX4OznczM0Ag+IrJuESZ+W2l80eRlaij+NCPknAde5mgJBh8cEFmHyaNTNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPBuQt5ZaRXgmTPhB602EoANOx8ao8Qr6b8Mk8EtxbyHT7cFCp
	Y7DmS0IHVTmO//iBxB7uOLGV+PpptOR+K2j2vUGBpwv8xOGlJXfj46aVV9wVPeMxnGU=
X-Gm-Gg: ASbGncv5IMyOZrG6Zrsjwx/IiCxCBk4e1my2cfDmyp0Kc9bqr0fG99GUKCDU/uGPHH5
	v3/wmzLqfL3fo8zjz/mHgpceon838L11DQwtJdS5AL2fUN0vskj64+euAkZWZ1EQWwI7hqIdnbu
	BjfQxNR+4WryH/igcX4dvzjXTtmtb5hk3j3/ifDe3iujNaRidd2TxeQnfgTUUkYt0B46uQzyRoQ
	f20N5VPa/9zm8HHwTSGj5QsAzzoLyMw4vLKTEHnlz8bpq7fzDQRyyBX8If8QO/1NOzygHFV7ACv
	mdw812UHb26qqi65aJObQ+/L5UCB8VfbXaeSW7rT77bwvA46V0G5EhSI6G3HCiRVQWX1oN34zAx
	WRj37rrYVHLlbJIS51+eqo4jfMMvAUP4=
X-Google-Smtp-Source: AGHT+IHYzBl71DO7p2Gah6d5B9SY/cCvwoxopRRBUcIrRK0VYAC+l9zq9ORsJh/cQvfo3p6WSG2YAQ==
X-Received: by 2002:a05:6e02:318a:b0:3dd:cb92:f148 with SMTP id e9e14a558f8ab-3de07cd16a2mr15293465ab.12.1749848517617;
        Fri, 13 Jun 2025 14:01:57 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b44b3sm4996315ab.10.2025.06.13.14.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 14:01:57 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] mfd: spacemit: add support for SpacemiT PMICs
Date: Fri, 13 Jun 2025 16:01:45 -0500
Message-ID: <20250613210150.1468845-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613210150.1468845-1-elder@riscstar.com>
References: <20250613210150.1468845-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_140158_544672_83D823AC 
X-CRM114-Status: GOOD (  20.34  )
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

Add support for SpacemiT PMICs. Initially only the P1 PMIC is supported
but the driver is structured to allow support for others to be added.

The P1 PMIC is controlled by I2C, and is normally implemented with the
SpacemiT K1 SoC.  This PMIC provides six buck converters and 12 LDO
regulators.  It also implements a switch, watchdog timer, real-time clock,
and more, but initially we will only support its regulators.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/mfd/Kconfig         | 11 +++++
 drivers/mfd/Makefile        |  1 +
 drivers/mfd/spacemit-pmic.c | 91 +++++++++++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 drivers/mfd/spacemit-pmic.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6fb3768e3d71c..c59ae6cc2dd8d 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1182,6 +1182,17 @@ config MFD_QCOM_RPM
 	  Say M here if you want to include support for the Qualcomm RPM as a
 	  module. This will build a module called "qcom_rpm".
 
+config MFD_SPACEMIT_PMIC
+	tristate "SpacemiT PMIC"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on I2C && OF
+	select MFD_CORE
+	select REGMAP_I2C
+	default ARCH_SPACEMIT
+	help
+	  This option enables support for SpacemiT I2C based PMICs.  At
+	  this time only the P1 PMIC (used with the K1 SoC) is supported.
+
 config MFD_SPMI_PMIC
 	tristate "Qualcomm SPMI PMICs"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 79495f9f3457b..59d1ec8db3a3f 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -266,6 +266,7 @@ obj-$(CONFIG_MFD_SUN4I_GPADC)	+= sun4i-gpadc.o
 obj-$(CONFIG_MFD_STM32_LPTIMER)	+= stm32-lptimer.o
 obj-$(CONFIG_MFD_STM32_TIMERS) 	+= stm32-timers.o
 obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
+obj-$(CONFIG_MFD_SPACEMIT_PMIC)	+= spacemit-pmic.o
 obj-$(CONFIG_MFD_SC27XX_PMIC)	+= sprd-sc27xx-spi.o
 obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
 obj-$(CONFIG_MFD_ROHM_BD71828)	+= rohm-bd71828.o
diff --git a/drivers/mfd/spacemit-pmic.c b/drivers/mfd/spacemit-pmic.c
new file mode 100644
index 0000000000000..7c3c3e27236da
--- /dev/null
+++ b/drivers/mfd/spacemit-pmic.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
+ * Derived from code from:
+ *	Copyright (C) 2024 Troy Mitchell <troymitchell988@gmail.com>
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+struct spacemit_pmic_data {
+	const struct regmap_config *regmap_config;
+	const struct mfd_cell *mfd_cells;	/* array */
+	size_t mfd_cell_count;
+};
+
+static const struct regmap_config p1_regmap_config = {
+	.reg_bits	= 8,
+	.val_bits	= 8,
+	.max_register	= 0xaa,
+};
+
+/* The name field defines the *driver* name that should bind to the device */
+static const struct mfd_cell p1_cells[] = {
+	{
+		.name		= "spacemit-p1-regulator",
+	},
+};
+
+static const struct spacemit_pmic_data p1_pmic_data = {
+	.regmap_config	= &p1_regmap_config,
+	.mfd_cells	= p1_cells,
+	.mfd_cell_count	= ARRAY_SIZE(p1_cells),
+};
+
+static int spacemit_pmic_probe(struct i2c_client *client)
+{
+	const struct spacemit_pmic_data *data;
+	struct device *dev = &client->dev;
+	struct regmap *regmap;
+
+	/* We currently have no need for a device-specific structure */
+	data = of_device_get_match_data(dev);
+	regmap = devm_regmap_init_i2c(client, data->regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "regmap initialization failed");
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+				    data->mfd_cells, data->mfd_cell_count,
+				    NULL, 0, NULL);
+}
+
+static const struct of_device_id spacemit_pmic_match[] = {
+	{
+		.compatible	= "spacemit,p1",
+		.data		= &p1_pmic_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, spacemit_pmic_match);
+
+static struct i2c_driver spacemit_pmic_i2c_driver = {
+	.driver = {
+		.name = "spacemit-pmic",
+		.of_match_table = spacemit_pmic_match,
+	},
+	.probe    = spacemit_pmic_probe,
+};
+
+static int __init spacemit_pmic_init(void)
+{
+	return i2c_add_driver(&spacemit_pmic_i2c_driver);
+}
+
+static void __exit spacemit_pmic_exit(void)
+{
+	i2c_del_driver(&spacemit_pmic_i2c_driver);
+}
+
+module_init(spacemit_pmic_init);
+module_exit(spacemit_pmic_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SpacemiT multi-function PMIC driver");
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
