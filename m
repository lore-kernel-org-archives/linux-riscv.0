Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E07C001DF
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 02:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1s1WnIwmMUt3hvjPA2YDpcTzheYc5Rng8cKkcoGwvEU=; b=AnsAV8DbEdy8WSnh4THqIGD3yU
	QcBI0/6gdwv0i9mK0rBsU+6prACh1pEi4WRTGyekQHNlegceaeo5ix0qx+7gJQMOoqP1CLTEQY4FP
	8ylZuHWEGSCS/oigEvSM/kIq4SzxKd9EF/Kv1CNZIubg6DkUpdElCIgFT2pX2mKZrLmOATFXn9zgX
	/QjN+kdrUXxHE1he6B8+J2LPhnaqHHAnZ+geew7bcJAXZU0nXBwZJXcDDnOTmpsuZOCIE6rmAtunM
	g2252n4ekLnKCXUUhdnJr+r3/uyaAC79qaXX4Din8555IagV+vowoqm55uIEIEEatXn5fqEsDBGkq
	HNQ/4DJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2Hc-00FcKt-0H;
	Sat, 22 Jul 2023 02:23:48 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2Gq-00FbsR-1n
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 02:23:08 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c64ef5bde93so2446876276.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 19:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689992580; x=1690597380;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Me73pI182jnFhXfjtXU6Lav2BE++uDm5prs2AoiVsU=;
        b=VtZrn0v5poiD1RwIyMSJLgAo0wb6iiHI16XgwrY2hIcVRVYR2hTwu/kgdm0cJUFlNI
         Q81SFG6RIlOgQ0pQUTIiGlfToxY7laAB4j99yUkgJM7jsrIFoxg7+tH7Zdb7tK+zAh1j
         PCwHfH4mlsTO3bTBmISd1Dyt182qjXEbjFgjTLcs/JCCWquhY+gxpR0y3RtV2WkjbxZk
         5NpZm44IYl9Rr+H6NsCMrcBWm3nQQFoRMiIrjzNJxUPV75Z0ZJvmdBYq/1l3EriLZTvv
         W8wIUcLkZC20v5AhyHu3GrO8lBoe18n59E7uzsjfEYwK2IXD8/PrCnArXO8zGXCOlQmx
         pCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689992580; x=1690597380;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Me73pI182jnFhXfjtXU6Lav2BE++uDm5prs2AoiVsU=;
        b=RIxpxrVTyBts87L/kVYnEI8zCr5+zrZ6Qub1J69ZoVadnk+nBJcDLbzADFlQ9rxh5A
         iXoD0JBYuYnEuZas4uC36w3UmxwwEWmG3/eXwRh7kcbQJefARHEtXeVm4wWIdHE2kivg
         GkHS+qX18glCI4ZPnx2qJVjMvuqfL69W2wwPnGGu+nAQgkfAO+FDjx7JRf3s8B6ifN+0
         0se9Y7CADYMait4EzW8f/aDKcK9bEOthLmteRhNVvUQUjAEUUjlQa52zPAaEmY87e73r
         4vbSiYOLOR4X5ea4cwHw75bjoCHiBzPXhNh1v8LwZ7jueZLfdGrlpuWUDtU9vpJjHxby
         k1Tw==
X-Gm-Message-State: ABy/qLaAWjJJrtO3ZBlDONkm/ooaepuCfq73pA60Vb2E/VRWVEoPfYPb
	J/lOYpZhi+89Fz4HY/CqA3mn3Odkep3J
X-Google-Smtp-Source: APBJJlEIEb/4RMcvSPC0W13v5/Var/LCDadaTtfEOqZaBbyn5nl037sb83W9tIIgvGsvsIUWAN/+Tk/uybMb
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a25:3450:0:b0:c4c:f97e:421a with SMTP id
 b77-20020a253450000000b00c4cf97e421amr22794yba.4.1689992579951; Fri, 21 Jul
 2023 19:22:59 -0700 (PDT)
Date: Sat, 22 Jul 2023 02:22:44 +0000
In-Reply-To: <20230722022251.3446223-1-rananta@google.com>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230722022251.3446223-6-rananta@google.com>
Subject: [PATCH v7 05/12] KVM: Move kvm_arch_flush_remote_tlbs_memslot() to
 common code
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Anata <rananta@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Gavin Shan <gshan@redhat.com>, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_192300_654713_60489948 
X-CRM114-Status: GOOD (  17.37  )
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

From: David Matlack <dmatlack@google.com>

Move kvm_arch_flush_remote_tlbs_memslot() to common code and drop
"arch_" from the name. kvm_arch_flush_remote_tlbs_memslot() is just a
range-based TLB invalidation where the range is defined by the memslot.
Now that kvm_flush_remote_tlbs_range() can be called from common code we
can just use that and drop a bunch of duplicate code from the arch
directories.

Note this adds a lockdep assertion for slots_lock being held when
calling kvm_flush_remote_tlbs_memslot(), which was previously only
asserted on x86. MIPS has calls to kvm_flush_remote_tlbs_memslot(),
but they all hold the slots_lock, so the lockdep assertion continues to
hold true.

Also drop the CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT ifdef gating
kvm_flush_remote_tlbs_memslot(), since it is no longer necessary.

Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 arch/arm64/kvm/arm.c     |  6 ------
 arch/mips/kvm/mips.c     | 10 ++--------
 arch/riscv/kvm/mmu.c     |  6 ------
 arch/x86/kvm/mmu/mmu.c   | 16 +---------------
 arch/x86/kvm/x86.c       |  2 +-
 include/linux/kvm_host.h |  7 +++----
 virt/kvm/kvm_main.c      | 18 ++++++++++++++++--
 7 files changed, 23 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index c2c14059f6a8..ed7bef4d970b 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1525,12 +1525,6 @@ void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
 
 }
 
-void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
-					const struct kvm_memory_slot *memslot)
-{
-	kvm_flush_remote_tlbs(kvm);
-}
-
 static int kvm_vm_ioctl_set_device_addr(struct kvm *kvm,
 					struct kvm_arm_device_addr *dev_addr)
 {
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 4b7bc39a4173..231ac052b506 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -199,7 +199,7 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 	/* Flush slot from GPA */
 	kvm_mips_flush_gpa_pt(kvm, slot->base_gfn,
 			      slot->base_gfn + slot->npages - 1);
-	kvm_arch_flush_remote_tlbs_memslot(kvm, slot);
+	kvm_flush_remote_tlbs_memslot(kvm, slot);
 	spin_unlock(&kvm->mmu_lock);
 }
 
@@ -235,7 +235,7 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 		needs_flush = kvm_mips_mkclean_gpa_pt(kvm, new->base_gfn,
 					new->base_gfn + new->npages - 1);
 		if (needs_flush)
-			kvm_arch_flush_remote_tlbs_memslot(kvm, new);
+			kvm_flush_remote_tlbs_memslot(kvm, new);
 		spin_unlock(&kvm->mmu_lock);
 	}
 }
@@ -987,12 +987,6 @@ int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 	return 1;
 }
 
-void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
-					const struct kvm_memory_slot *memslot)
-{
-	kvm_flush_remote_tlbs(kvm);
-}
-
 int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 {
 	int r;
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index f2eb47925806..97e129620686 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -406,12 +406,6 @@ void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
 {
 }
 
-void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
-					const struct kvm_memory_slot *memslot)
-{
-	kvm_flush_remote_tlbs(kvm);
-}
-
 void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *free)
 {
 }
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index eb88d25f9896..efbe394da1a6 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6669,7 +6669,7 @@ static void kvm_rmap_zap_collapsible_sptes(struct kvm *kvm,
 	 */
 	if (walk_slot_rmaps(kvm, slot, kvm_mmu_zap_collapsible_spte,
 			    PG_LEVEL_4K, KVM_MAX_HUGEPAGE_LEVEL - 1, true))
-		kvm_arch_flush_remote_tlbs_memslot(kvm, slot);
+		kvm_flush_remote_tlbs_memslot(kvm, slot);
 }
 
 void kvm_mmu_zap_collapsible_sptes(struct kvm *kvm,
@@ -6688,20 +6688,6 @@ void kvm_mmu_zap_collapsible_sptes(struct kvm *kvm,
 	}
 }
 
-void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
-					const struct kvm_memory_slot *memslot)
-{
-	/*
-	 * All current use cases for flushing the TLBs for a specific memslot
-	 * related to dirty logging, and many do the TLB flush out of mmu_lock.
-	 * The interaction between the various operations on memslot must be
-	 * serialized by slots_locks to ensure the TLB flush from one operation
-	 * is observed by any other operation on the same memslot.
-	 */
-	lockdep_assert_held(&kvm->slots_lock);
-	kvm_flush_remote_tlbs_range(kvm, memslot->base_gfn, memslot->npages);
-}
-
 void kvm_mmu_slot_leaf_clear_dirty(struct kvm *kvm,
 				   const struct kvm_memory_slot *memslot)
 {
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a6b9bea62fb8..faeb2e307b36 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12751,7 +12751,7 @@ static void kvm_mmu_slot_apply_flags(struct kvm *kvm,
 		 * See is_writable_pte() for more details (the case involving
 		 * access-tracked SPTEs is particularly relevant).
 		 */
-		kvm_arch_flush_remote_tlbs_memslot(kvm, new);
+		kvm_flush_remote_tlbs_memslot(kvm, new);
 	}
 }
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index a731967b24ff..45899ce9ed31 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1360,6 +1360,8 @@ void kvm_vcpu_on_spin(struct kvm_vcpu *vcpu, bool yield_to_kernel_mode);
 
 void kvm_flush_remote_tlbs(struct kvm *kvm);
 void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 pages);
+void kvm_flush_remote_tlbs_memslot(struct kvm *kvm,
+				   const struct kvm_memory_slot *memslot);
 
 #ifdef KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE
 int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min);
@@ -1388,10 +1390,7 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 					unsigned long mask);
 void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot);
 
-#ifdef CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT
-void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
-					const struct kvm_memory_slot *memslot);
-#else /* !CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT */
+#ifndef CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT
 int kvm_vm_ioctl_get_dirty_log(struct kvm *kvm, struct kvm_dirty_log *log);
 int kvm_get_dirty_log(struct kvm *kvm, struct kvm_dirty_log *log,
 		      int *is_dirty, struct kvm_memory_slot **memslot);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 804470fccac7..58213cc4b9b9 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -379,6 +379,20 @@ void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 pages)
 	kvm_flush_remote_tlbs(kvm);
 }
 
+void kvm_flush_remote_tlbs_memslot(struct kvm *kvm,
+				   const struct kvm_memory_slot *memslot)
+{
+	/*
+	 * All current use cases for flushing the TLBs for a specific memslot
+	 * related to dirty logging, and many do the TLB flush out of mmu_lock.
+	 * The interaction between the various operations on memslot must be
+	 * serialized by slots_locks to ensure the TLB flush from one operation
+	 * is observed by any other operation on the same memslot.
+	 */
+	lockdep_assert_held(&kvm->slots_lock);
+	kvm_flush_remote_tlbs_range(kvm, memslot->base_gfn, memslot->npages);
+}
+
 static void kvm_flush_shadow_all(struct kvm *kvm)
 {
 	kvm_arch_flush_shadow_all(kvm);
@@ -2191,7 +2205,7 @@ static int kvm_get_dirty_log_protect(struct kvm *kvm, struct kvm_dirty_log *log)
 	}
 
 	if (flush)
-		kvm_arch_flush_remote_tlbs_memslot(kvm, memslot);
+		kvm_flush_remote_tlbs_memslot(kvm, memslot);
 
 	if (copy_to_user(log->dirty_bitmap, dirty_bitmap_buffer, n))
 		return -EFAULT;
@@ -2308,7 +2322,7 @@ static int kvm_clear_dirty_log_protect(struct kvm *kvm,
 	KVM_MMU_UNLOCK(kvm);
 
 	if (flush)
-		kvm_arch_flush_remote_tlbs_memslot(kvm, memslot);
+		kvm_flush_remote_tlbs_memslot(kvm, memslot);
 
 	return 0;
 }
-- 
2.41.0.487.g6d72f3e995-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
