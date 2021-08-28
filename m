Return-Path: <SRS0=hxmM=NT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E60AC4320A
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Aug 2021 00:41:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 548AB60ED5
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Aug 2021 00:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 548AB60ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P2Wjvwf7UyALENmxEMjJ3dexlfBmWHIgMB180HUUx8A=; b=sO1cmq0BkYqwOT
	zHFbsNP3tRmTvfhgwMmlszgQePyd2AghkwA8kQhXcddKA3JKdIMhNZWn6CQhxAoUfTlbtF9Bbcrqc
	A0nFZ0cVWUEU77HRuBgDQeubMqcszdhN3JOxGwBScUWJScdcL2YSPG6Loim6WwidHp29dcDtDb0d/
	BX1jakhsMojO3xkRYKKfmvZB6i8ylVUY/oXWAhezo5SsaFvYPHnTp86O+3/CRha3jy1lgroR970ON
	eIRIPxpxT4Szre5M2EpOGIKzM9XOt0ql0RkcujWlxU+OTJ39fS7PQnqeHmeXcb0GG5HNh++Hq4e5s
	wtz/VV+DUjpi2/GgAMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJmP0-00DT2y-JN; Sat, 28 Aug 2021 00:40:54 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJmKx-00DR5m-8K
 for linux-riscv@lists.infradead.org; Sat, 28 Aug 2021 00:36:47 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 r15-20020a056902154f00b00598b87f197cso96679ybu.13
 for <linux-riscv@lists.infradead.org>; Fri, 27 Aug 2021 17:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=HKJZFfDLXh82oPfU5c20Gn43VIGGnboNJpddzA+BkHg=;
 b=rxzaCm/AN4VZGThWPRoQD+RNM2EHTsKr0Ts1TI5RsbpW5tPvu4XmXZqedCw9N2UdfD
 4BaICFECH3j4loy5TpRObFTxBfrUdbBWvTHBjr6GJLVbonFbfguEMCgYX3LAy00BMX8W
 u4zq+GNNnFkS61eZe7VYyzsuyilBvIa/AmriXFxKDtOyV9SB/RH39B3Z4ZRtQLKCn0LG
 75GCLxiyV2Wjkp5NjbGKf221E276nnqTHN+nKLi3sBSe656AbgGBtm5gJBcoRQ+b28Fh
 EFWEQESVDIOvAnq6i3fM/hFe7419BHD3Hwa7ggBFCXbKuNGTahW2VLC+3ni2ePvL+UNy
 zQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=HKJZFfDLXh82oPfU5c20Gn43VIGGnboNJpddzA+BkHg=;
 b=n1L1X06df4K/f/0uUHZGa4wFybOchzHn4Po76XwSRrJU1byl8tznCQpXIWmw3Cln2J
 ZRh/MzZQJ6YbwNSFeSbCkS+zYb5VRsEbqsFJk2/Cu1W2sCG8xEeTgOUQCbJjLNe5NbJE
 U0uQ+KYOzG3VFmqpct+nR5xD8Z4m0hgopFzh75KUyBecNxuznF190sdoOv5gsRAMSvxV
 EDLX/W4buhEtQkinLc2Bo0cwN4horFVIKsklpTlufthpe+c6Z/4fsUk3znQBxZvPVoci
 g7kxItHvviDJ49QynAhAWn/ogPQuxl2BAvs/UspWuWdxJJSrXbkXxnfj9XtXGU8ftIeq
 CXLQ==
X-Gm-Message-State: AOAM530QeGXFcI7YOUGj/FzKeKeQ5toT+fOxU3vX1SyTizcBGbln2irS
 0TERn3vbcIm+wpIM2k0pFIrIjR4qF+c=
X-Google-Smtp-Source: ABdhPJyKixaYStMukhYbHbK555CGQM6iYXLxxdSAEvoAp4FLIZA18987uVI34E4+zGb67g6x4Ia3ty7kWs8=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:f66c:b851:7e79:7ed4])
 (user=seanjc job=sendgmr) by 2002:a25:9ac6:: with SMTP id
 t6mr8860851ybo.190.1630111001657; 
 Fri, 27 Aug 2021 17:36:41 -0700 (PDT)
Date: Fri, 27 Aug 2021 17:35:52 -0700
In-Reply-To: <20210828003558.713983-1-seanjc@google.com>
Message-Id: <20210828003558.713983-8-seanjc@google.com>
Mime-Version: 1.0
References: <20210828003558.713983-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH v2 07/13] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Guo Ren <guoren@kernel.org>, 
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
 Vincent Chen <deanbo422@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Juergen Gross <jgross@suse.com>
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
X-CRM114-CacheID: sfid-20210827_173643_337165_DC0EB67D 
X-CRM114-Status: GOOD (  21.33  )
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

From: Like Xu <like.xu@linux.intel.com>

Use static_call to optimize perf's guest callbacks on arm64 and x86,
which are now the only architectures that define the callbacks.  Use
DEFINE_STATIC_CALL_RET0 as the default/NULL for all guest callbacks, as
the callback semantics are that a return value '0' means "not in guest".

static_call obviously avoids the overhead of CONFIG_RETPOLINE=y, but is
also advantageous versus other solutions, e.g. per-cpu callbacks, in that
a per-cpu memory load is not needed to detect the !guest case.

Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Like Xu <like.xu@linux.intel.com>
Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
[sean: split out patch, drop __weak, tweak updaters, rewrite changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kernel/perf_callchain.c | 31 +++++++++++++++---------
 arch/x86/events/core.c             | 38 ++++++++++++++++++++++--------
 arch/x86/events/intel/core.c       |  7 +++---
 include/linux/perf_event.h         |  9 +------
 kernel/events/core.c               |  2 ++
 5 files changed, 54 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/kernel/perf_callchain.c b/arch/arm64/kernel/perf_callchain.c
index 274dc3e11b6d..18cf6e608778 100644
--- a/arch/arm64/kernel/perf_callchain.c
+++ b/arch/arm64/kernel/perf_callchain.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2015 ARM Limited
  */
 #include <linux/perf_event.h>
+#include <linux/static_call.h>
 #include <linux/uaccess.h>
 
 #include <asm/pointer_auth.h>
@@ -99,12 +100,24 @@ compat_user_backtrace(struct compat_frame_tail __user *tail,
 }
 #endif /* CONFIG_COMPAT */
 
+DEFINE_STATIC_CALL_RET0(arm64_guest_state, *(perf_guest_cbs->state));
+DEFINE_STATIC_CALL_RET0(arm64_guest_get_ip, *(perf_guest_cbs->get_ip));
+
+void arch_perf_update_guest_cbs(struct perf_guest_info_callbacks *guest_cbs)
+{
+	if (guest_cbs) {
+		static_call_update(arm64_guest_state, guest_cbs->state);
+		static_call_update(arm64_guest_get_ip, guest_cbs->get_ip);
+	} else {
+		static_call_update(arm64_guest_state, (void *)&__static_call_return0);
+		static_call_update(arm64_guest_get_ip, (void *)&__static_call_return0);
+	}
+}
+
 void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 			 struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
-
-	if (guest_cbs && guest_cbs->state()) {
+	if (static_call(arm64_guest_state)()) {
 		/* We don't support guest os callchain now */
 		return;
 	}
@@ -149,10 +162,9 @@ static bool callchain_trace(void *data, unsigned long pc)
 void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 			   struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 	struct stackframe frame;
 
-	if (guest_cbs && guest_cbs->state()) {
+	if (static_call(arm64_guest_state)()) {
 		/* We don't support guest os callchain now */
 		return;
 	}
@@ -163,18 +175,15 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 
 unsigned long perf_instruction_pointer(struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
-
-	if (guest_cbs && guest_cbs->state())
-		return guest_cbs->get_ip();
+	if (static_call(arm64_guest_state)())
+		return static_call(arm64_guest_get_ip)();
 
 	return instruction_pointer(regs);
 }
 
 unsigned long perf_misc_flags(struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
-	unsigned int guest_state = guest_cbs ? guest_cbs->state() : 0;
+	unsigned int guest_state = static_call(arm64_guest_state)();
 	int misc = 0;
 
 	if (guest_state) {
diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 3a7630fdd340..508a677edd8c 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -90,6 +90,29 @@ DEFINE_STATIC_CALL_NULL(x86_pmu_pebs_aliases, *x86_pmu.pebs_aliases);
  */
 DEFINE_STATIC_CALL_RET0(x86_pmu_guest_get_msrs, *x86_pmu.guest_get_msrs);
 
+DEFINE_STATIC_CALL_RET0(x86_guest_state, *(perf_guest_cbs->state));
+DEFINE_STATIC_CALL_RET0(x86_guest_get_ip, *(perf_guest_cbs->get_ip));
+DEFINE_STATIC_CALL_RET0(x86_guest_handle_intel_pt_intr, *(perf_guest_cbs->handle_intel_pt_intr));
+
+void arch_perf_update_guest_cbs(struct perf_guest_info_callbacks *guest_cbs)
+{
+	if (guest_cbs) {
+		static_call_update(x86_guest_state, guest_cbs->state);
+		static_call_update(x86_guest_get_ip, guest_cbs->get_ip);
+	} else {
+		static_call_update(x86_guest_state, (void *)&__static_call_return0);
+		static_call_update(x86_guest_get_ip, (void *)&__static_call_return0);
+	}
+
+	/* Implementing ->handle_intel_pt_intr is optional. */
+	if (guest_cbs && guest_cbs->handle_intel_pt_intr)
+		static_call_update(x86_guest_handle_intel_pt_intr,
+				   guest_cbs->handle_intel_pt_intr);
+	else
+		static_call_update(x86_guest_handle_intel_pt_intr,
+				   (void *)&__static_call_return0);
+}
+
 u64 __read_mostly hw_cache_event_ids
 				[PERF_COUNT_HW_CACHE_MAX]
 				[PERF_COUNT_HW_CACHE_OP_MAX]
@@ -2761,11 +2784,10 @@ static bool perf_hw_regs(struct pt_regs *regs)
 void
 perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 	struct unwind_state state;
 	unsigned long addr;
 
-	if (guest_cbs && guest_cbs->state()) {
+	if (static_call(x86_guest_state)()) {
 		/* TODO: We don't support guest os callchain now */
 		return;
 	}
@@ -2865,11 +2887,10 @@ perf_callchain_user32(struct pt_regs *regs, struct perf_callchain_entry_ctx *ent
 void
 perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 	struct stack_frame frame;
 	const struct stack_frame __user *fp;
 
-	if (guest_cbs && guest_cbs->state()) {
+	if (static_call(x86_guest_state)()) {
 		/* TODO: We don't support guest os callchain now */
 		return;
 	}
@@ -2946,18 +2967,15 @@ static unsigned long code_segment_base(struct pt_regs *regs)
 
 unsigned long perf_instruction_pointer(struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
-
-	if (guest_cbs && guest_cbs->state())
-		return guest_cbs->get_ip();
+	if (static_call(x86_guest_state)())
+		return static_call(x86_guest_get_ip)();
 
 	return regs->ip + code_segment_base(regs);
 }
 
 unsigned long perf_misc_flags(struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
-	unsigned int guest_state = guest_cbs ? guest_cbs->state() : 0;
+	unsigned int guest_state = static_call(x86_guest_state)();
 	int misc = 0;
 
 	if (guest_state) {
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 524ad1f747bd..fb1bd7a0e1a6 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -2782,11 +2782,12 @@ static void intel_pmu_reset(void)
 	local_irq_restore(flags);
 }
 
+DECLARE_STATIC_CALL(x86_guest_handle_intel_pt_intr, *(perf_guest_cbs->handle_intel_pt_intr));
+
 static int handle_pmi_common(struct pt_regs *regs, u64 status)
 {
 	struct perf_sample_data data;
 	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
-	struct perf_guest_info_callbacks *guest_cbs;
 	int bit;
 	int handled = 0;
 	u64 intel_ctrl = hybrid(cpuc->pmu, intel_ctrl);
@@ -2853,9 +2854,7 @@ static int handle_pmi_common(struct pt_regs *regs, u64 status)
 	 */
 	if (__test_and_clear_bit(GLOBAL_STATUS_TRACE_TOPAPMI_BIT, (unsigned long *)&status)) {
 		handled++;
-
-		guest_cbs = perf_get_guest_cbs();
-		if (likely(!guest_cbs || !guest_cbs->handle_intel_pt_intr()))
+		if (!static_call(x86_guest_handle_intel_pt_intr)())
 			intel_pt_interrupt();
 	}
 
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index a5d5893b80b0..3fa1014218f4 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1240,14 +1240,7 @@ extern void perf_event_bpf_event(struct bpf_prog *prog,
 
 #ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
 extern struct perf_guest_info_callbacks *perf_guest_cbs;
-static inline struct perf_guest_info_callbacks *perf_get_guest_cbs(void)
-{
-	/* Reg/unreg perf_guest_cbs waits for readers via synchronize_rcu(). */
-	lockdep_assert_preemption_disabled();
-
-	/* Prevent reloading between a !NULL check and dereferences. */
-	return READ_ONCE(perf_guest_cbs);
-}
+extern void arch_perf_update_guest_cbs(struct perf_guest_info_callbacks *guest_cbs);
 extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *callbacks);
 extern void perf_unregister_guest_info_callbacks(void);
 #endif /* CONFIG_HAVE_GUEST_PERF_EVENTS */
diff --git a/kernel/events/core.c b/kernel/events/core.c
index ec36e7aded89..fb0fd670ab23 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6491,6 +6491,7 @@ void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 		return;
 
 	WRITE_ONCE(perf_guest_cbs, cbs);
+	arch_perf_update_guest_cbs(cbs);
 	synchronize_rcu();
 }
 EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
@@ -6498,6 +6499,7 @@ EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
 void perf_unregister_guest_info_callbacks(void)
 {
 	WRITE_ONCE(perf_guest_cbs, NULL);
+	arch_perf_update_guest_cbs(NULL);
 	synchronize_rcu();
 }
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
-- 
2.33.0.259.gc128427fd7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
