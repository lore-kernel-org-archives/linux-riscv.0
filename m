Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADE9CD1280
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 15:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q30epaVw63ETitJ8gVP7p+huaxV7XiKtrP45smsoFg0=; b=dPNSIj9hLb1RK5
	/2lJg9A/upgRgmRpYbl2nklBPykMx1zZpsSDj3LWQ76HUzCdHQTRB3yUyzhrsCnspcGvtOZSSRGUw
	ZFdpU/XqM6R1IW7GINy3wkdyrPTa8D1KUrx90Xd1VtxNZx4/8l3CRb8Vlo1ZQxL0T/RRWFuN87tQR
	azttJUtpUq9EeuCVpXi992Qf9xSIsrPztLvQtXNvWAZQTs+yJ43svNuzO59WkRcOnOpMN3a5WRMnc
	mYmPH8u8EFsj136RLpyVLROx2fsTfIc/gf+lUZqEWDO3yoVIYXJ+LzlLEpSTFU0X1jh61FOelnRmD
	r7+EMOu/OshEAVoZLWYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVVp-00000009uCy-2O9x;
	Wed, 27 Mar 2024 15:48:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVVm-00000009uAu-0VCV
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 15:48:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81377615F6;
	Wed, 27 Mar 2024 15:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A95BC433C7;
	Wed, 27 Mar 2024 15:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711554501;
	bh=kxw8lEOeXnx/duF9z7ST9TT/zC6EoGrvtJe8oJFI1B0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sr1y1Cuu9f/Se064mDUn1HaCUkTnbO9IBcwOnhO4s3a/Mlvj19hhrxttE8kNOJA1i
	 zW0nSCuYqRkkblNx79/0IToZ+uYKPrVtK/RsRTGET65JvBUlbnBr+xnURpFy6E9uEO
	 Jsc+HyY1Qqo4OpmJ5FHxS0LBgybRWxjAhhIC2DbLn+PzW/Mry+jN1z3i0/FuRNrs0A
	 T0BNpgtrWjidXAsNZVrDC5m0wr0xCw1IWoUuwrYkFCsnQe19gwecezPAQgkZcYdkCK
	 Jl7Orhrx+qfMJ4Tv93a6bLdHSbX/8kFx+KwKZCKZ40GSm5YwG8T0gWZ6tGf2kVX46Y
	 V+Yf/i5ucujfA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] clocksource/drivers/timer-riscv: Add set_state_oneshot_stopped
Date: Wed, 27 Mar 2024 23:35:00 +0800
Message-ID: <20240327153502.2133-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240327153502.2133-1-jszhang@kernel.org>
References: <20240327153502.2133-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_084822_235787_85BD20FA 
X-CRM114-Status: GOOD (  10.88  )
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
