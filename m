Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E61CD1284
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2024 11:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYsMbVAfvcHzdp9IMQJPETr5DhkaHM26Hx2g83nLVZ4=; b=bKen9y3Nsg3O3g
	xDkyis4B4jZXnNj/Q/cKw9yEpJZ2d3Tn1KdcxwhWTGHrxaYt3q+Xc+kkAgR07bAzmJfAjsgUsZhF8
	SwwyYfaYgEh5PnZ5fCxUMRzNA6uXLDNtYxYK3Oy21gNlJHno9unM3uPuBPZPnFWnqgqkNO4JZRb6Q
	XbvaEyXd3gE+lbKKAyfd98NkyFjA4jv6NxS4GFO/rNS3onY5d0Ci9X6RviP/gSrA8FaUTP/4pUIG3
	xm8XxMV+g7AA33bPkB/np7uXp7vmbFc1Ak6Quzv0byXMNd6jtBQe8Ln3EEUpcl7PAUyTWTshHUNaA
	LfOoStmWJmyPQvSZczvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rt4Gi-0000000AD1A-0Mni;
	Sat, 06 Apr 2024 11:31:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rt4Gd-0000000ACxv-0KFl
	for linux-riscv@lists.infradead.org;
	Sat, 06 Apr 2024 11:31:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 76982CE19BE;
	Sat,  6 Apr 2024 11:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4331C433F1;
	Sat,  6 Apr 2024 11:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712403084;
	bh=QNz4CJCFePste/7DhKkLbFCEPMnrk6GSUJBGB1Aj74U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A8XjQBe/E5HTHforMou7F0rT2W0G3OjrHdYJ6K+oat6W4FF6vVUP9NIUAIqT9EJUR
	 uqenOb2f/JATM2VxEjKOCIq8oMSyy1DPKELKFX5K1256zGXVDsS7f6K/qDevPWKkSl
	 7WivOFgVG7kANEROaGzXdC7LTSYVQ6TqzqyHHwsSr1Kirr/Vs5s0ObmhnhS+EKwuVR
	 bd2GGlIvffrXvgNc33owMD0XRJ6F6Y1lohtulMHUIG0PRuAq5pbKNCeDJHiDO+XY4+
	 xPgDLTi21AlyVDJbdJw3XmX4cYBBD/Qndb5zMUqu+n3H1GYqblgHIG97b0S4QaQdGP
	 N3cZKEBv//cLA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/3] clocksource/drivers/timer-clint: Add set_state_oneshot_stopped
Date: Sat,  6 Apr 2024 19:17:57 +0800
Message-ID: <20240406111757.1597-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240406111757.1597-1-jszhang@kernel.org>
References: <20240406111757.1597-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_043127_441462_00EADAD0 
X-CRM114-Status: UNSURE (   9.28  )
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

To avoid spurious timer interrupts when KTIME_MAX is used, we need to
configure set_state_oneshot_stopped(). Although implementing this is
optional, it still affects things like power management for the extra
timer interrupt.

Check commit 8fff52fd5093 ("clockevents: Introduce
CLOCK_EVT_STATE_ONESHOT_STOPPED state") for more information.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/clocksource/timer-clint.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 1c17eff9861e..f468fa8bf5f0 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -134,6 +134,7 @@ static DEFINE_PER_CPU(struct clock_event_device, clint_clock_event) = {
 	.rating				= 100,
 	.set_next_event			= clint_clock_next_event,
 	.set_state_shutdown		= clint_clock_shutdown,
+	.set_state_oneshot_stopped	= clint_clock_shutdown,
 };
 
 static int clint_timer_starting_cpu(unsigned int cpu)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
