Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B9EC67861
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2024 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yjzo1BvZVsQXjy9/EjDk4De7ehXMfNSr8JPvf4XFZLg=; b=4tdJgdYXSYk9OG
	AdHvFmp4XybYPVFGdLX3LoOVx+C7lrAETuX1VNEcLgpy6GXvUSXgeVVpQxtfX35GyGOZNhjX4tcNq
	yBycsoykWaKejszyWb3IR0rD1Ah1TW//4hczXK8MVz55R8yG/xKZaBo5lto5/bpccICFoZkeS2Zii
	myfPdXeW2fzTjTtUf2uD0ThXr6f233QbXFzNrrPGofXK46yBgJQXg+nB282fzQyG8ywJS/0AAZ4pm
	IlGyCaO4dAFAyS2g132IPdqRNWf11Wk/SXOxQHKftXJBRyWMdYuWe8JAMOzeOHJJuxEbbT5LQPTqc
	eMRy3d0btiGjc065zGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rt4KY-0000000ADh8-2g3E;
	Sat, 06 Apr 2024 11:35:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rt4KV-0000000ADff-3xHp
	for linux-riscv@lists.infradead.org;
	Sat, 06 Apr 2024 11:35:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A85260B4F;
	Sat,  6 Apr 2024 11:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD54C433C7;
	Sat,  6 Apr 2024 11:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712403326;
	bh=R97Q2QZSx04EEg2PLja5HX11nqpX6+6Z/tNLhIWtFfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GBDDrChk1RUq4DtnWONvFCFXv1lrG6pW0ZHR2l8oUKM0hzrs63WR0FLoz0PP9FwEB
	 fUzdWpR9hmpGQAl/Jc94fGxDJRBr6VNV9g/FVmcXpYcEjVHpXlBOKXGBf2KhgfNbwd
	 2mGvpKF/07K0hb1i2zLkobtmewHREGYShNg3IfLOUpYI5a0cwPfV0vSBgFg7CO3TLa
	 5E4HPquhMzxBoAxRlOvzr4A/pHviHN5HPHwaOzxeo1u4ihNyKjf/SNfxHiHEzklIf0
	 fUlWKp5vYZ9Pbh05QW2A/5xEY1ARe9jicwbtDx43kWjHuNqJnvti9S2skkgT5foVJG
	 +Ip4WtUlN8iZw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] clocksource/drivers/timer-clint: Add T-Head C9xx clint
Date: Sat,  6 Apr 2024 19:21:59 +0800
Message-ID: <20240406112159.1634-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240406112159.1634-1-jszhang@kernel.org>
References: <20240406112159.1634-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_043528_088734_4D955775 
X-CRM114-Status: GOOD (  10.27  )
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

The mtimecmp in T-Head C9xx clint only supports 32bit read/write,
implement such support.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/clocksource/timer-clint.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 0d3890e00b75..655ea81071ff 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -39,6 +39,7 @@ static u64 __iomem *clint_timer_cmp;
 static u64 __iomem *clint_timer_val;
 static unsigned long clint_timer_freq;
 static unsigned int clint_timer_irq;
+static bool is_c900_clint;
 
 #ifdef CONFIG_RISCV_M_MODE
 u64 __iomem *clint_time_val;
@@ -135,6 +136,19 @@ static int clint_clock_shutdown(struct clock_event_device *evt)
 	return 0;
 }
 
+static int c900_clint_clock_next_event(unsigned long delta,
+				       struct clock_event_device *ce)
+{
+	void __iomem *r = clint_timer_cmp +
+			  cpuid_to_hartid_map(smp_processor_id());
+	u64 val = clint_get_cycles64() + delta;
+
+	csr_set(CSR_IE, IE_TIE);
+	writel_relaxed(val, r);
+	writel_relaxed(val >> 32, r + 4);
+	return 0;
+}
+
 static DEFINE_PER_CPU(struct clock_event_device, clint_clock_event) = {
 	.name				= "clint_clockevent",
 	.features			= CLOCK_EVT_FEAT_ONESHOT,
@@ -148,6 +162,9 @@ static int clint_timer_starting_cpu(unsigned int cpu)
 {
 	struct clock_event_device *ce = per_cpu_ptr(&clint_clock_event, cpu);
 
+	if (is_c900_clint)
+		ce->set_next_event = c900_clint_clock_next_event;
+
 	ce->cpumask = cpumask_of(cpu);
 	clockevents_config_and_register(ce, clint_timer_freq, 100, ULONG_MAX);
 
@@ -291,5 +308,12 @@ static int __init clint_timer_init_dt(struct device_node *np)
 	return rc;
 }
 
+static int __init c900_clint_timer_init_dt(struct device_node *np)
+{
+	is_c900_clint = true;
+	return clint_timer_init_dt(np);
+}
+
 TIMER_OF_DECLARE(clint_timer, "riscv,clint0", clint_timer_init_dt);
 TIMER_OF_DECLARE(clint_timer1, "sifive,clint0", clint_timer_init_dt);
+TIMER_OF_DECLARE(clint_timer2, "thead,c900-clint", c900_clint_timer_init_dt);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
