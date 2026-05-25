Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6FFCD5BB1
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 18:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rr6p+nEWbihTFSqvDltw3Ho5kDaI6fDwp1NBfDxnA08=; b=3FpTpGlVCW6xlo
	lGuJ3RqVn25/gdyekcPBgdXAjC83lNUyxRMHGmJGZ5UKqkLzir+h1BhnincTdRdhkGKAD4bVfMjMf
	MdAYcrbEY5A6QvAVAU+ZWueGCweM0PxKGjAy9wMDu+bENlWYPKWfJunSageQ0+xFNIdPKfg8J+o2w
	inrxvepzspI3CG7tbM6D+apXDXfL2+qO4fB3pbg7q3KDATPF1NofVAVhUw+emtWRJC6SkzmdSQZDa
	CJ90dWgC3zBeizgHox5wYWNiHHT+HxiVed3f6EZudLDPOhQeHskxELJp+XPJDmSJjaLdQtZEwT6K3
	RIQ+V0lXTVK3IjngaH6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRZxN-00000000Dg0-32c6;
	Mon, 25 May 2026 18:23:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRZxK-00000000Dec-3Ffd
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 18:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779733393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Hv6vwj3bTzOABI6yGkxkkZYmHGxFwICU7juAwNMt4AI=;
	b=hijnPsAqUPiXM9fXJN0vTlL78y1ygEGWNDwEWtjcVNeEq0LQ0e9mQIDTk6npF5CX8RSRMy
	M6L8My+6jnWh2ORm8H7MsVhjLaIu7QIDAaOCviE0uAbL4VcFK8gw/5OErqBIXTazpI7xZ0
	iyrjnGbYbfXTj/C5btGkOY2l65CIq+Y=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-542-0NuxrRZzM-KWdCXNCtbvSw-1; Mon,
 25 May 2026 14:21:36 -0400
X-MC-Unique: 0NuxrRZzM-KWdCXNCtbvSw-1
X-Mimecast-MFC-AGG-ID: 0NuxrRZzM-KWdCXNCtbvSw_1779733294
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2B9A91800359;
	Mon, 25 May 2026 18:21:34 +0000 (UTC)
Received: from jtaubepe-thinkpadx1carbongen12.ibmlowe.csb (unknown [10.22.64.142])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A4D981800347;
	Mon, 25 May 2026 18:21:28 +0000 (UTC)
From: Jesse Taube <jtaubepe@redhat.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v7 1/2] clocksource/drivers/timer-clint: Add ZICNTR support
Date: Mon, 25 May 2026 14:21:23 -0400
Message-ID: <20260525182124.19402-1-jtaubepe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: MzTcd_OxBsvRkhSipsqTeUvmJmJQSnNqyyINvqHA5Nc_1779733294
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_112314_886794_8DD8B216 
X-CRM114-Status: GOOD (  20.71  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jtaubepe@redhat.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <Mr.Bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ZICNTR allows the CPU time to be read using CSRs, which used to be the
default. If ZICNTR is supported prefer using CSRs over MMIO.
This may also be faster as CSRs are not emulated in M-mode.

Signed-off-by: Jesse Taube <jtaubepe@redhat.com>
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
V6 -> V7:
 - Split csr and c900 parts into different commits

Posible future work:
 - Check for SSTC support and use stimercmp
 - SSTC depends on smode which cpufeature doesnt check for.
---
 arch/riscv/include/asm/timex.h    | 12 ++++++-
 drivers/clocksource/timer-clint.c | 57 ++++++++++++++++++++++++++++---
 2 files changed, 64 insertions(+), 5 deletions(-)

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
index 0bdd9d7ec545..18f7bf7d26c6 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -81,6 +81,12 @@ static u64 notrace clint_get_cycles64(void)
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
@@ -93,8 +99,26 @@ static u64 notrace clint_get_cycles64(void)
 
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
@@ -105,9 +129,20 @@ static struct clocksource clint_clocksource = {
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
@@ -123,13 +158,16 @@ static DEFINE_PER_CPU(struct clock_event_device, clint_clock_event) = {
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
 	ce->cpumask = cpumask_of(cpu);
 	clockevents_config_and_register(ce, clint_timer_freq, 100, ULONG_MAX);
 
@@ -161,7 +199,7 @@ static irqreturn_t clint_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int __init clint_timer_init_dt(struct device_node *np)
+static int __init clint_timer_init(struct device_node *np)
 {
 	int rc;
 	u32 i, nr_irqs;
@@ -227,13 +265,19 @@ static int __init clint_timer_init_dt(struct device_node *np)
 
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
@@ -273,5 +317,10 @@ static int __init clint_timer_init_dt(struct device_node *np)
 	return rc;
 }
 
+static int __init clint_timer_init_dt(struct device_node *np)
+{
+	return clint_timer_init(np);
+}
+
 TIMER_OF_DECLARE(clint_timer, "riscv,clint0", clint_timer_init_dt);
 TIMER_OF_DECLARE(clint_timer1, "sifive,clint0", clint_timer_init_dt);
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
