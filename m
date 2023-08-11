Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3043DC001DB
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 23:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NfhHY9bMq/9khy0G8HAwR3EtSdKTVS3HHMawo/PiMHo=; b=i+rDlAflyCE0EyUWcKBVblIxQP
	Dt9ME63fMHReuUy//vyShKwI8roZmGaRjtUdrn6/wyAy7t98c6IB5u95xV+xjOYWK9FPbvrIsLQj6
	q5stxBW0de+E7OsczKgKABxQhq5cvD9+/wt2K882LlxbRjZSaYJjVU352GmjPVc1l2/WPInZEw/WH
	8EXiNOgsjVuFnk4PFvALElmvfFgAnjpkLEggSCEK9+BpplqzJfvf3vhUHY9juxtlKbck6SYHOlQAk
	U0AGcrtsWy1XVyEdtuKwQUuhbM1y7mPr11Qh10xMS7pEAybBM94FpDDokwHLcLNVwONJdOefFOPVV
	eIbaayZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUbfy-00Bw9k-2V;
	Fri, 11 Aug 2023 23:36:14 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUbfv-00Bw6g-0Z
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 23:36:12 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-564e1843717so3022425a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 16:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691796969; x=1692401769;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VZF+IDNpZAY/LDD7db/2FGsLr/FEvCnem9lcmfmloZ0=;
        b=mtVd1W3/3q051Qstg/rkwh22KJtXJgwRmJjPFHPrSUwrwcnjBaqya9IaLakBib/tGp
         MZTlDO3i3B4tO+B0FXZi24NgY0QmiN3TLRaIN/r9BVzhVd6lXdijvcEwht3QqyGFD25d
         iAg948H3L3HcDIX/PDfVlKzDxQL0FtAOPKhRa0fRjcPK/dRobJigKyFzAfEEvzpV65fs
         kGDPQqp+LC2W1h1PDbovFc73zR/ks5uXhEXNhFQtNnxEmYALG9EGpnOyEhYzt92Xo9Yq
         5nvT9GMKmOWUbwmKtjMTTTSyuaOqrL5J7LhfgrsQFnUpeCuAUc08CGdSsrD74A12oTl/
         4BBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691796969; x=1692401769;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VZF+IDNpZAY/LDD7db/2FGsLr/FEvCnem9lcmfmloZ0=;
        b=HZOpVaWL+g3pEHN3+8cEGr2v5+hu+LJSMxdPCrTwwpbBggiZY0dId+kMem+YTRdsPF
         /DcKWBbmqXMHuStmFU0OwcAk6PFoUcjIvwsDRKDXyRI0nQO0BDos/iSmJvrRAYy8O5eg
         DG4rAvOveJAdUhkgHME7BiOwKs5WVvBIYMxHeQCsxLCqPMGy2B0ib689bDttWy8KFLvb
         Pl1phHBBufkB/VJkkTOFrI1lbEIMxS2xoYooRRiFU1rIGb/GpjkIu9Tlm8S3AnRMHs7z
         kH+LQTlMPRnQ94Z8oVnkOi2GUSf2k9/5WUQqzv0wPWDzNtFsfJWYHR7lBRZG7hWYUOYF
         pf0w==
X-Gm-Message-State: AOJu0YwTjfCNM+q43p/I0p/2bTmDIRZ2xkQeRuLVivI/SKHjUJDk4EKA
	hoBlpIcKuFc6WS87qx3PvMr6zHl+eWz4wiaChCY=
X-Google-Smtp-Source: AGHT+IHhsvuH2OM1UWszf4TCMu5qR06fZ9BwriEs9fj1OxjgnvZGnw/4HlxK/SLUtDQ7Phb6303mh2wjDyw9Z0/+bjA=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:8c57:0:b0:564:aeb6:c383 with SMTP
 id q23-20020a638c57000000b00564aeb6c383mr638656pgn.1.1691796969048; Fri, 11
 Aug 2023 16:36:09 -0700 (PDT)
Date: Fri, 11 Aug 2023 23:36:02 +0000
In-Reply-To: <20230811233556.97161-7-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230811233556.97161-7-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3124; i=samitolvanen@google.com;
 h=from:subject; bh=wBRXjmNHfhdcdsjrWxKjQVM4d1RVOAig5wuWuTXp+sw=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBk1sXcweRCoqkszjtNMVnBaMVhIhZi/o4cME2C4
 t5Qc51TbeWJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZNbF3AAKCRBMtfaEi7xW
 7oToC/0bVrByxxtfXjE7idOKMhQ47Ftkbwzrwd/qVpuGk5sKwMO1ZCCpNUD1WjHmpT9DM/jRjii
 ID7y7zSN8jMwvkBKVqWFcrA/Eaa0m5fWafqe4cjjWupJSB/ep6zYn/Rg6HLdIw7XP4JK/Vc4y4r
 TzWyrycXtowJuCYuF+VVNuP27Hv37AH2QTpPxcpmbb7m3TwnCZ3WQKLI40KhXg8gonXaggVqg3q
 X5caBqH0OE2M8dRrYxeDPBlFrqtmfu0hbgTF/flJQdHf2d68ZJHYv8m5rdu94Bnwwf6XZFg+Q0R
 ZQlYPtqVBdg6YwftizeZzNr6QjUFpqQ7A4buby+3pAI85S6NE4IF5Nces27nX/oKcSXM9+L4gog
 10WOtL3ybC+F9bnk4ud+g4NkqrfaEszHa/UYGP2doaSEY7wnGja38VeGjqq9XMANxgYlDyRpWrs vGsTNxyJYa2V8imEkZFgy9kgnfoyRyITlo1VmA8GQU3rxJACgMLpVtK/P/BITWXbgVKXU=
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230811233556.97161-12-samitolvanen@google.com>
Subject: [PATCH 5/5] riscv: Use separate IRQ shadow call stacks
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Guo Ren <guoren@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_163611_216441_27A3A1F2 
X-CRM114-Status: GOOD (  11.54  )
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
2.41.0.640.ga95def55d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
