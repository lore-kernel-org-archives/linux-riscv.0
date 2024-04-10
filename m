Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A281FCD129A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 14:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5e+taE+qGgd2NHsT8H3Bg+kGwwwkI6snI+hb1wWej/M=; b=nnJjYApi6oIw0j
	kB4/SzhsWfi7K9txfizFy53Tw1lkgrvHdSt//qz5BpME/fabsohl93I0k+yTSbwyNe5GjVnsuTweN
	1457hHydCthdOn14oLKOOXMbT+9Ng9P6kplJrBYXoRGhjqVs+BhHOHqq/4CiFU0LyJyHkK3Co7VD1
	A0qE85y5dTq76udFztoGAQn35/PeOMzSMR7/SaBL9uCemoz5jbjQAXpcmpin6+3mWtqnToeDIpVq+
	+SqVvvgQQGsWdIG791g9GRfmU0PbwxcPCOVGS7BOz/CKEH+oKZ3M90GTAUkd8NbBYy6S0hTQBXe8Q
	MnpyKunQl5/s1fVuBhKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZ4k-00000007V6K-1L1u;
	Wed, 10 Apr 2024 14:37:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZ4g-00000007V3L-43HQ
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 14:37:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 35C44CE19CC;
	Wed, 10 Apr 2024 14:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492DFC433A6;
	Wed, 10 Apr 2024 14:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712759836;
	bh=TrpEW+6B4Jv83pnm2iw9qpP7oQ/M2UPszbPFDwKZP68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JYPaFUrYMEHydYRmDrE8qoQqRKFuBC31/2h8g4fwPOqV+nAT/n1JwR5yQZD6pk67Z
	 YftpOz4ingL9S507aSlv6DaIQPyBiPDcy95aYXGNGqytMPzTbZa+6oUE/+mKt4WRzr
	 brwurqZB9APv3hfmxqOQiHWFQYoTGyVXiMiGST6IN7WJHf9Rh1+ZukXBbWT0ilnj7O
	 sm12yPdKQTApssOgnYFwuuJOkMKenLaOZzDL0Xjbyi8ceVg8Xxusov54R+33Lp88yg
	 9iYlDomN9KbA82NyXit+Rsu93OUENjhnEBDoKH4L/4J2zLb5HizxI9gM/1CHlyGnK0
	 kkGV+cKyPSDpg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] clocksource/drivers/timer-clint: Add T-Head C9xx clint
Date: Wed, 10 Apr 2024 22:23:47 +0800
Message-ID: <20240410142347.964-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410142347.964-1-jszhang@kernel.org>
References: <20240410142347.964-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_073719_486998_DCD90259 
X-CRM114-Status: GOOD (  21.51  )
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
---
 arch/riscv/include/asm/clint.h    |  2 ++
 arch/riscv/include/asm/timex.h    | 18 +++++++++---
 drivers/clocksource/timer-clint.c | 48 +++++++++++++++++++++++++++----
 3 files changed, 59 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/clint.h b/arch/riscv/include/asm/clint.h
index 0789fd37b40a..c6057a182c5d 100644
--- a/arch/riscv/include/asm/clint.h
+++ b/arch/riscv/include/asm/clint.h
@@ -10,6 +10,7 @@
 #include <asm/mmio.h>
 
 #ifdef CONFIG_RISCV_M_MODE
+#include <linux/jump_label.h>
 /*
  * This lives in the CLINT driver, but is accessed directly by timex.h to avoid
  * any overhead when accessing the MMIO timer.
@@ -21,6 +22,7 @@
  * like "riscv_mtime", to signify that these non-ISA assumptions must hold.
  */
 extern u64 __iomem *clint_time_val;
+DECLARE_STATIC_KEY_FALSE(riscv_csr_time_available);
 #endif
 
 #endif
diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
index a06697846e69..007a15482d75 100644
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -17,18 +17,27 @@ typedef unsigned long cycles_t;
 #ifdef CONFIG_64BIT
 static inline cycles_t get_cycles(void)
 {
-	return readq_relaxed(clint_time_val);
+	if (static_branch_likely(&riscv_csr_time_available))
+		return csr_read(CSR_TIME);
+	else
+		return readq_relaxed(clint_time_val);
 }
 #else /* !CONFIG_64BIT */
 static inline u32 get_cycles(void)
 {
-	return readl_relaxed(((u32 *)clint_time_val));
+	if (static_branch_likely(&riscv_csr_time_available))
+		return csr_read(CSR_TIME);
+	else
+		return readl_relaxed(((u32 *)clint_time_val));
 }
 #define get_cycles get_cycles
 
 static inline u32 get_cycles_hi(void)
 {
-	return readl_relaxed(((u32 *)clint_time_val) + 1);
+	if (static_branch_likely(&riscv_csr_time_available))
+		return csr_read(CSR_TIMEH);
+	else
+		return readl_relaxed(((u32 *)clint_time_val) + 1);
 }
 #define get_cycles_hi get_cycles_hi
 #endif /* CONFIG_64BIT */
@@ -40,7 +49,8 @@ static inline u32 get_cycles_hi(void)
  */
 static inline unsigned long random_get_entropy(void)
 {
-	if (unlikely(clint_time_val == NULL))
+	if (!static_branch_likely(&riscv_csr_time_available) &&
+	   (unlikely(clint_time_val == NULL)))
 		return random_get_entropy_fallback();
 	return get_cycles();
 }
diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index f468fa8bf5f0..acfcd78cc576 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -39,10 +39,13 @@ static u64 __iomem *clint_timer_cmp;
 static u64 __iomem *clint_timer_val;
 static unsigned long clint_timer_freq;
 static unsigned int clint_timer_irq;
+static bool is_c900_clint;
 
 #ifdef CONFIG_RISCV_M_MODE
 u64 __iomem *clint_time_val;
 EXPORT_SYMBOL(clint_time_val);
+DEFINE_STATIC_KEY_FALSE(riscv_csr_time_available);
+EXPORT_SYMBOL(riscv_csr_time_available);
 #endif
 
 #ifdef CONFIG_SMP
@@ -79,17 +82,27 @@ static void clint_ipi_interrupt(struct irq_desc *desc)
 #ifdef CONFIG_64BIT
 static u64 notrace clint_get_cycles64(void)
 {
-	return clint_get_cycles();
+	if (static_branch_likely(&riscv_csr_time_available))
+		return csr_read(CSR_TIME);
+	else
+		return clint_get_cycles();
 }
 #else /* CONFIG_64BIT */
 static u64 notrace clint_get_cycles64(void)
 {
 	u32 hi, lo;
 
-	do {
-		hi = clint_get_cycles_hi();
-		lo = clint_get_cycles();
-	} while (hi != clint_get_cycles_hi());
+	if (static_branch_likely(&riscv_csr_time_available)) {
+		do {
+			hi = clint_get_cycles_hi();
+			lo = clint_get_cycles();
+		} while (hi != clint_get_cycles_hi());
+	} else {
+		do {
+			hi = csr_read(CSR_TIMEH);
+			lo = csr_read(CSR_TIME);
+		} while (hi != csr_read(CSR_TIMEH));
+	}
 
 	return ((u64)hi << 32) | lo;
 }
@@ -128,6 +141,19 @@ static int clint_clock_shutdown(struct clock_event_device *evt)
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
@@ -141,6 +167,9 @@ static int clint_timer_starting_cpu(unsigned int cpu)
 {
 	struct clock_event_device *ce = per_cpu_ptr(&clint_clock_event, cpu);
 
+	if (is_c900_clint)
+		ce->set_next_event = c900_clint_clock_next_event;
+
 	ce->cpumask = cpumask_of(cpu);
 	clockevents_config_and_register(ce, clint_timer_freq, 100, ULONG_MAX);
 
@@ -284,5 +313,14 @@ static int __init clint_timer_init_dt(struct device_node *np)
 	return rc;
 }
 
+static int __init c900_clint_timer_init_dt(struct device_node *np)
+{
+	is_c900_clint = true;
+	static_branch_enable(&riscv_csr_time_available);
+
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
