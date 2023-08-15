Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B5FC001E0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 20:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=f9vnZPrvpl5tbPgxaBl0ZCiIgLnQpKjddkhGF/Ghcds=; b=GneCCttn4YajSBJBfkhGMFRA5e
	eb1fTx5mh0HJ5CMjKgd59zghwQb3YWlVUkp8LPB9NsqVQKIj/ZXX3SUsu4LQ+1+S2q187i7rQlx0R
	ijE+uypo4dlicmLf/1mjxxvyqqQMJBlygVPzjrsQqDyxc3FzPHM2rhAsiZ2/0HR14jldsf+K2aPBq
	NT4jm/hF47pUJ84ErN3clR+0ojzklcAINkxLbPuI6AuOigPBKhe3grTL968Kj6k4PWLzgfclZtC3U
	G7peKyBD9PF2jOu9ww6hdmZlYmV/IeSAI0nOxg1Mu2QUCvYVz1yEyfaFn7+uwAPWADI/WekZB5FPR
	PQ49fa2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW0ko-002QSI-31;
	Tue, 15 Aug 2023 20:35:02 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW0kj-002QPq-0Y
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 20:34:58 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-584139b6b03so74737007b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Aug 2023 13:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692131696; x=1692736496;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uSOlMNCKHmfn5xfjrLh25HLPAdSumgQ6fSlbmoDJ2Yc=;
        b=qox904O6890VuPVeOFie+1gdmVBYEK7DiCslIx75yuPhU25HodT/JX1fwIBsNjAqoW
         iQp2mkqgx00drzHTCY7LI8aABLkp1VnAeuVSPs0VEuZYZ47KInVdm7L62A4CvkC5bp0l
         C5/HLIBI+E08srWstaA2cDxRL3JtGccv9yCImwYaUrvr3deqtmN7h8aeIdx6lyEucs/m
         pw4vrlK5aHRM1FnlmLa+RzgujHxZ4WrJcngnnxCUiIxM+P8tDmNNr9Vt8Ab6fbkG20n1
         yF5suVbZp+f/JhUCo5ExAiU6zsPSve/ui3KtPmU9Ua6b1Fdva7K+Na15IB35x1Wnlhgr
         y1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692131696; x=1692736496;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSOlMNCKHmfn5xfjrLh25HLPAdSumgQ6fSlbmoDJ2Yc=;
        b=HZ1Us9uXrGxhzP2RdvogJoK3CITzWPEmFpXpyzIro1GtrnzWeETXkFqUHU+LtT4++7
         L2NVCUxzajoLxA2mkxcMwMTkkUmIGx6w67i+v1k4HfKn3n/XV0WBfJGN8tfPeeP6LCpQ
         qBC+oi4cnCyamriy2WSqQT4LE9dtGKu+v0HEaScuqR6v4wIfD24H7qnOernBRtVokryT
         R+wAykEtblaqNaodAw5HdbBVcbBcrTMS4KvxUQ50SvdHk4iA7sfa0OhH3dgLcLS5ezTn
         NSF2jse5lAqZhZA7dLIWUVMVZVQEFRCBD2b3wk30NiaajfkU4TyWRLOBEEVIDUsEiFr0
         n4Rg==
X-Gm-Message-State: AOJu0YweSn/McPAxonBsmEcB3Adhudab81Um4vz8O7vIokXPUb50CnaA
	AZei5qvFpfkpf/15b9rU/FYN5AntlkcUs1AlzbE=
X-Google-Smtp-Source: AGHT+IFIG6x56rr09NEIucFsFTb2xdeaHALY+wrc10+vyz3Ri9z+DqUmjXG78S/oVc7ErGyWTEp4JYnxEZ20xlRZUd0=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a81:ad12:0:b0:589:a935:b13 with SMTP
 id l18-20020a81ad12000000b00589a9350b13mr197844ywh.5.1692131695824; Tue, 15
 Aug 2023 13:34:55 -0700 (PDT)
Date: Tue, 15 Aug 2023 20:34:48 +0000
In-Reply-To: <20230815203442.1608773-8-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230815203442.1608773-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3124; i=samitolvanen@google.com;
 h=from:subject; bh=+CT5zR4YANM8SQ9/yXUv6987s9+QQOw/OXe2qcTQ3NU=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBk2+FiWKdkEjcK+oM60PCK6k6ESVE8u+T4K+xL3
 kx9YUX2gkmJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZNvhYgAKCRBMtfaEi7xW
 7kXbDACVmNAL8YYcd9TlWO6FP17kmKyhCvdTHqqrxGafGKiyJDXD7dTQipBujrxw7uevlZIkOiM
 2krCuz5YPDlaC9LMHF4iLkWccLPwZY1NMQV8VwQyWPIHG97WO4fo4aZ/kbZf/FVoXcEBkZzmXD8
 8OIDeYf8fCjDiqITUNFS8qFFrppbk0LerRQp9AYy9rIXE9LIuxkoEJ0I892xLtE2jEJLbAj13UM
 vTaq0hnLWd9E5rxKWuGMqUheN3DI1xIYFHjZX6lYODTUzRVyukKdeCXAyG0XNeyaVi2AdmvgGo5
 eMPQz8InG+kdQSqH3PSbaR/H788IhSheQImtpgsJhycp41G5XbIAVuq5ndC1pik0iTdXM/sQoR9
 /Tr6kIR9wN8YC3VWXEKaLCPfVOvzGEta9WYy7NAxOQ1tAjE9PjNaLg75QDxE9Ji92wRuwPgCcqh 1avsH5hj5GulKKx9q9ZdyeIoLP/3xzhAq5SgONJcm7ldjpCnTpGVtm6muw6YiAJ0EUnNY=
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230815203442.1608773-13-samitolvanen@google.com>
Subject: [PATCH v2 5/6] riscv: Use separate IRQ shadow call stacks
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Guo Ren <guoren@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_133457_208448_7606E8A1 
X-CRM114-Status: GOOD (  12.47  )
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
index ad34507d3c96..c86b76584d2d 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -238,12 +238,19 @@ SYM_FUNC_START(call_on_irq_stack)
 	REG_S	s0, (sp)
 	addi	s0, sp, 2*RISCV_SZPTR
 
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
 	addi	sp, s0, -2*RISCV_SZPTR
 	REG_L	s0, (sp)
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
2.41.0.694.ge786442a9b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
