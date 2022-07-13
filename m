Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DA8C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 02:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWVN5nHIcUvUvorV3nnlK5HaOJ7bNnCWMmoyaGCOKPo=; b=3g0E1VD4wvVIyL
	vbe0D6rKA1G2G6drKQ/7FjRNB2VKLbxFGwc+Onj5AAadSo1Tz6shcp7+71UsVFvaavK5ZhlpscFFt
	IH1VPd/glmmoL0WwF0IRwbAQMjHOCIpgt1qMmWmWZljxgOJYZCYb1itq+FLEfSmYnyAcv03rVzobu
	A2k6IMq6UttRfWAtbeURXodhAth+D4oBj1InId7WhzkV+LkLQzFYlXao1snRFlxYzYNqwSAmtTph0
	+lg+xX+KHcubBEIN5iHvBWHLAuNHTCUjGKI/5iwlbEAz0VtAWBqgb1ia7+5q5OzkgkGiNNJbX7fcM
	l+uYmPgzpzt6zGLnbYgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBSPn-00GtUZ-CY; Wed, 13 Jul 2022 02:47:51 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBSPi-00GtQe-Sd
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 02:47:49 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LjMQ93w5MzVfnB;
	Wed, 13 Jul 2022 10:44:01 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 13 Jul 2022 10:47:34 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 13 Jul
 2022 10:47:34 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<broonie@kernel.org>
Subject: [PATCH -next v2 2/3] spi: microchip-core: switch to use devm_spi_alloc_master()
Date: Wed, 13 Jul 2022 10:56:56 +0800
Message-ID: <20220713025657.3524506-3-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713025657.3524506-1-yangyingliang@huawei.com>
References: <20220713025657.3524506-1-yangyingliang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_194747_135316_CAFAD20B 
X-CRM114-Status: UNSURE (   8.96  )
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

Switch to use devm_spi_alloc_master() to simpify error path.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/spi/spi-microchip-core.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index c26767343176..1a24e47f8305 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -513,7 +513,7 @@ static int mchp_corespi_probe(struct platform_device *pdev)
 	u32 num_cs;
 	int ret = 0;
 
-	master = spi_alloc_master(&pdev->dev, sizeof(*spi));
+	master = devm_spi_alloc_master(&pdev->dev, sizeof(*spi));
 	if (!master)
 		return dev_err_probe(&pdev->dev, -ENOMEM,
 				     "unable to allocate master for SPI controller\n");
@@ -535,36 +535,32 @@ static int mchp_corespi_probe(struct platform_device *pdev)
 	spi = spi_master_get_devdata(master);
 
 	spi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-	if (IS_ERR(spi->regs)) {
-		ret = PTR_ERR(spi->regs);
-		goto error_release_master;
-	}
+	if (IS_ERR(spi->regs))
+		return PTR_ERR(spi->regs);
 
 	spi->irq = platform_get_irq(pdev, 0);
 	if (spi->irq <= 0) {
 		dev_err(&pdev->dev, "invalid IRQ %d for SPI controller\n", spi->irq);
-		ret = -ENXIO;
-		goto error_release_master;
+		return -ENXIO;
 	}
 
 	ret = devm_request_irq(&pdev->dev, spi->irq, mchp_corespi_interrupt,
 			       IRQF_SHARED, dev_name(&pdev->dev), master);
 	if (ret) {
 		dev_err(&pdev->dev, "could not request irq: %d\n", ret);
-		goto error_release_master;
+		return ret;
 	}
 
 	spi->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(spi->clk)) {
-		ret = PTR_ERR(spi->clk);
 		dev_err(&pdev->dev, "could not get clk: %d\n", ret);
-		goto error_release_master;
+		return PTR_ERR(spi->clk);
 	}
 
 	ret = clk_prepare_enable(spi->clk);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to enable clock\n");
-		goto error_release_master;
+		return ret;
 	}
 
 	mchp_corespi_init(master, spi);
@@ -583,8 +579,6 @@ static int mchp_corespi_probe(struct platform_device *pdev)
 error_release_hardware:
 	mchp_corespi_disable(spi);
 	clk_disable_unprepare(spi->clk);
-error_release_master:
-	spi_master_put(master);
 
 	return ret;
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
