Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE69C44539
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 09:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ysh5m7KZiQADMl3OaMrEzOQ+hcFUlYZjyVs6D+S8mfc=; b=IRmQVZaH2iJcBY
	C25IwRLVKgw0K93F+fJEtAYFKsBn1O7WhaBMWsBOPunWA7yk/2j4I0AvcA4Hy/89eIgyQa9hzidWm
	OuW9DWnrrnniTe7Z6Mj6gNKsqq6TvUVZlDRWQWYGppYpkSqTG4BQr6F1THllcsjhxRXeTP8cQfpIF
	+Ddke1zQuI8V4vXbqM81nNlVeq04307wT3p+GUip2nm+ZfVEilDnyvofEUPljTkIy/yEODfg6mL3z
	qhjQRrvXuJgFed7DgAzmjqauE+7DbFc1/I9fjByKOsmFyFW5O0NZbOxQ5iUtoKjAIGnvitLroReZg
	CI/Kntm24JCKbBtiuHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTU0-0000000BRt4-08Bd;
	Wed, 22 Jul 2026 09:43:20 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTTy-0000000BRsY-0Qej
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 09:43:19 +0000
X-UUID: bdf39a9885b111f1aa26b74ffac11d73-20260722
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:23cf166a-4ec7-4d78-bcc9-9abab6d1eadf,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:82e04f2cc73d71d06bc394688386a4f5,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bdf39a9885b111f1aa26b74ffac11d73-20260722
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 258169648; Wed, 22 Jul 2026 17:43:06 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>,
	Alex Elder <elder@riscstar.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH] i2c: spacemit: request IRQ after controller initialization
Date: Wed, 22 Jul 2026 17:43:02 +0800
Message-Id: <20260722094302.2284191-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_024318_451121_ECC4C8FF 
X-CRM114-Status: GOOD (  10.41  )
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

spacemit_i2c_probe() requests the IRQ before it enables the clocks, resets
the controller and runs init_completion(). If an interrupt is already
pending, the handler runs too early: it reads registers while the clocks
are still off and calls complete() on an uninitialized completion. Request
the IRQ after the controller and completion are initialized, but still
before the adapter is registered.

Fixes: 5ea558473fa3 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
 drivers/i2c/busses/i2c-k1.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 51a0c3d80fc9..3fe716cc153d 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -723,11 +723,6 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	if (i2c->irq < 0)
 		return dev_err_probe(dev, i2c->irq, "failed to get irq resource");
 
-	ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
-			       IRQF_NO_SUSPEND, dev_name(i2c->dev), i2c);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to request irq");
-
 	clk = devm_clk_get_enabled(dev, "func");
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
@@ -755,6 +750,11 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 
 	init_completion(&i2c->complete);
 
+	ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
+			       IRQF_NO_SUSPEND, dev_name(i2c->dev), i2c);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request irq");
+
 	platform_set_drvdata(pdev, i2c);
 
 	ret = i2c_add_numbered_adapter(&i2c->adapt);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
