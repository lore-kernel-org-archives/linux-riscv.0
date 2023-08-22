Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78B4EE49AA
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 13:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yAuP70ZQxdWAM1Cf+Dk77z64ni/dO0PbUsJt9eSrSjY=; b=DHebbw1gDl2hE7
	0KolTg41eEHjQwg4EzR37SVNUxM+9wBeZtNyGH7987mRDF1hr4nM05/OgiCWqBELAU/Lg7I1B26+F
	+CIzFcU8CfquguwuHg7mSW/2QJ/4b4Qx8yAiQYMOvC8T4vmj8uC8gtTI8HMx+8+db7TEh5u1uD5cE
	yPpkPuDwGhNvAz9x1aZjbn6DQyGLIkDSUJFICnbbseX57JD1fdMch79U49+Y7tG+VFcdIYe8LxqXz
	uDTWaIfR8drS51pE7DsE4lTk5sAc/pDeYfsbg+QXXx4ZtlQ/NIziUC7o6vfZhyVQegjQEUfQOKHxr
	pF0t55wEfhkbJSLWUt/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRD4-00FyrO-33;
	Tue, 22 Aug 2023 13:14:14 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRBu-00FxVc-0n;
	Tue, 22 Aug 2023 13:13:06 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RVV6p4QMczNnL2;
	Tue, 22 Aug 2023 21:09:22 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 21:12:55 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <broonie@kernel.org>, <chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>,
	<joel@jms.id.au>, <andrew@aj.id.au>, <florian.fainelli@broadcom.com>,
	<rjui@broadcom.com>, <sbranden@broadcom.com>,
	<bcm-kernel-feedback-list@broadcom.com>, <fancer.lancer@gmail.com>,
	<olteanv@gmail.com>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
	<venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
	<linus.walleij@linaro.org>, <heiko@sntech.de>
CC: <lizetao1@huawei.com>, <linux-spi@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>
Subject: [PATCH -next 07/25] spi: bcm2835aux: Use helper function devm_clk_get_enabled()
Date: Tue, 22 Aug 2023 21:12:19 +0800
Message-ID: <20230822131237.1022815-8-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822131237.1022815-1-lizetao1@huawei.com>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_061302_799045_B1DFCB4D 
X-CRM114-Status: GOOD (  11.92  )
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

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
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
