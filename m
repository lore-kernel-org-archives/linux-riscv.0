Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B95C83F11
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 19:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HqqXWfw1fd/q3qTKAO+sWfU+Ac3E6i5K4oSaG233bxA=; b=iZaaqmpcCObFUZElEQMGFQ4opl
	TWyVR4tOtHRDyhwV1PumLoHD3E38xKf/IzcTOUwtrIMtNAwkR1DOyrq1W1MQb2Z+MT5DDWSh74RjW
	vWZkCXF83UfYlQnMVYf5KMisUNgAEcZPcA77ZxTD2QGDBRZkyKc1VcDS11DraOuFmUFF/4gmN0ZMw
	qGmaAGNdFDCaL0/9TZOjfh8LeGdFFotHMdf017yjpflXlpcv9v4S84TxyeXn8THQSOWcXQE2UHbWM
	IJcg4qwPKSorcAMQO4DV60MSqHhL2bOS79vx7anY4PgwpUO1+Ycov4JIyoDmZ9HSmC6T85NxCi9Wp
	8mDE+9bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaiO2-00AByV-0I;
	Mon, 28 Aug 2023 19:58:58 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaiNu-00ABvk-2P
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 19:58:52 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-58d37b541a2so52899187b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 12:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693252727; x=1693857527;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=03jC+OBVw6NtqXGsEGvclVCdQhu3EQx6jlJc9yvphdo=;
        b=E+bfdH1lDaLKrKcjWlt3v7mLrI0mXX3/qYWVcii5PVVLZRAYiy1nsib+qeG6H8MOuT
         9OhEHYpNgvWxBky8trYBSEV2JubnwBjeu7di8zHvRoZf0j/YO3KJeryt/leOQaOk8U0+
         E0YLLPMtCwqk+7XZu6/A3/70OtYGnMDc9dICr0zRd4xccIbb8Fl0DxJGU04K1ySPvtRA
         rOrJmojR9TLloOAjWkHIpTDXARYBxhHwOkJ5h1zSqKkVSIGksfJHQ6WU6QjJ2FOyH2nJ
         Z25Phbti7WwdNvRX5aYN5oYcnIcIxNODEPr4eLAqGQxyHCx64dEv2WvC0HWZsxOdspdf
         wAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693252727; x=1693857527;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=03jC+OBVw6NtqXGsEGvclVCdQhu3EQx6jlJc9yvphdo=;
        b=OdYq/MR8bmEgRxgux9JssChCiToTp0b1e0E/VVrwO899zw3IHUOfZjMt3jg7mELn9H
         OHiurX+DTBZJxwUm2OWYZlulM0p1EOe2tB9EdO8ljwxDgFDoYdUMNJUVmMjSzI3OOdWE
         J6fGIY3x/Sgi75Ps/bzXii5zUFo8PzqKuCUEJmTDmGBASHGmi23ExDFaXctYWrYJEHLg
         Y3OVUkhinUfm25wvHLFVbCreid0Qpdx8dFa+oZMeNz1+N8ukYjomAMidvnG2NSbg9ZB1
         oivZtmv5Zvd82Jlt6OwJIaTAWX9XiHJbMoGVmKqeCApLbUmwhWp1AMAhJiysyYVqQ8DW
         hzAg==
X-Gm-Message-State: AOJu0YwTGwLr8HicZFc6yAMFx+f50CK61iCizhMer1a8bcynG9zJ40Ht
	eFA8oqUj4sHgYNSulKzzQljbJfeIAZRPSQC0eBg=
X-Google-Smtp-Source: AGHT+IGX3a8SAyFuYllCKEJp1p8BAuBf4bX7iN13I4toDObzdsg0UQOHsOqXYzlSHWKRqNRQ4bgZw4/tHZOh9SXDs4o=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a81:a904:0:b0:576:8cb6:62a9 with SMTP
 id g4-20020a81a904000000b005768cb662a9mr947313ywh.6.1693252727342; Mon, 28
 Aug 2023 12:58:47 -0700 (PDT)
Date: Mon, 28 Aug 2023 19:58:39 +0000
In-Reply-To: <20230828195833.756747-8-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230828195833.756747-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3226; i=samitolvanen@google.com;
 h=from:subject; bh=/mGBqVAJStUatVnFnltMn+I7N64iI2QEtl2iB/CZBSg=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBk7PxqQdVKNNuAiMW7udPNqMcNpKCbHaCzUHSyh
 KrgH39THuGJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZOz8agAKCRBMtfaEi7xW
 7guJC/9ByIZj6HC9xt8M48iEuc3eleOXi7LLtLxGuUV5BC0aCnuet8/CP1zkrGWtv2JZ39aif62
 X2Lq1gXUXz4nIi7rwmDEz0XjtrBeZtsI5xghAkZCCubYNPWatl0y+0UTL0qa+VuYO+MUp7CwJ4q
 19Any1fNwFxVAXnOTh+0UAcjst/pmBxL9W1CG4VnyA9NHMX3EXKgrQw1SpC0g1+mUut9n6bcrJr
 W0ppsOU/Jqpc/8Xg4TgExx30gJgt1XpXcZSyNaDZk4jXED/GJ0cOupaFz/3bhVzR1J6/y9z3y70
 b9ZHkq5uFdJ6LPJDcdccev+aWmRxrkaw1vZ/4ksObnxApxpaGmFk+kc09Q4+Ab83M50knpeUZkB
 2lPPYgLx0SeP3+XQdiJywRmtKnipviQqot/8K0XYRWNukxdtd30QBKhYtlFI7f5uDYw2bpedKeO 5hPzmPQaQUqbOlLYrH/VXQIVhJ5BZDRq9B+djftJejiGDFObOFuxsPk6QpMbtOq6LFIVA=
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
Message-ID: <20230828195833.756747-13-samitolvanen@google.com>
Subject: [PATCH v3 5/6] riscv: Use separate IRQ shadow call stacks
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Clement Leger <cleger@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_125850_790085_8B41EF4B 
X-CRM114-Status: GOOD (  12.14  )
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
2.42.0.rc2.253.gd59a3bf2b4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
