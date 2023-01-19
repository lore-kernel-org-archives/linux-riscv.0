Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8098FC38142
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 18:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KFDZMqPtk1GqWIS/NueT1rUm4sj0RlEgSAAA8t6+AhI=; b=jdr0wZXtus7QmCLSz3YrREJJ4w
	hULup4F2MP1z/m8BMQxLrkTCegYrBSZPk20HhrovW4PStQERml2mBkengAa811bod5eMfXlaRff8f
	0I5oiTLDi26XpYQrtruwqw+FyRCqetQ2She02zRrZ+Fz89r5wd2IwAA4O8rif6o89KeHsuY0RSgKQ
	7ZVRJQKU7pZxcfz0W704VuOuI1fFMsZZ9TAEbZ3oM7/fSaS02GpWuTe33G0B/d1OSreDXOPBhF6Tv
	11xA2v+oHV2+XohPPDH1/Z7Bh+R0ZS6v4BfVzNjtPx6XjexMWPrqvc0Wcly8VeN9Il2ZZ8PvBKH1l
	dk+fv/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZFV-006ROX-Tx; Thu, 19 Jan 2023 18:02:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZF9-006RBK-5K
	for linux-riscv@bombadil.infradead.org; Thu, 19 Jan 2023 18:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YgIeMtGXDOnExqyujNWC0I9b1VXR1Gfs99VbmAsRW+k=; b=kKs6nTOKf6sTA9JmOZ7hOaL/RP
	7mQuBuEQ1KgplyD1C/GIIv2WRzLCzWvq1eH8F774Qi25OMppyNqCGcTkju6bxejRIzl84pd1R22Ky
	Q2ZV2T1fEEvpV+bTTpPuuNzUQolcNf4FWeLMeH5YUohV6j0EvQOuX3FnldBu5MfZ38E/mydEG37J/
	j02tY4cxWhgGxRNVlr5PllcafBXIQ7ZiAdVaZQQxFloYcgdnAW31KevmUut4MNj0hRWC8VtVj2kj+
	yoTQfDxJXCfPo76YRdVa/5AOMwW4aF2Plh2w+ZoX5a+XhCeEcXUYTH9yLG4U6peCBEwiMYm5p9JpZ
	Q42q74Qg==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pIYpO-000NZh-02
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jan 2023 17:35:59 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-4ce566db73eso26378537b3.11
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 09:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YgIeMtGXDOnExqyujNWC0I9b1VXR1Gfs99VbmAsRW+k=;
        b=giV2bYNflM1JWbc19J5WY/OrTHA78PbEfEaGruYZpasDOKcsChZyc7ERYncTqgomiZ
         9PaIiH7tqSF4adItkEgaawlNmE1F0ueIp9Y2xeYlO4p3UB8iZBoIZYwBwzNTSf/gZmGr
         3NKMurcu39ncVL5I6NoG0RlMIEYCIbiOs3BqTH9TTJLRVwhSPYuWqTnVz6sdMZ8sg5tz
         Q+i63pfT3HowCiwOhETAH2Phm/zP3pxDGwMgc1WCkQiUw9sRd1n7WhY5CLufzlC1bw/Y
         5TOre+jDSiOUVTkE/B5jhyHe+OwRwn4l/WTKrw0kv3ubQ5/DMZgUCROeNCDn+/+pFKZX
         /Utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgIeMtGXDOnExqyujNWC0I9b1VXR1Gfs99VbmAsRW+k=;
        b=pvrqJEbCbVmayyi7TM1NUADIWr2GrhldRJODI9GiCHryJP+N8aUgY2PDB3SHH5a7vR
         xK6viPq8bZwbDBLJys+PGPdojLJHzAy3zGbwLtzIUUPknndCTuzLvVY6bsNN/av/ASC+
         9BDsSTbHtglGl3/Ho+OcywphPEk6mXdS/eTtFibN1M33j8F0zyAIg5ZAobBIhMSK93WZ
         3QbSYt4JqHMg+2O2c4rZSeRnaM0MCSSz7HufLC+VI15MFZVxtBzr8Ek6eOZ3DapaZ/D7
         Qfmme9rAoEkI0M1neO9DqRoGIqiZQ2HWEbRohsCjlDaMqNNJYaU0P/hoRQsBxQIq1CAT
         CT+A==
X-Gm-Message-State: AFqh2koNZv8fAJ9EJzrBwJ2hN4LQKpFOXxpX1ItJeoQTgDLA1Fd5XMpE
	Q8wgkR/dPpdDPxGmaFtAuMyda7lZLu5p4A==
X-Google-Smtp-Source: AMrXdXv2vGhlzkyCDtRgVIwxrqEebGv4h47Grh18nzdI7jcrY6V2k//XsBdUo25o0Vf4cjHFmIEsjoCzUjnkfQ==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a81:e41:0:b0:4ed:612d:2559 with SMTP id
 62-20020a810e41000000b004ed612d2559mr1400135ywo.46.1674149778116; Thu, 19 Jan
 2023 09:36:18 -0800 (PST)
Date: Thu, 19 Jan 2023 09:35:56 -0800
In-Reply-To: <20230119173559.2517103-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230119173559.2517103-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Message-ID: <20230119173559.2517103-5-dmatlack@google.com>
Subject: [PATCH 4/7] KVM: x86/mmu: Rename kvm_flush_remote_tlbs_with_address()
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	David Matlack <dmatlack@google.com>, Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_173554_277185_EC24796F 
X-CRM114-Status: GOOD (  13.21  )
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

Rename kvm_flush_remote_tlbs_with_address() to
kvm_flush_remote_tlbs_range(). This name is shorter, which reduces the
number of callsites that need to be broken up across multiple lines, and
more readable since it conveys a range of memory is being flushed rather
than a single address.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 36 +++++++++++++++------------------
 arch/x86/kvm/mmu/mmu_internal.h |  3 +--
 arch/x86/kvm/mmu/paging_tmpl.h  |  4 ++--
 arch/x86/kvm/mmu/tdp_mmu.c      |  7 +++----
 4 files changed, 22 insertions(+), 28 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 7740ca52dab4..36ce3110b7da 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -246,8 +246,7 @@ static inline bool kvm_available_flush_tlb_with_range(void)
 	return kvm_x86_ops.tlb_remote_flush_with_range;
 }
 
-void kvm_flush_remote_tlbs_with_address(struct kvm *kvm,
-		u64 start_gfn, u64 pages)
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, u64 start_gfn, u64 pages)
 {
 	struct kvm_tlb_range range;
 	int ret = -EOPNOTSUPP;
@@ -806,7 +805,7 @@ static void account_shadowed(struct kvm *kvm, struct kvm_mmu_page *sp)
 	kvm_mmu_gfn_disallow_lpage(slot, gfn);
 
 	if (kvm_mmu_slot_gfn_write_protect(kvm, slot, gfn, PG_LEVEL_4K))
-		kvm_flush_remote_tlbs_with_address(kvm, gfn, 1);
+		kvm_flush_remote_tlbs_range(kvm, gfn, 1);
 }
 
 void track_possible_nx_huge_page(struct kvm *kvm, struct kvm_mmu_page *sp)
@@ -1180,8 +1179,8 @@ static void drop_large_spte(struct kvm *kvm, u64 *sptep, bool flush)
 	drop_spte(kvm, sptep);
 
 	if (flush)
-		kvm_flush_remote_tlbs_with_address(kvm, sp->gfn,
-			KVM_PAGES_PER_HPAGE(sp->role.level));
+		kvm_flush_remote_tlbs_range(kvm, sp->gfn,
+					    KVM_PAGES_PER_HPAGE(sp->role.level));
 }
 
 /*
@@ -1462,7 +1461,7 @@ static bool kvm_set_pte_rmap(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
 	}
 
 	if (need_flush && kvm_available_flush_tlb_with_range()) {
-		kvm_flush_remote_tlbs_with_address(kvm, gfn, 1);
+		kvm_flush_remote_tlbs_range(kvm, gfn, 1);
 		return false;
 	}
 
@@ -1632,8 +1631,8 @@ static void __rmap_add(struct kvm *kvm,
 		kvm->stat.max_mmu_rmap_size = rmap_count;
 	if (rmap_count > RMAP_RECYCLE_THRESHOLD) {
 		kvm_zap_all_rmap_sptes(kvm, rmap_head);
-		kvm_flush_remote_tlbs_with_address(
-				kvm, sp->gfn, KVM_PAGES_PER_HPAGE(sp->role.level));
+		kvm_flush_remote_tlbs_range(kvm, sp->gfn,
+					    KVM_PAGES_PER_HPAGE(sp->role.level));
 	}
 }
 
@@ -2398,7 +2397,7 @@ static void validate_direct_spte(struct kvm_vcpu *vcpu, u64 *sptep,
 			return;
 
 		drop_parent_pte(child, sptep);
-		kvm_flush_remote_tlbs_with_address(vcpu->kvm, child->gfn, 1);
+		kvm_flush_remote_tlbs_range(vcpu->kvm, child->gfn, 1);
 	}
 }
 
@@ -2882,8 +2881,8 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
 	}
 
 	if (flush)
-		kvm_flush_remote_tlbs_with_address(vcpu->kvm, gfn,
-				KVM_PAGES_PER_HPAGE(level));
+		kvm_flush_remote_tlbs_range(vcpu->kvm, gfn,
+					    KVM_PAGES_PER_HPAGE(level));
 
 	pgprintk("%s: setting spte %llx\n", __func__, *sptep);
 
@@ -5814,9 +5813,8 @@ slot_handle_level_range(struct kvm *kvm, const struct kvm_memory_slot *memslot,
 
 		if (need_resched() || rwlock_needbreak(&kvm->mmu_lock)) {
 			if (flush && flush_on_yield) {
-				kvm_flush_remote_tlbs_with_address(kvm,
-						start_gfn,
-						iterator.gfn - start_gfn + 1);
+				kvm_flush_remote_tlbs_range(kvm, start_gfn,
+							    iterator.gfn - start_gfn + 1);
 				flush = false;
 			}
 			cond_resched_rwlock_write(&kvm->mmu_lock);
@@ -6171,8 +6169,7 @@ void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end)
 	}
 
 	if (flush)
-		kvm_flush_remote_tlbs_with_address(kvm, gfn_start,
-						   gfn_end - gfn_start);
+		kvm_flush_remote_tlbs_range(kvm, gfn_start, gfn_end - gfn_start);
 
 	kvm_mmu_invalidate_end(kvm, 0, -1ul);
 
@@ -6511,8 +6508,8 @@ static bool kvm_mmu_zap_collapsible_spte(struct kvm *kvm,
 			kvm_zap_one_rmap_spte(kvm, rmap_head, sptep);
 
 			if (kvm_available_flush_tlb_with_range())
-				kvm_flush_remote_tlbs_with_address(kvm, sp->gfn,
-					KVM_PAGES_PER_HPAGE(sp->role.level));
+				kvm_flush_remote_tlbs_range(kvm, sp->gfn,
+							    KVM_PAGES_PER_HPAGE(sp->role.level));
 			else
 				need_tlb_flush = 1;
 
@@ -6562,8 +6559,7 @@ void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
 	 * is observed by any other operation on the same memslot.
 	 */
 	lockdep_assert_held(&kvm->slots_lock);
-	kvm_flush_remote_tlbs_with_address(kvm, memslot->base_gfn,
-					   memslot->npages);
+	kvm_flush_remote_tlbs_range(kvm, memslot->base_gfn, memslot->npages);
 }
 
 void kvm_mmu_slot_leaf_clear_dirty(struct kvm *kvm,
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index ac00bfbf32f6..e606a6d5e040 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -164,8 +164,7 @@ void kvm_mmu_gfn_allow_lpage(const struct kvm_memory_slot *slot, gfn_t gfn);
 bool kvm_mmu_slot_gfn_write_protect(struct kvm *kvm,
 				    struct kvm_memory_slot *slot, u64 gfn,
 				    int min_level);
-void kvm_flush_remote_tlbs_with_address(struct kvm *kvm,
-					u64 start_gfn, u64 pages);
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, u64 start_gfn, u64 pages);
 unsigned int pte_list_count(struct kvm_rmap_head *rmap_head);
 
 extern int nx_huge_pages;
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index e5662dbd519c..fdad03f131c8 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -929,8 +929,8 @@ static void FNAME(invlpg)(struct kvm_vcpu *vcpu, gva_t gva, hpa_t root_hpa)
 
 			mmu_page_zap_pte(vcpu->kvm, sp, sptep, NULL);
 			if (is_shadow_present_pte(old_spte))
-				kvm_flush_remote_tlbs_with_address(vcpu->kvm,
-					sp->gfn, KVM_PAGES_PER_HPAGE(sp->role.level));
+				kvm_flush_remote_tlbs_range(vcpu->kvm, sp->gfn,
+							    KVM_PAGES_PER_HPAGE(sp->role.level));
 
 			if (!rmap_can_add(vcpu))
 				break;
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index bba33aea0fb0..7c21d15c58d8 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -680,8 +680,7 @@ static inline int tdp_mmu_zap_spte_atomic(struct kvm *kvm,
 	if (ret)
 		return ret;
 
-	kvm_flush_remote_tlbs_with_address(kvm, iter->gfn,
-					   KVM_PAGES_PER_HPAGE(iter->level));
+	kvm_flush_remote_tlbs_range(kvm, iter->gfn, KVM_PAGES_PER_HPAGE(iter->level));
 
 	/*
 	 * No other thread can overwrite the removed SPTE as they must either
@@ -1080,8 +1079,8 @@ static int tdp_mmu_map_handle_target_level(struct kvm_vcpu *vcpu,
 		return RET_PF_RETRY;
 	else if (is_shadow_present_pte(iter->old_spte) &&
 		 !is_last_spte(iter->old_spte, iter->level))
-		kvm_flush_remote_tlbs_with_address(vcpu->kvm, sp->gfn,
-						   KVM_PAGES_PER_HPAGE(iter->level + 1));
+		kvm_flush_remote_tlbs_range(vcpu->kvm, sp->gfn,
+					    KVM_PAGES_PER_HPAGE(iter->level + 1));
 
 	/*
 	 * If the page fault was caused by a write but the page is write
-- 
2.39.0.246.g2a6d74b583-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
