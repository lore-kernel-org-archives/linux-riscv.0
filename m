Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5901C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 08:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQApxL8vA26tMQmfK/WHIi0kS62esKeYYFa2T8coQ8E=; b=vq/TVziWUZeA1r
	Pqm3QAba2ZBKtXbz1Uro1QAaw1bEwKEgPuOp9Y365kICFYcV5twSFdD/+CxRYzzqnMIe2d2GzyuT/
	QJQnMTqbb0fwDQw7dcajQLJqmhDz84mnkqud3+haRgSlwrsNOAMQpCa3zS8/zQCshwenn0Q94ll88
	75REG/SFbp48/3DnhlOwswninh8J+4LI1C7jp5MiRifNQcLIIkfqaegEt8aKjFONKMtXSKLSST8xL
	bC9YPu9FMbYrTmYhEPU7JcLfzTzUr7WfRqfNND98/gU7533ROMV9OnRvfUoNJmpYoJr2MFmW+9YCQ
	x2DtB0QBnHzsT/6zSwog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJUMA-0000000E5zQ-3ZXm;
	Tue, 18 Jun 2024 08:38:22 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJUM7-0000000E5y1-3tY3
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 08:38:21 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3d361cf5755so1511959b6e.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 01:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718699897; x=1719304697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECThPbcvOu3FHd4BdiepiF51r0sj/i4bV2Q+q/uVMzo=;
        b=EJxnHPSis5Hg8aoFJCqiv0g7C6Y0PMpLWY2ksUMMb7JscUq5igfA4NS0SNlJP4EhNN
         o6vM47y2eZ0Kd+lfRpTUIJF3AqizJdJZjSl/ABLdoDRjMn3zTFV7sqwkOXMpYNd4NuHV
         IXMepCIQO2X43+0Q1LvXopoM1Xz+yuSexkP96eFWElhjc9+wh+D45nLrur/duS+xnkkG
         hcwreyaJMcahp7/He7xB4NJkFtbsrCDNEj6onyXJuJt6vOnXVnLgQhc1NSMNlufenX3i
         cm+YKhWeMoSmuOPDOrUDhkVQ5LzG5aHAmC0Q3c59HzwhQLf1eSQ95R7nMdHWK/PO69cn
         gTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718699897; x=1719304697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECThPbcvOu3FHd4BdiepiF51r0sj/i4bV2Q+q/uVMzo=;
        b=NIpJHhSmgOfaiHyNmCLgeFnS8aB06D2oLHsULfcb2h6F7xFD+qj4NhBNwR+RJlJacW
         9E914i6Y8bxmF9EfjSlULlp0a8CBy7o/KggKmlaOTCIEcZxzRDzam9n6bUke0gC78Nyy
         4KQQ3oP4zx/kBOLdeMtAQAwlomnTcaepC9TePOEuQ9psXaWeIkmE1nrTCwvvOAp46EuO
         e9dj5qUbh8XbEQxeTbMkPMmT/FwbKqfOdMrXRxeWfyPktnu3Ex0Y35oUdFE370A2ugXf
         wCeNg/YwJBOMgDdGbd3Z4wsgf374zUm/ZBAsviYSH0ef4tx23B58U6F2tJPv7EoriLu0
         9o9g==
X-Forwarded-Encrypted: i=1; AJvYcCXsIPxDbhX5HuGoLWlcus8HPh2EG2jLrW5uyU9MN6dlGSuS5zstggJT9EQRNWUHd2F10WHs/g2nh86Oy2d99qkrIk+qin0ZcC9xhrQZx5xi
X-Gm-Message-State: AOJu0Yx4NDd1CyYzBEUMe3LzTO4/ZQ7u1rVOK69XRCwK+USeH9k201gq
	FlH+BBOUUuynozcS6B9EfmZjrpp6ilv+22usQnbkm4WhOQzfvs40
X-Google-Smtp-Source: AGHT+IFe4JbigvdCClcJUDzutBVbMosAkqtbwNRTXz9wf52wHFboWcMvUCsbYnrbLhw4n/YKXXSZUQ==
X-Received: by 2002:a05:6808:2395:b0:3d2:212e:71a0 with SMTP id 5614622812f47-3d24e8a7272mr12677407b6e.6.1718699896874;
        Tue, 18 Jun 2024 01:38:16 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d2476e37d0sm1729951b6e.51.2024.06.18.01.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 01:38:15 -0700 (PDT)
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
Subject: [PATCH v4 1/4] mmc: sdhci-of-dwcmshc: add callback functions for dwcmshc
Date: Tue, 18 Jun 2024 16:38:07 +0800
Message-Id: <8d13fcec6059b640dc126def05515ca582542c11.1718697954.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718697954.git.unicorn_wang@outlook.com>
References: <cover.1718697954.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_013820_012664_5F692AE2 
X-CRM114-Status: GOOD (  24.57  )
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

The current framework is not easily extended to support new SOCs.
For example, in the current code we see that the SOC-level
structure `rk35xx_priv` and related logic are distributed in
functions such as dwcmshc_probe/dwcmshc_remove/dwcmshc_suspend/......,
which is inappropriate.

The solution is to abstract some possible common operations of soc
as dwcmshc platform data. Each soc implements the corresponding callback
function according to its own needs.
dwcmshc framework is responsible for calling these callback functions
in those dwcmshc_xxx functions at proper positions.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/mmc/host/sdhci-of-dwcmshc.c | 327 ++++++++++++++++------------
 1 file changed, 184 insertions(+), 143 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index e79aa4b3b6c3..f6d6903a0e36 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -206,6 +206,7 @@ struct rk35xx_priv {
 	u8 txclk_tapnum;
 };
 
+struct dwcmshc_pltfm_data;
 struct dwcmshc_priv {
 	struct clk	*bus_clk;
 	int vendor_specific_area1; /* P_VENDOR_SPECIFIC_AREA1 reg */
@@ -214,6 +215,16 @@ struct dwcmshc_priv {
 	void *priv; /* pointer to SoC private stuff */
 	u16 delay_line;
 	u16 flags;
+
+	const struct dwcmshc_pltfm_data *pltfm_data;
+};
+
+struct dwcmshc_pltfm_data {
+	const struct sdhci_pltfm_data pdata;
+	int (*init)(struct device *dev, struct sdhci_host *host, struct dwcmshc_priv *dwc_priv);
+	void (*postinit)(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv);
+	int  (*clks_enable)(struct dwcmshc_priv *dwc_priv);
+	void (*clks_disable)(struct dwcmshc_priv *dwc_priv);
 };
 
 /*
@@ -681,6 +692,92 @@ static void rk35xx_sdhci_reset(struct sdhci_host *host, u8 mask)
 	sdhci_reset(host, mask);
 }
 
+static int dwcmshc_rk35xx_init(struct device *dev, struct sdhci_host *host,
+			       struct dwcmshc_priv *dwc_priv)
+{
+	int err;
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
+
+	priv->reset = devm_reset_control_array_get_optional_exclusive(mmc_dev(host->mmc));
+	if (IS_ERR(priv->reset)) {
+		err = PTR_ERR(priv->reset);
+		dev_err(mmc_dev(host->mmc), "failed to get reset control %d\n", err);
+		return err;
+	}
+
+	priv->rockchip_clks[0].id = "axi";
+	priv->rockchip_clks[1].id = "block";
+	priv->rockchip_clks[2].id = "timer";
+	err = devm_clk_bulk_get_optional(mmc_dev(host->mmc), RK35xx_MAX_CLKS,
+					 priv->rockchip_clks);
+	if (err) {
+		dev_err(mmc_dev(host->mmc), "failed to get clocks %d\n", err);
+		return err;
+	}
+
+	err = clk_bulk_prepare_enable(RK35xx_MAX_CLKS, priv->rockchip_clks);
+	if (err) {
+		dev_err(mmc_dev(host->mmc), "failed to enable clocks %d\n", err);
+		return err;
+	}
+
+	if (of_property_read_u8(mmc_dev(host->mmc)->of_node, "rockchip,txclk-tapnum",
+				&priv->txclk_tapnum))
+		priv->txclk_tapnum = DLL_TXCLK_TAPNUM_DEFAULT;
+
+	/* Disable cmd conflict check */
+	sdhci_writel(host, 0x0, dwc_priv->vendor_specific_area1 + DWCMSHC_HOST_CTRL3);
+	/* Reset previous settings */
+	sdhci_writel(host, 0, DWCMSHC_EMMC_DLL_TXCLK);
+	sdhci_writel(host, 0, DWCMSHC_EMMC_DLL_STRBIN);
+
+	dwc_priv->priv = priv;
+
+	return 0;
+}
+
+static void dwcmshc_rk35xx_postinit(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
+{
+	/*
+	 * Don't support highspeed bus mode with low clk speed as we
+	 * cannot use DLL for this condition.
+	 */
+	if (host->mmc->f_max <= 52000000) {
+		dev_info(mmc_dev(host->mmc), "Disabling HS200/HS400, frequency too low (%d)\n",
+			 host->mmc->f_max);
+		host->mmc->caps2 &= ~(MMC_CAP2_HS200 | MMC_CAP2_HS400);
+		host->mmc->caps &= ~(MMC_CAP_3_3V_DDR | MMC_CAP_1_8V_DDR);
+	}
+}
+
+static int rk35xx_clks_enable(struct dwcmshc_priv *dwc_priv)
+{
+	struct rk35xx_priv *priv = dwc_priv->priv;
+	int ret = 0;
+
+	if (priv)
+		ret = clk_bulk_prepare_enable(RK35xx_MAX_CLKS, priv->rockchip_clks);
+	return ret;
+}
+
+static void rk35xx_clks_disable(struct dwcmshc_priv *dwc_priv)
+{
+	struct rk35xx_priv *priv = dwc_priv->priv;
+
+	if (priv)
+		clk_bulk_disable_unprepare(RK35xx_MAX_CLKS,
+					   priv->rockchip_clks);
+}
+
 static int th1520_execute_tuning(struct sdhci_host *host, u32 opcode)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -755,6 +852,35 @@ static void th1520_sdhci_reset(struct sdhci_host *host, u8 mask)
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
@@ -932,39 +1058,54 @@ static const struct sdhci_ops sdhci_dwcmshc_cv18xx_ops = {
 	.platform_execute_tuning = cv18xx_sdhci_execute_tuning,
 };
 
-static const struct sdhci_pltfm_data sdhci_dwcmshc_pdata = {
-	.ops = &sdhci_dwcmshc_ops,
-	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
-	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
+static const struct dwcmshc_pltfm_data sdhci_dwcmshc_pdata = {
+	.pdata = {
+		.ops = &sdhci_dwcmshc_ops,
+		.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
+		.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
+	},
 };
 
 #ifdef CONFIG_ACPI
-static const struct sdhci_pltfm_data sdhci_dwcmshc_bf3_pdata = {
-	.ops = &sdhci_dwcmshc_ops,
-	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
-	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN |
-		   SDHCI_QUIRK2_ACMD23_BROKEN,
+static const struct dwcmshc_pltfm_data sdhci_dwcmshc_bf3_pdata = {
+	.pdata = {
+		.ops = &sdhci_dwcmshc_ops,
+		.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
+		.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN |
+			   SDHCI_QUIRK2_ACMD23_BROKEN,
+	},
 };
 #endif
 
-static const struct sdhci_pltfm_data sdhci_dwcmshc_rk35xx_pdata = {
-	.ops = &sdhci_dwcmshc_rk35xx_ops,
-	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN |
-		  SDHCI_QUIRK_BROKEN_TIMEOUT_VAL,
-	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN |
-		   SDHCI_QUIRK2_CLOCK_DIV_ZERO_BROKEN,
+static const struct dwcmshc_pltfm_data sdhci_dwcmshc_rk35xx_pdata = {
+	.pdata = {
+		.ops = &sdhci_dwcmshc_rk35xx_ops,
+		.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN |
+			  SDHCI_QUIRK_BROKEN_TIMEOUT_VAL,
+		.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN |
+			   SDHCI_QUIRK2_CLOCK_DIV_ZERO_BROKEN,
+	},
+	.init = dwcmshc_rk35xx_init,
+	.postinit = dwcmshc_rk35xx_postinit,
+	.clks_enable = rk35xx_clks_enable,
+	.clks_disable = rk35xx_clks_disable,
 };
 
-static const struct sdhci_pltfm_data sdhci_dwcmshc_th1520_pdata = {
-	.ops = &sdhci_dwcmshc_th1520_ops,
-	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
-	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
+static const struct dwcmshc_pltfm_data sdhci_dwcmshc_th1520_pdata = {
+	.pdata = {
+		.ops = &sdhci_dwcmshc_th1520_ops,
+		.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
+		.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
+	},
+	.init = th1520_init,
 };
 
-static const struct sdhci_pltfm_data sdhci_dwcmshc_cv18xx_pdata = {
-	.ops = &sdhci_dwcmshc_cv18xx_ops,
-	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
-	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
+static const struct dwcmshc_pltfm_data sdhci_dwcmshc_cv18xx_pdata = {
+	.pdata = {
+		.ops = &sdhci_dwcmshc_cv18xx_ops,
+		.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
+		.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
+	},
 };
 
 static const struct cqhci_host_ops dwcmshc_cqhci_ops = {
@@ -1034,61 +1175,6 @@ static void dwcmshc_cqhci_init(struct sdhci_host *host, struct platform_device *
 	host->mmc->caps2 &= ~(MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD);
 }
 
-static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
-{
-	int err;
-	struct rk35xx_priv *priv = dwc_priv->priv;
-
-	priv->reset = devm_reset_control_array_get_optional_exclusive(mmc_dev(host->mmc));
-	if (IS_ERR(priv->reset)) {
-		err = PTR_ERR(priv->reset);
-		dev_err(mmc_dev(host->mmc), "failed to get reset control %d\n", err);
-		return err;
-	}
-
-	priv->rockchip_clks[0].id = "axi";
-	priv->rockchip_clks[1].id = "block";
-	priv->rockchip_clks[2].id = "timer";
-	err = devm_clk_bulk_get_optional(mmc_dev(host->mmc), RK35xx_MAX_CLKS,
-					 priv->rockchip_clks);
-	if (err) {
-		dev_err(mmc_dev(host->mmc), "failed to get clocks %d\n", err);
-		return err;
-	}
-
-	err = clk_bulk_prepare_enable(RK35xx_MAX_CLKS, priv->rockchip_clks);
-	if (err) {
-		dev_err(mmc_dev(host->mmc), "failed to enable clocks %d\n", err);
-		return err;
-	}
-
-	if (of_property_read_u8(mmc_dev(host->mmc)->of_node, "rockchip,txclk-tapnum",
-				&priv->txclk_tapnum))
-		priv->txclk_tapnum = DLL_TXCLK_TAPNUM_DEFAULT;
-
-	/* Disable cmd conflict check */
-	sdhci_writel(host, 0x0, dwc_priv->vendor_specific_area1 + DWCMSHC_HOST_CTRL3);
-	/* Reset previous settings */
-	sdhci_writel(host, 0, DWCMSHC_EMMC_DLL_TXCLK);
-	sdhci_writel(host, 0, DWCMSHC_EMMC_DLL_STRBIN);
-
-	return 0;
-}
-
-static void dwcmshc_rk35xx_postinit(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
-{
-	/*
-	 * Don't support highspeed bus mode with low clk speed as we
-	 * cannot use DLL for this condition.
-	 */
-	if (host->mmc->f_max <= 52000000) {
-		dev_info(mmc_dev(host->mmc), "Disabling HS200/HS400, frequency too low (%d)\n",
-			 host->mmc->f_max);
-		host->mmc->caps2 &= ~(MMC_CAP2_HS200 | MMC_CAP2_HS400);
-		host->mmc->caps &= ~(MMC_CAP_3_3V_DDR | MMC_CAP_1_8V_DDR);
-	}
-}
-
 static const struct of_device_id sdhci_dwcmshc_dt_ids[] = {
 	{
 		.compatible = "rockchip,rk3588-dwcmshc",
@@ -1135,8 +1221,7 @@ static int dwcmshc_probe(struct platform_device *pdev)
 	struct sdhci_pltfm_host *pltfm_host;
 	struct sdhci_host *host;
 	struct dwcmshc_priv *priv;
-	struct rk35xx_priv *rk_priv = NULL;
-	const struct sdhci_pltfm_data *pltfm_data;
+	const struct dwcmshc_pltfm_data *pltfm_data;
 	int err;
 	u32 extra, caps;
 
@@ -1146,7 +1231,7 @@ static int dwcmshc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	host = sdhci_pltfm_init(pdev, pltfm_data,
+	host = sdhci_pltfm_init(pdev, &pltfm_data->pdata,
 				sizeof(struct dwcmshc_priv));
 	if (IS_ERR(host))
 		return PTR_ERR(host);
@@ -1161,6 +1246,7 @@ static int dwcmshc_probe(struct platform_device *pdev)
 
 	pltfm_host = sdhci_priv(host);
 	priv = sdhci_pltfm_priv(pltfm_host);
+	priv->pltfm_data = pltfm_data;
 
 	if (dev->of_node) {
 		pltfm_host->clk = devm_clk_get(dev, "core");
@@ -1191,49 +1277,12 @@ static int dwcmshc_probe(struct platform_device *pdev)
 	host->mmc_host_ops.hs400_enhanced_strobe = dwcmshc_hs400_enhanced_strobe;
 	host->mmc_host_ops.execute_tuning = dwcmshc_execute_tuning;
 
-	if (pltfm_data == &sdhci_dwcmshc_rk35xx_pdata) {
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
-		err = dwcmshc_rk35xx_init(host, priv);
+	if (pltfm_data->init) {
+		err = pltfm_data->init(&pdev->dev, host, priv);
 		if (err)
 			goto err_clk;
 	}
 
-	if (pltfm_data == &sdhci_dwcmshc_th1520_pdata) {
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
-	}
-
 #ifdef CONFIG_ACPI
 	if (pltfm_data == &sdhci_dwcmshc_bf3_pdata)
 		sdhci_enable_v4_mode(host);
@@ -1261,8 +1310,8 @@ static int dwcmshc_probe(struct platform_device *pdev)
 		dwcmshc_cqhci_init(host, pdev);
 	}
 
-	if (rk_priv)
-		dwcmshc_rk35xx_postinit(host, priv);
+	if (pltfm_data->postinit)
+		pltfm_data->postinit(host, priv);
 
 	err = __sdhci_add_host(host);
 	if (err)
@@ -1280,9 +1329,8 @@ static int dwcmshc_probe(struct platform_device *pdev)
 err_clk:
 	clk_disable_unprepare(pltfm_host->clk);
 	clk_disable_unprepare(priv->bus_clk);
-	if (rk_priv)
-		clk_bulk_disable_unprepare(RK35xx_MAX_CLKS,
-					   rk_priv->rockchip_clks);
+	if (pltfm_data->clks_disable)
+		pltfm_data->clks_disable(priv);
 free_pltfm:
 	sdhci_pltfm_free(pdev);
 	return err;
@@ -1304,7 +1352,6 @@ static void dwcmshc_remove(struct platform_device *pdev)
 	struct sdhci_host *host = platform_get_drvdata(pdev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
-	struct rk35xx_priv *rk_priv = priv->priv;
 
 	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
@@ -1316,9 +1363,8 @@ static void dwcmshc_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(pltfm_host->clk);
 	clk_disable_unprepare(priv->bus_clk);
-	if (rk_priv)
-		clk_bulk_disable_unprepare(RK35xx_MAX_CLKS,
-					   rk_priv->rockchip_clks);
+	if (priv->pltfm_data->clks_disable)
+		priv->pltfm_data->clks_disable(priv);
 	sdhci_pltfm_free(pdev);
 }
 
@@ -1328,7 +1374,6 @@ static int dwcmshc_suspend(struct device *dev)
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
-	struct rk35xx_priv *rk_priv = priv->priv;
 	int ret;
 
 	pm_runtime_resume(dev);
@@ -1347,9 +1392,8 @@ static int dwcmshc_suspend(struct device *dev)
 	if (!IS_ERR(priv->bus_clk))
 		clk_disable_unprepare(priv->bus_clk);
 
-	if (rk_priv)
-		clk_bulk_disable_unprepare(RK35xx_MAX_CLKS,
-					   rk_priv->rockchip_clks);
+	if (priv->pltfm_data->clks_disable)
+		priv->pltfm_data->clks_disable(priv);
 
 	return ret;
 }
@@ -1359,7 +1403,6 @@ static int dwcmshc_resume(struct device *dev)
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
-	struct rk35xx_priv *rk_priv = priv->priv;
 	int ret;
 
 	ret = clk_prepare_enable(pltfm_host->clk);
@@ -1372,29 +1415,27 @@ static int dwcmshc_resume(struct device *dev)
 			goto disable_clk;
 	}
 
-	if (rk_priv) {
-		ret = clk_bulk_prepare_enable(RK35xx_MAX_CLKS,
-					      rk_priv->rockchip_clks);
+	if (priv->pltfm_data->clks_enable) {
+		ret = priv->pltfm_data->clks_enable(priv);
 		if (ret)
 			goto disable_bus_clk;
 	}
 
 	ret = sdhci_resume_host(host);
 	if (ret)
-		goto disable_rockchip_clks;
+		goto disable_soc_clks;
 
 	if (host->mmc->caps2 & MMC_CAP2_CQE) {
 		ret = cqhci_resume(host->mmc);
 		if (ret)
-			goto disable_rockchip_clks;
+			goto disable_soc_clks;
 	}
 
 	return 0;
 
-disable_rockchip_clks:
-	if (rk_priv)
-		clk_bulk_disable_unprepare(RK35xx_MAX_CLKS,
-					   rk_priv->rockchip_clks);
+disable_soc_clks:
+	if (priv->pltfm_data->clks_disable)
+		priv->pltfm_data->clks_disable(priv);
 disable_bus_clk:
 	if (!IS_ERR(priv->bus_clk))
 		clk_disable_unprepare(priv->bus_clk);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
