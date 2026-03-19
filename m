Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2355D1088E5E
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 02:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zDb71joxlILHd0gTScHxVTy0jkM5rD8rnkM2yBhUm1k=; b=Qjr2RJm77BNlxW
	CbwXZFRns5SROzr1Ky/OygwU0qzxEK7Yk5A+5CaIGO0+1REQ1MITfnvQi1C7KAJ+uhGGmd2RA1wcT
	ie8wnrLNX9+6VdPlOoSK61MJt9jdYKWvBVHn7f9llpdMLGDJqZZ8pNq/V09b1zzuiE4ulpjcSkV6u
	+hEI7cKqvPgdK3CUxioBxbUlnI/7WOk4DuE6LiC50lIEg/Umso6aiikOcVOpB8SZL/jDgdw327VzI
	dIQG+SZi9Gipttzo65O1G3alQa8S2d0Fs+P0UCb4LJMlAVWQTZEhrXySJWS9lbnHsPPnjkB9xoaU5
	jS+6esSa8a0IueUrcbTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w32kW-00000009eAe-3vs6;
	Thu, 19 Mar 2026 02:04:36 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w32kS-00000009e5D-3Stk;
	Thu, 19 Mar 2026 02:04:34 +0000
X-UUID: f1f59a80233711f1a21c59e7364eecb8-20260319
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:eaaaae9a-a5c7-4de2-aedf-1e0a176cf0cd,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:c402c4563c8dcd41f9f9f590a804b60b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f1f59a80233711f1a21c59e7364eecb8-20260319
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1584200364; Thu, 19 Mar 2026 10:04:21 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	broonie@kernel.org,
	Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v5 06/17] spi: npcm-pspi: Simplify clock handling with devm_clk_get_enabled()
Date: Thu, 19 Mar 2026 10:04:02 +0800
Message-Id: <f187bea2b7809e0b40aba6771a7c6b92c08a5e08.1773885292.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773885292.git.xiaopei01@kylinos.cn>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_190433_172463_B07FAE08 
X-CRM114-Status: GOOD (  12.21  )
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

Replace devm_clk_get() followed by clk_prepare_enable() with
devm_clk_get_enabled() for the clock. This reduces boilerplate code
and error handling, as the managed API automatically disables the clock
when the device is removed or if probe fails.

Remove the now-unnecessary clk_disable_unprepare() calls from the
probe error path and the remove callback. Adjust error handling labels
accordingly.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-npcm-pspi.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
index e60b3cc398ec..ae7f9a70fbcf 100644
--- a/drivers/spi/spi-npcm-pspi.c
+++ b/drivers/spi/spi-npcm-pspi.c
@@ -361,27 +361,23 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 		goto out_host_put;
 	}
 
-	priv->clk = devm_clk_get(&pdev->dev, NULL);
+	priv->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(priv->clk)) {
-		dev_err(&pdev->dev, "failed to get clock\n");
+		dev_err(&pdev->dev, "failed to enable clock\n");
 		ret = PTR_ERR(priv->clk);
 		goto out_host_put;
 	}
 
-	ret = clk_prepare_enable(priv->clk);
-	if (ret)
-		goto out_host_put;
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = irq;
-		goto out_disable_clk;
+		goto out_host_put;
 	}
 
 	priv->reset = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(priv->reset)) {
 		ret = PTR_ERR(priv->reset);
-		goto out_disable_clk;
+		goto out_host_put;
 	}
 
 	/* reset SPI-HW block */
@@ -391,7 +387,7 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 			       "npcm-pspi", priv);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request IRQ\n");
-		goto out_disable_clk;
+		goto out_host_put;
 	}
 
 	init_completion(&priv->xfer_done);
@@ -415,15 +411,12 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 
 	ret = devm_spi_register_controller(&pdev->dev, host);
 	if (ret)
-		goto out_disable_clk;
+		goto out_host_put;
 
 	pr_info("NPCM Peripheral SPI %d probed\n", host->bus_num);
 
 	return 0;
 
-out_disable_clk:
-	clk_disable_unprepare(priv->clk);
-
 out_host_put:
 	spi_controller_put(host);
 	return ret;
@@ -435,7 +428,6 @@ static void npcm_pspi_remove(struct platform_device *pdev)
 	struct npcm_pspi *priv = spi_controller_get_devdata(host);
 
 	npcm_pspi_reset_hw(priv);
-	clk_disable_unprepare(priv->clk);
 }
 
 static const struct of_device_id npcm_pspi_match[] = {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
