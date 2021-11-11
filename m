Return-Path: <SRS0=2pxE=P6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274E1C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 02:15:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E41FD60FA0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 02:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E41FD60FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bAL7RV681hfeC9tVqn11j9tyZDdhniDUL6V7Qil1HXc=; b=EuqQKhidkDJiOL
	TSKLgkPn+83o98msloLFTY5MoEGUxfofScV+zh8IxRjB9KO0NSRkVZxvzyG8Pc2uAOt4s6opB4Cem
	ujmAiFuqb6YW471HsPw4X9OSHXFu/2PHklb/N4vNmje5HxFTgXhUt8e5b0iO58m6hXLr1hh1v25a5
	EDdnAXGKg7HCkCaUmAFrx0X/ttgMqMV6sAA+5+AFq/dfBmO/xEYFMFXpHTzZBiTuGluEDXp4+BPC4
	sP1H+YbzHi9NCel79sTLABQ6W5OyG0nDO8TTR3WIt3QcT6E5EdAnQ9PW9AdU8rv8qsX9YGa2/ycCg
	JIZTKLqgD7BtP3M11TYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkzcj-006o25-34; Thu, 11 Nov 2021 02:15:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkzVV-006kdd-5v
 for linux-riscv@bombadil.infradead.org; Thu, 11 Nov 2021 02:08:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
 References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Sender:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Lyt/rTDjGnKoutcwJre3yNnjqLDOGX/x3OkYu61FqOk=; b=Ik7ma4ytSzYGSLKM8E/Oe3Ut1a
 gZP/qxBAxBbTMRk8U0lYOVJfCSXMu1FYFwzOJ6z9Zg9zbyi1AseDMLYS0gm2iG5I0BinlRvytEgPU
 h4HZc2eRlKB2+9YEkQmpEGwPTZrhsmLMx/sBCAAPwg13cuDRZfVBpUL50MY3JCpSNjVkGZ2CsrgPc
 nAvKVL915TqQP1E/XyCTBBqirv3/48/dveDhxEOj8bq3JfklvPHUVS8N4deyuWNw9azMNIWRWSeS3
 +7TTV2y3SiZaAwQK/DCj1Sg2B0jZd047d0H44+a8Q1j+q3BfAEXwJfzAvmb88mIatjlsDsGT4oldV
 a9sc7QtA==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkzVR-00FNjZ-Ab
 for linux-riscv@lists.infradead.org; Thu, 11 Nov 2021 02:08:03 +0000
Received: by mail-pf1-x44a.google.com with SMTP id
 h21-20020a056a001a5500b0049fc7bcb45aso3039839pfv.11
 for <linux-riscv@lists.infradead.org>; Wed, 10 Nov 2021 18:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=Lyt/rTDjGnKoutcwJre3yNnjqLDOGX/x3OkYu61FqOk=;
 b=I8XIHSvwNQ1fcpkSdsGc4AiCdO+YuaQlW3RXJZULkdkHSVSpiSB2z5tzowllmJ+Tdh
 VAXBm73ZsKSWwoJMRNxrsMKG+icBCC6PildLyn4ZRrgxZFW7lw+uDQaRe13J0ZYYFICw
 RY/Ms9WJCbbSEl49Bxj866E13R0XzMlHdhSmaskdgLqSdcLwszfqInJfpHSHPuytmZSx
 BsgHHmWeayoYirawUXu3l+QK3yaTIngZgf0YqEx4vJLxeQLzupJ+MgudJMmYzpfRhKvP
 CFiOg76ypH6eMg3NIm3Zg1wASou7RXi8yICFp/t7wWu2cdovARfNECA30eFWZRrYjIAv
 j/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=Lyt/rTDjGnKoutcwJre3yNnjqLDOGX/x3OkYu61FqOk=;
 b=4i6CfNwfbymwxt7cjy0mIBE/8A+9Z5/pMaQXqFwAv2lK00dxQbmiROX9CMPMle5zZ+
 +k+bnWA/bQ6KNDQVbh/M8tVMK3MtCmwmCc8XMf0RQWpikXrzLAg9PZtbx5auO/kTjhfX
 oZC/JiVpf3H1Aq0/fP+UxHSYkZCbtK+jDX96NZWLHS6J3qgFFc4HYV+do/wB1E42OQ+F
 RhtzAW3iX9lOTBOjQtq5sbfGj4ZwZL2nVvGFPhm6O8vxd1Xaa8E3p6VDv1S+yzg/Zyu/
 r/OigLg8HB8uS71Qs1QsQNI0EvMN3Z4BPvDumnEM45nqmlS0oMHlf+uvYv8DbLsckIMt
 Lv3A==
X-Gm-Message-State: AOAM531TXJhKROA5I9wgGjmKXLRhAlZWzh1R+vjRDytWIBioZdDxD7mY
 MeCjwif8+m7ndl1xtxTFHdW2POUS8rk=
X-Google-Smtp-Source: ABdhPJzwe3ySftIMFIDWAgLK4p70yiGU7wr0OHMFB4yOPKar4RINHPheEDQEOrP3eF5wXmfUmDTfro+u2BU=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:174e:b0:43b:80ba:99c8
 with SMTP id
 j14-20020a056a00174e00b0043b80ba99c8mr3561997pfc.51.1636596477237; Wed, 10
 Nov 2021 18:07:57 -0800 (PST)
Date: Thu, 11 Nov 2021 02:07:31 +0000
In-Reply-To: <20211111020738.2512932-1-seanjc@google.com>
Message-Id: <20211111020738.2512932-11-seanjc@google.com>
Mime-Version: 1.0
References: <20211111020738.2512932-1-seanjc@google.com>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH v4 10/17] KVM: x86: Drop current_vcpu for kvm_running_vcpu +
 kvm_arch_vcpu variable
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Russell King <linux@armlinux.org.uk>, Marc Zyngier <maz@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
 Vincent Chen <deanbo422@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
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
 Like Xu <like.xu.linux@gmail.com>, Like Xu <like.xu@linux.intel.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_020801_462854_11FD8F37 
X-CRM114-Status: GOOD (  19.68  )
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

Use the generic kvm_running_vcpu plus a new 'handling_intr_from_guest'
variable in kvm_arch_vcpu instead of the semi-redundant current_vcpu.
kvm_before/after_interrupt() must be called while the vCPU is loaded,
(which protects against preemption), thus kvm_running_vcpu is guaranteed
to be non-NULL when handling_intr_from_guest is non-zero.

Switching to kvm_get_running_vcpu() will allows moving KVM's perf
callbacks to generic code, and the new flag will be used in a future
patch to more precisely identify the "NMI from guest" case.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  3 +--
 arch/x86/kvm/pmu.c              |  2 +-
 arch/x86/kvm/x86.c              | 21 ++++++++++++---------
 arch/x86/kvm/x86.h              | 10 ++++++----
 4 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 112ffb355552..812c08e797fe 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -773,6 +773,7 @@ struct kvm_vcpu_arch {
 	unsigned nmi_pending; /* NMI queued after currently running handler */
 	bool nmi_injected;    /* Trying to inject an NMI this entry */
 	bool smi_pending;    /* SMI queued after currently running handler */
+	u8 handling_intr_from_guest;
 
 	struct kvm_mtrr mtrr_state;
 	u64 pat;
@@ -1893,8 +1894,6 @@ int kvm_skip_emulated_instruction(struct kvm_vcpu *vcpu);
 int kvm_complete_insn_gp(struct kvm_vcpu *vcpu, int err);
 void __kvm_request_immediate_exit(struct kvm_vcpu *vcpu);
 
-unsigned int kvm_guest_state(void);
-
 void __user *__x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 				     u32 size);
 bool kvm_vcpu_is_reset_bsp(struct kvm_vcpu *vcpu);
diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 5b68d4188de0..eef48258e50f 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -87,7 +87,7 @@ static void kvm_perf_overflow_intr(struct perf_event *perf_event,
 		 * woken up. So we should wake it, but this is impossible from
 		 * NMI context. Do it from irq work instead.
 		 */
-		if (!kvm_guest_state())
+		if (!kvm_handling_nmi_from_guest(pmc->vcpu))
 			irq_work_queue(&pmc_to_pmu(pmc)->irq_work);
 		else
 			kvm_make_request(KVM_REQ_PMI, pmc->vcpu);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ceb09d78277e..c8ef49385c99 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8410,15 +8410,17 @@ static void kvm_timer_init(void)
 			  kvmclock_cpu_online, kvmclock_cpu_down_prep);
 }
 
-DEFINE_PER_CPU(struct kvm_vcpu *, current_vcpu);
-EXPORT_PER_CPU_SYMBOL_GPL(current_vcpu);
+static inline bool kvm_pmi_in_guest(struct kvm_vcpu *vcpu)
+{
+	return vcpu && vcpu->arch.handling_intr_from_guest;
+}
 
-unsigned int kvm_guest_state(void)
+static unsigned int kvm_guest_state(void)
 {
-	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
 	unsigned int state;
 
-	if (!vcpu)
+	if (!kvm_pmi_in_guest(vcpu))
 		return 0;
 
 	state = PERF_GUEST_ACTIVE;
@@ -8430,9 +8432,10 @@ unsigned int kvm_guest_state(void)
 
 static unsigned long kvm_guest_get_ip(void)
 {
-	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
 
-	if (WARN_ON_ONCE(!vcpu))
+	/* Retrieving the IP must be guarded by a call to kvm_guest_state(). */
+	if (WARN_ON_ONCE(!kvm_pmi_in_guest(vcpu)))
 		return 0;
 
 	return kvm_rip_read(vcpu);
@@ -8440,10 +8443,10 @@ static unsigned long kvm_guest_get_ip(void)
 
 static unsigned int kvm_handle_intel_pt_intr(void)
 {
-	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
 
 	/* '0' on failure so that the !PT case can use a RET0 static call. */
-	if (!vcpu)
+	if (!kvm_pmi_in_guest(vcpu))
 		return 0;
 
 	kvm_make_request(KVM_REQ_PMI, vcpu);
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index ea264c4502e4..d070043fd2e8 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -385,18 +385,20 @@ static inline bool kvm_cstate_in_guest(struct kvm *kvm)
 	return kvm->arch.cstate_in_guest;
 }
 
-DECLARE_PER_CPU(struct kvm_vcpu *, current_vcpu);
-
 static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu)
 {
-	__this_cpu_write(current_vcpu, vcpu);
+	WRITE_ONCE(vcpu->arch.handling_intr_from_guest, 1);
 }
 
 static inline void kvm_after_interrupt(struct kvm_vcpu *vcpu)
 {
-	__this_cpu_write(current_vcpu, NULL);
+	WRITE_ONCE(vcpu->arch.handling_intr_from_guest, 0);
 }
 
+static inline bool kvm_handling_nmi_from_guest(struct kvm_vcpu *vcpu)
+{
+	return !!vcpu->arch.handling_intr_from_guest;
+}
 
 static inline bool kvm_pat_valid(u64 data)
 {
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
