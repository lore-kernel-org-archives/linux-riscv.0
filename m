Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BC5CFC5EC
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 18:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZen87NPBVBI+6yLvUfIheMPNtB+PniZzA1i3kCPIA8=; b=nKfBiSCJjMnamn
	qT9vzNpW/C5KBnsVuD2uan4hQXV3Fct03/BXXGC05qgO/bXpy/giz1+9eHNAYkiHvpB8pH+fYD9pY
	PJ0DdrQ5FtbwsHY+eZYMXS6fqX/B18quN6awUTxxtLbQA49TlLzyFpdpkqLsFFEE/yJ0zCTJPTiV8
	N9LorpvaxdAH81RxqwctkXdFtBVe7/lVoJXOfvKCuOMY5P2E0+lWRedlevaF7Ir8o6hrA/DCtAacY
	wvmhFuWrjPVBUc0tH7L5BnS0KGUZNmdTjDvQLXZIx1MV9oFYlJlvDdaYusi+XjOH2he9C9MqajHN0
	x0n3+fwJVg4t28DWAQXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syy42-0000000DwW0-31iR;
	Thu, 10 Oct 2024 18:39:06 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxqT-0000000Dpjz-0Rn0
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:08 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e290d41291bso1588430276.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584704; x=1729189504; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zmCOkT+wuJeT9H1MjXHCrAkGhLQoiMWK376kHF4kwCg=;
        b=Kq1WOn3ILTCesOLo5TwG98ce4X4S2wBk+Zed3w07pth0mmR27m6+zcIyUDuJ90K+tm
         H+FQy9IEhYfF0RVk1sN+uPV9VcfkmlC388brN9oIUwZNBfslQrpSLQpjPEekeKwAECAW
         2yGteXV6Zs9Ai7X0iKtDFBT6EI5+bcL0iQSZm+JwuYIL/GZ6kqokrCisnWfZI2cp/w52
         DNf/U/JvuC2w3tIklSm+kpLK8DDwtz7HtLUb62f7F49qPLWneNZV6W3Chjdfb5rxikNY
         YWlXE+zrdqJb3OTa3cM6srJ+EqsaVuKwpF+4ltKq8VJKibN0Sh4+lO62nT1rXvo2yqGY
         OoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584704; x=1729189504;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmCOkT+wuJeT9H1MjXHCrAkGhLQoiMWK376kHF4kwCg=;
        b=vGDoIriAV4iFJou7wCfdHtNlx3zUd1S9bSW2XCZClJ4+IoZDQuhM2R/lh/zGAGzE5x
         PR9nkq74kBCD0OIsI7ckW+daYozYietpvn5KFSqaw45rAcbKvyefHQBao9GZkQZ++jZK
         rdQWPKAOHV1L9iyIUu8H7n6qJAtp3dKPiZjoh6rPWawMLMl/Xud5ja5+nzLEj4Cua67E
         O5wt4FPDqlPnNwJgnRSJSxO/YVJRokBOkUoDh6PzpmR4pXtXRqOFMLnUjE5aRsS4CCXb
         1V6RyjwMte/ByDOrOaMmsyfo+4ebNNLEptH5auG+2gr6b34QCUEj7+h1g1LavnVqL9+0
         NLHw==
X-Forwarded-Encrypted: i=1; AJvYcCWuxFt4rJqc+eMflQO4k/bxDaa+N1xZxN0DAR0K63YbY3qe0vwEXqSjioJjwNNkhcKT+KaLcjmNSdN75A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw61JDUMFnMZfbOopsuDQdLKRvrcN8U7z59lBPcGoecECpTN0c
	sBHu8Wnhmzrvm6/MU74ZbZotGeTsIh1aNvPBDY/upPp3i+nPmcboFEnIqg6bOc5Gqs6QEvDVWyw
	Ffw==
X-Google-Smtp-Source: AGHT+IHLS32ZnUy4bY0gdVqRjJSlR5N1zmb3UxYk5drKGwVtxhq/Y8NIZIwMp1duovDzYwXPQsOfO5WBu4o=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1812:b0:e24:9f58:dd17 with SMTP id
 3f1490d57ef6-e28fe32f042mr66754276.1.1728584702932; Thu, 10 Oct 2024 11:25:02
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:08 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-7-seanjc@google.com>
Subject: [PATCH v13 06/85] KVM: x86/mmu: Invert @can_unsync and renamed to @synchronizing
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_112505_245091_7124CC70 
X-CRM114-Status: GOOD (  15.47  )
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

Invert the polarity of "can_unsync" and rename the parameter to
"synchronizing" to allow a future change to set the Accessed bit if KVM
is synchronizing an existing SPTE.  Querying "can_unsync" in that case is
nonsensical, as the fact that KVM can't unsync SPTEs doesn't provide any
justification for setting the Accessed bit.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 12 ++++++------
 arch/x86/kvm/mmu/mmu_internal.h |  2 +-
 arch/x86/kvm/mmu/paging_tmpl.h  |  2 +-
 arch/x86/kvm/mmu/spte.c         |  4 ++--
 arch/x86/kvm/mmu/spte.h         |  2 +-
 arch/x86/kvm/mmu/tdp_mmu.c      |  4 ++--
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a8c64069aa89..0f21d6f76cab 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2795,7 +2795,7 @@ static void kvm_unsync_page(struct kvm *kvm, struct kvm_mmu_page *sp)
  * be write-protected.
  */
 int mmu_try_to_unsync_pages(struct kvm *kvm, const struct kvm_memory_slot *slot,
-			    gfn_t gfn, bool can_unsync, bool prefetch)
+			    gfn_t gfn, bool synchronizing, bool prefetch)
 {
 	struct kvm_mmu_page *sp;
 	bool locked = false;
@@ -2810,12 +2810,12 @@ int mmu_try_to_unsync_pages(struct kvm *kvm, const struct kvm_memory_slot *slot,
 
 	/*
 	 * The page is not write-tracked, mark existing shadow pages unsync
-	 * unless KVM is synchronizing an unsync SP (can_unsync = false).  In
-	 * that case, KVM must complete emulation of the guest TLB flush before
-	 * allowing shadow pages to become unsync (writable by the guest).
+	 * unless KVM is synchronizing an unsync SP.  In that case, KVM must
+	 * complete emulation of the guest TLB flush before allowing shadow
+	 * pages to become unsync (writable by the guest).
 	 */
 	for_each_gfn_valid_sp_with_gptes(kvm, sp, gfn) {
-		if (!can_unsync)
+		if (synchronizing)
 			return -EPERM;
 
 		if (sp->unsync)
@@ -2941,7 +2941,7 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
 	}
 
 	wrprot = make_spte(vcpu, sp, slot, pte_access, gfn, pfn, *sptep, prefetch,
-			   true, host_writable, &spte);
+			   false, host_writable, &spte);
 
 	if (*sptep == spte) {
 		ret = RET_PF_SPURIOUS;
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index c98827840e07..4da83544c4e1 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -164,7 +164,7 @@ static inline gfn_t gfn_round_for_level(gfn_t gfn, int level)
 }
 
 int mmu_try_to_unsync_pages(struct kvm *kvm, const struct kvm_memory_slot *slot,
-			    gfn_t gfn, bool can_unsync, bool prefetch);
+			    gfn_t gfn, bool synchronizing, bool prefetch);
 
 void kvm_mmu_gfn_disallow_lpage(const struct kvm_memory_slot *slot, gfn_t gfn);
 void kvm_mmu_gfn_allow_lpage(const struct kvm_memory_slot *slot, gfn_t gfn);
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index ae7d39ff2d07..6e7bd8921c6f 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -963,7 +963,7 @@ static int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int
 	host_writable = spte & shadow_host_writable_mask;
 	slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
 	make_spte(vcpu, sp, slot, pte_access, gfn,
-		  spte_to_pfn(spte), spte, true, false,
+		  spte_to_pfn(spte), spte, true, true,
 		  host_writable, &spte);
 
 	return mmu_spte_update(sptep, spte);
diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index 5521608077ec..0e47fea1a2d9 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -157,7 +157,7 @@ bool spte_has_volatile_bits(u64 spte)
 bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 	       const struct kvm_memory_slot *slot,
 	       unsigned int pte_access, gfn_t gfn, kvm_pfn_t pfn,
-	       u64 old_spte, bool prefetch, bool can_unsync,
+	       u64 old_spte, bool prefetch, bool synchronizing,
 	       bool host_writable, u64 *new_spte)
 {
 	int level = sp->role.level;
@@ -248,7 +248,7 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 		 * e.g. it's write-tracked (upper-level SPs) or has one or more
 		 * shadow pages and unsync'ing pages is not allowed.
 		 */
-		if (mmu_try_to_unsync_pages(vcpu->kvm, slot, gfn, can_unsync, prefetch)) {
+		if (mmu_try_to_unsync_pages(vcpu->kvm, slot, gfn, synchronizing, prefetch)) {
 			wrprot = true;
 			pte_access &= ~ACC_WRITE_MASK;
 			spte &= ~(PT_WRITABLE_MASK | shadow_mmu_writable_mask);
diff --git a/arch/x86/kvm/mmu/spte.h b/arch/x86/kvm/mmu/spte.h
index 2cb816ea2430..c81cac9358e0 100644
--- a/arch/x86/kvm/mmu/spte.h
+++ b/arch/x86/kvm/mmu/spte.h
@@ -499,7 +499,7 @@ bool spte_has_volatile_bits(u64 spte);
 bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 	       const struct kvm_memory_slot *slot,
 	       unsigned int pte_access, gfn_t gfn, kvm_pfn_t pfn,
-	       u64 old_spte, bool prefetch, bool can_unsync,
+	       u64 old_spte, bool prefetch, bool synchronizing,
 	       bool host_writable, u64 *new_spte);
 u64 make_huge_page_split_spte(struct kvm *kvm, u64 huge_spte,
 		      	      union kvm_mmu_page_role role, int index);
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 3c6583468742..76bca7a726c1 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1033,8 +1033,8 @@ static int tdp_mmu_map_handle_target_level(struct kvm_vcpu *vcpu,
 		new_spte = make_mmio_spte(vcpu, iter->gfn, ACC_ALL);
 	else
 		wrprot = make_spte(vcpu, sp, fault->slot, ACC_ALL, iter->gfn,
-					 fault->pfn, iter->old_spte, fault->prefetch, true,
-					 fault->map_writable, &new_spte);
+				   fault->pfn, iter->old_spte, fault->prefetch,
+				   false, fault->map_writable, &new_spte);
 
 	if (new_spte == iter->old_spte)
 		ret = RET_PF_SPURIOUS;
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
