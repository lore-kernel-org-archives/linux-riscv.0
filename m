Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15D7C27C53
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 01:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGYHbN/SywFcql7lCUZD1mXq5xqG+5cbig0HzeD3900=; b=VLJ5IxQwJfutaq
	LD3w61w1cYVNZXnnj81Oo9bgWwov+VTuoAgdzaIG+yIhYOiPsJwGk13qBHv0xj2VshY181povvTvW
	3W/Sl+9G17j8kIr9+TrupM3LYg/PPEDj9rVPwnO8vyrocJsBIDaWQlsiHUqAh+A20YLE7d5BrAYNv
	e2n/qR60HYk+X/s4gRj1QfgTGQp69OzsQCmZq701pp6G3uPsOmPp/5Zb4z6iYQ0Z5tcO2LCv6Rv/2
	ALmAnqOPMfVMZ2laoyIXzj31ls8wEptOWVafqm8Kdw+A+A3JWUS84FWfOo13qchU61REUa9U36OBJ
	iqUw7mQdTqO4pZFsKkng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHZUY-0000000EkIX-1LaI;
	Thu, 13 Jun 2024 01:43:06 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHZUV-0000000EkH4-3HQp
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 01:43:05 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6f9fbec4fd9so283221a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 18:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718242980; x=1718847780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mEnEjULKQXk4yYyl4mjE8uROEMCabgqsBL99/Efhs4=;
        b=HzMbny7yDa2teSJt1DvvfieN2Q0k5WTH1gq2VIKITKtaRwz1psdLZ8N9H/vc/o4g4R
         8x9SD1VHl9lU/uZYYUXLoiH+PLToZdp/mCs8Vnb3w/kcNx9/w94Qg59ViDoUotm5olK6
         wmmqggv1e61t3RlB5UTQl6LigWCGaobzncOs6IwVSJURxAGBdRF/uC6VZmB+FvBafyNH
         jfPWRcGtjMoHwSaYspDGFhLkEzAEAo06g9bc4jACMAJd/dd2AEZcY+GUC8694slNdDug
         ++xaqJxqiU8fWa7BZZpFtD+yv5tJgXdK8EuGrpqixRSpLzKI9kIiZUY31Zy/D9rsziVD
         VGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718242980; x=1718847780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mEnEjULKQXk4yYyl4mjE8uROEMCabgqsBL99/Efhs4=;
        b=Xg8u0vNeZBxlmWeisgHlG6hxNoL2h5otfygojFr3TowqPjhOHZl1WdJ7vnMbJ/6R+d
         ilfexiJRl/BqOppLlX2dmPrjJ9gHOuwgL96+2hmHY91Td5fKe6pqXXCBbYFcZhwxrKkW
         PCe3I4C6xpjPMbQdU+xBd2XjMb5N+M77qxTtQrNehTmpbQDMjkdxbru20+bCqGvh6RId
         2KOEDg28p8h9rAjxlzSykZRIEVbk79C/4V3iSpsPK7KrXdAcxlPoji43kM2CiIDEMz4a
         iBseZwV/PkklUCQ5Qln37algvmBQA6fF0BnPH94DcEpdXweu6dR3CxA1wgtpm3YOCcg9
         jiyg==
X-Forwarded-Encrypted: i=1; AJvYcCWSmZmkajuHHqYptZzNwmz/eetFA14ET7VgT6G2ID0xAP1e0+6vhWXB8OflqeBcW2Ph1EpwEEioR8FPyyTicU+J6K2KuMyvK8ApSWMJmZOK
X-Gm-Message-State: AOJu0Yz2DoHri0Ug1UX03MSGpjve2luBRHhPdYsRqbbvOcc0N5I0auwd
	Nkch7QTE2N2pdO9sKaudnzoSpDyWNCsyHkaj5axwtisU5Yb4/btx
X-Google-Smtp-Source: AGHT+IH4rU9kj/OV/RIpQ8nZ2pKMrO1e3JSgSCb/lr/90ul/n7aHhOdX2QpKamzVPNeXcaH0mEH5EA==
X-Received: by 2002:a05:6830:205a:b0:6f9:72ca:fdc8 with SMTP id 46e09a7af769-6fa1c43ba6amr3001227a34.37.1718242979977;
        Wed, 12 Jun 2024 18:42:59 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd6292da28sm46575eaf.47.2024.06.12.18.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 18:42:59 -0700 (PDT)
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
Subject: [PATCH v3 2/4] mmc: sdhci-of-dwcmshc: unify the naming of soc helper functions
Date: Thu, 13 Jun 2024 09:42:52 +0800
Message-Id: <91adce8d020faa22a97719e8774dda01a58333e7.1718241495.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718241495.git.unicorn_wang@outlook.com>
References: <cover.1718241495.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_184303_853933_EAFA8993 
X-CRM114-Status: GOOD (  14.84  )
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

Continue another patch: "mmc: sdhci-of-dwcmshc: adjust positions
of helper routines".

The helper functions at the dwcmshc level are all prefixed with
"dwcmshc_", which is easier to identify, while the functions at
the soc level are more confusing. Now they are uniformly prefixed
with the soc type string, such as "rk35xx_", "th1520_", etc.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/mmc/host/sdhci-of-dwcmshc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index a68818f53786..346d2d323a05 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -193,7 +193,7 @@
 					 SDHCI_TRNS_BLK_CNT_EN | \
 					 SDHCI_TRNS_DMA)
 
-enum dwcmshc_rk_type {
+enum rk35xx_type {
 	DWCMSHC_RK3568,
 	DWCMSHC_RK3588,
 };
@@ -202,7 +202,7 @@ struct rk35xx_priv {
 	/* Rockchip specified optional clocks */
 	struct clk_bulk_data rockchip_clks[RK35xx_MAX_CLKS];
 	struct reset_control *reset;
-	enum dwcmshc_rk_type devtype;
+	enum rk35xx_type devtype;
 	u8 txclk_tapnum;
 };
 
@@ -621,7 +621,7 @@ static unsigned int rk35xx_get_max_clock(struct sdhci_host *host)
 	return clk_round_rate(pltfm_host->clk, ULONG_MAX);
 }
 
-static void dwcmshc_rk3568_set_clock(struct sdhci_host *host, unsigned int clock)
+static void rk3568_set_clock(struct sdhci_host *host, unsigned int clock)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct dwcmshc_priv *dwc_priv = sdhci_pltfm_priv(pltfm_host);
@@ -749,7 +749,7 @@ static void rk35xx_sdhci_reset(struct sdhci_host *host, u8 mask)
 	sdhci_reset(host, mask);
 }
 
-static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
+static int rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
 {
 	int err;
 	struct rk35xx_priv *priv = dwc_priv->priv;
@@ -790,7 +790,7 @@ static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc
 	return 0;
 }
 
-static void dwcmshc_rk35xx_postinit(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
+static void rk35xx_postinit(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
 {
 	/*
 	 * Don't support highspeed bus mode with low clk speed as we
@@ -1062,7 +1062,7 @@ static const struct sdhci_ops sdhci_dwcmshc_ops = {
 };
 
 static const struct sdhci_ops sdhci_dwcmshc_rk35xx_ops = {
-	.set_clock		= dwcmshc_rk3568_set_clock,
+	.set_clock		= rk3568_set_clock,
 	.set_bus_width		= sdhci_set_bus_width,
 	.set_uhs_signaling	= dwcmshc_set_uhs_signaling,
 	.get_max_clock		= rk35xx_get_max_clock,
@@ -1243,7 +1243,7 @@ static int dwcmshc_probe(struct platform_device *pdev)
 
 		priv->priv = rk_priv;
 
-		err = dwcmshc_rk35xx_init(host, priv);
+		err = rk35xx_init(host, priv);
 		if (err)
 			goto err_clk;
 	}
@@ -1300,7 +1300,7 @@ static int dwcmshc_probe(struct platform_device *pdev)
 	}
 
 	if (rk_priv)
-		dwcmshc_rk35xx_postinit(host, priv);
+		rk35xx_postinit(host, priv);
 
 	err = __sdhci_add_host(host);
 	if (err)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
