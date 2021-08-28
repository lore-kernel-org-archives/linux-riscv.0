Return-Path: <SRS0=hxmM=NT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A31C432BE
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Aug 2021 20:14:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9278C60C3F
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Aug 2021 20:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9278C60C3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N5Hpd6TjM4hzu4PkTnckzflPnBIqkWSnuHX7MrhaPdI=; b=cHR2hY1M3MRazH
	5/TW/U4VRQ1Ta6+L7d1xtClDzH8Q93SZVxBEOUcTlEmFgyKnZWMRlGbNY32B+aDJe+0aaV80eoeXT
	0UCYa6tw0MDxT+X71Yackn111giYCup+CoQOzgHve78ITiLy7G9r6dn70GF0huPuc72P7dW/0m039
	4yMa7UZp78p/x6O6i5bBs1150Vus58+OPsY2jgKdCbbv1jDVOaawBN8K3xhgi9+x5EyP9qEFyapko
	LARRHYBeoZMqe1PAsWS+LXDh2zUgf3DzIfmj75v/7wDqye9kcSJoQn/N5oDNPmxAcwEYsBVbleWSe
	NhHSjmAFo0uNzf9MRUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mK4id-00Efsp-Fo; Sat, 28 Aug 2021 20:14:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mK4iR-00EfsH-Nq; Sat, 28 Aug 2021 20:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5eM46mJiedShkh/qp5ZYvdDK6rHNXNQh8cRsw3NT0wc=; b=PCb7ByQnKwg1Y1b5amksoxMC18
 750jnriAADg3ZMPkZsQ1S64I3SWooq8RAWKHR6gvS8yq6sBTJRW/xpIDhQdtdqFGSMkbRqvzaoVOX
 RbHrtpxkLKFZ4QPToWsR2xgD4PPVFivtUlICzQb4AuxKKXG0q5V1I06RklmKdc6wzT/DQawC2aUYR
 bAQTfuPsxVqPKCnKmPQWMt4oHoj06J+I7g5V81Vo50dn/UBfFPxoTMXUOcQzRt6ogYKOXQM3TuwyX
 U9SU7AVxzEm+BWC1B9V1zMc+Wy5pDKewEdcHo9SqQqbovYL6/IUQxLHaa9mf9upz2wZvb/AUhs050
 1IIDrKxg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mK4hs-00Dw8H-MQ; Sat, 28 Aug 2021 20:13:43 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1A47F9868D7; Sat, 28 Aug 2021 22:13:36 +0200 (CEST)
Date: Sat, 28 Aug 2021 22:13:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH v2 00/13] perf: KVM: Fix, optimize, and clean up callbacks
Message-ID: <20210828201336.GD4353@worktop.programming.kicks-ass.net>
References: <20210828003558.713983-1-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210828003558.713983-1-seanjc@google.com>
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

On Fri, Aug 27, 2021 at 05:35:45PM -0700, Sean Christopherson wrote:
> Like Xu (2):
>   perf/core: Rework guest callbacks to prepare for static_call support
>   perf/core: Use static_call to optimize perf_guest_info_callbacks
> 
> Sean Christopherson (11):
>   perf: Ensure perf_guest_cbs aren't reloaded between !NULL check and
>     deref
>   KVM: x86: Register perf callbacks after calling vendor's
>     hardware_setup()
>   KVM: x86: Register Processor Trace interrupt hook iff PT enabled in
>     guest
>   perf: Stop pretending that perf can handle multiple guest callbacks
>   perf: Force architectures to opt-in to guest callbacks
>   KVM: x86: Drop current_vcpu for kvm_running_vcpu + kvm_arch_vcpu
>     variable
>   KVM: x86: More precisely identify NMI from guest when handling PMI
>   KVM: Move x86's perf guest info callbacks to generic KVM
>   KVM: x86: Move Intel Processor Trace interrupt handler to vmx.c
>   KVM: arm64: Convert to the generic perf callbacks
>   KVM: arm64: Drop perf.c and fold its tiny bits of code into arm.c /
>     pmu.c

Lets keep the whole intel_pt crud inside x86...

---
Index: linux-2.6/arch/x86/events/core.c
===================================================================
--- linux-2.6.orig/arch/x86/events/core.c
+++ linux-2.6/arch/x86/events/core.c
@@ -92,7 +92,7 @@ DEFINE_STATIC_CALL_RET0(x86_pmu_guest_ge
 
 DEFINE_STATIC_CALL_RET0(x86_guest_state, *(perf_guest_cbs->state));
 DEFINE_STATIC_CALL_RET0(x86_guest_get_ip, *(perf_guest_cbs->get_ip));
-DEFINE_STATIC_CALL_RET0(x86_guest_handle_intel_pt_intr, *(perf_guest_cbs->handle_intel_pt_intr));
+DEFINE_STATIC_CALL_RET0(x86_guest_handle_intel_pt_intr, unsigned int (*)(void));
 
 void arch_perf_update_guest_cbs(struct perf_guest_info_callbacks *guest_cbs)
 {
@@ -103,14 +103,6 @@ void arch_perf_update_guest_cbs(struct p
 		static_call_update(x86_guest_state, (void *)&__static_call_return0);
 		static_call_update(x86_guest_get_ip, (void *)&__static_call_return0);
 	}
-
-	/* Implementing ->handle_intel_pt_intr is optional. */
-	if (guest_cbs && guest_cbs->handle_intel_pt_intr)
-		static_call_update(x86_guest_handle_intel_pt_intr,
-				   guest_cbs->handle_intel_pt_intr);
-	else
-		static_call_update(x86_guest_handle_intel_pt_intr,
-				   (void *)&__static_call_return0);
 }
 
 u64 __read_mostly hw_cache_event_ids
Index: linux-2.6/arch/x86/events/intel/core.c
===================================================================
--- linux-2.6.orig/arch/x86/events/intel/core.c
+++ linux-2.6/arch/x86/events/intel/core.c
@@ -2782,7 +2782,7 @@ static void intel_pmu_reset(void)
 	local_irq_restore(flags);
 }
 
-DECLARE_STATIC_CALL(x86_guest_handle_intel_pt_intr, *(perf_guest_cbs->handle_intel_pt_intr));
+DECLARE_STATIC_CALL(x86_guest_handle_intel_pt_intr, unsigned int (*)(void));
 
 static int handle_pmi_common(struct pt_regs *regs, u64 status)
 {
Index: linux-2.6/arch/x86/kvm/x86.c
===================================================================
--- linux-2.6.orig/arch/x86/kvm/x86.c
+++ linux-2.6/arch/x86/kvm/x86.c
@@ -10960,7 +10960,14 @@ int kvm_arch_hardware_setup(void *opaque
 	memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
 	kvm_ops_static_call_update();
 
-	kvm_register_perf_callbacks(ops->handle_intel_pt_intr);
+	kvm_register_perf_callbacks();
+	if (ops->handle_intel_pt_intr) {
+		static_call_update(x86_guest_handle_intel_pt_intr,
+				   ops->handle_intel_pt_intr);
+	} else {
+		static_call_update(x86_guest_handle_intel_pt_intr,
+				   (void *)&__static_call_return0);
+	}
 
 	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
 		supported_xss = 0;
Index: linux-2.6/include/linux/perf_event.h
===================================================================
--- linux-2.6.orig/include/linux/perf_event.h
+++ linux-2.6/include/linux/perf_event.h
@@ -32,7 +32,6 @@
 struct perf_guest_info_callbacks {
 	unsigned int			(*state)(void);
 	unsigned long			(*get_ip)(void);
-	unsigned int			(*handle_intel_pt_intr)(void);
 };
 
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
Index: linux-2.6/virt/kvm/kvm_main.c
===================================================================
--- linux-2.6.orig/virt/kvm/kvm_main.c
+++ linux-2.6/virt/kvm/kvm_main.c
@@ -5374,12 +5374,10 @@ static unsigned long kvm_guest_get_ip(vo
 static struct perf_guest_info_callbacks kvm_guest_cbs = {
 	.state			= kvm_guest_state,
 	.get_ip			= kvm_guest_get_ip,
-	.handle_intel_pt_intr	= NULL,
 };
 
-void kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void))
+void kvm_register_perf_callbacks(void)
 {
-	kvm_guest_cbs.handle_intel_pt_intr = pt_intr_handler;
 	perf_register_guest_info_callbacks(&kvm_guest_cbs);
 }
 #endif
Index: linux-2.6/arch/arm64/kvm/arm.c
===================================================================
--- linux-2.6.orig/arch/arm64/kvm/arm.c
+++ linux-2.6/arch/arm64/kvm/arm.c
@@ -1749,7 +1749,7 @@ static int init_subsystems(void)
 		goto out;
 
 	kvm_pmu_init();
-	kvm_register_perf_callbacks(NULL);
+	kvm_register_perf_callbacks();
 
 	kvm_sys_reg_table_init();
 
Index: linux-2.6/include/linux/kvm_host.h
===================================================================
--- linux-2.6.orig/include/linux/kvm_host.h
+++ linux-2.6/include/linux/kvm_host.h
@@ -1121,7 +1121,7 @@ static inline bool kvm_arch_intc_initial
 #ifdef __KVM_WANT_PERF_CALLBACKS
 unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu);
 
-void kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void));
+void kvm_register_perf_callbacks(void);
 static inline void kvm_unregister_perf_callbacks(void)
 {
 	perf_unregister_guest_info_callbacks();

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
