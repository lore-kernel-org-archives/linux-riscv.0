Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F4FC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 19:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RvjxwV/9oudlVWx7H+9pHCnfXIUOjsxGn/QvhC2vOCM=; b=IM9UkjQyWyVaSW
	sDjyTKpPmEc7OtTj7r4si2qT1ledOsO9j/5llMMXBntFnhRWikl+XP3HzK94Fbt/2+jgNfXanJ0dJ
	K3OBZOm21wcY7dQ9Fbkf7bgR4v+gRStRz8IkHuuDwMmpsI5BEnXojMJV+yJNclarCLpaRvHHBWloW
	XtZ1wEQ9//Yz4WM9DXBHXTrPn34rbvn9cy7dFj/mgb00cKKKzwbGpnP7Pdq/FCnqQ0IvWntHAunIf
	Yw4RV6/8Ok9/VtnwmNS/T6luuxa8j3gZjdq/w1f26kgLD7C0hN5ajIOqNTh5Q4gNrDXS84BNlb0pi
	fcJBGvGeE7bILbNuqV/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tDf-00000007j0k-02BJ;
	Tue, 30 Apr 2024 19:32:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tDM-00000007imj-44yp
	for linux-riscv@bombadil.infradead.org;
	Tue, 30 Apr 2024 19:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PdYsGD+f0Q3EGFqlo7iVC6xHcnKlviVz/6wVcPE0mCU=; b=CJYASNizZ+RxvFp7t6LXaD4cEJ
	MxV9sqTZb483rPlp54Fyaja9M+p3NSBeJprR7eMgdzik5+4aLI0yDUfYMcynMNMKcwISqf3gZVc/f
	uUaYsqhJuVIwzIUWgfsdo+dgQ+Y5RZgomTsIHNvRrGpDoqz47ny47y8kOImh5DQ9bH7+aF9TEwHNO
	7Q7UxRlTjLHWqafiYIFop1vlLT6/H3PThfwQwHRMx3vXujz1yLR75W1l6wRjW6i1jOTR46OgQUKyS
	qZVgbZ65mvYNX71JAvkc79yILZwPoiKM7QAixd08ConTDb24/jyfuG0atTXGaYIaSb00LeuMmX6l0
	yKolwQ9A==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tCz-0000000H4id-3B6U
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 19:32:31 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5dbddee3694so109274a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2024 12:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714505527; x=1715110327; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=PdYsGD+f0Q3EGFqlo7iVC6xHcnKlviVz/6wVcPE0mCU=;
        b=2UI0MV4yPoy5tFjNXoVPBheu0WEWW+mjGA5c1MbMo1gt6osRaTd6YDzPWAFClrpqDR
         25VH2zqsIZs/KxulfO5m6HvsLaIsxginoTq0KQ3EtzFLlWDCJ3MzChGNNsSTBwKa3buN
         ToyB0GMkwXN5tBHzm/X94dR5+uZRtyjtxkwTIAUPlffPs7P0D5j5miymZDY/PFQ7KvFg
         i6Th/STFoMh9j9cLfRGvQ9FtaCQlGQYojRv4PJm3Xymmo4Iq2x7PB9elLFO1GofigosV
         ssuPojhS61Qm8pcySjuXwRLK8C7JOFf+4ifpFepumr/Rhg/gQTd4OlbF/YLRpOFUfADf
         Y08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714505527; x=1715110327;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PdYsGD+f0Q3EGFqlo7iVC6xHcnKlviVz/6wVcPE0mCU=;
        b=QE259dSCtrZkz9bLgx6XdoBjaBzTI1E/IAmcBPWRVydbHRG7i/W7f+m/8WarZ9v1RL
         LRFJfQZ7X1vFaZoTWVvG0DvRXjYTxbFVVsTPnGq4v0voRx7AzE9+em12qtphBA3Z75hw
         lviW3oJLmHgpqh14577Jo2wn/ns9SNO4Fwx/pa1y2e6DV2V4i6qC05+svBu5EvsE8/3c
         LxbzCe/+8me3tWHFa3s2WpIb01mU56KEZtY2ADQ7yhFPeWvO5e2m4OhpPIwbruFeS7zn
         vqQ4b/fAO6bRbV4U5OFhjEzUlldsiyq6WbMS7KxlumBvJz3qowSQ+6r48o0ULHjbyY01
         VhHA==
X-Forwarded-Encrypted: i=1; AJvYcCUvoPNoxs4tQzW0TwINFIIONWUz9gdM555ylfDfAVlidR/H3U/96DjgmXUnKwJ+OFr0i0CpBPOSjazM4YqjYKC8LZ48o5HQB90npsxdLAuK
X-Gm-Message-State: AOJu0YzPn2aTRU6btZkEsV3eWo57VpiGS1bdSacyZqybXp7/7IfypuhM
	KqDWf0zzIYWX5c9Gxhohy+4cdvNS7E6yHUBWlHTTxYaR9m2sDS7LMQnYzjD77GaYzlNULHjWz03
	ORQ==
X-Google-Smtp-Source: AGHT+IFxEJGJNoBZFDDOGsKBZH3KCgZUJ/MpHfYduLX06CrOeWsHzYm0K/UuUin+BCjJtD8xU9kINTkYCM8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:5a8:b0:5f0:7fc6:83a7 with SMTP id
 by40-20020a056a0205a800b005f07fc683a7mr13378pgb.0.1714505525717; Tue, 30 Apr
 2024 12:32:05 -0700 (PDT)
Date: Tue, 30 Apr 2024 12:31:56 -0700
In-Reply-To: <20240430193157.419425-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240430193157.419425-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
Message-ID: <20240430193157.419425-4-seanjc@google.com>
Subject: [PATCH 3/4] KVM: x86: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_203209_993273_5C669926 
X-CRM114-Status: GOOD (  15.74  )
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

Fold the guts of kvm_arch_sched_in() into kvm_arch_vcpu_load(), keying
off the recently added @sched_in as appropriate.

Note, there is a very slight functional change, as PLE shrink updates will
now happen after blasting WBINVD, but that is quite uninteresting.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm-x86-ops.h |  1 -
 arch/x86/include/asm/kvm_host.h    |  4 +---
 arch/x86/kvm/svm/svm.c             | 13 ++++---------
 arch/x86/kvm/vmx/main.c            |  2 --
 arch/x86/kvm/vmx/vmx.c             | 11 ++++-------
 arch/x86/kvm/vmx/x86_ops.h         |  3 +--
 arch/x86/kvm/x86.c                 | 19 +++++++++++--------
 7 files changed, 21 insertions(+), 32 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index 5187fcf4b610..910d06cdb86b 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -103,7 +103,6 @@ KVM_X86_OP(write_tsc_multiplier)
 KVM_X86_OP(get_exit_info)
 KVM_X86_OP(check_intercept)
 KVM_X86_OP(handle_exit_irqoff)
-KVM_X86_OP(sched_in)
 KVM_X86_OP_OPTIONAL(update_cpu_dirty_logging)
 KVM_X86_OP_OPTIONAL(vcpu_blocking)
 KVM_X86_OP_OPTIONAL(vcpu_unblocking)
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 01c69840647e..9fd1ec82303d 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1624,7 +1624,7 @@ struct kvm_x86_ops {
 	void (*vcpu_reset)(struct kvm_vcpu *vcpu, bool init_event);
 
 	void (*prepare_switch_to_guest)(struct kvm_vcpu *vcpu);
-	void (*vcpu_load)(struct kvm_vcpu *vcpu, int cpu);
+	void (*vcpu_load)(struct kvm_vcpu *vcpu, int cpu, bool sched_in);
 	void (*vcpu_put)(struct kvm_vcpu *vcpu);
 
 	void (*update_exception_bitmap)(struct kvm_vcpu *vcpu);
@@ -1746,8 +1746,6 @@ struct kvm_x86_ops {
 			       struct x86_exception *exception);
 	void (*handle_exit_irqoff)(struct kvm_vcpu *vcpu);
 
-	void (*sched_in)(struct kvm_vcpu *vcpu, int cpu);
-
 	/*
 	 * Size of the CPU's dirty log buffer, i.e. VMX's PML buffer.  A zero
 	 * value indicates CPU dirty logging is unsupported or disabled.
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 0f3b59da0d4a..6d9763dc4fed 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1539,11 +1539,14 @@ static void svm_prepare_host_switch(struct kvm_vcpu *vcpu)
 	to_svm(vcpu)->guest_state_loaded = false;
 }
 
-static void svm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+static void svm_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
 	struct svm_cpu_data *sd = per_cpu_ptr(&svm_data, cpu);
 
+	if (sched_in && !kvm_pause_in_guest(vcpu->kvm))
+		shrink_ple_window(vcpu);
+
 	if (sd->current_vmcb != svm->vmcb) {
 		sd->current_vmcb = svm->vmcb;
 
@@ -4548,12 +4551,6 @@ static void svm_handle_exit_irqoff(struct kvm_vcpu *vcpu)
 		vcpu->arch.at_instruction_boundary = true;
 }
 
-static void svm_sched_in(struct kvm_vcpu *vcpu, int cpu)
-{
-	if (!kvm_pause_in_guest(vcpu->kvm))
-		shrink_ple_window(vcpu);
-}
-
 static void svm_setup_mce(struct kvm_vcpu *vcpu)
 {
 	/* [63:9] are reserved. */
@@ -5013,8 +5010,6 @@ static struct kvm_x86_ops svm_x86_ops __initdata = {
 	.check_intercept = svm_check_intercept,
 	.handle_exit_irqoff = svm_handle_exit_irqoff,
 
-	.sched_in = svm_sched_in,
-
 	.nested_ops = &svm_nested_ops,
 
 	.deliver_interrupt = svm_deliver_interrupt,
diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index 7c546ad3e4c9..4fee9a8cc5a1 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -121,8 +121,6 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
 	.check_intercept = vmx_check_intercept,
 	.handle_exit_irqoff = vmx_handle_exit_irqoff,
 
-	.sched_in = vmx_sched_in,
-
 	.cpu_dirty_log_size = PML_ENTITY_NUM,
 	.update_cpu_dirty_logging = vmx_update_cpu_dirty_logging,
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index cb36db7b6140..ccea594187c7 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1505,10 +1505,13 @@ void vmx_vcpu_load_vmcs(struct kvm_vcpu *vcpu, int cpu,
  * Switches to specified vcpu, until a matching vcpu_put(), but assumes
  * vcpu mutex is already taken.
  */
-void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 
+	if (sched_in && !kvm_pause_in_guest(vcpu->kvm))
+		shrink_ple_window(vcpu);
+
 	vmx_vcpu_load_vmcs(vcpu, cpu, NULL);
 
 	vmx_vcpu_pi_load(vcpu, cpu);
@@ -8093,12 +8096,6 @@ void vmx_cancel_hv_timer(struct kvm_vcpu *vcpu)
 }
 #endif
 
-void vmx_sched_in(struct kvm_vcpu *vcpu, int cpu)
-{
-	if (!kvm_pause_in_guest(vcpu->kvm))
-		shrink_ple_window(vcpu);
-}
-
 void vmx_update_cpu_dirty_logging(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
diff --git a/arch/x86/kvm/vmx/x86_ops.h b/arch/x86/kvm/vmx/x86_ops.h
index 502704596c83..b7104a5f623e 100644
--- a/arch/x86/kvm/vmx/x86_ops.h
+++ b/arch/x86/kvm/vmx/x86_ops.h
@@ -23,7 +23,7 @@ int vmx_vcpu_pre_run(struct kvm_vcpu *vcpu);
 fastpath_t vmx_vcpu_run(struct kvm_vcpu *vcpu, bool force_immediate_exit);
 void vmx_vcpu_free(struct kvm_vcpu *vcpu);
 void vmx_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event);
-void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu);
+void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in);
 void vmx_vcpu_put(struct kvm_vcpu *vcpu);
 int vmx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t exit_fastpath);
 void vmx_handle_exit_irqoff(struct kvm_vcpu *vcpu);
@@ -112,7 +112,6 @@ u64 vmx_get_l2_tsc_multiplier(struct kvm_vcpu *vcpu);
 void vmx_write_tsc_offset(struct kvm_vcpu *vcpu);
 void vmx_write_tsc_multiplier(struct kvm_vcpu *vcpu);
 void vmx_request_immediate_exit(struct kvm_vcpu *vcpu);
-void vmx_sched_in(struct kvm_vcpu *vcpu, int cpu);
 void vmx_update_cpu_dirty_logging(struct kvm_vcpu *vcpu);
 #ifdef CONFIG_X86_64
 int vmx_set_hv_timer(struct kvm_vcpu *vcpu, u64 guest_deadline_tsc,
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 925cadb18b55..9b0a21f2e56e 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -5005,6 +5005,16 @@ static bool need_emulate_wbinvd(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 {
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+
+	if (sched_in) {
+		vcpu->arch.l1tf_flush_l1d = true;
+		if (pmu->version && unlikely(pmu->event_count)) {
+			pmu->need_cleanup = true;
+			kvm_make_request(KVM_REQ_PMU, vcpu);
+		}
+	}
+
 	/* Address WBINVD may be executed by guest */
 	if (need_emulate_wbinvd(vcpu)) {
 		if (static_call(kvm_x86_has_wbinvd_exit)())
@@ -5014,7 +5024,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 					wbinvd_ipi, NULL, 1);
 	}
 
-	static_call(kvm_x86_vcpu_load)(vcpu, cpu);
+	static_call(kvm_x86_vcpu_load)(vcpu, cpu, sched_in);
 
 	/* Save host pkru register if supported */
 	vcpu->arch.host_pkru = read_pkru();
@@ -12569,14 +12579,7 @@ bool kvm_vcpu_is_bsp(struct kvm_vcpu *vcpu)
 
 void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu)
 {
-	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
 
-	vcpu->arch.l1tf_flush_l1d = true;
-	if (pmu->version && unlikely(pmu->event_count)) {
-		pmu->need_cleanup = true;
-		kvm_make_request(KVM_REQ_PMU, vcpu);
-	}
-	static_call(kvm_x86_sched_in)(vcpu, cpu);
 }
 
 void kvm_arch_free_vm(struct kvm *kvm)
-- 
2.45.0.rc0.197.gbae5840b3b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
