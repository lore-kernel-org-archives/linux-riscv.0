Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF40EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 08:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C7glTFkvIJbSXzZXsSElZioaChyDUCkWASemCYfCydI=; b=QywXVAR3E9u8f/
	solPZxHizSrSR35Xq0SqIhXFN8W7rEChcoVyfKcNG0+oDFMIf7VTOHs9S7rqzudCmpP4l67nMJ2d5
	WOG1jVxT/2x72DhPVoonQRZedjNCErIcRD/JTy4RvYnkGyHkcohr93ba25ePAVu1sIBaI64TuWRYv
	A6zd9kK3jBfsE3yp2YsxXqKKciQTsLOsF1hSD/JScHX3CqgASV7epSUwpIiXdqVd3nf7QajVZokoN
	cejZNUTBdcTN0S/lJUwQT9nzzFyLfLJ6Nmsz35P164GmjNusD1wg8H41dNCukBa3h6bebO2WAxG+c
	VaJs/wVwntUcFgrkbDuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2A0-006Ce1-0Q;
	Wed, 19 Jul 2023 08:03:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM29y-006Cdg-2I
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 08:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LxdpiWTpX3B7gMKbPihLQ6FRzF4V55oVGzPxSGe/+4U=; b=RjKuUtuIPF9BAYwajKQ2FKO7Qe
	7DaHppNypBCyhBOG4MtIu2SH86n71OUy6V8H8nKHPk5KSCellEpxn0vTm1DeMPN3nxwDO5dkww++m
	X4knHDJwwbLXyOpavmnqtvK9mn6befM/2OGxniJzj4e43YQHWcILfAGTnezUMhI89wXcHo8POjUcJ
	AFVRRNp9NRkjQ9TWvh9hTZgVinqUY1heojQRAfjY5VTVWj3oarfKtTLI4cIKdCWvo3hpA7wXIAEwv
	FvJxSVyKoQLsrY/gxT9alxyZKdWlBVs28zaBG5mT3ZsIticgleGeoOqIgI8lfAS11ZRqI98hgk0Ab
	/BYp+tCw==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLuRm-00CFGS-0F
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 23:49:50 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1b8a44ee130so32270595ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 16:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724113; x=1692316113;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=LxdpiWTpX3B7gMKbPihLQ6FRzF4V55oVGzPxSGe/+4U=;
        b=1t0P5wmE/XmWdqU7J55641EABrTeVarxWaQR4bJ8HE5kvt+bT2Zvilx6zvBC6IhCug
         lxtaG0ZNNeNxKJwNRyofNcY/3UY8SXaGscGhXtOBqjuhZKJLWAvQEL/Od2vXIHWkp721
         m6ADzg8L3JrLCsaJYeIfX0G7ZaqvY3dbA4PpFF78/ivmcmih9CPggzA6FpbWCll6Rc7J
         s/iuth191O25UoKCd/SjRjFkh1FVoiOHo2ymxYD/iPBQpPOGMgrdqXeht4Yx5rEFGAGu
         E6MjDgW0gFgwwVKsMh4xUPmBsbIlsG5Mzs33eQjh6Yww/GhiF/1eZ4NrCcSo7R/KWv9Z
         IRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724113; x=1692316113;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxdpiWTpX3B7gMKbPihLQ6FRzF4V55oVGzPxSGe/+4U=;
        b=iwl6zIxQKRsNi7w5IjQOY4xJlwX54vXT+3ux3kIGRD/MxYqnj8L0OYsu7T/MY7Io1Y
         kyk6cjSL33vQH55vInDb0QYp9J6jxgCk3ldL6oS+3U74hK7b7RFImR1wf2j9Hq30VXY1
         S3xJqwyicrd9V+PrhCWrUxpvPcqmIXcw3v/zmn1aiNl6yeAVBVIYHMH0nfGhs2mpFQCg
         2mvXW520fo1Fk4cDOCU+4Y3fBRb+VIOmpfHBgH00GKWKQiekrRKkQfBhBsz61MHexm3o
         GtbzSwqo+6zKpPBA1DlrIhZpP9igxThXxdbZb1sRWWXaRMQMiIrQsd6Dg6aEX98M0inq
         Rpzw==
X-Gm-Message-State: ABy/qLZeiLEo9nAatTLVCzesMuyGkjGVUL7rRExV1UXawwmr6gIfu+tQ
	wocbNL4ZSWtULaXo85djrG/5zyHuKuI=
X-Google-Smtp-Source: APBJJlECbx+0jj+7Hb3hGFg2pirZsYDF3lE8aX5+9Q/S485STdtV3M1qZMxLbtNxaVklqPoT+BTJIsFwzzk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2349:b0:1b9:de12:475 with SMTP id
 c9-20020a170903234900b001b9de120475mr8788plh.6.1689724113231; Tue, 18 Jul
 2023 16:48:33 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:44:44 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-2-seanjc@google.com>
Subject: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a per-action union
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_004941_396080_FF744216 
X-CRM114-Status: GOOD (  13.90  )
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

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c       |  2 +-
 arch/mips/kvm/mmu.c        |  2 +-
 arch/riscv/kvm/mmu.c       |  2 +-
 arch/x86/kvm/mmu/mmu.c     |  2 +-
 arch/x86/kvm/mmu/tdp_mmu.c |  6 +++---
 include/linux/kvm_host.h   |  5 ++++-
 virt/kvm/kvm_main.c        | 16 ++++++++++------
 7 files changed, 21 insertions(+), 14 deletions(-)

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
index 9d3ac7720da9..b901571ab61e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -260,7 +260,10 @@ struct kvm_gfn_range {
 	struct kvm_memory_slot *slot;
 	gfn_t start;
 	gfn_t end;
-	pte_t pte;
+	union {
+		pte_t pte;
+		u64 raw;
+	} arg;
 	bool may_block;
 };
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index dfbaafbe3a00..d58b7a506d27 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -526,7 +526,10 @@ typedef void (*on_unlock_fn_t)(struct kvm *kvm);
 struct kvm_hva_range {
 	unsigned long start;
 	unsigned long end;
-	pte_t pte;
+	union {
+		pte_t pte;
+		u64 raw;
+	} arg;
 	hva_handler_t handler;
 	on_lock_fn_t on_lock;
 	on_unlock_fn_t on_unlock;
@@ -562,6 +565,10 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 	struct kvm_memslots *slots;
 	int i, idx;
 
+	BUILD_BUG_ON(sizeof(gfn_range.arg) != sizeof(gfn_range.arg.raw));
+	BUILD_BUG_ON(sizeof(range->arg) != sizeof(range->arg.raw));
+	BUILD_BUG_ON(sizeof(gfn_range.arg) != sizeof(range->arg));
+
 	if (WARN_ON_ONCE(range->end <= range->start))
 		return 0;
 
@@ -591,7 +598,7 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 			 * bother making these conditional (to avoid writes on
 			 * the second or later invocation of the handler).
 			 */
-			gfn_range.pte = range->pte;
+			gfn_range.arg.raw = range->arg.raw;
 			gfn_range.may_block = range->may_block;
 
 			/*
@@ -639,7 +646,7 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 	const struct kvm_hva_range range = {
 		.start		= start,
 		.end		= end,
-		.pte		= pte,
+		.arg.pte	= pte,
 		.handler	= handler,
 		.on_lock	= (void *)kvm_null_fn,
 		.on_unlock	= (void *)kvm_null_fn,
@@ -659,7 +666,6 @@ static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn
 	const struct kvm_hva_range range = {
 		.start		= start,
 		.end		= end,
-		.pte		= __pte(0),
 		.handler	= handler,
 		.on_lock	= (void *)kvm_null_fn,
 		.on_unlock	= (void *)kvm_null_fn,
@@ -747,7 +753,6 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 	const struct kvm_hva_range hva_range = {
 		.start		= range->start,
 		.end		= range->end,
-		.pte		= __pte(0),
 		.handler	= kvm_unmap_gfn_range,
 		.on_lock	= kvm_mmu_invalidate_begin,
 		.on_unlock	= kvm_arch_guest_memory_reclaimed,
@@ -812,7 +817,6 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
 	const struct kvm_hva_range hva_range = {
 		.start		= range->start,
 		.end		= range->end,
-		.pte		= __pte(0),
 		.handler	= (void *)kvm_null_fn,
 		.on_lock	= kvm_mmu_invalidate_end,
 		.on_unlock	= (void *)kvm_null_fn,
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
