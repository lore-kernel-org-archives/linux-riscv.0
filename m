Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A36C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 02:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asXaO0tGaJKum7Gjs39YkqsDsQFMiVJeXFRNv2jnocs=; b=EEdbkWTK1iA1kx
	12zQgnpry6MbaxaPKn/DYiIbLMS5ALm5+Oe90IDTiKBWdm2SvoJaK2cmQp4XP/wucTIP91ATqmLzF
	0mBCotHUhd4sh9hWnl1phPg4SSr8Y9sMz3NsAAz1dgk8y2V6Pi1CTmtBCwc1k/zK60sS/6KsKcXn0
	Nu8iN0uL2VihP8ZHW+nY2cUglWekApknfgUM7+lWEBf7PrbHnS4Wawmyzv9astiw4jDBJ+YEAAGo0
	M6bZeoNZVPB+eldNQwUXnM57XWpqlxVaAmKiBWMUIICg06RLas1rbE3Fe3QnUnqKXiQZx/fnpgw8c
	3VBAUA6bjg52T/gKScTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBSPy-00Gtcf-6A; Wed, 13 Jul 2022 02:48:02 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBSPv-00GtYp-KC
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 02:48:01 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LjMQR5502zVfn4;
	Wed, 13 Jul 2022 10:44:15 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 13 Jul 2022 10:47:35 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 13 Jul
 2022 10:47:34 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<broonie@kernel.org>
Subject: [PATCH -next v2 3/3] spi: microchip-core: switch to use dev_err_probe()
Date: Wed, 13 Jul 2022 10:56:57 +0800
Message-ID: <20220713025657.3524506-4-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713025657.3524506-1-yangyingliang@huawei.com>
References: <20220713025657.3524506-1-yangyingliang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_194759_903564_E4C3F278 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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

Switch to use dev_err_probe() to simpify error path.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/spi/spi-microchip-core.c | 42 +++++++++++++-------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index 1a24e47f8305..ce4385330b19 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -539,48 +539,40 @@ static int mchp_corespi_probe(struct platform_device *pdev)
 		return PTR_ERR(spi->regs);
 
 	spi->irq = platform_get_irq(pdev, 0);
-	if (spi->irq <= 0) {
-		dev_err(&pdev->dev, "invalid IRQ %d for SPI controller\n", spi->irq);
-		return -ENXIO;
-	}
+	if (spi->irq <= 0)
+		return dev_err_probe(&pdev->dev, -ENXIO,
+				     "invalid IRQ %d for SPI controller\n",
+				     spi->irq);
 
 	ret = devm_request_irq(&pdev->dev, spi->irq, mchp_corespi_interrupt,
 			       IRQF_SHARED, dev_name(&pdev->dev), master);
-	if (ret) {
-		dev_err(&pdev->dev, "could not request irq: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "could not request irq: %d\n", ret);
 
 	spi->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(spi->clk)) {
-		dev_err(&pdev->dev, "could not get clk: %d\n", ret);
-		return PTR_ERR(spi->clk);
-	}
+	if (IS_ERR(spi->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(spi->clk),
+				     "could not get clk: %d\n", ret);
 
 	ret = clk_prepare_enable(spi->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to enable clock\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to enable clock\n");
 
 	mchp_corespi_init(master, spi);
 
 	ret = devm_spi_register_master(&pdev->dev, master);
 	if (ret) {
-		dev_err(&pdev->dev,
-			"unable to register master for SPI controller\n");
-		goto error_release_hardware;
+		mchp_corespi_disable(spi);
+		clk_disable_unprepare(spi->clk);
+		return dev_err_probe(&pdev->dev, ret,
+				     "unable to register master for SPI controller\n");
 	}
 
 	dev_info(&pdev->dev, "Registered SPI controller %d\n", master->bus_num);
 
 	return 0;
-
-error_release_hardware:
-	mchp_corespi_disable(spi);
-	clk_disable_unprepare(spi->clk);
-
-	return ret;
 }
 
 static int mchp_corespi_remove(struct platform_device *pdev)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
