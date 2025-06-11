Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F8DC71136
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+iXqOcdenTb1sWv2e9Vam6yn0j7T71S5j9Jd9k9kmo=; b=RHwbm0ku89QYaN
	i51uffUCLVDtKi9pZRK6LLwxjbPgXqDrVh1hAO6n3fcSDnK4z4qIk9390FU4Ub7MClXptgWpJNbO/
	1CmB3w1xDBXZPdWdD+GpWr/iYYM34Al9rflgQs+fixniaYnimIV1IzJppaIgNNSrV4SQEFnJbG9aT
	ivpeaZLM0o1eiBQxDWL/HOphG53uGOCriNXRWRGsLTKQYs2WdPyfv8RjeMvK49GXxadRu9GXpI68Q
	HLvxn7xcGPbgdFXoN2MLCsEV2fCNPvWS0jHGr7WZ+dIg8Wv6n3APZbv68H6eEwfqzE0PTdzsbpkYC
	2Gh4qgKpqIFe1rwMULeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGwE-00000009Hn4-2PNi;
	Wed, 11 Jun 2025 08:36:02 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGgT-00000009FEK-1bPD;
	Wed, 11 Jun 2025 08:19:46 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-4067106dd56so4192210b6e.3;
        Wed, 11 Jun 2025 01:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629984; x=1750234784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZN6IMaS1grsEGw7muFXYaAlvNxM7Dm22+G096tEuWY=;
        b=c4CTRc90ViY6McJAf/g3SkYc1z2iOswN39AE5aJqupoo4AAbbKVxQydo2+4+O2hFPl
         Z9eBWI2f+iiaBca0t3hlkSoWO3+Fio+fk17lQfo0wUiqjp/3N0CRUg2JyzloGV3ze2gG
         nt7LG0vtPtGCxRM+9XE9pRU2U0KJtT7LgmKNu6CvNkke5H6ZS0Poyc03gpi/jKIe35xR
         2kxE1DjFduhvBudKErnkVP0BQ8CnRxOsyVtFs6vhHz+u6+BCvzBt8jqU8pAj9cvfQ7uP
         gUqHRpdNbS7Appjadk1br4pnPu5wQZlT0suygOd/Nx9maf2GXEjUofMp5prLmhlktsUp
         WLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629984; x=1750234784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZN6IMaS1grsEGw7muFXYaAlvNxM7Dm22+G096tEuWY=;
        b=Y5lO6DNQVQ95QZGtYcSq5ArwttZLhvA0ScfghVGQF4Z8beRbggZ3SP0NTy+d4baNHW
         lGu699987X99R0GefLno6O5I8KPiZyN0Z1CQYvyL8AONA07lw95MFgLHHiDoQ7sqsVDN
         cj96IacvfOqg4ZOmeVEijqPQbaJuhMLNeefGd2TJMKRZbCcvgKwF1h+9KYzxLE/2beuz
         j1HHeAZfIkK1e8ZB9191VPi0CGS114BtPEY23ZBiuHFVTTfJU3sVUkEzyq1rev+3nVPT
         681hSQbi6FQlauUKH1QNYy2YcStANhWIf1yVx33qbV7+vO8AY4/vy4tXy+l3O1utQgki
         VdBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7aDJrr14H7ZLsPsGb3b34X9N4aBQU6FXe0nt94JT5gtXYLZW8/GbGrD3lQA47oVV1bHVR5cw3Yt64rA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzG3ekJb7ISh7CiJRCflz+OBpP4yCahTaR3UfdRfGsSxlQAKIns
	pmoCK1XU9B9jFAtsV4D2B9R+pCwh/GR/PmcK3RvM8dxZjxUTqKg3kdqsnpLZztG+
X-Gm-Gg: ASbGncuP9h2NlsgCpimz3pB576ftkfHnCHkc2Vv7QgQf6yyV7yEuUC4WNBGn2rUy6ip
	8Fhpz/6cHHSbFy0HO4M/jfbs4KesbRgX/lnj++nvO+g8k6HgXtul0CENLLRHvK0UeIQKEaWSaRL
	4jsyj2Af9/Wgkl7Ts1B3vYBHX5Zvrruer+0ypcfQEsHh6BLu21TJ5MbGuLk3EmiUAlMtkqpqpM0
	voS4D8sCFzkYwcPG7T+kEOHqTimAvOD8xnEeJ+gcYXblwDM0ov+I2CuA9EwoVkWYJ45DF/PvwSR
	jGdmcKLoKBosS6tyu9iUlgQhi/hxy+BfRcxHnQ==
X-Google-Smtp-Source: AGHT+IGaw2QolG2EOFbc9/YuiQ+KRkR/yOIdu75VBT0o1UfV4DERkOF20ZE/NN/PCZ7PlCumHRZTeQ==
X-Received: by 2002:a05:620a:1a26:b0:7c7:bb3f:fd40 with SMTP id af79cd13be357-7d3a9547490mr313297885a.5.1749629971966;
        Wed, 11 Jun 2025 01:19:31 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a536b91sm825762485a.32.2025.06.11.01.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:19:31 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 2/2] phy: sophgo: Add USB 2.0 PHY driver for Sophgo CV18XX/SG200X
Date: Wed, 11 Jun 2025 16:18:03 +0800
Message-ID: <20250611081804.1196397-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611081804.1196397-1-inochiama@gmail.com>
References: <20250611081804.1196397-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_011945_423943_B4E2E7F8 
X-CRM114-Status: GOOD (  22.59  )
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
---
 drivers/phy/Kconfig                  |   1 +
 drivers/phy/Makefile                 |   1 +
 drivers/phy/sophgo/Kconfig           |  19 +++
 drivers/phy/sophgo/Makefile          |   2 +
 drivers/phy/sophgo/phy-cv1800-usb2.c | 222 +++++++++++++++++++++++++++
 5 files changed, 245 insertions(+)
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
index 000000000000..1d21db7f875b
--- /dev/null
+++ b/drivers/phy/sophgo/phy-cv1800-usb2.c
@@ -0,0 +1,222 @@
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
+	switch (mode) {
+	case PHY_MODE_USB_DEVICE:
+		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_DEVICE;
+		break;
+	case PHY_MODE_USB_HOST:
+		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_HOST;
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
+static ssize_t dr_mode_write(struct file *file, const char __user *_buf,
+			     size_t count, loff_t *ppos)
+{
+	struct seq_file *seq = file->private_data;
+	struct cv1800_usb_phy *phy = seq->private;
+	enum phy_mode mode;
+	char buf[16];
+
+	if (copy_from_user(&buf, _buf, min_t(size_t, sizeof(buf) - 1, count)))
+		return -EFAULT;
+
+	if (sysfs_streq(buf, "host"))
+		mode = PHY_MODE_USB_DEVICE;
+	else if (sysfs_streq(buf, "peripheral"))
+		mode = PHY_MODE_USB_DEVICE;
+	else if (sysfs_streq(buf, "otg"))
+		mode = PHY_MODE_USB_OTG;
+	else
+		return -EINVAL;
+
+	return cv1800_usb_phy_set_mode(phy->phy, mode, 0);
+}
+
+static int dr_mode_show(struct seq_file *seq, void *v)
+{
+	struct cv1800_usb_phy *phy = seq->private;
+	unsigned long flags;
+	unsigned int regval;
+	bool is_host = true;
+	int ret;
+
+	spin_lock_irqsave(&phy->lock, flags);
+	ret = regmap_read(phy->syscon, REG_USB_PHY_CTRL, &regval);
+	spin_unlock_irqrestore(&phy->lock, flags);
+
+	if (ret)
+		return ret;
+
+	if (regval & PHY_ID_OVERWRITE_MODE)
+		is_host = false;
+
+	if (!(regval & PHY_ID_OVERWRITE_EN))
+		seq_puts(seq, "otg: ");
+
+	seq_puts(seq, is_host ? "host\n" : "peripheral\n");
+
+	return 0;
+}
+
+DEFINE_SHOW_STORE_ATTRIBUTE(dr_mode);
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
+	ret = clk_set_rate(phy->usb_stb_clk, PHY_STB_CLK_RATE);
+	if (ret)
+		return ret;
+
+	return 0;
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
+	debugfs_create_file("dr_mode", 0644, phy->phy->debugfs,
+			    phy, &dr_mode_fops);
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
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
