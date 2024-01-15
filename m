Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77EEC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 07:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ltqLOQDPKu/GA+NccH78TuSIofDP+O9vtJXpcDS1dyQ=; b=12cZElr8gKPDrT
	5Ok2Xsma+eWmVh1t0RwxiLKbTt/hI6dU1rOGugjLLoSEtWH2rMMURTNPPQVHumZGyNWky34+HXnQu
	vMBKSG6cokAXcphRFvf0kt3gKBdwY4yG7XjBQLitJiMQB98Fct7WbiePxiG+D1LMHilZ3dFFV5Cag
	rtcuFbp+J4Wk9GzyaiTYTOj+iysTmqS+twivuAvtA+DpScN+8kTuhh0UNjHshcJJ+l+Gy5aGjkEfX
	2a6N/EeHC3kJcZsYlrpYMwve21mxhic1lEW3B5Y8uoLLWtHryiL0ion/t3+dBCdHudLC2sKFkZhsi
	7jQv+QzY/j5ILJo2iJSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPH9V-0082wE-03;
	Mon, 15 Jan 2024 07:12:57 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPH9T-0082vj-0Q
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 07:12:56 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-28bc870c540so6937184a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jan 2024 23:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705302772; x=1705907572; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOtRqa7rEwU1R9Xcu357qtlvryd8Tx4xNbEfyiqNWok=;
        b=YFc+PCpLlkHTSjqAxc6OAirrGECOB8Ziv9KspqQHiZnKOjxG/0pC9j+s9Nt1hUCtei
         8a+sFsDrlvqMepUKAG2OTtDjJOf0Dn6gjiqAso7Orgr82GrI1OeYQZD0skOhYFovNsbg
         qOyg2C2kBIIStseGShl7oEmlbFoZlIU70a/voTjXTXvAmxzcr9k9PuvL143QX+Sz/mWY
         d/IoUTtXq4OevF8+llAT+cF7oUr5JbgJuK1BNeR/OU4bTwMv7yV9tmfWVKQ5oVybGeEZ
         3DAJtyBpfEFwDGqDodMryTt86yQGwjAeuWn4c95PdepcaEfVNqj5uWhtAMbnOrcX5TFR
         hu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705302772; x=1705907572;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOtRqa7rEwU1R9Xcu357qtlvryd8Tx4xNbEfyiqNWok=;
        b=Eyys6n4M19XKqwugJlTcK9/Wav5NG19jQlD2mu0JoHnlPDGIj92tWycyedkEY3SXHz
         PVPNNqGTuI1pQJygJlH6lId8H2o7dVEqQ4ReNeCCjes29Vzr3inXkieCOJcHsEN0r9XH
         9lSQoLpyFCqsZByY6G0ajmk6jUzhdanGr9JREoMRjIAptEHdzayzKt+6/i43VMkiR7bW
         Knhwfs++CtjB0UKZiD5l0IMgbI7cnnIeQwDjoB29uqnYov4/tcpfNv1jbB7VwzBajtmO
         uaGvu1Xv7kKTwvztbP3cH5ZD4SqTwjoyDbkuhb2YcopWbm9RxukbDk/hF7M6pIz2nCy0
         ECeQ==
X-Gm-Message-State: AOJu0Yyl2llfedxI1Nh3E1fJhY7jHV6w2hWYQUKzXzs8xgO6D7FuN2RC
	mWNXBdbFwl/FnPPTBjMH3mqj2ipbQCZseeA67Zhd4X5NZuFfGEYDQI+trqX7Bsdkv+pcA9218HU
	zNWEjhD99tIG6GL9SxcNWtv69HNCPVQjDpixBN9e2MZDh2WjntkdtSSoiUm6ymMDErj+N8I1mNv
	zX9PqWKglIvFh+jZqjRPwytQm62Kx4
X-Google-Smtp-Source: AGHT+IFn52n0aTLVx0IuHopQOFwKNNIX2e3zu7DgcMUSmIjqFSbJEWZdITvqr7wz6RoFDLZ50Pkb/w==
X-Received: by 2002:a17:90a:fa8b:b0:28d:4db8:6d52 with SMTP id cu11-20020a17090afa8b00b0028d4db86d52mr3390977pjb.9.1705302772239;
        Sun, 14 Jan 2024 23:12:52 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id pv11-20020a17090b3c8b00b0028e5fe0115asm458214pjb.36.2024.01.14.23.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 23:12:51 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Marc Zyngier <maz@kernel.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] RISC-V: add IPI tracepoints
Date: Mon, 15 Jan 2024 07:12:40 +0000
Message-Id: <20240115071246.32675-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240114_231255_197353_EA4CD7B6 
X-CRM114-Status: GOOD (  12.06  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The strings used to list IPIs in /proc/interrupts are reused for tracing
purposes. Also slightly clean up the code by removing send_ipi_single().

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/kernel/smp.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 40420afbb1a0..32c653cd3433 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -26,6 +26,8 @@
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
 
+#include <trace/events/ipi.h>
+
 enum ipi_message_type {
 	IPI_RESCHEDULE,
 	IPI_CALL_FUNC,
@@ -36,6 +38,15 @@ enum ipi_message_type {
 	IPI_MAX
 };
 
+static const char * const ipi_names[] __tracepoint_string = {
+	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
+	[IPI_CALL_FUNC]		= "Function call interrupts",
+	[IPI_CPU_STOP]		= "CPU stop interrupts",
+	[IPI_CPU_CRASH_STOP]	= "CPU stop (for crash dump) interrupts",
+	[IPI_IRQ_WORK]		= "IRQ work interrupts",
+	[IPI_TIMER]		= "Timer broadcast interrupts",
+};
+
 unsigned long __cpuid_to_hartid_map[NR_CPUS] __ro_after_init = {
 	[0 ... NR_CPUS-1] = INVALID_HARTID
 };
@@ -96,18 +107,14 @@ static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 
 static void send_ipi_mask(const struct cpumask *mask, enum ipi_message_type op)
 {
+	trace_ipi_raise(mask, ipi_names[op]);
 	__ipi_send_mask(ipi_desc[op], mask);
 }
 
-static void send_ipi_single(int cpu, enum ipi_message_type op)
-{
-	__ipi_send_mask(ipi_desc[op], cpumask_of(cpu));
-}
-
 #ifdef CONFIG_IRQ_WORK
 void arch_irq_work_raise(void)
 {
-	send_ipi_single(smp_processor_id(), IPI_IRQ_WORK);
+	send_ipi_mask(cpumask_of(smp_processor_id()), IPI_IRQ_WORK);
 }
 #endif
 
@@ -115,6 +122,9 @@ static irqreturn_t handle_IPI(int irq, void *data)
 {
 	int ipi = irq - ipi_virq_base;
 
+	if ((unsigned int)ipi < IPI_MAX)
+		trace_ipi_entry(ipi_names[ipi]);
+
 	switch (ipi) {
 	case IPI_RESCHEDULE:
 		scheduler_ipi();
@@ -141,6 +151,9 @@ static irqreturn_t handle_IPI(int irq, void *data)
 		break;
 	}
 
+	if ((unsigned int)ipi < IPI_MAX)
+		trace_ipi_exit(ipi_names[ipi]);
+
 	return IRQ_HANDLED;
 }
 
@@ -205,15 +218,6 @@ void riscv_ipi_set_virq_range(int virq, int nr, bool use_for_rfence)
 		static_branch_disable(&riscv_ipi_for_rfence);
 }
 
-static const char * const ipi_names[] = {
-	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
-	[IPI_CALL_FUNC]		= "Function call interrupts",
-	[IPI_CPU_STOP]		= "CPU stop interrupts",
-	[IPI_CPU_CRASH_STOP]	= "CPU stop (for crash dump) interrupts",
-	[IPI_IRQ_WORK]		= "IRQ work interrupts",
-	[IPI_TIMER]		= "Timer broadcast interrupts",
-};
-
 void show_ipi_stats(struct seq_file *p, int prec)
 {
 	unsigned int cpu, i;
@@ -234,7 +238,7 @@ void arch_send_call_function_ipi_mask(struct cpumask *mask)
 
 void arch_send_call_function_single_ipi(int cpu)
 {
-	send_ipi_single(cpu, IPI_CALL_FUNC);
+	send_ipi_mask(cpumask_of(cpu), IPI_CALL_FUNC);
 }
 
 #ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
@@ -329,6 +333,6 @@ bool smp_crash_stop_failed(void)
 
 void arch_smp_send_reschedule(int cpu)
 {
-	send_ipi_single(cpu, IPI_RESCHEDULE);
+	send_ipi_mask(cpumask_of(cpu), IPI_RESCHEDULE);
 }
 EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
