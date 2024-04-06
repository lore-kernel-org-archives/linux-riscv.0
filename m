Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F383C67861
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2024 11:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q30epaVw63ETitJ8gVP7p+huaxV7XiKtrP45smsoFg0=; b=pysXt8nt8eE16c
	T7jAYaSf3r2xietnfMyHXd9c9ANL463JktReIrriGc+k9L9pKZlskUkQACwyTn8HLsdmGkc2beIP+
	j6ddZDpZPsgFjE8i9AwGS3882cCv6WwqaZ8W6k01L3z7nZz5PDsJ4tadA4kYo9Vo+Kbrw1p8ApHyG
	0WqkxnN4bZIfXcltgX5tNipdxrUCkpVllWOMm8cnI3hyYzBXnw1hL4kahNw4XFCAxHClYhUtCU5FD
	T1TF8CO00y++jobL1blabDf2P05ZRehHEFDbcWDXIm/bP27NTneexThVgkbuGssDWeh1Iv/CP2D1x
	8bhUqNBZGBUawPK0W1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rt4Gc-0000000ACy7-3O66;
	Sat, 06 Apr 2024 11:31:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rt4GZ-0000000ACw3-1V3I
	for linux-riscv@lists.infradead.org;
	Sat, 06 Apr 2024 11:31:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 358D8CE19BE;
	Sat,  6 Apr 2024 11:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D00C9C43390;
	Sat,  6 Apr 2024 11:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712403080;
	bh=kxw8lEOeXnx/duF9z7ST9TT/zC6EoGrvtJe8oJFI1B0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kD+KtTXj/GBjQUtr6D1v/myTGzsq973TWGwuzcxWDl6/CjFmbP50gM/JVNX58qrgd
	 EUcASu06PHK5jfQ3QNBfcSNrsLpU7hjW9xVTzsUQ8BCdx59mBulPvueYfkwwhZh1D3
	 Ro4Cs/FOBTRN2zGolCo9LGk43zQhmZC/ZB4Rs4/PXyJS0X35Gg8HyttKhBQHaT3erO
	 PhwZfs16AI77tZ+6Py0jXcj9ZcBwMwW/U+hAbUGaslrA9P4Owjs/jFxLQmXH62SGvh
	 DOVmIxFb0qf+tnmLIuXObaJkPONg1btiKj9dDq/7L+WYYej7XRoQ4vdH8MUDWbgsXP
	 +8m3vR/9SczOQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/3] clocksource/drivers/timer-riscv: Add set_state_oneshot_stopped
Date: Sat,  6 Apr 2024 19:17:55 +0800
Message-ID: <20240406111757.1597-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240406111757.1597-1-jszhang@kernel.org>
References: <20240406111757.1597-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_043123_608702_BC4B7F49 
X-CRM114-Status: GOOD (  10.54  )
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

To avoid spurious timer interrupts when KTIME_MAX is used, we need to
configure set_state_oneshot_stopped(). Although implementing this is
optional, it still affects things like power management for the extra
timer interrupt.

Check commit 8fff52fd5093 ("clockevents: Introduce
CLOCK_EVT_STATE_ONESHOT_STOPPED state") for more information.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/clocksource/timer-riscv.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 48ce50c5f5e6..e661fc037337 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -69,11 +69,12 @@ static int riscv_clock_shutdown(struct clock_event_device *evt)
 
 static unsigned int riscv_clock_event_irq;
 static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
-	.name			= "riscv_timer_clockevent",
-	.features		= CLOCK_EVT_FEAT_ONESHOT,
-	.rating			= 100,
-	.set_next_event		= riscv_clock_next_event,
-	.set_state_shutdown	= riscv_clock_shutdown,
+	.name				= "riscv_timer_clockevent",
+	.features			= CLOCK_EVT_FEAT_ONESHOT,
+	.rating				= 100,
+	.set_next_event			= riscv_clock_next_event,
+	.set_state_shutdown		= riscv_clock_shutdown,
+	.set_state_oneshot_stopped	= riscv_clock_shutdown,
 };
 
 /*
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
