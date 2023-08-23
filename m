Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6ECEE4993
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 13:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZrrdFKE2UCS2fShfYjjLKoCEQJAN9HXdWiWPuy5DK+Q=; b=rr1Trnl/qSEb3s
	dVFjox1qMC/tp++hT/AuDQTnlZUfS2cm00D+hurZh+TD58A2Sqvwaua+3H95AgaY7Sw9gy8waA/6s
	XGrBxQJ9xPHs0B1mtIyW0TFrHaJh5rA6SVWISfCzx+s1Fm30nGMNwfQk+WjvuLfVCsvUV7T/KacLI
	T8s9yph10vPcbe1fW0LUBb1WoQsfwqFPreVT7gKKkuDhvVzy4B4aBRmJoZMxKuN6fb1K1ZNHHUY6F
	/a279BlpRpts2/9WVhD1K2i6nIjt3Bz3qLAT1N9s//GtWdgYKrz6Smyp26QRsqTSb8RhfiqjSbvX+
	MQremYjh4fGU4h9Htpsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYo9P-000lRN-0o;
	Wed, 23 Aug 2023 13:43:59 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYo5u-000hd6-2v;
	Wed, 23 Aug 2023 13:40:25 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RW6jQ27ZrzTmcD;
	Wed, 23 Aug 2023 21:38:02 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 21:40:17 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
CC: <andrew@aj.id.au>, <angelogioacchino.delregno@collabora.com>,
	<avifishman70@gmail.com>, <bcm-kernel-feedback-list@broadcom.com>,
	<benjaminfair@google.com>, <broonie@kernel.org>,
	<chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>, <conor.dooley@microchip.com>,
	<daire.mcnamara@microchip.com>, <fancer.lancer@gmail.com>,
	<florian.fainelli@broadcom.com>, <heiko@sntech.de>, <jbrunet@baylibre.com>,
	<joel@jms.id.au>, <khilman@baylibre.com>, <linus.walleij@linaro.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-mediatek@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
	<neil.armstrong@linaro.org>, <olteanv@gmail.com>, <openbmc@lists.ozlabs.org>,
	<rjui@broadcom.com>, <sbranden@broadcom.com>, <tali.perry1@gmail.com>,
	<tmaimon77@gmail.com>, <venture@google.com>, <yuenn@google.com>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH -next v2 25/25] spi: rockchip: Use helper function devm_clk_get_enabled()
Date: Wed, 23 Aug 2023 21:39:38 +0800
Message-ID: <20230823133938.1359106-26-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230823133938.1359106-1-lizetao1@huawei.com>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
 <20230823133938.1359106-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_064023_498180_FC172E83 
X-CRM114-Status: GOOD (  10.53  )
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

Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
replaced by devm_clk_get_enabled() when driver enables (and possibly
prepares) the clocks for the whole lifetime of the device. Moreover, it is
no longer necessary to unprepare and disable the clocks explicitly.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: None

 drivers/spi/spi-rockchip.c | 30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
index 5b010094dace..4b9669da2cf3 100644
--- a/drivers/spi/spi-rockchip.c
+++ b/drivers/spi/spi-rockchip.c
@@ -782,42 +782,30 @@ static int rockchip_spi_probe(struct platform_device *pdev)
 		goto err_put_ctlr;
 	}
 
-	rs->apb_pclk = devm_clk_get(&pdev->dev, "apb_pclk");
+	rs->apb_pclk = devm_clk_get_enabled(&pdev->dev, "apb_pclk");
 	if (IS_ERR(rs->apb_pclk)) {
 		dev_err(&pdev->dev, "Failed to get apb_pclk\n");
 		ret = PTR_ERR(rs->apb_pclk);
 		goto err_put_ctlr;
 	}
 
-	rs->spiclk = devm_clk_get(&pdev->dev, "spiclk");
+	rs->spiclk = devm_clk_get_enabled(&pdev->dev, "spiclk");
 	if (IS_ERR(rs->spiclk)) {
 		dev_err(&pdev->dev, "Failed to get spi_pclk\n");
 		ret = PTR_ERR(rs->spiclk);
 		goto err_put_ctlr;
 	}
 
-	ret = clk_prepare_enable(rs->apb_pclk);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to enable apb_pclk\n");
-		goto err_put_ctlr;
-	}
-
-	ret = clk_prepare_enable(rs->spiclk);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to enable spi_clk\n");
-		goto err_disable_apbclk;
-	}
-
 	spi_enable_chip(rs, false);
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto err_disable_spiclk;
+		goto err_put_ctlr;
 
 	ret = devm_request_threaded_irq(&pdev->dev, ret, rockchip_spi_isr, NULL,
 			IRQF_ONESHOT, dev_name(&pdev->dev), ctlr);
 	if (ret)
-		goto err_disable_spiclk;
+		goto err_put_ctlr;
 
 	rs->dev = &pdev->dev;
 	rs->freq = clk_get_rate(rs->spiclk);
@@ -843,7 +831,7 @@ static int rockchip_spi_probe(struct platform_device *pdev)
 	if (!rs->fifo_len) {
 		dev_err(&pdev->dev, "Failed to get fifo length\n");
 		ret = -EINVAL;
-		goto err_disable_spiclk;
+		goto err_put_ctlr;
 	}
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, ROCKCHIP_AUTOSUSPEND_TIMEOUT);
@@ -937,10 +925,6 @@ static int rockchip_spi_probe(struct platform_device *pdev)
 		dma_release_channel(ctlr->dma_tx);
 err_disable_pm_runtime:
 	pm_runtime_disable(&pdev->dev);
-err_disable_spiclk:
-	clk_disable_unprepare(rs->spiclk);
-err_disable_apbclk:
-	clk_disable_unprepare(rs->apb_pclk);
 err_put_ctlr:
 	spi_controller_put(ctlr);
 
@@ -950,13 +934,9 @@ static int rockchip_spi_probe(struct platform_device *pdev)
 static void rockchip_spi_remove(struct platform_device *pdev)
 {
 	struct spi_controller *ctlr = spi_controller_get(platform_get_drvdata(pdev));
-	struct rockchip_spi *rs = spi_controller_get_devdata(ctlr);
 
 	pm_runtime_get_sync(&pdev->dev);
 
-	clk_disable_unprepare(rs->spiclk);
-	clk_disable_unprepare(rs->apb_pclk);
-
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
