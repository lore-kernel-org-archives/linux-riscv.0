Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F4FC001B2
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 20:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6QlG8I4ZiOE+F6HODazx+2eEiuaHOTgNF0vjswqwanE=; b=YR8BUkkVGukQNSbTIKW1gn1FFj
	RlSrNCW2CIM55uLC0s2wN7Fdkw3BmZ7hbuiZWDpPTEvSqbKYb3SCL+HTOPJEzF0oM2/PVvqvMesCS
	rLwo7fH5Vt/BVJQEQ0LIkGJcX2+2SvBTa6n6xHxzjK4BHIP+NVByjYBGcPJZretJnYz8HyKbVmKWt
	mtMJxCttIubz7y49Hd0FUODyLgFfyQpRxvUWLjbjgBSKFB8Zzo8T5jyQkoW8EtltQclXU6y+SCxkg
	R/HK8wVZUVcsuggjieqpBfuLCnjoBJE7u8M2VzF/m0566YDN5hULRaB89Bure3SaXiO539srPx7WS
	0/0IMxqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3NUj-00Aglc-CD; Thu, 08 Dec 2022 20:27:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3NUg-00AgYd-Ud
	for linux-riscv@bombadil.infradead.org; Thu, 08 Dec 2022 20:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=z1OT4qzC8agmu6kAkGnJ2Z35e3wCX96lD5z5dcXDmZ8=; b=ULLbRCVRIF3j6prrUEgai2iFV7
	Noc60IyJFZb0M9xSEURA4oPoYNDrtwJY8kBWZoxrB/wvB6SrMJ/WrJB4lMU/TduXA74CNbX8kuufz
	XpLaR5Wa6LuwSH9Lm8VMkj4qns2wBhK4Sy60BPXlou9ea+YKJIeH+I2rOoFQtWG6xcGr7sT+2cMew
	LEfKFOsyMkS7uhCMboTndit9g4egfnmkmCMKhzkWVBp6/X8DSsx1mi0qxIrKCJ4kzwHEvLQK1gd28
	6YfuMTSnbW9a0BI7Kr6G2VyWzTqwmZ9xG1Sn8ocYIfNT2cvQwm6tWTp1IC1mgnuH1nZv/weuEApYs
	wmjeO9Bg==;
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3MqV-008a2Y-Dh
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:46:17 +0000
Received: by mail-ot1-x349.google.com with SMTP id bx9-20020a056830600900b0066debed5e7dso1227301otb.10
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z1OT4qzC8agmu6kAkGnJ2Z35e3wCX96lD5z5dcXDmZ8=;
        b=mYob1xjdrgICrvdwJ/y+dLEYrXUw8yHkANGFMt6kNW2zwoh86yOA5IqdKm5On/HK71
         rCr+r9ZI6b6AUTyVpRLi2HPUhb4KBRes2A7dYxEjzKSFKujmjFxrPF/BYUNv2Dy6Czkl
         f0L60qH/T+Z7MgC6YZCM/qFdYGB6ww2JwcmxKxWSiQbNX520z0l4UVo1vs6DH+jCVtRB
         Ica965ONYXFaPKJ0DJgySM/ZwSZbyoeXM3nEtFV/eijoma5iS8BYP7SnArJIeoWtwwAs
         /dEWQtSRXEmOgV2EdezDQjp58v5mEPq257Ptg1IsS9acpYvYjSy/WRIyS1Ye2wh2Jdug
         JTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z1OT4qzC8agmu6kAkGnJ2Z35e3wCX96lD5z5dcXDmZ8=;
        b=dy3ws/LNStxYOYHq537Llin+yxNpdNBcWhQn5yIDWcl2AJ4mnKIpkl+IH22CinlZ4B
         XzMkaX1iyGY5KMr19oIxdC8fGbswc7ho2rwfTYe1GkRhozG9fE5YnbbRBwjS1h334SK1
         1AQ6g21a2QGkrnWUAEu+8JxGh7wYNs6pGFhY5pUW8Igoe4ShnmoFv82psBQdQbcnOnH4
         J0yuvuG2pYE6N3moGDDHcG+heTUYR4rrukjPPhdwNFUc4LfpA0/9DPo7crwAgW0c8JZy
         q2Xi0R4bzhYS3ulgNvDssatT4BvQcyLkSPVDV+I9e7Ti7Nt5Cl4czdGoSxHTUNDQeTGR
         MDbQ==
X-Gm-Message-State: ANoB5pm22reH7b1tz+KYsMms3Km7+nTKwwzYBGQspWjpCJFcbRv1y9Ag
	eXQU80GtQGf9AcrN0Upicf4CP791qmGr3g==
X-Google-Smtp-Source: AA0mqf4wDINWYdyDuh5bcErKdq4AXe0SreaRGxGTgiHfTgQy11e7AFp7261AXIzWuvopVOIy1EidXNtJ/FLxDQ==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a17:90a:a78c:b0:219:ef00:9ffe with SMTP
 id f12-20020a17090aa78c00b00219ef009ffemr14658083pjq.106.1670528378506; Thu,
 08 Dec 2022 11:39:38 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:39 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-20-dmatlack@google.com>
Subject: [RFC PATCH 19/37] KVM: x86/mmu: Add arch hooks for NX Huge Pages
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
X-CRM114-CacheID: sfid-20221208_194615_569696_F3976D30 
X-CRM114-Status: GOOD (  13.35  )
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

Abstract away the handling for NX Huge Pages down to arch-specific
hooks. This will be used in a future commit to move the TDP MMU to
common code despite NX Huge Pages, which is x86-specific.

NX Huge Pages is by far the most disruptive feature in terms of needing
the most arch hooks in the TDP MMU.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/tdp_mmu.c     | 57 +++++++++++++++++++---------------
 arch/x86/kvm/mmu/tdp_pgtable.c | 52 +++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+), 25 deletions(-)

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 0172b0e44817..7670fbd8e72d 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -269,17 +269,21 @@ static struct kvm_mmu_page *tdp_mmu_alloc_sp(struct kvm_vcpu *vcpu)
 	return sp;
 }
 
+__weak void tdp_mmu_arch_init_sp(struct kvm_mmu_page *sp)
+{
+}
+
 static void tdp_mmu_init_sp(struct kvm_mmu_page *sp, tdp_ptep_t sptep,
 			    gfn_t gfn, union kvm_mmu_page_role role)
 {
-	INIT_LIST_HEAD(&sp->arch.possible_nx_huge_page_link);
-
 	set_page_private(virt_to_page(sp->spt), (unsigned long)sp);
 
 	sp->role = role;
 	sp->gfn = gfn;
 	sp->ptep = sptep;
 
+	tdp_mmu_arch_init_sp(sp);
+
 	trace_kvm_mmu_get_page(sp, true);
 }
 
@@ -373,6 +377,11 @@ static void tdp_unaccount_mmu_page(struct kvm *kvm, struct kvm_mmu_page *sp)
 	atomic64_dec(&kvm->arch.tdp_mmu_pages);
 }
 
+__weak void tdp_mmu_arch_unlink_sp(struct kvm *kvm, struct kvm_mmu_page *sp,
+				   bool shared)
+{
+}
+
 /**
  * tdp_mmu_unlink_sp() - Remove a shadow page from the list of used pages
  *
@@ -386,20 +395,7 @@ static void tdp_mmu_unlink_sp(struct kvm *kvm, struct kvm_mmu_page *sp,
 			      bool shared)
 {
 	tdp_unaccount_mmu_page(kvm, sp);
-
-	if (!sp->arch.nx_huge_page_disallowed)
-		return;
-
-	if (shared)
-		spin_lock(&kvm->arch.tdp_mmu_pages_lock);
-	else
-		lockdep_assert_held_write(&kvm->mmu_lock);
-
-	sp->arch.nx_huge_page_disallowed = false;
-	untrack_possible_nx_huge_page(kvm, sp);
-
-	if (shared)
-		spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
+	tdp_mmu_arch_unlink_sp(kvm, sp, shared);
 }
 
 /**
@@ -1129,6 +1125,23 @@ static int tdp_mmu_link_sp(struct kvm *kvm, struct tdp_iter *iter,
 	return 0;
 }
 
+__weak void tdp_mmu_arch_adjust_map_level(struct kvm_page_fault *fault,
+					  struct tdp_iter *iter)
+{
+}
+
+__weak void tdp_mmu_arch_pre_link_sp(struct kvm *kvm,
+				     struct kvm_mmu_page *sp,
+				     struct kvm_page_fault *fault)
+{
+}
+
+__weak void tdp_mmu_arch_post_link_sp(struct kvm *kvm,
+				      struct kvm_mmu_page *sp,
+				      struct kvm_page_fault *fault)
+{
+}
+
 static int tdp_mmu_split_huge_page(struct kvm *kvm, struct tdp_iter *iter,
 				   struct kvm_mmu_page *sp, bool shared);
 
@@ -1153,8 +1166,7 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	for_each_tdp_pte(iter, root, fault->gfn, fault->gfn + 1) {
 		int r;
 
-		if (fault->arch.nx_huge_page_workaround_enabled)
-			disallowed_hugepage_adjust(fault, iter.old_spte, iter.level);
+		tdp_mmu_arch_adjust_map_level(fault, &iter);
 
 		if (iter.level == fault->goal_level)
 			break;
@@ -1178,7 +1190,7 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 		sp = tdp_mmu_alloc_sp(vcpu);
 		tdp_mmu_init_child_sp(sp, &iter);
 
-		sp->arch.nx_huge_page_disallowed = fault->arch.huge_page_disallowed;
+		tdp_mmu_arch_pre_link_sp(kvm, sp, fault);
 
 		if (tdp_pte_is_present(iter.old_spte))
 			r = tdp_mmu_split_huge_page(kvm, &iter, sp, true);
@@ -1194,12 +1206,7 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 			goto retry;
 		}
 
-		if (fault->arch.huge_page_disallowed &&
-		    fault->req_level >= iter.level) {
-			spin_lock(&kvm->arch.tdp_mmu_pages_lock);
-			track_possible_nx_huge_page(kvm, sp);
-			spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
-		}
+		tdp_mmu_arch_post_link_sp(kvm, sp, fault);
 	}
 
 	/*
diff --git a/arch/x86/kvm/mmu/tdp_pgtable.c b/arch/x86/kvm/mmu/tdp_pgtable.c
index e036ba0c6bee..b07ed99b4ab1 100644
--- a/arch/x86/kvm/mmu/tdp_pgtable.c
+++ b/arch/x86/kvm/mmu/tdp_pgtable.c
@@ -111,3 +111,55 @@ u64 tdp_mmu_make_huge_page_split_pte(struct kvm *kvm, u64 huge_spte,
 {
 	return make_huge_page_split_spte(kvm, huge_spte, sp->role, index);
 }
+
+void tdp_mmu_arch_adjust_map_level(struct kvm_page_fault *fault,
+				   struct tdp_iter *iter)
+{
+	if (fault->arch.nx_huge_page_workaround_enabled)
+		disallowed_hugepage_adjust(fault, iter->old_spte, iter->level);
+}
+
+void tdp_mmu_arch_init_sp(struct kvm_mmu_page *sp)
+{
+	INIT_LIST_HEAD(&sp->arch.possible_nx_huge_page_link);
+}
+
+void tdp_mmu_arch_pre_link_sp(struct kvm *kvm,
+			      struct kvm_mmu_page *sp,
+			      struct kvm_page_fault *fault)
+{
+	sp->arch.nx_huge_page_disallowed = fault->arch.huge_page_disallowed;
+}
+
+void tdp_mmu_arch_post_link_sp(struct kvm *kvm,
+			       struct kvm_mmu_page *sp,
+			       struct kvm_page_fault *fault)
+{
+	if (!fault->arch.huge_page_disallowed)
+		return;
+
+	if (fault->req_level < sp->role.level)
+		return;
+
+	spin_lock(&kvm->arch.tdp_mmu_pages_lock);
+	track_possible_nx_huge_page(kvm, sp);
+	spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
+}
+
+void tdp_mmu_arch_unlink_sp(struct kvm *kvm, struct kvm_mmu_page *sp,
+			    bool shared)
+{
+	if (!sp->arch.nx_huge_page_disallowed)
+		return;
+
+	if (shared)
+		spin_lock(&kvm->arch.tdp_mmu_pages_lock);
+	else
+		lockdep_assert_held_write(&kvm->mmu_lock);
+
+	sp->arch.nx_huge_page_disallowed = false;
+	untrack_possible_nx_huge_page(kvm, sp);
+
+	if (shared)
+		spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
+}
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
