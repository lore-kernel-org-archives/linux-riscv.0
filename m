Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A481C001E0
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 13:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m46c/2VQRPNV7q7ZpDleM2me8jQmVNGGVTw4xRXj8Bc=; b=BZzwqDrLGtqvaZ
	GS3Q6iJiiLAlfwPVg3ZkOEJhhWDnwpGAVPhovvRCvu+Bv9fTGa3VS36yAbb92fDtEHS7WrbRiaHGV
	GI4qAAVL/F5zYB9sgxbAKUnaDOBdqAm3YZEf14cj6WQzQlt0bRNFRx49IBQfFeeOQNbKTr/eHXQmU
	HO1BBOtjX09JeOa5cwx1Cgb4vBRB2VlZLpsZIzR3aUXPj5uZKgEJLGbEULiYPFJMa3ZG4o8/eIUQQ
	M7uhyClV8/wcdAhe/k7xxAX0fx85YACI3o8yVIs+RKaxIPonV9lmiKu/qDYlzFsKb08RyaJH3C7cF
	FqzvFxiiaoO2mPce4e5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP0cl-00EGCw-0P;
	Thu, 27 Jul 2023 13:01:47 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP0cg-00EG0Q-2o
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 13:01:45 +0000
Received: from dggpemm500016.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RBW8Y6YzLz1GDDY;
	Thu, 27 Jul 2023 21:00:29 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 27 Jul
 2023 21:01:23 +0800
From: Chen Jiahao <chenjiahao16@huawei.com>
To: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<broonie@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-spi@vger.kernel.org>
CC: <chenjiahao16@huawei.com>
Subject: [PATCH -next] spi: microchip-core: Clean up redundant dev_err_probe()
Date: Thu, 27 Jul 2023 21:00:49 +0800
Message-ID: <20230727130049.2810959-1-chenjiahao16@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_060143_587769_CB2AFF8F 
X-CRM114-Status: UNSURE (   8.40  )
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

Refering to platform_get_irq()'s definition, the return value has
already been checked if ret < 0, and printed via dev_err_probe().
Calling dev_err_probe() one more time outside platform_get_irq()
is obviously redundant.

Furthermore, platform_get_irq() will never return irq equals 0,
removing spi->irq == 0 checking to clean it up.

Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
---
 drivers/spi/spi-microchip-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index b59e8a0c5b97..ac3b7b163db4 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -530,10 +530,8 @@ static int mchp_corespi_probe(struct platform_device *pdev)
 		return PTR_ERR(spi->regs);
 
 	spi->irq = platform_get_irq(pdev, 0);
-	if (spi->irq <= 0)
-		return dev_err_probe(&pdev->dev, -ENXIO,
-				     "invalid IRQ %d for SPI controller\n",
-				     spi->irq);
+	if (spi->irq < 0)
+		return -ENXIO;
 
 	ret = devm_request_irq(&pdev->dev, spi->irq, mchp_corespi_interrupt,
 			       IRQF_SHARED, dev_name(&pdev->dev), master);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
