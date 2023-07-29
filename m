Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEEBC001DE
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jul 2023 00:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iR5Snpv6zjPVr1/JLt8oG5NKP/wVi+sKoyK30VFfIb0=; b=k7Rz8jwGHFrbLN
	An4g+DKqdqgdJd3agdZRY9JfWDj8GSQx8KhljziU27jtAM5EdbhQcKZ16AbJBz/uAoTyX3QQBTpNu
	+zN/bsaanks3W6VQ0FAoBs0Ee2E+yJe893f9xtA0ImSNRIlx4w3XWvu8WLtaZxl4uuWn3rZrUOoKq
	JxECA1IgiKj2OVHPes3u3jT3Cvf2LC8Uj41Iojk15h4nF+CgXwGShdrm2Wum/NwA65+VrLQT/WFlc
	eqvYWjzfm3rqfnoY2wVEOCajMf8DeofOW7/wvMHPOqD/CB6t/ZtZVQsg7CmYx1uUs3Huqh3OU/vgx
	nR9GubvTVDzCVZz9R+AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPY21-005f0h-0b;
	Sat, 29 Jul 2023 00:42:05 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPY1l-005eyV-2k
	for linux-riscv@lists.infradead.org;
	Sat, 29 Jul 2023 00:41:51 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d2082104a44so2523200276.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 17:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690591308; x=1691196108;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFylZ7MUbxwsfgnkCbIwukJjKcbZuVflXJcOt3ffCK4=;
        b=0b9hKMxDqRwFQQnLMcqkv8PDDG/B+EGGKIIflyXXH1ZyfSndsboeXJ+TgsSS2iwWwD
         mZK9za+90jiszGzd793UetnAs8xekTA2T4vD5AUxgo9V3HL6L2s22bi7IHqLJj4F6nD2
         rCVTi2QOSa1y//QAMNR9pI55a5+voH5Q75OKbx+jiIKf+60l26WlJxC/Ge3hydIgerhS
         uit7vPqeM5/JYzJwBgmRMtGvrlUQ++fcIaRDfp4/RFoTphs+Z9MfkMGcLscWr4oktRPN
         mWg3Y7aOpahbc8mMonn0PhHsSyXhVyZJ3jKC6IlOJRcTpdIF2gNEz1894Cw3rt+1qqE9
         qRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690591308; x=1691196108;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pFylZ7MUbxwsfgnkCbIwukJjKcbZuVflXJcOt3ffCK4=;
        b=XzeV7Jppxm1QVsadw+G7GTZK2UIhe43FQVlRI8VkLi12bFQypxAlkMpEslxYGtRxIC
         FjiBEdqCy3lnZTVtuNp3h3tGumd0E8DvDpTmZeWe/98i+8P5tGFMOz32eOMsIJqmM8WT
         5K70iOU6JiSmCSkDVTOxYSfoAas0oCrKBuoNbGqFPgeXTE1cAtMXbo5HE2FAMmovqdUZ
         GIzhOV+iYSKah/wA7ASEvCQL6iPveQU3EmfN4c8THUvUT35AzAjQi0sqs0s+a3gzXr6p
         4/bQvwSzKhRp1jyQX2YU5ys4r3Y3Ei25usRoJYolHiBuk1KF6eEqIiYMP8YwoI3k6rHR
         PGbQ==
X-Gm-Message-State: ABy/qLbOwH9jOE+7+OoM43j9ripez5U7B4tAaoa0OGylltYlWR+vQQGV
	amGp8l0jz/Og6FqM+nDWH1zxF3V4OaE=
X-Google-Smtp-Source: APBJJlGYk/HASjtwEfhn9G1Ynkqr6kkqBYHzgw8GP9sqBMBlRYNDe9UG6jZXkz7Xk/58V5PqTY9JcKEc00E=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:54f:0:b0:d16:1f54:75e1 with SMTP id
 76-20020a25054f000000b00d161f5475e1mr19267ybf.0.1690591308572; Fri, 28 Jul
 2023 17:41:48 -0700 (PDT)
Date: Fri, 28 Jul 2023 17:41:44 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230729004144.1054885-1-seanjc@google.com>
Subject: [PATCH] KVM: Wrap kvm_{gfn,hva}_range.pte in a per-action union
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yu Zhao <yuzhao@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_174149_891389_5E613C71 
X-CRM114-Status: GOOD (  13.98  )
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

Wrap kvm_{gfn,hva}_range.pte in a union so that future notifier events can
pass event specific information up and down the stack without needing to
constantly expand and churn the APIs.  Lockless aging of SPTEs will pass
around a bitmap, and support for memory attributes will pass around the
new attributes for the range.

Add a "KVM_NO_ARG" placeholder to simplify handling events without an
argument (creating a dummy union variable is midly annoying).

Opportunstically drop explicit zero-initialization of the "pte" field, as
omitting the field (now a union) has the same effect.

Cc: Yu Zhao <yuzhao@google.com>
Link: https://lore.kernel.org/all/CAOUHufagkd2Jk3_HrVoFFptRXM=hX2CV8f+M-dka-hJU4bP8kw@mail.gmail.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---

If this looks good, my thought is to squeeze it into 6.6 so that the MGLRU
and guest_memfd() series can build on it.  Or those series could just
include it?

 arch/arm64/kvm/mmu.c       |  2 +-
 arch/mips/kvm/mmu.c        |  2 +-
 arch/riscv/kvm/mmu.c       |  2 +-
 arch/x86/kvm/mmu/mmu.c     |  2 +-
 arch/x86/kvm/mmu/tdp_mmu.c |  6 +++---
 include/linux/kvm_host.h   |  6 +++++-
 virt/kvm/kvm_main.c        | 18 +++++++++---------
 7 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6db9ef288ec3..55f03a68f1cd 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1721,7 +1721,7 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 
 bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	kvm_pfn_t pfn = pte_pfn(range->pte);
+	kvm_pfn_t pfn = pte_pfn(range->arg.pte);
 
 	if (!kvm->arch.mmu.pgt)
 		return false;
diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index e8c08988ed37..7b2ac1319d70 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -447,7 +447,7 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	gpa_t gpa = range->start << PAGE_SHIFT;
-	pte_t hva_pte = range->pte;
+	pte_t hva_pte = range->arg.pte;
 	pte_t *gpa_pte = kvm_mips_pte_for_gpa(kvm, NULL, gpa);
 	pte_t old_pte;
 
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index f2eb47925806..857f4312b0f8 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -559,7 +559,7 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	int ret;
-	kvm_pfn_t pfn = pte_pfn(range->pte);
+	kvm_pfn_t pfn = pte_pfn(range->arg.pte);
 
 	if (!kvm->arch.pgd)
 		return false;
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index ec169f5c7dce..d72f2b20f430 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1588,7 +1588,7 @@ static __always_inline bool kvm_handle_gfn_range(struct kvm *kvm,
 	for_each_slot_rmap_range(range->slot, PG_LEVEL_4K, KVM_MAX_HUGEPAGE_LEVEL,
 				 range->start, range->end - 1, &iterator)
 		ret |= handler(kvm, iterator.rmap, range->slot, iterator.gfn,
-			       iterator.level, range->pte);
+			       iterator.level, range->arg.pte);
 
 	return ret;
 }
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 512163d52194..6250bd3d20c1 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1241,7 +1241,7 @@ static bool set_spte_gfn(struct kvm *kvm, struct tdp_iter *iter,
 	u64 new_spte;
 
 	/* Huge pages aren't expected to be modified without first being zapped. */
-	WARN_ON(pte_huge(range->pte) || range->start + 1 != range->end);
+	WARN_ON(pte_huge(range->arg.pte) || range->start + 1 != range->end);
 
 	if (iter->level != PG_LEVEL_4K ||
 	    !is_shadow_present_pte(iter->old_spte))
@@ -1255,9 +1255,9 @@ static bool set_spte_gfn(struct kvm *kvm, struct tdp_iter *iter,
 	 */
 	tdp_mmu_iter_set_spte(kvm, iter, 0);
 
-	if (!pte_write(range->pte)) {
+	if (!pte_write(range->arg.pte)) {
 		new_spte = kvm_mmu_changed_pte_notifier_make_spte(iter->old_spte,
-								  pte_pfn(range->pte));
+								  pte_pfn(range->arg.pte));
 
 		tdp_mmu_iter_set_spte(kvm, iter, new_spte);
 	}
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9d3ac7720da9..9125d0ab642d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -256,11 +256,15 @@ int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
 #endif
 
 #ifdef KVM_ARCH_WANT_MMU_NOTIFIER
+union kvm_mmu_notifier_arg {
+	pte_t pte;
+};
+
 struct kvm_gfn_range {
 	struct kvm_memory_slot *slot;
 	gfn_t start;
 	gfn_t end;
-	pte_t pte;
+	union kvm_mmu_notifier_arg arg;
 	bool may_block;
 };
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index dfbaafbe3a00..f84ef9399aee 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -526,7 +526,7 @@ typedef void (*on_unlock_fn_t)(struct kvm *kvm);
 struct kvm_hva_range {
 	unsigned long start;
 	unsigned long end;
-	pte_t pte;
+	union kvm_mmu_notifier_arg arg;
 	hva_handler_t handler;
 	on_lock_fn_t on_lock;
 	on_unlock_fn_t on_unlock;
@@ -547,6 +547,8 @@ static void kvm_null_fn(void)
 }
 #define IS_KVM_NULL_FN(fn) ((fn) == (void *)kvm_null_fn)
 
+static const union kvm_mmu_notifier_arg KVM_NO_ARG;
+
 /* Iterate over each memslot intersecting [start, last] (inclusive) range */
 #define kvm_for_each_memslot_in_hva_range(node, slots, start, last)	     \
 	for (node = interval_tree_iter_first(&slots->hva_tree, start, last); \
@@ -591,7 +593,7 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 			 * bother making these conditional (to avoid writes on
 			 * the second or later invocation of the handler).
 			 */
-			gfn_range.pte = range->pte;
+			gfn_range.arg = range->arg;
 			gfn_range.may_block = range->may_block;
 
 			/*
@@ -632,14 +634,14 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 						unsigned long start,
 						unsigned long end,
-						pte_t pte,
+						union kvm_mmu_notifier_arg arg,
 						hva_handler_t handler)
 {
 	struct kvm *kvm = mmu_notifier_to_kvm(mn);
 	const struct kvm_hva_range range = {
 		.start		= start,
 		.end		= end,
-		.pte		= pte,
+		.arg		= arg,
 		.handler	= handler,
 		.on_lock	= (void *)kvm_null_fn,
 		.on_unlock	= (void *)kvm_null_fn,
@@ -659,7 +661,6 @@ static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn
 	const struct kvm_hva_range range = {
 		.start		= start,
 		.end		= end,
-		.pte		= __pte(0),
 		.handler	= handler,
 		.on_lock	= (void *)kvm_null_fn,
 		.on_unlock	= (void *)kvm_null_fn,
@@ -693,6 +694,7 @@ static void kvm_mmu_notifier_change_pte(struct mmu_notifier *mn,
 					pte_t pte)
 {
 	struct kvm *kvm = mmu_notifier_to_kvm(mn);
+	const union kvm_mmu_notifier_arg arg = { .pte = pte };
 
 	trace_kvm_set_spte_hva(address);
 
@@ -708,7 +710,7 @@ static void kvm_mmu_notifier_change_pte(struct mmu_notifier *mn,
 	if (!READ_ONCE(kvm->mmu_invalidate_in_progress))
 		return;
 
-	kvm_handle_hva_range(mn, address, address + 1, pte, kvm_change_spte_gfn);
+	kvm_handle_hva_range(mn, address, address + 1, arg, kvm_change_spte_gfn);
 }
 
 void kvm_mmu_invalidate_begin(struct kvm *kvm, unsigned long start,
@@ -747,7 +749,6 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 	const struct kvm_hva_range hva_range = {
 		.start		= range->start,
 		.end		= range->end,
-		.pte		= __pte(0),
 		.handler	= kvm_unmap_gfn_range,
 		.on_lock	= kvm_mmu_invalidate_begin,
 		.on_unlock	= kvm_arch_guest_memory_reclaimed,
@@ -812,7 +813,6 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
 	const struct kvm_hva_range hva_range = {
 		.start		= range->start,
 		.end		= range->end,
-		.pte		= __pte(0),
 		.handler	= (void *)kvm_null_fn,
 		.on_lock	= kvm_mmu_invalidate_end,
 		.on_unlock	= (void *)kvm_null_fn,
@@ -845,7 +845,7 @@ static int kvm_mmu_notifier_clear_flush_young(struct mmu_notifier *mn,
 {
 	trace_kvm_age_hva(start, end);
 
-	return kvm_handle_hva_range(mn, start, end, __pte(0), kvm_age_gfn);
+	return kvm_handle_hva_range(mn, start, end, KVM_NO_ARG, kvm_age_gfn);
 }
 
 static int kvm_mmu_notifier_clear_young(struct mmu_notifier *mn,

base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
-- 
2.41.0.487.g6d72f3e995-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
