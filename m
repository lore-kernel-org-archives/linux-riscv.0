Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB27C44508
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 23:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u+2ZGVE5E0NoYuZVC7kUjkjK2M/Ren3AGxosMv+h1Y8=; b=zeKJjVOfQzp2Ha
	YutzOZLYgkExrv+MngXHUPytO8stoX6jMktCp8Bes6Gdr4a2rRrZskSaeVBTaq2EbiWgoF0oLxphz
	/wxNp/fHW8J8RlM5/0zlgk8yJ9F0J3Rt5GXlfpMkzKZyfQu/Ey61O3NW7XzYChM5HcS6DlDGUWz3o
	Aoyo8dk2bsjSk1bHHT7BMC9CTDKtLOygqBWKqVUQ0++j9h670RhBbhpvha7nBw9DV17X8U3R6T1pY
	QLDJ3nsabVLjJS38O8olqB2MKaacgIWr/AFBjQqhP3vqQdDZ3ocZj1pefFXNzNgCQp6NCRadCwZXl
	LePUFx6PUqrTr+btOT1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihzq-00000006BkS-07xT;
	Wed, 21 Jan 2026 23:52:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihzp-00000006BkM-0J9B
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 23:52:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E188F600CB;
	Wed, 21 Jan 2026 23:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D25C4CEF1;
	Wed, 21 Jan 2026 23:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769039539;
	bh=n1GiS+Ch3u2nLGAQ5qcayVMM0M3M5UTjjiWfRPTnAXA=;
	h=From:Date:Subject:To:Cc:From;
	b=CqSO0s2ZF2AJmrPdX0PwbVimN87CQgzdk/SMSOVl31MMY3YzTjxAhIF5xoactLYUS
	 R6UZQDTEGQ2VvYDQHJyUS9TRnXasypqcX2b31bgfPKHo0mlAVcoKpbmFBojo3/sE2a
	 bwoIH91xDx+BncJn8GPxIqN3cjW5mj7PN1u9tGq4JaeG33HLgPF7wPyh7twKDWywHW
	 On01DsqKSYJWyadBuSz3I7+yMTDPNBk3Y2XbmiCFYr+2IbcT15MvrLr2Ub3xhdb9QP
	 F/mOEsvEkjAutydjwywMR9b1IzoaUpY9KhmFIF5dliByuk6ssEqAR4onjEVQIA0juf
	 rw2ONm047F5uA==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 22 Jan 2026 07:52:00 +0800
Subject: [PATCH] i2c: spacemit: drop IRQF_ONESHOT flag from IRQ request
MIME-Version: 1.0
Message-Id: <20260122-05-k1-i2c-irq-v1-1-9b8d94bbcd22@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJ9mcWkC/x3MSwqAMAwA0auUrA00qYp6FXEhNmoQ/LQggvTuF
 pdvMfNClKASoTMvBLk16rFnUGFgWsd9EVSfDWy5tsSMtsKNUHlCDRd6Yue8b2ZqS8jNGWTW5//
 1Q0oflqgmzl8AAAA=
X-Change-ID: 20260122-05-k1-i2c-irq-d1233dd8f194
To: Andi Shyti <andi.shyti@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, Alex Elder <elder@riscstar.com>, 
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295; i=dlan@kernel.org;
 h=from:subject:message-id; bh=n1GiS+Ch3u2nLGAQ5qcayVMM0M3M5UTjjiWfRPTnAXA=;
 b=kA0DAAoBMarqR1lNu+0ByyZiAGlxZq6jol8rc6i0KYVnmnJvNIRDpqx3w/Dsiyc1fnnxdLUE0
 YkCrwQAAQoAmRYhBLW6uMnDG3EVZwIj3DGq6kdZTbvtBQJpcWauGxSAAAAAAAQADm1hbnUyLDIu
 NSsxLjExLDIsMl8UgAAAAAAuAChpc3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9
 yc2VtYW4ubmV0QjVCQUI4QzlDMzFCNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqu
 pHWU277UoOEACZ5p9LnaVA+kkMQ1kg4fhqsbC2b1guKLuo3Fcr0yhW606ffvjtvnQOheIZ1NZUW
 c01rtedEDpgcXo8DeHxZN1wW4wglAPfcBkg0/QeBu8qA0it+ZuspiSpOVUrolpvnmkZGNc3BK5+
 lbuXBcT/GW2Dx4li+DaAWQ2sY3GM3anZXmco1w/bU6wM4kasS4HSo1wDBQaKmoB+iLFJDXMr9v8
 SdtneLNLOMw4Nd3aCQSNkGARNNRcZzE05TBcsEcXPy/rmlanQE3y10sKlg9xbP/urK7HC9+LBJC
 l9GFYSBndWb5fCNOKFSlb+avHaNfGUUCYHN5mK5PN7nyrJUH4MypFZUDI0gAyRvLBM1/5tv6unc
 XlnamKu/ceimiHvpLyL3nwTvQtcsFDtXZBB9ZuoulLMy9Jheb5cOIiLl8stEtfrW11ol5SdtUIZ
 u689oNk7fBLE/kDSDukGdn7g2S4yRv8fWtG8A67IcUai8qTVb/4/Sc3eZ8E1hR4PSH6IAafPoWy
 ZeqT5LBq9MftKWRbCi3B4266ClgJlgLjO5DO2PDafPrtWSeXkonmAjrXu9bawEFK6Fjtk+I8KPK
 0dah5XkLy3RIJAA7D/3JYjYevoYNlYLM+z+zggMO6PPSy+kMgTGsA25YEJI64dY48b612u9kf0s
 ErLF3Tp9Hvukf+V3gUj0Q==
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

In commit aef30c8d569c ("genirq: Warn about using IRQF_ONESHOT without a
threaded handler")[1], it will check IRQF_ONESHOT flag in IRQ request,
and gives a warning if there is no threaded handler. Drop this flag to
fix this warning.

Link: https://lore.kernel.org/r/20260112134013.eQWyReHR@linutronix.de/ [1]
Fixes: 5ea558473fa3 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index d42c03ef5db5..8ef6d5d1927b 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -566,7 +566,7 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, i2c->irq, "failed to get irq resource");
 
 	ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
-			       IRQF_NO_SUSPEND | IRQF_ONESHOT, dev_name(i2c->dev), i2c);
+			       IRQF_NO_SUSPEND, dev_name(i2c->dev), i2c);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to request irq");
 

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260122-05-k1-i2c-irq-d1233dd8f194

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
