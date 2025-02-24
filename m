Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53212C021A4
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 01:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cxGZG873RvRBRX3r8K2sAM1eLmk7tYeV/vzyPGg2KhA=; b=a4tsgYkrqhVVQz
	CCB79sCN4XNS/Sy9PbO9mgw268F91EKw+kSwu8LI8ol0Uez7GB6zs0MzgNWumvOZ4kQ3QOk7c7LPf
	rAioiFKJdpZbSjLswRfz80Qopv8FFscTpFtGV7+jnuusTonoxxTUoTtll+Bp+8pttqvSOWcXOQzOR
	qAYJFpexjVKN8K/vqFHTqRXzKh+e1/PWw3PkM+c8bEJyG+J6O4+8MxLo4Zr4BatZLTEQZGrPjdZIt
	uSXRXBwZRFJUCYLbB1Y7u8Kvqs110H+tdOM4ydDwBS0IsWj14FNvEDcZ01a6jKwYSm72DHILGb93G
	7OKACVQJ2vd0WDkWWQLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmjQN-0000000Ffqh-47hO;
	Tue, 25 Feb 2025 01:07:51 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiIl-0000000FXzZ-2fy1
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 23:55:56 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2fc318bd470so9642248a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 15:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740441354; x=1741046154; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gY5t+lA+xCJMUFRKRfvQdv+q8kOSitFuxy9rKD2JbVY=;
        b=SwHhvmVURHEBYb0AlTMUo7qSoD0lRa83VnCHy0sTJBto6wKQWRalnhvAqrBHnAi4T6
         wU1If8AEd/f670hPBsZmQEXnheEMxKrLoFN4VYdPMlwFEP5Kc76yvS3WzR1uX6651Ur9
         +Ci8H0r87d05WqB+3y2YIviqSFuuQqybSqO3H30jw9lTfPcnqwIKYpMpj2X8YpctvPYV
         Oz7BYzutWTHi7ZYctm8pAKL3CARWOZ2PBPkG6fVufLXmnr8jlKWbMQb0QtAj95UJRE7J
         34+V9mDiXl++dMdd56qxXs52aSX+5XWM8l9bRwfb+OqGsPJz4rOSZPTrLmsyVca1zcrg
         5pBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740441354; x=1741046154;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gY5t+lA+xCJMUFRKRfvQdv+q8kOSitFuxy9rKD2JbVY=;
        b=a9ShkcZ4zVBgpn90sAaRscktrxyb5zZ40VIWWunQwaFNBlcMlYVVKlj+SxwTxCkrVk
         Cuiy6wCjecj3tQVXUrs8Su0qj+IH58Dsvmtm1ZdzVypMHCR/IiPYyMd9yfymrK6PxMCI
         1PSHp8KHIhhG0GqKqXKydl6NPQ2BIJrvKlA8uAbHS3mGmHG0kDWAoF+wTN6nyhkrs0ZE
         3kRRna4zRiUoXiBy0Oxs1sWrNTPGrJ2xvpefx2mt3jbt1xuSORvz0fP3siTktOnZOQ3c
         yRooYESMUSztmHTNV2H5q6Rzhv5oJpoFZNa2xwclEH3N3OIWQ7hAQe09osdSCacaPT+t
         pkQg==
X-Forwarded-Encrypted: i=1; AJvYcCVQRA6FLoXiJoUY4ybJwQhxn+hDkOL/O7SyfLVT68j5GIzLlzY6RmTM7Q3iUqtkZIUWm8xJx46bA1/f4A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6B2D/4hfKxb6pin/89cJURvWbWQKmf/MDfIVjdZFwsQdHnH4A
	UyQRMbYA55rp4k/ugC4fq9sYiWgoXGDAGFaPoAhQQOOnDofFFpse5NW9af0Pcy9KWoDJwJm6bXz
	YLQ==
X-Google-Smtp-Source: AGHT+IG7Oktdw38sVEoOW4Tvh6JQ9psvOsFz+B6sIudCx6XDJiW/lrg1jUS4SL5IEqUCfnyPdnnvHXtLVtU=
X-Received: from pfbgc10.prod.google.com ([2002:a05:6a00:62ca:b0:730:7648:7a74])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a27:b0:1ee:d6a7:e332
 with SMTP id adf61e73a8af0-1eef3d5aabamr27634032637.26.1740441354199; Mon, 24
 Feb 2025 15:55:54 -0800 (PST)
Date: Mon, 24 Feb 2025 15:55:40 -0800
In-Reply-To: <20250224235542.2562848-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250224235542.2562848-6-seanjc@google.com>
Subject: [PATCH 5/7] KVM: x86: Unload MMUs during vCPU destruction, not before
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_155555_749212_A50B0307 
X-CRM114-Status: GOOD (  11.32  )
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

When destroying a VM, unload a vCPU's MMUs as part of normal vCPU freeing,
instead of as a separate prepratory action.  Unloading MMUs ahead of time
is a holdover from commit 7b53aa565084 ("KVM: Fix vcpu freeing for guest
smp"), which "fixed" a rather egregious flaw where KVM would attempt to
free *all* MMU pages when destroying a vCPU.

At the time, KVM would spin on all MMU pages in a VM when free a single
vCPU, and so would hang due to the way KVM pins and zaps root pages
(roots are invalidated but not freed if they are pinned by a vCPU).

  static void free_mmu_pages(struct kvm_vcpu *vcpu)
  {
        struct kvm_mmu_page *page;

        while (!list_empty(&vcpu->kvm->active_mmu_pages)) {
                page = container_of(vcpu->kvm->active_mmu_pages.next,
                                    struct kvm_mmu_page, link);
                kvm_mmu_zap_page(vcpu->kvm, page);
        }
        free_page((unsigned long)vcpu->mmu.pae_root);
  }

Now that KVM doesn't try to free all MMU pages when destroying a single
vCPU, there's no need to unpin roots prior to destroying a vCPU.

Note!  While KVM mostly destroys all MMUs before calling
kvm_arch_destroy_vm() (see commit f00be0cae4e6 ("KVM: MMU: do not free
active mmu pages in free_mmu_pages()")), unpinning MMU roots during vCPU
destruction will unfortunately trigger remote TLB flushes, i.e. will try
to send requests to all vCPUs.

Happily, thanks to commit 27592ae8dbe4 ("KVM: Move wiping of the kvm->vcpus
array to common code"), that's a non-issue as freed vCPUs are naturally
skipped by xa_for_each_range(), i.e. by kvm_for_each_vcpu().  Prior to that
commit, KVM x86 rather stupidly freed vCPUs one-by-one, and _then_
nullified them, one-by-one.  I.e. triggering a VM-wide request would hit a
use-after-free.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 9978ed4c0917..a61dbd1f0d01 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12374,6 +12374,9 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 {
 	int idx;
 
+	kvm_clear_async_pf_completion_queue(vcpu);
+	kvm_mmu_unload(vcpu);
+
 	kvmclock_reset(vcpu);
 
 	kvm_x86_call(vcpu_free)(vcpu);
@@ -12767,17 +12770,6 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	return ret;
 }
 
-static void kvm_unload_vcpu_mmus(struct kvm *kvm)
-{
-	unsigned long i;
-	struct kvm_vcpu *vcpu;
-
-	kvm_for_each_vcpu(i, vcpu, kvm) {
-		kvm_clear_async_pf_completion_queue(vcpu);
-		kvm_mmu_unload(vcpu);
-	}
-}
-
 void kvm_arch_sync_events(struct kvm *kvm)
 {
 	cancel_delayed_work_sync(&kvm->arch.kvmclock_sync_work);
@@ -12882,7 +12874,6 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 		__x86_set_memory_region(kvm, TSS_PRIVATE_MEMSLOT, 0, 0);
 		mutex_unlock(&kvm->slots_lock);
 	}
-	kvm_unload_vcpu_mmus(kvm);
 	kvm_destroy_vcpus(kvm);
 	kvm_x86_call(vm_destroy)(kvm);
 	kvm_free_msr_filter(srcu_dereference_check(kvm->arch.msr_filter, &kvm->srcu, 1));
-- 
2.48.1.658.g4767266eb4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
