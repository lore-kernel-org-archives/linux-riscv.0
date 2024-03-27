Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0A2C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 15:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESLS74USpg5ki9APeTcOUUffx/nBpwwM1FiarCYvnnw=; b=RnyPw2va8CUUPX
	8U+UQzVyTvT9ychUDV3Y32YQN+znLtJ0G1mHqosVcOE//dWhSoy4O1FfYyRaNLtR8DXTObuLXmvzw
	6rnIslWSHRzGQ8vy7+vImufALWJAjbrssKcHRvnItS/coG/qHoR27g+aLGe5DQf8HzOnq1cYqAhjH
	7X3SPyAgVrmIMmA3LHwBGUockkqG+QRbiUsr9FcptCN2rH5x+WWUYRvDMw7gZdJQwv1Ci2yjGsAvQ
	m8y2WXGu6WtUssUlWMYyzIlYZQM1Qp2UAFfz3CWnwyuLFCaWxtqmkLsF4xdr79mjpsu3/O+42ZYZG
	CmcLV14aNyQNfnbHZFWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVVt-00000009uFM-48jb;
	Wed, 27 Mar 2024 15:48:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVVq-00000009uCZ-1mca
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 15:48:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 50111CE272B;
	Wed, 27 Mar 2024 15:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1735C433B1;
	Wed, 27 Mar 2024 15:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711554503;
	bh=Nw3gMFJ/F/poxLbQzgT93Y2Pv42axzvi9HneGeq24nc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R3vctCY4JRAjYtkAQ9qoJRjfijrTnXvrV+n2Bi6grrTy1C/hCrBQNQG75kqU5pou4
	 7HdzjXIGxIkOXUPUHLVfmemuWs0TkX99r1f1H1fj0v4Uw1DEX5qdpI0vkB0B24c4K4
	 Wi4eRQG1SFM+SfTggRlSwzW35E9NbQ/cmsn5JRCyFBavzMNy7Wmbv3EVj8+re/UTf9
	 P5FaRh5UZ5/zqd3g9RdGF7P8DNji083zB77mImuMUIuYHmg9bVzS3QN4FPvoHPMYiw
	 e8hxkUty/1x8LVKowUWEyj73DMCRqsZXOrWL/MRc0NYyDMqS9vv5N49fliBRdZg4wu
	 74mtVZw54zisg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] clocksource/drivers/timer-clint: Add set_state_shutdown
Date: Wed, 27 Mar 2024 23:35:01 +0800
Message-ID: <20240327153502.2133-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240327153502.2133-1-jszhang@kernel.org>
References: <20240327153502.2133-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_084826_685103_A330A5F4 
X-CRM114-Status: UNSURE (   9.83  )
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

Add clocksource detach/shutdown callback to disable RISC-V timer interrupt when
switching out clockevent from clint timer to another timer.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/clocksource/timer-clint.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 09fd292eb83d..56cf6c672e6d 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -119,11 +119,21 @@ static int clint_clock_next_event(unsigned long delta,
 	return 0;
 }
 
+static int clint_clock_shutdown(struct clock_event_device *evt)
+{
+	void __iomem *r = clint_timer_cmp +
+			  cpuid_to_hartid_map(smp_processor_id());
+
+	writeq_relaxed(ULONG_MAX, r);
+	return 0;
+}
+
 static DEFINE_PER_CPU(struct clock_event_device, clint_clock_event) = {
-	.name		= "clint_clockevent",
-	.features	= CLOCK_EVT_FEAT_ONESHOT,
-	.rating		= 100,
-	.set_next_event	= clint_clock_next_event,
+	.name				= "clint_clockevent",
+	.features			= CLOCK_EVT_FEAT_ONESHOT,
+	.rating				= 100,
+	.set_next_event			= clint_clock_next_event,
+	.set_state_shutdown		= clint_clock_shutdown,
 };
 
 static int clint_timer_starting_cpu(unsigned int cpu)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
