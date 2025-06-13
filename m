Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B223EC71136
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 01:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TpQ8zQ0S+7Ef82METDGdVYdTUyh6zKKAlOzyoU1CWJc=; b=zC/Z/eN74J1Qci
	XW6rHrriSy6YgZT/T4tPwbxplJ04NV3oJA/pYWiUg/8jGQ2CmFXQIqY9pkfavypKmmq02JoXeBXyB
	LPcZPuR6C+z9MsWlSZ3RnN3M4ax6O8baO11bFrWGf1HwQvoHQRsuFg9zLbOWTFhx5zAEMfVP2sjOV
	tH71UvZHWohGhFzWhzydsdQVwdi8Cni5h5JpFQ5LpFjDqI+T/FrQQWOFBEptFtUHzgjrA1rIa3IRa
	BjSqlf9wJ4Wj96ZF6tZL8g2cFT64Y7Gei+NXT55k04h8ppRdA+GPBatHzB65IDAGFtKmlqAF0RK10
	N2WLaFspxJXfYlA+X6Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsxY-0000000F1f7-0AWk;
	Fri, 13 Jun 2025 01:11:56 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsxT-0000000F1bZ-0UVK
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 01:11:54 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-2ea08399ec8so983896fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 18:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749777110; x=1750381910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CofZ6mxwdPQ5E5kE6D3I1SRbGpA+t1hpeEYsYL5jGT4=;
        b=I7w1nPoo+CA+pg5NYW5yaczU5Unu9IcWCEQG+pksdReE3JLuObTx+ckDSy9nkKjzxW
         G1PsmR31aoVkfZJqTX3RM847O63UAfuCiInEowYd+Fv7LnQRjt+GCSFDnw4ndhXQuMk3
         u7DarZuCs72+04HOoba5XqYLXWu6C7spL3ebhOw2Kke5mvnw67+AyFuya3Fe5c8P87R2
         Af4XjNH8OCqObExUK61M+t4+RkBUziYDmHvlfVzKwZzdJzS3frOhO2s7z2Kl+59B+Ak8
         wIugEtSBTRY7Q0y5sekf+l17aAhN7il+750rWM9IWU2RlM8fr/6w/e5BQDJ73M43l71t
         /d2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749777110; x=1750381910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CofZ6mxwdPQ5E5kE6D3I1SRbGpA+t1hpeEYsYL5jGT4=;
        b=phbNtWa/7PSfuI1/ChbJu4ORrQQYVedfyg8ah8dsY6PJlssjs2aYxBulCZjazBpI57
         o0/MB9atdMB7EQO+HmNIJ/07HkSMZQ6EEzD4fw+syK6R6HeBWwucP53JOqkQqZwtzsOD
         iyXLJUJXrFI/MaS++pn8r7ah3XnHF8mrrSxdvNLfXlSYWRS0PUC9vbesJA+5eoqwbt4u
         hDBLmtNDMescAtT+I1+ecOU+WMHUopM20GKlBlutuFQKjd2/fy220sgx1wSOpz9ikrlg
         PV3Y4G+giYD+JmPFBs4EfyWeY4L8ShQKx2Vwk3csM2qfb+1xn1uLwoDB6iQTCCQWxHUG
         PqCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTrH8aVij5Jb+Hieb05JzKeBMWfAos+ZoJhzKJ/XTJao3LI6ywQkJaUXxRety8P5xS+DKoErhAbkShOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTvoak2UUFyrC5QzhdwBetMLN62ZTVVIPS7X4C8uQBwurlt2GT
	Lav/Fb91QhY6bMy3GWqX3NSVdsumbBAL37uoygukNzLieaoUT4x9sYv5l67/I/925aU=
X-Gm-Gg: ASbGncuFUfFH0mo1JPzCgVutZUYJXMQJLNH7j688tUIzhrCimbZ8L62r32tOslzuq/S
	2JqsH+dLRptuy7nhGqKWhRAdfXotU1x+TrqwXYWVCWgnG92CqjO9hHUhlBK97xK0MfonInBavzH
	L7pHYqzrCF2/3ZYJgf2AjMIVVVA41uJQb4Utm3L3qR6KJuzunrLOEAXHpQLcvfDibVGR6YXyi2E
	HDwgqZwDs3G+87N/R/FrMkU6Cw+G2FIpUQ12OEeK3phDy+00K9jHB6zLUaRAgVlY6g887PYCQX3
	j/CWcHkpn+XWn/vczgdZsVQjX3l0IuPMU6MzzyMPdKNnF2uGPxklZ/TTzvVHp/BrW1uWFmfeO9V
	uUAPM+/S+EqI3mH/c47YVTr3mmKf3FaQ=
X-Google-Smtp-Source: AGHT+IHhEFwQE/7R/66XtMxO+m/FYMsnTB4goPDIyfodH3kp5NfNiwWnHT2C83VeoHLVhgWdXV8Qgw==
X-Received: by 2002:a05:6870:5694:b0:2c2:dfbb:2dbd with SMTP id 586e51a60fabf-2ead4eb6b82mr777124fac.8.1749777110187;
        Thu, 12 Jun 2025 18:11:50 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eac0c17211sm407685fac.18.2025.06.12.18.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 18:11:49 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 3/6] clk: spacemit: set up reset auxiliary devices
Date: Thu, 12 Jun 2025 20:11:35 -0500
Message-ID: <20250613011139.1201702-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613011139.1201702-1-elder@riscstar.com>
References: <20250613011139.1201702-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_181151_169617_58E97FA6 
X-CRM114-Status: GOOD (  23.87  )
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

Add a new reset_name field to the spacemit_ccu_data structure.  If it is
non-null, the CCU implements a reset controller, and the name will be
used in the name for the auxiliary device that implements it.

Define a new type to hold an auxiliary device as well as the regmap
pointer that will be needed by CCU reset controllers.  Set up code to
initialize and add an auxiliary device for any CCU that implements reset
functionality.

Make it optional for a CCU to implement a clock controller.  This
doesn't apply to any of the existing CCUs but will for some new ones
that will be added soon.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Haylen Chu <heylenay@4d2.org>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/clk/spacemit/Kconfig     |   1 +
 drivers/clk/spacemit/ccu-k1.c    | 104 ++++++++++++++++++++++++++++---
 include/soc/spacemit/k1-syscon.h |  12 ++++
 3 files changed, 107 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
index 4c4df845b3cb2..3854f6ae6d0ea 100644
--- a/drivers/clk/spacemit/Kconfig
+++ b/drivers/clk/spacemit/Kconfig
@@ -3,6 +3,7 @@
 config SPACEMIT_CCU
 	tristate "Clock support for SpacemiT SoCs"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
+	select AUXILIARY_BUS
 	select MFD_SYSCON
 	help
 	  Say Y to enable clock controller unit support for SpacemiT SoCs.
diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 801150f4ff0f5..1c9ed434ae93e 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -5,12 +5,15 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
+#include <linux/idr.h>
 #include <linux/mfd/syscon.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 #include <soc/spacemit/k1-syscon.h>
 
 #include "ccu_common.h"
@@ -21,10 +24,13 @@
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
 
 struct spacemit_ccu_data {
+	const char *reset_name;
 	struct clk_hw **hws;
 	size_t num;
 };
 
+static DEFINE_IDA(auxiliary_ids);
+
 /* APBS clocks start, APBS region contains and only contains all PLL clocks */
 
 /*
@@ -710,8 +716,9 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_pll_data = {
-	.hws	= k1_ccu_pll_hws,
-	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
+	/* The PLL CCU implements no resets */
+	.hws		= k1_ccu_pll_hws,
+	.num		= ARRAY_SIZE(k1_ccu_pll_hws),
 };
 
 static struct clk_hw *k1_ccu_mpmu_hws[] = {
@@ -751,8 +758,9 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.hws	= k1_ccu_mpmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
+	.reset_name	= "mpmu-reset",
+	.hws		= k1_ccu_mpmu_hws,
+	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
 };
 
 static struct clk_hw *k1_ccu_apbc_hws[] = {
@@ -859,8 +867,9 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
-	.hws	= k1_ccu_apbc_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apbc_hws),
+	.reset_name	= "apbc-reset",
+	.hws		= k1_ccu_apbc_hws,
+	.num		= ARRAY_SIZE(k1_ccu_apbc_hws),
 };
 
 static struct clk_hw *k1_ccu_apmu_hws[] = {
@@ -929,8 +938,9 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
-	.hws	= k1_ccu_apmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
+	.reset_name	= "apmu-reset",
+	.hws		= k1_ccu_apmu_hws,
+	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
 static int spacemit_ccu_register(struct device *dev,
@@ -941,6 +951,10 @@ static int spacemit_ccu_register(struct device *dev,
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
+	/* Nothing to do if the CCU does not implement any clocks */
+	if (!data->hws)
+		return 0;
+
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
 				GFP_KERNEL);
 	if (!clk_data)
@@ -981,9 +995,74 @@ static int spacemit_ccu_register(struct device *dev,
 	return ret;
 }
 
+static void spacemit_cadev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	ida_free(&auxiliary_ids, adev->id);
+	kfree(to_spacemit_ccu_adev(adev));
+}
+
+static void spacemit_adev_unregister(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int spacemit_ccu_reset_register(struct device *dev,
+				       struct regmap *regmap,
+				       const char *reset_name)
+{
+	struct spacemit_ccu_adev *cadev;
+	struct auxiliary_device *adev;
+	int ret;
+
+	/* Nothing to do if the CCU does not implement a reset controller */
+	if (!reset_name)
+		return 0;
+
+	cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
+	if (!cadev)
+		return -ENOMEM;
+
+	cadev->regmap = regmap;
+
+	adev = &cadev->adev;
+	adev->name = reset_name;
+	adev->dev.parent = dev;
+	adev->dev.release = spacemit_cadev_release;
+	adev->dev.of_node = dev->of_node;
+	ret = ida_alloc(&auxiliary_ids, GFP_KERNEL);
+	if (ret < 0)
+		goto err_free_cadev;
+	adev->id = ret;
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		goto err_free_aux_id;
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
+
+err_free_aux_id:
+	ida_free(&auxiliary_ids, adev->id);
+err_free_cadev:
+	kfree(cadev);
+
+	return ret;
+}
+
 static int k1_ccu_probe(struct platform_device *pdev)
 {
 	struct regmap *base_regmap, *lock_regmap = NULL;
+	const struct spacemit_ccu_data *data;
 	struct device *dev = &pdev->dev;
 	int ret;
 
@@ -1012,11 +1091,16 @@ static int k1_ccu_probe(struct platform_device *pdev)
 					     "failed to get lock regmap\n");
 	}
 
-	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
-				    of_device_get_match_data(dev));
+	data = of_device_get_match_data(dev);
+
+	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
+	ret = spacemit_ccu_reset_register(dev, base_regmap, data->reset_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register resets\n");
+
 	return 0;
 }
 
diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
index 039a448c51a07..53eff7691f33d 100644
--- a/include/soc/spacemit/k1-syscon.h
+++ b/include/soc/spacemit/k1-syscon.h
@@ -5,6 +5,18 @@
 #ifndef __SOC_K1_SYSCON_H__
 #define __SOC_K1_SYSCON_H__
 
+/* Auxiliary device used to represent a CCU reset controller */
+struct spacemit_ccu_adev {
+	struct auxiliary_device adev;
+	struct regmap *regmap;
+};
+
+static inline struct spacemit_ccu_adev *
+to_spacemit_ccu_adev(struct auxiliary_device *adev)
+{
+	return container_of(adev, struct spacemit_ccu_adev, adev);
+}
+
 /* APBS register offset */
 #define APBS_PLL1_SWCR1			0x100
 #define APBS_PLL1_SWCR2			0x104
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
