Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF147C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 20:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=J0erIfMUpKOcU1pjpHBf2a4ciiAq0EqeTrlTVwLOZmY=; b=Hakm/DrVhbBhDQbJuNJM7AcRbM
	tQLdg9rk1OR16aRcyGiwFE/UIgz0f++4HRZWxg/UddKE/avl3qgzQuvigMAei2ANsVVBqiJOLGhTl
	8Qchs0QcgrO0drmJgy7IUQUbO0+0/KnSJ35D0icQskPVY+Sy1CE8NE6/ozR24Zj95anv/kP2lO7XM
	Wj9GdQFBgqvYYK4JPEiI/zXvwLHJp0nhe6kWPR8+eijgs2K6bKYbzr1f3kfUorJ9E4aFGDFXsJ+G0
	bJ2Tpzse3NkvHyRGQpgiWc8scYZNbwgA3gEnT0R9LyLBcQCPqzcVnzMvIYCojEN/LfiZ1PVNUYBDI
	Ks2t7QLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Nex-00ApMW-8t; Thu, 08 Dec 2022 20:38:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3NV6-00AgYd-O6
	for linux-riscv@bombadil.infradead.org; Thu, 08 Dec 2022 20:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7K9ka6MUeaf4VmwASDJsBFWEG85o/chirVO+ir7DJ1k=; b=bKBzEWnnUSmo38V1MoJOUz8eBd
	NKZOelA7lZSZJhPd/nbprBk19zV8BeQ7FN6g7K3FUIvSZ8/tPHZsBbXZI/6jh6xgz7MQGCmiWXhzL
	GUd1AEBNm5EkerkRmjG/mba98Tu3Gjy7oemQO3pGLSy+Ttdm3VR0abKyNemJzw9Wi1O7nwlWBIUWz
	axLKlfpRDREpfYUfmYpTrfi1fuH+4cPk9yanqQgi2TdAdSjzKuJLeSyINraysGgk4u8tnGG0QLQpI
	5ncid/CSILalcQTimMFuq2JjBwStbasT18tJ3Fwm+vbxXA3vqasNbE3O+G02O9QWQaXU5zJjP4mmX
	LqYAhTMA==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mjl-008Zly-PC
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:39:21 +0000
Received: by mail-yb1-xb49.google.com with SMTP id c188-20020a25c0c5000000b006d8eba07513so2556179ybf.17
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7K9ka6MUeaf4VmwASDJsBFWEG85o/chirVO+ir7DJ1k=;
        b=irP5mcGoAOYc8wosnD/TtALC0WWa+NGjhVIHJTTnr/3Z8yjzEK7JM4oiVhdZFBRQwy
         zJ2t/ttFB0YDo1jKtcssuFL71HMxb9Mn2FDYgr/S1maeH1kDPYzBK0DF9LASFH6X+Gyz
         ADGVieTHTJS3Xu0juG8XWrdDMzDZvqxucwC6VjLm3/r24BngHKVLne44DdbtStaOGGOh
         nAuOImwdaJqBcKx9C/oAm0bmd7zRXkwa5CkgPV2RFBbSGZAPdiE+y9pF0NYdTwDcUcBb
         YIWPvUTgaFvUXFehRkfrZQ4c+oYOqfGi3KvXXK7lpuBLnfpJgagtw4O5VTtpSo61tAre
         q86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7K9ka6MUeaf4VmwASDJsBFWEG85o/chirVO+ir7DJ1k=;
        b=WrcmVV0tDRH4qG+PzllVQSdZMUdTkUnt/gBFttIxiea2HQyfYl/SSQMq/iRenzBiVk
         5Fz+B+R7HOHK6aG8tQjYP0D+rfa7/6QWAf8VULhvMyBPhB6iXfLeMSAFSmU0YTKxEFcQ
         KCrZJE9rUvwHlkFk0jY4ZJQghgXXBoBC/Z30t38wOv57I17oFapORVx2MIjLBFudRc9G
         jW5d4o9zGqIkRyhPMOdYlnklq2/htPozsDIfjyHjY2l6lUCT4XqnNptqMQcgnE8VYH8y
         XOpb+snz7/7r0ltRkifIljAXxLWkfDg9I6xgCGC7OLFAInOEGZR6S9UmjmlG1SSgfxU/
         xTgg==
X-Gm-Message-State: ANoB5pn7Pr1mDbkkEHlY+4XJSdd37u699QMYwWIbZ1RNHrADkkXdgNVw
	U5c5uk4KqqyHv+ggs1w18+dh5b0/J93yiw==
X-Google-Smtp-Source: AA0mqf4/lKyQk5lKEjo3ymU4c9dqtITM1gYvYc6O/tXnyNlkcxf5NSwbnRprMsGK5JwDZSs7UsMVtOf+2DbYHA==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a81:120d:0:b0:3d5:ecbb:2923 with SMTP id
 13-20020a81120d000000b003d5ecbb2923mr35023748yws.485.1670528355728; Thu, 08
 Dec 2022 11:39:15 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:25 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-6-dmatlack@google.com>
Subject: [RFC PATCH 05/37] KVM: x86/mmu: Unify TDP MMU and Shadow MMU root refcounts
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
X-CRM114-CacheID: sfid-20221208_193917_939783_600DB874 
X-CRM114-Status: GOOD (  19.39  )
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

Use the same field for refcounting roots in the TDP MMU and Shadow MMU.
The atomicity provided by refcount_t is overkill for the Shadow MMU,
since it holds the write-lock. But converging this field will enable a
future commit to more easily move struct kvm_mmu_page to common code.

Note, refcount_dec_and_test() returns true if the resulting refcount is
0. Hence the check in mmu_free_root_page() is inverted to check if
shadow root refcount is 0.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 14 +++++++-------
 arch/x86/kvm/mmu/mmu_internal.h |  6 ++----
 arch/x86/kvm/mmu/mmutrace.h     |  2 +-
 arch/x86/kvm/mmu/tdp_mmu.c      |  8 ++++----
 arch/x86/kvm/mmu/tdp_mmu.h      |  2 +-
 5 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index f7668a32721d..11cef930d5ed 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2498,14 +2498,14 @@ static bool __kvm_mmu_prepare_zap_page(struct kvm *kvm,
 
 	if (sp->unsync)
 		kvm_unlink_unsync_page(kvm, sp);
-	if (!sp->root_count) {
+	if (!refcount_read(&sp->root_refcount)) {
 		/* Count self */
 		(*nr_zapped)++;
 
 		/*
 		 * Already invalid pages (previously active roots) are not on
 		 * the active page list.  See list_del() in the "else" case of
-		 * !sp->root_count.
+		 * !sp->root_refcount.
 		 */
 		if (sp->role.invalid)
 			list_add(&sp->link, invalid_list);
@@ -2515,7 +2515,7 @@ static bool __kvm_mmu_prepare_zap_page(struct kvm *kvm,
 	} else {
 		/*
 		 * Remove the active root from the active page list, the root
-		 * will be explicitly freed when the root_count hits zero.
+		 * will be explicitly freed when the root_refcount hits zero.
 		 */
 		list_del(&sp->link);
 
@@ -2570,7 +2570,7 @@ static void kvm_mmu_commit_zap_page(struct kvm *kvm,
 	kvm_flush_remote_tlbs(kvm);
 
 	list_for_each_entry_safe(sp, nsp, invalid_list, link) {
-		WARN_ON(!sp->role.invalid || sp->root_count);
+		WARN_ON(!sp->role.invalid || refcount_read(&sp->root_refcount));
 		kvm_mmu_free_shadow_page(sp);
 	}
 }
@@ -2593,7 +2593,7 @@ static unsigned long kvm_mmu_zap_oldest_mmu_pages(struct kvm *kvm,
 		 * Don't zap active root pages, the page itself can't be freed
 		 * and zapping it will just force vCPUs to realloc and reload.
 		 */
-		if (sp->root_count)
+		if (refcount_read(&sp->root_refcount))
 			continue;
 
 		unstable = __kvm_mmu_prepare_zap_page(kvm, sp, &invalid_list,
@@ -3481,7 +3481,7 @@ static void mmu_free_root_page(struct kvm *kvm, hpa_t *root_hpa,
 
 	if (is_tdp_mmu_page(sp))
 		kvm_tdp_mmu_put_root(kvm, sp, false);
-	else if (!--sp->root_count && sp->role.invalid)
+	else if (refcount_dec_and_test(&sp->root_refcount) && sp->role.invalid)
 		kvm_mmu_prepare_zap_page(kvm, sp, invalid_list);
 
 	*root_hpa = INVALID_PAGE;
@@ -3592,7 +3592,7 @@ static hpa_t mmu_alloc_root(struct kvm_vcpu *vcpu, gfn_t gfn, int quadrant,
 	WARN_ON_ONCE(role.arch.direct && role.arch.has_4_byte_gpte);
 
 	sp = kvm_mmu_get_shadow_page(vcpu, gfn, role);
-	++sp->root_count;
+	refcount_inc(&sp->root_refcount);
 
 	return __pa(sp->spt);
 }
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index c1a379fba24d..fd4990c8b0e9 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -87,10 +87,8 @@ struct kvm_mmu_page {
 	u64 *shadowed_translation;
 
 	/* Currently serving as active root */
-	union {
-		int root_count;
-		refcount_t tdp_mmu_root_count;
-	};
+	refcount_t root_refcount;
+
 	unsigned int unsync_children;
 	union {
 		struct kvm_rmap_head parent_ptes; /* rmap pointers to parent sptes */
diff --git a/arch/x86/kvm/mmu/mmutrace.h b/arch/x86/kvm/mmu/mmutrace.h
index 6a4a43b90780..ffd10ce3eae3 100644
--- a/arch/x86/kvm/mmu/mmutrace.h
+++ b/arch/x86/kvm/mmu/mmutrace.h
@@ -19,7 +19,7 @@
 	__entry->mmu_valid_gen = sp->mmu_valid_gen;	\
 	__entry->gfn = sp->gfn;				\
 	__entry->role = sp->role.word;			\
-	__entry->root_count = sp->root_count;		\
+	__entry->root_count = refcount_read(&sp->root_refcount);	\
 	__entry->unsync = sp->unsync;
 
 #define KVM_MMU_PAGE_PRINTK() ({				        \
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index fc0b87ceb1ea..34d674080170 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -130,7 +130,7 @@ void kvm_tdp_mmu_put_root(struct kvm *kvm, struct kvm_mmu_page *root,
 {
 	kvm_lockdep_assert_mmu_lock_held(kvm, shared);
 
-	if (!refcount_dec_and_test(&root->tdp_mmu_root_count))
+	if (!refcount_dec_and_test(&root->root_refcount))
 		return;
 
 	/*
@@ -158,7 +158,7 @@ void kvm_tdp_mmu_put_root(struct kvm *kvm, struct kvm_mmu_page *root,
 	 * zap the root because a root cannot go from invalid to valid.
 	 */
 	if (!kvm_tdp_root_mark_invalid(root)) {
-		refcount_set(&root->tdp_mmu_root_count, 1);
+		refcount_set(&root->root_refcount, 1);
 
 		/*
 		 * Zapping the root in a worker is not just "nice to have";
@@ -316,7 +316,7 @@ hpa_t kvm_tdp_mmu_get_vcpu_root_hpa(struct kvm_vcpu *vcpu)
 	root = tdp_mmu_alloc_sp(vcpu);
 	tdp_mmu_init_sp(root, NULL, 0, role);
 
-	refcount_set(&root->tdp_mmu_root_count, 1);
+	refcount_set(&root->root_refcount, 1);
 
 	spin_lock(&kvm->arch.tdp_mmu_pages_lock);
 	list_add_rcu(&root->link, &kvm->arch.tdp_mmu_roots);
@@ -883,7 +883,7 @@ static void tdp_mmu_zap_root(struct kvm *kvm, struct kvm_mmu_page *root,
 	 * and lead to use-after-free as zapping a SPTE triggers "writeback" of
 	 * dirty accessed bits to the SPTE's associated struct page.
 	 */
-	WARN_ON_ONCE(!refcount_read(&root->tdp_mmu_root_count));
+	WARN_ON_ONCE(!refcount_read(&root->root_refcount));
 
 	kvm_lockdep_assert_mmu_lock_held(kvm, shared);
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
index 18d3719f14ea..19d3153051a3 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/arch/x86/kvm/mmu/tdp_mmu.h
@@ -14,7 +14,7 @@ hpa_t kvm_tdp_mmu_get_vcpu_root_hpa(struct kvm_vcpu *vcpu);
 
 __must_check static inline bool kvm_tdp_mmu_get_root(struct kvm_mmu_page *root)
 {
-	return refcount_inc_not_zero(&root->tdp_mmu_root_count);
+	return refcount_inc_not_zero(&root->root_refcount);
 }
 
 void kvm_tdp_mmu_put_root(struct kvm *kvm, struct kvm_mmu_page *root,
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
