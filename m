Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A66C5DF75
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 07:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+EczaxtSpJ080jO9xogHsqoHd8ozFbo/s2DPBod/77g=; b=D7Mtcz8bCqeTCP
	bjOz0sn6NhYtsJSjJ8WCH1a/AMION0jQdaQEGQnupRdPYUjPJBebMWccrYu8Itn/SjZPJvtv50H51
	kJiWi6C8Il3KHaRZWzrS85kGYlT8vUOsYS7jdfzot9WcblWKivjIaQ+gkSZyoJhbg+ogFyguFXZ90
	MA5yHJ4tnMOy/I40QCSk4h9L5dSbyk2bKvxj+pmZ3P7rJvSOEdDHfHXSXCdHF3bNMwtJ8C3BWXtyP
	zqzVojVG/Nu3RCk5EbJWA7veQ7EYZBjJqApP/u+dqN4VrbkGqhPXKqSLRiBYTky0o089OmOqTBaEq
	8udqE6AJpE+zrJCet7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvUru-00000004Xdm-2acI;
	Sun, 16 Aug 2026 07:01:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvUrt-00000004Xd8-0Ext
	for linux-riscv@lists.infradead.org;
	Sun, 16 Aug 2026 07:01:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BF9660055;
	Sun, 16 Aug 2026 07:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12121F00A3A;
	Sun, 16 Aug 2026 07:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786863676;
	bh=eKuwhqI5qpVbYFVU0dwz1JwffwYDZd8/Fx3eNFM3EQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jY8BcGCgRhfHYuk3ot2jiLnFGOFY3inTilhwH/SR4CPiBpreaVPtXzFy9R7KWL4XT
	 zPTLWSBFxUFA6NgzgIASL6mP5JR3WwqKttGEKhNdzRKeVeEmr7x108rF+0ZIM337L8
	 nHXh3WvFT7Babj1fd0W1wBYutQFwrk+hOxM2Zp44gwoG06jSor3HYgydr1/XXAr6i1
	 MqV8E7frAGA05LKhnap3MPm/bXZdmcvk7L6mF+xpEGbpz8MeahXgU+j22XKovLPyGZ
	 W5gZd+zRM9gTjvqMwxYEVWbNjm2Xrsizg+DhvGiHjmcEJfGA5jdM0iuri4U5BqlPHx
	 hQo+Io8Eqg2dw==
From: Guo Ren <guoren@kernel.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	daniel.lezcano@kernel.org,
	anup@brainfault.org,
	hui.wang@canonical.com,
	samuel.holland@sifive.com,
	"GUO Ren (XuanTie)" <guoren@kernel.org>
Subject: [PATCH 3/5] clocksource: clint: Use IPI_MAX for IPI muxing
Date: Sun, 16 Aug 2026 07:00:47 +0000
Message-ID: <20260816070049.2097442-4-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816070049.2097442-1-guoren@kernel.org>
References: <20260816070049.2097442-1-guoren@kernel.org>
MIME-Version: 1.0
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

From: "GUO Ren (XuanTie)" <guoren@kernel.org>

Replace the hard-coded BITS_PER_BYTE with IPI_MAX now that the
constant is exported from riscv asm/smp.h.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 drivers/clocksource/timer-clint.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 0bdd9d7ec545..e56eee7e3781 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -243,7 +243,7 @@ static int __init clint_timer_init_dt(struct device_node *np)
 	}
 
 #ifdef CONFIG_SMP
-	rc = ipi_mux_create(BITS_PER_BYTE, clint_send_ipi);
+	rc = ipi_mux_create(IPI_MAX, clint_send_ipi);
 	if (rc <= 0) {
 		pr_err("unable to create muxed IPIs\n");
 		rc = (rc < 0) ? rc : -ENODEV;
@@ -251,7 +251,7 @@ static int __init clint_timer_init_dt(struct device_node *np)
 	}
 
 	irq_set_chained_handler(clint_ipi_irq, clint_ipi_interrupt);
-	riscv_ipi_set_virq_range(rc, BITS_PER_BYTE);
+	riscv_ipi_set_virq_range(rc, IPI_MAX);
 	clint_clear_ipi();
 #endif
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
