Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2742AC3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 08:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yl139mWJo63Hw3oclmrFYDKw8iQ0fNm5qW4+gZxGKXM=; b=CIV1jrOUNxmGPp
	09f2Vts/AzDGhXiSmsDdIzvk8xhbvAd+w/gGOpTYInpGbcxiAXRJwotH0F53l27vBqqadilf/R4ed
	AKyBs5ofnM9yhcwxzNH6RqOrMsj471D9sD0AYS5It+tdqQURGGn7JDh4Fw/ZL3j3Lpquvtbc5zKc2
	VKE0/Ybba32H4Q3oP0/QF9HeUbBqNs/wNH9z8yVouSsIzTlBiavcBwvXW4NJ9nvETLCtqbWylR/yx
	oVtF2iDgAA1KC9kZREdzv9Lkc2qu6luUDEfwYXW/JqCoER6ek9qm3WwbETfu4gNoYD+y/PLvfWFpv
	txntKx9Y0CBnhhwck1RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjFQ-000000028Il-2jAK;
	Fri, 19 Jul 2024 08:45:52 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjFN-000000028HW-26by
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 08:45:51 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5cebd3bd468so847770eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 01:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721378748; x=1721983548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uqvBP32xV6qRefoyJcm+diCLzvCyHwlNjo5p8QbsSQ=;
        b=Z1DZ5F1tAmgLdlDKkbwozufNud0BdLMQrtZw7QbfVIACBMqNo8vm7w0WN2snrOGE7H
         I1+zRgqXmBM0Ebh218Xmz/LavC7K8jiO+Ubw2rxoL0fGLO6Xw7o0o8v8kAm/mbFH0F/z
         0+4cZvvi547pp5mIEnzXwt5h+UvOia75CRBPcZpXiWa29JZJCKpYgyDXl2Z9bzej4lhv
         +03mWLdwfT2jTiEfhDe29lzmNioHaZDFolONWEkDukXNXjG1p9u9I0ZIR0qbdwy+rQo8
         DujReMrMiDIVoQ84dx39r9NjMlLWyCOK79pVTb/kduTInDdFA/WgdewVd6qysN2LwGPw
         /SYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721378748; x=1721983548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uqvBP32xV6qRefoyJcm+diCLzvCyHwlNjo5p8QbsSQ=;
        b=ZaPuXzQWtiVuKY8ANBcrB1UhtHVCgbvsScWkXAa88ih0Ha/kLSSc/qt8YKvtSoE/8B
         z/txJDCN5rS+TtFZt08xuzcN9KgxJlrW1huiSv+L5T2GE5xLxmqAPOf+Quc0Bi65uIR7
         44gf8RUh07RP/lpbd6JvLvqgHsiZKMoNrY6S5RcduICsmEM8zoW0YVZjOzfzfl/Y6hOb
         EVCrTgNKwT3OO3xue+ZSJXjQs8nw6bRhYaV0fSZRffbEWSlrB4bhlJZZ30YTgHSejrA7
         3xyXjhJrHqsU/fsLXRbwAfxcHhnxIqHHXpMCBgMYx5MOpYkXDt2ILjkTzrrhjj8sVAlG
         /J2g==
X-Forwarded-Encrypted: i=1; AJvYcCUCVyRVCapC+LYlOc2Z1JzJt0Nn6h2SolQp6GBbWPuYQ6/TOV7wo2699oLhI7t/ppDn51ptv58W5sOHS5RZQda6GM26XtgvHAUUw64YBR6G
X-Gm-Message-State: AOJu0YzLHko2xMkCD1N8aP0aROVfO2EBcNUkqHVGwhYJk7L2RhzIbJtv
	Sgn2UwWLnoUrVgy5WTiH8BPjgc33ksbwmcG3ko+49nwPCwBolLmB
X-Google-Smtp-Source: AGHT+IHXTA/zgkdr+H1RuzNCjWddediAA0SHwbiJ+VeYitWvUf/Oywvo4d5FAaFRIYS1Lp9cmPpbZA==
X-Received: by 2002:a05:6820:270f:b0:5cd:2e7:cc6 with SMTP id 006d021491bc7-5d41cade049mr8811826eaf.8.1721378748386;
        Fri, 19 Jul 2024 01:45:48 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5d55a7fa65esm179536eaf.5.2024.07.19.01.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 01:45:48 -0700 (PDT)
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
Subject: [PATCH v5 2/8] mmc: sdhci-of-dwcmshc: move two rk35xx functions
Date: Fri, 19 Jul 2024 16:45:41 +0800
Message-Id: <ebfe6fb90fb85a0f203d9816211eccd23d5a5330.1721377374.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721377374.git.unicorn_wang@outlook.com>
References: <cover.1721377374.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_014549_570791_BE0BB85D 
X-CRM114-Status: GOOD (  15.39  )
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

This patch just move dwcmshc_rk35xx_init() and
dwcmshc_rk35xx_postinit() to put the functions
of rk35xx together as much as possible.

This change is an intermediate process before
further modification.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/mmc/host/sdhci-of-dwcmshc.c | 90 ++++++++++++++---------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index fb4076c19ed5..903fe06050e4 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -711,6 +711,51 @@ static void rk35xx_sdhci_reset(struct sdhci_host *host, u8 mask)
 	sdhci_reset(host, mask);
 }
 
+static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
+{
+	static const char * const clk_ids[] = {"axi", "block", "timer"};
+	struct rk35xx_priv *priv = dwc_priv->priv;
+	int err;
+
+	priv->reset = devm_reset_control_array_get_optional_exclusive(mmc_dev(host->mmc));
+	if (IS_ERR(priv->reset)) {
+		err = PTR_ERR(priv->reset);
+		dev_err(mmc_dev(host->mmc), "failed to get reset control %d\n", err);
+		return err;
+	}
+
+	err = dwcmshc_get_enable_other_clks(mmc_dev(host->mmc), dwc_priv,
+					    ARRAY_SIZE(clk_ids), clk_ids);
+	if (err)
+		return err;
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
 static int th1520_execute_tuning(struct sdhci_host *host, u32 opcode)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -1064,51 +1109,6 @@ static void dwcmshc_cqhci_init(struct sdhci_host *host, struct platform_device *
 	host->mmc->caps2 &= ~(MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD);
 }
 
-static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
-{
-	static const char * const clk_ids[] = {"axi", "block", "timer"};
-	struct rk35xx_priv *priv = dwc_priv->priv;
-	int err;
-
-	priv->reset = devm_reset_control_array_get_optional_exclusive(mmc_dev(host->mmc));
-	if (IS_ERR(priv->reset)) {
-		err = PTR_ERR(priv->reset);
-		dev_err(mmc_dev(host->mmc), "failed to get reset control %d\n", err);
-		return err;
-	}
-
-	err = dwcmshc_get_enable_other_clks(mmc_dev(host->mmc), dwc_priv,
-					    ARRAY_SIZE(clk_ids), clk_ids);
-	if (err)
-		return err;
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
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
