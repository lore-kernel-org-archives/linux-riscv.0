Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA979C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:47:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC40760EFE
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC40760EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNLYrXJMi4wtz/bdBziUx/1jRuixHyblw061vdMz+5g=; b=kBK8hqKf9l7FJ0
	XMY5r1JBqsawOuJgW6Wh7cwUd5uh2faz5zw5vbadYl/VICLDhELrADSYsocmpK5e6fXx9/+iPx9o9
	WEPKv10GMDcPyFGdXijiT/jVao//svlHBpJhz+XF70t48Bkhx9Hrk04puTJncKuHqZUzfSYaQudAi
	Q9vF/Dpe1AIgNHn2yW9TXRBC5MizO8++aEaoQO2nMDZGtDoHITO2qVAAzGPY8PEa71pYR/dsh3iNQ
	+2YLtgKSTtP//xfTVd05xKFYsB0ZBDAehYpQKLw5E2T4/PExc+DrsfaPxuYjNCW6A+lEBpEidkR1y
	eUUYSFT0ElevXwEw95eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2Oa-004i7H-FX; Sat, 09 Oct 2021 02:47:32 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1sA-004UZV-E9
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:14:04 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 q17-20020a25b591000000b005a07d27bbdaso15038990ybj.3
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=b2NFNOmcSkF8bnqGQwOgX6HnOIy2SSUQ2D5ginVhVO0=;
 b=IRLCbLMzdCb5UchOOv+Z0PtnZNSSoLW6N5YOs8Rf0ByvWkZw9fnrXDff7+K/1lsj6B
 NqqIJpk8pE4GidDTxI/LosWoSgWzx3bzDSM/n8KN7DTXuN2T17CPaZXkgIYzDMTtYTRb
 lzcpdr5xg4vfvZJBl69uVsKH5UNXjyyhFo8HAy7LJRDbUM63L3M5Gxx882mRoBUHmman
 GjJKxe2tvpIReuijhcU3M4KaZ5D41tl+LVTPtXRV7z3IcuqwUUZuaoObrBjmhydK/TA3
 cbKULKY59/B6tcCWrJFg3N/GGr3AkBsO6Nwaaye8gGjJSjaELsGsbRMT7ru8tM6UfG9M
 F3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=b2NFNOmcSkF8bnqGQwOgX6HnOIy2SSUQ2D5ginVhVO0=;
 b=xoNSqSOZHzr1oJ3WbzBAG+Lt4/J+eB5VZSVmKnQ1/9lEWYJO7t0PHo7qCuSezXL1Et
 9mrdpspT8Bqq95HY44K0B2LeAH6BmRHSazznGAo4E8qjghoRRB1ogqYPvNrc8P0/RYgL
 HkViXgNhJVcVVPIJ3dKLoHjcWBQbJ0ZumYXDhhRYxQK+ioVtwJmF7dIu+slBrh2qQ1ix
 bGKpzzXLJBrutyVmS7U7SuQroHP27315NJln25Ibkl6p+LlgGXmF3cqz68zOBy6vAdSO
 rvsb0pPlksh+qM3hwaF3ohnKGqkwdJhWYYuF/p01jzGzyiiGwJfGMhHpqdyg5MD8TME/
 0mVA==
X-Gm-Message-State: AOAM533MyRnjMAqMPtbZcN6Hnn6+cmbrbFxz8Kim/pqO4QRTblzcGLg2
 4pwmIGKC7txYLOAeBCRDRbbbNzgqXBw=
X-Google-Smtp-Source: ABdhPJy92pUNk0vuThAHgG1KxnUNqELL/2Mc4x65Hyxv1JIWcnbmS+hS8GZ8i+88Ll6DtaYL/pxizDjGj2U=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:d607:: with SMTP id
 n7mr8053144ybg.96.1633745640889; 
 Fri, 08 Oct 2021 19:14:00 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:25 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-33-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 32/43] KVM: VMX: Move preemption timer <=> hrtimer dance to
 common x86
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, 
 Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atish.patra@wdc.com>, 
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, 
 Oliver Upton <oupton@google.com>, Jing Zhang <jingzhangos@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_191402_569799_35E22F1E 
X-CRM114-Status: GOOD (  16.38  )
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

Handle the switch to/from the hypervisor/software timer when a vCPU is
blocking in common x86 instead of in VMX.  Even though VMX is the only
user of a hypervisor timer, the logic and all functions involved are
generic x86 (unless future CPUs do something completely different and
implement a hypervisor timer that runs regardless of mode).

Handling the switch in common x86 will allow for the elimination of the
pre/post_blocks hooks, and also lets KVM switch back to the hypervisor
timer if and only if it was in use (without additional params).  Add a
comment explaining why the switch cannot be deferred to kvm_sched_out()
or kvm_vcpu_block().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c |  6 +-----
 arch/x86/kvm/x86.c     | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b3bb2031a7ac..a24f19874716 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7464,16 +7464,12 @@ void vmx_update_cpu_dirty_logging(struct kvm_vcpu *vcpu)
 
 static int vmx_pre_block(struct kvm_vcpu *vcpu)
 {
-	if (kvm_lapic_hv_timer_in_use(vcpu))
-		kvm_lapic_switch_to_sw_timer(vcpu);
-
 	return 0;
 }
 
 static void vmx_post_block(struct kvm_vcpu *vcpu)
 {
-	if (kvm_x86_ops.set_hv_timer)
-		kvm_lapic_switch_to_hv_timer(vcpu);
+
 }
 
 static void vmx_setup_mce(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index e0219acfd9cf..909e932a7ae7 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9896,8 +9896,21 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 
 static inline int vcpu_block(struct kvm *kvm, struct kvm_vcpu *vcpu)
 {
+	bool hv_timer;
+
 	if (!kvm_arch_vcpu_runnable(vcpu) &&
 	    (!kvm_x86_ops.pre_block || static_call(kvm_x86_pre_block)(vcpu) == 0)) {
+		/*
+		 * Switch to the software timer before halt-polling/blocking as
+		 * the guest's timer may be a break event for the vCPU, and the
+		 * hypervisor timer runs only when the CPU is in guest mode.
+		 * Switch before halt-polling so that KVM recognizes an expired
+		 * timer before blocking.
+		 */
+		hv_timer = kvm_lapic_hv_timer_in_use(vcpu);
+		if (hv_timer)
+			kvm_lapic_switch_to_sw_timer(vcpu);
+
 		srcu_read_unlock(&kvm->srcu, vcpu->srcu_idx);
 		if (vcpu->arch.mp_state == KVM_MP_STATE_HALTED)
 			kvm_vcpu_halt(vcpu);
@@ -9905,6 +9918,9 @@ static inline int vcpu_block(struct kvm *kvm, struct kvm_vcpu *vcpu)
 			kvm_vcpu_block(vcpu);
 		vcpu->srcu_idx = srcu_read_lock(&kvm->srcu);
 
+		if (hv_timer)
+			kvm_lapic_switch_to_hv_timer(vcpu);
+
 		if (kvm_x86_ops.post_block)
 			static_call(kvm_x86_post_block)(vcpu);
 
@@ -10136,6 +10152,11 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 			r = -EINTR;
 			goto out;
 		}
+		/*
+		 * It should be impossible for the hypervisor timer to be in
+		 * use before KVM has ever run the vCPU.
+		 */
+		WARN_ON_ONCE(kvm_lapic_hv_timer_in_use(vcpu));
 		kvm_vcpu_block(vcpu);
 		if (kvm_apic_accept_events(vcpu) < 0) {
 			r = 0;
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
