Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FEFE77188
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 03:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Mpf6ixNjDlzSz3UesPZAEtfp6Betd95c0sOO0rhHU0=; b=FfP37YSlgA2ahf
	JTo3zWy7Wezaa2buZlK/3pVC9gNsC01sc54wkFklTxz2eMQLpWWpcO1YUsEzDlycHm1z1qytkmAC1
	AAQU9dQEGxt6Z/Tsb0XQBPIacexBZ2wDaBWzDvLOLBEfYTAS6EwFZhE/ga35Pi4zGZ9C5aH/fN6aI
	0YKyryt7qs1QAAtgyYYw/kZmae6hq4wGKtoAkhF7n2i6gjEWtLOUF08pQtD3K/sVFPxtjV0VvaZgM
	AnALAhZl66Ty5vxmGyREmZ5ICqO+0PeTwwQT0uwNOevsUYBFQxziA0x7AF5IwyenLBdRhEPRLI+lR
	V39WS+yVWI2ot4lmzvRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV07T-00000003IIJ-41iF;
	Tue, 07 Jan 2025 03:19:03 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV07Q-00000003IHU-3kr3
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 03:19:02 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-467a17055e6so10024341cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 19:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736219939; x=1736824739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K7bFWW78ge14sBh92/IcudPVBuPluIDMgIChdPCTz88=;
        b=NFddHBXqY1UG1AOar540LEsWNnFfOspqsNEL5rYVhp/DystMyfTm6BsWjqG9Fnqhe2
         bnvoyHFKS50wSdM8077Thfs9vWX7yhep5K47h++p61QmmCiUw4NokF0ldfXfHVYWZnI1
         R8wmtAWzMiHFCKOyWPhu3oqRql89E5ojv6tHJ5l3jqJeoQUfqyr+qN5vJMFP3DDexSDa
         qNjIvQQLSJ6i0Q/TDHSLMkK8JY3F6MZdLRf45qW+To/fyj8npyx8G8MlzDZvh2/31Pew
         ixClaIBhNtN2z79DuwZAJFPteJ2F290c2CFzRSdviRZVtXVBEIoe1KarFQQpcxPrt3pi
         u8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736219939; x=1736824739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7bFWW78ge14sBh92/IcudPVBuPluIDMgIChdPCTz88=;
        b=tricTl65aljY+XkXQGvgP7jpx1T+IQBen4DkNDDP584dsEOBOJBELKsf/gnZ7HX6wb
         HWgjhfz9ChZk0dVE6pB+ro+BJLF0g7xdYKkvqQWPqGcy1DvnoDxOdI0L40Anngo+zDT4
         WHlQ2unFaFESGqpTbQgZT078ysNzJi5U+3Qglw4falAhRDwfrtfANIeGbm50ctJIdQp0
         RNm9oudpVoAuhgoPRC5jifqNf6CGliAA6rBPCFcSnM1lil06Z/4/E0D+gOOqSCnGdaUR
         3sTFbKtxP5SfxmB/MeMlTntQnVpFZrWwzPZSSaRamB7wCkrHUn+igd9v4XuE5Lm5JAcI
         eD8Q==
X-Gm-Message-State: AOJu0Yz0T8uRd/QpuDL4xJd0VPty6+JJMlHZ/NxgX5Dz5NMYkJTWVEiF
	oXHWvn9Sg0ZO+QTutf58suDhmxsz15+FdcG4NAEnsOJK0I+CIaHoOgQQTQ==
X-Gm-Gg: ASbGncuNoZySBY6S5h813E+W8Kx4mtmYT/POQnQf4DiwTD/DT8z62gAQUwjh/UNRmzg
	0A2qXM1Bis593qst1Qbbzk2TUrV/Pi4c5MDp74c/+6t8zoCQ0dm2gtwrIUtfb2lcXHe2NQE0mma
	93Frsp6SKaxsThW9vESr9agImbJefnVmGn29trxCd9kKCDXNjNsJfWzVGvh67sqOCF3mwk+wyCx
	XC4RKKvsmBS4nIUFxRk7mFuCdh9VDDDR8m/KAqU4GbXhEiZGMR/omH6Rp4xHlqsSkIvrnemLAka
	4cqUW1FkOb7PDhzrvjyvJls04/WYDrQ3gGAo1w==
X-Google-Smtp-Source: AGHT+IG0QLj6pISr3rkNodgB9xvjSaDoqYlP+lXpZXSjo+CRI/Ts2rsf8CfDUriqPgbEN197fHSsBg==
X-Received: by 2002:ac8:7d8e:0:b0:467:7745:f0a9 with SMTP id d75a77b69052e-46a4a8b7fd2mr1099449881cf.4.1736219939294;
        Mon, 06 Jan 2025 19:18:59 -0800 (PST)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb2ccdcsm182538861cf.78.2025.01.06.19.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 19:18:58 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v4] clocksource/drivers/timer-clint: Add T-Head C9xx clint
Date: Mon,  6 Jan 2025 22:18:56 -0500
Message-ID: <20250107031856.2281458-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_191900_938914_6316E1DC 
X-CRM114-Status: GOOD (  23.57  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <Mr.Bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>
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
---
 arch/riscv/include/asm/clint.h    |  2 +
 arch/riscv/include/asm/timex.h    | 12 +++++-
 drivers/clocksource/timer-clint.c | 64 ++++++++++++++++++++++++++++---
 3 files changed, 72 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/clint.h b/arch/riscv/include/asm/clint.h
index 0789fd37b40a..9900357b855d 100644
--- a/arch/riscv/include/asm/clint.h
+++ b/arch/riscv/include/asm/clint.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 #include <asm/mmio.h>
+#include <linux/jump_label.h>
 
 #ifdef CONFIG_RISCV_M_MODE
 /*
@@ -23,4 +24,5 @@
 extern u64 __iomem *clint_time_val;
 #endif
 
+DECLARE_STATIC_KEY_FALSE(riscv_csr_time_available);
 #endif
diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
index a06697846e69..914d52296c24 100644
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -17,17 +17,26 @@ typedef unsigned long cycles_t;
 #ifdef CONFIG_64BIT
 static inline cycles_t get_cycles(void)
 {
+	if (static_branch_unlikely(&riscv_csr_time_available))
+		return csr_read(CSR_TIME);
+
 	return readq_relaxed(clint_time_val);
 }
 #else /* !CONFIG_64BIT */
 static inline u32 get_cycles(void)
 {
+	if (static_branch_unlikely(&riscv_csr_time_available))
+		return csr_read(CSR_TIME);
+
 	return readl_relaxed(((u32 *)clint_time_val));
 }
 #define get_cycles get_cycles
 
 static inline u32 get_cycles_hi(void)
 {
+	if (static_branch_unlikely(&riscv_csr_time_available))
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
+	if (!static_branch_unlikely(&riscv_csr_time_available) &&
+	   (unlikely(clint_time_val == NULL)))
 		return random_get_entropy_fallback();
 	return get_cycles();
 }
diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 0bdd9d7ec545..dd0fa1550a6e 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -39,12 +39,16 @@ static u64 __iomem *clint_timer_cmp;
 static u64 __iomem *clint_timer_val;
 static unsigned long clint_timer_freq;
 static unsigned int clint_timer_irq;
+static bool is_c900_clint;
 
 #ifdef CONFIG_RISCV_M_MODE
 u64 __iomem *clint_time_val;
 EXPORT_SYMBOL(clint_time_val);
 #endif
 
+DEFINE_STATIC_KEY_FALSE(riscv_csr_time_available);
+EXPORT_SYMBOL(riscv_csr_time_available);
+
 #ifdef CONFIG_SMP
 static void clint_send_ipi(unsigned int cpu)
 {
@@ -79,6 +83,9 @@ static void clint_ipi_interrupt(struct irq_desc *desc)
 #ifdef CONFIG_64BIT
 static u64 notrace clint_get_cycles64(void)
 {
+	if (static_branch_unlikely(&riscv_csr_time_available))
+		return csr_read(CSR_TIME);
+
 	return clint_get_cycles();
 }
 #else /* CONFIG_64BIT */
@@ -86,10 +93,17 @@ static u64 notrace clint_get_cycles64(void)
 {
 	u32 hi, lo;
 
-	do {
-		hi = clint_get_cycles_hi();
-		lo = clint_get_cycles();
-	} while (hi != clint_get_cycles_hi());
+	if (static_branch_unlikely(&riscv_csr_time_available)) {
+		do {
+			hi = csr_read(CSR_TIMEH);
+			lo = csr_read(CSR_TIME);
+		} while (hi != csr_read(CSR_TIMEH));
+	} else {
+		do {
+			hi = clint_get_cycles_hi();
+			lo = clint_get_cycles();
+		} while (hi != clint_get_cycles_hi());
+	}
 
 	return ((u64)hi << 32) | lo;
 }
@@ -119,6 +133,19 @@ static int clint_clock_next_event(unsigned long delta,
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
@@ -130,6 +157,9 @@ static int clint_timer_starting_cpu(unsigned int cpu)
 {
 	struct clock_event_device *ce = per_cpu_ptr(&clint_clock_event, cpu);
 
+	if (is_c900_clint)
+		ce->set_next_event = c900_clint_clock_next_event;
+
 	ce->cpumask = cpumask_of(cpu);
 	clockevents_config_and_register(ce, clint_timer_freq, 100, ULONG_MAX);
 
@@ -161,7 +191,7 @@ static irqreturn_t clint_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int __init clint_timer_init_dt(struct device_node *np)
+static int __init clint_timer_init(struct device_node *np)
 {
 	int rc;
 	u32 i, nr_irqs;
@@ -273,5 +303,29 @@ static int __init clint_timer_init_dt(struct device_node *np)
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
+	static_branch_enable(&riscv_csr_time_available);
+
+	return clint_timer_init(np);
+}
+
+static int __init csr_clint_timer_init_dt(struct device_node *np)
+{
+	is_c900_clint = false;
+	static_branch_enable(&riscv_csr_time_available);
+
+	return clint_timer_init(np);
+}
+
 TIMER_OF_DECLARE(clint_timer, "riscv,clint0", clint_timer_init_dt);
 TIMER_OF_DECLARE(clint_timer1, "sifive,clint0", clint_timer_init_dt);
+TIMER_OF_DECLARE(clint_timer2, "thead,c900-clint", c900_clint_timer_init_dt);
+TIMER_OF_DECLARE(clint_timer3, "riscv,csr-clint", csr_clint_timer_init_dt);
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
