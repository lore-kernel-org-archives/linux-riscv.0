Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13FBEE4993
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 13:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XEpFHy2l4tvoSzXCvH4vYfEAWRZ7ZArQ7nV6pP3kwmQ=; b=M4Zeimo7qeeJnT
	K8uFVsA60Z/jRbMlFLTsNvPKLHoxU+oouLT7UQls/Uo+4VVNaXdGVnOQzHzar9LjtM8DKPK0pA8j/
	1asbu9kjRvZiLs/c6JfBs57Quo6v89z7aTcVa7dO5rWSFsjO8mmtsafb3nKgyZlkENOp9MmZIpMlZ
	tmmRHTwbv6FBFs8J/ZxWWeakNvKRlcDpEb/QXwNPEosS7wYrxxj1JNxq0/ISYaRMvjcb1RjDimXl+
	zeGFLbr+Jpnrl/C8dJ7C66sns7QMDuflqwEdf0oZyePatZ4QunqZDxDomuGROg6/VsIyxNOe2lYvw
	cp3r/IFA8/RuKtLNTcbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYo6P-000iCb-0W;
	Wed, 23 Aug 2023 13:40:53 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYo5g-000hQ3-1I;
	Wed, 23 Aug 2023 13:40:11 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RW6hD3Pr9zLpCj;
	Wed, 23 Aug 2023 21:37:00 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 21:40:04 +0800
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
Subject: [PATCH -next v2 13/25] spi: spi-fsl-dspi: Use helper function devm_clk_get_enabled()
Date: Wed, 23 Aug 2023 21:39:26 +0800
Message-ID: <20230823133938.1359106-14-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230823_064008_967596_C8735523 
X-CRM114-Status: GOOD (  10.34  )
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

 drivers/spi/spi-fsl-dspi.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 8318249f8a1f..c9eae046f66c 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1372,19 +1372,16 @@ static int dspi_probe(struct platform_device *pdev)
 		}
 	}
 
-	dspi->clk = devm_clk_get(&pdev->dev, "dspi");
+	dspi->clk = devm_clk_get_enabled(&pdev->dev, "dspi");
 	if (IS_ERR(dspi->clk)) {
 		ret = PTR_ERR(dspi->clk);
 		dev_err(&pdev->dev, "unable to get clock\n");
 		goto out_ctlr_put;
 	}
-	ret = clk_prepare_enable(dspi->clk);
-	if (ret)
-		goto out_ctlr_put;
 
 	ret = dspi_init(dspi);
 	if (ret)
-		goto out_clk_put;
+		goto out_ctlr_put;
 
 	dspi->irq = platform_get_irq(pdev, 0);
 	if (dspi->irq <= 0) {
@@ -1400,7 +1397,7 @@ static int dspi_probe(struct platform_device *pdev)
 				   IRQF_SHARED, pdev->name, dspi);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Unable to attach DSPI interrupt\n");
-		goto out_clk_put;
+		goto out_ctlr_put;
 	}
 
 poll_mode:
@@ -1432,8 +1429,6 @@ static int dspi_probe(struct platform_device *pdev)
 out_free_irq:
 	if (dspi->irq)
 		free_irq(dspi->irq, dspi);
-out_clk_put:
-	clk_disable_unprepare(dspi->clk);
 out_ctlr_put:
 	spi_controller_put(ctlr);
 
@@ -1458,7 +1453,6 @@ static void dspi_remove(struct platform_device *pdev)
 	dspi_release_dma(dspi);
 	if (dspi->irq)
 		free_irq(dspi->irq, dspi);
-	clk_disable_unprepare(dspi->clk);
 }
 
 static void dspi_shutdown(struct platform_device *pdev)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
