Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712E3C3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 09:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zLXA2TbagxSiIrhbnb/5uN3THnXHnBHJ2DB/n0B7P5o=; b=uxL6sloPDCed+Q
	e2BxyCnWv+56sxnLR2q7URybR6Fcuq4KDVLZbiC5A7FMDRAo3Dh12/+iewB9UiSOI1wnbxuYpfXCd
	0vREmID5PA1f7YX7bEKjZcGXap5Im0b9oHxHh8EkBqtcYTi6PCsKjriTG3iYsl7pjNqhjWjk9URfZ
	puWCcwYb4256XzdHsc3UhmmmVsqPzHhJiRMpi0Bxo8M4Jd1y7yIxvSdUIDe34+fJdvvVoGYe5Bqrg
	KGD6XKAu2m694dNqYP+EgxRjWRN+FZNOuTqZOvbvt8gRMc7zAmmBpG6za2MhWSE2qi4k887Ijh+28
	Ui9PYffZvCk3w3UC6qFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1satrQ-0000000FFm0-2UVW;
	Mon, 05 Aug 2024 09:18:36 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1satrN-0000000FFl5-11OB
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 09:18:34 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5d5d0535396so5529493eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 02:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722849512; x=1723454312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmKZrnXukkShyh9UMVBbKCtUheE+m0Zm5Rm16FZ9/eQ=;
        b=Qk4onQmrasrk/mn5vPNVTWO2fHveJda/ef8wZd+HJEizRU40wxZ0SaNivJ3aWZU8aO
         iU7PlLa4U4tDOaAo7YPOrkBm5c5NSKHIfx8bVMxWI1fvsKOiQk2ODcD3Ku3qXdcWhp6k
         3mJHCZOO0opC1ImG9tnNX7HfVnq4z1Z5uy3eGyiZwswQ2tvG3qu2hMVIFE4eB9UPd+cs
         BLbrvRGSxeIrerTTrixY3t1l6qhPfygrNR+cJviZRn2PWkQELsGK1UuOP1WV/eEu74fS
         rf4CWK8UDhDGEpSr2UhKIOuf2jXkGTtCPxMP3aiPMESvVYNbXh1QHXi5DAnIeLsXPOpR
         s5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722849512; x=1723454312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmKZrnXukkShyh9UMVBbKCtUheE+m0Zm5Rm16FZ9/eQ=;
        b=IU2JYFWwFwsuoonNSU4mzrrt347UXM/VPcmjs+2J0PLzM9FhkMaLgTKsFhxTgxfYqy
         O6LlRNK9vrUfiqsAbsm9h5gFMkJob7+RKKJxFlE7MrC8jUpiw4bJThOyBQq6VvFY3OkK
         5XiBFqBlTX3/ZwkPrj6cCZIfGgHzWERLp2Xu8m5BSFCk29HVbv7a3G2+JZnTSz7XgjWR
         RsZr4i7oS9n9GwjwmzGl+8PkHivOYb3EK8yT8eixJYJqFt24wt+gJQz4E4vw7dedKhEZ
         czcFhd5hEcSeKj3ydKr85MdcjgCFw8omE4cGT6+t+f+QOgnId/PtFDUy015+HvLUiaZB
         +JkA==
X-Forwarded-Encrypted: i=1; AJvYcCXcRgSYRovSL51ijkSzszAhyqXL+1JykHuFm8L7Afxbg4imd4XfcDnEKeiPn1KaTj2ze9fFIpz4Z26wM04uoHo1FruJGe0DY0k05yLlfur7
X-Gm-Message-State: AOJu0YzD7zBTWtmVLpmoU0QZJVS5/Xw84hqaFHRgNsSACkUToOVAUdBC
	gff4/RCmuu9J02j1Xh+6Bw7QotK0QZyquYdJSe1aJWALBLxvV+MX
X-Google-Smtp-Source: AGHT+IHt5AjerbbszibT04CTu+Jr9V86wxjhGeMFu/4kABcPnvtNQ1BSOPHfj2k8UNkcshgOsmiD1Q==
X-Received: by 2002:a05:6820:1504:b0:5d5:d5ad:35f8 with SMTP id 006d021491bc7-5d67155434dmr12279312eaf.8.1722849511973;
        Mon, 05 Aug 2024 02:18:31 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5d762052c46sm1902121eaf.27.2024.08.05.02.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 02:18:31 -0700 (PDT)
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
Subject: [PATCH v6 4/8] mmc: sdhci-of-dwcmshc: factor out code into dwcmshc_rk35xx_init
Date: Mon,  5 Aug 2024 17:18:19 +0800
Message-Id: <4f1f2fa403ce7f0b4d79afb7d7e8a1690cde5d6c.1722847198.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722847198.git.unicorn_wang@outlook.com>
References: <cover.1722847198.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_021833_307952_7D2E6704 
X-CRM114-Status: GOOD (  13.67  )
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
Tested-by: Drew Fustini <drew@pdp7.com> # TH1520
Tested-by: Inochi Amaoto <inochiama@outlook.com> # Duo and Huashan Pi
---
 drivers/mmc/host/sdhci-of-dwcmshc.c | 34 ++++++++++++++---------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index b272ec2ab232..55fba5ef37ba 100644
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
+	if (pltfm_data == &sdhci_dwcmshc_rk35xx_pdata)
 		dwcmshc_rk35xx_postinit(host, priv);
 
 	err = __sdhci_add_host(host);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
