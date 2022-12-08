Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53784C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 20:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jVHtxWSOfXBYgYevnMTx0Dfz/3+PCRzT3NBNR2SmgN8=; b=2bxP+CQGrG+U/C3G0LktjbUKxq
	nIBZjg9HhlSdAFxdbjBEE0ryWQ2GsyL0tHgGD6L+OS/75SCu+QcD/0O2kR14IxfW4mhKMwpHJa+xA
	0Wp2FTOSdG8X0ZUV0b15xSNdEpMkHXagHWvnLZ7m8jouktLOCfJ6+DY6/Ce92LsDaQcH6KLmF1rfm
	yXUgDP38GuJQ3XvXb9ye/iNhd+LHFnDgH1AHszywWY/RPiCWQhXDftTfjiw3A/lZZdcVVhdcEjVaW
	0mHp0gfau3dUi3Bh635Phryau/4lFmOXGRnQIALCf9N3bmeOTnG2QiyFuyIeMOHweEpq0tMMdqmMi
	oAbvxJSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3NXq-00Ajok-Tn; Thu, 08 Dec 2022 20:31:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3NUt-00AgYd-0I
	for linux-riscv@bombadil.infradead.org; Thu, 08 Dec 2022 20:27:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dgqMnMt1QIlmBLa3o//o520F4RUXcCCtqFrzTbNkpWk=; b=lB1+TylSjOwJcGg+7HEzkzXIWC
	9tKKtVZ+b3HyFyhY2gyu6pCotzZXgpMN5XIgecwnsXXMmsOktnE6+zKqXP5ro+Pft7ZUorwpw1+Iy
	rLVP7klQRC/rjFuwzt+AqRayri5V/c+XiqGg8p36QSCsMT/Y5k1NyA/3eEzhELq7ukC98jeRyzeGs
	NUxhbmbFPP4iMtNwwIxvddJkr/pH1710xvoDAoM/MkI7bZIXBHZmPKSpxhx94F8uZzECfQOltyRNf
	Ada0miLAHnKJ69g/fKmuRyDeUTeXqEyoAXWPWGWblA3gvTD5wuYs3TLJ8HoNyAy8V0I1mU3APAYen
	QnSAf9Rg==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3MkL-008Zly-1N
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:39:55 +0000
Received: by mail-yb1-xb49.google.com with SMTP id c188-20020a25c0c5000000b006d8eba07513so2557766ybf.17
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dgqMnMt1QIlmBLa3o//o520F4RUXcCCtqFrzTbNkpWk=;
        b=f4QHeg61IzowzK+7yuPHF1TXnPTFwNskqnQKjcsu0WxAKIY1McB7wZRn+VuSfBM9b8
         ylyyA9kcFWxQm6+GX+bMJZFHcWTGXb7YNV/fpxz2TqMv2QX/5/VLhbXkWs5BZNCv8lvE
         iAqaka88+2+N5tw21tP1s0c6lUAdukNFngVoXini/VGsGOpfrraDUlE9nKTf3FFTHm9y
         KUTGqSOH2A4NquRC0hECU12i0F9wQKuKP4xBOjtC4vxLFMrVdTK8VzxOC9xjDjBZVdgu
         7TIFyQpSoyu3BW883wqt4S03Vt2JnLjwrIPiyoLIXLGjApjxjBQRjkRdpzCFxXjOiqSy
         115A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dgqMnMt1QIlmBLa3o//o520F4RUXcCCtqFrzTbNkpWk=;
        b=tnBfSbDoYGzvZgDawMhaxkq26E6dvOX6c+Yw9wgxigvzsJXu7Zz504itzhI0iXsrRK
         KTin1TCnEfC9bovz6fHX4+uxpFmpkEbRbIy1imuaD79YEkXMlozVk8HLkN0ISM0or3QA
         AjYsLscUzXyXTuMjc4RcY6AHRxF9+GnQgzh+kOrOhNOWdD0VVj1JNGZ8O05e5Oh7uI2n
         lulJCv1DVVOfZXLXFkZ1D9ATspcW+FUA90nLW3UsHfvHM0bIKI2br9gqEO8RPGGYb7O6
         kgJTst3xvFeitrAunLF0ynZCwKp86W5I20Y9K8QoIwcqclyRleWGuiEd7vHOibswDW7J
         787A==
X-Gm-Message-State: ANoB5pk9P2tCnbKiVXrte4xak0tGje91cxg8d6DS27yrcTAtHsGAZAnt
	1xS3K65B81GbEeOtV15hwjRtXKDpyd1jwA==
X-Google-Smtp-Source: AA0mqf5mi9mDJ9tYVtakRomun512INrgKlNeUrlvHGHQBPGnddPX6ZC9IDNboVvCBGP15bWz6s6DsMaL8j57qA==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:b885:0:b0:701:49ca:8ae8 with SMTP id
 w5-20020a25b885000000b0070149ca8ae8mr16438842ybj.553.1670528392392; Thu, 08
 Dec 2022 11:39:52 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:47 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-28-dmatlack@google.com>
Subject: [RFC PATCH 27/37] KVM: MMU: Move mmu_page_header_cache to common code
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
X-CRM114-CacheID: sfid-20221208_193953_272670_189430BD 
X-CRM114-Status: GOOD (  16.15  )
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

Move vcpu->arch.mmu_page_header_cache and its backing kmem_cache to common code
in preparation for moving the TDP MMU to common code in a future commit.

The kmem_cache is still only initialized and used on x86 for the time being to
avoid affecting other architectures. A future commit can move the code to
manage this cache to common code.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 11 +++++------
 arch/x86/kvm/mmu/mmu_internal.h |  2 --
 arch/x86/kvm/mmu/tdp_mmu.c      |  2 +-
 include/kvm/mmu.h               |  2 ++
 include/linux/kvm_host.h        |  3 +++
 virt/kvm/kvm_main.c             |  1 +
 6 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a845e9141ad4..f01ee01f3509 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -163,7 +163,6 @@ struct kvm_shadow_walk_iterator {
 	     __shadow_walk_next(&(_walker), spte))
 
 static struct kmem_cache *pte_list_desc_cache;
-struct kmem_cache *mmu_page_header_cache;
 static struct percpu_counter kvm_total_used_mmu_pages;
 
 static void mmu_spte_set(u64 *sptep, u64 spte);
@@ -674,7 +673,7 @@ static int mmu_topup_memory_caches(struct kvm_vcpu *vcpu, bool maybe_indirect)
 		if (r)
 			return r;
 	}
-	return kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_page_header_cache,
+	return kvm_mmu_topup_memory_cache(&vcpu->mmu_page_header_cache,
 					  PT64_ROOT_MAX_LEVEL);
 }
 
@@ -683,7 +682,7 @@ static void mmu_free_memory_caches(struct kvm_vcpu *vcpu)
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_pte_list_desc_cache);
 	kvm_mmu_free_memory_cache(&vcpu->mmu_page_table_cache);
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_shadowed_info_cache);
-	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_header_cache);
+	kvm_mmu_free_memory_cache(&vcpu->mmu_page_header_cache);
 }
 
 static void mmu_free_pte_list_desc(struct pte_list_desc *pte_list_desc)
@@ -2217,7 +2216,7 @@ static struct kvm_mmu_page *kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
 						    union kvm_mmu_page_role role)
 {
 	struct shadow_page_caches caches = {
-		.page_header_cache = &vcpu->arch.mmu_page_header_cache,
+		.page_header_cache = &vcpu->mmu_page_header_cache,
 		.shadow_page_cache = &vcpu->mmu_page_table_cache,
 		.shadowed_info_cache = &vcpu->arch.mmu_shadowed_info_cache,
 	};
@@ -5917,8 +5916,8 @@ int kvm_mmu_create(struct kvm_vcpu *vcpu)
 	vcpu->arch.mmu_pte_list_desc_cache.kmem_cache = pte_list_desc_cache;
 	vcpu->arch.mmu_pte_list_desc_cache.gfp_zero = __GFP_ZERO;
 
-	vcpu->arch.mmu_page_header_cache.kmem_cache = mmu_page_header_cache;
-	vcpu->arch.mmu_page_header_cache.gfp_zero = __GFP_ZERO;
+	vcpu->mmu_page_header_cache.kmem_cache = mmu_page_header_cache;
+	vcpu->mmu_page_header_cache.gfp_zero = __GFP_ZERO;
 
 	vcpu->mmu_page_table_cache.gfp_zero = __GFP_ZERO;
 
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index d3c1d08002af..4aa60d5d87b0 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -44,8 +44,6 @@ extern bool dbg;
 #define INVALID_PAE_ROOT	0
 #define IS_VALID_PAE_ROOT(x)	(!!(x))
 
-extern struct kmem_cache *mmu_page_header_cache;
-
 static inline bool kvm_mmu_page_ad_need_write_protect(struct kvm_mmu_page *sp)
 {
 	/*
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 922815407b7e..891877a6fb78 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -263,7 +263,7 @@ static struct kvm_mmu_page *tdp_mmu_alloc_sp(struct kvm_vcpu *vcpu)
 {
 	struct kvm_mmu_page *sp;
 
-	sp = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_page_header_cache);
+	sp = kvm_mmu_memory_cache_alloc(&vcpu->mmu_page_header_cache);
 	sp->spt = kvm_mmu_memory_cache_alloc(&vcpu->mmu_page_table_cache);
 
 	return sp;
diff --git a/include/kvm/mmu.h b/include/kvm/mmu.h
index 425db8e4f8e9..f1416828f8fe 100644
--- a/include/kvm/mmu.h
+++ b/include/kvm/mmu.h
@@ -4,6 +4,8 @@
 
 #include <kvm/mmu_types.h>
 
+extern struct kmem_cache *mmu_page_header_cache;
+
 static inline struct kvm_mmu_page *to_shadow_page(hpa_t shadow_page)
 {
 	struct page *page = pfn_to_page((shadow_page) >> PAGE_SHIFT);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 0a9baa493760..ec3a6de6d54e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -391,6 +391,9 @@ struct kvm_vcpu {
 #ifdef KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE
 	/* Cache used to allocate pages for use as page tables. */
 	struct kvm_mmu_memory_cache mmu_page_table_cache;
+
+	/* Cache used to allocate kvm_mmu_page structs. */
+	struct kvm_mmu_memory_cache mmu_page_header_cache;
 #endif
 };
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 954ab969f55e..0f1d48ed7d57 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -108,6 +108,7 @@ static int kvm_usage_count;
 static atomic_t hardware_enable_failed;
 
 static struct kmem_cache *kvm_vcpu_cache;
+struct kmem_cache *mmu_page_header_cache;
 
 static __read_mostly struct preempt_ops kvm_preempt_ops;
 static DEFINE_PER_CPU(struct kvm_vcpu *, kvm_running_vcpu);
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
