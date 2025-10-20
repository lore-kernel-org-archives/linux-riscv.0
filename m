Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF68DCCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 13:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K26vDtdY/ZTnK8geuQMceVbxiK4CJ0iL24RwA8rwhGE=; b=vawLITCqsaIZNi
	3xFtPVnuw341S/59+Qa1bC9htLG4+aI6CROJDck+IgA47inAlMlVkjeU4cpL/NzEGcondqCqNQYr8
	rqR51d1nlatWqAyKoOCcIW1grhDYdBXLT3WV+ne4tDY0ZvL0PIMuDeYr6oKBhPPlnopw1KAwToYqx
	PlrckW1RNKc0rKptXQxLE2ZKBhe//T3RM5RmLYmpQZLs/IoNMvPoOv2EnIBl5qg/Z/4I+iIfYTzcL
	sw/2BSDOphJQwXUj00TCmZZjaqnrwky2YeP2J3ec3H5B7KsesYnB4iieUqTZi+uCVOXnJA85nau7V
	Aw9Op1FppJl69jBcZ39Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApcX-0000000DiNH-3GJL;
	Mon, 20 Oct 2025 13:08:17 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApcU-0000000DiLn-3qGU;
	Mon, 20 Oct 2025 13:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1760965688; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=VqNvlk/xz73z1KmMrkOxoHo6m+80ptyKkYHpzu2di2U=;
	b=xKvDTL81rnpHMCBsMiUWYsfpoaFSCxDWP1IB1kf9zleUEANYiqml20/5EAJMmY+hlbf8djgijJIDoDyiV8GDuHC4VfMQ6SqKUiVRISxNcLrMrLkeI0FmR4Bnwt98eXvNS2p8VT4QFkbxi2iWw9HzY9e1Segj0gsGxVg1X4ij2SU=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WqchCgl_1760965684 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 20 Oct 2025 21:08:06 +0800
From: fangyu.yu@linux.alibaba.com
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	pbonzini@redhat.com,
	jiangyifei@huawei.com
Cc: guoren@kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH] RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP
Date: Mon, 20 Oct 2025 21:08:01 +0800
Message-Id: <20251020130801.68356-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_060815_144491_1DCF5499 
X-CRM114-Status: UNSURE (   6.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

As of commit aac6db75a9fc ("vfio/pci: Use unmap_mapping_range()"),
vm_pgoff may no longer guaranteed to hold the PFN for VM_PFNMAP
regions. Using vma->vm_pgoff to derive the HPA here may therefore
produce incorrect mappings.

Instead, I/O mappings for such regions can be established on-demand
during g-stage page faults, making the upfront ioremap in this path
is unnecessary.

Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/kvm/mmu.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 525fb5a330c0..84c04c8f0892 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -197,8 +197,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 
 	/*
 	 * A memory region could potentially cover multiple VMAs, and
-	 * any holes between them, so iterate over all of them to find
-	 * out if we can map any of them right now.
+	 * any holes between them, so iterate over all of them.
 	 *
 	 *     +--------------------------------------------+
 	 * +---------------+----------------+   +----------------+
@@ -229,32 +228,15 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 		vm_end = min(reg_end, vma->vm_end);
 
 		if (vma->vm_flags & VM_PFNMAP) {
-			gpa_t gpa = base_gpa + (vm_start - hva);
-			phys_addr_t pa;
-
-			pa = (phys_addr_t)vma->vm_pgoff << PAGE_SHIFT;
-			pa += vm_start - vma->vm_start;
-
 			/* IO region dirty page logging not allowed */
 			if (new->flags & KVM_MEM_LOG_DIRTY_PAGES) {
 				ret = -EINVAL;
 				goto out;
 			}
-
-			ret = kvm_riscv_mmu_ioremap(kvm, gpa, pa, vm_end - vm_start,
-						    writable, false);
-			if (ret)
-				break;
 		}
 		hva = vm_end;
 	} while (hva < reg_end);
 
-	if (change == KVM_MR_FLAGS_ONLY)
-		goto out;
-
-	if (ret)
-		kvm_riscv_mmu_iounmap(kvm, base_gpa, size);
-
 out:
 	mmap_read_unlock(current->mm);
 	return ret;
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
