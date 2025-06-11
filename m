Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B94C7114A
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 21:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HCJHgKYahHbG7wvRoayIRTCLOT3wfpt3/+l4xsxnbU8=; b=3yb0mW3z+Ml7XIq071ISSV+HPQ
	UCXdCB+IRdLSr2GB5pCM/I28ORmJmWDj8JwEBHmXgB0GCFhf1lqY180ZblMaWahRJBJcc5Cz59vbX
	XQbX0iI49suaYaDyyDV3MQBw7gswhbiCWBaC2seVigkjc2XI5etMdVAJs51te1UOYqCzOQuuWQlNW
	jBwUbT0Sk7iTNb91OWpWRfCs1887azVrcwlknSiXRsT48sGp2EBdI4unWQ5n5IbtwuYuNc9/mqIj9
	ZtsY8MeDBz5XSrLNuOu745ZffKxRLvVOJ1DORUmzSkCPxFFcvk9tuglrCdQA1scjuCCe0B/fkDqPs
	b27sj/jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSoC-0000000BGMs-13XI;
	Wed, 11 Jun 2025 21:16:32 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO8x-0000000AaWb-0g6c
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 16:17:40 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-747cebffd4eso31493b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 09:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749658658; x=1750263458; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MpJGUeTesz/l8nAhHXfIm/2EbAPorpB1pTyUq3Oc96I=;
        b=R1N594d9kLUvGQYcHS0+FpUhSwj1MP0uHc/uNy6AAEcz8Y64U41/Y0XfI2n2iMkaot
         Cr5t3IinxaPEkhrA7b6q0O2ooFL+FjdwnSDr6XEaKp19E1WuTTgfJUqC8+x0hyjTuhCP
         fT5l0l7ckMdDk2IqWo/bNKMoRMoeT3+cMSxsqnIQtV7qphSGXcLjH2xhPwbbEuzvOYhW
         dpZfgXEB8yQ2ir4cNkjOUWU+Vi/yYLUuGvB2BPcOiROfgfIp3vxs0KmCZrNO912B0S2J
         E46+NNHvfLdNmPNR4KBR1mHjL8X0GH9/tl0wIJGJL7n/22DdMvdPLYKBn9DPisQ1JwM6
         kT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658658; x=1750263458;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MpJGUeTesz/l8nAhHXfIm/2EbAPorpB1pTyUq3Oc96I=;
        b=JWGzUzW+eA0jCTQvWj5Vu0zv0TK+OQqVMXEzhhVickXhYLPRb8yvjfwR8KqUEflcS5
         +R8tflF2RujYcBpNPBdOTZEK5jqj0Ube4wITHJZ6Dihfl7owwHAd9vY21AvgyC218Dvk
         RtpLQF5jhLl+1izOcWUqFE2nRUN84T/y8NIpb7+nUL2ErKTzEJGKbqAKkLuLmQZbPRdL
         W1iLjOq/pYdTeTC77kPtZMC2iGXrS0S5BseFA3Pv0abbkk7Fdv2ocBRNuXB7zqtiiUVd
         V7/JPVJcZE9o7gFzh7qll1ttiTkcAD7odU+db0W5vtER/SsKIGT52/FB1GeXHCdjX/0/
         jNfg==
X-Forwarded-Encrypted: i=1; AJvYcCVefOpqGaRLgckDJuPN3tsJcaoJfmtfDNjh7jWdxlHI/tr6JCIe6NmXrRIb0pmbz1vHh6gSYkqYMLg6Hg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxig6u1BLbnNOCJEm0AEG9EKBGLWjSLNEx3eGhipDyGf7Z6nIAs
	U9Un/DZmnvxNKf2QBAbtvdpHq31Si2b9ZsUZIQipV3ZIaM6GFPvLL/y0zKcUM5JukR/OmXS3JBo
	fJZbCdQ==
X-Google-Smtp-Source: AGHT+IEE1WF66pnelIfSWLSMIyF7MtrTE54yB8mYQCiFsPGAZljIgFV7YexNu7FxtzcN7V0+Una/H9ks4tg=
X-Received: from pfkq5.prod.google.com ([2002:a05:6a00:845:b0:739:8cd6:c16c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6d8a:b0:216:1476:f71
 with SMTP id adf61e73a8af0-21f86746b8fmr5941037637.39.1749658657728; Wed, 11
 Jun 2025 09:17:37 -0700 (PDT)
Date: Wed, 11 Jun 2025 09:17:36 -0700
In-Reply-To: <20250611-352bef23df9a4ec55fe5cb68@orel>
Mime-Version: 1.0
References: <50989f0a02790f9d7dc804c2ade6387c4e7fbdbc.1749634392.git.zhouquan@iscas.ac.cn>
 <20250611-352bef23df9a4ec55fe5cb68@orel>
Message-ID: <aEmsIOuz3bLwjBW_@google.com>
Subject: Re: [PATCH] RISC-V: KVM: Avoid re-acquiring memslot in kvm_riscv_gstage_map()
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: zhouquan@iscas.ac.cn, anup@brainfault.org, atishp@atishpatra.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_091739_206648_74FA606E 
X-CRM114-Status: GOOD (  33.92  )
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

On Wed, Jun 11, 2025, Andrew Jones wrote:
> On Wed, Jun 11, 2025 at 05:51:40PM +0800, zhouquan@iscas.ac.cn wrote:
> > From: Quan Zhou <zhouquan@iscas.ac.cn>
> > 
> > The caller has already passed in the memslot, and there are
> > two instances `{kvm_faultin_pfn/mark_page_dirty}` of retrieving
> > the memslot again in `kvm_riscv_gstage_map`, we can replace them
> > with `{__kvm_faultin_pfn/mark_page_dirty_in_slot}`.
> > 
> > Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> > ---
> >  arch/riscv/kvm/mmu.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> > index 1087ea74567b..f9059dac3ba3 100644
> > --- a/arch/riscv/kvm/mmu.c
> > +++ b/arch/riscv/kvm/mmu.c
> > @@ -648,7 +648,8 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
> >  		return -EFAULT;
> >  	}
> >  
> > -	hfn = kvm_faultin_pfn(vcpu, gfn, is_write, &writable, &page);
> > +	hfn = __kvm_faultin_pfn(memslot, gfn, is_write ? FOLL_WRITE : 0,
> > +				&writable, &page);
> 
> I think introducing another function with the following diff would be
> better than duplicating the is_write to foll translation.

NAK, I don't want an explosion of wrapper APIs (especially with boolean params).

I 100% agree that it's mildly annoying to force arch code to do convert "write"
to FOLL_WRITE, but that's a symptom of KVM not providing a common structure for
passing page fault information.

What I want to get to is a set of APIs that look something the below (very off
the cuff), not add more wrappers and put KVM back in a situation where there are
a bajillion ways to do the same basic thing.

struct kvm_page_fault {
	const gpa_t addr;
	const bool exec;
	const bool write;
	const bool present;

	gfn_t gfn;

	/* The memslot containing gfn. May be NULL. */
	struct kvm_memory_slot *slot;

	/* Outputs */
	unsigned long mmu_seq;
	kvm_pfn_t pfn;
	struct page *refcounted_page;
	bool map_writable;
};

kvm_pfn_t __kvm_faultin_pfn(struct kvm_page_fault *fault, unsigned int flags)
{
	struct kvm_follow_pfn kfp = {
		.slot = fault->slot,
		.gfn = fault->gfn,
		.flags = flags | fault->write ? FOLL_WRITE : 0,
		.map_writable = &fault->writable,
		.refcounted_page = &fault->refcounted_page,
	};

	fault->writable = false;
	fault->refcounted_page = NULL;

	return kvm_follow_pfn(&kfp);
}
EXPORT_SYMBOL_GPL(__kvm_faultin_pfn);

kvm_pfn_t kvm_faultin_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, bool write,
			  bool *writable, struct page **refcounted_page)
{
	struct kvm_follow_pfn kfp = {
		.slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn),,
		.gfn = gfn,
		.flags = write ? FOLL_WRITE : 0,
		.map_writable = writable,
		.refcounted_page = refcounted_page,
	};

	if (WARN_ON_ONCE(!writable || !refcounted_page))
		return KVM_PFN_ERR_FAULT;

	*writable = false;
	*refcounted_page = NULL;

	return kvm_follow_pfn(&kfp);
}
EXPORT_SYMBOL_GPL(__kvm_faultin_pfn);


To get things started, I proposed moving "struct kvm_page_fault" to common code
so that it can be shared by x86 and arm64 as part of the KVM userfault series.
But I'd be more than happy to acclerate the standardization of "struct kvm_page_fault"
if we want to get there sooner than later.

[*] https://lore.kernel.org/all/aBqlkz1bqhu-9toV@google.com

In the meantime, RISC-V can start preparing for that future, and clean up its
code in the process.

E.g. "fault_addr" should be "gpa_t", not "unsigned long".  If 32-bit RISC-V
is strictly limited to 32-bit _physical_ addresses in the *architecture*, then
gpa_t should probably be tweaked accordingly.

And vma_pageshift should be "unsigned int", not "short".

Looks like y'all also have a bug where an -EEXIST will be returned to userspace,
and will generate what's probably a spurious kvm_err() message.

E.g. in the short term:

---
 arch/riscv/include/asm/kvm_host.h |  5 ++--
 arch/riscv/kvm/mmu.c              | 49 +++++++++++++++++++++----------
 arch/riscv/kvm/vcpu_exit.c        | 40 +------------------------
 3 files changed, 36 insertions(+), 58 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 85cfebc32e4c..84c5db715ba5 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -361,9 +361,8 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
 			     bool writable, bool in_atomic);
 void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa,
 			      unsigned long size);
-int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
-			 struct kvm_memory_slot *memslot,
-			 gpa_t gpa, unsigned long hva, bool is_write);
+int kvm_riscv_gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				struct kvm_cpu_trap *trap);
 int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm);
 void kvm_riscv_gstage_free_pgd(struct kvm *kvm);
 void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1087ea74567b..3b0afc1c0832 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -586,22 +586,37 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	return pte_young(ptep_get(ptep));
 }
 
-int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
-			 struct kvm_memory_slot *memslot,
-			 gpa_t gpa, unsigned long hva, bool is_write)
+int kvm_riscv_gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				struct kvm_cpu_trap *trap)
 {
-	int ret;
-	kvm_pfn_t hfn;
-	bool writable;
-	short vma_pageshift;
+
+	struct kvm_mmu_memory_cache *pcache = &vcpu->arch.mmu_page_cache;
+	gpa_t gpa = (trap->htval << 2) | (trap->stval & 0x3);
 	gfn_t gfn = gpa >> PAGE_SHIFT;
-	struct vm_area_struct *vma;
+	struct kvm_memory_slot *memslot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
+	bool logging = memslot->dirty_bitmap && !(memslot->flags & KVM_MEM_READONLY);
+	bool write = trap->scause == EXC_STORE_GUEST_PAGE_FAULT;
+	bool read =  trap->scause == EXC_LOAD_GUEST_PAGE_FAULT;
+	unsigned int flags = write ? FOLL_WRITE : 0;
+	unsigned long hva, vma_pagesize, mmu_seq;
 	struct kvm *kvm = vcpu->kvm;
-	struct kvm_mmu_memory_cache *pcache = &vcpu->arch.mmu_page_cache;
-	bool logging = (memslot->dirty_bitmap &&
-			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
-	unsigned long vma_pagesize, mmu_seq;
+	unsigned int vma_pageshift;
+	struct vm_area_struct *vma;
 	struct page *page;
+	kvm_pfn_t hfn;
+	bool writable;
+	int ret;
+
+	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
+	if (kvm_is_error_hva(hva) || (write && !writable)) {
+		if (read)
+			return kvm_riscv_vcpu_mmio_load(vcpu, run, gpa,
+							trap->htinst);
+		if (write)
+			return kvm_riscv_vcpu_mmio_store(vcpu, run, gpa,
+							 trap->htinst);
+		return -EOPNOTSUPP;
+	}
 
 	/* We need minimum second+third level pages */
 	ret = kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
@@ -648,7 +663,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		return -EFAULT;
 	}
 
-	hfn = kvm_faultin_pfn(vcpu, gfn, is_write, &writable, &page);
+	hfn = __kvm_faultin_pfn(memslot, gfn, flags, &writable, &page);
 	if (hfn == KVM_PFN_ERR_HWPOISON) {
 		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
 				vma_pageshift, current);
@@ -661,7 +676,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 	 * If logging is active then we allow writable pages only
 	 * for write faults.
 	 */
-	if (logging && !is_write)
+	if (logging && !write)
 		writable = false;
 
 	spin_lock(&kvm->mmu_lock);
@@ -677,14 +692,16 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
 				      vma_pagesize, true, true);
 	}
+	if (ret == -EEXIST)
+		ret = 0;
 
 	if (ret)
 		kvm_err("Failed to map in G-stage\n");
 
 out_unlock:
-	kvm_release_faultin_page(kvm, page, ret && ret != -EEXIST, writable);
+	kvm_release_faultin_page(kvm, page, ret, writable);
 	spin_unlock(&kvm->mmu_lock);
-	return ret;
+	return ret ? ret : 1;
 }
 
 int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm)
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 6e0c18412795..6f07077068f6 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -10,44 +10,6 @@
 #include <asm/csr.h>
 #include <asm/insn-def.h>
 
-static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
-			     struct kvm_cpu_trap *trap)
-{
-	struct kvm_memory_slot *memslot;
-	unsigned long hva, fault_addr;
-	bool writable;
-	gfn_t gfn;
-	int ret;
-
-	fault_addr = (trap->htval << 2) | (trap->stval & 0x3);
-	gfn = fault_addr >> PAGE_SHIFT;
-	memslot = gfn_to_memslot(vcpu->kvm, gfn);
-	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
-
-	if (kvm_is_error_hva(hva) ||
-	    (trap->scause == EXC_STORE_GUEST_PAGE_FAULT && !writable)) {
-		switch (trap->scause) {
-		case EXC_LOAD_GUEST_PAGE_FAULT:
-			return kvm_riscv_vcpu_mmio_load(vcpu, run,
-							fault_addr,
-							trap->htinst);
-		case EXC_STORE_GUEST_PAGE_FAULT:
-			return kvm_riscv_vcpu_mmio_store(vcpu, run,
-							 fault_addr,
-							 trap->htinst);
-		default:
-			return -EOPNOTSUPP;
-		};
-	}
-
-	ret = kvm_riscv_gstage_map(vcpu, memslot, fault_addr, hva,
-		(trap->scause == EXC_STORE_GUEST_PAGE_FAULT) ? true : false);
-	if (ret < 0)
-		return ret;
-
-	return 1;
-}
-
 /**
  * kvm_riscv_vcpu_unpriv_read -- Read machine word from Guest memory
  *
@@ -229,7 +191,7 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case EXC_LOAD_GUEST_PAGE_FAULT:
 	case EXC_STORE_GUEST_PAGE_FAULT:
 		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
-			ret = gstage_page_fault(vcpu, run, trap);
+			ret = kvm_riscv_gstage_page_fault(vcpu, run, trap);
 		break;
 	case EXC_SUPERVISOR_SYSCALL:
 		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
