Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B18C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:36:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F795611CE
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F795611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4HxpBB3phTGWZqGidMDPGpcg2pm9tjYVjQS2ic6Jbg=; b=ha7epXK+y8Q3cc
	nlqEPjZQqNPRiEGHBKLyEFt8YbNGt33HtXBSzxhUdjMabMOx9wG4VngkECAAzNpGOIOIl9gVHUMyw
	46SJnHXRBTAobD0MzXsZ7DLVq417JPzuKJ+t+U/ulALknuVRwdUnNMtjMxXC3WSGXbIDEllKfjRIh
	0kbIGmjv6gNeOwBgf5XT2SJXUOFZWSzDrjuV19pa9yOt5GzdZh3vtWG2kUFam6NF37O2f65qTjILh
	Kd70ki4EyPE99Qz5Nig29LuGXxFIDRM1H2Ka6LmgW9+Pr2/4cc29R9OkW5/ImqTuny6/metbdAiuV
	chEI30rjg+ciBT0DaQMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQkH-007HoC-NN; Thu, 04 Nov 2021 00:36:45 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQaE-007Ciy-FW
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:24 +0000
Received: by mail-pf1-x449.google.com with SMTP id
 r2-20020a627602000000b00480f8ce37abso2348946pfc.8
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=Knv6NX4aNDEtvlXPSeSH4G0VJXSoyW8J2lqqVusFeB0=;
 b=WAj+5pKSlToue5x/Xjp3tHAY8zkyEMkATjMwSDKkSLNc+c15nQO/y3IMeoonW+8TGW
 IJ//NVTbf9iDd83CZGqogcbVBJFAwkAWutEaX8OHtmK98GraXTwQmiojDJlfjgAF0LlZ
 VKLj3H4JJK4O+dXU8VVJcJqNhuhyRpmQ/xKaWsc+4pgLXjw9U6El3bcpe+Md5lqvOckG
 VcaHEmfZpm2lQzXxITOF5vpCwMpKOib5Ate7AUJbu3BfwOJ4sMpJbFl+NTQugIzCKWHz
 Bu63CaoNp5DbWRkc48ITeWB0/vQjNJnW0r5KU3r+tAHLd4I7Sk2VhJyHE/A1d5epjjc8
 jySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=Knv6NX4aNDEtvlXPSeSH4G0VJXSoyW8J2lqqVusFeB0=;
 b=DZxzLhamQXAjou+7TSDNeRlmDmohF38bVnBCS39Oq+JI74TRWnvjACOzyVKf/iVDay
 nYUjuJYZMb6gGY+7CJNWm1bTBnvS7AVTKzKYgwM/IMU3TBGn9OFdzS+asqcVd/MrgiXd
 Dnvrf8dqOkTwwwKPVkeULRQffOHiuaaKY9NybEVSGdExSc+ApMDPomSFPrUUBSXYQvXB
 czRcIW2Ym1L7H3YE37Twmfq+LnddnJul075CF7F5lpJTw/5VUUfUxRDYVUKhUXIoyEZY
 odkMIXYT0ByWmRy8rC8LwlbN7ZmUZLZzuLOAWjjhnX7ZuT85+46PIpMQx/BPv63+0IVF
 kH3A==
X-Gm-Message-State: AOAM532yRt7T88h3j7HzLIZficePrdisFmCwNX/Pf+rGYoXXF8mEZzIV
 HtFdq05hihePG478cSi8tUkwpky+oMw=
X-Google-Smtp-Source: ABdhPJycWJt6vZswesjO49ykEcHeMjmquF3AfKfwc6UF1QVg1hQjUz6uw6WOUx1iNerGeq81ot/R29ZJDgQ=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90a:c3:: with SMTP id
 v3mr252380pjd.0.1635985580217; Wed, 03 Nov 2021 17:26:20 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:14 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-14-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 13/30] KVM: RISC-V: Use "new" memslot instead of
 userspace memory region
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
X-CRM114-CacheID: sfid-20211103_172622_560437_7164AC4D 
X-CRM114-Status: GOOD (  13.11  )
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

Get the slot ID, hva, etc... from the "new" memslot instead of the
userspace memory region when preparing/committing a memory region.  This
will allow a future commit to drop @mem from the prepare/commit hooks
once all architectures convert to using "new".

Opportunistically wait to get the various "new" values until after
filtering out the DELETE case in anticipation of a future commit passing
NULL for @new when deleting a memslot.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 3a00c2df7640..db5230ec6951 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -466,18 +466,19 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 	 * allocated dirty_bitmap[], dirty pages will be tracked while
 	 * the memory slot is write protected.
 	 */
-	if (change != KVM_MR_DELETE && mem->flags & KVM_MEM_LOG_DIRTY_PAGES)
-		stage2_wp_memory_region(kvm, mem->slot);
+	if (change != KVM_MR_DELETE && new->flags & KVM_MEM_LOG_DIRTY_PAGES)
+		stage2_wp_memory_region(kvm, new->id);
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
-	hva_t hva = mem->userspace_addr;
-	hva_t reg_end = hva + mem->memory_size;
-	bool writable = !(mem->flags & KVM_MEM_READONLY);
+	hva_t hva, reg_end, size;
+	gpa_t base_gpa;
+	bool writable;
 	int ret = 0;
 
 	if (change != KVM_MR_CREATE && change != KVM_MR_MOVE &&
@@ -488,10 +489,15 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	 * Prevent userspace from creating a memory region outside of the GPA
 	 * space addressable by the KVM guest GPA space.
 	 */
-	if ((memslot->base_gfn + memslot->npages) >=
-	    (stage2_gpa_size >> PAGE_SHIFT))
+	if ((new->base_gfn + new->npages) >= (stage2_gpa_size >> PAGE_SHIFT))
 		return -EFAULT;
 
+	hva = new->userspace_addr;
+	size = new->npages << PAGE_SHIFT;
+	reg_end = hva + size;
+	base_gpa = new->base_gfn << PAGE_SHIFT;
+	writable = !(new->flags & KVM_MEM_READONLY);
+
 	mmap_read_lock(current->mm);
 
 	/*
@@ -527,15 +533,14 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 		vm_end = min(reg_end, vma->vm_end);
 
 		if (vma->vm_flags & VM_PFNMAP) {
-			gpa_t gpa = mem->guest_phys_addr +
-				    (vm_start - mem->userspace_addr);
+			gpa_t gpa = base_gpa + (vm_start - hva);
 			phys_addr_t pa;
 
 			pa = (phys_addr_t)vma->vm_pgoff << PAGE_SHIFT;
 			pa += vm_start - vma->vm_start;
 
 			/* IO region dirty page logging not allowed */
-			if (memslot->flags & KVM_MEM_LOG_DIRTY_PAGES) {
+			if (new->flags & KVM_MEM_LOG_DIRTY_PAGES) {
 				ret = -EINVAL;
 				goto out;
 			}
@@ -553,8 +558,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 
 	spin_lock(&kvm->mmu_lock);
 	if (ret)
-		stage2_unmap_range(kvm, mem->guest_phys_addr,
-				   mem->memory_size, false);
+		stage2_unmap_range(kvm, base_gpa, size, false);
 	spin_unlock(&kvm->mmu_lock);
 
 out:
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
