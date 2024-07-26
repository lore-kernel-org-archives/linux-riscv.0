Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A4AC3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKHrbmjMtfegx2SbHsrt6Uf6KYlmcZZy50jiGfej7+U=; b=vnNVZfpQaMi0bW
	W7DMmVNUucZDEjnW/m/vGQAma7u6vYMF8PRyXS/X5Q7RaD1eD7nDBl8DaVKLzG+zNoEe584KE9Psg
	Jt+s1gjH1+gXkd1wedLVEC/dC7NeJ6lKXVi//KX6qqJANBbVY9xUNWPiAe3sAIEOujVx1Px/Zkl8l
	RA1NqexRvmEU2gkLus77by6pMl/ky0Vi22YhTA3juNjnF1ofKcTAPI+Pp++uM+xA6av5l5slmVYhH
	Jpj/691RFB4BvoZ+o/uV/F6GwivijhA/KDk3pDbWB2wm/0qIJU+OQHAuA8geuAD+nu3abNTzEgaVl
	gPK5x/k0hK1LlkvA7beA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVMm-00000005k9a-14Ov;
	Sat, 27 Jul 2024 00:32:56 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUmY-00000005RUn-0kd5
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:55:35 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-70eab26e146so1297929b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038128; x=1722642928; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Truk8wLwk4Y9wyHD0oQlYUKlIPfs2FyGYSCSiM9XszU=;
        b=RNz0nDzIpxoTBUh4tdcsi4kFAHXeULeFBfBh4I4ytUquS1dSF7VyeKAdsORCpaXeT8
         wFz5yyLM1Bx6PNr9q665YpoIjNaLksaBYn36blC6vJFWF9flc2CLT86+wXJn9DZ3tbam
         fzwtsXq/i+bC+2iLKk3RsM8I3Et0AcDMCLiE4sJywkVU0PfgoIAE7RpLYZ7bjevGkdhm
         6CA3QDtuwuZ100OzKDvkyDoJ1EIIRCI9f9UnpbBGufQZHV8+ZFeu1KPJj8G6wJLO56mW
         bYBqw1FS/iE+EoievT8N2ZktbVtxbzw3hw2b8tuZwO3ZPDU3MSueEqb5dL3gBjULn4Am
         IaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038128; x=1722642928;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Truk8wLwk4Y9wyHD0oQlYUKlIPfs2FyGYSCSiM9XszU=;
        b=lItkER1AVCDUuX59XKkBtEtOW0V+ORBzeNeBC94hKu3lHAYIx/O3PjDN7188PfhvtH
         8DRgVIcgzRP8XEuDl+vrn6/yJHKGSiSblvWhrWdPtQIohz6jO8Yfc9Ah2NHwlcEU8ow6
         qZOSGl7Z3fpm6iXZLgHvZG7t4Z2fwEglPwEIONLa3djZjHe4A38uTaM2iv0fNkKwQuRA
         rbxzmRAL67S+69nng1SuCKDzEnpqJ2oUgdP4cTOHdex9HLJlNWxaivgJM3zf/jWrm9nD
         VRzOiXnXfZfyXjF68aNc7+zf6OkUjl8NipGtLRzrOzzsf0Lm/9gM8S08/DPfZdy17Dld
         4jNw==
X-Forwarded-Encrypted: i=1; AJvYcCUD/UKICG4bJokbxkPn2DF7PJYCJ6IR/no+fyshAu+yByLF6nBOsXZle8ilneAVStZ5N5WpOhRzKfkY7TfRsNFzGBSMKmjOmDs6UxIxpzNL
X-Gm-Message-State: AOJu0YywZ7nNpOEP5HYsZto6cRts6vPzfprPrxOTsJfYfy0tj2v+IBI5
	kPgPeAaafQe+OG/lvbixXLOdbNwzBCil3OR5zgjRiJ6EHzszd09HOh0c7mZa6kCm7C1+vwv//hU
	lgg==
X-Google-Smtp-Source: AGHT+IESez/zxTWutjtLJAUJhIiTiAtRpWSvjJWmuvSpH774la09rZR91czqzlEpBwGUZ+0osFi4L0/wScE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:8591:b0:704:3140:5a94 with SMTP id
 d2e1a72fcca58-70ecea0e7ffmr15968b3a.2.1722038127870; Fri, 26 Jul 2024
 16:55:27 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:31 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-83-seanjc@google.com>
Subject: [PATCH v12 82/84] KVM: arm64: Don't mark "struct page" accessed when
 making SPTE young
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
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_165530_668458_83C1D2DB 
X-CRM114-Status: GOOD (  12.47  )
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

Don't mark pages/folios as accessed in the primary MMU when making a SPTE
young in KVM's secondary MMU, as doing so relies on
kvm_pfn_to_refcounted_page(), and generally speaking is unnecessary and
wasteful.  KVM participates in page aging via mmu_notifiers, so there's no
need to push "accessed" updates to the primary MMU.

Dropping use of kvm_set_pfn_accessed() also paves the way for removing
kvm_pfn_to_refcounted_page() and all its users.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 4 +---
 arch/arm64/kvm/hyp/pgtable.c         | 7 ++-----
 arch/arm64/kvm/mmu.c                 | 6 +-----
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 19278dfe7978..676d80723c38 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -632,10 +632,8 @@ int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size);
  *
  * If there is a valid, leaf page-table entry used to translate @addr, then
  * set the access flag in that entry.
- *
- * Return: The old page-table entry prior to setting the flag, 0 on failure.
  */
-kvm_pte_t kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr);
+void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr);
 
 /**
  * kvm_pgtable_stage2_test_clear_young() - Test and optionally clear the access
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 9e2bbee77491..6679e02a02c4 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1287,19 +1287,16 @@ int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 					NULL, NULL, 0);
 }
 
-kvm_pte_t kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr)
+void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr)
 {
-	kvm_pte_t pte = 0;
 	int ret;
 
 	ret = stage2_update_leaf_attrs(pgt, addr, 1, KVM_PTE_LEAF_ATTR_LO_S2_AF, 0,
-				       &pte, NULL,
+				       NULL, NULL,
 				       KVM_PGTABLE_WALK_HANDLE_FAULT |
 				       KVM_PGTABLE_WALK_SHARED);
 	if (!ret)
 		dsb(ishst);
-
-	return pte;
 }
 
 struct stage2_age_data {
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 756fc856ab44..8fd8ea5b5795 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1699,18 +1699,14 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 /* Resolve the access fault by making the page young again. */
 static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 {
-	kvm_pte_t pte;
 	struct kvm_s2_mmu *mmu;
 
 	trace_kvm_access_fault(fault_ipa);
 
 	read_lock(&vcpu->kvm->mmu_lock);
 	mmu = vcpu->arch.hw_mmu;
-	pte = kvm_pgtable_stage2_mkyoung(mmu->pgt, fault_ipa);
+	kvm_pgtable_stage2_mkyoung(mmu->pgt, fault_ipa);
 	read_unlock(&vcpu->kvm->mmu_lock);
-
-	if (kvm_pte_valid(pte))
-		kvm_set_pfn_accessed(kvm_pte_to_pfn(pte));
 }
 
 /**
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
