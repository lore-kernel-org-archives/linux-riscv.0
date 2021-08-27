Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958DFC432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:02:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68A5760F11
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68A5760F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OSw27kUOl2qQ+nfaE0N5/WGb8ci0Art6ZV+jgeVLZWE=; b=nTPKFOoA+0deZt
	/8hKfXAT829YZcsP3zHIJ5mwBI5GTTxnbuWdca+xx53znniG5MYVNkLILlSsUHKXE4OjzP2o/BN/k
	vIyRoA6IplGjn9HL+vre+x+4LFdsv8IQPIJo/b8b7kpqaR+mFaDRcaPVPLbKrGZIEQjEmLVbEZyKI
	Jg7wrIEvmDc3g+BYoufJ3s5n5D4xCooHj/PxUCRip1qQ584I7DPaSWmDSLpljkuey2L6dVlSLf0jN
	ykAWOD+J3vORiPxfgerjfs6z7tVJ/BACBsV8U5CtC2vHs6NIKOARM80EimqUL80IRrOjFtafXIdk4
	6+5+UTKECrBVFQer/4zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJQFs-00BD3M-8p; Fri, 27 Aug 2021 01:02:00 +0000
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJQBn-00BAwI-9X
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 00:57:51 +0000
Received: by mail-qk1-x74a.google.com with SMTP id
 e22-20020a05620a209600b003d5ff97bff7so1982730qka.1
 for <linux-riscv@lists.infradead.org>; Thu, 26 Aug 2021 17:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=ruUdABYeGOxk9Wbic5Hd5odsewNKbNWoYU61ZxyE/gg=;
 b=vndU5Ssx1OSDPC9rhyF45w6Pl7KtF0HVdGcu07QMxr8hS7zmZr27FOwtaxJ1tTTkEv
 TjbpCl/yYOXwwbt+SfzpzW3C6DQ9IlXFMA5KyM2L5I/ODQXruJ5mMmlo2GULJ15xapc7
 DFo1XzvZHNjyXnPyzThDoBjBnUJ1S5bL2Zix9AnTvvwdLOZpELvTqnih27/JdGkMAZoP
 quXkeM9af9v2IYqphIzmnDdaHD0J50WGHw7/sBwRcQXuQNUtKrPYoGQP0EI8s8Bwn6H5
 0rtanzqf7O/zwFamcAeVErwzbLq+HxNe55hWM4yl7reqNOj5UMfQohDiN9UF2ESzt0l+
 hATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=ruUdABYeGOxk9Wbic5Hd5odsewNKbNWoYU61ZxyE/gg=;
 b=HE/aehdVKycnXJaecgBz7/E9PI+sgqgCdx7S8EDQFWAHNk3SGWrdHj02Dhgq+vA3dy
 HdPJNMgXiAR0W90utNd9q6jphJPhXzpM317iM55RWQIrzmie/lCwqiePdFMk/erPy5U0
 4oM68uHSptrDWCtclB2sDfJm5rVa4oCy4uIH/5IrRqTVdaVHjXVowqHJo+BM4rLbmAqa
 9nRjoslH9EFWL4PVXkmUQD/dVgCybego4rcFsUE51Ic/Iw9Ru07w0j0BTrtcfkAkPk/9
 0c6KurLytSMLW0K8vNHE4F9iXm5Uvw4qTo0vVf1L8LI6iaFvkzqa5PQ9PcEYW3YUx2hA
 SUyQ==
X-Gm-Message-State: AOAM532zIY1BOslizs/IqFeXrQ9oGxnOHYJKRd/NHLdsPeg9L/1EmvrZ
 JeUfpQoFEihszf7e70iAsxSRWckh1bc=
X-Google-Smtp-Source: ABdhPJxmVIKT1CgaTJnI3PKNih3UzXPOYiYk1l24a+ud0Vw4EBZOBMMmsnAtkB7iXZi5aG3MALLptO9xIv4=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a05:6214:14f2:: with SMTP id
 k18mr7332294qvw.19.1630025865337; Thu, 26 Aug 2021 17:57:45 -0700 (PDT)
Date: Thu, 26 Aug 2021 17:57:10 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-8-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 07/15] KVM: Use dedicated flag to track if KVM is handling an
 NMI from guest
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
X-CRM114-CacheID: sfid-20210826_175747_418000_66978548 
X-CRM114-Status: GOOD (  18.66  )
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

Add a dedicated flag to detect the case where KVM's PMC overflow
callback was originally invoked in response to an NMI that arrived while
the guest was running.  Using current_vcpu is less precise as IRQs also
set current_vcpu (though presumably KVM's callback should not be reached
in that case), and more importantly, this will allow dropping
current_vcpu as the perf callbacks can switch to kvm_running_vcpu now
that the perf callbacks are precisely registered, i.e. kvm_running_vcpu
doesn't need to be used to detect if a PMI arrived in the guest.

Fixes: dd60d217062f ("KVM: x86: Fix perf timer mode IP reporting")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 3 +--
 arch/x86/kvm/pmu.c              | 2 +-
 arch/x86/kvm/svm/svm.c          | 2 +-
 arch/x86/kvm/vmx/vmx.c          | 2 +-
 arch/x86/kvm/x86.c              | 4 ++--
 arch/x86/kvm/x86.h              | 4 +++-
 6 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 1ea4943a73d7..465b35736d9b 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -763,6 +763,7 @@ struct kvm_vcpu_arch {
 	unsigned nmi_pending; /* NMI queued after currently running handler */
 	bool nmi_injected;    /* Trying to inject an NMI this entry */
 	bool smi_pending;    /* SMI queued after currently running handler */
+	bool handling_nmi_from_guest;
 
 	struct kvm_mtrr mtrr_state;
 	u64 pat;
@@ -1874,8 +1875,6 @@ int kvm_skip_emulated_instruction(struct kvm_vcpu *vcpu);
 int kvm_complete_insn_gp(struct kvm_vcpu *vcpu, int err);
 void __kvm_request_immediate_exit(struct kvm_vcpu *vcpu);
 
-int kvm_is_in_guest(void);
-
 void __user *__x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 				     u32 size);
 bool kvm_vcpu_is_reset_bsp(struct kvm_vcpu *vcpu);
diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 0772bad9165c..2b8934b452ea 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -87,7 +87,7 @@ static void kvm_perf_overflow_intr(struct perf_event *perf_event,
 		 * woken up. So we should wake it, but this is impossible from
 		 * NMI context. Do it from irq work instead.
 		 */
-		if (!kvm_is_in_guest())
+		if (!pmc->vcpu->arch.handling_nmi_from_guest)
 			irq_work_queue(&pmc_to_pmu(pmc)->irq_work);
 		else
 			kvm_make_request(KVM_REQ_PMI, pmc->vcpu);
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 1a70e11f0487..3fc6767e5fd8 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -3843,7 +3843,7 @@ static __no_kcsan fastpath_t svm_vcpu_run(struct kvm_vcpu *vcpu)
 	}
 
 	if (unlikely(svm->vmcb->control.exit_code == SVM_EXIT_NMI))
-		kvm_before_interrupt(vcpu);
+		kvm_before_interrupt(vcpu, true);
 
 	kvm_load_host_xsave_state(vcpu);
 	stgi();
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index f19d72136f77..f08980ef7c44 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6344,7 +6344,7 @@ void vmx_do_interrupt_nmi_irqoff(unsigned long entry);
 static void handle_interrupt_nmi_irqoff(struct kvm_vcpu *vcpu,
 					unsigned long entry)
 {
-	kvm_before_interrupt(vcpu);
+	kvm_before_interrupt(vcpu, entry == (unsigned long)asm_exc_nmi_noist);
 	vmx_do_interrupt_nmi_irqoff(entry);
 	kvm_after_interrupt(vcpu);
 }
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index bc4ee6ea7752..d4d91944fde7 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8267,7 +8267,7 @@ static void kvm_timer_init(void)
 DEFINE_PER_CPU(struct kvm_vcpu *, current_vcpu);
 EXPORT_PER_CPU_SYMBOL_GPL(current_vcpu);
 
-int kvm_is_in_guest(void)
+static int kvm_is_in_guest(void)
 {
 	return __this_cpu_read(current_vcpu) != NULL;
 }
@@ -9678,7 +9678,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 	 * interrupts on processors that implement an interrupt shadow, the
 	 * stat.exits increment will do nicely.
 	 */
-	kvm_before_interrupt(vcpu);
+	kvm_before_interrupt(vcpu, false);
 	local_irq_enable();
 	++vcpu->stat.exits;
 	local_irq_disable();
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 5cedc0e8a5d5..4c5ba4128b38 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -395,9 +395,10 @@ static inline void kvm_unregister_perf_callbacks(void)
 
 DECLARE_PER_CPU(struct kvm_vcpu *, current_vcpu);
 
-static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu)
+static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu, bool is_nmi)
 {
 	__this_cpu_write(current_vcpu, vcpu);
+	WRITE_ONCE(vcpu->arch.handling_nmi_from_guest, is_nmi);
 
 	kvm_register_perf_callbacks();
 }
@@ -406,6 +407,7 @@ static inline void kvm_after_interrupt(struct kvm_vcpu *vcpu)
 {
 	kvm_unregister_perf_callbacks();
 
+	WRITE_ONCE(vcpu->arch.handling_nmi_from_guest, false);
 	__this_cpu_write(current_vcpu, NULL);
 }
 
-- 
2.33.0.259.gc128427fd7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
