Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D5FC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 19:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wW5/XDqb46C+aGv+wkMnIRYCTRFrsfao7Bnxe+zvbZM=; b=Xfch81SF+XTqhoep0IO92TnOzs
	amd73um6ZSw9SK3MqBTxddOrr1I8kXo9OJc5oWFAwF0pn5/PQfmnAynDKVcXQRs2j5IEVbQ47yaj/
	8824ZGy9C6HCFxB+1vvw7nxdPtgQw1UWBLhJpSAP5c/SSpPOQZoI4Kos29VUK0bcvnv80x8mzyWzu
	9d0SHmlMrf79TylN9E3b59uxuAWK6wWhyIwtUaXKNGpE62SLE9ktW7yX5GYfJ5i3Dn1cDiBVReo3Z
	4XMozE4dYQqto1nSiA+sYvuUT7O/c/5u4L2ItubIyvfN3lROLZoSHsDVzHLQbZdcvmCrr4OBusMyE
	2s8/7xzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3MvB-00A4Sy-0k; Thu, 08 Dec 2022 19:51:05 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mrp-00A2DQ-2x
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:47:38 +0000
Received: by mail-yb1-xb49.google.com with SMTP id b17-20020a25b851000000b006e32b877068so2566176ybm.16
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pg1Nq3rulqWxdtA2fJcZW38Nt6WCEHzRUfCCpYS2KV0=;
        b=aDqf6pXxZybLQuV+ns7MyujXZ7TaXxPsXCkY1cBCTnm7Z1Pk34Q2WxafDnw6pX7BHN
         lhEXYUvCnQrmxi67UqIabYRYVsFr1VmRYMnDgU/nCVe0vfpF9o0e/pk5kPNnjxwaoCkb
         6UzjVRaqPFUO0UrFxoxAA1OT7EuOIecZ2ihew0iHfezGa4aHmagqVFYtCzqCsOXcoWMG
         1BSI0f3h3n0sV4Xz4NHwLOJuYaVAHIAoL3P08pyo0Lb7cFRQm3wK50yoCvEQji2rKMPw
         TJvkYFZnHosx8g6qnVV89WiLKgj9ZlDUDj9dOxU8qckP9jmYepoaBePV4tvKaqieAvx3
         Iqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pg1Nq3rulqWxdtA2fJcZW38Nt6WCEHzRUfCCpYS2KV0=;
        b=2RbM84Nd/PCY5m9wHKHJplHOIdUx8Mdd4KCdCIvU9pdOPnRYsAqAka+3VR9H+FTHQm
         zObixtqcqrgJPVQCV1LkXQNUOx+ps3BvJMV+mqfXnXMHxwFwQ2ndfTzRaZmDMcEwHUd5
         Im6FuyT4ApRflNRqgUqf0p8KyMdH4zlmxyGmtTb/wcwNZR1NDp53+2apk0v2pQdLaViZ
         /j//J3hpOWH/ABMIIh4JLTnwqAZB/ZZ9fHt08A4uJSxucFT0V1H+Zlu0WwHDVDu6aUi8
         A+nuPStYnCv1QAntGzQ8iP3Btn3thGS1TpzUJIr4zoAkZx++b/Ev+JngHw6NklfA/C49
         kZMQ==
X-Gm-Message-State: ANoB5pnpvMY0t7rCNSwIRUhH1lFIv8JKgUQX6aOfjFT3t/8U71KUEl1u
	g01nYdTDm8pmah8UCm1CO8PhDGu9DsrmNg==
X-Google-Smtp-Source: AA0mqf7iyktvhKElr4AnSOjLzx6ehM+nhpfhEwE2rLq/JpjuQYZLUjwLo76vc17Zh1ckOWCNKP3vo6QzYulWTQ==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:25cf:0:b0:704:9d40:ecce with SMTP id
 l198-20020a2525cf000000b007049d40eccemr9539756ybl.316.1670528373481; Thu, 08
 Dec 2022 11:39:33 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:36 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-17-dmatlack@google.com>
Subject: [RFC PATCH 16/37] KVM: x86/mmu: Abstract away TDP MMU root lookup
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
X-CRM114-CacheID: sfid-20221208_114737_194856_6B045F84 
X-CRM114-Status: GOOD (  14.71  )
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

Abstract the code that looks up the TDP MMU root from vcpu->arch.mmu
behind a function, tdp_mmu_root(). This will be used in a future commit
to allow the TDP MMU to be moved to common code, where vcpu->arch.mmu
cannot be accessed directly.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/include/asm/kvm/tdp_pgtable.h |  2 ++
 arch/x86/kvm/mmu/tdp_mmu.c             | 17 +++++++----------
 arch/x86/kvm/mmu/tdp_pgtable.c         |  5 +++++
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/kvm/tdp_pgtable.h b/arch/x86/include/asm/kvm/tdp_pgtable.h
index cebc4bc44b49..c5c4e4cab24a 100644
--- a/arch/x86/include/asm/kvm/tdp_pgtable.h
+++ b/arch/x86/include/asm/kvm/tdp_pgtable.h
@@ -5,6 +5,8 @@
 #include <linux/types.h>
 #include <linux/kvm_types.h>
 
+struct kvm_mmu_page *tdp_mmu_root(struct kvm_vcpu *vcpu);
+
 /*
  * Use a semi-arbitrary value that doesn't set RWX bits, i.e. is not-present on
  * both AMD and Intel CPUs, and doesn't set PFN bits, i.e. doesn't create a L1TF
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index fea42bbac984..8155a9e79203 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -788,9 +788,6 @@ static inline void tdp_mmu_set_spte_no_dirty_log(struct kvm *kvm,
 			continue;					\
 		else
 
-#define tdp_mmu_for_each_pte(_iter, _mmu, _start, _end)		\
-	for_each_tdp_pte(_iter, to_shadow_page(_mmu->root.hpa), _start, _end)
-
 /*
  * Yield if the MMU lock is contended or this thread needs to return control
  * to the scheduler.
@@ -1145,7 +1142,7 @@ static int tdp_mmu_split_huge_page(struct kvm *kvm, struct tdp_iter *iter,
  */
 int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 {
-	struct kvm_mmu *mmu = vcpu->arch.mmu;
+	struct kvm_mmu_page *root = tdp_mmu_root(vcpu);
 	struct kvm *kvm = vcpu->kvm;
 	struct tdp_iter iter;
 	struct kvm_mmu_page *sp;
@@ -1157,7 +1154,7 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 
 	rcu_read_lock();
 
-	tdp_mmu_for_each_pte(iter, mmu, fault->gfn, fault->gfn + 1) {
+	for_each_tdp_pte(iter, root, fault->gfn, fault->gfn + 1) {
 		int r;
 
 		if (fault->arch.nx_huge_page_workaround_enabled)
@@ -1826,14 +1823,14 @@ bool kvm_tdp_mmu_write_protect_gfn(struct kvm *kvm,
 int kvm_tdp_mmu_get_walk(struct kvm_vcpu *vcpu, u64 addr, u64 *sptes,
 			 int *root_level)
 {
+	struct kvm_mmu_page *root = tdp_mmu_root(vcpu);
 	struct tdp_iter iter;
-	struct kvm_mmu *mmu = vcpu->arch.mmu;
 	gfn_t gfn = addr >> PAGE_SHIFT;
 	int leaf = -1;
 
-	*root_level = vcpu->arch.mmu->root_role.level;
+	*root_level = root->role.level;
 
-	tdp_mmu_for_each_pte(iter, mmu, gfn, gfn + 1) {
+	for_each_tdp_pte(iter, root, gfn, gfn + 1) {
 		leaf = iter.level;
 		sptes[leaf] = iter.old_spte;
 	}
@@ -1855,12 +1852,12 @@ int kvm_tdp_mmu_get_walk(struct kvm_vcpu *vcpu, u64 addr, u64 *sptes,
 u64 *kvm_tdp_mmu_fast_pf_get_last_sptep(struct kvm_vcpu *vcpu, u64 addr,
 					u64 *spte)
 {
+	struct kvm_mmu_page *root = tdp_mmu_root(vcpu);
 	struct tdp_iter iter;
-	struct kvm_mmu *mmu = vcpu->arch.mmu;
 	gfn_t gfn = addr >> PAGE_SHIFT;
 	tdp_ptep_t sptep = NULL;
 
-	tdp_mmu_for_each_pte(iter, mmu, gfn, gfn + 1) {
+	for_each_tdp_pte(iter, root, gfn, gfn + 1) {
 		*spte = iter.old_spte;
 		sptep = iter.sptep;
 	}
diff --git a/arch/x86/kvm/mmu/tdp_pgtable.c b/arch/x86/kvm/mmu/tdp_pgtable.c
index cf3b692d8e21..97cc900e8818 100644
--- a/arch/x86/kvm/mmu/tdp_pgtable.c
+++ b/arch/x86/kvm/mmu/tdp_pgtable.c
@@ -13,6 +13,11 @@ static_assert(TDP_PTE_WRITABLE_MASK == PT_WRITABLE_MASK);
 static_assert(TDP_PTE_HUGE_PAGE_MASK == PT_PAGE_SIZE_MASK);
 static_assert(TDP_PTE_PRESENT_MASK == SPTE_MMU_PRESENT_MASK);
 
+struct kvm_mmu_page *tdp_mmu_root(struct kvm_vcpu *vcpu)
+{
+	return to_shadow_page(vcpu->arch.mmu->root.hpa);
+}
+
 bool tdp_pte_is_accessed(u64 pte)
 {
 	return is_accessed_spte(pte);
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
