Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C87CEE49B2
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 13:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZQYFM8RVGJugQx8v3GqoggYWyIKdrUshxu9+8nxKcg=; b=AKwKZeLx9aELvt
	gdJZJCIGE6l5WRPdeyb2IA2tX4lWXVcmzPV57AKcXmOuJv88wRG7Wq8JjDHTPXsQaJO2YHdRFxBXu
	p7Pd/loGkMuUi1M/IsB6u49+WxL2l1xp8PjplfAhqyiUeRFGdZ7p2iKsE9XmJjoRpP9w6U+CMCUZc
	JraNsDDy8MI9cYjoFeqBgxs2rkF7GB8nI5dXl8l8fNkKkfJuXivlS66vOTOrMfvSPx8R9gfdW4t3f
	4jatykCQBwk3JbcJ8UMwz4hmp2+jhmkonNJ6qGgQCsVpBZYCO1zr1zfVhoevIzouxly492em4kYxz
	ScRbWrBKdA0Il4iFDl3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYo6S-000iGx-2Q;
	Wed, 23 Aug 2023 13:40:56 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYo5f-000hPV-2K;
	Wed, 23 Aug 2023 13:40:11 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RW6gX48BVzNmsj;
	Wed, 23 Aug 2023 21:36:24 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 21:39:58 +0800
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
Subject: [PATCH -next v2 07/25] spi: bcm2835aux: Use helper function devm_clk_get_enabled()
Date: Wed, 23 Aug 2023 21:39:20 +0800
Message-ID: <20230823133938.1359106-8-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230823_064008_293331_035D2ECA 
X-CRM114-Status: GOOD (  12.17  )
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

 drivers/spi/spi-bcm2835aux.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/spi/spi-bcm2835aux.c b/drivers/spi/spi-bcm2835aux.c
index 6d2a5d9f2498..06fe155a70c9 100644
--- a/drivers/spi/spi-bcm2835aux.c
+++ b/drivers/spi/spi-bcm2835aux.c
@@ -512,7 +512,7 @@ static int bcm2835aux_spi_probe(struct platform_device *pdev)
 	if (IS_ERR(bs->regs))
 		return PTR_ERR(bs->regs);
 
-	bs->clk = devm_clk_get(&pdev->dev, NULL);
+	bs->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(bs->clk)) {
 		err = PTR_ERR(bs->clk);
 		dev_err(&pdev->dev, "could not get clk: %d\n", err);
@@ -523,19 +523,11 @@ static int bcm2835aux_spi_probe(struct platform_device *pdev)
 	if (bs->irq < 0)
 		return bs->irq;
 
-	/* this also enables the HW block */
-	err = clk_prepare_enable(bs->clk);
-	if (err) {
-		dev_err(&pdev->dev, "could not prepare clock: %d\n", err);
-		return err;
-	}
-
 	/* just checking if the clock returns a sane value */
 	clk_hz = clk_get_rate(bs->clk);
 	if (!clk_hz) {
 		dev_err(&pdev->dev, "clock returns 0 Hz\n");
-		err = -ENODEV;
-		goto out_clk_disable;
+		return -ENODEV;
 	}
 
 	/* reset SPI-HW block */
@@ -547,22 +539,18 @@ static int bcm2835aux_spi_probe(struct platform_device *pdev)
 			       dev_name(&pdev->dev), host);
 	if (err) {
 		dev_err(&pdev->dev, "could not request IRQ: %d\n", err);
-		goto out_clk_disable;
+		return err;
 	}
 
 	err = spi_register_controller(host);
 	if (err) {
 		dev_err(&pdev->dev, "could not register SPI host: %d\n", err);
-		goto out_clk_disable;
+		return err;
 	}
 
 	bcm2835aux_debugfs_create(bs, dev_name(&pdev->dev));
 
 	return 0;
-
-out_clk_disable:
-	clk_disable_unprepare(bs->clk);
-	return err;
 }
 
 static void bcm2835aux_spi_remove(struct platform_device *pdev)
@@ -575,9 +563,6 @@ static void bcm2835aux_spi_remove(struct platform_device *pdev)
 	spi_unregister_controller(host);
 
 	bcm2835aux_spi_reset_hw(bs);
-
-	/* disable the HW block by releasing the clock */
-	clk_disable_unprepare(bs->clk);
 }
 
 static const struct of_device_id bcm2835aux_spi_match[] = {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
