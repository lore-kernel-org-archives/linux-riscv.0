Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39250C44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 06:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PKFyqHJmf5hXvca+2hEdnjHRWNxVae/8SUjTlOH5jQQ=; b=z1/CvjwEzomb+n
	tZoKWGbmQWxASRyVToc2jho8W66f2YCo1Iwb3ZkjiQK/mJMAlDJuZXWD0eUVTPw4Re9eKPDgYC62S
	Jr/yu8RW6nwJPShlHzwQ52OZ4+I7q6iDbPqbO7nhKkv6jPrtBANXdZ+wIKVl0Ws2uJYFu2RYzQQKX
	9mfgeDwnHJUDHSm5J1V4Vqkq8GySlCxnavjmmHTqPD0jeKPdzHC3rpowA6iRnXSn6NNDsopOZDCLa
	sFDlRmGOA1uFTqmVXyqOEESueyPugwpGrAIiVnpWAiGzzo/93E/j6XZfyVXoThUaGqcbsd0LKevuE
	/Bl8lhBsJ+0KGxxrB/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhBZ-00000005uzc-2Xa8;
	Mon, 20 Jul 2026 06:09:05 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhBW-00000005uyL-0NgB
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 06:09:03 +0000
X-UUID: 7a30e97a840111f1aa26b74ffac11d73-20260720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:7d45252c-8b4d-47a3-8d16-5d413afd813b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:1360bb2546396b697bd7e98b8f29a7fa,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7a30e97a840111f1aa26b74ffac11d73-20260720
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1629856269; Mon, 20 Jul 2026 14:08:50 +0800
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
Subject: [PATCH 2/2] spi: spacemit: drop redundant dev_err_probe() around irq helpers
Date: Mon, 20 Jul 2026 14:08:44 +0800
Message-Id: <119b5f8e3ac68221307cbfcd227dc8546be0eaeb.1784527556.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1784527556.git.xiaopei01@kylinos.cn>
References: <cover.1784527556.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_230902_438052_43623579 
X-CRM114-Status: UNSURE (   9.79  )
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

platform_get_irq() and devm_request_irq() already print an error
message via dev_err_probe() on failure, so wrapping them with
another dev_err_probe() results in duplicate error output.

Return the error code directly instead.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-spacemit-k1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
index cd2955949c5c..4348d77ec77c 100644
--- a/drivers/spi/spi-spacemit-k1.c
+++ b/drivers/spi/spi-spacemit-k1.c
@@ -737,12 +737,12 @@ static int k1_spi_probe(struct platform_device *pdev)
 
 	drv_data->irq = platform_get_irq(pdev, 0);
 	if (drv_data->irq < 0)
-		return dev_err_probe(dev, drv_data->irq, "error getting IRQ\n");
+		return drv_data->irq;
 
 	ret = devm_request_irq(dev, drv_data->irq, k1_spi_ssp_isr,
 			       IRQF_SHARED, dev_name(dev), drv_data);
 	if (ret < 0)
-		return dev_err_probe(dev, ret, "error requesting IRQ\n");
+		return ret;
 
 	/* Initialize the host structure, then register it */
 	host->dev.of_node = dev_of_node(dev);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
