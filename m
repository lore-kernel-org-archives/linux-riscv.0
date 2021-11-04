Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FA0C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:31:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1547E60FC2
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1547E60FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tqkMovtrORHbzekW/pw8Y3IntZdGfBWWupfB4sRXZtc=; b=gcoPLSsg/n6kuV
	3mx76KsHQVGSsJcmiX+v6aQbNaT76ZLZTmPHH99YNZ05DeaHtPLRQKLA8QYQWgOTZTwGc54A2g/yw
	EPDi38axjKrC1uEPmm4qoBEXtfgKdJviYKMmq1CTbsYQ0bWklFmCXiMF0rnqSp9ZgBWVDV9U8M6aV
	t2y++jKjMZ6ue6pIhzQTdqbru8eOY9s3jdF4DvXfFeJDtSQMOxE0yMmm0zZQmhnDgAyU8eiLpWJl8
	g7ZTxqnYNVmmYBiqXKgHU3YdBGnufVXHuH/RjPo9atf2j8AoDzDSL3fCILCt0/AjPWuMaW4utDyRc
	0w1O1Bmxy3Fl+aq8Zk0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQeo-007FPT-Qo; Thu, 04 Nov 2021 00:31:06 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQa3-007CcJ-JJ
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:14 +0000
Received: by mail-pf1-x44a.google.com with SMTP id
 f18-20020aa79d92000000b0048118561271so2320243pfq.21
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=uOj9MASDMyqaD09CBvQ7SzGDpItQArWAxGfhYMIUqmI=;
 b=E4RZpau9+nQn9+/n2RPOrlq7PvXpj7MG17o7n/BfHN1YYghuZgPxkY/A4mPyL4uQB1
 OTGg4p9vl7mk39A/YPmXPTB+1TX2BqR/VJTrf6MR6dlMXOVdFEc2D2DnzVhcp+c1miB9
 +4Mf4pRkU/EMkg3/RPSq3IrSQ+bsFFzeMA05CDAi//Bk9y5v/LlxHdKSBePEDVdG6P4y
 pE5btkxCowCg99D6M05INgKguiJHSnvf3qeMReSJWqSZN/DhWv8TDKnnVJhuqjSfx4lj
 79ZFqvoySZzmjQmlK9lY+IaH7vpqEEoiSTle4MYRv10ShZmDqKBGgw1XVolC/qkDVszH
 I77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=uOj9MASDMyqaD09CBvQ7SzGDpItQArWAxGfhYMIUqmI=;
 b=XtaaPdv7Ipwm9dM0QVRrGeMOQdvLmm/SzF5ahPJsFxpjiJjmQFowTKs4/iDJ+lYBbw
 Juz9rJbL5ZGvodo9Rr9mQjTx9+LfKrFhK+Gh+s8W3F6ziqaLkTMMQ3VHBYkf0hNN2Ai+
 8HQgYuVydFvQWLsR88xw1LZ+7RWF4kus2sqbstg1ydvulRYwqNkiAJrOjYSmNBfrpgpe
 IZRM3JzXCiox6NQoQrKCU1rNi/j9iED17VWovrG2I0yr+ZWWxx/GotMaxyRwUsmTUwsX
 6yTmzMzTxfhvb+UXLqUT62LUT9ZTd8JnbzGX4A75zJQSx+WHb8QTXrBd2RcP71wHXieT
 9mlA==
X-Gm-Message-State: AOAM532qNJOaUK72b2ZXL7kDVxC3+kzMEdlCB2+5y8Hebpge0HROJLxw
 ViW985tsWP7rsdGFVCIB7oPgFGTi3do=
X-Google-Smtp-Source: ABdhPJziJOkwY/+7Zk3EBcubkrBrhImOClMzbCgTtTc18W0CvhysXNGGt481m/GlPLefrB8WbPeog+gR4I0=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:10d2:b0:44d:f03e:46c7
 with SMTP id
 d18-20020a056a0010d200b0044df03e46c7mr47982150pfu.0.1635985570053; Wed, 03
 Nov 2021 17:26:10 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:08 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-8-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 07/30] KVM: Let/force architectures to deal with arch
 specific memslot data
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
 linux-kernel@vger.kernel.org, Ben Gardon <bgardon@google.com>, 
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_172611_672952_1B69B975 
X-CRM114-Status: GOOD (  17.73  )
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

Pass the "old" slot to kvm_arch_prepare_memory_region() and force arch
code to handle propagating arch specific data from "new" to "old" when
necessary.  This is a baby step towards dynamically allocating "new" from
the get go, and is a (very) minor performance boost on x86 due to not
unnecessarily copying arch data.

For PPC HV, copy the rmap in the !CREATE and !DELETE paths, i.e. for MOVE
and FLAGS_ONLY.  This is functionally a nop as the previous behavior
would overwrite the pointer for CREATE, and eventually discard/ignore it
for DELETE.

For x86, copy the arch data only for FLAGS_ONLY changes.  Unlike PPC HV,
x86 needs to reallocate arch data in the MOVE case as the size of x86's
allocations depend on the alignment of the memslot's gfn.

Opportunistically tweak kvm_arch_prepare_memory_region()'s param order to
match the "commit" prototype.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c               |  7 ++++---
 arch/mips/kvm/mips.c               |  3 ++-
 arch/powerpc/include/asm/kvm_ppc.h | 18 ++++++++++--------
 arch/powerpc/kvm/book3s.c          | 12 ++++++------
 arch/powerpc/kvm/book3s_hv.c       | 17 ++++++++++-------
 arch/powerpc/kvm/book3s_pr.c       | 17 +++++++++--------
 arch/powerpc/kvm/booke.c           |  5 +++--
 arch/powerpc/kvm/powerpc.c         |  5 +++--
 arch/s390/kvm/kvm-s390.c           |  3 ++-
 arch/x86/kvm/x86.c                 | 15 +++++++++++----
 include/linux/kvm_host.h           |  3 ++-
 virt/kvm/kvm_main.c                |  5 +----
 12 files changed, 63 insertions(+), 47 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 69bd1732a299..cc41eadfbbf4 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1486,8 +1486,9 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 }
 
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				   struct kvm_memory_slot *memslot,
 				   const struct kvm_userspace_memory_region *mem,
+				   const struct kvm_memory_slot *old,
+				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
 {
 	hva_t hva = mem->userspace_addr;
@@ -1502,7 +1503,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	 * Prevent userspace from creating a memory region outside of the IPA
 	 * space addressable by the KVM guest IPA space.
 	 */
-	if ((memslot->base_gfn + memslot->npages) > (kvm_phys_size(kvm) >> PAGE_SHIFT))
+	if ((new->base_gfn + new->npages) > (kvm_phys_size(kvm) >> PAGE_SHIFT))
 		return -EFAULT;
 
 	mmap_read_lock(current->mm);
@@ -1536,7 +1537,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 
 		if (vma->vm_flags & VM_PFNMAP) {
 			/* IO region dirty page logging not allowed */
-			if (memslot->flags & KVM_MEM_LOG_DIRTY_PAGES) {
+			if (new->flags & KVM_MEM_LOG_DIRTY_PAGES) {
 				ret = -EINVAL;
 				break;
 			}
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 562aa878b266..8c94cd4093af 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -233,8 +233,9 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 }
 
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				   struct kvm_memory_slot *memslot,
 				   const struct kvm_userspace_memory_region *mem,
+				   const struct kvm_memory_slot *old,
+				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
 {
 	return 0;
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 671fbd1a765e..b01760dd1374 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -200,12 +200,13 @@ extern void kvmppc_core_destroy_vm(struct kvm *kvm);
 extern void kvmppc_core_free_memslot(struct kvm *kvm,
 				     struct kvm_memory_slot *slot);
 extern int kvmppc_core_prepare_memory_region(struct kvm *kvm,
-				struct kvm_memory_slot *memslot,
-				const struct kvm_userspace_memory_region *mem,
-				enum kvm_mr_change change);
-extern void kvmppc_core_commit_memory_region(struct kvm *kvm,
 				const struct kvm_userspace_memory_region *mem,
 				const struct kvm_memory_slot *old,
+				struct kvm_memory_slot *new,
+				enum kvm_mr_change change);
+extern void kvmppc_core_commit_memory_region(struct kvm *kvm,
+				const struct kvm_userspace_memory_region *mem,
+				struct kvm_memory_slot *old,
 				const struct kvm_memory_slot *new,
 				enum kvm_mr_change change);
 extern int kvm_vm_ioctl_get_smmu_info(struct kvm *kvm,
@@ -274,12 +275,13 @@ struct kvmppc_ops {
 	int (*get_dirty_log)(struct kvm *kvm, struct kvm_dirty_log *log);
 	void (*flush_memslot)(struct kvm *kvm, struct kvm_memory_slot *memslot);
 	int (*prepare_memory_region)(struct kvm *kvm,
-				     struct kvm_memory_slot *memslot,
-				     const struct kvm_userspace_memory_region *mem,
-				     enum kvm_mr_change change);
-	void (*commit_memory_region)(struct kvm *kvm,
 				     const struct kvm_userspace_memory_region *mem,
 				     const struct kvm_memory_slot *old,
+				     struct kvm_memory_slot *new,
+				     enum kvm_mr_change change);
+	void (*commit_memory_region)(struct kvm *kvm,
+				     const struct kvm_userspace_memory_region *mem,
+				     struct kvm_memory_slot *old,
 				     const struct kvm_memory_slot *new,
 				     enum kvm_mr_change change);
 	bool (*unmap_gfn_range)(struct kvm *kvm, struct kvm_gfn_range *range);
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index b785f6772391..8250e8308674 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -847,17 +847,17 @@ void kvmppc_core_flush_memslot(struct kvm *kvm, struct kvm_memory_slot *memslot)
 }
 
 int kvmppc_core_prepare_memory_region(struct kvm *kvm,
-				struct kvm_memory_slot *memslot,
-				const struct kvm_userspace_memory_region *mem,
-				enum kvm_mr_change change)
+				      const struct kvm_userspace_memory_region *mem,
+				      const struct kvm_memory_slot *old,
+				      struct kvm_memory_slot *new,
+				      enum kvm_mr_change change)
 {
-	return kvm->arch.kvm_ops->prepare_memory_region(kvm, memslot, mem,
-							change);
+	return kvm->arch.kvm_ops->prepare_memory_region(kvm, mem, old, new, change);
 }
 
 void kvmppc_core_commit_memory_region(struct kvm *kvm,
 				const struct kvm_userspace_memory_region *mem,
-				const struct kvm_memory_slot *old,
+				struct kvm_memory_slot *old,
 				const struct kvm_memory_slot *new,
 				enum kvm_mr_change change)
 {
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 2acb1c96cfaf..5bf763a74c22 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4828,17 +4828,20 @@ static void kvmppc_core_free_memslot_hv(struct kvm_memory_slot *slot)
 }
 
 static int kvmppc_core_prepare_memory_region_hv(struct kvm *kvm,
-					struct kvm_memory_slot *slot,
-					const struct kvm_userspace_memory_region *mem,
-					enum kvm_mr_change change)
+				const struct kvm_userspace_memory_region *mem,
+				const struct kvm_memory_slot *old,
+				struct kvm_memory_slot *new,
+				enum kvm_mr_change change)
 {
 	unsigned long npages = mem->memory_size >> PAGE_SHIFT;
 
 	if (change == KVM_MR_CREATE) {
-		slot->arch.rmap = vzalloc(array_size(npages,
-					  sizeof(*slot->arch.rmap)));
-		if (!slot->arch.rmap)
+		new->arch.rmap = vzalloc(array_size(npages,
+					  sizeof(*new->arch.rmap)));
+		if (!new->arch.rmap)
 			return -ENOMEM;
+	} else if (change != KVM_MR_DELETE) {
+		new->arch.rmap = old->arch.rmap;
 	}
 
 	return 0;
@@ -4846,7 +4849,7 @@ static int kvmppc_core_prepare_memory_region_hv(struct kvm *kvm,
 
 static void kvmppc_core_commit_memory_region_hv(struct kvm *kvm,
 				const struct kvm_userspace_memory_region *mem,
-				const struct kvm_memory_slot *old,
+				struct kvm_memory_slot *old,
 				const struct kvm_memory_slot *new,
 				enum kvm_mr_change change)
 {
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 6bc9425acb32..58d3ae4605c0 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -1899,16 +1899,17 @@ static void kvmppc_core_flush_memslot_pr(struct kvm *kvm,
 }
 
 static int kvmppc_core_prepare_memory_region_pr(struct kvm *kvm,
-					struct kvm_memory_slot *memslot,
-					const struct kvm_userspace_memory_region *mem,
-					enum kvm_mr_change change)
-{
-	return 0;
-}
-
-static void kvmppc_core_commit_memory_region_pr(struct kvm *kvm,
 				const struct kvm_userspace_memory_region *mem,
 				const struct kvm_memory_slot *old,
+				struct kvm_memory_slot *new,
+				enum kvm_mr_change change)
+{
+	return 0;
+}
+
+static void kvmppc_core_commit_memory_region_pr(struct kvm *kvm,
+				const struct kvm_userspace_memory_region *mem,
+				struct kvm_memory_slot *old,
 				const struct kvm_memory_slot *new,
 				enum kvm_mr_change change)
 {
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 977801c83aff..fcf9c1dbd442 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -1807,8 +1807,9 @@ void kvmppc_core_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
 }
 
 int kvmppc_core_prepare_memory_region(struct kvm *kvm,
-				      struct kvm_memory_slot *memslot,
 				      const struct kvm_userspace_memory_region *mem,
+				      const struct kvm_memory_slot *old,
+				      struct kvm_memory_slot *new,
 				      enum kvm_mr_change change)
 {
 	return 0;
@@ -1816,7 +1817,7 @@ int kvmppc_core_prepare_memory_region(struct kvm *kvm,
 
 void kvmppc_core_commit_memory_region(struct kvm *kvm,
 				const struct kvm_userspace_memory_region *mem,
-				const struct kvm_memory_slot *old,
+				struct kvm_memory_slot *old,
 				const struct kvm_memory_slot *new,
 				enum kvm_mr_change change)
 {
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 8ab90ce8738f..ca28e7acaae8 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -706,11 +706,12 @@ void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
 }
 
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				   struct kvm_memory_slot *memslot,
 				   const struct kvm_userspace_memory_region *mem,
+				   const struct kvm_memory_slot *old,
+				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
 {
-	return kvmppc_core_prepare_memory_region(kvm, memslot, mem, change);
+	return kvmppc_core_prepare_memory_region(kvm, mem, old, new, change);
 }
 
 void kvm_arch_commit_memory_region(struct kvm *kvm,
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 6a6dd5e1daf6..d766d764d24c 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -5016,8 +5016,9 @@ vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
 
 /* Section: memory related */
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				   struct kvm_memory_slot *memslot,
 				   const struct kvm_userspace_memory_region *mem,
+				   const struct kvm_memory_slot *old,
+				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
 {
 	/* A few sanity checks. We can have memory slots which have to be
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ac83d873d65b..aa2abca47af0 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11727,13 +11727,20 @@ void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen)
 }
 
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				struct kvm_memory_slot *memslot,
-				const struct kvm_userspace_memory_region *mem,
-				enum kvm_mr_change change)
+				   const struct kvm_userspace_memory_region *mem,
+				   const struct kvm_memory_slot *old,
+				   struct kvm_memory_slot *new,
+				   enum kvm_mr_change change)
 {
 	if (change == KVM_MR_CREATE || change == KVM_MR_MOVE)
-		return kvm_alloc_memslot_metadata(kvm, memslot,
+		return kvm_alloc_memslot_metadata(kvm, new,
 						  mem->memory_size >> PAGE_SHIFT);
+
+	if (change == KVM_MR_FLAGS_ONLY)
+		memcpy(&new->arch, &old->arch, sizeof(old->arch));
+	else if (WARN_ON_ONCE(change != KVM_MR_DELETE))
+		return -EIO;
+
 	return 0;
 }
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d8e92d4a78d8..f8e79cf7584f 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -826,8 +826,9 @@ int __kvm_set_memory_region(struct kvm *kvm,
 void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot);
 void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen);
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				struct kvm_memory_slot *memslot,
 				const struct kvm_userspace_memory_region *mem,
+				const struct kvm_memory_slot *old,
+				struct kvm_memory_slot *new,
 				enum kvm_mr_change change);
 void kvm_arch_commit_memory_region(struct kvm *kvm,
 				const struct kvm_userspace_memory_region *mem,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 39a64e02a43a..389243120435 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1621,10 +1621,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 		old.as_id = new->as_id;
 	}
 
-	/* Copy the arch-specific data, again after (re)acquiring slots_arch_lock. */
-	memcpy(&new->arch, &old.arch, sizeof(old.arch));
-
-	r = kvm_arch_prepare_memory_region(kvm, new, mem, change);
+	r = kvm_arch_prepare_memory_region(kvm, mem, &old, new, change);
 	if (r)
 		goto out_slots;
 
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
