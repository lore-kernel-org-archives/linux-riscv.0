Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7353C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 15:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjLekSL2wjYLYewCweEUI0vM/LLTX1MuDYk1nFef1uo=; b=mZ37ZsV56VM4Xg
	4i6syB2XqcfLkqryDxId42uVu2d9xBc8GVLjMPfa7iPCxoIAet6eU06keXNjHL/x8HgSyX8Y2ocRh
	4WrD1SQq9fTfWzEIHgB3IbueLw6rmtbtqpPHDxR5l9K7aCRWqFz6L9nd77DZxmpLT4BvlKTwfJj4F
	CuLAfGgLDZuh/BB3xIPXUJae/pzu+mmAnPkI9Hl1M2g3/i/pgn6h29IHIaT37nRyr6f5d/PlfmoK0
	3FROYk0+j80Xs1zfWtvrv49aQ4GWOc3OyNDdt2y1epSvNPB/e0Jj6kZy/hEBrbYcqkEmeMYAI3DJC
	YEshvugHF17LLtW8Tc+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVVw-00000009uGa-0rM3;
	Wed, 27 Mar 2024 15:48:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVVq-00000009uDd-3dKX
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 15:48:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3DB35615D8;
	Wed, 27 Mar 2024 15:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D24C433F1;
	Wed, 27 Mar 2024 15:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711554505;
	bh=G8Du/nKE3EQGqBI4paXDN1AIdNVl4glAliWu+H6P45c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rJaykR9+OUNmZr8FxTeTlU3uWMWDqdwYbp3icdv9jf2Q6hJMBgQDEBGpikt5hRtAf
	 6La3dI3Nq+RMa6s+5yvwewnzw/JWkIbLhukmqq88cKYBgWA56MFnJxYJhIzMCCsrT2
	 tdnL14om1dRM4/C9RQxh1xS4SJzqci0pX/fYmssovPrdEpAZMqbn7/lp2XLV1/dygo
	 EysNPjAnNgZK+erhl7WXhr0hfGBWQCY+0wU14BCX9wAa3Y4YXsYbJ/pLBU+c6/WDy1
	 /xyzq1sIy9qXQAFVpd4QGDCQC3F/7gyOAzQzskObCZ25XfFaGsPFxoSm6YPYymed7k
	 Blh/EcdKYg7og==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] clocksource/drivers/timer-clint: Add set_state_oneshot_stopped
Date: Wed, 27 Mar 2024 23:35:02 +0800
Message-ID: <20240327153502.2133-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240327153502.2133-1-jszhang@kernel.org>
References: <20240327153502.2133-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_084827_165055_FF43B382 
X-CRM114-Status: UNSURE (   9.32  )
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
index 56cf6c672e6d..f5c04520d6b1 100644
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
