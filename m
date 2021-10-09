Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201E5C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:18:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFDAF60F90
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFDAF60F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWmTlPDE9Peq2BlUaSPcZLxowVjaQS0M2TNdSPqJBiE=; b=RFH6P3ar1akVEe
	OOjjuG1RL5/eDZMHqlZwQ28CQq50VZOKadzdrqOCX14r8sM3rD8xX0p7YV2HC+X0Pu4sR2BI5Pzim
	vV8w/SUNSgdjsdAYV/VSafw2hkRaJvIqEN9pADRdApc+iRLQVc2F8Z7NtUSEqGEp5o1KuY91O6Qw0
	MI+aZH7oYLuSEkRNHL9WgG6/YRI/llpsF5hNh8PA4S7VSii/b/o6xar2oUpjZc6ycbKAKV9ceR1eJ
	LftyC8EZvX1Y1aTY1tn/2aDjecCWEy6bdQfO6yg9BVz49yN7A8JKZSYvZOtUxDCWaocN1/iWuA1te
	V50l0h5+hiHURNnV6n7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ1wP-004WwP-SV; Sat, 09 Oct 2021 02:18:25 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1rF-004TwZ-JS
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:07 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 j193-20020a2523ca000000b005b789d71d9aso14934366ybj.21
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=YNFYy1+jmsqBQO7lcTMp/gHxJSfts5yJcN50NMYG+fs=;
 b=facHCe8JDVzD19iFo0oWo3hW1TFBdD+iW2bjxX5VsJtp/do/eWGowfH1VQ3/OJy2uL
 WupA6pCErUFQxs/uLKQgwZcRJ+n0qbcSIJvJBtl3dR6Op88iL+dYsgswQIm6PQTNQ8XH
 GTcvVO9GdWSE/0zJcdpRCEZYI/VbGE1MerW0XvF6T5U+6S5nZWKlJX/wMTuPz6DUqSjD
 6dye9ob0uldlam93gja1rmHpCkgj1JIiRJS7mPfw9d3/fa9qfPU2JLFpi0y2MtMlC9sl
 2u10JUwODgzUrXbb0y9tok1xowfpjG/sq0OFDFbz7nMstLhQ+dIp8Xi9d468CLmfhJ3S
 JzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=YNFYy1+jmsqBQO7lcTMp/gHxJSfts5yJcN50NMYG+fs=;
 b=pJiAnXl49Kgxy4k1dxIA+/eg2LewDXuOyLDZoO0s78oDwCb+mXT7R5Pu8ZCwUYEkEJ
 EuTrGxrF2NKJGsow8+eH5LtCIyCCAOP9PF2IvHGg/WLAM9xxWi7AI70QcKX229qukCq4
 EtikdhC99NFHbgdKNCBMzbn3FfLzOZfJq30HDu5hPEO2SrXIyDkogpcvnUaYDfOiuAUp
 jOTM8SqbuE8gu+vZy6QIGYDUPk4DDtsHof4/6MgqVO2n3gUDLwyIt5jY442IRwZd7Uce
 ckLCeHe8SYdx7ClfMlSkaTxrqt8gcdId56QDRUlSAa0e2hscB2lSIj4BEKdsfZMTTQ6t
 91dg==
X-Gm-Message-State: AOAM531i+UewGKJiCuuRcmDpSikstzTY8HeoH0IxwfXya5mRNLhfJtW0
 oe2dXDSIDi5DVkNRViiLUS1/aKzwPQ8=
X-Google-Smtp-Source: ABdhPJyjAl1ZN//qPMMBq7QETeyKGI/SZwWnKI6wEDSJDdoQzhMGPo10GE8liTS/z7EOEdoEgtpOrMNJWSM=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:d06:: with SMTP id
 6mr6623588ybn.519.1633745584129; 
 Fri, 08 Oct 2021 19:13:04 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:02 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-10-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 09/43] KVM: Drop obsolete kvm_arch_vcpu_block_finish()
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
X-CRM114-CacheID: sfid-20211008_191305_668263_57E1F573 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

Drop kvm_arch_vcpu_block_finish() now that all arch implementations are
nops.

No functional change intended.

Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h   | 1 -
 arch/mips/include/asm/kvm_host.h    | 1 -
 arch/powerpc/include/asm/kvm_host.h | 1 -
 arch/riscv/include/asm/kvm_host.h   | 1 -
 arch/s390/include/asm/kvm_host.h    | 2 --
 arch/s390/kvm/kvm-s390.c            | 5 -----
 arch/x86/include/asm/kvm_host.h     | 2 --
 virt/kvm/kvm_main.c                 | 1 -
 8 files changed, 14 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 369c30e28301..fe4dec96d1c3 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -716,7 +716,6 @@ void kvm_arm_vcpu_ptrauth_trap(struct kvm_vcpu *vcpu);
 static inline void kvm_arch_hardware_unsetup(void) {}
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
-static inline void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu) {}
 
 void kvm_arm_init_debug(void);
 void kvm_arm_vcpu_init_debug(struct kvm_vcpu *vcpu);
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 696f6b009377..72b90d45a46e 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -897,7 +897,6 @@ static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
 static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
-static inline void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu) {}
 
 #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLB
 int kvm_arch_flush_remote_tlb(struct kvm *kvm);
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 876c10803cda..4a195c161592 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -865,6 +865,5 @@ static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 static inline void kvm_arch_exit(void) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
-static inline void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu) {}
 
 #endif /* __POWERPC_KVM_HOST_H__ */
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index d7e1696cd2ec..b3f0c3773603 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -209,7 +209,6 @@ struct kvm_vcpu_arch {
 static inline void kvm_arch_hardware_unsetup(void) {}
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
-static inline void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu) {}
 
 #define KVM_ARCH_WANT_MMU_NOTIFIER
 
diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
index a604d51acfc8..a22c9266ea05 100644
--- a/arch/s390/include/asm/kvm_host.h
+++ b/arch/s390/include/asm/kvm_host.h
@@ -1010,6 +1010,4 @@ static inline void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
 
-void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu);
-
 #endif
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 08ed68639a21..17fabb260c35 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -5080,11 +5080,6 @@ static inline unsigned long nonhyp_mask(int i)
 	return 0x0000ffffffffffffUL >> (nonhyp_fai << 4);
 }
 
-void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu)
-{
-
-}
-
 static int __init kvm_s390_init(void)
 {
 	int i;
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 88f0326c184a..7aafc27ce7a9 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1926,8 +1926,6 @@ static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
 	static_call_cond(kvm_x86_vcpu_unblocking)(vcpu);
 }
 
-static inline void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu) {}
-
 static inline int kvm_cpu_get_apicid(int mps_cpu)
 {
 #ifdef CONFIG_X86_LOCAL_APIC
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 1292c7876d3f..f90b3ed05628 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3304,7 +3304,6 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 	}
 
 	trace_kvm_vcpu_wakeup(block_ns, waited, vcpu_valid_wakeup(vcpu));
-	kvm_arch_vcpu_block_finish(vcpu);
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_block);
 
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
