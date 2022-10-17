Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FAEC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 09:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fXOEbXr8uHRHymsDsK4MQhLrLcTVriKXBB7YE2+E7HE=; b=ZJwekxxdVLqc7S
	/fRXXhh7z2ByFGE6TvkYRtqL61oo+4vHV8IVkEhq5Uj7af+SNWlIZHYKQmhQ4TT7iHzkd1qqNOZ+j
	fnr6/FKfP6nkPCL5/0OWIKMrgPXvkYAFLwLa1oBxPu2zfx6GtpQcxSm8JJb0HXwbeKsDg6vGuLJt9
	S9F1giNH1cKoPeOaSN7c7/GzW65+iIGAcoKzrv5r+i3/tgJXBCWHYYUAF2zfEYjDYqrvLvNmY34UA
	2R5nSxk3ktvnbM6UqCqVZRoRWfVd5ICjPjycNuQd/gmSinpEH4h4Dliqn8OW3q6sYEE0SzgQxF8e8
	xiTbvbyD9QCb7I54A7XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMLX-009foB-H6; Mon, 17 Oct 2022 09:23:43 +0000
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMK7-009fCo-3l
	for linux-riscv@lists.infradead.org; Mon, 17 Oct 2022 09:22:17 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VSLPPPc_1665998521;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VSLPPPc_1665998521)
          by smtp.aliyun-inc.com;
          Mon, 17 Oct 2022 17:22:09 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: conor.dooley@microchip.com
Cc: daire.mcnamara@microchip.com,
	broonie@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] spi: microchip-core: Remove the unused function mchp_corespi_enable()
Date: Mon, 17 Oct 2022 17:21:41 +0800
Message-Id: <20221017092141.9789-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_022215_343158_75225894 
X-CRM114-Status: UNSURE (   5.06  )
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

The function mchp_corespi_enable() is defined in the spi-microchip-core.c
file, but not called elsewhere, so delete this unused function.

drivers/spi/spi-microchip-core.c:122:20: warning: unused function 'mchp_corespi_enable'.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2418
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/spi/spi-microchip-core.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index d352844c798c..aeaa1da88f39 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -119,15 +119,6 @@ static inline void mchp_corespi_write(struct mchp_corespi *spi, unsigned int reg
 	writel(val, spi->regs + reg);
 }
 
-static inline void mchp_corespi_enable(struct mchp_corespi *spi)
-{
-	u32 control = mchp_corespi_read(spi, REG_CONTROL);
-
-	control |= CONTROL_ENABLE;
-
-	mchp_corespi_write(spi, REG_CONTROL, control);
-}
-
 static inline void mchp_corespi_disable(struct mchp_corespi *spi)
 {
 	u32 control = mchp_corespi_read(spi, REG_CONTROL);
-- 
2.20.1.7.g153144c


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
