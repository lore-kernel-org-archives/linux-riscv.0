Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBF4C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 20:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hBmwNG3eBBhbTPyRAYcU99NyxgnZEVZ3Y11oPouGJa0=; b=ukL7qZ0sAAiAWpZzbGONlglcJ0
	s1QyY91FWsLDmefqzCZtGrynFu1dN8AicDa0RDLXs7Zpl51hS5OZBi2K6sZuQy/W3BgEcVo/62KdF
	PhStoZtOX9GW2nTwk6d0NrJ2eDhW6+n5M+zwIROXk2LGt1TJEi+yoQzY2FP9KbagWWWfEhWmF9qdk
	a5mnsg2HZM5e6UJiVkW6zMqx5NYOmRL+ni47qvh/HaUwMFdm5mpaESLET7SogKUaYlaxdtLQcymM4
	/Spr5p/zBWqO7AklF798Ti2lqub0O7z/Xx4YCck2KsI2hebgqzDQ63mH0OGiyKPO1FTwT2MqNXowg
	tOaxJsWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3NpD-00AwgF-Rf; Thu, 08 Dec 2022 20:48:59 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mjg-009rIJ-6g
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:39:13 +0000
Received: by mail-pj1-x1049.google.com with SMTP id ot18-20020a17090b3b5200b00219c3543529so5254985pjb.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zB9oiH2BRr4yMBo3wf45SO3Nck80VorbJdVA47iblXM=;
        b=g9cixz5ghWNJL3K+TodNMkBqI/oQhLTOr97M7M2/XpZEkjrmI3nr8w2JGkmRiCYvFp
         oCqkxLLopMMEof8X6INg95QudTyolVDU+RZhaURZt8OAHqkW63+Kglxtq76sXMR3UwFq
         TH0D0M7upbnITs3QBeHc4oBh6Bot1NKIQBOUihmvyAsu3jIi5z0OXboG4BlLnZQDvrbN
         irbKiodu/sENkvb3heU4imTZch1oJk77UygEm5fQ1B7wZYOkf7/kSwfDOcxQWmBFS0gg
         yWvbjdMM2Sl2l6GeuSkr5btl/7w76Xe8GfrXo/KlMP5jfkzzRUjzb+ofPgAfWivKb76C
         TC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zB9oiH2BRr4yMBo3wf45SO3Nck80VorbJdVA47iblXM=;
        b=aMgqy3JYSS3LceRQ5raimwbY8LK6WBvjpY2TjT3t3bOGeqcp/j5Re3S6e9NONJe5OR
         FvXdMJ+fG7zlvUpVBB4cdU7iXt53y5THZD5LK9dccoxPV7Qglev/+CrLNCq/VGSsE0je
         d1Dl4ipzqmCS9qZEZOInIUJsBzBRJel0W78/ft5dOEyFRQnau98kPRDM/XQA2qTSeoBy
         vOdCghecs5N2YJS9TFk+uvSf/XjqLEKR7E0TBrKD2Z1fYgvzmb5avnWOU6wc1WmeSzEo
         /zzVn8N+AZI0Jyd3HESR6Z0z/K4OiFuK/nBK2Lv25+4oFef7w5YOh2i/sVIVf1zHKkyq
         lWsQ==
X-Gm-Message-State: ANoB5pl1UaSwQLSFqO8+6OR/jyrG16TOLQQuEUMvovMATJliVnhZc1Iq
	tnYq08WqDXizNip52hge2Z9Rifz2hfDgMg==
X-Google-Smtp-Source: AA0mqf4iTqxLqkeKUJGKBK2vDw/TcOMUrCzACSliwb1y6sicvyYssf60rgU2Phn8zeoC+EETXrN69Yd24770KA==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a17:90b:33c8:b0:219:94b2:2004 with SMTP
 id lk8-20020a17090b33c800b0021994b22004mr28273120pjb.215.1670528349120; Thu,
 08 Dec 2022 11:39:09 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:21 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-2-dmatlack@google.com>
Subject: [RFC PATCH 01/37] KVM: x86/mmu: Store the address space ID directly
 in kvm_mmu_page_role
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
X-CRM114-CacheID: sfid-20221208_113912_274677_052F3416 
X-CRM114-Status: GOOD (  16.48  )
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

Rename kvm_mmu_page_role.smm with kvm_mmu_page_role.as_id and use it
directly as the address space ID throughout the KVM MMU code. This
eliminates a needless level of indirection, kvm_mmu_role_as_id(), and
prepares for making kvm_mmu_page_role architecture-neutral.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/include/asm/kvm_host.h |  4 ++--
 arch/x86/kvm/mmu/mmu.c          |  6 +++---
 arch/x86/kvm/mmu/mmu_internal.h | 10 ----------
 arch/x86/kvm/mmu/tdp_iter.c     |  2 +-
 arch/x86/kvm/mmu/tdp_mmu.c      | 12 ++++++------
 5 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index aa4eb8cfcd7e..0a819d40131a 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -348,7 +348,7 @@ union kvm_mmu_page_role {
 		 * simple shift.  While there is room, give it a whole
 		 * byte so it is also faster to load it from memory.
 		 */
-		unsigned smm:8;
+		unsigned as_id:8;
 	};
 };
 
@@ -2056,7 +2056,7 @@ enum {
 # define __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
 # define KVM_ADDRESS_SPACE_NUM 2
 # define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_MASK ? 1 : 0)
-# define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).smm)
+# define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).as_id)
 #else
 # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, 0)
 #endif
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 4d188f056933..f375b719f565 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5056,7 +5056,7 @@ kvm_calc_cpu_role(struct kvm_vcpu *vcpu, const struct kvm_mmu_role_regs *regs)
 	union kvm_cpu_role role = {0};
 
 	role.base.access = ACC_ALL;
-	role.base.smm = is_smm(vcpu);
+	role.base.as_id = is_smm(vcpu);
 	role.base.guest_mode = is_guest_mode(vcpu);
 	role.ext.valid = 1;
 
@@ -5112,7 +5112,7 @@ kvm_calc_tdp_mmu_root_page_role(struct kvm_vcpu *vcpu,
 	role.access = ACC_ALL;
 	role.cr0_wp = true;
 	role.efer_nx = true;
-	role.smm = cpu_role.base.smm;
+	role.as_id = cpu_role.base.as_id;
 	role.guest_mode = cpu_role.base.guest_mode;
 	role.ad_disabled = !kvm_ad_enabled();
 	role.level = kvm_mmu_get_tdp_level(vcpu);
@@ -5233,7 +5233,7 @@ kvm_calc_shadow_ept_root_page_role(struct kvm_vcpu *vcpu, bool accessed_dirty,
 
 	/*
 	 * KVM does not support SMM transfer monitors, and consequently does not
-	 * support the "entry to SMM" control either.  role.base.smm is always 0.
+	 * support the "entry to SMM" control either.  role.base.as_id is always 0.
 	 */
 	WARN_ON_ONCE(is_smm(vcpu));
 	role.base.level = level;
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index ac00bfbf32f6..5427f65117b4 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -133,16 +133,6 @@ struct kvm_mmu_page {
 
 extern struct kmem_cache *mmu_page_header_cache;
 
-static inline int kvm_mmu_role_as_id(union kvm_mmu_page_role role)
-{
-	return role.smm ? 1 : 0;
-}
-
-static inline int kvm_mmu_page_as_id(struct kvm_mmu_page *sp)
-{
-	return kvm_mmu_role_as_id(sp->role);
-}
-
 static inline bool kvm_mmu_page_ad_need_write_protect(struct kvm_mmu_page *sp)
 {
 	/*
diff --git a/arch/x86/kvm/mmu/tdp_iter.c b/arch/x86/kvm/mmu/tdp_iter.c
index 39b48e7d7d1a..4a7d58bf81c4 100644
--- a/arch/x86/kvm/mmu/tdp_iter.c
+++ b/arch/x86/kvm/mmu/tdp_iter.c
@@ -52,7 +52,7 @@ void tdp_iter_start(struct tdp_iter *iter, struct kvm_mmu_page *root,
 	iter->root_level = root_level;
 	iter->min_level = min_level;
 	iter->pt_path[iter->root_level - 1] = (tdp_ptep_t)root->spt;
-	iter->as_id = kvm_mmu_page_as_id(root);
+	iter->as_id = root->role.as_id;
 
 	tdp_iter_restart(iter);
 }
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 764f7c87286f..7ccac1aa8df6 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -237,7 +237,7 @@ static struct kvm_mmu_page *tdp_mmu_next_root(struct kvm *kvm,
 	     _root;								\
 	     _root = tdp_mmu_next_root(_kvm, _root, _shared, _only_valid))	\
 		if (kvm_lockdep_assert_mmu_lock_held(_kvm, _shared) &&		\
-		    kvm_mmu_page_as_id(_root) != _as_id) {			\
+		    _root->role.as_id != _as_id) {			\
 		} else
 
 #define for_each_valid_tdp_mmu_root_yield_safe(_kvm, _root, _as_id, _shared)	\
@@ -256,7 +256,7 @@ static struct kvm_mmu_page *tdp_mmu_next_root(struct kvm *kvm,
 #define for_each_tdp_mmu_root(_kvm, _root, _as_id)			\
 	list_for_each_entry(_root, &_kvm->arch.tdp_mmu_roots, link)	\
 		if (kvm_lockdep_assert_mmu_lock_held(_kvm, false) &&	\
-		    kvm_mmu_page_as_id(_root) != _as_id) {		\
+		    _root->role.as_id != _as_id) {		\
 		} else
 
 static struct kvm_mmu_page *tdp_mmu_alloc_sp(struct kvm_vcpu *vcpu)
@@ -310,7 +310,7 @@ hpa_t kvm_tdp_mmu_get_vcpu_root_hpa(struct kvm_vcpu *vcpu)
 	 * Check for an existing root before allocating a new one.  Note, the
 	 * role check prevents consuming an invalid root.
 	 */
-	for_each_tdp_mmu_root(kvm, root, kvm_mmu_role_as_id(role)) {
+	for_each_tdp_mmu_root(kvm, root, role.as_id) {
 		if (root->role.word == role.word &&
 		    kvm_tdp_mmu_get_root(root))
 			goto out;
@@ -496,8 +496,8 @@ static void handle_removed_pt(struct kvm *kvm, tdp_ptep_t pt, bool shared)
 			old_spte = kvm_tdp_mmu_write_spte(sptep, old_spte,
 							  REMOVED_SPTE, level);
 		}
-		handle_changed_spte(kvm, kvm_mmu_page_as_id(sp), gfn,
-				    old_spte, REMOVED_SPTE, level, shared);
+		handle_changed_spte(kvm, sp->role.as_id, gfn, old_spte,
+				    REMOVED_SPTE, level, shared);
 	}
 
 	call_rcu(&sp->rcu_head, tdp_mmu_free_sp_rcu_callback);
@@ -923,7 +923,7 @@ bool kvm_tdp_mmu_zap_sp(struct kvm *kvm, struct kvm_mmu_page *sp)
 	if (WARN_ON_ONCE(!is_shadow_present_pte(old_spte)))
 		return false;
 
-	__tdp_mmu_set_spte(kvm, kvm_mmu_page_as_id(sp), sp->ptep, old_spte, 0,
+	__tdp_mmu_set_spte(kvm, sp->role.as_id, sp->ptep, old_spte, 0,
 			   sp->gfn, sp->role.level + 1, true, true);
 
 	return true;
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
