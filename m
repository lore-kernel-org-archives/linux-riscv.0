Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BB9C432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:11:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C65460ED3
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C65460ED3
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g6+qf0XeMEszUxE/n0whxsLGXxJxFqTgmrmKf8UnjQo=; b=aqt1Ev/q1pUsjj
	9uzbXsnd0OOJTSFKGaqaDlb8ocg5dtgTDv7PC8TfqemzNfYbjCBy2NOl9OI9P6erpEGzSo3Js+YpN
	F63B5txLqy7TYXA8/n/itV3qnWOkaNV3Vkdd8zYX7pExnNjPMKgGLmcBHd3s2w8SwllucnG+VoFVv
	D7FgCep8MDFW7mGELSYP6ifY5nouLHlMLE7mLXCwkDMCwxGNy4B4Be0lNRD/FSQmVfp6j9S+ZJxn8
	KlXrW6DvVOE/h6VdEL3uL22BXGTPUysklZFuBMrnd5mCVJl0HYiHS8JEgJPOsxVE9DUvjBGhJyNIv
	C5Rr2fDdWQ4x1fh4atpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJQOj-00BGnr-E5; Fri, 27 Aug 2021 01:11:09 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJQC4-00BB9i-PR
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 00:58:06 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 a62-20020a254d410000b0290592f360b0ccso4854501ybb.14
 for <linux-riscv@lists.infradead.org>; Thu, 26 Aug 2021 17:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=5wQJhGi+ZyGOAOMPxE71g3TXDJHEcKM3NH5k2IjIokU=;
 b=OW6tj0qrfqLnmyAG7bwsLD1ivWUlSQB5/rmjy7WLw347oAMVCG3/Qk7isJlZCVSFFV
 W7vIlgUdwAlJx2kpTZ9A55Gu92o/DT6okHoyWj++aIqZDyTZVtHibehQi7O2j3MjMThX
 Eos5GY/kAJpzkfPs9z5NTcHHEpUm/XVAQpx4rHw8kLZUkO7HNuZJLNnlhhsXFJlEJkCy
 p6hhGZMhQP2aZtmOVXw5yZNFRx/aQuH9Vj4YrQddHKnPUiY2qaww7D6c/XyLTUmGdHj3
 smqjImdUUuenQzBvxAy/5tpxtN+1AQqndlIihp99we7A59b3jtdrbJnHyTatubIFGc7+
 +UOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=5wQJhGi+ZyGOAOMPxE71g3TXDJHEcKM3NH5k2IjIokU=;
 b=n601MhfcOrynYAeT68t9/isQdKzN4C45tBSaHOm3S5l8bZVkLi577dlyDuNmnJwRv/
 /kvgTRrDOCpHcq6He9Q28PD4nCtAgdhUKrnuNagFBZQ0Phhr6xzPXJJI0BUMXT/qbKZ8
 5Lwh2A1eZ/yy4oN6+t39DzZqSNso8dLZ1yvTSSddymvtN1SNzAA/wJ9Sj689zoGKOavA
 OTjZn+Az6d9VuVDgmkmKrKLxjQJjw6bCAiaYnLIWmdkesZ8jhmSfbqA7PWkArLQXZCin
 JaWO72xlkrm4Qj8lOE9+yxcfF+aXpXigjx6D0/CxucsOAUFvGpOoYa874omDf7ohjMZC
 UwzQ==
X-Gm-Message-State: AOAM530XN3ADtGf0usN2PBuxmpJBDAATa8c2Dw+vjeWNzNgX8/QXw4q7
 qGzY/Z5pFme636G2OlRaQl6boC7qmKo=
X-Google-Smtp-Source: ABdhPJxNS9FKdHggEYyf3FZBaeUKCfIfMsPYcyI+FugrK+/XdFcM7Qj6lsB8B0S5DygYRKG5HNpbYwSWz/0=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a25:ea51:: with SMTP id
 o17mr1969948ybe.253.1630025883284; 
 Thu, 26 Aug 2021 17:58:03 -0700 (PDT)
Date: Thu, 26 Aug 2021 17:57:18 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-16-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 15/15] perf: KVM: Indicate "in guest" via NULL ->is_in_guest
 callback
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
X-CRM114-CacheID: sfid-20210826_175804_893780_B4627AE5 
X-CRM114-Status: GOOD (  19.75  )
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

Interpret a null ->is_in_guest callback as meaning "in guest" and use
the new semantics in KVM, which currently returns 'true' unconditionally
in its implementation of ->is_in_guest().  This avoids a retpoline on
the indirect call for PMIs that arrive in a KVM guest, and also provides
a handy excuse for a wrapper around retrieval of perf_get_guest_cbs,
e.g. to reduce the probability of an errant direct read of perf_guest_cbs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/core.c       | 16 ++++++++--------
 arch/x86/events/intel/core.c |  5 ++---
 include/linux/perf_event.h   | 17 +++++++++++++++++
 virt/kvm/kvm_main.c          |  9 ++-------
 4 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 34155a52e498..b60c339ae06b 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -2761,11 +2761,11 @@ static bool perf_hw_regs(struct pt_regs *regs)
 void
 perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = this_cpu_read(perf_guest_cbs);
+	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 	struct unwind_state state;
 	unsigned long addr;
 
-	if (guest_cbs && guest_cbs->is_in_guest()) {
+	if (guest_cbs) {
 		/* TODO: We don't support guest os callchain now */
 		return;
 	}
@@ -2865,11 +2865,11 @@ perf_callchain_user32(struct pt_regs *regs, struct perf_callchain_entry_ctx *ent
 void
 perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = this_cpu_read(perf_guest_cbs);
+	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 	struct stack_frame frame;
 	const struct stack_frame __user *fp;
 
-	if (guest_cbs && guest_cbs->is_in_guest()) {
+	if (guest_cbs) {
 		/* TODO: We don't support guest os callchain now */
 		return;
 	}
@@ -2946,9 +2946,9 @@ static unsigned long code_segment_base(struct pt_regs *regs)
 
 unsigned long perf_instruction_pointer(struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = this_cpu_read(perf_guest_cbs);
+	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 
-	if (guest_cbs && guest_cbs->is_in_guest())
+	if (guest_cbs)
 		return guest_cbs->get_guest_ip();
 
 	return regs->ip + code_segment_base(regs);
@@ -2956,10 +2956,10 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
 
 unsigned long perf_misc_flags(struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = this_cpu_read(perf_guest_cbs);
+	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 	int misc = 0;
 
-	if (guest_cbs && guest_cbs->is_in_guest()) {
+	if (guest_cbs) {
 		if (guest_cbs->is_user_mode())
 			misc |= PERF_RECORD_MISC_GUEST_USER;
 		else
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 96001962c24d..9a8c18b51a96 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -2853,9 +2853,8 @@ static int handle_pmi_common(struct pt_regs *regs, u64 status)
 	 */
 	if (__test_and_clear_bit(GLOBAL_STATUS_TRACE_TOPAPMI_BIT, (unsigned long *)&status)) {
 		handled++;
-		guest_cbs = this_cpu_read(perf_guest_cbs);
-		if (unlikely(guest_cbs && guest_cbs->is_in_guest() &&
-			     guest_cbs->handle_intel_pt_intr))
+		guest_cbs = perf_get_guest_cbs();
+		if (unlikely(guest_cbs && guest_cbs->handle_intel_pt_intr))
 			guest_cbs->handle_intel_pt_intr();
 		else
 			intel_pt_interrupt();
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index db701409a62f..6e3a10784d24 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1241,6 +1241,23 @@ DECLARE_PER_CPU(struct perf_guest_info_callbacks *, perf_guest_cbs);
 extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
 extern void perf_unregister_guest_info_callbacks(void);
 extern void perf_register_guest_info_callbacks_all_cpus(struct perf_guest_info_callbacks *cbs);
+/*
+ * Returns guest callbacks for the current CPU if callbacks are registered and
+ * the PMI fired while a guest was running, otherwise returns NULL.
+ */
+static inline struct perf_guest_info_callbacks *perf_get_guest_cbs(void)
+{
+	struct perf_guest_info_callbacks *guest_cbs = this_cpu_read(perf_guest_cbs);
+
+	/*
+	 * Implementing is_in_guest is optional if the callbacks are registered
+	 * only when "in guest".
+	 */
+	if (guest_cbs && (!guest_cbs->is_in_guest || guest_cbs->is_in_guest()))
+		return guest_cbs;
+
+	return NULL;
+}
 #endif /* CONFIG_HAVE_GUEST_PERF_EVENTS */
 
 extern void perf_event_exec(void);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 1bcc3eab510b..fa83d3846785 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5461,12 +5461,6 @@ struct kvm_vcpu * __percpu *kvm_get_running_vcpus(void)
 }
 
 #ifdef __KVM_WANT_PERF_CALLBACKS
-static int kvm_is_in_guest(void)
-{
-	/* Registration of KVM's callback signifies "in guest". */
-	return true;
-}
-
 static int kvm_is_user_mode(void)
 {
 	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
@@ -5488,7 +5482,8 @@ static unsigned long kvm_get_guest_ip(void)
 }
 
 static struct perf_guest_info_callbacks kvm_guest_cbs = {
-	.is_in_guest		= kvm_is_in_guest,
+	/* Registration of KVM's callback signifies "in guest". */
+	.is_in_guest		= NULL,
 	.is_user_mode		= kvm_is_user_mode,
 	.get_guest_ip		= kvm_get_guest_ip,
 	.handle_intel_pt_intr	= NULL,
-- 
2.33.0.259.gc128427fd7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
