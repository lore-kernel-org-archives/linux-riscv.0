Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AE3CDB479
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 22:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k19JHaExFRdHxGPVZ77h8Ntt+2W1NSjQVjxb9uR24n0=; b=zeAEbm/APaPhJ2
	VvJuRq9hgvKuTifLLCQr+AuqHAafviZwVqWCKLSS0Xg0YYib0KfJfMUbQXB3HJ/ZS2GqijBgrKJAp
	rEGTM9Cs02pfElMRDfTI4HcjGzyB/X2wavTA3gRXR49p8VlFUDCYGFD8ZcZmwOWw2Lf8NxCJXVbAh
	SjfxPzs4OjprHIsiYrT/3q9cJvVZ7vRSQi3fb8p2vmxHhkateoVlyA1uIVuf0NMucyYmY2PXBEasJ
	KVAmjRS/U4k4TGCawSSjsiz/lLvJoLJVUJS51NjN6Cc87kgPM/i3WeSB2ELLSlNF+L9iK8RE+9rby
	Fvofpm+Chk7TmDoa7Fxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcVic-00000008O6k-3DIf;
	Wed, 24 Jun 2026 22:05:14 +0000
Received: from mail.archlinux.org ([2a01:4f9:c010:3052::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcViY-00000008O64-42gt
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jun 2026 22:05:13 +0000
From: Felix Yan <felixonmars@archlinux.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-rsa; t=1782338701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CRHXdpLz3bOfMCjFuHufEqTdHRjLCSuPmqyaKfN5Y1s=;
	b=G0Wxt0r20645tYPp6uRdYV4qaOMahAPpt9HIEZEhBJUZ9LvB0FRD4Nv7314wJIPfugc7Rf
	tFNq6CPbfDbHkjRjlPBeOTgzl/RF/toPHCNmRuNpRK5bc4+dLqA+i3Sa+LD8vuj6F50xJz
	KxHRme9PoF/TNfHzHYSJwaDjHSBTorQFY6txaMUiNd44grAIEIi32QqhL8Q8kA7yMVOUe1
	QCdvInGQwnzKT53O6Up7CdMkhIvcTNXxoxMGAdOebFw9NAzWrcjO+0Y07WIkEt5QHLowV/
	EUOZIWcXgdIDUYyvvtj1qxjwzEkBTIkTEshM4FxV5LrQ4qXoiOzIXvW9n0CK70SRcH6iRM
	5e44m1drrrfIOPjiX0XH1HSn1OV3V+EZpIhMW/bjqQPcVpTnSyeXYKqrdGEFijVV+Se2EC
	BvK/4ewxXjp0+yFE0VKd+nt4JEwRTwIY3FWFi7+egV80xo1+2bLUQ5qc+WoeGxSoOfT7pF
	xthcPBheysDSoRCc/xMYBtzuSV1013HjhQA6eI4kyKP++nGvZJByScfOXs4J/EzLagyWHG
	KuTSDY/GLnu8BHjF6a/57aVuKAllVv2H4EkdNlvp7qe58Neob0jB58xgbStpx6O9Kka3M0
	jzAWsSGnIaV4y2D+HsdEzRrMP/DT80ZGQ5LQS/rfVxxslJVuwrHjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-ed25519; t=1782338701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CRHXdpLz3bOfMCjFuHufEqTdHRjLCSuPmqyaKfN5Y1s=;
	b=rHA48A4ipOYEPx6vlpsau0zfNunJTQvt1uNml7YWW3bqQlSRwEr/AuO9AlLUWNVGXnt++S
	P0IvDvf1UQDBKKAA==
Authentication-Results: mail.archlinux.org;
	auth=pass smtp.auth=felixonmars smtp.mailfrom=felixonmars@archlinux.org
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	indrek.kruusa@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Felix Yan <felixonmars@archlinux.org>,
	stable@vger.kernel.org
Subject: [PATCH] clocksource/drivers/timer-sun4i: Advertise a real minimum delta
Date: Thu, 25 Jun 2026 06:04:34 +0800
Message-ID: <20260624220434.4183732-1-felixonmars@archlinux.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CA+fTLhgLmTY+exGujKf8OYYQvcEW5X5NJ_5sLq2AYL6zER2c0A@mail.gmail.com>
References: <CA+fTLhgLmTY+exGujKf8OYYQvcEW5X5NJ_5sLq2AYL6zER2c0A@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_150511_622276_2B1E2DD3 
X-CRM114-Status: GOOD (  10.10  )
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

sun4i_clkevt_next_event() compensates for the timer stop/start
synchronization delay by programming evt - TIMER_SYNC_TICKS into the
hardware interval register. The clockevent device currently advertises
TIMER_SYNC_TICKS as min_delta_ticks, so the clockevents core is allowed
to call set_next_event() with evt == TIMER_SYNC_TICKS.

That programs a zero-tick interval. With oneshot/highres/nohz timer
operation this can leave the next event stuck, which was observed as a
boot hang on Allwinner D1 after the clockevents core started reusing
forced minimum-delta events.

Advertise one extra tick instead, so the smallest event accepted by the
core still programs at least one hardware tick after the synchronization
compensation.

Fixes: 12e1480bcb49 ("clocksource: sun4i: Report the minimum tick that we can program")
Cc: stable@vger.kernel.org
Reported-by: Indrek Kruusa <indrek.kruusa@gmail.com>
Closes: https://lore.kernel.org/linux-riscv/CA+fTLhgLmTY+exGujKf8OYYQvcEW5X5NJ_5sLq2AYL6zER2c0A@mail.gmail.com/
Assisted-by: Codex:gpt-5.5
Signed-off-by: Felix Yan <felixonmars@archlinux.org>
---
 drivers/clocksource/timer-sun4i.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
index 7bdcc60ad43c..c2d04ab7cf2d 100644
--- a/drivers/clocksource/timer-sun4i.c
+++ b/drivers/clocksource/timer-sun4i.c
@@ -208,7 +208,7 @@ static int __init sun4i_timer_init(struct device_node *node)
 	sun4i_timer_clear_interrupt(timer_of_base(&to));
 
 	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
-					TIMER_SYNC_TICKS, 0xffffffff);
+					TIMER_SYNC_TICKS + 1, 0xffffffff);
 
 	/* Enable timer0 interrupt */
 	val = readl(timer_of_base(&to) + TIMER_IRQ_EN_REG);
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
