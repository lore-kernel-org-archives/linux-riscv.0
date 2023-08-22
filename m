Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C05EE49A3
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 13:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWIJ65Ygzgboagyo9Ki9Ifzug5Ad+VuQOFfKQtE4oak=; b=3LwgHaK4uacNjQ
	IXaWBHZpw+wY3m6tFr86ifnaK6aQm4ghBSfPWA0Om7zomnedGF7KW1SamFKrZCzBwDe4J5iV2ueHD
	yY31yhPirDRA3sazAWvFWh5Za+QYhCZs9L/ZqPrrqC5qZIjjuJ4gTQKQ1Kn+2OiGXSt0UkMPtPLNv
	IglbWM6QcEEEWGgfsYdLMPR4T1POL5f6tL9Hpa8Oi2n173xrUuQ9A6Gwv82XJsiUaXLvg6MeCS7vZ
	wk+bo371wkpOnlVYB7J3mjOxM7KUsW0/XzrJ6owkrTjfKzJBNg8tBoucUUmspm/uAsocDcV1v0VTy
	LjFB6ONLhzM06OfPJAOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRCM-00Fxzp-27;
	Tue, 22 Aug 2023 13:13:30 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRBs-00FxVd-1P;
	Tue, 22 Aug 2023 13:13:03 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RVV9D6Z1TzrSP8;
	Tue, 22 Aug 2023 21:11:28 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 21:12:56 +0800
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
Subject: [PATCH -next 08/25] spi: spi-cadence: Use helper function devm_clk_get_enabled()
Date: Tue, 22 Aug 2023 21:12:20 +0800
Message-ID: <20230822131237.1022815-9-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822131237.1022815-1-lizetao1@huawei.com>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_061300_968130_8540C9BB 
X-CRM114-Status: UNSURE (   9.26  )
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

Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
replaced by devm_clk_get_enabled() when driver enables (and possibly
prepares) the clocks for the whole lifetime of the device. Moreover, it is
no longer necessary to unprepare and disable the clocks explicitly.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/spi/spi-cadence.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/spi/spi-cadence.c b/drivers/spi/spi-cadence.c
index 3c9813ad064b..174476bbdf54 100644
--- a/drivers/spi/spi-cadence.c
+++ b/drivers/spi/spi-cadence.c
@@ -576,31 +576,19 @@ static int cdns_spi_probe(struct platform_device *pdev)
 		goto remove_ctlr;
 	}
 
-	xspi->pclk = devm_clk_get(&pdev->dev, "pclk");
+	xspi->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(xspi->pclk)) {
 		dev_err(&pdev->dev, "pclk clock not found.\n");
 		ret = PTR_ERR(xspi->pclk);
 		goto remove_ctlr;
 	}
 
-	ret = clk_prepare_enable(xspi->pclk);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to enable APB clock.\n");
-		goto remove_ctlr;
-	}
-
 	if (!spi_controller_is_target(ctlr)) {
-		xspi->ref_clk = devm_clk_get(&pdev->dev, "ref_clk");
+		xspi->ref_clk = devm_clk_get_enabled(&pdev->dev, "ref_clk");
 		if (IS_ERR(xspi->ref_clk)) {
 			dev_err(&pdev->dev, "ref_clk clock not found.\n");
 			ret = PTR_ERR(xspi->ref_clk);
-			goto clk_dis_apb;
-		}
-
-		ret = clk_prepare_enable(xspi->ref_clk);
-		if (ret) {
-			dev_err(&pdev->dev, "Unable to enable device clock.\n");
-			goto clk_dis_apb;
+			goto remove_ctlr;
 		}
 
 		pm_runtime_use_autosuspend(&pdev->dev);
@@ -674,10 +662,7 @@ static int cdns_spi_probe(struct platform_device *pdev)
 	if (!spi_controller_is_target(ctlr)) {
 		pm_runtime_set_suspended(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
-		clk_disable_unprepare(xspi->ref_clk);
 	}
-clk_dis_apb:
-	clk_disable_unprepare(xspi->pclk);
 remove_ctlr:
 	spi_controller_put(ctlr);
 	return ret;
@@ -698,8 +683,6 @@ static void cdns_spi_remove(struct platform_device *pdev)
 
 	cdns_spi_write(xspi, CDNS_SPI_ER, CDNS_SPI_ER_DISABLE);
 
-	clk_disable_unprepare(xspi->ref_clk);
-	clk_disable_unprepare(xspi->pclk);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
