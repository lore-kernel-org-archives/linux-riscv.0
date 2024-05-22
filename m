Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1ABC25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRRDJTKGf90Tk1/+CtyVRDdT9boWmKznS2Hn6FKeobc=; b=i6Ea9KB3REXU6P
	Cz4QjZPq9+kzf0Z8Rcr6Vkr4f71qLAPibqazr6dr4CiL//k1LUCctRaHLlZ5+le9tm9xOhK3UC4g/
	v3Vbpv6tKqu828bHz6APRW251DDNLpHL+mPBs+1KeS0WX2GKKZb5NaSf0bP8kzLfDniijkEihu//+
	vaEdJB5t+SNTFfIO+BiqJPfNpP5yntp0ZIgwplxJOn3aZEe3ycrmgTeKa5MDSALs0EVGmj406ntEO
	cwASMrxA2M04qIc1WA3N8fqlk1PKdny5jC81k24dGEng5kbtIE+Yy/ysVlpdTc5WVrT35W5idfqb8
	mQajVBB2J8+QmGGNPqEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ayD-00000001eq0-0Vqk;
	Wed, 22 May 2024 01:40:45 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9axr-00000001eYG-0D8A
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:40:25 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61be4601434so266111777b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716342022; x=1716946822; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Ky0OyQodlYj1lBm/FQov7vVQOSf0t15DeKBOaNpreRc=;
        b=1+Ur9oZoxbezZ2v9kPDH/X757xMGGdghj2hlShPl+HpMiJNcujAT4PcDHlFN8qsyCs
         cw7g9iv+3GwsJ5zY+kgFrd+5+cK8seglbHefSg+e4LFsK8IKEg4OiyKrSgqazqnNZpCb
         zP6O9mVLOv5P0qSG0wFCtkzYL7zvgarFzuV3xIpAk1v37SWYInDvi12O8c6Rol4ZIOlS
         7g3x7zBhnVsRUtxPxgVRBBNcPEq1eZI04O8zfbcLTiHE/wl9zy/tVE67ZVt1N661sRM1
         ERR0nQGKIcMoY9KoTMfIlJDIF+KNPPbB+4/JGH4NtMBz2usEg3wZjZAb69oD7rljb/+n
         Sv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716342022; x=1716946822;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ky0OyQodlYj1lBm/FQov7vVQOSf0t15DeKBOaNpreRc=;
        b=rODHRUeht5z7bvA2HJktrprXGEXB1sOIeYjyxojsfgKji9Q6SQJ2CBLMKP96zET9LB
         g32vHWcJKg1lk2RpmGF9gartXCUG/Iw8arqjetkNRv0O/PQ5Jmryzh/JTsrXX1ivzDaA
         G5nnT79bEn6XH2ZMnY2PJLDyr0Jtj++FykIWdaVrulBkHxREAGVSaMxPmw3TFmYWLhei
         kgOFuk6ARKqS5/XKQmCRTL7TVISlzYyePRFWCKiLVWCRI5TYLNPb5NIYG6rlfKtY1es0
         5btG0gflkz//Lqp75LHzwKa4eu75bnoUygJlI7RfSf9PeG2HQiSZhumju94XT5x/wory
         HHmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3GIKpzvAAqGFslDF0FVTGtrz8Tcr4mjc91Rxa5ceieKJbyp49E7ik7BlJ3WzJTspjk7R7kSNPLduReky6dJh5nDc9+RZRdRcUhHxfzGTo
X-Gm-Message-State: AOJu0Yz5zinh6B/4DHY7CsliXarwWuW1LyJD4hAXar7xJ0FYcUVScPnH
	W+pXMWKCDb1/f0NCGr4v9LahmGCUYUUobxFrDqgWnMhWsmV1wnDevVqi53hnKtcSKct76siHKQF
	oGw==
X-Google-Smtp-Source: AGHT+IH3ylTQdVbQjZOc6EesCmA9Xrxy9wlcjQn2SMB7bi30ktsJ//ZvCxppwijf1/jMZuHd3SCyhhC4bqo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:251:b0:61b:1dbf:e3f with SMTP id
 00721157ae682-627e46d457amr2201297b3.4.1716342021752; Tue, 21 May 2024
 18:40:21 -0700 (PDT)
Date: Tue, 21 May 2024 18:40:10 -0700
In-Reply-To: <20240522014013.1672962-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240522014013.1672962-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.0.215.g3402c0e53f-goog
Message-ID: <20240522014013.1672962-4-seanjc@google.com>
Subject: [PATCH v2 3/6] KVM: x86: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
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
X-CRM114-CacheID: sfid-20240521_184023_217229_CB4EDB30 
X-CRM114-Status: GOOD (  14.36  )
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
off the recently added kvm_vcpu.scheduled_out as appropriate.

Note, there is a very slight functional change, as PLE shrink updates will
now happen after blasting WBINVD, but that is quite uninteresting as the
two operations do not interact in any way.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm-x86-ops.h |  1 -
 arch/x86/include/asm/kvm_host.h    |  2 --
 arch/x86/kvm/svm/svm.c             | 11 +++--------
 arch/x86/kvm/vmx/main.c            |  2 --
 arch/x86/kvm/vmx/vmx.c             |  9 +++------
 arch/x86/kvm/vmx/x86_ops.h         |  1 -
 arch/x86/kvm/x86.c                 | 17 ++++++++++-------
 7 files changed, 16 insertions(+), 27 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index 566d19b02483..5a8b74c2e6c4 100644
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
index aabf1648a56a..0df4d14db896 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1750,8 +1750,6 @@ struct kvm_x86_ops {
 			       struct x86_exception *exception);
 	void (*handle_exit_irqoff)(struct kvm_vcpu *vcpu);
 
-	void (*sched_in)(struct kvm_vcpu *vcpu, int cpu);
-
 	/*
 	 * Size of the CPU's dirty log buffer, i.e. VMX's PML buffer.  A zero
 	 * value indicates CPU dirty logging is unsupported or disabled.
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 3d0549ca246f..51a5eb31aee5 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1548,6 +1548,9 @@ static void svm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	struct vcpu_svm *svm = to_svm(vcpu);
 	struct svm_cpu_data *sd = per_cpu_ptr(&svm_data, cpu);
 
+	if (vcpu->scheduled_out && !kvm_pause_in_guest(vcpu->kvm))
+		shrink_ple_window(vcpu);
+
 	if (sd->current_vmcb != svm->vmcb) {
 		sd->current_vmcb = svm->vmcb;
 
@@ -4572,12 +4575,6 @@ static void svm_handle_exit_irqoff(struct kvm_vcpu *vcpu)
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
@@ -5046,8 +5043,6 @@ static struct kvm_x86_ops svm_x86_ops __initdata = {
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
index 07a4d6a3a43e..da2f95385a12 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1517,6 +1517,9 @@ void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 
+	if (vcpu->scheduled_out && !kvm_pause_in_guest(vcpu->kvm))
+		shrink_ple_window(vcpu);
+
 	vmx_vcpu_load_vmcs(vcpu, cpu, NULL);
 
 	vmx_vcpu_pi_load(vcpu, cpu);
@@ -8171,12 +8174,6 @@ void vmx_cancel_hv_timer(struct kvm_vcpu *vcpu)
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
index 502704596c83..3cb0be94e779 100644
--- a/arch/x86/kvm/vmx/x86_ops.h
+++ b/arch/x86/kvm/vmx/x86_ops.h
@@ -112,7 +112,6 @@ u64 vmx_get_l2_tsc_multiplier(struct kvm_vcpu *vcpu);
 void vmx_write_tsc_offset(struct kvm_vcpu *vcpu);
 void vmx_write_tsc_multiplier(struct kvm_vcpu *vcpu);
 void vmx_request_immediate_exit(struct kvm_vcpu *vcpu);
-void vmx_sched_in(struct kvm_vcpu *vcpu, int cpu);
 void vmx_update_cpu_dirty_logging(struct kvm_vcpu *vcpu);
 #ifdef CONFIG_X86_64
 int vmx_set_hv_timer(struct kvm_vcpu *vcpu, u64 guest_deadline_tsc,
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index d750546ec934..e924d1c51e31 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -5004,6 +5004,16 @@ static bool need_emulate_wbinvd(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+
+	if (vcpu->scheduled_out) {
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
@@ -12578,14 +12588,7 @@ bool kvm_vcpu_is_bsp(struct kvm_vcpu *vcpu)
 
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
2.45.0.215.g3402c0e53f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
