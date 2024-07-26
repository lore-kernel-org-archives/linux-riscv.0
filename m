Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DABC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 23:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8Sa7BrW8frtcde4oObPjdBirgiwFczNfqoXuLMsddo=; b=F2UjqGY+H59+6M
	XYCx6RmtXp+NSGYX6CtSR7g/pTqAZgE91+l99otP3dkJVo1daVWSF4CrEhpesXLNjVUuJrxPB4gIT
	07gBsEemiYRhyLHCb/CYNEI/jL5e11uOKT4iERSlcGaOFUTL/O9S1r8/Qg19M5tkniNXajnzFnliy
	0idBE1oFGex1Mp+y6Qms6qEADAbjmeWes5Fb26albF6QYQUq9aTUf8U/Zgs4uZYHXEiBIRlz3OgxF
	u5mwp1tQUOm8rvl9SkVceH+wC/quAtFB02ZhBWttoHIk5Y0eEiisyAKQ2AE2Gymgo3m7pCxNb1tY6
	SZ+sY/WcxabNplHitoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUmd-00000005RZz-2RmL;
	Fri, 26 Jul 2024 23:55:35 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUk0-00000005PGP-45Hp
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:52:55 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-65194ea3d4dso6497617b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037972; x=1722642772; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4JK9GTJ8OrY9PouHIVM6/FWVao5wKjRYWblDInuyPC8=;
        b=SLSXESt3X3wr6b2idKdqGZrU41n4S4fegws7kg0onVL6LxdEfd+P2zW69FM6TMbF08
         c4D/XbLuOMtw+3tygFg4WFsV2o3aIdzs6lA7ZpnGQl4Xq7wjwwnY5SWyHMjRwF2RxYdB
         BU2R62sIBiiXvizJEw4no6EiAZkFQoJUn4fb0TBeKs1G3+/M0UVqiP20LdRN4D07/g5B
         Htw+Wbg2GpV04j2ffsWp8iO0QS2oyGBtzlNd9wtNCEvsP2pQ36ba2nXUTePr1AV1uiOp
         ZHMas83nGgEmVkyuObh7yUR34tcJlzVRhcvuHNc37Lh168Coz2xbK/nTaZXbClEiiR6D
         +FqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037972; x=1722642772;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4JK9GTJ8OrY9PouHIVM6/FWVao5wKjRYWblDInuyPC8=;
        b=rogvUuvO+uSOcML3y+YJCMcPMJhidAD3unavubtUXA+bSWGCkUwtrF/ivHGeGGu7i9
         CXpX9yQRREGxqlbMB7lfPKzmHWOCV8OiphqeXKUdoZlcRfa6mBcT8YOzHXx9DVAw1k1H
         a4BuSwzXk24NSSILVbGadwIUTU8ENA5pQeLUsWnCdQ3Hp1dPO4EA3QbuUHrLf6uWzZq7
         YILi1c5dxYM9J1gt4umhBcCxpZutc4X1ADyBzPhJ4B0dVz9OBOx6piYvgdSEPd/TEvQq
         QHXIo5/1ApE6alpxpUu5mbZCkxFx1MyWwNJpVG2f0LE9pXFTkT2DLFgX9FyawSqUu4uD
         OuJA==
X-Forwarded-Encrypted: i=1; AJvYcCXT+O9zEPoyvf7ZSqsyUJHqvXI4lqo8XQbqRfiauoYkeN6LaMSy+xyb0HHi+8vzi9JqhNXFIl3DyzkBgKLuXUNwlib8QSwb3hIVUhjcj2K8
X-Gm-Message-State: AOJu0YzV/gxE5poNE+MTV3czo7J78XGd+Wys8s5hkaCgKjIM6h1xI65t
	VgvkOfyrxjVBvy/R4J47KrchfVyr1B52rUyczU0k85iro7khynMgnG52dqgbYHHW9yi9CyLi9TQ
	xEA==
X-Google-Smtp-Source: AGHT+IHPFxwOMM7hKklIc91WzRGi/y9tY1tDNjJ/P6YzbKycIVe3cl0TyRdV2w5qTWUMgv20iZ/1nODLU/M=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:fc9:b0:64b:a85:e2c5 with SMTP id
 00721157ae682-67a05b92dafmr390537b3.3.1722037971723; Fri, 26 Jul 2024
 16:52:51 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:16 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-8-seanjc@google.com>
Subject: [PATCH v12 07/84] KVM: x86/mmu: Mark folio dirty when creating SPTE,
 not when zapping/modifying
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_165253_264803_A781BEAB 
X-CRM114-Status: GOOD (  28.54  )
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

Mark pages/folios dirty when creating SPTEs to map PFNs into the guest,
not when zapping or modifying SPTEs, as marking folios dirty when zapping
or modifying SPTEs can be extremely inefficient.  E.g. when KVM is zapping
collapsible SPTEs to reconstitute a hugepage after disbling dirty logging,
KVM will mark every 4KiB pfn as dirty, even though _at least_ 512 pfns are
guaranteed to be in a single folio (the SPTE couldn't potentially be huge
if that weren't the case).  The problem only becomes worse for 1GiB
HugeTLB pages, as KVM can mark a single folio dirty 512*512 times.

Marking a folio dirty when mapping is functionally safe as KVM drops all
relevant SPTEs in response to an mmu_notifier invalidation, i.e. ensures
that the guest can't dirty a folio after access has been removed.

And because KVM already marks folios dirty when zapping/modifying SPTEs
for KVM reasons, i.e. not in response to an mmu_notifier invalidation,
there is no danger of "prematurely" marking a folio dirty.  E.g. if a
filesystems cleans a folio without first removing write access, then there
already exists races where KVM could mark a folio dirty before remote TLBs
are flushed, i.e. before guest writes are guaranteed to stop.  Furthermore,
x86 is literally the only architecture that marks folios dirty on the
backend; every other KVM architecture marks folios dirty at map time.

x86's unique behavior likely stems from the fact that x86's MMU predates
mmu_notifiers.  Long, long ago, before mmu_notifiers were added, marking
pages dirty when zapping SPTEs was logical, and perhaps even necessary, as
KVM held references to pages, i.e. kept a page's refcount elevated while
the page was mapped into the guest.  At the time, KVM's rmap_remove()
simply did:

        if (is_writeble_pte(*spte))
                kvm_release_pfn_dirty(pfn);
        else
                kvm_release_pfn_clean(pfn);

i.e. dropped the refcount and marked the page dirty at the same time.
After mmu_notifiers were introduced, commit acb66dd051d0 ("KVM: MMU:
don't hold pagecount reference for mapped sptes pages") removed the
refcount logic, but kept the dirty logic, i.e. converted the above to:

	if (is_writeble_pte(*spte))
		kvm_release_pfn_dirty(pfn);

And for KVM x86, that's essentially how things have stayed over the last
~15 years, without anyone revisiting *why* KVM marks pages/folios dirty at
zap/modification time, e.g. the behavior was blindly carried forward to
the TDP MMU.

Practically speaking, the only downside to marking a folio dirty during
mapping is that KVM could trigger writeback of memory that was never
actually written.  Except that can't actually happen if KVM marks folios
dirty if and only if a writable SPTE is created (as done here), because
KVM always marks writable SPTEs as dirty during make_spte().  See commit
9b51a63024bd ("KVM: MMU: Explicitly set D-bit for writable spte."), circa
2015.

Note, KVM's access tracking logic for prefetched SPTEs is a bit odd.  If a
guest PTE is dirty and writable, KVM will create a writable SPTE, but then
mark the SPTE for access tracking.  Which isn't wrong, just a bit odd, as
it results in _more_ precise dirty tracking for MMUs _without_ A/D bits.

To keep things simple, mark the folio dirty before access tracking comes
into play, as an access-tracked SPTE can be restored in the fast page
fault path, i.e. without holding mmu_lock.  While writing SPTEs and
accessing memslots outside of mmu_lock is safe, marking a folio dirty is
not.  E.g. if the fast path gets interrupted _just_ after setting a SPTE,
the primary MMU could theoretically invalidate and free a folio before KVM
marks it dirty.  Unlike the shadow MMU, which waits for CPUs to respond to
an IPI, the TDP MMU only guarantees the page tables themselves won't be
freed (via RCU).

Opportunistically update a few stale comments.

Cc: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c         | 29 ++++-------------------------
 arch/x86/kvm/mmu/paging_tmpl.h |  6 +++---
 arch/x86/kvm/mmu/spte.c        | 20 ++++++++++++++++++--
 arch/x86/kvm/mmu/tdp_mmu.c     | 12 ------------
 4 files changed, 25 insertions(+), 42 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 901be9e420a4..2e6daa6d1cc0 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -547,10 +547,8 @@ static bool mmu_spte_update(u64 *sptep, u64 new_spte)
 		kvm_set_pfn_accessed(spte_to_pfn(old_spte));
 	}
 
-	if (is_dirty_spte(old_spte) && !is_dirty_spte(new_spte)) {
+	if (is_dirty_spte(old_spte) && !is_dirty_spte(new_spte))
 		flush = true;
-		kvm_set_pfn_dirty(spte_to_pfn(old_spte));
-	}
 
 	return flush;
 }
@@ -593,9 +591,6 @@ static u64 mmu_spte_clear_track_bits(struct kvm *kvm, u64 *sptep)
 	if (is_accessed_spte(old_spte))
 		kvm_set_pfn_accessed(pfn);
 
-	if (is_dirty_spte(old_spte))
-		kvm_set_pfn_dirty(pfn);
-
 	return old_spte;
 }
 
@@ -626,13 +621,6 @@ static bool mmu_spte_age(u64 *sptep)
 		clear_bit((ffs(shadow_accessed_mask) - 1),
 			  (unsigned long *)sptep);
 	} else {
-		/*
-		 * Capture the dirty status of the page, so that it doesn't get
-		 * lost when the SPTE is marked for access tracking.
-		 */
-		if (is_writable_pte(spte))
-			kvm_set_pfn_dirty(spte_to_pfn(spte));
-
 		spte = mark_spte_for_access_track(spte);
 		mmu_spte_update_no_track(sptep, spte);
 	}
@@ -1275,16 +1263,6 @@ static bool spte_clear_dirty(u64 *sptep)
 	return mmu_spte_update(sptep, spte);
 }
 
-static bool spte_wrprot_for_clear_dirty(u64 *sptep)
-{
-	bool was_writable = test_and_clear_bit(PT_WRITABLE_SHIFT,
-					       (unsigned long *)sptep);
-	if (was_writable && !spte_ad_enabled(*sptep))
-		kvm_set_pfn_dirty(spte_to_pfn(*sptep));
-
-	return was_writable;
-}
-
 /*
  * Gets the GFN ready for another round of dirty logging by clearing the
  *	- D bit on ad-enabled SPTEs, and
@@ -1300,7 +1278,8 @@ static bool __rmap_clear_dirty(struct kvm *kvm, struct kvm_rmap_head *rmap_head,
 
 	for_each_rmap_spte(rmap_head, &iter, sptep)
 		if (spte_ad_need_write_protect(*sptep))
-			flush |= spte_wrprot_for_clear_dirty(sptep);
+			flush |= test_and_clear_bit(PT_WRITABLE_SHIFT,
+						    (unsigned long *)sptep);
 		else
 			flush |= spte_clear_dirty(sptep);
 
@@ -3381,7 +3360,7 @@ static bool fast_pf_fix_direct_spte(struct kvm_vcpu *vcpu,
 	 * harm. This also avoids the TLB flush needed after setting dirty bit
 	 * so non-PML cases won't be impacted.
 	 *
-	 * Compare with set_spte where instead shadow_dirty_mask is set.
+	 * Compare with make_spte() where instead shadow_dirty_mask is set.
 	 */
 	if (!try_cmpxchg64(sptep, &old_spte, new_spte))
 		return false;
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index 69941cebb3a8..ef0b3b213e5b 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -891,9 +891,9 @@ static gpa_t FNAME(gva_to_gpa)(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
 
 /*
  * Using the information in sp->shadowed_translation (kvm_mmu_page_get_gfn()) is
- * safe because:
- * - The spte has a reference to the struct page, so the pfn for a given gfn
- *   can't change unless all sptes pointing to it are nuked first.
+ * safe because SPTEs are protected by mmu_notifiers and memslot generations, so
+ * the pfn for a given gfn can't change unless all SPTEs pointing to the gfn are
+ * nuked first.
  *
  * Returns
  * < 0: failed to sync spte
diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index a3baf0cadbee..9b8795bd2f04 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -232,8 +232,8 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 		 * unnecessary (and expensive).
 		 *
 		 * The same reasoning applies to dirty page/folio accounting;
-		 * KVM will mark the folio dirty using the old SPTE, thus
-		 * there's no need to immediately mark the new SPTE as dirty.
+		 * KVM marked the folio dirty when the old SPTE was created,
+		 * thus there's no need to mark the folio dirty again.
 		 *
 		 * Note, both cases rely on KVM not changing PFNs without first
 		 * zapping the old SPTE, which is guaranteed by both the shadow
@@ -266,12 +266,28 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 		  "spte = 0x%llx, level = %d, rsvd bits = 0x%llx", spte, level,
 		  get_rsvd_bits(&vcpu->arch.mmu->shadow_zero_check, spte, level));
 
+	/*
+	 * Mark the memslot dirty *after* modifying it for access tracking.
+	 * Unlike folios, memslots can be safely marked dirty out of mmu_lock,
+	 * i.e. in the fast page fault handler.
+	 */
 	if ((spte & PT_WRITABLE_MASK) && kvm_slot_dirty_track_enabled(slot)) {
 		/* Enforced by kvm_mmu_hugepage_adjust. */
 		WARN_ON_ONCE(level > PG_LEVEL_4K);
 		mark_page_dirty_in_slot(vcpu->kvm, slot, gfn);
 	}
 
+	/*
+	 * If the page that KVM got from the primary MMU is writable, i.e. if
+	 * it's host-writable, mark the page/folio dirty.  As alluded to above,
+	 * folios can't be safely marked dirty in the fast page fault handler,
+	 * and so KVM must (somewhat) speculatively mark the folio dirty even
+	 * though it isn't guaranteed to be written as KVM won't mark the folio
+	 * dirty if/when the SPTE is made writable.
+	 */
+	if (host_writable)
+		kvm_set_pfn_dirty(pfn);
+
 	*new_spte = spte;
 	return wrprot;
 }
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index c7dc49ee7388..7ac43d1ce918 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -511,10 +511,6 @@ static void handle_changed_spte(struct kvm *kvm, int as_id, gfn_t gfn,
 	if (is_leaf != was_leaf)
 		kvm_update_page_stats(kvm, level, is_leaf ? 1 : -1);
 
-	if (was_leaf && is_dirty_spte(old_spte) &&
-	    (!is_present || !is_dirty_spte(new_spte) || pfn_changed))
-		kvm_set_pfn_dirty(spte_to_pfn(old_spte));
-
 	/*
 	 * Recursively handle child PTs if the change removed a subtree from
 	 * the paging structure.  Note the WARN on the PFN changing without the
@@ -1248,13 +1244,6 @@ static bool age_gfn_range(struct kvm *kvm, struct tdp_iter *iter,
 							 iter->level);
 		new_spte = iter->old_spte & ~shadow_accessed_mask;
 	} else {
-		/*
-		 * Capture the dirty status of the page, so that it doesn't get
-		 * lost when the SPTE is marked for access tracking.
-		 */
-		if (is_writable_pte(iter->old_spte))
-			kvm_set_pfn_dirty(spte_to_pfn(iter->old_spte));
-
 		new_spte = mark_spte_for_access_track(iter->old_spte);
 		iter->old_spte = kvm_tdp_mmu_write_spte(iter->sptep,
 							iter->old_spte, new_spte,
@@ -1595,7 +1584,6 @@ static void clear_dirty_pt_masked(struct kvm *kvm, struct kvm_mmu_page *root,
 		trace_kvm_tdp_mmu_spte_changed(iter.as_id, iter.gfn, iter.level,
 					       iter.old_spte,
 					       iter.old_spte & ~dbit);
-		kvm_set_pfn_dirty(spte_to_pfn(iter.old_spte));
 	}
 
 	rcu_read_unlock();
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
