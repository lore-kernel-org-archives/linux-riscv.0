Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB23CC25B41
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 08:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Isdg7AwgBxR1gsHypGmU3cFcid2k3HYVErS2w3JYoxA=; b=rQa3V9yUV7J2V0
	BthkkKm+1YyDIUfQ0PROAr80UVgcxJhQt8mxZ6gjxsAC7DX+Nk4F/HFagpx/wryul5telBNG4gCZd
	qVPWqdkxpcT7sVYK0Bcc73ZSDLc0z7rVv5u9VyDEeKJlmOtTuMMNKcBbq8Z7R1PLjYtA8/7ZgKlnN
	J7grtBfPpWwEGBNuMIBfeG32FDXmebap7HQI2gv7Yt/xk3m0n7Q7MQi2w+5DmZ7cvyD4nyYJFB51Y
	EmlEaU0tWCjTwL8KK/1Tc7Y4o/LP7VG6mQx6p1cyl/3KG8jZMhDkNhibFNuauZPBBx7y4q1L9m27C
	zX/T5BCywaBIUJXSxJEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqJe-006kwg-1F;
	Mon, 23 Oct 2023 08:29:38 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqJb-006kuq-1U
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 08:29:37 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c9c5a1b87bso17468645ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 01:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698049772; x=1698654572; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLEuNYLzmNdpMekkYxMIqBfr7ettCjIz89PT5TQjtwM=;
        b=QVyJZMlmJU3Un8YiEIaJ72XRc8r1oOCDHrj0zTE3XOBoImKSv7nETu7IfATaoKOLP3
         X6Ka2Op3PHb7ZEO3x9l/xtiuCME+UvW5YOn5WV+n2W08VO2i4LigCKLUIsMYAk/3V4xt
         UnzhU4othCkkf/4appHl6bmEOHyYe0tUAaJ5nunBtHpOzmm7jd92O3jFUxHS9j9s9IIa
         SDDVbDzzFm8GKji+x7RDtLCz9vvTNyVwcp/6hkfP9qYsR7WnIp20mAY6cCUkd9Fpz9XP
         8CH9YwP/28eDl7jrOs6HXVerTQrzokuk39TbzoIztW8b+noAM9+WFLV8CCrs9z2Sctay
         YRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698049772; x=1698654572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLEuNYLzmNdpMekkYxMIqBfr7ettCjIz89PT5TQjtwM=;
        b=TEhOlw0bbQNp2jkofpnB7Vg68oJ6990UC6Dki95g+4qIQ7ilcx4nrvtwCJcd6K9CGB
         vw9tofh04lqZGAMEvmpEpB2BzIap/YQ/IrKT63VKWRGN04yB0ssnZXqkB7MJT4XBa6Em
         E1svxpHZVVo+mlJxrR+MZNvFlKOvz92AOARBzS6pYDAFZfoUdXwlDxX3iDPzc2ZOf7SN
         F/IIK/aJWzhJnA3jqnrjcRSwUvGSQvw1FApA0KIDEXmEBedDYKwSIgJt0cM21Sr+aToL
         jwu3dUbF0NoSQZWvwi3Ytpb0pIchM5XGNCZnKUc5gctkC/2P3aggQSuxvsnVYO0N10Dc
         jr9g==
X-Gm-Message-State: AOJu0YwgvykYP/wI0on/UC15N4/y/dLn33ouhk3wgHGks29JJVVoFF0e
	3qOdQYEIdOKFC7ISiURoehr9mA==
X-Google-Smtp-Source: AGHT+IFwiuZzN1VxYpGUrbYGS2JDDA5Axr6zrj45LnHXNTd5WQzI3Ka79FvuRD+C40wTzv0jOoJZUg==
X-Received: by 2002:a17:902:dad1:b0:1c5:befa:d81d with SMTP id q17-20020a170902dad100b001c5befad81dmr8117421plx.10.1698049772541;
        Mon, 23 Oct 2023 01:29:32 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d15-20020a170903230f00b001b8b07bc600sm5415805plh.186.2023.10.23.01.29.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Oct 2023 01:29:32 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@linutronix.de,
	maz@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: dengliang.1214@bytedance.com,
	liyu.yukiteru@bytedance.com,
	sunjiadong.lff@bytedance.com,
	xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	chaiwen.cc@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC 02/12] riscv: Make CSR_IE register part of context
Date: Mon, 23 Oct 2023 16:29:01 +0800
Message-Id: <20231023082911.23242-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231023082911.23242-1-luxu.kernel@bytedance.com>
References: <20231023082911.23242-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_012935_509237_05E77E8B 
X-CRM114-Status: GOOD (  18.06  )
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

This commit makes CSR_IE register part of thread context.

Kernel nowadays saves and restores irq status of each thread via
CSR_STATUS register. When a thread traps into kernel, irq status of it
is automatically stored in SR_PIE field of CSR_STATUS by hardware. And
when kernel returns back, irq status will be automatically restored from
CSR_STATUS.

Things get different when we switch to CSR_IE masking for irq
disabling. Hardware won't save or restore CSR_IE value during traps.
In this case, when trapped into kernel, we should save CSR_IE value
for previous thread manually and then clear all CSR_IE bits to disable
irqs during traps. Also, we should manually restore SIE field of
CSR_STATUS as we do not depends on it to disable irqs. When kernel
returns back, we manually restore CSR_IE value from previous saved
value.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
Signed-off-by: Hangjing Li <lihangjing@bytedance.com>
Reviewed-by: Liang Deng <dengliang.1214@bytedance.com>
Reviewed-by: Yu Li <liyu.yukiteru@bytedance.com>
---
 arch/riscv/include/asm/csr.h      | 17 +++++++++++++++++
 arch/riscv/include/asm/ptrace.h   |  3 +++
 arch/riscv/kernel/asm-offsets.c   |  3 +++
 arch/riscv/kernel/entry.S         | 13 +++++++++++++
 arch/riscv/kernel/process.c       |  6 ++++++
 arch/riscv/kernel/suspend_entry.S |  1 +
 drivers/clocksource/timer-clint.c |  4 ++++
 drivers/clocksource/timer-riscv.c |  4 ++++
 drivers/irqchip/irq-riscv-intc.c  |  4 ++++
 drivers/perf/riscv_pmu_sbi.c      |  4 ++++
 10 files changed, 59 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 777cb8299551..6520bd826d52 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -7,6 +7,7 @@
 #define _ASM_RISCV_CSR_H
 
 #include <asm/asm.h>
+#include <asm/hwcap.h>
 #include <linux/bits.h>
 
 /* Status register flags */
@@ -451,6 +452,22 @@
 #define IE_TIE		(_AC(0x1, UL) << RV_IRQ_TIMER)
 #define IE_EIE		(_AC(0x1, UL) << RV_IRQ_EXT)
 
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+#define IRQS_ENABLED_IE			(IE_SIE | IE_TIE | IE_EIE)
+#define irqs_enabled_ie						\
+({								\
+	unsigned long __v;					\
+	asm (ALTERNATIVE(					\
+		"li %0, " __stringify(IRQS_ENABLED_IE) "\n\t"	\
+		"nop",						\
+		"li %0, " __stringify(IRQS_ENABLED_IE | SIP_LCOFIP),\
+		0, RISCV_ISA_EXT_SSCOFPMF,			\
+		CONFIG_RISCV_PSEUDO_NMI)			\
+		: "=r"(__v) : :	);				\
+	__v;							\
+})
+#endif /* CONFIG_RISCV_PSEUDO_NMI */
+
 #ifndef __ASSEMBLY__
 
 #define csr_swap(csr, val)					\
diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index b5b0adcc85c1..b57d3a6b232f 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -47,6 +47,9 @@ struct pt_regs {
 	unsigned long t6;
 	/* Supervisor/Machine CSRs */
 	unsigned long status;
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+	unsigned long ie;
+#endif
 	unsigned long badaddr;
 	unsigned long cause;
 	/* a0 value before the syscall */
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index d6a75aac1d27..165f6f9fc458 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -112,6 +112,9 @@ void asm_offsets(void)
 	OFFSET(PT_GP, pt_regs, gp);
 	OFFSET(PT_ORIG_A0, pt_regs, orig_a0);
 	OFFSET(PT_STATUS, pt_regs, status);
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+	OFFSET(PT_IE, pt_regs, ie);
+#endif
 	OFFSET(PT_BADADDR, pt_regs, badaddr);
 	OFFSET(PT_CAUSE, pt_regs, cause);
 
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 143a2bb3e697..19ba7c4520b9 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -65,6 +65,10 @@ _save_context:
 	REG_S s3, PT_BADADDR(sp)
 	REG_S s4, PT_CAUSE(sp)
 	REG_S s5, PT_TP(sp)
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+	csrr s0, CSR_IE
+	REG_S s0, PT_IE(sp)
+#endif /* CONFIG_RISCV_PSEUDO_NMI */
 
 	/*
 	 * Set the scratch register to 0, so that if a recursive exception
@@ -153,6 +157,11 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	csrw CSR_STATUS, a0
 	csrw CSR_EPC, a2
 
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+	REG_L s0, PT_IE(sp)
+	csrw CSR_IE, s0
+#endif /* CONFIG_RISCV_PSEUDO_NMI */
+
 	REG_L x1,  PT_RA(sp)
 	REG_L x3,  PT_GP(sp)
 	REG_L x4,  PT_TP(sp)
@@ -251,6 +260,10 @@ restore_caller_reg:
 	REG_S s3, PT_BADADDR(sp)
 	REG_S s4, PT_CAUSE(sp)
 	REG_S s5, PT_TP(sp)
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+	csrr s0, CSR_IE
+	REG_S s0, PT_IE(sp)
+#endif /* CONFIG_RISCV_PSEUDO_NMI */
 	move a0, sp
 	tail handle_bad_stack
 SYM_CODE_END(handle_kernel_stack_overflow)
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index e32d737e039f..9663bae23c57 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -115,6 +115,9 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	unsigned long sp)
 {
 	regs->status = SR_PIE;
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+	regs->ie = irqs_enabled_ie;
+#endif
 	if (has_fpu()) {
 		regs->status |= SR_FS_INITIAL;
 		/*
@@ -189,6 +192,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		childregs->gp = gp_in_global;
 		/* Supervisor/Machine, irqs on: */
 		childregs->status = SR_PP | SR_PIE;
+#ifdef CONFIG_RISCV_PSEUDO_NMI
+		childregs->ie = irqs_enabled_ie;
+#endif
 
 		p->thread.s[0] = (unsigned long)args->fn;
 		p->thread.s[1] = (unsigned long)args->fn_arg;
diff --git a/arch/riscv/kernel/suspend_entry.S b/arch/riscv/kernel/suspend_entry.S
index f7960c7c5f9e..6825f4836be4 100644
--- a/arch/riscv/kernel/suspend_entry.S
+++ b/arch/riscv/kernel/suspend_entry.S
@@ -47,6 +47,7 @@ ENTRY(__cpu_suspend_enter)
 	REG_S	t0, (SUSPEND_CONTEXT_REGS + PT_EPC)(a0)
 	csrr	t0, CSR_STATUS
 	REG_S	t0, (SUSPEND_CONTEXT_REGS + PT_STATUS)(a0)
+	/* There is no need to save CSR_IE as it is maintained in memory */
 	csrr	t0, CSR_TVAL
 	REG_S	t0, (SUSPEND_CONTEXT_REGS + PT_BADADDR)(a0)
 	csrr	t0, CSR_CAUSE
diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 9a55e733ae99..bdc10be9d3b4 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -114,7 +114,9 @@ static int clint_clock_next_event(unsigned long delta,
 	void __iomem *r = clint_timer_cmp +
 			  cpuid_to_hartid_map(smp_processor_id());
 
+#ifndef CONFIG_RISCV_PSEUDO_NMI
 	csr_set(CSR_IE, IE_TIE);
+#endif
 	writeq_relaxed(clint_get_cycles64() + delta, r);
 	return 0;
 }
@@ -155,7 +157,9 @@ static irqreturn_t clint_timer_interrupt(int irq, void *dev_id)
 {
 	struct clock_event_device *evdev = this_cpu_ptr(&clint_clock_event);
 
+#ifndef CONFIG_RISCV_PSEUDO_NMI
 	csr_clear(CSR_IE, IE_TIE);
+#endif
 	evdev->event_handler(evdev);
 
 	return IRQ_HANDLED;
diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index da3071b387eb..b730e01a7f02 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -36,7 +36,9 @@ static int riscv_clock_next_event(unsigned long delta,
 {
 	u64 next_tval = get_cycles64() + delta;
 
+#ifndef CONFIG_RISCV_PSEUDO_NMI
 	csr_set(CSR_IE, IE_TIE);
+#endif
 	if (static_branch_likely(&riscv_sstc_available)) {
 #if defined(CONFIG_32BIT)
 		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
@@ -119,7 +121,9 @@ static irqreturn_t riscv_timer_interrupt(int irq, void *dev_id)
 {
 	struct clock_event_device *evdev = this_cpu_ptr(&riscv_clock_event);
 
+#ifndef CONFIG_RISCV_PSEUDO_NMI
 	csr_clear(CSR_IE, IE_TIE);
+#endif
 	evdev->event_handler(evdev);
 
 	return IRQ_HANDLED;
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index e8d01b14ccdd..7fad1ba37e5c 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -39,12 +39,16 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
 
 static void riscv_intc_irq_mask(struct irq_data *d)
 {
+#ifndef CONFIG_RISCV_PSEUDO_NMI
 	csr_clear(CSR_IE, BIT(d->hwirq));
+#endif
 }
 
 static void riscv_intc_irq_unmask(struct irq_data *d)
 {
+#ifndef CONFIG_RISCV_PSEUDO_NMI
 	csr_set(CSR_IE, BIT(d->hwirq));
+#endif
 }
 
 static void riscv_intc_irq_eoi(struct irq_data *d)
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 96c7f670c8f0..995b501ec721 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -778,7 +778,9 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 	if (riscv_pmu_use_irq) {
 		cpu_hw_evt->irq = riscv_pmu_irq;
 		csr_clear(CSR_IP, BIT(riscv_pmu_irq_num));
+#ifndef CONFIG_RISCV_PSEUDO_NMI
 		csr_set(CSR_IE, BIT(riscv_pmu_irq_num));
+#endif
 		enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
 	}
 
@@ -789,7 +791,9 @@ static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
 {
 	if (riscv_pmu_use_irq) {
 		disable_percpu_irq(riscv_pmu_irq);
+#ifndef CONFIG_RISCV_PSEUDO_NMI
 		csr_clear(CSR_IE, BIT(riscv_pmu_irq_num));
+#endif
 	}
 
 	/* Disable all counters access for user mode now */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
