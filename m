Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185CBC001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 08:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EZeVZl0bMzLDEjNjTRadGu41dxLCRq5cMADm+vYgSXQ=; b=K6W5/RE7RUFTzf
	+Ugh2rFXvlX4RRv9LDKPctkfpIaegNFy31bI5TIt2roAY8JCtEsz7iCR+mrvR2/LfF/yYa7aHuJPG
	VjkhOYTAMJQLy/yklHr1An+rwoJyZo9VeUKgPwFo6FAJSWCs4/va7qD4KDTXhZi35XRsI+5WUvpaU
	zAJihSc3g/1LAlwPMmy8wDmfs05Mpz0rOlSLqqFdWCVC6DhK0h4rQe9Zqe4ALyMxF380TXH1Hijzv
	a9k8hNO9m4lEjcGYRHcXOKS7/DwCvUE0gCLi3h2y7WhQVnanrMHaxHlXrDEEq6bwLa0EnVoDKO6+R
	0boYFDOlC6yNwwVp4gXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPItY-002PjT-34;
	Fri, 28 Jul 2023 08:32:20 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPItV-002Pil-1a
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 08:32:19 +0000
Received: from dggpemm500016.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RC14k556DztRhF;
	Fri, 28 Jul 2023 16:28:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 28 Jul
 2023 16:32:10 +0800
From: Chen Jiahao <chenjiahao16@huawei.com>
To: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<andi.shyti@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-i2c@vger.kernel.org>
CC: <chenjiahao16@huawei.com>
Subject: [PATCH -next] i2c: microchip-corei2c: clean up redundant dev_err_probe()
Date: Fri, 28 Jul 2023 16:31:37 +0800
Message-ID: <20230728083137.3528303-1-chenjiahao16@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_013217_701245_3356F9EF 
X-CRM114-Status: UNSURE (   8.81  )
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

Referring to platform_get_irq()'s definition, the return value has
already been checked, error message also been printed via
dev_err_probe() if ret < 0. Calling dev_err_probe() one more time
outside platform_get_irq() is obviously redundant.

Furthermore, platform_get_irq() will never return irq equals 0,
removing spi->irq == 0 checking to clean it up.

Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
---
 drivers/i2c/busses/i2c-microchip-corei2c.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
index 7f58f7eaabb6..0b0a1c4d17ca 100644
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -378,9 +378,8 @@ static int mchp_corei2c_probe(struct platform_device *pdev)
 		return PTR_ERR(idev->base);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0)
-		return dev_err_probe(&pdev->dev, -ENXIO,
-				     "invalid IRQ %d for I2C controller\n", irq);
+	if (irq < 0)
+		return irq;
 
 	idev->i2c_clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(idev->i2c_clk))
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
