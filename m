Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0B9C432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:00:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3868F60F91
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3868F60F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RYqTDYDpvEuGhluI0KrphfFKyp3krvbB3gZzSVtJYw=; b=yzQL6plUj2yda7
	Foman4eKHY6cHrrpAcWi7wE63BjsJm29lHByT/MVea7ZN3+3Ob/6TRGmKYcCJF68HXdl4Rs2QzUWK
	mMlnm1h8dvwfD0hx5xgNmRsmRqjj7iPUaPmaECvE5yfnkVGK04oWhUxcQYTwmzQydLekOCTth9oYS
	DeEb0pM15LzfwreBQlPhpSBQsSQo8nP2zLk6smhotY/SGh0VrMy2wMsI5QXXXf/wmCls7tayUWt2S
	Hfvvh2qJSrY/+sUqSbqejmiRabPMHajyUZ5AcL81T36mYy4eOonxAd75E8A04RHKZCakdIFxvTLq5
	WlN26+FaF0TJSzyW2gwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJQEZ-00BCIq-Dg; Fri, 27 Aug 2021 01:00:39 +0000
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJQBi-00BAt4-W2
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 00:57:49 +0000
Received: by mail-qt1-x84a.google.com with SMTP id
 j23-20020ac86657000000b0029cb70967ebso1497252qtp.14
 for <linux-riscv@lists.infradead.org>; Thu, 26 Aug 2021 17:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=7WpldovdtqBjPyUEkww2XiVMcgw0iocdpFhT3fL9Y/E=;
 b=fgDxSxTGTxcZLWwdesQTHrLRjD48WNg8cXGu/5JrJXiO1lVZNcp1mJi1KnKIamoUIb
 GUG8jeA412h0q7WsWgcUMG9CfTqF/7lbyUHH3CZvO1OjwSOjAze/zxZOCD4XiOHY2vOg
 ZCWJG+tM9Q4MHZrfySnWFFnlm5S90oVlRjLiaugYI/2lPWiqDzv3nfIPXhy7Ca8xvfgg
 X3UHfVEYDtxZC7ZyDhLnFUlHOhDlqL09y4XS39FuuYOKJH+x2JAvhFvXscuMtwc/X5A9
 NOLbM318OIpQ2G7/g+etioE3kJRbZ/bYAvBYfY38LpHgCH+BIfcvqB1GyewBrxueUUcA
 RPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=7WpldovdtqBjPyUEkww2XiVMcgw0iocdpFhT3fL9Y/E=;
 b=qBVy7vmwhL9/HF5fBYMpN25sZl3RTqcIVeo/Hf+sJtnoz6XpFxdCvUlV6E5KRssi8q
 R8z++asxWj8FOfYCkaoYx2pacPZ0sWT/njvMoOXJ360EWz3ZZ5EudEK6LK9GQRoXnqiX
 4yofcVBwBf5Vk5E/4uS4R0sjkWkxgz/MSFaN5gZF7e+/02LHQxRra3x7mXFF54H8A7QW
 V3ervvH4SL4LetMTTnvCI/fdIYOXkqDiJEl16UNeAnEXY0sPU/33+NVQNgPvptbbRlbd
 LwPCW3/I8qCXIpqZew+yZeTenMel4oBV9m55Wwmd+lFzhyFq8uYbHrJFKIQFrqymjzaD
 bNqg==
X-Gm-Message-State: AOAM531ovMQEjXyqqkf7x7figf+G275SC93khHqBg7HUOgYvRVlmuMaQ
 DgUSjgXjRDKWNWSu6aCV2WzXj9ELytQ=
X-Google-Smtp-Source: ABdhPJy/Z8J/7Ce+UZRUTjxGB4/tm5OJ2fdY2ZzHJtwz3NXqGQKt+XYwzsRhryc5v6fwBU31D6XFJg8/ijw=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a05:6214:29cd:: with SMTP id
 gh13mr7215357qvb.25.1630025858489; Thu, 26 Aug 2021 17:57:38 -0700 (PDT)
Date: Thu, 26 Aug 2021 17:57:07 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-5-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 04/15] perf: Force architectures to opt-in to guest callbacks
From: Sean Christopherson <seanjc@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>, 
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, 
 Namhyung Kim <namhyung@kernel.org>, James Morse <james.morse@arm.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 "H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.cs.columbia.edu, linux-csky@vger.kernel.org, 
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Artem Kashkanov <artem.kashkanov@intel.com>, 
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_175743_076133_BD4ACE19 
X-CRM114-Status: GOOD (  18.39  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Introduce HAVE_GUEST_PERF_EVENTS and require architectures to select it
to allow register guest callbacks in perf.  Future patches will convert
the callbacks to per-CPU definitions.  Rather than churn a bunch of arch
code (that was presumably copy+pasted from x86), remove it wholesale as
it's useless and at best wasting cycles.

Wrap even the stubs with an #ifdef to avoid an arch sneaking in a bogus
registration with CONFIG_PERF_EVENTS=n.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm/kernel/perf_callchain.c   | 28 ++++------------------------
 arch/arm64/Kconfig                 |  1 +
 arch/csky/kernel/perf_callchain.c  | 10 ----------
 arch/nds32/kernel/perf_event_cpu.c | 29 ++++-------------------------
 arch/riscv/kernel/perf_callchain.c | 10 ----------
 arch/x86/Kconfig                   |  1 +
 include/linux/perf_event.h         |  4 ++++
 init/Kconfig                       |  3 +++
 kernel/events/core.c               |  2 ++
 9 files changed, 19 insertions(+), 69 deletions(-)

diff --git a/arch/arm/kernel/perf_callchain.c b/arch/arm/kernel/perf_callchain.c
index 3b69a76d341e..bc6b246ab55e 100644
--- a/arch/arm/kernel/perf_callchain.c
+++ b/arch/arm/kernel/perf_callchain.c
@@ -64,11 +64,6 @@ perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs
 {
 	struct frame_tail __user *tail;
 
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
-		/* We don't support guest os callchain now */
-		return;
-	}
-
 	perf_callchain_store(entry, regs->ARM_pc);
 
 	if (!current->mm)
@@ -100,20 +95,12 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 {
 	struct stackframe fr;
 
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
-		/* We don't support guest os callchain now */
-		return;
-	}
-
 	arm_get_current_stackframe(regs, &fr);
 	walk_stackframe(&fr, callchain_trace, entry);
 }
 
 unsigned long perf_instruction_pointer(struct pt_regs *regs)
 {
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest())
-		return perf_guest_cbs->get_guest_ip();
-
 	return instruction_pointer(regs);
 }
 
@@ -121,17 +108,10 @@ unsigned long perf_misc_flags(struct pt_regs *regs)
 {
 	int misc = 0;
 
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
-		if (perf_guest_cbs->is_user_mode())
-			misc |= PERF_RECORD_MISC_GUEST_USER;
-		else
-			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
-	} else {
-		if (user_mode(regs))
-			misc |= PERF_RECORD_MISC_USER;
-		else
-			misc |= PERF_RECORD_MISC_KERNEL;
-	}
+	if (user_mode(regs))
+		misc |= PERF_RECORD_MISC_USER;
+	else
+		misc |= PERF_RECORD_MISC_KERNEL;
 
 	return misc;
 }
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5b13a932561..72a201a686c5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -190,6 +190,7 @@ config ARM64
 	select HAVE_NMI
 	select HAVE_PATA_PLATFORM
 	select HAVE_PERF_EVENTS
+	select HAVE_GUEST_PERF_EVENTS
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_REGS_AND_STACK_ACCESS_API
diff --git a/arch/csky/kernel/perf_callchain.c b/arch/csky/kernel/perf_callchain.c
index ab55e98ee8f6..92057de08f4f 100644
--- a/arch/csky/kernel/perf_callchain.c
+++ b/arch/csky/kernel/perf_callchain.c
@@ -88,10 +88,6 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 {
 	unsigned long fp = 0;
 
-	/* C-SKY does not support virtualization. */
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest())
-		return;
-
 	fp = regs->regs[4];
 	perf_callchain_store(entry, regs->pc);
 
@@ -112,12 +108,6 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 {
 	struct stackframe fr;
 
-	/* C-SKY does not support virtualization. */
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
-		pr_warn("C-SKY does not support perf in guest mode!");
-		return;
-	}
-
 	fr.fp = regs->regs[4];
 	fr.lr = regs->lr;
 	walk_stackframe(&fr, entry);
diff --git a/arch/nds32/kernel/perf_event_cpu.c b/arch/nds32/kernel/perf_event_cpu.c
index 0ce6f9f307e6..a78a879e7ef1 100644
--- a/arch/nds32/kernel/perf_event_cpu.c
+++ b/arch/nds32/kernel/perf_event_cpu.c
@@ -1371,11 +1371,6 @@ perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 
 	leaf_fp = 0;
 
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
-		/* We don't support guest os callchain now */
-		return;
-	}
-
 	perf_callchain_store(entry, regs->ipc);
 	fp = regs->fp;
 	gp = regs->gp;
@@ -1481,10 +1476,6 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 {
 	struct stackframe fr;
 
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
-		/* We don't support guest os callchain now */
-		return;
-	}
 	fr.fp = regs->fp;
 	fr.lp = regs->lp;
 	fr.sp = regs->sp;
@@ -1493,10 +1484,6 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 
 unsigned long perf_instruction_pointer(struct pt_regs *regs)
 {
-	/* However, NDS32 does not support virtualization */
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest())
-		return perf_guest_cbs->get_guest_ip();
-
 	return instruction_pointer(regs);
 }
 
@@ -1504,18 +1491,10 @@ unsigned long perf_misc_flags(struct pt_regs *regs)
 {
 	int misc = 0;
 
-	/* However, NDS32 does not support virtualization */
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
-		if (perf_guest_cbs->is_user_mode())
-			misc |= PERF_RECORD_MISC_GUEST_USER;
-		else
-			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
-	} else {
-		if (user_mode(regs))
-			misc |= PERF_RECORD_MISC_USER;
-		else
-			misc |= PERF_RECORD_MISC_KERNEL;
-	}
+	if (user_mode(regs))
+		misc |= PERF_RECORD_MISC_USER;
+	else
+		misc |= PERF_RECORD_MISC_KERNEL;
 
 	return misc;
 }
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index 0bb1854dce83..1fc075b8f764 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -58,10 +58,6 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 {
 	unsigned long fp = 0;
 
-	/* RISC-V does not support perf in guest mode. */
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest())
-		return;
-
 	fp = regs->s0;
 	perf_callchain_store(entry, regs->epc);
 
@@ -78,11 +74,5 @@ static bool fill_callchain(void *entry, unsigned long pc)
 void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 			   struct pt_regs *regs)
 {
-	/* RISC-V does not support perf in guest mode. */
-	if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
-		pr_warn("RISC-V does not support perf in guest mode!");
-		return;
-	}
-
 	walk_stackframe(NULL, regs, fill_callchain, entry);
 }
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 49270655e827..a4de4aa7a3df 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -229,6 +229,7 @@ config X86
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_EVENTS_NMI
 	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
+	select HAVE_GUEST_PERF_EVENTS
 	select HAVE_PCI
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 05c0efba3cd1..5eab690622ca 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1236,9 +1236,11 @@ extern void perf_event_bpf_event(struct bpf_prog *prog,
 				 enum perf_bpf_event_type type,
 				 u16 flags);
 
+#ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
 extern struct perf_guest_info_callbacks *perf_guest_cbs;
 extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *callbacks);
 extern void perf_unregister_guest_info_callbacks(void);
+#endif /* CONFIG_HAVE_GUEST_PERF_EVENTS */
 
 extern void perf_event_exec(void);
 extern void perf_event_comm(struct task_struct *tsk, bool exec);
@@ -1481,9 +1483,11 @@ perf_sw_event(u32 event_id, u64 nr, struct pt_regs *regs, u64 addr)	{ }
 static inline void
 perf_bp_event(struct perf_event *event, void *data)			{ }
 
+#ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
 static inline void perf_register_guest_info_callbacks
 (struct perf_guest_info_callbacks *callbacks)				{ }
 static inline void perf_unregister_guest_info_callbacks(void)		{ }
+#endif
 
 static inline void perf_event_mmap(struct vm_area_struct *vma)		{ }
 
diff --git a/init/Kconfig b/init/Kconfig
index 55f9f7738ebb..9ef51ae53977 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1776,6 +1776,9 @@ config HAVE_PERF_EVENTS
 	help
 	  See tools/perf/design.txt for details.
 
+config HAVE_GUEST_PERF_EVENTS
+	bool
+
 config PERF_USE_VMALLOC
 	bool
 	help
diff --git a/kernel/events/core.c b/kernel/events/core.c
index baae796612b9..9820df7ee455 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6482,6 +6482,7 @@ static void perf_pending_event(struct irq_work *entry)
 		perf_swevent_put_recursion_context(rctx);
 }
 
+#ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
 struct perf_guest_info_callbacks *perf_guest_cbs;
 
 void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
@@ -6495,6 +6496,7 @@ void perf_unregister_guest_info_callbacks(void)
 	perf_guest_cbs = NULL;
 }
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
+#endif
 
 static void
 perf_output_sample_regs(struct perf_output_handle *handle,
-- 
2.33.0.259.gc128427fd7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
