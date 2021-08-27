Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FC5C432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:04:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B56CE60FD9
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B56CE60FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXCfbmf9TVX5UvaTo9ojO2ZUS35YAXY27zFrezwQ2ew=; b=pfmZQNXdvON2ny
	vbkmQIQ1FkXuKXyxD2bqgjsE8C1nqj0Bbo8N+HC79h/LaSbo3NuGr11Pwpk4IM0Y4c5M6u4ttgKwc
	UG7/5C00VKl2Kn4xNhwp7QtkNoNQdfViLyyTGujofje/TaagAmpNxT1JlNfIuTqEsO69uP/wkP7Hs
	8xFWzLog+sCJF+6ZjakgEjOn9CEm2kb7HQr71h0YQC5yueR9P6QY3MSbZcsy0BFpGu/zpLDpXedUV
	8VuwHq/Da1ElUs67Li+8QvMMOtyjb6AUjK4TYVdPKzxqMmdXAzsKh2zlrJIT8DmuaNRsKN6kfnhVP
	Nu1WhNuNUzZIWv6T271g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJQIc-00BESG-Ls; Fri, 27 Aug 2021 01:04:50 +0000
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJQBu-00BB0r-3a
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 00:57:56 +0000
Received: by mail-qv1-xf4a.google.com with SMTP id
 ib9-20020a0562141c8900b003671c3a1243so785378qvb.21
 for <linux-riscv@lists.infradead.org>; Thu, 26 Aug 2021 17:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=APlw6FoeYyjS3BPQZoCRIAf0ql6GYvWTuNomlW8snXU=;
 b=LuT11C5Peh4krF2EeyCdRCxcbNvhcakRbKzYpV3qZ6O2Z4PVpX/pEIk2oLYVzCzATI
 LirVe+4RAAMNQA5oiT6FeR7Vf9UzP3TZBQ1RW6eIIDw0eYoqjBIHJCOb3m7m1RgUcZdn
 bOJ3i8Ik5ehFXpmB//AMa+N0DT/avx0k1s6Bh0Z4wQ47vO3Y5BHzjhy1obtH40imLbdg
 1DczFHZq/wmvU1GEirxYMIFLIuwM5dyIeEobru75ofGyf5WLMEq8/LlYDYJwN2l4QhOG
 8GED2Mpk3QJ4QR32vEcxwTxNC2AHBjbOsMdxCn7mUPHsS1u7SGXczKvCreOLUwK7WywP
 dKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=APlw6FoeYyjS3BPQZoCRIAf0ql6GYvWTuNomlW8snXU=;
 b=m9SS9uTz99nWXByb2csFiWesq888sk5mct9cUtERO5t99+Dz0MF5Yu1hEKs1HVbHYn
 FELQjjEvPDHjeaCQy+x7IderKOBimfO3ZmO1RWqatc6ghdl+Qfki/9IjtW6x47+8gV27
 vp1wzua8q/Q8LtmsCH9iz2x5NOaw5hQaNJBgNkRCJOJbSg6FaoquWYTFb6eWhc9RV45U
 kPiS1mOPTlqMwaajjwTKd4OX2gEl0dVBv4xLiMPIJhoZ4Crv23UwTBpPO1sFVBv7CPFS
 w9UNuhSCalloJQ/dWv84kPlrSczWFGrWq3u6qVPcDNGDFGhBz32XCE3IxN06Vm2XOrn/
 Ir8A==
X-Gm-Message-State: AOAM531vYAONRCMhVqAELOQhHw3b9vGfuOENCL7HYuvdelp4u5cKod2Z
 zsEIdkQb/laZRYfsIn2dYmPmrYcTqBQ=
X-Google-Smtp-Source: ABdhPJxV8SLmQ7eQT1AmY1MtULBcvEHZk3qClIQX5AbSsyjIRBSmPH3McGvB8qU+Qq94IjkJESGPvkRvUxQ=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a05:6214:2465:: with SMTP id
 im5mr7220558qvb.46.1630025871976; Thu, 26 Aug 2021 17:57:51 -0700 (PDT)
Date: Thu, 26 Aug 2021 17:57:13 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-11-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 10/15] KVM: Move x86's perf guest info callbacks to generic KVM
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
X-CRM114-CacheID: sfid-20210826_175754_218596_A7C3E575 
X-CRM114-Status: GOOD (  16.64  )
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

Move x86's perf guest callbacks into common KVM, as they are semantically
identical to arm64's callbacks (the only other such KVM callbacks).
arm64 will convert to the common versions in a future patch.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  1 +
 arch/x86/kvm/x86.c              | 48 +++++----------------------------
 arch/x86/kvm/x86.h              |  6 -----
 include/linux/kvm_host.h        | 12 +++++++++
 virt/kvm/kvm_main.c             | 46 +++++++++++++++++++++++++++++++
 5 files changed, 66 insertions(+), 47 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 465b35736d9b..63553a1f43ee 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -36,6 +36,7 @@
 #include <asm/hyperv-tlfs.h>
 
 #define __KVM_HAVE_ARCH_VCPU_DEBUGFS
+#define __KVM_WANT_PERF_CALLBACKS
 
 #define KVM_MAX_VCPUS 288
 #define KVM_SOFT_MAX_VCPUS 240
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index e337aef60793..7cb0f04e24ee 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8264,32 +8264,6 @@ static void kvm_timer_init(void)
 			  kvmclock_cpu_online, kvmclock_cpu_down_prep);
 }
 
-static int kvm_is_in_guest(void)
-{
-	/* x86's callbacks are registered only when handling a guest NMI. */
-	return true;
-}
-
-static int kvm_is_user_mode(void)
-{
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
-
-	if (WARN_ON_ONCE(!vcpu))
-		return 0;
-
-	return static_call(kvm_x86_get_cpl)(vcpu) != 0;
-}
-
-static unsigned long kvm_get_guest_ip(void)
-{
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
-
-	if (WARN_ON_ONCE(!vcpu))
-		return 0;
-
-	return kvm_rip_read(vcpu);
-}
-
 static void kvm_handle_intel_pt_intr(void)
 {
 	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
@@ -8302,19 +8276,6 @@ static void kvm_handle_intel_pt_intr(void)
 			(unsigned long *)&vcpu->arch.pmu.global_status);
 }
 
-static struct perf_guest_info_callbacks kvm_guest_cbs = {
-	.is_in_guest		= kvm_is_in_guest,
-	.is_user_mode		= kvm_is_user_mode,
-	.get_guest_ip		= kvm_get_guest_ip,
-	.handle_intel_pt_intr	= NULL,
-};
-
-void kvm_register_perf_callbacks(void)
-{
-	__perf_register_guest_info_callbacks(&kvm_guest_cbs);
-}
-EXPORT_SYMBOL_GPL(kvm_register_perf_callbacks);
-
 #ifdef CONFIG_X86_64
 static void pvclock_gtod_update_fn(struct work_struct *work)
 {
@@ -11069,7 +11030,7 @@ int kvm_arch_hardware_setup(void *opaque)
 	kvm_ops_static_call_update();
 
 	if (ops->intel_pt_intr_in_guest && ops->intel_pt_intr_in_guest())
-		kvm_guest_cbs.handle_intel_pt_intr = kvm_handle_intel_pt_intr;
+		kvm_set_intel_pt_intr_handler(kvm_handle_intel_pt_intr);
 
 	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
 		supported_xss = 0;
@@ -11098,7 +11059,7 @@ int kvm_arch_hardware_setup(void *opaque)
 
 void kvm_arch_hardware_unsetup(void)
 {
-	kvm_guest_cbs.handle_intel_pt_intr = NULL;
+	kvm_set_intel_pt_intr_handler(NULL);
 
 	static_call(kvm_x86_hardware_unsetup)();
 }
@@ -11725,6 +11686,11 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 	return vcpu->arch.preempted_in_kernel;
 }
 
+unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu)
+{
+	return kvm_rip_read(vcpu);
+}
+
 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 {
 	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index f13f15d2fab8..e1fe738c3827 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -387,12 +387,6 @@ static inline bool kvm_cstate_in_guest(struct kvm *kvm)
 	return kvm->arch.cstate_in_guest;
 }
 
-void kvm_register_perf_callbacks(void);
-static inline void kvm_unregister_perf_callbacks(void)
-{
-	__perf_unregister_guest_info_callbacks();
-}
-
 static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu, bool is_nmi)
 {
 	WRITE_ONCE(vcpu->arch.handling_nmi_from_guest, is_nmi);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e4d712e9f760..0db9af0b628c 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1163,6 +1163,18 @@ static inline bool kvm_arch_intc_initialized(struct kvm *kvm)
 }
 #endif
 
+#ifdef __KVM_WANT_PERF_CALLBACKS
+
+void kvm_set_intel_pt_intr_handler(void (*handler)(void));
+unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu);
+
+void kvm_register_perf_callbacks(void);
+static inline void kvm_unregister_perf_callbacks(void)
+{
+	__perf_unregister_guest_info_callbacks();
+}
+#endif
+
 int kvm_arch_init_vm(struct kvm *kvm, unsigned long type);
 void kvm_arch_destroy_vm(struct kvm *kvm);
 void kvm_arch_sync_events(struct kvm *kvm);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 3e67c93ca403..13c4f58a75e5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5460,6 +5460,52 @@ struct kvm_vcpu * __percpu *kvm_get_running_vcpus(void)
         return &kvm_running_vcpu;
 }
 
+#ifdef __KVM_WANT_PERF_CALLBACKS
+static int kvm_is_in_guest(void)
+{
+	/* Registration of KVM's callback signifies "in guest". */
+	return true;
+}
+
+static int kvm_is_user_mode(void)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+
+	if (WARN_ON_ONCE(!vcpu))
+		return 0;
+
+	return !kvm_arch_vcpu_in_kernel(vcpu);
+}
+
+static unsigned long kvm_get_guest_ip(void)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+
+	if (WARN_ON_ONCE(!vcpu))
+		return 0;
+
+	return kvm_arch_vcpu_get_ip(vcpu);
+}
+
+static struct perf_guest_info_callbacks kvm_guest_cbs = {
+	.is_in_guest		= kvm_is_in_guest,
+	.is_user_mode		= kvm_is_user_mode,
+	.get_guest_ip		= kvm_get_guest_ip,
+	.handle_intel_pt_intr	= NULL,
+};
+
+void kvm_set_intel_pt_intr_handler(void (*handler)(void))
+{
+	kvm_guest_cbs.handle_intel_pt_intr = handler;
+}
+
+void kvm_register_perf_callbacks(void)
+{
+	__perf_register_guest_info_callbacks(&kvm_guest_cbs);
+}
+EXPORT_SYMBOL_GPL(kvm_register_perf_callbacks);
+#endif
+
 struct kvm_cpu_compat_check {
 	void *opaque;
 	int *ret;
-- 
2.33.0.259.gc128427fd7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
