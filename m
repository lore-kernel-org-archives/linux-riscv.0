Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AE7C8303C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 06:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=96GpQXl8JhFr3wgSvw3tTsfubNzdBEBb2xFpBA0eytY=; b=eAym0cn+zpWsEs
	BPQdtq1jfWB7XIZkziuj1kP74koIlAzD2RP/dnr+8UepydfMffFyHHKyqAUNCAlrbD5RHC9DGUlgf
	WtHjrInnoWV2zDsIqpamqDvdG3WMEJv/gLv0UoaV45nzOHxEM3Z08XbEt2CkjZ6olNbSTllwpFxR/
	KB02lfl79o/GRBCYftIwbfGkTiygU5YT+hzJGUA2XGv6mSFpU5IWqE7/Vv7eHV6ggbhHmPWuP8lB3
	NkcsFXiI46/cvFs8D3lFjPUEzc5h0zlT3hMSkxYTOQ8sY1ny0WUl47VNjxM2OVtxIFzcNlDC/ggaE
	88Hoc+K/PYgsEMQxQvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ1wc-00000004RtJ-30oz;
	Tue, 08 Jul 2025 06:36:46 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ1qz-00000004RGv-155v;
	Tue, 08 Jul 2025 06:30:58 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-23c8a505177so25667005ad.2;
        Mon, 07 Jul 2025 23:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751956256; x=1752561056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgtcCxhmZdnPAQq2J//8hYagFuErKydvAl0n9hMEJuw=;
        b=dkAJXB+UpCryk6wntLqQet3utv2njsFnp3OwbDorHpUfF9Q5zzTlkabMMwj6lkIcuP
         /wCZ+LhU9Myh+3P+N33kiBG03vCISmWUESPTqws91ej1Rb/fnnz9T0iPbaE/gNjnuHtz
         rllB3W2opu8Lu1bbR5y5k2ZEJwz4Kmw0VAQ5m+Lkr7v08ZIQgZLLACDiAgL0fq5P9k3S
         n5dGYa7Xmd1Jwhv8ouY0nsatkx601UYWNuFzgw0C9HsUboJjI40x9T70sGNIPgjV7Nw1
         hsej2iBx8sxQxmzMMujW7+KSksDlsaA94OIPL3jlxaPntgTOLzvn//U5s7llLPy6Oy3d
         xpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751956256; x=1752561056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgtcCxhmZdnPAQq2J//8hYagFuErKydvAl0n9hMEJuw=;
        b=usXBjENwQDed/MM+OcrUiWCbdfiGY7a4Qb9zTdd8vLq3f7K0WGvZL+MqkL/lYHlN7d
         GLFakJ/SWtnkA4lW2+OWG/dmhlTVrfo76tWbURte/jHHaGIwFHchjfVTmJ6ZpAvIDq2a
         2221eF7NtZHjBFcScsPapt5c8KYy9c16zy+YSGfk7gJD/UUHKAwlyP55OkeG6korfJi5
         ViZLjrnT1cUw/QnV4OCSMOmLPiv8P0cfoLX6FUmIR3v1MlzB+4sspbQhcODaH2cuzQXe
         mUWCPLUefLF+E+a1rYIoGw6HUKnCutgVyqVCAbPHlgl7EN0QJxXqkOdwPBdmv0aBd2C+
         mIvg==
X-Forwarded-Encrypted: i=1; AJvYcCX96SuUsxU2U11lLU3N6hcGsCijAteIVIXwsIvx0wmxfhu0OvdwjA1UA0QK2aTfGuZIIG7MEY6tjsBO9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw29D0YVcx1Tc5z2ndp//Y/KJ3Inr6K4UTahfy3R83iyIHyaWw9
	X17uNpX1eoiq12hA/1xq+h0kTwvnjJxe1xJXXlofyt2cJdwe/fmlIuYE
X-Gm-Gg: ASbGnctIlvutW9xNQYwlFRG/t+X1mF746BsziEjR0KTav8YhxfsDKKWlpwLmAQ2t1JX
	1nGnh4TBXMcVTlXC1xZqdyx7824ICMk26OoVxIcLRd5/UnxlSyUNq1Acw/dzNEmWyLVg2OjSr7Q
	8lVBAVaUqmY26WtUkW06KDvDzN/SGou0bbIysv8DD4rsCIeT3JktoxONe8L2VWaadMTKCpiDcDR
	Vqn0jYzgivNTZSwMLEFVIpBYt1VzJ7dRRxrGlmgM1VSFSgfl4HgTJmVwPWOtbT3hYyHeG1Fi+o0
	3Y0ftryzcANrZ72jpyMXj7AiLYnPmbIBMI1tCGILkNWYsAe54ZpgDCPFl4306g==
X-Google-Smtp-Source: AGHT+IEHaKDnutmLE4TaqX3rV/8SGpSNjJFcfnVNZNoSPdwlmSzOuB4rVAWhWHt428WpS+ewzou8bA==
X-Received: by 2002:a17:903:1a08:b0:236:6fbb:a5f3 with SMTP id d9443c01a7336-23dd0b16a81mr36467735ad.40.1751956256370;
        Mon, 07 Jul 2025 23:30:56 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23c845be91esm100729455ad.250.2025.07.07.23.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:30:56 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH v5 2/2] phy: sophgo: Add USB 2.0 PHY driver for Sophgo CV18XX/SG200X
Date: Tue,  8 Jul 2025 14:30:37 +0800
Message-ID: <20250708063038.497473-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708063038.497473-1-inochiama@gmail.com>
References: <20250708063038.497473-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_233057_298950_489A7BE3 
X-CRM114-Status: GOOD (  22.28  )
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

Add USB 2.0 PHY driver for Sophgo CV18XX/SG200X. Currently
this driver does not support OTG mode as lack of document.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 drivers/phy/Kconfig                  |   1 +
 drivers/phy/Makefile                 |   1 +
 drivers/phy/sophgo/Kconfig           |  19 +++
 drivers/phy/sophgo/Makefile          |   2 +
 drivers/phy/sophgo/phy-cv1800-usb2.c | 170 +++++++++++++++++++++++++++
 5 files changed, 193 insertions(+)
 create mode 100644 drivers/phy/sophgo/Kconfig
 create mode 100644 drivers/phy/sophgo/Makefile
 create mode 100644 drivers/phy/sophgo/phy-cv1800-usb2.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 58c911e1b2d2..678dd0452f0a 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -122,6 +122,7 @@ source "drivers/phy/renesas/Kconfig"
 source "drivers/phy/rockchip/Kconfig"
 source "drivers/phy/samsung/Kconfig"
 source "drivers/phy/socionext/Kconfig"
+source "drivers/phy/sophgo/Kconfig"
 source "drivers/phy/st/Kconfig"
 source "drivers/phy/starfive/Kconfig"
 source "drivers/phy/sunplus/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index c670a8dac468..bfb27fb5a494 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -35,6 +35,7 @@ obj-y					+= allwinner/	\
 					   rockchip/	\
 					   samsung/	\
 					   socionext/	\
+					   sophgo/	\
 					   st/		\
 					   starfive/	\
 					   sunplus/	\
diff --git a/drivers/phy/sophgo/Kconfig b/drivers/phy/sophgo/Kconfig
new file mode 100644
index 000000000000..2c943bbe1f81
--- /dev/null
+++ b/drivers/phy/sophgo/Kconfig
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Phy drivers for Sophgo platforms
+#
+
+if ARCH_SOPHGO || COMPILE_TEST
+
+config PHY_SOPHGO_CV1800_USB2
+	tristate "Sophgo CV18XX/SG200X USB 2.0 PHY support"
+	depends on MFD_SYSCON
+	depends on USB_SUPPORT
+	select GENERIC_PHY
+	help
+	  Enable this to support the USB 2.0 PHY used with
+	  the DWC2 USB controller in Sophgo CV18XX/SG200X
+	  series SoC.
+	  If unsure, say N.
+
+endif # ARCH_SOPHGO || COMPILE_TEST
diff --git a/drivers/phy/sophgo/Makefile b/drivers/phy/sophgo/Makefile
new file mode 100644
index 000000000000..318060661759
--- /dev/null
+++ b/drivers/phy/sophgo/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_PHY_SOPHGO_CV1800_USB2)	+= phy-cv1800-usb2.o
diff --git a/drivers/phy/sophgo/phy-cv1800-usb2.c b/drivers/phy/sophgo/phy-cv1800-usb2.c
new file mode 100644
index 000000000000..64f8e37b4b52
--- /dev/null
+++ b/drivers/phy/sophgo/phy-cv1800-usb2.c
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/bitfield.h>
+#include <linux/debugfs.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/phy/phy.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+
+#define REG_USB_PHY_CTRL		0x048
+
+#define PHY_VBUS_POWER_EN		BIT(0)
+#define PHY_VBUS_POWER			BIT(1)
+#define PHY_ID_OVERWRITE_EN		BIT(6)
+#define PHY_ID_OVERWRITE_MODE		BIT(7)
+#define PHY_ID_OVERWRITE_MODE_HOST	FIELD_PREP(BIT(7), 0)
+#define PHY_ID_OVERWRITE_MODE_DEVICE	FIELD_PREP(BIT(7), 1)
+
+#define PHY_APP_CLK_RATE		125000000
+#define PHY_LPM_CLK_RATE		12000000
+#define PHY_STB_CLK_RATE		333334
+
+struct cv1800_usb_phy {
+	struct phy	*phy;
+	struct regmap	*syscon;
+	spinlock_t	lock;
+	struct clk	*usb_app_clk;
+	struct clk	*usb_lpm_clk;
+	struct clk	*usb_stb_clk;
+	bool		support_otg;
+};
+
+static int cv1800_usb_phy_set_mode(struct phy *_phy,
+				   enum phy_mode mode, int submode)
+{
+	struct cv1800_usb_phy *phy = phy_get_drvdata(_phy);
+	unsigned int regval = 0;
+	int ret;
+
+	dev_info(&phy->phy->dev, "set mode %d", (int)mode);
+
+	switch (mode) {
+	case PHY_MODE_USB_DEVICE:
+		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_DEVICE;
+		regmap_clear_bits(phy->syscon, REG_USB_PHY_CTRL, PHY_VBUS_POWER);
+		break;
+	case PHY_MODE_USB_HOST:
+		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_HOST;
+		regmap_set_bits(phy->syscon, REG_USB_PHY_CTRL, PHY_VBUS_POWER);
+		break;
+	case PHY_MODE_USB_OTG:
+		if (!phy->support_otg)
+			return 0;
+
+		ret = regmap_read(phy->syscon, REG_USB_PHY_CTRL, &regval);
+		if (ret)
+			return ret;
+
+		regval = FIELD_GET(PHY_ID_OVERWRITE_MODE, regval);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(phy->syscon, REG_USB_PHY_CTRL,
+				  PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE,
+				  regval);
+}
+
+static int cv1800_usb_phy_set_clock(struct cv1800_usb_phy *phy)
+{
+	int ret;
+
+	ret = clk_set_rate(phy->usb_app_clk, PHY_APP_CLK_RATE);
+	if (ret)
+		return ret;
+
+	ret = clk_set_rate(phy->usb_lpm_clk, PHY_LPM_CLK_RATE);
+	if (ret)
+		return ret;
+
+	return clk_set_rate(phy->usb_stb_clk, PHY_STB_CLK_RATE);
+}
+
+static const struct phy_ops cv1800_usb_phy_ops = {
+	.set_mode	= cv1800_usb_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static int cv1800_usb_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device *parent = dev->parent;
+	struct cv1800_usb_phy *phy;
+	struct phy_provider *phy_provider;
+	int ret;
+
+	if (!parent)
+		return -ENODEV;
+
+	phy = devm_kmalloc(dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+
+	phy->syscon = syscon_node_to_regmap(parent->of_node);
+	if (IS_ERR_OR_NULL(phy->syscon))
+		return -ENODEV;
+
+	phy->support_otg = false;
+
+	spin_lock_init(&phy->lock);
+
+	phy->usb_app_clk = devm_clk_get_enabled(dev, "app");
+	if (IS_ERR(phy->usb_app_clk))
+		return dev_err_probe(dev, PTR_ERR(phy->usb_app_clk),
+			"Failed to get app clock\n");
+
+	phy->usb_lpm_clk = devm_clk_get_enabled(dev, "lpm");
+	if (IS_ERR(phy->usb_lpm_clk))
+		return dev_err_probe(dev, PTR_ERR(phy->usb_lpm_clk),
+			"Failed to get lpm clock\n");
+
+	phy->usb_stb_clk = devm_clk_get_enabled(dev, "stb");
+	if (IS_ERR(phy->usb_stb_clk))
+		return dev_err_probe(dev, PTR_ERR(phy->usb_stb_clk),
+			"Failed to get stb clock\n");
+
+	phy->phy = devm_phy_create(dev, NULL, &cv1800_usb_phy_ops);
+	if (IS_ERR(phy->phy))
+		return dev_err_probe(dev, PTR_ERR(phy->phy),
+			"Failed to create phy\n");
+
+	ret = cv1800_usb_phy_set_clock(phy);
+	if (ret)
+		return ret;
+
+	phy_set_drvdata(phy->phy, phy);
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id cv1800_usb_phy_ids[] = {
+	{ .compatible = "sophgo,cv1800b-usb2-phy" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, cv1800_usb_phy_ids);
+
+static struct platform_driver cv1800_usb_phy_driver = {
+	.probe = cv1800_usb_phy_probe,
+	.driver = {
+		.name = "cv1800-usb2-phy",
+		.of_match_table = cv1800_usb_phy_ids,
+	 },
+};
+module_platform_driver(cv1800_usb_phy_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@outlook.com>");
+MODULE_DESCRIPTION("CV1800/SG2000 SoC USB 2.0 PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
