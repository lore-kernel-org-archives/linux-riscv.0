Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3511AC001E0
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 13:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TEcIJUK847eWFMqdwcUw/vlZthu9rBsJuEDcCj+Nefo=; b=yQ/W24v89tmC++
	4j7Or3t+zCxyV/GzOxV9WuvpXfa2GLkEFMM3u3Nhsi4k88TWieJ+h2qWmGC6aM9QzVCwNRpwNXKcK
	wLfSG+5c6a7OpfxzjZkagXSGeuwhHhbPrGiDRdc7lrjKdIM76X9CTQh8uhrEcrUnPtdrrb+Rawrdu
	qJITIoTk8mqxTsKBN55GHJHgyCxPDdwxAfzXYHZ6XeE9BwB5HtrCt99RCauZY5g9pk/n1laseBeiK
	HGDQuRUz1EBFJO0HFcAtMRi9/5Cgz1hfZCd9Ke8FOlfllXIKCVUeB3hp+N19u21ppLldVQ7CD7gFj
	TwXa3RCMCcxhHdap1eww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQpk6-002UOK-0W;
	Tue, 01 Aug 2023 13:48:54 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQpk3-002UNS-0M;
	Tue, 01 Aug 2023 13:48:52 +0000
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RFbym5D9kz1GDGh;
	Tue,  1 Aug 2023 21:47:44 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 21:48:45 +0800
From: Zhu Wang <wangzhu9@huawei.com>
To: <brgl@bgdev.pl>, <andi.shyti@kernel.org>, <conor.dooley@microchip.com>,
	<daire.mcnamara@microchip.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-i2c@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <wangzhu9@huawei.com>
Subject: [PATCH -next v2] i2c: remove redundant dev_err_probe()
Date: Tue, 1 Aug 2023 21:48:14 +0800
Message-ID: <20230801134814.247782-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_064851_344045_D8717D76 
X-CRM114-Status: GOOD (  12.64  )
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

When platform_get_irq() is called, the error message has been printed,
so it need not to call dev_err_probe() to print error.

As the comment of platform_get_irq() says, it returned non-zero value
when it succeeded, and it returned negative value when it failed.

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

---
Changes in v2:
- Update the comment, explain the return value of platform_get_irq().
---
 drivers/i2c/busses/i2c-davinci.c           | 2 +-
 drivers/i2c/busses/i2c-microchip-corei2c.c | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 52527189a7bf..329c952d5062 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -765,7 +765,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return dev_err_probe(&pdev->dev, irq, "can't get irq resource\n");
+		return irq;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
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
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
