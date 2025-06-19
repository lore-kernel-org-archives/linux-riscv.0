Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739CCC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ByCTUf+a3LxIv0cetmdcQU7EDFhbCxKYOKTkXZLe9Ts=; b=UbzkMQWxj4WZGp
	aO31tYsJ0LcVhsKbB10LfCvDk0FZSMBWk7jIuCKEPkN41UTBsJPUDdHWn9PjBKIsbUTwZdgzQ0gCT
	tSAw/d+V3i/1tMWqWmpbU/USZV0Ye+eFmCjaNTY+MijbwdOUXHHABHyNIlzMVFZrwdOX33WMp50GF
	0JaBONLmVzaHgVNuo19DPEV0qWaQkrtkSbQctcJgzwYd0FCVgpagbWxgEiG+ZUKNjgzEQpJRWCBD2
	aQ/WCVrwqaGLShskt7EexvB85KEU+rseK877khHHb74LdEkW8hMdqgV3OzqXU4Ajipi7R45VCdq4U
	Rg9jdLvLsJfQjFgU9p7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIej-0000000Det2-3JP2;
	Thu, 19 Jun 2025 17:02:29 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFgM-0000000DDy9-3N15
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 13:51:59 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3ddcbe64d0dso8801875ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jun 2025 06:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750341118; x=1750945918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifXk3bjhC2kOQzrxq9QjT/OUSbhaYYTAO2eulOUbpkA=;
        b=n29PgtxkN3+uZqwq4AxJl0TgMaHc0cu8PvCdm/SeNQ9TCIQh35xDLoNKBOaJDQZz7y
         X6nsJyxowmoYxj9/d8J1I5xMWFZZ6Qg2CTWSpG6sNvxFpvcgGweWlTGdf6ZWaUeXm/HZ
         qSQS0ze4bsRTFtwYcCZCnVMK3x2MsJubjVndS6dLMqBf1VIttX77YQmJEXn+En2AD1eP
         MlpDyHmHLVp9sxFE4VW992bx/GEiArABwsrokBJMvxQLNEnmw35OKA9JRdOxKz2nOfjt
         Y1bz2rqOnhGgh0ItMkodgeUngz7xTrxS98vQ4GaDwx2u8rQ91txYtazP9eBVAdOslmB9
         lKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341118; x=1750945918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifXk3bjhC2kOQzrxq9QjT/OUSbhaYYTAO2eulOUbpkA=;
        b=cC/Dx89WNDf+L1A9z/R2rcVTecgqxl8vuBA35ja1byM1QSgaiGUX+XK7vX8tsTJqs4
         ev+VBzbLKo5X6Ox1a08Ap1Cuh5UUtou3rvXN+1sW+gTS/8YHFpB66JBuNtDmhi/EssD+
         cPqsI/ordBKV75QplPp//umUXOcLJKSJRgji+wcXw1Yfp+xSSofTp//tT0PFIQJqpHp8
         TRKrDX3qeh7jN0op62xCOUoTA3D5IdkysauPkq5RcRAk9jcUEMMOfPPdp1dY+7goPlLM
         lZ/Gj1w//Z63BBjsFaDuqG1Aw/pUia/We+E7PlYGGgLJPqPBSd/JmVZ2sl3tdqP/SRMy
         owow==
X-Forwarded-Encrypted: i=1; AJvYcCVjHRF/Ynwkuv+ubJy61AX06NNTzoRkUOk9UTifmc0bJKA0sbrA8E8WeYf8FeU7nygvEBOZqi5idxhUiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1BaiEz/il9gUev+AtgBcASCd6XIyrUE2u9Aj9gf69bKv2xFM1
	ViMMGhdWPGbftqXB2G7p0jjIdm2cq0We0Db2lno9kbxnhKt/pgpJwMg1ka4c1qmZ7tI=
X-Gm-Gg: ASbGncvsH6fOicUtOrOi1GKTIcB8FhiWJQKprpu05U5p2Rchl51FDv+oSXuwdBo9SIl
	PkXiDeho5TpE78tbS4Z9++Qz2p0gyPK5d2VUeDo6bjco+o995kCwSKWf2nTSRtFIw2B9am6NhaK
	jJSvN8VVqbiFsr2LxURYrR7RmgV6l1Pjn06/fHKhQWcW69CSMKp8QD223eh6cNa7p9ujP9fKQ42
	mYy6kOVhQbWE+dbJAa7r8KnT+CStAOY8w1XxQV8NhFa0tsDNyTqbWBABjU0d3WRuyAMWpEQ5efX
	aL150JA2DuQ3sJUliFhwwMu0NtMF13qkwYb/Zm3ZH8MS4nt4AxU2kYYS1XRjeX+f9mKRlL97MGX
	ZnGaJtyCSMLsEo1QX9BOE0f02wV09+K4=
X-Google-Smtp-Source: AGHT+IH/c+HzHs3PuLiMQTaAREtVC8AGBWvZSZ9JD/Fhz39viBM1praD95gqU5zluLFC0bfpkpLkOA==
X-Received: by 2002:a05:6e02:1a8c:b0:3dc:8bb8:28bf with SMTP id e9e14a558f8ab-3de07c53a5fmr259487895ab.5.1750341117745;
        Thu, 19 Jun 2025 06:51:57 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a453b4sm38246015ab.47.2025.06.19.06.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:51:57 -0700 (PDT)
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
Subject: [PATCH v2 2/6] mfd: spacemit: add support for SpacemiT PMICs
Date: Thu, 19 Jun 2025 08:51:46 -0500
Message-ID: <20250619135151.3206258-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619135151.3206258-1-elder@riscstar.com>
References: <20250619135151.3206258-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_065158_852371_E46E2E22 
X-CRM114-Status: GOOD (  21.03  )
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
v2: - Use module_i2c_driver()
    - Expanded Kconfig module help text
    - Add MODULE_ALIAS(), and define and use DRV_NAME

 drivers/mfd/Kconfig         | 13 ++++++
 drivers/mfd/Makefile        |  1 +
 drivers/mfd/spacemit-pmic.c | 83 +++++++++++++++++++++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 drivers/mfd/spacemit-pmic.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6fb3768e3d71c..94c6361dae2f6 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1182,6 +1182,19 @@ config MFD_QCOM_RPM
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
+	  To compile this driver as a module, choose M here.  The module
+	  will be called "spacemit-pmic".
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
index 0000000000000..f6cae41baa77a
--- /dev/null
+++ b/drivers/mfd/spacemit-pmic.c
@@ -0,0 +1,83 @@
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
+#define MOD_NAME	"spacemit-pmic"
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
+	.driver	= {
+		.name		= MOD_NAME,
+		.of_match_table	= spacemit_pmic_match,
+	},
+	.probe	= spacemit_pmic_probe,
+};
+
+module_i2c_driver(spacemit_pmic_i2c_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SpacemiT multi-function PMIC driver");
+MODULE_ALIAS("platform:" MOD_NAME);
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
