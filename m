Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C65C27C53
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 01:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vcPHrOwn0nI22Q5jiRihCl2n0B9Mlvn99d0ww7e5zUU=; b=32wJcLFwGfd/du
	MKKI9dnWkxjz/O2PvmiB3pN6FTnKUOC3xbHaShrG+pPx+dEicHD8iufae5dSV2t1Tk7PS1ctJwEcp
	qm7l0yjVLIGFwqb0JDkxPip2DOGKvicN0ikEZ9SVvPdDkeN0lSzaP/+iYXIqgEA77Qj/LZ1N/tBox
	90bsa4vLjcdIsqlET14sjfyxI3rji9LvkkVTxMqaxPsDIifsXshkgCCJylB2dhU6yudWjDN0PSGeW
	pR2XFP8OIlWQMpbGNCX2M9ZIZpEpb3rvnanIAtUKZ5/AE5QWSciN73rJ+BpM6cWFHi3M7IqiGE1gg
	Gt/U3NRFJhBuuBo7aSoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHZVF-0000000EkZx-0w1I;
	Thu, 13 Jun 2024 01:43:49 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHZV9-0000000EkVX-2yks
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 01:43:47 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5bae81effd1so268816eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 18:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718243022; x=1718847822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pa5paPyLFaIvlDKRYO3r2AiKWf66KpIRKCv3yER7jFo=;
        b=ThQPTtT0LYF5CEh+lBV+tB2FAnmHlwEDzhriWDIlIfU/l5zAmvRCzZNOzeTN3aLXD9
         jp6oFkFYNltLKliHoBf4V2Az+84tj/BiTrKzpJcgLI6QoTvT4jmnXHhhVhKaamny4E/6
         U34izndBurfpLxlGOvMq67NoT3pllk94CvEg68Dys+QhhmRcPMWM5+8CjoNuft5Z44G2
         iKzPw3gBYAwlt4FKF4SdzeslWc5wdYKPF/Za7yUa9vY/hanWluJbUN05M10FrVUzR8+u
         Xg1991V7NzLycV8k2uapgazMr/EZPZBxrjVl7cq8KRNHrsBV+UH/ZZ0TeWqo/LVbmU0F
         52aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718243022; x=1718847822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pa5paPyLFaIvlDKRYO3r2AiKWf66KpIRKCv3yER7jFo=;
        b=K/mGp1NR2lUJAGPFiU31jE0EmM149VYDz/c7CbtynUOA7qet0jaA85UkJu46EF0vBT
         BCv9jqEaCTDyV3j/ol8t7nfny6l+cQDinwmKnHdHWNQqPgT6p7zKFyhp35T6gQTWw3ly
         2ir3jHVAJl/D6mfp1j7AIYTGazVHQX9UHUybecbF/e/SekAp/I9Lm9sf04+6PjBElW1/
         VEVg3oUniclkQil5eS3c9C8sNBRruptaNZka97WCf++Jq0VQqpWRwB//6bNW4UIT1brT
         izeZBUx6ZcJJ8lHom7IN0MRsxi0mPVKkngJud6DVWFix98U5TM6kLdZpNIVOjs5BqP6F
         86iw==
X-Forwarded-Encrypted: i=1; AJvYcCVuiFE+9dqzSm/nkrlqMVaLGC2ASR+EBb2jGvnTo7EZHSGIguR3a1H78cXVEkIeUYi4iKrXApJxIzKZNVuSaUkEU3LAPEQOKWNdPm+ENSfC
X-Gm-Message-State: AOJu0YwF2Up23HR7VplSy/wkneTepuNFsdbNV4j2HjlX9TC0De3EXDXg
	ttGD8upGNDXiZo8Jvu5EAxiHZ7fKLJV7PNKUIMF4enZUuyN2b0s7
X-Google-Smtp-Source: AGHT+IFHY32p6WRy8aXgAhgI2jg/QRmSqj0czMoSEtq5wJ8S15vpDIei+2sdjk80QfaRRPhpbCPk4w==
X-Received: by 2002:a4a:cb13:0:b0:5bd:15fc:8fe5 with SMTP id 006d021491bc7-5bd15fc96fbmr799925eaf.7.1718243021947;
        Wed, 12 Jun 2024 18:43:41 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd62926ef8sm46561eaf.39.2024.06.12.18.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 18:43:41 -0700 (PDT)
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
Subject: [PATCH v3 4/4] mmc: sdhci-of-dwcmshc: add callback functions for dwcmshc
Date: Thu, 13 Jun 2024 09:43:34 +0800
Message-Id: <2182f65bad83e394a7ffb9259b2c1aa130912961.1718241495.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718241495.git.unicorn_wang@outlook.com>
References: <cover.1718241495.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_184344_852481_FA9003D2 
X-CRM114-Status: GOOD (  21.31  )
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
 drivers/mmc/host/sdhci-of-dwcmshc.c | 143 +++++++++++++++++++---------
 1 file changed, 99 insertions(+), 44 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index 38ab755aa044..ebae461019f9 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -206,6 +206,7 @@ struct rk35xx_priv {
 	u8 txclk_tapnum;
 };
 
+struct dwcmshc_ops;
 struct dwcmshc_priv {
 	struct clk	*bus_clk;
 	int vendor_specific_area1; /* P_VENDOR_SPECIFIC_AREA1 reg */
@@ -214,6 +215,20 @@ struct dwcmshc_priv {
 	void *priv; /* pointer to SoC private stuff */
 	u16 delay_line;
 	u16 flags;
+
+	const struct dwcmshc_ops *ops;
+};
+
+struct dwcmshc_ops {
+	int (*init)(struct device *dev, struct sdhci_host *host, struct dwcmshc_priv *dwc_priv);
+	void (*postinit)(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv);
+	int  (*clks_enable)(struct dwcmshc_priv *dwc_priv);
+	void (*clks_disable)(struct dwcmshc_priv *dwc_priv);
+};
+
+struct dwcmshc_data {
+	const struct sdhci_pltfm_data *pdata;
+	const struct dwcmshc_ops *ops;
 };
 
 /*******************************************************************************
@@ -815,6 +830,25 @@ static void rk35xx_postinit(struct sdhci_host *host, struct dwcmshc_priv *dwc_pr
 	}
 }
 
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
 static void th1520_sdhci_set_phy(struct sdhci_host *host)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -1167,30 +1201,65 @@ static const struct sdhci_pltfm_data sdhci_dwcmshc_cv18xx_pdata = {
 	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
 };
 
+static const struct dwcmshc_ops dwcmshc_rk35xx_ops = {
+	.init = rk35xx_init,
+	.postinit = rk35xx_postinit,
+	.clks_enable = rk35xx_clks_enable,
+	.clks_disable = rk35xx_clks_disable,
+};
+
+static const struct dwcmshc_ops dwcmshc_th1520_ops = {
+	.init = th1520_init,
+};
+
+static const struct dwcmshc_data dwcmshc_cv18xx_data = {
+	.pdata = &sdhci_dwcmshc_cv18xx_pdata,
+};
+
+static const struct dwcmshc_data dwcmshc_generic_data = {
+	.pdata = &sdhci_dwcmshc_pdata,
+};
+
+static const struct dwcmshc_data dwcmshc_rk35xx_data = {
+	.pdata = &sdhci_dwcmshc_rk35xx_pdata,
+	.ops = &dwcmshc_rk35xx_ops,
+};
+
+static const struct dwcmshc_data dwcmshc_th1520_data = {
+	.pdata = &sdhci_dwcmshc_th1520_pdata,
+	.ops = &dwcmshc_th1520_ops,
+};
+
+#ifdef CONFIG_ACPI
+static const struct dwcmshc_data dwcmshc_bf3_data = {
+	.pdata = &sdhci_dwcmshc_bf3_pdata,
+};
+#endif
+
 static const struct of_device_id sdhci_dwcmshc_dt_ids[] = {
 	{
 		.compatible = "rockchip,rk3588-dwcmshc",
-		.data = &sdhci_dwcmshc_rk35xx_pdata,
+		.data = &dwcmshc_rk35xx_data,
 	},
 	{
 		.compatible = "rockchip,rk3568-dwcmshc",
-		.data = &sdhci_dwcmshc_rk35xx_pdata,
+		.data = &dwcmshc_rk35xx_data,
 	},
 	{
 		.compatible = "snps,dwcmshc-sdhci",
-		.data = &sdhci_dwcmshc_pdata,
+		.data = &dwcmshc_generic_data,
 	},
 	{
 		.compatible = "sophgo,cv1800b-dwcmshc",
-		.data = &sdhci_dwcmshc_cv18xx_pdata,
+		.data = &dwcmshc_cv18xx_data,
 	},
 	{
 		.compatible = "sophgo,sg2002-dwcmshc",
-		.data = &sdhci_dwcmshc_cv18xx_pdata,
+		.data = &dwcmshc_cv18xx_data,
 	},
 	{
 		.compatible = "thead,th1520-dwcmshc",
-		.data = &sdhci_dwcmshc_th1520_pdata,
+		.data = &dwcmshc_th1520_data,
 	},
 	{},
 };
@@ -1200,7 +1269,7 @@ MODULE_DEVICE_TABLE(of, sdhci_dwcmshc_dt_ids);
 static const struct acpi_device_id sdhci_dwcmshc_acpi_ids[] = {
 	{
 		.id = "MLNXBF30",
-		.driver_data = (kernel_ulong_t)&sdhci_dwcmshc_bf3_pdata,
+		.driver_data = (kernel_ulong_t)&dwcmshc_bf3_data,
 	},
 	{}
 };
@@ -1213,18 +1282,17 @@ static int dwcmshc_probe(struct platform_device *pdev)
 	struct sdhci_pltfm_host *pltfm_host;
 	struct sdhci_host *host;
 	struct dwcmshc_priv *priv;
-	struct rk35xx_priv *rk_priv = NULL;
-	const struct sdhci_pltfm_data *pltfm_data;
+	const struct dwcmshc_data *data;
 	int err;
 	u32 extra, caps;
 
-	pltfm_data = device_get_match_data(&pdev->dev);
-	if (!pltfm_data) {
+	data = device_get_match_data(&pdev->dev);
+	if (!data) {
 		dev_err(&pdev->dev, "Error: No device match data found\n");
 		return -ENODEV;
 	}
 
-	host = sdhci_pltfm_init(pdev, pltfm_data,
+	host = sdhci_pltfm_init(pdev, data->pdata,
 				sizeof(struct dwcmshc_priv));
 	if (IS_ERR(host))
 		return PTR_ERR(host);
@@ -1239,6 +1307,7 @@ static int dwcmshc_probe(struct platform_device *pdev)
 
 	pltfm_host = sdhci_priv(host);
 	priv = sdhci_pltfm_priv(pltfm_host);
+	priv->ops = data->ops;
 
 	if (dev->of_node) {
 		pltfm_host->clk = devm_clk_get(dev, "core");
@@ -1269,20 +1338,14 @@ static int dwcmshc_probe(struct platform_device *pdev)
 	host->mmc_host_ops.hs400_enhanced_strobe = dwcmshc_hs400_enhanced_strobe;
 	host->mmc_host_ops.execute_tuning = dwcmshc_execute_tuning;
 
-	if (pltfm_data == &sdhci_dwcmshc_rk35xx_pdata) {
-		err = rk35xx_init(&pdev->dev, host, priv);
-		if (err)
-			goto err_clk;
-	}
-
-	if (pltfm_data == &sdhci_dwcmshc_th1520_pdata) {
-		err = th1520_init(&pdev->dev, host, priv);
+	if (data->ops && data->ops->init) {
+		err = data->ops->init(&pdev->dev, host, priv);
 		if (err)
 			goto err_clk;
 	}
 
 #ifdef CONFIG_ACPI
-	if (pltfm_data == &sdhci_dwcmshc_bf3_pdata)
+	if (data == &dwcmshc_bf3_data)
 		sdhci_enable_v4_mode(host);
 #endif
 
@@ -1308,8 +1371,8 @@ static int dwcmshc_probe(struct platform_device *pdev)
 		dwcmshc_cqhci_init(host, pdev);
 	}
 
-	if (rk_priv)
-		rk35xx_postinit(host, priv);
+	if (data->ops && data->ops->postinit)
+		data->ops->postinit(host, priv);
 
 	err = __sdhci_add_host(host);
 	if (err)
@@ -1327,9 +1390,8 @@ static int dwcmshc_probe(struct platform_device *pdev)
 err_clk:
 	clk_disable_unprepare(pltfm_host->clk);
 	clk_disable_unprepare(priv->bus_clk);
-	if (rk_priv)
-		clk_bulk_disable_unprepare(RK35xx_MAX_CLKS,
-					   rk_priv->rockchip_clks);
+	if (data->ops && data->ops->clks_disable)
+		data->ops->clks_disable(priv);
 free_pltfm:
 	sdhci_pltfm_free(pdev);
 	return err;
@@ -1340,7 +1402,6 @@ static void dwcmshc_remove(struct platform_device *pdev)
 	struct sdhci_host *host = platform_get_drvdata(pdev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
-	struct rk35xx_priv *rk_priv = priv->priv;
 
 	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
@@ -1352,9 +1413,8 @@ static void dwcmshc_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(pltfm_host->clk);
 	clk_disable_unprepare(priv->bus_clk);
-	if (rk_priv)
-		clk_bulk_disable_unprepare(RK35xx_MAX_CLKS,
-					   rk_priv->rockchip_clks);
+	if (priv->ops && priv->ops->clks_disable)
+		priv->ops->clks_disable(priv);
 	sdhci_pltfm_free(pdev);
 }
 
@@ -1364,7 +1424,6 @@ static int dwcmshc_suspend(struct device *dev)
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
-	struct rk35xx_priv *rk_priv = priv->priv;
 	int ret;
 
 	pm_runtime_resume(dev);
@@ -1383,9 +1442,8 @@ static int dwcmshc_suspend(struct device *dev)
 	if (!IS_ERR(priv->bus_clk))
 		clk_disable_unprepare(priv->bus_clk);
 
-	if (rk_priv)
-		clk_bulk_disable_unprepare(RK35xx_MAX_CLKS,
-					   rk_priv->rockchip_clks);
+	if (priv->ops && priv->ops->clks_disable)
+		priv->ops->clks_disable(priv);
 
 	return ret;
 }
@@ -1395,7 +1453,6 @@ static int dwcmshc_resume(struct device *dev)
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
-	struct rk35xx_priv *rk_priv = priv->priv;
 	int ret;
 
 	ret = clk_prepare_enable(pltfm_host->clk);
@@ -1408,29 +1465,27 @@ static int dwcmshc_resume(struct device *dev)
 			goto disable_clk;
 	}
 
-	if (rk_priv) {
-		ret = clk_bulk_prepare_enable(RK35xx_MAX_CLKS,
-					      rk_priv->rockchip_clks);
+	if (priv->ops && priv->ops->clks_enable) {
+		ret = priv->ops->clks_enable(priv);
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
+	if (priv->ops && priv->ops->clks_disable)
+		priv->ops->clks_disable(priv);
 disable_bus_clk:
 	if (!IS_ERR(priv->bus_clk))
 		clk_disable_unprepare(priv->bus_clk);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
