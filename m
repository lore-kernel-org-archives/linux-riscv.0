Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C899BC432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:01:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 996DC60F11
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 996DC60F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fctez93hCweMnVXyNgpIuTPNvch9uedhCdgO6Xx3PkE=; b=SDPET0lB1DPtEg
	NkjVtQMqIhL50LwuCdKqFXp41MeTtS+epC1XAzfBmtmUjeJiGXRZtJTWgew/vkheOOV1tW0vHgCyf
	Yugx/zmOKVK3HRkAnIbj2jss9CfssNE91odpVFMAPhmU4zskakaoVzTuU5uSAWIlk6sd4Fcz7ocDB
	etY8W3qTKHoEiptJemhToSY7hIjhDOw86mmQ2fUMhaonOEA9z2T0VG6R3VW8anCATLOmDn4yE6mSb
	ik8hOnjRP7gsnv8ujCpAZzYUjZMWO/xYJvY9dXpZ61FMspaPXmrFQ8POVjFONhgcrmjAXE99qMwzo
	Djwvw6FosY4Ba+zVlTog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJQFg-00BCvu-1M; Fri, 27 Aug 2021 01:01:48 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJQBk-00BAuu-Nf
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 00:57:50 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 v126-20020a254884000000b005991fd2f912so4925874yba.20
 for <linux-riscv@lists.infradead.org>; Thu, 26 Aug 2021 17:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=BKACFpkyclmSNZOzZCvoQ85Q5j0ibf+pUktwZSnA2VE=;
 b=uDGNAKy3X8wgG4FPiD0TolBumhb9mvdkmZ5pXk9jMiSPuEv6IzBrAY2yREw0PMXzi4
 9KSpq/MIGbNRkWH+90XdYBr08BMNemkexcswrPOoxwAVc9eNlnrdscRQYZv1qWj5RVJQ
 Uu5cGBTR2dLrVmB+fbyQ0f2saIhD4/u6CJuZoKrKwJgASrh55N/fvDtm72qpzzHlRHHS
 5MsttnXx7/8NWuUSXTy9DIxqvoIYMeSt7SrSLZoZYq6Cz9pNjweGfVRu94/2EucLJNq+
 age0a4QpYT7qPSqnVfS8AXaoz7sVZQi9saQiXGh1vd9lEsvZMwvUn3vvO8JTj1WmcE1u
 xE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=BKACFpkyclmSNZOzZCvoQ85Q5j0ibf+pUktwZSnA2VE=;
 b=FafIHBzDDNOtjfG+IIk0PjARhavf2/XA74ymuXG98PrMzyeyRsQmJyJGTrjTq54xrx
 zTj4pkVkaUqJb6Zln67mB4VxJo78wgFlSSpGBki4fLS/iLJngdRx6iYmCCZYt1V1yhxI
 efJcAreYrbflOg4urnAQFTJb3hDymw2iFDR/BgKhPYdyLAD+nLyv1s7tGrz9ji2B9OXe
 /r0B/OYYX9M7xkEzRToCl5xBF8IH2NByRFzzGVh/xV2DO8HPcKdVRGlfcpKlrKZcC96C
 TXv5RTRLU9QzUDjjclvQvq94YKie4WrVOoPZT16ExNKig1kY1K33lSCsKRJer2n9dEJI
 VYyw==
X-Gm-Message-State: AOAM533JiMY9aMx8nYry5vlf/y9Rn+VR5JoTBswqO9usBvYiZRKi263U
 O2wDFgG13ifgUbNprqqG+y16sDlTOLI=
X-Google-Smtp-Source: ABdhPJw0TCNYmfMyjk3pp1TIQWtZYYXC1+CmXfKBRCTWftHhXnIexf6rTbOO9IR4Dc7O+dyoa9Bys+IIj5k=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a25:4f8a:: with SMTP id
 d132mr1902818ybb.486.1630025863019; 
 Thu, 26 Aug 2021 17:57:43 -0700 (PDT)
Date: Thu, 26 Aug 2021 17:57:09 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-7-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 06/15] KVM: x86: Register perf callbacks only when actively
 handling interrupt
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
X-CRM114-CacheID: sfid-20210826_175744_810501_D85DD67F 
X-CRM114-Status: GOOD (  17.01  )
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

Register KVM's perf callback only when handling an interrupt that may be
a PMI (sadly this includes IRQs), and unregister the callback immediately
after handling the interrupt (or closing the window).  Registering the
callback on a per-CPU basis (with preemption disabled!), fixes a mostly
theoretical bug where perf could dereference a NULL pointer due to KVM
unloading and unregistering the callbacks in between perf queries of the
callback functions.  The precise registration will also allow for future
cleanups and optimizations, e.g. the existence of the callbacks can serve
as the "in guest" check.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c         | 27 +++++++++++++++++----------
 arch/x86/kvm/x86.h         | 10 ++++++++++
 include/linux/perf_event.h |  2 ++
 kernel/events/core.c       | 12 ++++++++++++
 4 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index bae951344e28..bc4ee6ea7752 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8274,28 +8274,31 @@ int kvm_is_in_guest(void)
 
 static int kvm_is_user_mode(void)
 {
-	int user_mode = 3;
+	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
 
-	if (__this_cpu_read(current_vcpu))
-		user_mode = static_call(kvm_x86_get_cpl)(__this_cpu_read(current_vcpu));
+	if (WARN_ON_ONCE(!vcpu))
+		return 0;
 
-	return user_mode != 0;
+	return static_call(kvm_x86_get_cpl)(vcpu) != 0;
 }
 
 static unsigned long kvm_get_guest_ip(void)
 {
-	unsigned long ip = 0;
+	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
 
-	if (__this_cpu_read(current_vcpu))
-		ip = kvm_rip_read(__this_cpu_read(current_vcpu));
+	if (WARN_ON_ONCE(!vcpu))
+		return 0;
 
-	return ip;
+	return kvm_rip_read(vcpu);
 }
 
 static void kvm_handle_intel_pt_intr(void)
 {
 	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
 
+	if (WARN_ON_ONCE(!vcpu))
+		return;
+
 	kvm_make_request(KVM_REQ_PMI, vcpu);
 	__set_bit(MSR_CORE_PERF_GLOBAL_OVF_CTRL_TRACE_TOPA_PMI_BIT,
 			(unsigned long *)&vcpu->arch.pmu.global_status);
@@ -8308,6 +8311,12 @@ static struct perf_guest_info_callbacks kvm_guest_cbs = {
 	.handle_intel_pt_intr	= NULL,
 };
 
+void kvm_register_perf_callbacks(void)
+{
+	__perf_register_guest_info_callbacks(&kvm_guest_cbs);
+}
+EXPORT_SYMBOL_GPL(kvm_register_perf_callbacks);
+
 #ifdef CONFIG_X86_64
 static void pvclock_gtod_update_fn(struct work_struct *work)
 {
@@ -11063,7 +11072,6 @@ int kvm_arch_hardware_setup(void *opaque)
 
 	if (ops->intel_pt_intr_in_guest && ops->intel_pt_intr_in_guest())
 		kvm_guest_cbs.handle_intel_pt_intr = kvm_handle_intel_pt_intr;
-	perf_register_guest_info_callbacks(&kvm_guest_cbs);
 
 	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
 		supported_xss = 0;
@@ -11092,7 +11100,6 @@ int kvm_arch_hardware_setup(void *opaque)
 
 void kvm_arch_hardware_unsetup(void)
 {
-	perf_unregister_guest_info_callbacks();
 	kvm_guest_cbs.handle_intel_pt_intr = NULL;
 
 	static_call(kvm_x86_hardware_unsetup)();
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 7d66d63dc55a..5cedc0e8a5d5 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -387,15 +387,25 @@ static inline bool kvm_cstate_in_guest(struct kvm *kvm)
 	return kvm->arch.cstate_in_guest;
 }
 
+void kvm_register_perf_callbacks(void);
+static inline void kvm_unregister_perf_callbacks(void)
+{
+	__perf_unregister_guest_info_callbacks();
+}
+
 DECLARE_PER_CPU(struct kvm_vcpu *, current_vcpu);
 
 static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu)
 {
 	__this_cpu_write(current_vcpu, vcpu);
+
+	kvm_register_perf_callbacks();
 }
 
 static inline void kvm_after_interrupt(struct kvm_vcpu *vcpu)
 {
+	kvm_unregister_perf_callbacks();
+
 	__this_cpu_write(current_vcpu, NULL);
 }
 
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index c98253dae037..7a367bf1b78d 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1238,6 +1238,8 @@ extern void perf_event_bpf_event(struct bpf_prog *prog,
 
 #ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
 DECLARE_PER_CPU(struct perf_guest_info_callbacks *, perf_guest_cbs);
+extern void __perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
+extern void __perf_unregister_guest_info_callbacks(void);
 extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *callbacks);
 extern void perf_unregister_guest_info_callbacks(void);
 #endif /* CONFIG_HAVE_GUEST_PERF_EVENTS */
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 9bc1375d6ed9..2f28d9d8dc94 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6485,6 +6485,18 @@ static void perf_pending_event(struct irq_work *entry)
 #ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
 DEFINE_PER_CPU(struct perf_guest_info_callbacks *, perf_guest_cbs);
 
+void __perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
+{
+	__this_cpu_write(perf_guest_cbs, cbs);
+}
+EXPORT_SYMBOL_GPL(__perf_register_guest_info_callbacks);
+
+void __perf_unregister_guest_info_callbacks(void)
+{
+	__this_cpu_write(perf_guest_cbs, NULL);
+}
+EXPORT_SYMBOL_GPL(__perf_unregister_guest_info_callbacks);
+
 void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 {
 	int cpu;
-- 
2.33.0.259.gc128427fd7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
