Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076FAC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 20:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WdAoJT1W4rkjvcasgcQZfPrJfIRAk3mFId89arjaj5c=; b=bNzvzCVMIviYzZHWKV6Et4tQ8t
	C1riekYYa4oZ8qFDzUuIPSvjGIwfYpf3us3lLZDa4OAcfnE/7ASlg7qHs+jAjsofMIC5ZM4z/K/ZB
	2tGUeBYXuS3DGgtJ61hpUD0u17Y42SbUOgYj63nr975ABy/UjfG27VAVbWOV4UG6Cp3imdloIiPj8
	m6V+yH4tm0YGrG7SqpGRXEmXrWpyTDPx5SoN9NUkcujyEyD9m7bHbXJcdlf7wNzkzTW1zZPdPYTeM
	WL3fMrJ1BO3oG6+0JsCwsQ2T5bXTWlCD4eAumyvjKfMUY3SwZDOIB+R4Mra/QL1I8LMEq/hDnebBJ
	njG53kxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3NZg-00Al4r-3D; Thu, 08 Dec 2022 20:32:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3NUw-00AgYd-8y
	for linux-riscv@bombadil.infradead.org; Thu, 08 Dec 2022 20:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IqmyM2QEYva7JW7axwbl4xIkL86pAwW/H4sjSNNkIgM=; b=PLe5FyFdZCVid3kg3T0UkYz6br
	NYMcGm5G/8AYes18uX1iPKULSNwxlaxxXSv0x3rYVxxgmWhOL51WAjAoYylWJStGT9Uk27XkpAGhD
	j9kT52etaIJkqbPzI1at3L9XsPjzrDd3BsE8q8BsSFU2K+8MuSAsT+zUHcWh9teztD1IiE7lW9V/e
	wcdf5R8VMp0MoLfDys60LIH7Ggptvi3j9KbLxCOoU/5eH93HpAbvF5Zrxdn3H4DvjNvIDEvxyIJ3E
	YLHquxfOp7O6vCs/YLy5sHY+rrPnQmoi/Mwoys/SeF2sgOYHpyUPKJiOSjZioV2Hrmp0F1kezahPE
	1tWl/W2g==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mk5-008ZnK-Ky
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:39:39 +0000
Received: by mail-yb1-xb49.google.com with SMTP id e15-20020a5b0ccf000000b006ed1704b40cso2547229ybr.5
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IqmyM2QEYva7JW7axwbl4xIkL86pAwW/H4sjSNNkIgM=;
        b=dlUm8IzbDvKb7N133pMZbM/DFF2KBU+Uj9aLv9J4HYtcIkmIb26+E+NQc6WW5lGWbL
         gRjhF2Xtb1+eYvjvVNPz1fbza7FzGrlR1Lu4PkwObVflvo1HWtD/PdV/GtwH/OYCGqmW
         unzqYTbSQw2kEfHvH067uKfBCEte20dfejQENL3zjpmLPkBmJgJlntv4NgZXLQazrFdX
         xuOUsmX6ghWNWZUkpgBa0nNKdgiEWdVdSAmfBWBxgOuca3Crx0ITb6PP4ZfWYj0CDybH
         3DDCzi9SmVtrCH3Ln+bCV9cJJ5HGVNrG9C8r5e5Ny4xwAEq3sPHh7YTtyJKFJzf22O7k
         p2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IqmyM2QEYva7JW7axwbl4xIkL86pAwW/H4sjSNNkIgM=;
        b=lW6xKaJIH/cHTr631UfY1UjS9waY5lduDK49ob3x+bHvp7Mw2F5u23qdOlbmyULJOK
         6DDcv+pG6IJnwWelVA83bgn2b4R6aDOrgemC2ABkLVsy6WgFTi2Wk5QWoilAr0Otiink
         PEexuTWzA7ddco7WeZptZvp5qhSAeoCzcpOvC6fAWoA9gTOJyfYI1wpHlE0ai2tBtxyS
         kGep5sJrevNDhtxtooJKQUUJFx7Jh58LcqCGyweprzygKlbknRXbyExKmHvlR2OECcxv
         BhB8ZxWVVYxhTFNpPwdGj6BMTpEBSOKM2YXgSNNU8eIBwZ7jEGjBXOm+ijRRfbEMtxDj
         UOWQ==
X-Gm-Message-State: ANoB5plcJq2BPy3MF/YpDkmwDJ9zE2IQJrOdOSyhbh0+T8oXgQCinvNm
	D+qAUFwZl86n5GbKz/+BTc4F/PW5crXGQg==
X-Google-Smtp-Source: AA0mqf7z1vyD3rdlMeoQGriM43dtIzP7Gztt83Sfud7zIuPh1YZpIi0HN2kxDCnBaSlw5o2SzSSWGj7vYJ4cig==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a81:7851:0:b0:3b6:e1ed:4185 with SMTP id
 t78-20020a817851000000b003b6e1ed4185mr57305022ywc.330.1670528376810; Thu, 08
 Dec 2022 11:39:36 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:38 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-19-dmatlack@google.com>
Subject: [RFC PATCH 18/37] KVM: x86/mmu: Add common API for creating TDP PTEs
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Matlack <dmatlack@google.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Nadav Amit <namit@vmware.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Krish Sadhukhan <krish.sadhukhan@oracle.com>, Ricardo Koller <ricarkol@google.com>, 
	Jing Zhang <jingzhangos@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_193937_920642_47ABD3BA 
X-CRM114-Status: GOOD (  14.98  )
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

Introduce an API for construction of TDP PTEs.

- tdp_mmu_make_leaf_pte()
- tdp_mmu_make_nonleaf_pte()
- tdp_mmu_make_huge_page_split_pte()
- tdp_mmu_make_changed_pte_notifier_pte()

This will be used in a future commit to move the TDP MMU to common code,
while PTE construction will stay in the architecture-specific code.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/include/asm/kvm/tdp_pgtable.h | 10 +++++++
 arch/x86/kvm/mmu/tdp_mmu.c             | 18 +++++--------
 arch/x86/kvm/mmu/tdp_pgtable.c         | 36 ++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/kvm/tdp_pgtable.h b/arch/x86/include/asm/kvm/tdp_pgtable.h
index c5c4e4cab24a..ff2691ced38b 100644
--- a/arch/x86/include/asm/kvm/tdp_pgtable.h
+++ b/arch/x86/include/asm/kvm/tdp_pgtable.h
@@ -4,6 +4,7 @@
 
 #include <linux/types.h>
 #include <linux/kvm_types.h>
+#include <kvm/mmu_types.h>
 
 struct kvm_mmu_page *tdp_mmu_root(struct kvm_vcpu *vcpu);
 
@@ -57,4 +58,13 @@ kvm_pfn_t tdp_pte_to_pfn(u64 pte);
 
 void tdp_pte_check_leaf_invariants(u64 pte);
 
+struct tdp_iter;
+
+u64 tdp_mmu_make_leaf_pte(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
+			  struct tdp_iter *iter, bool *wrprot);
+u64 tdp_mmu_make_nonleaf_pte(struct kvm_mmu_page *sp);
+u64 tdp_mmu_make_changed_pte_notifier_pte(struct tdp_iter *iter,
+					  struct kvm_gfn_range *range);
+u64 tdp_mmu_make_huge_page_split_pte(struct kvm *kvm, u64 huge_spte,
+				     struct kvm_mmu_page *sp, int index);
 #endif /* !__ASM_KVM_TDP_PGTABLE_H */
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 8155a9e79203..0172b0e44817 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1057,17 +1057,13 @@ static int tdp_mmu_map_handle_target_level(struct kvm_vcpu *vcpu,
 					  struct tdp_iter *iter)
 {
 	struct kvm_mmu_page *sp = sptep_to_sp(rcu_dereference(iter->sptep));
-	u64 new_spte;
 	int ret = RET_PF_FIXED;
 	bool wrprot = false;
+	u64 new_spte;
 
 	WARN_ON(sp->role.level != fault->goal_level);
-	if (unlikely(!fault->slot))
-		new_spte = make_mmio_spte(vcpu, iter->gfn, ACC_ALL);
-	else
-		wrprot = make_spte(vcpu, sp, fault->slot, ACC_ALL, iter->gfn,
-					 fault->pfn, iter->old_spte, fault->prefetch, true,
-					 fault->map_writable, &new_spte);
+
+	new_spte = tdp_mmu_make_leaf_pte(vcpu, fault, iter, &wrprot);
 
 	if (new_spte == iter->old_spte)
 		ret = RET_PF_SPURIOUS;
@@ -1117,7 +1113,7 @@ static int tdp_mmu_map_handle_target_level(struct kvm_vcpu *vcpu,
 static int tdp_mmu_link_sp(struct kvm *kvm, struct tdp_iter *iter,
 			   struct kvm_mmu_page *sp, bool shared)
 {
-	u64 spte = make_nonleaf_spte(sp->spt, !kvm_ad_enabled());
+	u64 spte = tdp_mmu_make_nonleaf_pte(sp);
 	int ret = 0;
 
 	if (shared) {
@@ -1312,9 +1308,7 @@ static bool set_spte_gfn(struct kvm *kvm, struct tdp_iter *iter,
 	tdp_mmu_set_spte(kvm, iter, 0);
 
 	if (!pte_write(range->pte)) {
-		new_spte = kvm_mmu_changed_pte_notifier_make_spte(iter->old_spte,
-								  pte_pfn(range->pte));
-
+		new_spte = tdp_mmu_make_changed_pte_notifier_pte(iter, range);
 		tdp_mmu_set_spte(kvm, iter, new_spte);
 	}
 
@@ -1466,7 +1460,7 @@ static int tdp_mmu_split_huge_page(struct kvm *kvm, struct tdp_iter *iter,
 	 * not been linked in yet and thus is not reachable from any other CPU.
 	 */
 	for (i = 0; i < TDP_PTES_PER_PAGE; i++)
-		sp->spt[i] = make_huge_page_split_spte(kvm, huge_spte, sp->role, i);
+		sp->spt[i] = tdp_mmu_make_huge_page_split_pte(kvm, huge_spte, sp, i);
 
 	/*
 	 * Replace the huge spte with a pointer to the populated lower level
diff --git a/arch/x86/kvm/mmu/tdp_pgtable.c b/arch/x86/kvm/mmu/tdp_pgtable.c
index 97cc900e8818..e036ba0c6bee 100644
--- a/arch/x86/kvm/mmu/tdp_pgtable.c
+++ b/arch/x86/kvm/mmu/tdp_pgtable.c
@@ -5,6 +5,7 @@
 
 #include "mmu.h"
 #include "spte.h"
+#include "tdp_iter.h"
 
 /* Removed SPTEs must not be misconstrued as shadow present PTEs. */
 static_assert(!(REMOVED_TDP_PTE & SPTE_MMU_PRESENT_MASK));
@@ -75,3 +76,38 @@ void tdp_pte_check_leaf_invariants(u64 pte)
 	check_spte_writable_invariants(pte);
 }
 
+u64 tdp_mmu_make_leaf_pte(struct kvm_vcpu *vcpu,
+			  struct kvm_page_fault *fault,
+			  struct tdp_iter *iter,
+			  bool *wrprot)
+{
+	struct kvm_mmu_page *sp = sptep_to_sp(rcu_dereference(iter->sptep));
+	u64 new_spte;
+
+	if (unlikely(!fault->slot))
+		return make_mmio_spte(vcpu, iter->gfn, ACC_ALL);
+
+	*wrprot = make_spte(vcpu, sp, fault->slot, ACC_ALL, iter->gfn,
+			    fault->pfn, iter->old_spte, fault->prefetch, true,
+			    fault->map_writable, &new_spte);
+
+	return new_spte;
+}
+
+u64 tdp_mmu_make_nonleaf_pte(struct kvm_mmu_page *sp)
+{
+	return make_nonleaf_spte(sp->spt, !kvm_ad_enabled());
+}
+
+u64 tdp_mmu_make_changed_pte_notifier_pte(struct tdp_iter *iter,
+					  struct kvm_gfn_range *range)
+{
+	return kvm_mmu_changed_pte_notifier_make_spte(iter->old_spte,
+						      pte_pfn(range->pte));
+}
+
+u64 tdp_mmu_make_huge_page_split_pte(struct kvm *kvm, u64 huge_spte,
+				     struct kvm_mmu_page *sp, int index)
+{
+	return make_huge_page_split_spte(kvm, huge_spte, sp->role, index);
+}
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
