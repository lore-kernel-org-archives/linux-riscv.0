Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92875C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 07:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jYfZ7bDS4pEPFjb3hDnoy7MiCodEx/aqX0FGIpAutSk=; b=fd7tFhgALdsUhp
	W1hi/iYFvvMP4fz5WlZszj+lZ4NOo/eibnipH/KASXi5/rNfhlq1pSWEhbrPAsRnKlKhui13sfpzH
	FrxVceoxXXN8vVHA7IxypD0PHHlUNFW+cXNZoK07iOW3zt+t2QoiNQ9UEgIpfv0I4t2kuNWeRRPE/
	DpCC6f/NKxznhBT5PlZtOFFFVHmrVgGg805WSkqdaUpAqUgm8GOsNBDaOK77cpDlo2ByY67TBsz0s
	3U7tNp907zMBkxXA/maTG/ENw2XkLx1XQp1z5R1XwtpUQ6DzGnvxGjMDP3WXKQ2ReM9T4dZQocrKG
	bLwPUIvl34QNe86o+zGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4dhI-000zev-7U; Fri, 24 Jun 2022 07:25:44 +0000
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4dhG-000ze9-2e
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 07:25:43 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VHG5rQQ_1656055517;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VHG5rQQ_1656055517)
          by smtp.aliyun-inc.com;
          Fri, 24 Jun 2022 15:25:37 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: lewis.hanly@microchip.com
Cc: conor.dooley@microchip.com,
	b-liu@ti.com,
	gregkh@linuxfoundation.org,
	linux-riscv@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] usb: musb: Fix missing error code in mpfs_probe()
Date: Fri, 24 Jun 2022 15:25:15 +0800
Message-Id: <20220624072515.123646-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_002542_329267_618A49D4 
X-CRM114-Status: UNSURE (   9.25  )
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

The error code is missing in this code scenario, add the error code
'-ENOMEM' to the return value 'ret'.

This was found by coccicheck:

drivers/usb/musb/mpfs.c:185 mpfs_probe() warn: missing error code 'ret'.

Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/usb/musb/mpfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index 99666ef8af06..c8bf6570bcc4 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -181,8 +181,10 @@ static int mpfs_probe(struct platform_device *pdev)
 	glue->clk = clk;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
+	if (!pdata) {
+		ret = -ENOMEM;
 		goto err_clk_disable;
+	}
 
 	pdata->config = &mpfs_musb_hdrc_config;
 	pdata->platform_ops = &mpfs_ops;
-- 
2.20.1.7.g153144c


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
