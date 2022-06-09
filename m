Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0519AC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 05:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EyB0QgmiUc6CSfYk0gk3FCH20m32eAmF3H5DPhH+ko=; b=Sq79BFmnbcUpik
	pN49vccil6pl2hA5jIkXv6Ym8JKqjV27mw7h/hhX3J2ue/aUv11MNraLNH+28ekXlpjRq0o25MVfd
	3IOgeNkhIuYMDE/pH6pFMiPJZp+BgAd84WHjpbfObpEIhwkcEFJkqnb1HHs1kQlTienhAuHKmFRWp
	DsOvTsToLj7wUjZAFtXtkJMetnTHUw8ptxFpKLihAJHnrWkmlTTU7QmeNqk6vnRjZZN73D8K/0fNY
	Lg4XA6mwdCkkC4oF65cUlt1TGF81Y/8UiMR/W7AwP1H8v2mTXSo8Ld1Z1sFYDeU4XlCkBEZ0l90nv
	OPkQ2HpWOs5XhCdt14eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzB9B-00GtiH-0g; Thu, 09 Jun 2022 05:55:57 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzB8z-00Gtds-Bc
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 05:55:47 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R911e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VFrCFzQ_1654754137;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VFrCFzQ_1654754137)
          by smtp.aliyun-inc.com;
          Thu, 09 Jun 2022 13:55:38 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: broonie@kernel.org
Cc: conor.dooley@microchip.com,
	lewis.hanly@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next 1/2] spi: Remove unnecessary print function dev_err()
Date: Thu,  9 Jun 2022 13:55:33 +0800
Message-Id: <20220609055533.95866-2-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220609055533.95866-1-yang.lee@linux.alibaba.com>
References: <20220609055533.95866-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_225546_031465_A0B8063B 
X-CRM114-Status: UNSURE (   8.00  )
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

The function platform_get_irq() never returns 0, and the print function
dev_err() is redundant because platform_get_irq() already prints an error.

Eliminate the follow coccicheck warning:
./drivers/spi/spi-microchip-core.c:543:2-9: line 543 is redundant
because platform_get_irq() already prints an error

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/spi/spi-microchip-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index 3bd285dd4964..d8ae25ccffa8 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -539,8 +539,7 @@ static int mchp_corespi_probe(struct platform_device *pdev)
 	}
 
 	spi->irq = platform_get_irq(pdev, 0);
-	if (spi->irq <= 0) {
-		dev_err(&pdev->dev, "invalid IRQ %d for SPI controller\n", spi->irq);
+	if (spi->irq < 0) {
 		ret = spi->irq;
 		goto error_release_master;
 	}
-- 
2.20.1.7.g153144c


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
