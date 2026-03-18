Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6E210854D1
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 02:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pM2MI3ZruSzg2SMQOXk/0GGXjPSzV7UaeXkvjSoySoY=; b=A70zPM97r6UlHI
	/LmbtwqUptCaHjq8Pks1DIqraZ7NPxWO0yM4WFBMackjh9M/HyhTVY2iM6PApYloQ85pyWHcKF5vy
	qP61S6EMpnenmZAomlokBxerkQ6S3u6S5EuUxBRbjIvEbVU+c/kky3gVwBqLzyFoweN/dxtay0pEz
	B8J0X2fFotyCe03E/5VGCKhXpj2go17AlCZg1OcC9CDqvbtNnJbdGcO5gTYLV2ba3FJSjIoYqgUQv
	6+y2Dhk41hG5ZX3XnvwvOrrzX2Posq3KPsUjdZ7IOE13ImhpRxAFv9IWrhMxfaTJ4bTNdvwnJBmuJ
	qrDNvnYWfYTnvdSKsnTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2gpk-00000007cgU-3v3y;
	Wed, 18 Mar 2026 02:40:32 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2gpZ-00000007cS9-2ypA;
	Wed, 18 Mar 2026 02:40:25 +0000
X-UUID: c9eb4c20227311f1a21c59e7364eecb8-20260318
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:b7d41302-ab01-4193-84df-230ba0b64e3c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:75c250732db7212cdd6b3f17c9b3ba15,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c9eb4c20227311f1a21c59e7364eecb8-20260318
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 786414051; Wed, 18 Mar 2026 10:40:12 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v4 04/17] spi: img-spfi: Simplify clock handling with devm_clk_get_enabled()
Date: Wed, 18 Mar 2026 10:39:54 +0800
Message-Id: <b928f4ab5500b3fac89bf97da5aee94b1460eaaa.1773801401.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773801401.git.xiaopei01@kylinos.cn>
References: <cover.1773801401.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_194022_930985_F28FF878 
X-CRM114-Status: GOOD (  10.18  )
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
devm_clk_get_enabled() for both "sys" and "spfi" clocks. This reduces
boilerplate code and error handling, as the managed API automatically
disables the clocks when the device is removed or if probe fails.

Remove the now-unnecessary clk_disable_unprepare() calls from the
probe error paths and the remove callback.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-img-spfi.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/spi/spi-img-spfi.c b/drivers/spi/spi-img-spfi.c
index 902fb64815c9..b45c6ceaffe2 100644
--- a/drivers/spi/spi-img-spfi.c
+++ b/drivers/spi/spi-img-spfi.c
@@ -557,24 +557,17 @@ static int img_spfi_probe(struct platform_device *pdev)
 	if (ret)
 		goto put_spi;
 
-	spfi->sys_clk = devm_clk_get(spfi->dev, "sys");
+	spfi->sys_clk = devm_clk_get_enabled(spfi->dev, "sys");
 	if (IS_ERR(spfi->sys_clk)) {
 		ret = PTR_ERR(spfi->sys_clk);
 		goto put_spi;
 	}
-	spfi->spfi_clk = devm_clk_get(spfi->dev, "spfi");
+	spfi->spfi_clk = devm_clk_get_enabled(spfi->dev, "spfi");
 	if (IS_ERR(spfi->spfi_clk)) {
 		ret = PTR_ERR(spfi->spfi_clk);
 		goto put_spi;
 	}
 
-	ret = clk_prepare_enable(spfi->sys_clk);
-	if (ret)
-		goto put_spi;
-	ret = clk_prepare_enable(spfi->spfi_clk);
-	if (ret)
-		goto disable_pclk;
-
 	spfi_reset(spfi);
 	/*
 	 * Only enable the error (IACCESS) interrupt.  In PIO mode we'll
@@ -655,9 +648,6 @@ static int img_spfi_probe(struct platform_device *pdev)
 		dma_release_channel(spfi->rx_ch);
 	if (spfi->tx_ch)
 		dma_release_channel(spfi->tx_ch);
-	clk_disable_unprepare(spfi->spfi_clk);
-disable_pclk:
-	clk_disable_unprepare(spfi->sys_clk);
 put_spi:
 	spi_controller_put(host);
 
@@ -675,10 +665,6 @@ static void img_spfi_remove(struct platform_device *pdev)
 		dma_release_channel(spfi->rx_ch);
 
 	pm_runtime_disable(spfi->dev);
-	if (!pm_runtime_status_suspended(spfi->dev)) {
-		clk_disable_unprepare(spfi->spfi_clk);
-		clk_disable_unprepare(spfi->sys_clk);
-	}
 }
 
 #ifdef CONFIG_PM
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
