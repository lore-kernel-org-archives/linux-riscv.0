Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFD8C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 08:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R89HXe+x/IYPIYA/lcUlbABGlgFfOaxV4bCe8Ke9I60=; b=YDFsRKOULpfphD
	mEsLujBbHSXKnj2gVC7P3pHyDEVNC0zSdbi1YT6qxOJH8NtJjQhOEZBBWEaL265BRFuUgbmjzvJ53
	+hywyUKh2ocea2S+tkMSHvYNOQ0wOZ7z9nejOe83vo2mELNgWk7oLmgD6SZVgQkq94LJGhug0BOWC
	RiNv+TsJqLldxCdQ7QeqlomvspZacpVv1+EpXBr4lQZL3EOJQLvoXhFgGzfrMjws71ODNC6U+MGQX
	WUcRnQ+ZT6kXZeozcyMDW1sRt4Hk22S2puyBWg7PyUGow9du3PzOiicmj8zDKQUYlT7mfQZHxEM/z
	ty7eGaS7Ci+iZM7bfZug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjG0-000000028X9-0xK9;
	Fri, 19 Jul 2024 08:46:28 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjFw-000000028Um-3Nf6
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 08:46:26 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-260f863109cso731596fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 01:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721378784; x=1721983584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyrv8ONiR+CGVEjcg54gy7pcW422aJnTfPt/rMxTHl0=;
        b=Yv+ulkhQUq5/6vRNgs7WTU0k0iP8XpqJnTNWoMcHyWXP0xBExFu/GsuJDSsdo8mOXt
         Q/aSX7lG/k5S3M3/1uQcZwKScAjF+ehL2wq7hZdfxwJ44XQOVFFlYNgwNTRvUcQ8epEU
         oRF157kqkfG8gLb4GPwKUmNg4HAPTKglHZL5SSoIxDevuPi2tk46bdp1XN3tbbT8Bteh
         4jLeE0+KVNPVtBliGAwE9LP5cPIyQ4WZhOMaMVCJU8L3qSYVG/W3KxZRe8EgtYC5l+/R
         7RVuZ1ikqnQ5lz0yh9+qVbDZT7tLpEuJdpwWGp7eksswmBwPUS/j6jiYKBGw8G75nlpy
         0XGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721378784; x=1721983584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyrv8ONiR+CGVEjcg54gy7pcW422aJnTfPt/rMxTHl0=;
        b=BKoiGECU3sY/Ra7uMc0R1rKSufWwST3NeRgj/SwfWYGArWyb1USqcyzp1J7z9mu4r+
         TBkpMQtRf6rqz7kUGP81DJdCFLLo1tCVQMd0c2k1tI0x0H7NgQHDN6t0LVapvvUEH1wM
         aEqR3vGF4r1mJzIuLC2Zxc86NhXcFlyvms9MQxxtdKLl8v2j+FEqlctoGLOmFJX2Jiga
         x9yophzi8xDZTwlFtRcwFPNlVcIEvOcuCX5jdEh7QXomdvmddCgp9WVbECRXM3d8Yimr
         0ECP1cKCglr+tVSywI7iyUEK6fNyKvqWsjxda/VFmHjat8IsgpQH0zt1IGtvLYhdN7oC
         ARMA==
X-Forwarded-Encrypted: i=1; AJvYcCVu/UBzlEqym/bjvkTakz7V2E7GLpcEeEHeH6qsM9N4Kq0pLnhtsDc6OKFZHdclk1U3bHk8fpxToKMsEPlo9xq5saGhHMQWOHnWQLT8NFDk
X-Gm-Message-State: AOJu0YwK2T3QCIXXY3fe8e7zLmB7q709P7KzovBAI+Aoloj6OORD/Ddx
	sVCxpukdzAaquWyH+729Qo59MRMm7eObQfIETOO26YLJ7VDNOUaB
X-Google-Smtp-Source: AGHT+IF9PHnW0tbx/EYsOKZWy15W7XCeU6+dIQCu4I09neyxp7NYvAxhHAoLBPFmWHyDWCmNL8yNXA==
X-Received: by 2002:a05:6870:ac1e:b0:25a:3fbf:6808 with SMTP id 586e51a60fabf-260d946484bmr6154141fac.41.1721378783616;
        Fri, 19 Jul 2024 01:46:23 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2610c7d3b94sm230863fac.30.2024.07.19.01.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 01:46:23 -0700 (PDT)
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
Subject: [PATCH v5 4/8] mmc: sdhci-of-dwcmshc: factor out code into dwcmshc_rk35xx_init
Date: Fri, 19 Jul 2024 16:46:15 +0800
Message-Id: <1bb79db9f05ade17d269acefb6dcdce455236b92.1721377374.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721377374.git.unicorn_wang@outlook.com>
References: <cover.1721377374.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_014624_870732_AF36B4C5 
X-CRM114-Status: GOOD (  13.97  )
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

Continue factor out code fron probe into dwcmshc_rk35xx_init.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/mmc/host/sdhci-of-dwcmshc.c | 34 ++++++++++++++---------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index bb0adc2ee325..30e4cea8a058 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -711,12 +711,22 @@ static void rk35xx_sdhci_reset(struct sdhci_host *host, u8 mask)
 	sdhci_reset(host, mask);
 }
 
-static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
+static int dwcmshc_rk35xx_init(struct device *dev, struct sdhci_host *host,
+			       struct dwcmshc_priv *dwc_priv)
 {
 	static const char * const clk_ids[] = {"axi", "block", "timer"};
-	struct rk35xx_priv *priv = dwc_priv->priv;
+	struct rk35xx_priv *priv;
 	int err;
 
+	priv = devm_kzalloc(dev, sizeof(struct rk35xx_priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	if (of_device_is_compatible(dev->of_node, "rockchip,rk3588-dwcmshc"))
+		priv->devtype = DWCMSHC_RK3588;
+	else
+		priv->devtype = DWCMSHC_RK3568;
+
 	priv->reset = devm_reset_control_array_get_optional_exclusive(mmc_dev(host->mmc));
 	if (IS_ERR(priv->reset)) {
 		err = PTR_ERR(priv->reset);
@@ -739,6 +749,8 @@ static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc
 	sdhci_writel(host, 0, DWCMSHC_EMMC_DLL_TXCLK);
 	sdhci_writel(host, 0, DWCMSHC_EMMC_DLL_STRBIN);
 
+	dwc_priv->priv = priv;
+
 	return 0;
 }
 
@@ -1184,7 +1196,6 @@ static int dwcmshc_probe(struct platform_device *pdev)
 	struct sdhci_pltfm_host *pltfm_host;
 	struct sdhci_host *host;
 	struct dwcmshc_priv *priv;
-	struct rk35xx_priv *rk_priv = NULL;
 	const struct sdhci_pltfm_data *pltfm_data;
 	int err;
 	u32 extra, caps;
@@ -1241,20 +1252,7 @@ static int dwcmshc_probe(struct platform_device *pdev)
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
-		err = dwcmshc_rk35xx_init(host, priv);
+		err = dwcmshc_rk35xx_init(dev, host, priv);
 		if (err)
 			goto err_clk;
 	}
@@ -1290,7 +1288,7 @@ static int dwcmshc_probe(struct platform_device *pdev)
 		dwcmshc_cqhci_init(host, pdev);
 	}
 
-	if (rk_priv)
+	if (priv->priv)
 		dwcmshc_rk35xx_postinit(host, priv);
 
 	err = __sdhci_add_host(host);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
