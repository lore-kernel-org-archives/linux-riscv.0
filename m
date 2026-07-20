Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3314EC44524
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 06:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V4piRJa9inCK7gROirK83mS0EvNkkkOqSaFp4Pskcmo=; b=Uu3m0P+2l0nl/n
	uQpxrYyR2WlkKVuJCGG/JWi3xmiMU5ofvRp7FRZy5p+6c9ZV/GNiNNO7D1JFOSDuMMm3j/LkOJR4C
	vr4KJxh6KRQEJ037fe9nNPfHUnea4LREeuF7GkcxpYswZ7S6WreVNICkeF0uFnC9Z8LqTaxBJ/OMe
	jDrm81wybe2h1WItOJ5Bp53sKupVvDhunEScLBXCNUt6erBcMe38PBwCrDbcrqST92VfYpHUR7Y6X
	XfKEciwfbn7qf2+gooFu0wbuaZ30cc9xXb9398f5d8l/+oBGRK3scbTPPVAnwIJ23dMUpIe8r8FfO
	+pFyBtB5JYhMP1vJ3OUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhBZ-00000005uzg-31QX;
	Mon, 20 Jul 2026 06:09:05 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhBW-00000005uyK-12O2
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 06:09:03 +0000
X-UUID: 79e38432840111f1aa26b74ffac11d73-20260720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:09729ee8-8961-4ba0-9221-0b71309cfb8e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:37a0819a3c3bafd5bb00b2b95efeecc3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|850|865|898,TC:nil,Content
	:0|15|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 79e38432840111f1aa26b74ffac11d73-20260720
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 500305034; Mon, 20 Jul 2026 14:08:49 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: broonie@kernel.org,
	dlan@kernel.org,
	elder@riscstar.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 1/2] spi: spacemit: fix dangling TX DMA descriptor on RX prep failure
Date: Mon, 20 Jul 2026 14:08:43 +0800
Message-Id: <b402223ebff226782afd4c7da7db4ce34807f604.1784527556.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1784527556.git.xiaopei01@kylinos.cn>
References: <cover.1784527556.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_230902_590128_DC7E6C58 
X-CRM114-Status: UNSURE (   9.04  )
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

In k1_spi_dma_one(), the TX DMA descriptor is submitted via
dmaengine_submit() before the RX descriptor is prepared.  If
k1_spi_dma_prep() fails for RX, the function jumps to the fallback
path without terminating the already-submitted TX descriptor.

So terminate the TX channel with dmaengine_terminate_sync() when RX
descriptor preparation fails.

Fixes: efcd8b9d1111 ("spi: spacemit: introduce SpacemiT K1 SPI controller driver")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-spacemit-k1.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
index 215fe66d27b4..cd2955949c5c 100644
--- a/drivers/spi/spi-spacemit-k1.c
+++ b/drivers/spi/spi-spacemit-k1.c
@@ -289,8 +289,10 @@ static int k1_spi_dma_one(struct spi_controller *host, struct spi_device *spi,
 
 	/* Prepare the RX descriptor and submit it */
 	desc = k1_spi_dma_prep(drv_data, transfer, false);
-	if (!desc)
+	if (!desc) {
+		dmaengine_terminate_sync(host->dma_tx);
 		goto fallback;
+	}
 
 	/* When RX is complete we also know TX has completed */
 	desc->callback = k1_spi_dma_callback;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
