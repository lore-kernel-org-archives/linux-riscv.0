Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA0CC3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 08:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pTkluMfjS4u6H54fU25WXWZef6dwPtI3fEkpV+R1b0Q=; b=cNfVdh7mqFgfhh
	dTtMckFCLv4qeEQx4rv66DbpNUXf+dcGOdB++FliRg2schtRNES/RcWJgesi6R1u6eOld7p7UV0EC
	bddUSMr5TUFdGN/1Y6iqFBBs95t5MoBZ2REZXpwsd4YN+tfYwgsJKVARIJvqcNnLAqldMEnm9TtnH
	gf9gEE79DBTcwsq5O7DGdBbIOUX+jgS8AWYjjkXowG52RJe/RkReJX0XidfyoSgLP/MGziXaBA5Cd
	ln4tG7IAhBzkhyuZQ6rM8xaORlhCDeTnE1mJcMWZfodYFzmCwmv53AF89FMGoOUnGexy4ItDSEqmC
	9a2tsK7iokzwqMBlhvig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjEt-00000002863-0TJx;
	Fri, 19 Jul 2024 08:45:19 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjEp-0000000285H-1EoN
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 08:45:17 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5cebd3bd468so847602eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 01:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721378714; x=1721983514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sELq+pnUeocm+uKlZ5dgRG6XUZ8Z2pYFiswc3B/vsIc=;
        b=A7w+5rURF0h8M8gv3rPJQdG2iHZtkXBMwisfZGXUIrQeShbrb9H5ZCTF9xW6oFejVP
         vRs+Px2qlKTnXCrAeebA0/ZqWqznghJ/hjELE6YiO5Eq3USu5iv4fou75qZ0ystIMJfa
         vJGGuuMdtWJV87jQ5NqyM8XWfqby262JP36ITNodxN+OCumyzqT2fhNcUmsHuLfUoOwI
         N1DL+2qRGpp2inscnOqyk+/RKeWB509/jIeYlGuAX9gtPH3cBeYy1VbKHOOmAr/F8x9g
         wrVs8JumlgBYBtBoSuZxLRr8MAOI3LvrmEu4CZLFT8qn8bos5ZVO4S4SuAgaiaTOErid
         EeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721378714; x=1721983514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sELq+pnUeocm+uKlZ5dgRG6XUZ8Z2pYFiswc3B/vsIc=;
        b=D2nQ+QTjJpbZ3pmyhwPTn/oFGC8SaG7m34f+ITtP43FPL8pAtOrVQYKUfnymIoTg1o
         2YfV83TEwXOLcIBSOUJPlv71AKwOfPxxu5osouRXlvKHIEfwuCdrH5a/gFI5NUyVNEc3
         k5z85itwOIoipOSytsr8OPRwkseu6kLySAaWw4jkyJcPzNTdfOb3+H/16ak9RVU3mcX/
         dzY5DaTg/0nSDTuaAM3R8qqPUTr5QUeB61DZByBCJ/4hwlSIu2pxcXx+3F1j0oTZW+eZ
         VOWEARhfKsd2NmHLWaxDBZ0akrVspzfwYwOkG9fbwkYEbpY0IEHkCWYUt0mxVSAFITM0
         DXug==
X-Forwarded-Encrypted: i=1; AJvYcCV3mq4Ceo3m34SCY8shijqhHtP1OUvS4MI/ZsnyptopaJlJ992v2W+YqrYo+f0ACw5RUeObp1V2/oNKv7VcOuKZ4Y89R1Ug1l3nePIKFuGy
X-Gm-Message-State: AOJu0YylxwhxSJRL4/DZrqnavGHUWfI1FT5KNg6Cf4zJCZ3EtN3soy4C
	qnqzEXIdLo8MSeWI+9XfG1cu/V8DESNewN2LlAZcg0Gzjgi5Tvv4
X-Google-Smtp-Source: AGHT+IGOQXJd+89L2geGpYfPlq1f04pQ5M8BxLCVshzWe/3mlon4W0Wf3vA0TEKVNMoepz+AwfvC7w==
X-Received: by 2002:a05:6820:1e81:b0:5c6:9293:ed8a with SMTP id 006d021491bc7-5d41c219082mr9049921eaf.6.1721378714072;
        Fri, 19 Jul 2024 01:45:14 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5d55a855091sm171342eaf.20.2024.07.19.01.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 01:45:13 -0700 (PDT)
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
Subject: [PATCH v5 1/8] mmc: sdhci-of-dwcmshc: add common bulk optional clocks support
Date: Fri, 19 Jul 2024 16:45:06 +0800
Message-Id: <e6d09bb8f0b02843967cd5c6d378ce5adbbf661f.1721377374.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721377374.git.unicorn_wang@outlook.com>
References: <cover.1721377374.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_014515_368675_BD8FB1BC 
X-CRM114-Status: GOOD (  19.06  )
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

In addition to the required core clock and optional
bus clock, the soc will expand its own clocks, so
the bulk clock mechanism is abstracted.

Note, I call the bulk clocks as "other clocks" due
to the bus clock has been called as "optional".

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/mmc/host/sdhci-of-dwcmshc.c | 91 ++++++++++++++++-------------
 1 file changed, 49 insertions(+), 42 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index e79aa4b3b6c3..fb4076c19ed5 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -108,7 +108,6 @@
 #define DLL_LOCK_WO_TMOUT(x) \
 	((((x) & DWCMSHC_EMMC_DLL_LOCKED) == DWCMSHC_EMMC_DLL_LOCKED) && \
 	(((x) & DWCMSHC_EMMC_DLL_TIMEOUT) == 0))
-#define RK35xx_MAX_CLKS 3
 
 /* PHY register area pointer */
 #define DWC_MSHC_PTR_PHY_R	0x300
@@ -199,23 +198,54 @@ enum dwcmshc_rk_type {
 };
 
 struct rk35xx_priv {
-	/* Rockchip specified optional clocks */
-	struct clk_bulk_data rockchip_clks[RK35xx_MAX_CLKS];
 	struct reset_control *reset;
 	enum dwcmshc_rk_type devtype;
 	u8 txclk_tapnum;
 };
 
+#define DWCMSHC_MAX_OTHER_CLKS 3
+
 struct dwcmshc_priv {
 	struct clk	*bus_clk;
 	int vendor_specific_area1; /* P_VENDOR_SPECIFIC_AREA1 reg */
 	int vendor_specific_area2; /* P_VENDOR_SPECIFIC_AREA2 reg */
 
+	int num_other_clks;
+	struct clk_bulk_data other_clks[DWCMSHC_MAX_OTHER_CLKS];
+
 	void *priv; /* pointer to SoC private stuff */
 	u16 delay_line;
 	u16 flags;
 };
 
+static int dwcmshc_get_enable_other_clks(struct device *dev,
+					 struct dwcmshc_priv *priv,
+					 int num_clks,
+					 const char * const clk_ids[])
+{
+	int err;
+
+	if (num_clks > DWCMSHC_MAX_OTHER_CLKS)
+		return -EINVAL;
+
+	for (int i = 0; i < num_clks; i++)
+		priv->other_clks[i].id = clk_ids[i];
+
+	err = devm_clk_bulk_get_optional(dev, num_clks, priv->other_clks);
+	if (err) {
+		dev_err(dev, "failed to get clocks %d\n", err);
+		return err;
+	}
+
+	err = clk_bulk_prepare_enable(num_clks, priv->other_clks);
+	if (err)
+		dev_err(dev, "failed to enable clocks %d\n", err);
+
+	priv->num_other_clks = num_clks;
+
+	return err;
+}
+
 /*
  * If DMA addr spans 128MB boundary, we split the DMA transfer into two
  * so that each DMA transfer doesn't exceed the boundary.
@@ -1036,8 +1066,9 @@ static void dwcmshc_cqhci_init(struct sdhci_host *host, struct platform_device *
 
 static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
 {
-	int err;
+	static const char * const clk_ids[] = {"axi", "block", "timer"};
 	struct rk35xx_priv *priv = dwc_priv->priv;
+	int err;
 
 	priv->reset = devm_reset_control_array_get_optional_exclusive(mmc_dev(host->mmc));
 	if (IS_ERR(priv->reset)) {
@@ -1046,21 +1077,10 @@ static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc
 		return err;
 	}
 
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
+	err = dwcmshc_get_enable_other_clks(mmc_dev(host->mmc), dwc_priv,
+					    ARRAY_SIZE(clk_ids), clk_ids);
+	if (err)
 		return err;
-	}
 
 	if (of_property_read_u8(mmc_dev(host->mmc)->of_node, "rockchip,txclk-tapnum",
 				&priv->txclk_tapnum))
@@ -1280,9 +1300,8 @@ static int dwcmshc_probe(struct platform_device *pdev)
 err_clk:
 	clk_disable_unprepare(pltfm_host->clk);
 	clk_disable_unprepare(priv->bus_clk);
-	if (rk_priv)
-		clk_bulk_disable_unprepare(RK35xx_MAX_CLKS,
-					   rk_priv->rockchip_clks);
+	if (priv->num_other_clks)
+		clk_bulk_disable_unprepare(priv->num_other_clks, priv->other_clks);
 free_pltfm:
 	sdhci_pltfm_free(pdev);
 	return err;
@@ -1304,7 +1323,6 @@ static void dwcmshc_remove(struct platform_device *pdev)
 	struct sdhci_host *host = platform_get_drvdata(pdev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
-	struct rk35xx_priv *rk_priv = priv->priv;
 
 	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
@@ -1316,9 +1334,7 @@ static void dwcmshc_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(pltfm_host->clk);
 	clk_disable_unprepare(priv->bus_clk);
-	if (rk_priv)
-		clk_bulk_disable_unprepare(RK35xx_MAX_CLKS,
-					   rk_priv->rockchip_clks);
+	clk_bulk_disable_unprepare(priv->num_other_clks, priv->other_clks);
 	sdhci_pltfm_free(pdev);
 }
 
@@ -1328,7 +1344,6 @@ static int dwcmshc_suspend(struct device *dev)
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
-	struct rk35xx_priv *rk_priv = priv->priv;
 	int ret;
 
 	pm_runtime_resume(dev);
@@ -1347,9 +1362,7 @@ static int dwcmshc_suspend(struct device *dev)
 	if (!IS_ERR(priv->bus_clk))
 		clk_disable_unprepare(priv->bus_clk);
 
-	if (rk_priv)
-		clk_bulk_disable_unprepare(RK35xx_MAX_CLKS,
-					   rk_priv->rockchip_clks);
+	clk_bulk_disable_unprepare(priv->num_other_clks, priv->other_clks);
 
 	return ret;
 }
@@ -1359,7 +1372,6 @@ static int dwcmshc_resume(struct device *dev)
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
-	struct rk35xx_priv *rk_priv = priv->priv;
 	int ret;
 
 	ret = clk_prepare_enable(pltfm_host->clk);
@@ -1372,29 +1384,24 @@ static int dwcmshc_resume(struct device *dev)
 			goto disable_clk;
 	}
 
-	if (rk_priv) {
-		ret = clk_bulk_prepare_enable(RK35xx_MAX_CLKS,
-					      rk_priv->rockchip_clks);
-		if (ret)
-			goto disable_bus_clk;
-	}
+	ret = clk_bulk_prepare_enable(priv->num_other_clks, priv->other_clks);
+	if (ret)
+		goto disable_bus_clk;
 
 	ret = sdhci_resume_host(host);
 	if (ret)
-		goto disable_rockchip_clks;
+		goto disable_other_clks;
 
 	if (host->mmc->caps2 & MMC_CAP2_CQE) {
 		ret = cqhci_resume(host->mmc);
 		if (ret)
-			goto disable_rockchip_clks;
+			goto disable_other_clks;
 	}
 
 	return 0;
 
-disable_rockchip_clks:
-	if (rk_priv)
-		clk_bulk_disable_unprepare(RK35xx_MAX_CLKS,
-					   rk_priv->rockchip_clks);
+disable_other_clks:
+	clk_bulk_disable_unprepare(priv->num_other_clks, priv->other_clks);
 disable_bus_clk:
 	if (!IS_ERR(priv->bus_clk))
 		clk_disable_unprepare(priv->bus_clk);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
