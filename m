Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1B2C7115B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 01:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9JEmKRWut7M8jfv32q3UfLCzB5QaLU05UigaZ3ywANg=; b=mCFubE0ZeMSOv+
	CIwf+2RTdRgmylsd4wXgO9QJs/876vyIOUp3JbYZGQIRqm2WRxjpzwsbEG36q/Z93AIXOWwSXpdLV
	bqCPgrmaIp4HRjMCQYb2jQzjvvDebJgEb/utUsrrfkSfD8dHC8TibOsuhwDbCtq13wg1OM1rN24aO
	BT2mZiFhl71yYN5SeGkzWr2pBLtUaCCaGuTFH/tFUNgleuaBr55UZvq1dLV3SgoB9Z20sqKgN3wLh
	hitN7CerRYoMfdPMdzWl4pSHKbCLE8joVDr+Artgi3d54gqnBn0F3GPxyBuAN5yxizqSVquRmSD/i
	+VwuaH7icwD7MHXjhytQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTsch-00000004OIz-3NNU;
	Tue, 24 Jun 2025 01:38:55 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTqO4-000000049Uc-0uy0
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 23:15:41 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6faf66905baso71612186d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 16:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750720538; x=1751325338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=175cCQ+806PnZFL+SfNpgPYH/vuq+jIrXxwnyKJn0VY=;
        b=CFcTGIAyZ9Tm/AKPfTJ97PDsYpPS4GRlZNEPltIBWVQiq5R2wMthSxkrV0T8tN1k+s
         ug18Oyf/QNcl9yYDLFUez23bWN8K1jjrIZd9+xshE3a1INEY2H4rNaw/kD7LFQR1peDE
         H5AO0ZaEgKJiC7ZKJrPVmOuGSxaY7k0ijlN9AWAiFiU8sySqOdt2jB9IUMM+7NdnoZJ+
         yDvDF9+nRd3Q0xP0cIAfbuQ/LEqCghHtvJyfRGYzay5qVKXwy/RvtKdsDW3qxQz0NBu0
         F8iHYYkxoF6aYIGCEnCwvQgdfsnnxwJ/7X0stjfUuJ41S4itX8UUgDzi8QFnkB/BSXjD
         ybnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750720538; x=1751325338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=175cCQ+806PnZFL+SfNpgPYH/vuq+jIrXxwnyKJn0VY=;
        b=GYoM0mptmL1hcfZOrc887RQv1e/2/3nNirmrWQzlW2tsk0iB0qKeRyy/7niZ2fAgDC
         AZm1uvtuN5k6yVOzcLkfa+Fx/iyUmGn1K4O5SY19GgCn3JGnXCX0yVNAptLvAp1l99mc
         QQ3XwoN1RERmh7KZutZbyAgDy0i1gWVxsRLatJmqo4lN79mBMNlnKmtaNUyXDeWPNYKJ
         09iQ0qftmb186zlHTkqKZTvAvtDMr5rIyxz7VTnE3KtZCQRml7vz5zjQkD6tfD+Bgh+f
         0XyMizFzGI0jbyyTqBsm+K6D06Q4X3z849VJ+GAGm4aVdexEL9LYoh0w4NX9bWcgYuvS
         JTgQ==
X-Gm-Message-State: AOJu0YxpTLyFEXOqIPV+vmwfntm/ECtwlQSSosVd4KlxvN74WFqTI6KI
	ulAmmXYMqXgK1T25Pm479ox3HDytGKi8VERRiVWqIam58Ev85xOjRwETgiWGC9Vv
X-Gm-Gg: ASbGncufCfBMWnTQhRcFmsbO0jFLg0Oh79pdGt28O3B0avsw12WzrQAmdUTG9sbCM+c
	iry0203RbP7BAnfBqzmWeMyvQRNDZny+TMIPMS7yTep84Gi/8Fv8EuquxnrxXBFIQ8Cq+3haOSD
	l7Yso0dI0Tey7xLqG4s3xHPh4F6ftPaGTJNTyuBXOQEClhRXI7gGU07W4D67tZQEgYe3ZgCGHgK
	d3/3xNnqMdn9KqCfyEwwrXFi/WFbUitYO9fdGdHkR72dZp1JbvjYF1px8pRH60bEp1t1rUkfcmL
	/kvbbtA8lLdllBTmq2Ix+3nKZT9mzB8azg8w+TnS7p7IvU6JLUnasgXIgochhURuoV6f3AI7zYT
	AnXYG2Mb5nLxh47JAS6FZHz/qg64VtOrEEVbPTcnomxZzM5fxVBczv6tn
X-Google-Smtp-Source: AGHT+IFAllavyjGrl8uBXg56Alxjy56EzPw325XgmCouBn28R+zM+Y8Zq59UZClJ+hIVeHMULOPNXQ==
X-Received: by 2002:a05:6214:5183:b0:6fa:caa2:19bc with SMTP id 6a1803df08f44-6fd0a600936mr187217796d6.44.1750720538253;
        Mon, 23 Jun 2025 16:15:38 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99ef89dsm439562285a.64.2025.06.23.16.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 16:15:37 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v6] clocksource/drivers/timer-clint: Add T-Head C9xx clint
Date: Mon, 23 Jun 2025 19:15:36 -0400
Message-ID: <20250623231536.1120282-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_161540_272023_E13EC50C 
X-CRM114-Status: GOOD (  24.01  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <Mr.Bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jisheng Zhang <jszhang@kernel.org>

To use the T-HEAD C9xx clint in RISCV-M NOMMU env, we need to take
care two points:

1.The mtimecmp in T-Head C9xx clint only supports 32bit read/write,
implement such support.

2. As pointed out by commit ca7810aecdba ("lib: utils/timer: mtimer:
add a quirk for lacking mtime register") of opensbi:

"T-Head developers surely have a different understanding of time CSR and
CLINT's mtime register with SiFive ones, that they did not implement
the mtime register at all -- as shown in openC906 source code, their
time CSR value is just exposed at the top of their processor IP block
and expects an external continous counter, which makes it not
overrideable, and thus mtime register is not implemented, even not for
reading. However, if CLINTEE is not enabled in T-Head's MXSTATUS
extended CSR, these systems still rely on the mtimecmp registers to
generate timer interrupts. This makes it necessary to implement T-Head
C9xx CLINT support in OpenSBI MTIMER driver, which skips implementing
reading mtime register and falls back to default code that reads time
CSR."

So, we need to fall back to read time CSR instead of mtime register.
Add riscv_csr_time_available static key for this purpose.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
Treat this as a completely new patch, as it is mostly rewritten.
Original:
https://lore.kernel.org/all/20240410142347.964-3-jszhang@kernel.org/
V3 -> V4:
 - Add riscv,csr-clint
 - Allow using of CSRs in S mode
 - Change if return else return to if return return
 - Change static_branch_likely to static_branch_unlikely
 - Fix 32-bit clint_get_cycles64 csr_available check being inverted
 - Fix is_c900_clint being uninitialized
V4 -> V5:
 - Remove riscv,csr-clint
 - Remove riscv_csr_time_available
 - Replace all static_branch_unlikely(&riscv_csr_time_available) with
    riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR)
V5 -> V6:
 - Add csr_clock_next_event
 - Add csr_get_cycles64 to sched_clock_register
 - Break get_cycles64 into csr_get_cycles64 and clint_get_cycles64
 - Change default behavior to use CSR time register

Posible future work:
 - Check for SSTC support and use stimercmp
 - SSTC depends on smode which cpufeature doesnt check for.
---
 arch/riscv/include/asm/timex.h    | 12 ++++-
 drivers/clocksource/timer-clint.c | 82 +++++++++++++++++++++++++++++--
 2 files changed, 89 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
index a06697846e69..d78075351bf4 100644
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -17,17 +17,26 @@ typedef unsigned long cycles_t;
 #ifdef CONFIG_64BIT
 static inline cycles_t get_cycles(void)
 {
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
+		return csr_read(CSR_TIME);
+
 	return readq_relaxed(clint_time_val);
 }
 #else /* !CONFIG_64BIT */
 static inline u32 get_cycles(void)
 {
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
+		return csr_read(CSR_TIME);
+
 	return readl_relaxed(((u32 *)clint_time_val));
 }
 #define get_cycles get_cycles
 
 static inline u32 get_cycles_hi(void)
 {
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
+		return csr_read(CSR_TIMEH);
+
 	return readl_relaxed(((u32 *)clint_time_val) + 1);
 }
 #define get_cycles_hi get_cycles_hi
@@ -40,7 +49,8 @@ static inline u32 get_cycles_hi(void)
  */
 static inline unsigned long random_get_entropy(void)
 {
-	if (unlikely(clint_time_val == NULL))
+	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR) &&
+	   (unlikely(clint_time_val == NULL)))
 		return random_get_entropy_fallback();
 	return get_cycles();
 }
diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 0bdd9d7ec545..f80e81571652 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -39,6 +39,7 @@ static u64 __iomem *clint_timer_cmp;
 static u64 __iomem *clint_timer_val;
 static unsigned long clint_timer_freq;
 static unsigned int clint_timer_irq;
+static bool is_c900_clint;
 
 #ifdef CONFIG_RISCV_M_MODE
 u64 __iomem *clint_time_val;
@@ -81,6 +82,12 @@ static u64 notrace clint_get_cycles64(void)
 {
 	return clint_get_cycles();
 }
+
+static u64 notrace csr_get_cycles64(void)
+{
+	return csr_read(CSR_TIME);
+}
+
 #else /* CONFIG_64BIT */
 static u64 notrace clint_get_cycles64(void)
 {
@@ -93,8 +100,26 @@ static u64 notrace clint_get_cycles64(void)
 
 	return ((u64)hi << 32) | lo;
 }
+
+static u64 notrace csr_get_cycles64(void)
+{
+	u32 hi, lo;
+
+	do {
+		hi = csr_read(CSR_TIMEH);
+		lo = csr_read(CSR_TIME);
+	} while (hi != csr_read(CSR_TIMEH));
+
+	return ((u64)hi << 32) | lo;
+}
+
 #endif /* CONFIG_64BIT */
 
+static u64 csr_rdtime(struct clocksource *cs)
+{
+	return csr_get_cycles64();
+}
+
 static u64 clint_rdtime(struct clocksource *cs)
 {
 	return clint_get_cycles64();
@@ -105,9 +130,20 @@ static struct clocksource clint_clocksource = {
 	.rating		= 300,
 	.mask		= CLOCKSOURCE_MASK(64),
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
-	.read		= clint_rdtime,
+	.read		= csr_rdtime,
 };
 
+static int csr_clock_next_event(unsigned long delta,
+				   struct clock_event_device *ce)
+{
+	void __iomem *r = clint_timer_cmp +
+			  cpuid_to_hartid_map(smp_processor_id());
+
+	csr_set(CSR_IE, IE_TIE);
+	writeq_relaxed(csr_get_cycles64() + delta, r);
+	return 0;
+}
+
 static int clint_clock_next_event(unsigned long delta,
 				   struct clock_event_device *ce)
 {
@@ -119,17 +155,36 @@ static int clint_clock_next_event(unsigned long delta,
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
 	.rating		= 100,
-	.set_next_event	= clint_clock_next_event,
+	.set_next_event	= csr_clock_next_event,
 };
 
 static int clint_timer_starting_cpu(unsigned int cpu)
 {
 	struct clock_event_device *ce = per_cpu_ptr(&clint_clock_event, cpu);
 
+	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
+		ce->set_next_event = clint_clock_next_event;
+
+	if (is_c900_clint)
+		ce->set_next_event = c900_clint_clock_next_event;
+
 	ce->cpumask = cpumask_of(cpu);
 	clockevents_config_and_register(ce, clint_timer_freq, 100, ULONG_MAX);
 
@@ -161,7 +216,7 @@ static irqreturn_t clint_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int __init clint_timer_init_dt(struct device_node *np)
+static int __init clint_timer_init(struct device_node *np)
 {
 	int rc;
 	u32 i, nr_irqs;
@@ -227,13 +282,19 @@ static int __init clint_timer_init_dt(struct device_node *np)
 
 	pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
 
+	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
+		clint_clocksource.read = clint_rdtime;
+
 	rc = clocksource_register_hz(&clint_clocksource, clint_timer_freq);
 	if (rc) {
 		pr_err("%pOFP: clocksource register failed [%d]\n", np, rc);
 		goto fail_iounmap;
 	}
 
-	sched_clock_register(clint_get_cycles64, 64, clint_timer_freq);
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
+		sched_clock_register(csr_get_cycles64, 64, clint_timer_freq);
+	else
+		sched_clock_register(clint_get_cycles64, 64, clint_timer_freq);
 
 	rc = request_percpu_irq(clint_timer_irq, clint_timer_interrupt,
 				 "clint-timer", &clint_clock_event);
@@ -273,5 +334,18 @@ static int __init clint_timer_init_dt(struct device_node *np)
 	return rc;
 }
 
+static int __init clint_timer_init_dt(struct device_node *np)
+{
+	is_c900_clint = false;
+	return clint_timer_init(np);
+}
+
+static int __init c900_clint_timer_init_dt(struct device_node *np)
+{
+	is_c900_clint = true;
+	return clint_timer_init(np);
+}
+
 TIMER_OF_DECLARE(clint_timer, "riscv,clint0", clint_timer_init_dt);
 TIMER_OF_DECLARE(clint_timer1, "sifive,clint0", clint_timer_init_dt);
+TIMER_OF_DECLARE(clint_timer2, "thead,c900-clint", c900_clint_timer_init_dt);
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
