Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D00C3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 09:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DEcsW0udYAG1rVLvg9KHxlttvzzpSS8aFK6KizFBaFU=; b=qZn1nSdEaaFsA+
	G/+MQhl+Xerm8JZI7VYKXrkfDNEN9OPRJGTUG67R0PgIKeZj24YlKEi2j7pisXO3Iieyl2utw+2vo
	Cqq0gv1rt2dDJvYKO5GmlQxFxOhoiD8Mmp3Ru7z3WoyQ2B7ay1wWmcp4LY/a85hwAw8QcrcVmVwSf
	8rx4/W6l3RP0n9lCwmeZLLDkuPo8/tlgwpCTBA/QbXgM1uPj+QWdWggRMrqb1Xp85Y8iIuA5a5991
	29Z9IOt/+7dhF6aXqZmGQxsXdKkKzTzbd/RvkBaIL/Jsuorv1DLnANUNDU5uomGNqVlE6Bx4WJznJ
	01Gb5pXiSk+++6ojwZVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1satqj-0000000FFWk-00FO;
	Mon, 05 Aug 2024 09:17:53 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1satqf-0000000FFW1-3u4T
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 09:17:51 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5d829d41a89so165602eaf.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 02:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722849468; x=1723454268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8k5uVQtfV8NUTOLFTh7RVXzJOtMU6EKEmam/qAPo2E=;
        b=csvFCDeT8COCnv40m0DRbFDGnlL1LTQqsKt7hUu6kmTja+67WjjfvgMvyYw0vGE7gT
         mnmJsBP9rvFbPlsC4Hih9nLXUxwLc6P1BDmLXs7ym/+ZptQCh0HLvvFIIzHXVw34bI+u
         kdTQ28eIH6X9rSjBVCCnWa0IsMvgLagWCZkvxve0gTCV2OxMjfHZMyp6tquoyRY2Gg0V
         kQV84Dkr4IYfNXnYxtuhjoS4jJtIRNXIrQlt2tYTpXsXeUgpq/5rCJkBu3ZyaDm5f3iL
         K4nckINf/K/F8dkAh6e9eXjcjqRXvMdRxZNKy5EhXp2Anh0xGAs2luyMo3Xwwjwh28sJ
         /+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722849468; x=1723454268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8k5uVQtfV8NUTOLFTh7RVXzJOtMU6EKEmam/qAPo2E=;
        b=uwgqolXpYgCyd5P/zeRYh5ztqh4N21r7os0Z0rp8At7ryPjPgRsqDlbd6FE2pYeAc/
         jfUavVp0keXojt0N9kE5GJ818a/W1V3tBU3FVk22fi5wN2tuYMvTJQLyyBjEmHV2kFkX
         Yc6u40MgLTQaESS8/G07ovtep5ie0HAW5PYVyuJgziOO5Wsk90FSZKv18VT6EcKss8+1
         zm5Vg4DqkHiEPIOnDuEGIRN5fkw6anUPhNKd/ABWwZAtLvVeOaJxRJ0pcAmmCtkX1Tnh
         rbnhiO0wfxCVnZdmGuETQL/RZNlwvAFV/AZgiiwY3jO14ztE78cKsXUjdfkSrNKKf0mR
         9++Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOW7tcrFJMfcUq1SzYNvhz+RdDpdMH516H1xA5Pv14FpLV7MNMvs3sHauycZE9+Ua7ay1T0Es/u5zOCv0yiBp/luFaUdm5nJkJTQDVqDEw
X-Gm-Message-State: AOJu0YwIZVf9KCZGbWi/UtYXaTK9tLmr4kUHNDJupx/E9um23xcLHuyk
	zhs9wIxTnfYhjHpr9SwxbgLha5lMj1O8EtGYHEbifqydApg1Hrd6
X-Google-Smtp-Source: AGHT+IEIp8y7lLQIWcjPh7pCGQ/cek2Jyros8ijAp0OQXpassUcZ+4MW/h9yG7N6uQtXrGDYyEcl1w==
X-Received: by 2002:a05:6820:4b0a:b0:5d8:ebe:23fb with SMTP id 006d021491bc7-5d80ebe26ffmr5871359eaf.7.1722849468666;
        Mon, 05 Aug 2024 02:17:48 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5d7478b084csm1882630eaf.0.2024.08.05.02.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 02:17:48 -0700 (PDT)
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
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Drew Fustini <drew@pdp7.com>
Subject: [PATCH v6 2/8] mmc: sdhci-of-dwcmshc: move two rk35xx functions
Date: Mon,  5 Aug 2024 17:17:40 +0800
Message-Id: <54204702d5febd3e867eb3544c36919fe4140a88.1722847198.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722847198.git.unicorn_wang@outlook.com>
References: <cover.1722847198.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_021749_996558_190C9DD6 
X-CRM114-Status: GOOD (  14.70  )
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
Tested-by: Drew Fustini <drew@pdp7.com> # TH1520
Tested-by: Inochi Amaoto <inochiama@outlook.com> # Duo and Huashan Pi
---
 drivers/mmc/host/sdhci-of-dwcmshc.c | 90 ++++++++++++++---------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index 35401616fb2e..a002636d51fd 100644
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
