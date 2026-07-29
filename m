Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F15C53219
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 07:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VRrBpp3WA7vDucXo1BHXmV6tU/l+jrA5Q95+y34B5VA=; b=VE1f8i+P9nyBq3
	Z3mCWQDkXdHWHWMbg+5nsuop94qrEhIIB50CsUC9hztXg363Z81bMASpArHiEu92ma8rainNXJAnX
	fqk0HKbpDAuNdYJLkje0ci0t3stz5h9xyYyFOXayHZwbG0uLESpT8y/9QlV8zLmYmwLvjY03VcmHc
	1R3AchEjsOCV1GGXdM65IaUUBgOWUNXy2ihMfBEIW6TEKHPmdvVJPSiJEydvE8sIpEyuLw2Yo0FDQ
	824oxlguE0rm4hYxGB5NOJ9zF+KONF+0xY2nxTwyYFP31r7LrSzVRTyhTC6PmiLoNDvD+tKrL12N0
	FRrzHL9y2KQKKAnbVCIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyPN-000000075LA-0F3B;
	Wed, 29 Jul 2026 07:08:53 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyPK-000000075Jz-0alF
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 07:08:52 +0000
Received: by mail-pj2-x0b.google.com with SMTP id d9443c01a7336-2ceb5a39c48so2223425ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 00:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785308929; x=1785913729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zVkfFwU99PAS9bFh1/EwhXDgeOkNzrTt6+RDhpCA128=;
        b=iKSAAk3OfHRDh7VVTCX3B85ahiL6jKgCf4f1l5RG4GxycHMZqUAS3E+ipr9Prpf1y2
         ASUKCze5dI+9ACkehTV/2ZV3Ye6j9f42w5bhC6bGlaS7y/84mOzrvtYRgMhySLKMgZSd
         Zuqv3BihslqztOTp0tq7+M2ZDtwHiQv7kF42OTGfnjKPZNtmVNwtJrNKm1K0crx4QQWX
         cXc5AZLo3NcFMtchgc7f+ZeZPLFh5eUsA/0mxdkJztKMFraoDyCRrWu6SPNg1T92AD+Z
         aP3E0ZTi5vTGMxfJJCR48OgFQYj0U6Xq574HOhPQRN/QyyoHP6gOArucxNRF6foEP3XQ
         dWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785308929; x=1785913729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVkfFwU99PAS9bFh1/EwhXDgeOkNzrTt6+RDhpCA128=;
        b=ltP+YKpG5UtrL922+BIchg+3ZvJ6s6lIYEABqaEMvOs5v2iCkyOwhMsx0bjSKxC3O2
         vG2V6BzFhWrVsmJlSY3uqZ46hk/cAvB/C2Q3SzBsWyjXhNJySRTUAQZUt5srn70xCzi+
         KNuB/FYGYWIO45hRJkxC32FvbHLJH9ffvlvvX6it6vnl8cOPu3F3ruXDDUx7xxhYi+kp
         yHXqCCtLQMXmR6JK+BBQJuA+o6lDC85gyIouZc7psKzjndA43cPgXM29g+55oOUI29Bu
         fXVJFtCaagZMSZfaC+CF3R95wPBUbZs4bQ45rqbqRMp/3V/fsmnFXPNyxiaTFxnIT/m0
         iCgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqszly9WrsCU3RAIf73NVEfdCCVpoLpxXtiKYFq14RVZqwQ63svHg8oAeva40IZrzDgeJqp3BdA5IcYJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUAhPo5o16zVn7z8zTGB0OE84x5kvtq8lcRnLE17ub97wTMsYq
	yIuN5rlq0KXbSEhfTSpYCWehYl2cXj0GW7AA8rR6+AgAiQj3VmBaBG9X81jon52b4jgi7Q==
X-Gm-Gg: AR+sD10aLNzDzKinviO5rObHOzKdMHoafK6DBwmJkyQa0ZDr0hf05znLqNboQGqmvHN
	JNkjFlKxvwqGx+1NAof4b7ryVRXw3Woi1cOEKCtntZH+62fe1ZDMvCugn16nKC6MW4zox94WaQ/
	IiUvCnmmyDDqYRDd40aiyVX9GfE8PSBGk3EJjZazgRlDQ78/28EWbfv8Aq7K2h+BdgcCErXeMm7
	EkrJtGGCNbKUQsqUPI7bwGt6EIGiCtMJt4yaQppN6fEBF22j1IIprrMZ/fxwWmDEGdlFuXlhDh5
	HKSp+V9vdchGsIt064LU46RfCOp7AkGdva6gUDJpa6uCBlwQjci3aXH8imICZaoBQLUy+q7nseD
	LgHlZf36B+0V0NkxDa/AFiGhYu72e55fAaM+oHEnbsgYGLJN6a0YngSBztxrJ+cVX60KecWK7+5
	ojOYbf9p0iEhlbM7FcpYpprgedRF0PQgVJa7iyCLGRKFPycrUWIWaJOnW4U4/TAlNtGec+7emi1
	kw=
X-Received: by 2002:a17:903:948:b0:2cf:ca89:499d with SMTP id d9443c01a7336-2d015abe469mr65912835ad.7.1785308929138;
        Wed, 29 Jul 2026 00:08:49 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a15215sm6786125ad.8.2026.07.29.00.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:08:48 -0700 (PDT)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	James Houghton <jthoughton@google.com>,
	Bingyu Xian <shanbeeyoo@gmail.com>
Subject: [RFC PATCH] RISC-V: KVM: Enable KVM_MEM_USERFAULT support
Date: Wed, 29 Jul 2026 15:08:43 +0800
Message-ID: <20260729070843.730578-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_000850_182188_913F8E67 
X-CRM114-Status: GOOD (  16.21  )
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

Add support for KVM_MEM_USERFAULT on RISC-V, which allows userspace
VMMs (e.g. QEMU) to handle post-copy live migration via userfaultfd.

The implementation follows the same pattern as x86 and arm64:

1. Force PAGE_SIZE mappings when KVM_MEM_USERFAULT is set on a memslot.
   The userfault bitmap is tracked at PAGE_SIZE granularity, so block
   mappings must be disabled to ensure every guest page fault reaches
   the bitmap check in gstage_page_fault().

2. Check the userfault bitmap in gstage_page_fault() before installing
   a G-stage mapping. If the faulting gfn is marked as pending
   userspace resolution, prepare a KVM_EXIT_MEMORY_FAULT exit and
   return 0 instead of proceeding with the mapping.

3. Advertise KVM_CAP_USERFAULT capability to userspace.

The mmu_notifier invalidation flush on userfault enable guarantees that
we never fault on a page that's already mapped, so the bitmap set bits
can be safely checked without holding the mmu_lock during the lookup.

Builds on the gstage fault path type cleanup ("RISC-V: KVM: Fix
spurious -EEXIST and clean up gstage fault path types"), which is sent
separately as an independent fix.

Depends-on: James Houghton's KVM_MEM_USERFAULT generic series
Link: https://lore.kernel.org/kvm/20260618205753.2600064-1-jthoughton@google.com/

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Bingyu Xian <shanbeeyoo@gmail.com>
---
 arch/riscv/kvm/mmu.c       | 6 ++++--
 arch/riscv/kvm/vcpu_exit.c | 7 +++++++
 arch/riscv/kvm/vm.c        | 1 +
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index d2a06a54be17..c33810b71d89 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -583,7 +583,9 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	else
 		vma_pageshift = PAGE_SHIFT;
 	vma_pagesize = 1ULL << vma_pageshift;
-	if (logging || (vma->vm_flags & VM_PFNMAP))
+	bool userfault = !!(memslot->flags & KVM_MEM_USERFAULT);
+
+	if (logging || userfault || (vma->vm_flags & VM_PFNMAP))
 		vma_pagesize = PAGE_SIZE;
 	else if (is_hugetlb)
 		vma_pagesize = hugetlb_mapping_size(memslot, hva, vma_pagesize);
@@ -640,7 +642,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	 * possible. Hugetlb mappings already selected their target size above,
 	 * so do not promote them through the THP helper.
 	 */
-	if (!logging && !is_hugetlb && vma_pagesize == PAGE_SIZE)
+	if (!logging && !userfault && !is_hugetlb && vma_pagesize == PAGE_SIZE)
 		vma_pagesize = transparent_hugepage_adjust(kvm, memslot, hva, &hfn, &gpa);
 
 	if (writable) {
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 76cceecee5ab..0919e1c8a6ad 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -63,6 +63,13 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		};
 	}
 
+	if (kvm_slot_userfault_fault(memslot, gfn)) {
+		kvm_prepare_memory_fault_exit(vcpu, fault_addr, PAGE_SIZE,
+					trap->scause == EXC_STORE_GUEST_PAGE_FAULT,
+					trap->scause == EXC_INST_GUEST_PAGE_FAULT, false);
+		return 0;
+	}
+
 	ret = kvm_riscv_mmu_map(vcpu, memslot, fault_addr, hva,
 				(trap->scause == EXC_STORE_GUEST_PAGE_FAULT) ? true : false,
 				&host_map);
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index a9f083feeb76..1bb3918c70da 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -186,6 +186,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_READONLY_MEM:
 	case KVM_CAP_MP_STATE:
 	case KVM_CAP_IMMEDIATE_EXIT:
+	case KVM_CAP_USERFAULT:
 	case KVM_CAP_SET_GUEST_DEBUG:
 		r = 1;
 		break;
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
