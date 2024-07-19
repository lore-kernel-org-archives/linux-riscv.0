Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5C9C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 08:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ka5sRwEKlOe04kJPllI6/jH6Y2c5nq+eBISSv2Jzz0=; b=Ctp0uoQMc03HvT
	N/JSWoxlUKm6vuAcwppRjsa5q1lXDBK5ONLAdbmufp5xzPhbrGXYZRCs8ASNNQ37LAyillUZyJiMw
	XNRHC9F0lN1pdMiQCBs2SrJtSzTBo/e+aI3dwsWcf+E+kO64lzvDlCvEiN/IZLkByT+PhkGQpj572
	qXqK/WSwroZTRtTEja0KlR9W2VPHaBPMYVZQeJejf+/+oxQMj195Cla98InzbP779lMbgz3hqiKIt
	1xjZPDGtdntHGKijg9XoQEDUPxUBzAH5Xa0FvFzqBwG9VU4UokfL+3YDZkS0fyyvN9PeoGah23kGM
	xsFlxlqArxgYoRckuigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjGJ-000000028fK-0yne;
	Fri, 19 Jul 2024 08:46:47 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjGF-000000028dk-3V6R
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 08:46:45 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-26106ec9336so386702fac.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 01:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721378803; x=1721983603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOIP4q3AyZUicquYYeZDzgyZKG/BRB5AHyNydm99StI=;
        b=NaCp5RaVz7oNBTkidqoQpPPQKAoAUaLTwB/+D+1WCzn/dI5eJufoVuSRSnTxkrnTVP
         zxtnZbknQco8xLZEXkVPpuuNNNfTHrG47ofEEExO2fYZOUO9hdj7DO3D1L3slGEVkctq
         3BOwYwk7M6o9/ETBKaVffUQ7HKCKenSubnM6jtWM276RP1QFatz3oB01rkcYHXTsm1a9
         Kf4Pg3sViCZCj0rCnSjNoQyxkwjlsqkFmeRmZ06PDX5R/HVwOe2ETKLPz7mvKUlsNUOT
         S9CrbVyBoKloMIxOAThZTJtCv3ybx10OdrQY/EKLED7vxR4jvkbjkMjU6tEN/yN+c7Jx
         T7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721378803; x=1721983603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOIP4q3AyZUicquYYeZDzgyZKG/BRB5AHyNydm99StI=;
        b=CMCdi9yvTLfzV9z/8UirishrOYSX1S3qrONa5zvWF+9p8XqMHuONQqqEBbrWxbEEIY
         x34ksmbPoikh99g2+wrqAeMMjpQ2j6T9nEftfYTNGqVx/K7E5kzZ6Uc+GdNRftt2iNhf
         dW38znh4IPdRtZUrsZPk7KJNTuTsP+CM09UlhUl78MiRg7z/7TjC7JE3gMij00b5RLdj
         YhLWlicwQUx086YsV3U4iIiFn2qjnSfedNt5VLyoc5wavwxpBskXQfKVoVk5tojz8PFv
         CNNbGq48irBDKlPY2mfVd5y8CPZ+uVAIHk+lA+1V6jXBGDhoBI3qPYlI9/HvYRT1fHuZ
         dRJw==
X-Forwarded-Encrypted: i=1; AJvYcCV4skgYYZVDBL9qNv8Qhg5glzfLQ/1aiRZ7CjnVVqBq5bafYPvFuh08Ycud0WZQxeqar1zU/KGPvI5zvOHyYrujsND7NAkGdrB0Otbt3fKv
X-Gm-Message-State: AOJu0YwszvUSScUFTkZTeqtIc0bTH7AWQs6Ynoiuhodqldm8U38kwmIg
	ynaygM6tV8uaIyLIsE2kp81PA4P8JMrwAPd0H74k4uK3doWfOfQi
X-Google-Smtp-Source: AGHT+IEZdVebCRmDzN7T5YViaIUMpQsDsevKAw7S7+jm57mupstNstZ/ad5JpT9pxRIYtp3j59AuZQ==
X-Received: by 2002:a05:6871:20c:b0:260:ed20:dc8c with SMTP id 586e51a60fabf-260ed3177f1mr4045642fac.52.1721378802656;
        Fri, 19 Jul 2024 01:46:42 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2610c7d3cbdsm233860fac.33.2024.07.19.01.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 01:46:42 -0700 (PDT)
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
Subject: [PATCH v5 5/8] mmc: sdhci-of-dwcmshc: add dwcmshc_pltfm_data
Date: Fri, 19 Jul 2024 16:46:35 +0800
Message-Id: <63b66e64c22b5ef73df2d0aa2f5a992d562898d8.1721377374.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721377374.git.unicorn_wang@outlook.com>
References: <cover.1721377374.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_014643_908837_2825BE62 
X-CRM114-Status: GOOD (  14.56  )
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

Abstract dwcmshc_pltfm_data to hold the sdhci_pltfm_data
plus some comoon operations of soc such as init/postinit.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/mmc/host/sdhci-of-dwcmshc.c | 83 +++++++++++++++++------------
 1 file changed, 50 insertions(+), 33 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index 30e4cea8a058..972d03ec60e3 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -205,6 +205,8 @@ struct rk35xx_priv {
 
 #define DWCMSHC_MAX_OTHER_CLKS 3
 
+struct dwcmshc_pltfm_data;
+
 struct dwcmshc_priv {
 	struct clk	*bus_clk;
 	int vendor_specific_area1; /* P_VENDOR_SPECIFIC_AREA1 reg */
@@ -218,6 +220,12 @@ struct dwcmshc_priv {
 	u16 flags;
 };
 
+struct dwcmshc_pltfm_data {
+	const struct sdhci_pltfm_data pdata;
+	int (*init)(struct device *dev, struct sdhci_host *host, struct dwcmshc_priv *dwc_priv);
+	void (*postinit)(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv);
+};
+
 static int dwcmshc_get_enable_other_clks(struct device *dev,
 					 struct dwcmshc_priv *priv,
 					 int num_clks,
@@ -1048,39 +1056,52 @@ static const struct sdhci_ops sdhci_dwcmshc_cv18xx_ops = {
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
@@ -1196,7 +1217,7 @@ static int dwcmshc_probe(struct platform_device *pdev)
 	struct sdhci_pltfm_host *pltfm_host;
 	struct sdhci_host *host;
 	struct dwcmshc_priv *priv;
-	const struct sdhci_pltfm_data *pltfm_data;
+	const struct dwcmshc_pltfm_data *pltfm_data;
 	int err;
 	u32 extra, caps;
 
@@ -1206,7 +1227,7 @@ static int dwcmshc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	host = sdhci_pltfm_init(pdev, pltfm_data,
+	host = sdhci_pltfm_init(pdev, &pltfm_data->pdata,
 				sizeof(struct dwcmshc_priv));
 	if (IS_ERR(host))
 		return PTR_ERR(host);
@@ -1251,16 +1272,12 @@ static int dwcmshc_probe(struct platform_device *pdev)
 	host->mmc_host_ops.hs400_enhanced_strobe = dwcmshc_hs400_enhanced_strobe;
 	host->mmc_host_ops.execute_tuning = dwcmshc_execute_tuning;
 
-	if (pltfm_data == &sdhci_dwcmshc_rk35xx_pdata) {
-		err = dwcmshc_rk35xx_init(dev, host, priv);
+	if (pltfm_data->init) {
+		err = pltfm_data->init(&pdev->dev, host, priv);
 		if (err)
 			goto err_clk;
 	}
 
-	if (pltfm_data == &sdhci_dwcmshc_th1520_pdata) {
-		th1520_init(dev, host, priv);
-	}
-
 #ifdef CONFIG_ACPI
 	if (pltfm_data == &sdhci_dwcmshc_bf3_pdata)
 		sdhci_enable_v4_mode(host);
@@ -1288,8 +1305,8 @@ static int dwcmshc_probe(struct platform_device *pdev)
 		dwcmshc_cqhci_init(host, pdev);
 	}
 
-	if (priv->priv)
-		dwcmshc_rk35xx_postinit(host, priv);
+	if (pltfm_data->postinit)
+		pltfm_data->postinit(host, priv);
 
 	err = __sdhci_add_host(host);
 	if (err)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
