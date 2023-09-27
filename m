Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCAFE80A8A
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 22:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5pewuRcxqvIp0EIBFIb7TQdOe1nMZMS6B0vsNbw+E60=; b=d9sOJKoUoitdf+qnwDmhxb3TeE
	5zon1T+7jjDyRMxqkHidKbluvUScGiK7388oJqd6YSi5Adyi20lPeOylKPnfofz6eP7HXqPpfbf+7
	9kyMJczuzHo0AtH5jgMKQtm6nDuMJxJFcOt4y4Jz3SSOnVtkOfw8HkLsDAoiBUyoaBv/r2bfTeZpy
	bz3zNgAzY073Z7YJ31j68VlZxCZisiHu8XstkpuTxoJIWzwKExNw5gEVvIWEUuTMQHk0WEccwUTwd
	KgXydYSsQ1Zvz06ez1rD5jyoMA5LkmFCvUJCJvkJZ28/66PBA1H7JRvJyNCGDQeMWj4Rhk2BGFoe4
	lAtj9UHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qldKQ-001s5X-0O;
	Wed, 27 Sep 2023 22:48:22 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qldKG-001s0X-25
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 22:48:14 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-578fb6bf0d6so12046219a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 15:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695854891; x=1696459691; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3UA3PzXciXcLUc7CxJsx04dBK4in+Q1qERJTsVZ4p+I=;
        b=4Vi8cOzXYMbdS/QJrf+LZC7ihtuAdD5jtZK5ZllPoNRgZEdhuu1n9XKW05ewWjDQrS
         Ep9lAnV98yqma9vi6qRzXj5ZZ/jCJ1XnVLOUyO3MFILnlw0BmsAgaG2adddy4+/yhKNQ
         halUUGU616R5TWjTQ48MvmFGwekL3Dn15rrVXxn9O40IRqSzGGBskY8ww0PgmbBUxwdb
         8iNwmMyppCKosPNYdyyZ5B7uwrSpYa+vhzE3bl+gsi34uLmDoNwg5I9C7jju7UuKjFNH
         YRc4eEAPPrNNQAxkNhfYj2hldMNBaiWbFhlsAd9FMZyuHkTa4pdZdSSgexA6S2MIB5WE
         pbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854891; x=1696459691;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3UA3PzXciXcLUc7CxJsx04dBK4in+Q1qERJTsVZ4p+I=;
        b=AyEA/ojonMeAwknBnlOjnB8biJG3svPAwvBwCTbeyKLNqimaaN5Gtyjdbe7h9INYHp
         ryMvOyDLNEuquKAHKG8fiLQPKc+IeiUbrDRSyzcbpSHkXRDMZ2oO/LdtxwkonuZnJPUQ
         VTlJvVAoFetHF1BXktiDi/4/WfJDX1yUhY7hQDHCRValg2pX+ED2rc7xBRrOqxWpOwOs
         cPdetcQhmhYFSKD6SwWS1EM9/drVsNbRFLDVCtmOqy1SrRXg2enhJ45oIyEJqpbDP/5U
         zyVztPS44DhrVjILhFcEDUNe4GrTPTNIaZnZj0Hrfq1Jx5Dk2s2qmifcCTVLeUDS00gF
         v66A==
X-Gm-Message-State: AOJu0YwMluqRsqoeQw95eKpPXu9G7Q7yBPtE8yRLDKN+u+XnwNY7yHst
	JLbFhGbcFlIa1m/qWvonYa5cG8RNYrb5LkcZuyI=
X-Google-Smtp-Source: AGHT+IGnHh7mzMqcUnQLuZVLiDPicZpub6WK4SE1LILyGIfzVy1iJYFLVk2P+ycVcj9fl1t/gaT0ECVaBFtwa8dcsJ4=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:902:d4ce:b0:1c0:ac09:4032 with
 SMTP id o14-20020a170902d4ce00b001c0ac094032mr40690plg.9.1695854890733; Wed,
 27 Sep 2023 15:48:10 -0700 (PDT)
Date: Wed, 27 Sep 2023 22:48:03 +0000
In-Reply-To: <20230927224757.1154247-8-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230927224757.1154247-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3222; i=samitolvanen@google.com;
 h=from:subject; bh=4iP9jD07sRLKZy9z4wycr0gGeMqN4nW8GVhSWT+pt0c=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBlFLEdc0ndW+W8xAwxA/Cqwr/zGM8KrW/4U7Qvn
 D6/24dFgZmJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZRSxHQAKCRBMtfaEi7xW
 7j/TC/9QYIFVRwBHilpMvJsGF5ZuLLmHXC+6PyGWcKJr1nfV4YChcnH2AyhrR3Jtsn0GDJrOc8N
 35cE87DH6HMvHXoAdjwYFdSZfEOQUulLMiyIZ37pg2TWFbhI4B0s95x/8KXGpIgMnApDq8FRKkr
 dkX4ZyFmhTYLNIpmNAleOednmNBtzsKapufJKcTpmhCq8SwzCTpkINVE7MsKmugeis556J8Sq9n
 py+Q6LsRmlhB7THYIcqHSiye89YKOv7oCvgahLR8miSX2x9iG7s8Mla1J5GqT274t3WrXdNPy6l
 B1nug8SBfJtw7s7N8My+43WNYyLLeJEzZwbPjTn9WGY1jqgcPbMigApDdUKe8Fdxb/oCiX/DVXC
 Tky38rffJrp5N9fn0HexYQXlNxa1ATOdk1/RRB9kKz6Er1hZRieQWrM4xBxWZMV5cd3WF1d0HmP PtTL6WVk+2I7pBm+006Qa1nQBDboCBjiHxppqh3VuXLq2JGFPc5C2ycM/tKhII8IFb28E=
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Message-ID: <20230927224757.1154247-13-samitolvanen@google.com>
Subject: [PATCH v4 5/6] riscv: Use separate IRQ shadow call stacks
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Clement Leger <cleger@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_154812_688414_8F1819CF 
X-CRM114-Status: GOOD (  11.99  )
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

When both CONFIG_IRQ_STACKS and SCS are enabled, also use a separate
per-CPU shadow call stack.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/riscv/include/asm/scs.h |  7 +++++++
 arch/riscv/kernel/entry.S    |  7 +++++++
 arch/riscv/kernel/irq.c      | 21 +++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/arch/riscv/include/asm/scs.h b/arch/riscv/include/asm/scs.h
index 94726ea773e3..0e45db78b24b 100644
--- a/arch/riscv/include/asm/scs.h
+++ b/arch/riscv/include/asm/scs.h
@@ -13,6 +13,11 @@
 	XIP_FIXUP_OFFSET gp
 .endm
 
+/* Load the per-CPU IRQ shadow call stack to gp. */
+.macro scs_load_irq_stack tmp
+	load_per_cpu gp, irq_shadow_call_stack_ptr, \tmp
+.endm
+
 /* Load task_scs_sp(current) to gp. */
 .macro scs_load_current
 	REG_L	gp, TASK_TI_SCS_SP(tp)
@@ -34,6 +39,8 @@
 
 .macro scs_load_init_stack
 .endm
+.macro scs_load_irq_stack tmp
+.endm
 .macro scs_load_current
 .endm
 .macro scs_load_current_if_task_changed prev
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 52793193a763..3a0db310325a 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -237,12 +237,19 @@ SYM_FUNC_START(call_on_irq_stack)
 	REG_S	s0, STACKFRAME_FP(sp)
 	addi	s0, sp, STACKFRAME_SIZE_ON_STACK
 
+	/* Switch to the per-CPU shadow call stack */
+	scs_save_current
+	scs_load_irq_stack t0
+
 	/* Switch to the per-CPU IRQ stack and call the handler */
 	load_per_cpu t0, irq_stack_ptr, t1
 	li	t1, IRQ_STACK_SIZE
 	add	sp, t0, t1
 	jalr	a1
 
+	/* Switch back to the thread shadow call stack */
+	scs_load_current
+
 	/* Switch back to the thread stack and restore ra and s0 */
 	addi	sp, s0, -STACKFRAME_SIZE_ON_STACK
 	REG_L	ra, STACKFRAME_RA(sp)
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 95dafdcbd135..7bfea97ee7e7 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -9,6 +9,7 @@
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
 #include <linux/module.h>
+#include <linux/scs.h>
 #include <linux/seq_file.h>
 #include <asm/sbi.h>
 #include <asm/smp.h>
@@ -34,6 +35,24 @@ EXPORT_SYMBOL_GPL(riscv_get_intc_hwnode);
 #ifdef CONFIG_IRQ_STACKS
 #include <asm/irq_stack.h>
 
+DECLARE_PER_CPU(ulong *, irq_shadow_call_stack_ptr);
+
+#ifdef CONFIG_SHADOW_CALL_STACK
+DEFINE_PER_CPU(ulong *, irq_shadow_call_stack_ptr);
+#endif
+
+static void init_irq_scs(void)
+{
+	int cpu;
+
+	if (!scs_is_enabled())
+		return;
+
+	for_each_possible_cpu(cpu)
+		per_cpu(irq_shadow_call_stack_ptr, cpu) =
+			scs_alloc(cpu_to_node(cpu));
+}
+
 DEFINE_PER_CPU(ulong *, irq_stack_ptr);
 
 #ifdef CONFIG_VMAP_STACK
@@ -76,6 +95,7 @@ void do_softirq_own_stack(void)
 #endif /* CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK */
 
 #else
+static void init_irq_scs(void) {}
 static void init_irq_stacks(void) {}
 #endif /* CONFIG_IRQ_STACKS */
 
@@ -87,6 +107,7 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 
 void __init init_IRQ(void)
 {
+	init_irq_scs();
 	init_irq_stacks();
 	irqchip_init();
 	if (!handle_arch_irq)
-- 
2.42.0.515.g380fc7ccd1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
