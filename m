Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A615DC6FD1F
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 16:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CuTQi3pGvWgjFM6PTNraqffiUWb/YXBD6Cg2RbQmS58=; b=JCvTrmEUnhoGxp
	Y1PvzfTMqE/C22CnLXecvH1kyw2pmgNHOZGywNKXSD7+Glzu9P2OA3m12Pi2T2V1J3dBrNLC0mu5E
	wEiaBn87nfqRWs40QIscvcFKyNdnS9jfWfXLQCwuK+ClqXgK8M3iZM9KDCd35MYpIG+P0/nZGsJEW
	UVW5SG69BFbQd5rlzJvK8643eu7jizZgIJgEYjni1kfoXC/s24n637W5hGvh2HbLSv+kQ2GGhic2b
	IULu2Jou48cWxVQR82x5OwiGlllnPqyRJxGpPJTOT4fnOTateZZeqRJvvJKKRo4OA9cYTkDs5mgUz
	6TNfSkLDBJ3crRIPiY1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rona6-00000000srS-38PV;
	Mon, 25 Mar 2024 16:53:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ronZz-00000000smC-3TGo
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 16:53:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1AFBD60EB2;
	Mon, 25 Mar 2024 16:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF7FC43399;
	Mon, 25 Mar 2024 16:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711385626;
	bh=USjwiJfYFCW4AFS9tztvFTk4Lr/QV8A+qsGGTHmlU9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aQw3HWi2KumzvUq+QquuTX8sj1Ig+lvifx/LxjM0xOX73RKrN2zBTC1N6EUqN0M8I
	 G7xEyRIaPeb9H3u8Jkox4cQ9xCrthzl1Q/mZ+InXlYwaN9bLqdyscnmnjBzaBdGKPQ
	 kEpHbE+85Yo9a5HfHkdeRMem8ECfQ4McQlJPRS6wgnc+oT8kmgtodWVeHp6PQan8Mn
	 i87UfCVVPyUMJs2+5hIQ9cZKcX8aXZHItnkOKxhZFObkKc/8whsC3vxYU3Jv+F1QqV
	 Sw7PYJNMpiNreRIRDFpBAQRHbgu309evfKT4rbLA5qY8JoM0jmrkajj+qPwN3Dn4i2
	 QOuyLrlxiFh8Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] clocksource/drivers/timer-clint: Add T-Head C9xx clint support
Date: Tue, 26 Mar 2024 00:40:21 +0800
Message-ID: <20240325164021.3229-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240325164021.3229-1-jszhang@kernel.org>
References: <20240325164021.3229-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_095348_035374_2BEC3299 
X-CRM114-Status: GOOD (  10.84  )
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
index 4537c77e623c..71188732e8a3 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -34,6 +34,7 @@ static unsigned int clint_ipi_irq;
 static u64 __iomem *clint_timer_cmp;
 static unsigned long clint_timer_freq;
 static unsigned int clint_timer_irq;
+static bool is_c900_clint;
 
 #ifdef CONFIG_SMP
 static void clint_send_ipi(unsigned int cpu)
@@ -88,6 +89,19 @@ static int clint_clock_next_event(unsigned long delta,
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
 	.name		= "clint_clockevent",
 	.features	= CLOCK_EVT_FEAT_ONESHOT,
@@ -99,6 +113,9 @@ static int clint_timer_starting_cpu(unsigned int cpu)
 {
 	struct clock_event_device *ce = per_cpu_ptr(&clint_clock_event, cpu);
 
+	if (is_c900_clint)
+		ce->set_next_event = c900_clint_clock_next_event;
+
 	ce->cpumask = cpumask_of(cpu);
 	clockevents_config_and_register(ce, clint_timer_freq, 100, ULONG_MAX);
 
@@ -233,5 +250,12 @@ static int __init clint_timer_init_dt(struct device_node *np)
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
+TIMER_OF_DECLARE(clint_timer2, "thead,c900-clint", clint_timer_init_dt);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
