Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E122D72379
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 11:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8zt0Zevh7PcDHC6K9PuUWmEK8y0+G6AtQEoLqUaotk=; b=fvXeNZrRGPyfj5
	+0caGmrin/XmY2ayDNIUaAT4w74rkmZZ10yWfoliI07wp+mTEvOm5KMeu4tCcnTlJr+LZ+wz+OgZY
	gv8byuIIY5Jkn43Ph5HkoSPqzu4W4K2dI2Jf9b0efHAKQSbFUpdSz9V/G/B9ffU/xXwl9vTwDP2FO
	tsu+tM/8apClt8LDf4/cbJhRfHujdkYNM7OyFpGeavDEw0yo40w7nmuS91ttI4bCzusrkxboh5EBV
	0KA14irhXbIoYu3RCIFozFwESOWfaEed/vYDWmpnNAKmgF/q5dEqVA5XQSGb8iEIP2NQ5XjVXlN/k
	STKgZfmSxgc0G2jJo9qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFTh-00000008rAj-3AMB;
	Fri, 23 Jan 2026 11:37:25 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFTd-00000008r84-0uDJ
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 11:37:22 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769168236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ClL8eAZdmuNbLusg5jOxF2eIGZ+kWzlW9HMsa2ckZU=;
	b=pxyTdVBQ8iNBWKLo47O3PiDCbrqnj6d/vA5AtrI7kRBHJ2n1D0ZVdaRtDJ74Dpq8QHaDM6
	dt9gPz9AdR0TYfQkG+ri9oEFTfuUEYFeF4tAFIagXWObcsVcsPqPjbSauwIWa4KSPexIay
	hVmXRv/N4WVTHn4CxILhrLgKab3vou3+nr08bNgVx6ypqPG9zMz5xxdI1CQpb9b3rAV78w
	iNlcIBGglqlLlQC8rZ5wmVkoJnGjgAxmQDgiyQsAGbKFxykxU5gSXYbAhytltwzkdLJKSw
	GCwKXxbMT0oAiMCLhw2MExOu9GqlA8cOkvDqmhpxIS/cEIvmBeY7dQLR/YofKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769168236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ClL8eAZdmuNbLusg5jOxF2eIGZ+kWzlW9HMsa2ckZU=;
	b=b3KhJVodDLUW0D4Ju/ixICFDI3BkVvr6KzwD8FRjZSMmF43nHEMJI0S/4/xiJjK/FW9Ugx
	VIPgsPFClpxm1uBA==
To: linux-kernel@vger.kernel.org
Cc: linux-rt-devel@lists.linux.dev,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 11/21] i2c: spacemit: Remove IRQF_ONESHOT
Date: Fri, 23 Jan 2026 12:36:57 +0100
Message-ID: <20260123113708.416727-12-bigeasy@linutronix.de>
In-Reply-To: <20260123113708.416727-1-bigeasy@linutronix.de>
References: <20260123113708.416727-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_033721_412073_54BF9AF7 
X-CRM114-Status: UNSURE (   9.60  )
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

Passing IRQF_ONESHOT ensures that the interrupt source is masked until
the secondary (threaded) handler is done. If only a primary handler is
used then the flag makes no sense because the interrupt can not fire
(again) while its handler is running.
The flag also disallows force-threading of the primary handler and the
irq-core will warn about this.

Remove IRQF_ONESHOT from irqflags.

Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>
Cc: linux-i2c@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index d42c03ef5db59..8ef6d5d1927b7 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -566,7 +566,7 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, i2c->irq, "failed to get irq resource");
 
 	ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
-			       IRQF_NO_SUSPEND | IRQF_ONESHOT, dev_name(i2c->dev), i2c);
+			       IRQF_NO_SUSPEND, dev_name(i2c->dev), i2c);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to request irq");
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
