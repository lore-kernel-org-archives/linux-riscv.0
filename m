Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA4FC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:50:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2127860F5D
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2127860F5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xr9ixdz/LF2TNBlQD4GBgFJHankYnd3vxP1lDNTyBhI=; b=G1ShUITTvAomsL
	ZK5cvklw9M1BrebOLIvBv0U2WCKG/LC/jqNYBdPl4CCtc7rDMwBIEL3i7zyOjAUScpmKmNmR9oIJu
	neu/YUHJmXWt0uaK+a/jqHmItZb0QK6ni8btBuT3raS5n/7ALRfbgPK+mxQCXGpQgmMWOKo+4DJLb
	cp3k041vUZTssqgi6XtuvrkDrXYft5NDC8yqOlVcI0PpD4stO65Cb6tpdJDGYL1JK9Dyi9BH81kJa
	Kg9GPD2801J059dlSoZhToQxSWNxAlKcVA7uFeFix/xE04NwPQDDR8WYtuXhgAavZe+S9Ba3PfQL8
	Nm5Mgi7FWelf3S/M0eQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2RT-004jAr-FU; Sat, 09 Oct 2021 02:50:31 +0000
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1sF-004UdZ-Cs
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:14:10 +0000
Received: by mail-qt1-x84a.google.com with SMTP id
 t15-20020ac8588f000000b002a777ee14d0so1716916qta.14
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=vAfx5V7oXhMQdNK6n8fKDF9GGCBj6ltSzPsyuPD42Bs=;
 b=HyCTY7JAidC//XRRYdKJX4UqDMF+OOF3bUAiJb+P7QyZ+wCs6Z/juMFKBQx23iMMVN
 cqVP/RAmIlHJJh/IhCDJgzpkP3/4PSr5HvmGU1YPAIdroNNdN/LgWT1sdedqNCFyThVJ
 OB3PsHG+5QPOxxfyOCjKqjYqJ4/3yZaYt4IJa7HdBQLnErOW6mzpDjvlQYRWWwwhfSDr
 es8zEbyw0sk5VgOb2rS8SbWA9aRFUd6GPvV5QVuzDE3suPpPWMfVuh4VMHrQBClBm931
 uNAJ7v8jb3UYDmZvbfs/UX4HaL+qaNp7Uu3y1027BulayBFMmGfZVNaeWs+z9FeE6i1a
 QWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=vAfx5V7oXhMQdNK6n8fKDF9GGCBj6ltSzPsyuPD42Bs=;
 b=JlLV1oSlw/4s7IUmTrWvsRce3jTYrXO4ZiA46/4y53lWHKQCjFgeFe2dGMY9GM/lrk
 K/59ILGuorDNS71Puz3QmRbwynzvODt6ZKXBJQ1ynTYwQsDRs9/i8XnIn3NGoBeRaiOS
 ghCVkXUQP4effOKzPNX7zj1cNTk2XryB5fuOiHivqnDrDMlY4Lxi+wtMRgCA0nYqWFy+
 s44edxGBOXm3C7PO6FOl+Vi60zPqRV0Eg5GQPWlk4T647n+28bp0QGQau9SFuMNYOd3T
 6Bztx/z+LLpxAnC6JYW0/lKZ9p/fyCQ0lTrN8YOSrGpgITTOib3PSKkbCWVGYsQjfBIH
 nCzw==
X-Gm-Message-State: AOAM532wBLO7mPRuv7DG9N81kf763FtRI/lGym1/5NZ8tD9bhh36k+ea
 jx3qHPw2QBB0HVcRjg2tkFzDAGLornE=
X-Google-Smtp-Source: ABdhPJx91iwUKT3XNp8Nkk81qQnI7CC/+A7yDe4tFSaroMx6ORDJ7jKPf6Pp/KOtyNzdi03H7gazxyAr7d8=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:ac8:5c0a:: with SMTP id
 i10mr1952886qti.23.1633745645576; 
 Fri, 08 Oct 2021 19:14:05 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:27 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-35-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 34/43] KVM: x86: Remove defunct pre_block/post_block
 kvm_x86_ops hooks
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
X-CRM114-CacheID: sfid-20211008_191407_545206_7BAFCF44 
X-CRM114-Status: GOOD (  15.13  )
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

Drop kvm_x86_ops' pre/post_block() now that all implementations are nops.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm-x86-ops.h |  2 --
 arch/x86/include/asm/kvm_host.h    | 12 ------------
 arch/x86/kvm/vmx/vmx.c             | 13 -------------
 arch/x86/kvm/x86.c                 |  6 +-----
 4 files changed, 1 insertion(+), 32 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index cefe1d81e2e8..c2b007171abd 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -96,8 +96,6 @@ KVM_X86_OP(handle_exit_irqoff)
 KVM_X86_OP_NULL(request_immediate_exit)
 KVM_X86_OP(sched_in)
 KVM_X86_OP_NULL(update_cpu_dirty_logging)
-KVM_X86_OP_NULL(pre_block)
-KVM_X86_OP_NULL(post_block)
 KVM_X86_OP_NULL(vcpu_blocking)
 KVM_X86_OP_NULL(vcpu_unblocking)
 KVM_X86_OP_NULL(update_pi_irte)
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 328103a520d3..76a8dddc1a48 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1445,18 +1445,6 @@ struct kvm_x86_ops {
 	const struct kvm_pmu_ops *pmu_ops;
 	const struct kvm_x86_nested_ops *nested_ops;
 
-	/*
-	 * Architecture specific hooks for vCPU blocking due to
-	 * HLT instruction.
-	 * Returns for .pre_block():
-	 *    - 0 means continue to block the vCPU.
-	 *    - 1 means we cannot block the vCPU since some event
-	 *        happens during this period, such as, 'ON' bit in
-	 *        posted-interrupts descriptor is set.
-	 */
-	int (*pre_block)(struct kvm_vcpu *vcpu);
-	void (*post_block)(struct kvm_vcpu *vcpu);
-
 	void (*vcpu_blocking)(struct kvm_vcpu *vcpu);
 	void (*vcpu_unblocking)(struct kvm_vcpu *vcpu);
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index a24f19874716..13e732a818f3 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7462,16 +7462,6 @@ void vmx_update_cpu_dirty_logging(struct kvm_vcpu *vcpu)
 		secondary_exec_controls_clearbit(vmx, SECONDARY_EXEC_ENABLE_PML);
 }
 
-static int vmx_pre_block(struct kvm_vcpu *vcpu)
-{
-	return 0;
-}
-
-static void vmx_post_block(struct kvm_vcpu *vcpu)
-{
-
-}
-
 static void vmx_setup_mce(struct kvm_vcpu *vcpu)
 {
 	if (vcpu->arch.mcg_cap & MCG_LMCE_P)
@@ -7665,9 +7655,6 @@ static struct kvm_x86_ops vmx_x86_ops __initdata = {
 	.cpu_dirty_log_size = PML_ENTITY_NUM,
 	.update_cpu_dirty_logging = vmx_update_cpu_dirty_logging,
 
-	.pre_block = vmx_pre_block,
-	.post_block = vmx_post_block,
-
 	.pmu_ops = &intel_pmu_ops,
 	.nested_ops = &vmx_nested_ops,
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 909e932a7ae7..9643f23c28c7 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9898,8 +9898,7 @@ static inline int vcpu_block(struct kvm *kvm, struct kvm_vcpu *vcpu)
 {
 	bool hv_timer;
 
-	if (!kvm_arch_vcpu_runnable(vcpu) &&
-	    (!kvm_x86_ops.pre_block || static_call(kvm_x86_pre_block)(vcpu) == 0)) {
+	if (!kvm_arch_vcpu_runnable(vcpu)) {
 		/*
 		 * Switch to the software timer before halt-polling/blocking as
 		 * the guest's timer may be a break event for the vCPU, and the
@@ -9921,9 +9920,6 @@ static inline int vcpu_block(struct kvm *kvm, struct kvm_vcpu *vcpu)
 		if (hv_timer)
 			kvm_lapic_switch_to_hv_timer(vcpu);
 
-		if (kvm_x86_ops.post_block)
-			static_call(kvm_x86_post_block)(vcpu);
-
 		if (!kvm_check_request(KVM_REQ_UNHALT, vcpu))
 			return 1;
 	}
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
