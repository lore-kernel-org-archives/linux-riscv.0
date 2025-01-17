Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360A7C02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 16:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eYOLrdIdzy1+JkrGd23HWnrfZhFJnhZHQ8ClzrCwXl8=; b=z/1RsNsw7FpJEO
	bf9Z/Fpo+QWBQmKkLwo/+TAbH3CRUli1EtAoEQ1dCtoE3l3fMCBZJpr5UvLWWI/0AHHlld626nzgP
	491zziflIHrYpmn+ixTA9Y+4gqcT+Vv2G5KXtXghmiE74yEi6mXgTfmfDBD4abv1ya7O9wvZxlt+X
	htqOgUD/n3bpE78qyMUmlBmXDUvQ4RafKoSCl/c6tLgDSO9+nZ+Ld/eO2XsGL3yEICiYNxpdDD8lT
	hY73mNymlnLAvaF+Xs24vky46Vkf/pR2Zk+xLJtD30xVwxbDzlXPOds0+bysSRkI+5gI3+3c0CAib
	sSQl4m0A5uLVpM+/Yw4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpTa-00000000pis-3rlW;
	Fri, 17 Jan 2025 16:45:42 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpTY-00000000phs-0ZgF
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 16:45:41 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7b6ef047e9bso209282185a.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 08:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737132338; x=1737737138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nn1yrcRWQdoqs/ILcamatay4rOXY9C6T1ZnY2c2Ub1g=;
        b=GKdBtRB99KxTlkh6uijyj6i2t0E/v27JSPEo5O/tqq1D6bDBO3z8xUiSO2N8IhHI3t
         ZUWIFEcjlGvGx4iS92D2q4XCAilxykJitfpCjGuEtfhdqmDs2CvZWHN0b3n4XWrd+V8X
         GVImTB0HL8S3mKz9DXd759aAK0ruFHJ3E8CywK3MzYE9Lr8euxTWRVV7G/Kr7PlJ1366
         KVHhjLX6UyinW+CQxRKDL09O/1/outBcpFF0GTey3Sa9IJXallidORQc4BD/1mweG9T6
         naTk3jBQliuMz4iNK3aW67idhq+WZAcgtp+/jEyaumjbpCFnPFmEW/qNmThulBECycTx
         hDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737132338; x=1737737138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nn1yrcRWQdoqs/ILcamatay4rOXY9C6T1ZnY2c2Ub1g=;
        b=ocoE3GpFN27eWq6Oo52+1+3bMVxUfFXlZwE7vc3IfcWZYFuLp8lgcsJiutsJDohhKq
         YPaPnF+Ve97ppbNDfi5CvCVirRAOhnflsw8Sok26PrORokqzLtOHKr+Xn/fDAv41PI49
         VfweSmos1XY1oHei+1Cux1VLHGXVljetus3MymnGan4L/NczmzHheSxjhs7A5iVkSa3i
         VJPKmAnCMBgGnU1mOiTVDaCAw1GDzMVPsX9cEd+c94M6oJ5wwjbd4tEywmeWBllR27MB
         qnarj/0Q3tFj1zLtspvA7OkQrfDswuMNgPGl9gpsOkgCHY0IAWGFkKu6/bVlPxVuG65O
         FrqA==
X-Gm-Message-State: AOJu0YyOqQzZ5R59iVqNKueH+YL8hxG2suYX2hudWSLY+7qUm8HMUNOZ
	RiOozJxsRjmeNAS+TBskHP/sn9jUyU9yIFJ4RzQzNk1hPqaY70IGG7aojg==
X-Gm-Gg: ASbGncuw28MSFa4DQQKHarFZzACBEYK5fLSYBfgoElu9bw4GXLg+XbIQ7fKEgBtBSZI
	ipjGxfJnF0zsphnnm5MSarePQH5/G9HbDOfFChTNnWZdM3AnkZFhVnvSir+sqMmIEz1/3qj+6zq
	EPBlkUIxFs6AjwWXT0CYtZQKvavChWzvZFJZZqQUQ6sXZbBTwRDShG9GagLHCKQL+KOPNCgvw9u
	RGXX2RYjz1E8t1LGU4bXs4KbJOEJLOPJMXHxxtqCPdsKgQhb7hFRFnIbrW6XaiZTkFuG27SbOkt
	3hlOEkjFkGmmPDWN9SOkWm05rrRYOu+sBMpy+w==
X-Google-Smtp-Source: AGHT+IGLySB45T8QpI9xiopCo20jMVkIyUb+nkAiZ46E8hRHQyORZiegRHS4oEgu/Mobge367ZpAag==
X-Received: by 2002:a05:620a:408c:b0:7b1:21c4:ecf8 with SMTP id af79cd13be357-7be52464e94mr1935471785a.28.1737132337929;
        Fri, 17 Jan 2025 08:45:37 -0800 (PST)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afcf50ffsm12795426d6.110.2025.01.17.08.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:45:37 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v5] clocksource/drivers/timer-clint: Add T-Head C9xx clint
Date: Fri, 17 Jan 2025 11:45:36 -0500
Message-ID: <20250117164536.3918949-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_084540_178636_CBC8CCDA 
X-CRM114-Status: GOOD (  22.53  )
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
V4 -> V5:
 - Remove riscv,csr-clint
 - Remove riscv_csr_time_available
 - Replace all static_branch_unlikely(&riscv_csr_time_available) with
    riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR)
---
 arch/riscv/include/asm/timex.h    | 12 +++++++-
 drivers/clocksource/timer-clint.c | 50 +++++++++++++++++++++++++++----
 2 files changed, 56 insertions(+), 6 deletions(-)

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
index 0bdd9d7ec545..cdf8b33d2dd2 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -39,6 +39,7 @@ static u64 __iomem *clint_timer_cmp;
 static u64 __iomem *clint_timer_val;
 static unsigned long clint_timer_freq;
 static unsigned int clint_timer_irq;
+static bool is_c900_clint;
 
 #ifdef CONFIG_RISCV_M_MODE
 u64 __iomem *clint_time_val;
@@ -79,6 +80,9 @@ static void clint_ipi_interrupt(struct irq_desc *desc)
 #ifdef CONFIG_64BIT
 static u64 notrace clint_get_cycles64(void)
 {
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
+		return csr_read(CSR_TIME);
+
 	return clint_get_cycles();
 }
 #else /* CONFIG_64BIT */
@@ -86,10 +90,17 @@ static u64 notrace clint_get_cycles64(void)
 {
 	u32 hi, lo;
 
-	do {
-		hi = clint_get_cycles_hi();
-		lo = clint_get_cycles();
-	} while (hi != clint_get_cycles_hi());
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR)) {
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
@@ -119,6 +130,19 @@ static int clint_clock_next_event(unsigned long delta,
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
@@ -130,6 +154,9 @@ static int clint_timer_starting_cpu(unsigned int cpu)
 {
 	struct clock_event_device *ce = per_cpu_ptr(&clint_clock_event, cpu);
 
+	if (is_c900_clint)
+		ce->set_next_event = c900_clint_clock_next_event;
+
 	ce->cpumask = cpumask_of(cpu);
 	clockevents_config_and_register(ce, clint_timer_freq, 100, ULONG_MAX);
 
@@ -161,7 +188,7 @@ static irqreturn_t clint_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int __init clint_timer_init_dt(struct device_node *np)
+static int __init clint_timer_init(struct device_node *np)
 {
 	int rc;
 	u32 i, nr_irqs;
@@ -273,5 +300,18 @@ static int __init clint_timer_init_dt(struct device_node *np)
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
