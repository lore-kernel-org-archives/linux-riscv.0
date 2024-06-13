Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B220EC27C6E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 01:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OVLhd0XlukTfrhz64uIp7gHuuC7XQi5SP3VrxzWTaU0=; b=ZU5P9+ipGqDyHo
	xwF9U0m4cuoVQoOI8zp9Z7u5y7m2DOSznALcUKDl42Lcq8BHbTXdrMuxoUsIYNl6vpJrvryR8Tsln
	5nJwQ30DxUpnyOLZgcCFTagu1XOHFx3kSaVDk0l1gpchHxcm5RTAo8gwNvguajRdLAsVw1ONat/WY
	6gh+vDWf24gNKEp5iaruXV1SfBxCTzxWQZ7CBAtsaTnuPBG5MomdSYzzopueu7aGksF0FCBfu63Wj
	Hzi53wEbSpMfZ1anrrDfDUPfGU9l7Pq4YpqiAVlS89UvtK1fRb0MFv+SjAIw9QU8TSAHTvdX+PjHL
	GmyMclunfDXC35rbP74Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHZUr-0000000EkO3-2bY3;
	Thu, 13 Jun 2024 01:43:25 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHZUm-0000000EkLy-2Aus
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 01:43:24 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3d22368713aso261321b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 18:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718242999; x=1718847799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbD6SremdmxVZ0GUzq/7rE++FPn/ciMc7/PALB4g6fM=;
        b=euAPida3f5aV3rqTyTvyyyIZsPbTnDEhpCn0A5txOmS9+5/PDPLh7elTiyGznO2uXf
         6VUd1aIejnF8Et2jA+mpmYi47nMCDzq43xTsHOejix4t+3aGd4+2KcfoKiQ0u+YWGDrD
         Wjx9mG694MnjaFWzpRUkB8lHnDYoSY46gW1k1rVHDM1mFK9PXvfRKueXPXGb3DlksysM
         foZWfVIJtcMvWg8GHct2GmjYyn1az2QfyTVipZeXRwLtMm08ylhYj+gXSeOLmv4O9lNh
         H2WLXiWsHc+srm3SUiBvfE8Zyd8JUnyvKiiIvn8ZL8IfmXfOeMk3bZEjCuSOXIcNGSJC
         6ZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718242999; x=1718847799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbD6SremdmxVZ0GUzq/7rE++FPn/ciMc7/PALB4g6fM=;
        b=grPAU0L7y5UfhIMQY6d2/H3qG+NtdHfvxaBz2gU7f+r3dul0uT81VlC8FDsacfm4gf
         58O4eCZx1KjpQMT7wLlxZ4CJ9RjrgPpxq8PGLwxmdOhtaL8Jf5DjGDwaUGPup+ZhEol0
         ibhZVdept5xMjwispDgWPsoYy2JNg/XDBYR0E9QyURNzTyX4f5kh8oh65SZ/ZGWy3QUh
         jYwzeCkulLUEBz3zBgAnpIW7YFxJU4zXxOZTSTOqvhYD95wOIp5s5hat3vAsAeLMOXhu
         HUoftBt/n7SyWA/12NLoOx5sWiej6QXWvvwR/uOLtFGsDRg2dKWA4w1Ewm32P72G3R2o
         D55w==
X-Forwarded-Encrypted: i=1; AJvYcCWcofR/rZjOPzCeqcOoEZp1+QpLpxlGv/umgCbBbb6lTZnNwf0QVA0HYsNotPBaxg4eU2YHcBcHZNFCbjn57Im3kksrArDoYCw2VR94xXAw
X-Gm-Message-State: AOJu0YyeHnPQwfUzORclJIKreAkRLMDJcOIyLam/0Xf9tw1mPpCIeQCx
	F5EsW3Wb1zfkowlbmq3UdnWnpvaq00wN2GHF3JcDNdjUUofQlFm/
X-Google-Smtp-Source: AGHT+IFmIDk/X/zy9LRcduSnBl9YyJYHeNIg54XFnzU/VeRzTcaAbcqqt1huRWTU4iTw8UjZVGCjUg==
X-Received: by 2002:a05:6808:2191:b0:3d2:308b:9bb4 with SMTP id 5614622812f47-3d23e0cfbb9mr3918608b6e.43.1718242998751;
        Wed, 12 Jun 2024 18:43:18 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d24762ee1esm49355b6e.29.2024.06.12.18.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 18:43:18 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: adrian.hunter@intel.com,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	ulf.hansson@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	tingzhu.wang@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v3 3/4] mmc: sdhci-of-dwcmshc: extract init function for rk35xx/th1520
Date: Thu, 13 Jun 2024 09:43:11 +0800
Message-Id: <459e341a32128ffbae5acdc77a1c835cbee582e6.1718241495.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718241495.git.unicorn_wang@outlook.com>
References: <cover.1718241495.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_184320_746119_3279C29D 
X-CRM114-Status: GOOD (  16.22  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Extract init function for rk35xx/th1520, which is an intermediate
process before further optimization.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/mmc/host/sdhci-of-dwcmshc.c | 83 ++++++++++++++++-------------
 1 file changed, 46 insertions(+), 37 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index 346d2d323a05..38ab755aa044 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -749,10 +749,19 @@ static void rk35xx_sdhci_reset(struct sdhci_host *host, u8 mask)
 	sdhci_reset(host, mask);
 }
 
-static int rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
+static int rk35xx_init(struct device *dev, struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
 {
 	int err;
-	struct rk35xx_priv *priv = dwc_priv->priv;
+	struct rk35xx_priv *priv;
+
+	priv = devm_kzalloc(dev, sizeof(struct rk35xx_priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	if (of_device_is_compatible(dev->of_node, "rockchip,rk3588-dwcmshc"))
+		priv->devtype = DWCMSHC_RK3588;
+	else
+		priv->devtype = DWCMSHC_RK3568;
 
 	priv->reset = devm_reset_control_array_get_optional_exclusive(mmc_dev(host->mmc));
 	if (IS_ERR(priv->reset)) {
@@ -787,6 +796,8 @@ static int rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
 	sdhci_writel(host, 0, DWCMSHC_EMMC_DLL_TXCLK);
 	sdhci_writel(host, 0, DWCMSHC_EMMC_DLL_STRBIN);
 
+	dwc_priv->priv = priv;
+
 	return 0;
 }
 
@@ -915,6 +926,35 @@ static void th1520_sdhci_reset(struct sdhci_host *host, u8 mask)
 	}
 }
 
+static int th1520_init(struct device *dev,
+		       struct sdhci_host *host,
+		       struct dwcmshc_priv *dwc_priv)
+{
+	dwc_priv->delay_line = PHY_SDCLKDL_DC_DEFAULT;
+
+	if (device_property_read_bool(dev, "mmc-ddr-1_8v") ||
+	    device_property_read_bool(dev, "mmc-hs200-1_8v") ||
+	    device_property_read_bool(dev, "mmc-hs400-1_8v"))
+		dwc_priv->flags |= FLAG_IO_FIXED_1V8;
+	else
+		dwc_priv->flags &= ~FLAG_IO_FIXED_1V8;
+
+	/*
+	 * start_signal_voltage_switch() will try 3.3V first
+	 * then 1.8V. Use SDHCI_SIGNALING_180 rather than
+	 * SDHCI_SIGNALING_330 to avoid setting voltage to 3.3V
+	 * in sdhci_start_signal_voltage_switch().
+	 */
+	if (dwc_priv->flags & FLAG_IO_FIXED_1V8) {
+		host->flags &= ~SDHCI_SIGNALING_330;
+		host->flags |=  SDHCI_SIGNALING_180;
+	}
+
+	sdhci_enable_v4_mode(host);
+
+	return 0;
+}
+
 static void cv18xx_sdhci_reset(struct sdhci_host *host, u8 mask)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -1230,46 +1270,15 @@ static int dwcmshc_probe(struct platform_device *pdev)
 	host->mmc_host_ops.execute_tuning = dwcmshc_execute_tuning;
 
 	if (pltfm_data == &sdhci_dwcmshc_rk35xx_pdata) {
-		rk_priv = devm_kzalloc(&pdev->dev, sizeof(struct rk35xx_priv), GFP_KERNEL);
-		if (!rk_priv) {
-			err = -ENOMEM;
-			goto err_clk;
-		}
-
-		if (of_device_is_compatible(pdev->dev.of_node, "rockchip,rk3588-dwcmshc"))
-			rk_priv->devtype = DWCMSHC_RK3588;
-		else
-			rk_priv->devtype = DWCMSHC_RK3568;
-
-		priv->priv = rk_priv;
-
-		err = rk35xx_init(host, priv);
+		err = rk35xx_init(&pdev->dev, host, priv);
 		if (err)
 			goto err_clk;
 	}
 
 	if (pltfm_data == &sdhci_dwcmshc_th1520_pdata) {
-		priv->delay_line = PHY_SDCLKDL_DC_DEFAULT;
-
-		if (device_property_read_bool(dev, "mmc-ddr-1_8v") ||
-		    device_property_read_bool(dev, "mmc-hs200-1_8v") ||
-		    device_property_read_bool(dev, "mmc-hs400-1_8v"))
-			priv->flags |= FLAG_IO_FIXED_1V8;
-		else
-			priv->flags &= ~FLAG_IO_FIXED_1V8;
-
-		/*
-		 * start_signal_voltage_switch() will try 3.3V first
-		 * then 1.8V. Use SDHCI_SIGNALING_180 rather than
-		 * SDHCI_SIGNALING_330 to avoid setting voltage to 3.3V
-		 * in sdhci_start_signal_voltage_switch().
-		 */
-		if (priv->flags & FLAG_IO_FIXED_1V8) {
-			host->flags &= ~SDHCI_SIGNALING_330;
-			host->flags |=  SDHCI_SIGNALING_180;
-		}
-
-		sdhci_enable_v4_mode(host);
+		err = th1520_init(&pdev->dev, host, priv);
+		if (err)
+			goto err_clk;
 	}
 
 #ifdef CONFIG_ACPI
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
