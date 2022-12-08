Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381BEC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 19:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qfob/EvLSZQizk8NH4bTrnCKERWd/y35+y6vSXUoRm8=; b=dmVckDmxEuTMxkT3R25GRyelE1
	Sokw+8pPWKw6L1YOmduu5wMSsuPZwEcIlTGt7/pA7j0giPL2PgeO4OEc7w28ID27q3mO0nO/AoWSD
	IA7wm96Q+L0PsCfSDtbAr94wJe3nslBb88nWqwdxE1FySn1irnyYkpGrqZHTrNcJybyLHaDK3tsL4
	H6m0wBXCNjmeTbX0NqwyKgtr1pKDmzKLvTyuepM7b/yhkQzuJcvOIEAPMJiFBnvu6DM/eUCuNUp6A
	qjIwn/f0S8IF3KAfzyoDdwJH+PZUcGg6viRfDAC8hSOcKKnI156TMVeNKSLWL8MjkcRgj1SYoTY9R
	2MIGussA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mkh-009tJR-3J; Thu, 08 Dec 2022 19:40:15 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3MkK-009ssI-8p
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:39:55 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-3d0465d32deso25015737b3.20
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4kZ8qvn0xSGEDmN1BULNYrOl9BfWlHWgwc5Hcokigkg=;
        b=EZdYCeKRzwTZI0V7uIlvSkGrs4qHYIezoRhReYtQLA0czf3gVL/1TNq7yKqDrl8GTn
         oQz0Z7XBBQH/yEQMO1SGLwncbAgZKGbmAOjFD34HdUxLfAxVVglbdugT3hkL39u2KBaC
         zXXOHY89LcKvSnZnJXUb8dDzrzFe4X7e3xR+WnsmfduMxTHD82PxDk3bNR9/eVBZSZCJ
         9KSr/LExzaCvHBnmGNmO5FnVmhBkHRZqq/6nuGCySvf95RTgk84Zq8NxZx5p92YocoN3
         edBU29eHd/xnGcG9xhXPifzW3E7yu6pOK5Yi9gnxeJFRaCY91DpX/jIM8sH3OWbKiQbv
         X7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4kZ8qvn0xSGEDmN1BULNYrOl9BfWlHWgwc5Hcokigkg=;
        b=NmnerKkikFQvr0TQ00SPXzggqazm2L1HPSQLi7mMQI71L3WGwsYO5rdUmsTlMFBun/
         FS1LLyII+EzbBWbCGKEcYy9WCkrdYJSkIq5TufJjxunZi+sM0IW1WLqyPIWKwY3SsX98
         sZDz0WN8sHbn7XeVJlxQSkN5sjtrxbLBTdefnOLqutQIrZlylbHNeNsNTQA9tBFQT6wZ
         nwOuNwsvWdHYDhWQUq3hHejERDEkNFIiSmiwCAMUU4ImFlZ70MipYhDaavY5zentndPj
         Vkl8fU/gtlxhUXeDuJKQBbp1bk0x/4f9tqzfZFVXl4tWOBLYF6LED28Wnq3MApcL1vGa
         Jw7w==
X-Gm-Message-State: ANoB5pl9Whk7arWFOlodvMQvGrfqsQbrnHik4yXtdv9RE2kLfO9PXrN+
	3NjedzcBTvGtAU03PgqMKVQYu0TQxQ1Tkg==
X-Google-Smtp-Source: AA0mqf7VJDwYeOhSUwL8eiN/HYDWJI0TjJovtybda2o797oyUV7aBV39Tw6SLnFjKIqdIxSPeuhwuLTwG1fExA==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:dfc3:0:b0:6f3:2748:7469 with SMTP id
 w186-20020a25dfc3000000b006f327487469mr53271438ybg.564.1670528390734; Thu, 08
 Dec 2022 11:39:50 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:46 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-27-dmatlack@google.com>
Subject: [RFC PATCH 26/37] KVM: Move page table cache to struct kvm_vcpu
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
X-CRM114-CacheID: sfid-20221208_113952_319937_C9FCDD8C 
X-CRM114-Status: GOOD (  19.46  )
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

Add a kvm_mmu_memory_cache to struct kvm_vcpu for allocating pages for
page tables, replacing existing architecture-specific page table caches.

Purposely do not make management of this cache architecture-neutral
though to reduce churn and since not all architectures configure it the
same way (MIPS does not set __GFP_ZERO.)

This eliminates a dependency of the TDP MMU on an architecture-specific
field, which will be used in a future commit to move the TDP MMU to
common code.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 3 ---
 arch/arm64/kvm/arm.c              | 4 ++--
 arch/arm64/kvm/mmu.c              | 2 +-
 arch/mips/include/asm/kvm_host.h  | 3 ---
 arch/mips/kvm/mmu.c               | 4 ++--
 arch/riscv/include/asm/kvm_host.h | 3 ---
 arch/riscv/kvm/mmu.c              | 2 +-
 arch/riscv/kvm/vcpu.c             | 4 ++--
 arch/x86/include/asm/kvm_host.h   | 1 -
 arch/x86/kvm/mmu/mmu.c            | 8 ++++----
 arch/x86/kvm/mmu/tdp_mmu.c        | 2 +-
 include/linux/kvm_host.h          | 5 +++++
 12 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 001c8abe87fc..da519d6c09a5 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -473,9 +473,6 @@ struct kvm_vcpu_arch {
 	/* vcpu power state */
 	struct kvm_mp_state mp_state;
 
-	/* Cache some mmu pages needed inside spinlock regions */
-	struct kvm_mmu_memory_cache mmu_page_cache;
-
 	/* Target CPU and feature flags */
 	int target;
 	DECLARE_BITMAP(features, KVM_VCPU_MAX_FEATURES);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 9c5573bc4614..0e0d4c4f79a2 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -340,7 +340,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	vcpu->arch.target = -1;
 	bitmap_zero(vcpu->arch.features, KVM_VCPU_MAX_FEATURES);
 
-	vcpu->arch.mmu_page_cache.gfp_zero = __GFP_ZERO;
+	vcpu->mmu_page_table_cache.gfp_zero = __GFP_ZERO;
 
 	/*
 	 * Default value for the FP state, will be overloaded at load
@@ -375,7 +375,7 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 	if (vcpu_has_run_once(vcpu) && unlikely(!irqchip_in_kernel(vcpu->kvm)))
 		static_branch_dec(&userspace_irqchip_in_use);
 
-	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_cache);
+	kvm_mmu_free_memory_cache(&vcpu->mmu_page_table_cache);
 	kvm_timer_vcpu_terminate(vcpu);
 	kvm_pmu_vcpu_destroy(vcpu);
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 31d7fa4c7c14..d431c5cdb26a 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1196,7 +1196,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	bool device = false;
 	unsigned long mmu_seq;
 	struct kvm *kvm = vcpu->kvm;
-	struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
+	struct kvm_mmu_memory_cache *memcache = &vcpu->mmu_page_table_cache;
 	struct vm_area_struct *vma;
 	short vma_shift;
 	gfn_t gfn;
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 5cedb28e8a40..b7f276331583 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -344,9 +344,6 @@ struct kvm_vcpu_arch {
 	/* Bitmask of pending exceptions to be cleared */
 	unsigned long pending_exceptions_clr;
 
-	/* Cache some mmu pages needed inside spinlock regions */
-	struct kvm_mmu_memory_cache mmu_page_cache;
-
 	/* vcpu's vzguestid is different on each host cpu in an smp system */
 	u32 vzguestid[NR_CPUS];
 
diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 74cd64a24d05..638f728d0bbe 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -27,7 +27,7 @@
 
 void kvm_mmu_free_memory_caches(struct kvm_vcpu *vcpu)
 {
-	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_cache);
+	kvm_mmu_free_memory_cache(&vcpu->mmu_page_table_cache);
 }
 
 /**
@@ -589,7 +589,7 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 			     pte_t *out_entry, pte_t *out_buddy)
 {
 	struct kvm *kvm = vcpu->kvm;
-	struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
+	struct kvm_mmu_memory_cache *memcache = &vcpu->mmu_page_table_cache;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	int srcu_idx, err;
 	kvm_pfn_t pfn;
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index dbbf43d52623..82e5d80347cc 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -219,9 +219,6 @@ struct kvm_vcpu_arch {
 	/* SBI context */
 	struct kvm_sbi_context sbi_context;
 
-	/* Cache pages needed to program page tables with spinlock held */
-	struct kvm_mmu_memory_cache mmu_page_cache;
-
 	/* VCPU power-off state */
 	bool power_off;
 
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 3620ecac2fa1..a8281a65cb3d 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -625,7 +625,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	struct vm_area_struct *vma;
 	struct kvm *kvm = vcpu->kvm;
-	struct kvm_mmu_memory_cache *pcache = &vcpu->arch.mmu_page_cache;
+	struct kvm_mmu_memory_cache *pcache = &vcpu->mmu_page_table_cache;
 	bool logging = (memslot->dirty_bitmap &&
 			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
 	unsigned long vma_pagesize, mmu_seq;
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 71ebbc4821f0..9a1001ada936 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -160,7 +160,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 	/* Mark this VCPU never ran */
 	vcpu->arch.ran_atleast_once = false;
-	vcpu->arch.mmu_page_cache.gfp_zero = __GFP_ZERO;
+	vcpu->mmu_page_table_cache.gfp_zero = __GFP_ZERO;
 	bitmap_zero(vcpu->arch.isa, RISCV_ISA_EXT_MAX);
 
 	/* Setup ISA features available to VCPU */
@@ -211,7 +211,7 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_timer_deinit(vcpu);
 
 	/* Free unused pages pre-allocated for G-stage page table mappings */
-	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_cache);
+	kvm_mmu_free_memory_cache(&vcpu->mmu_page_table_cache);
 }
 
 int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 95c731028452..8cac8ec29324 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -714,7 +714,6 @@ struct kvm_vcpu_arch {
 	struct kvm_mmu *walk_mmu;
 
 	struct kvm_mmu_memory_cache mmu_pte_list_desc_cache;
-	struct kvm_mmu_memory_cache mmu_shadow_page_cache;
 	struct kvm_mmu_memory_cache mmu_shadowed_info_cache;
 	struct kvm_mmu_memory_cache mmu_page_header_cache;
 
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index aea7df3c2dcb..a845e9141ad4 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -664,7 +664,7 @@ static int mmu_topup_memory_caches(struct kvm_vcpu *vcpu, bool maybe_indirect)
 				       1 + PT64_ROOT_MAX_LEVEL + PTE_PREFETCH_NUM);
 	if (r)
 		return r;
-	r = kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_shadow_page_cache,
+	r = kvm_mmu_topup_memory_cache(&vcpu->mmu_page_table_cache,
 				       PT64_ROOT_MAX_LEVEL);
 	if (r)
 		return r;
@@ -681,7 +681,7 @@ static int mmu_topup_memory_caches(struct kvm_vcpu *vcpu, bool maybe_indirect)
 static void mmu_free_memory_caches(struct kvm_vcpu *vcpu)
 {
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_pte_list_desc_cache);
-	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_shadow_page_cache);
+	kvm_mmu_free_memory_cache(&vcpu->mmu_page_table_cache);
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_shadowed_info_cache);
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_header_cache);
 }
@@ -2218,7 +2218,7 @@ static struct kvm_mmu_page *kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
 {
 	struct shadow_page_caches caches = {
 		.page_header_cache = &vcpu->arch.mmu_page_header_cache,
-		.shadow_page_cache = &vcpu->arch.mmu_shadow_page_cache,
+		.shadow_page_cache = &vcpu->mmu_page_table_cache,
 		.shadowed_info_cache = &vcpu->arch.mmu_shadowed_info_cache,
 	};
 
@@ -5920,7 +5920,7 @@ int kvm_mmu_create(struct kvm_vcpu *vcpu)
 	vcpu->arch.mmu_page_header_cache.kmem_cache = mmu_page_header_cache;
 	vcpu->arch.mmu_page_header_cache.gfp_zero = __GFP_ZERO;
 
-	vcpu->arch.mmu_shadow_page_cache.gfp_zero = __GFP_ZERO;
+	vcpu->mmu_page_table_cache.gfp_zero = __GFP_ZERO;
 
 	vcpu->arch.mmu = &vcpu->arch.root_mmu;
 	vcpu->arch.walk_mmu = &vcpu->arch.root_mmu;
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index c5d1c9010d21..922815407b7e 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -264,7 +264,7 @@ static struct kvm_mmu_page *tdp_mmu_alloc_sp(struct kvm_vcpu *vcpu)
 	struct kvm_mmu_page *sp;
 
 	sp = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_page_header_cache);
-	sp->spt = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_shadow_page_cache);
+	sp->spt = kvm_mmu_memory_cache_alloc(&vcpu->mmu_page_table_cache);
 
 	return sp;
 }
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 242eaed55320..0a9baa493760 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -387,6 +387,11 @@ struct kvm_vcpu {
 	 */
 	struct kvm_memory_slot *last_used_slot;
 	u64 last_used_slot_gen;
+
+#ifdef KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE
+	/* Cache used to allocate pages for use as page tables. */
+	struct kvm_mmu_memory_cache mmu_page_table_cache;
+#endif
 };
 
 /*
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
