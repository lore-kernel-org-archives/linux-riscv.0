Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAB4C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 05:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4C9HU1RJ4M9hCeuyQRjv6CsFrE+AHXXojAgiQASsm/A=; b=wOZ52zFUqSAATR
	oZUDyvaA17V+MD20B1PHWmm3OXsKvHlCTSOYfPkKF1iDYvXyt7f4/56QRFzly7wNV05qxUGm99SAh
	ZVVnU2rfoqbW4kuIvGoUwt1nlEbw79px88ADrY9tU4HEgFi58thLOmlmUacE2fhiwpoc0bSlims8V
	gKx0KsMaRuWIEg6fFxEupG7DZ4I4TS+TfujuYJN9eoK2hDnUQADeK7s6bqQW6TvXPwHsehmU8ETiB
	OMlzUwtfnpAIsoEWE1AGQQs89IoP2dGu6JcYQ5h7En9h4GuwzA0rQUN3Hk7YcAjsZUQU9XT1tbeyJ
	9lch7g9ZrQCIe/GXC3kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzB99-00Gthl-JZ; Thu, 09 Jun 2022 05:55:55 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzB8x-00GtdU-1V
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 05:55:46 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R781e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VFrDhR7_1654754134;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VFrDhR7_1654754134)
          by smtp.aliyun-inc.com;
          Thu, 09 Jun 2022 13:55:35 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: broonie@kernel.org
Cc: conor.dooley@microchip.com,
	lewis.hanly@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next 2/2] spi: fix platform_no_drv_owner.cocci warning
Date: Thu,  9 Jun 2022 13:55:32 +0800
Message-Id: <20220609055533.95866-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_225543_305123_FA7286F7 
X-CRM114-Status: UNSURE (   7.16  )
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

Remove .owner field if calls are used which set it automatically.

Eliminate the following coccicheck warning:
./drivers/spi/spi-microchip-core.c:624:3-8: No need to set .owner here.
The core will do it.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/spi/spi-microchip-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index 5b2aee30fa04..3bd285dd4964 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -621,7 +621,6 @@ static struct platform_driver mchp_corespi_driver = {
 		.name = "microchip-corespi",
 		.pm = MICROCHIP_SPI_PM_OPS,
 		.of_match_table = of_match_ptr(mchp_corespi_dt_ids),
-		.owner = THIS_MODULE,
 	},
 	.remove = mchp_corespi_remove,
 };
-- 
2.20.1.7.g153144c


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
