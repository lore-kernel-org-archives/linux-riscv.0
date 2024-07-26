Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56732C3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uH+sdAPBcVmwJX2vS+BVpr49QAnU75kw2WOtuw9Z0iQ=; b=hvEe1bJxu6mB7t
	j5FAbnq8eazboMqeClLpLS76NzI5cc0ugTPc8v8a4oJvOs1/gpOfQt+8rgMPhrZ1jvDSHb9YSiPEI
	Pa5vfoReqIiw2LV7CLY8a9ZwfSoXNfBVoWE6Z9sGXsTXRqysQZ49SZkSS2ZHUaqS7zW2Hh11NqLt8
	YY28NMx/DvnpWz55BJrTqQLMxHNP8rI291X+l6vxBOIkUT7MJCfRAUjpGnQN94h3+eK5+7w6iNcPv
	GeWeSp8FL9en6LRvfGjkm0LcLITyi/m8R7A+b4YYK3f7FIqbbRQNbL8z3RUTqZcWM358Rran9FIUK
	CMeaLpF+DzeoUc6bW2Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUzV-00000005YVT-0aMI;
	Sat, 27 Jul 2024 00:08:53 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUl5-00000005QDa-1irY
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:01 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2cd4e722d82so1585505a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038038; x=1722642838; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh6T21uN8n1VHf7Uf0xlt62GR+52F2/YXe/M8yozbBs=;
        b=u3EyyRjHaFaF8Nb8+8YiK4ZvPNigzDP90Tl1ktBUsj7zVw67kY3rt+2AUEN3AZQfYZ
         ysdYnUreZk9GgJwVtXZr/JN5kkop2ZvuVCcvDUcc6aRiwY5/LNYMeaNaq9Q1KjBl9ZG5
         0OxU5/sYcdwZYyw+D+6S8mOPqB72D60IM6Z51iCUZFeQYP8sGzUfRXgG/Negc/3svKxi
         Iw6kGnUm1fo9VUKXwI/tb+3z6iay+Wad6dGRjam1eiwi+lAVq9e5TIwjhxKOPwbEZXU4
         wpMYiWMcewO1XzDQMw76QnjuJ84ATV6FsPiUzXdPsjQKMECWJYa3vYUkfW6RHmoLdhv5
         YrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038038; x=1722642838;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qh6T21uN8n1VHf7Uf0xlt62GR+52F2/YXe/M8yozbBs=;
        b=OVocFAya0JqpUkwq7NPZE5y3zYL2IBIAHNqHH/jveY4xXKehK5XK7fbTGssae0p5l0
         3/JP3aAmdBu7VtnlTbfpoptdOcRYKDNC1uOL72PJhASmhwzosoG/tSvOIkSwF5jgLzfH
         HhDHyXy7x8WRxN2in8pEd7hUU+TS+wjUxWvNzhRsjoqhQsDjRdt03zjbd4VfnLwwASQ1
         KNBcAKlnH+SxS3PoqIl4h5+/O5HS/cHzY+6ay5B6WrZNNU1F9N1SLwxIUlQYnMViJ52u
         j6mN8LvHEKgQ5uDIEDLJ09u1Ez52SQvUprxzOGhD33Epqy8aYJilNCTYYt5JYOmcJa21
         7ORQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFGDOm9s22Pb9MfkrId/DATExh8GdIZxq+sOvE9VC1UTuBp9vrNRw313HwFxLu7HleVIoB4w6hxpFEBy/5aS4AVuNGW1dJ0UfT5o8pGS6i
X-Gm-Message-State: AOJu0YxxD/ZnJaemp92BqviwNjtuYJ3GYFZ3EszdSzWh3HRW9XTtA67O
	kZTazqzhUD9qPEd4iMGmWatpKY5RROAN4BudrcptAmURauBuIa/ZwEQ3FJywnAGQYE4HIpU+Aa7
	hTw==
X-Google-Smtp-Source: AGHT+IHJ/uNdZAPdurru3IzCEMezhYQEvGsVQTc+qIu+wSY9S108IorpvBbDocczOA6aFsvKzrBA+JBrX4Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:4495:b0:2c9:61e2:ce26 with SMTP id
 98e67ed59e1d1-2cf7e1c639emr12819a91.2.1722038038053; Fri, 26 Jul 2024
 16:53:58 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:48 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-40-seanjc@google.com>
Subject: [PATCH v12 39/84] KVM: x86/mmu: Add common helper to handle
 prefetching SPTEs
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
X-CRM114-CacheID: sfid-20240726_165359_477856_F5419BBE 
X-CRM114-Status: GOOD (  13.70  )
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

Deduplicate the prefetching code for indirect and direct MMUs.  The core
logic is the same, the only difference is that indirect MMUs need to
prefetch SPTEs one-at-a-time, as contiguous guest virtual addresses aren't
guaranteed to yield contiguous guest physical addresses.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c         | 40 +++++++++++++++++++++-------------
 arch/x86/kvm/mmu/paging_tmpl.h | 13 +----------
 2 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 0def1444c01c..e76f64f55c4a 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2897,32 +2897,41 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
 	return ret;
 }
 
-static int direct_pte_prefetch_many(struct kvm_vcpu *vcpu,
-				    struct kvm_mmu_page *sp,
-				    u64 *start, u64 *end)
+static bool kvm_mmu_prefetch_sptes(struct kvm_vcpu *vcpu, gfn_t gfn, u64 *sptep,
+				   int nr_pages, unsigned int access)
 {
 	struct page *pages[PTE_PREFETCH_NUM];
 	struct kvm_memory_slot *slot;
-	unsigned int access = sp->role.access;
-	int i, ret;
-	gfn_t gfn;
+	int i;
+
+	if (WARN_ON_ONCE(nr_pages > PTE_PREFETCH_NUM))
+		return false;
 
-	gfn = kvm_mmu_page_get_gfn(sp, spte_index(start));
 	slot = gfn_to_memslot_dirty_bitmap(vcpu, gfn, access & ACC_WRITE_MASK);
 	if (!slot)
-		return -1;
+		return false;
 
-	ret = kvm_prefetch_pages(slot, gfn, pages, end - start);
-	if (ret <= 0)
-		return -1;
+	nr_pages = kvm_prefetch_pages(slot, gfn, pages, nr_pages);
+	if (nr_pages <= 0)
+		return false;
 
-	for (i = 0; i < ret; i++, gfn++, start++) {
-		mmu_set_spte(vcpu, slot, start, access, gfn,
+	for (i = 0; i < nr_pages; i++, gfn++, sptep++) {
+		mmu_set_spte(vcpu, slot, sptep, access, gfn,
 			     page_to_pfn(pages[i]), NULL);
 		kvm_release_page_clean(pages[i]);
 	}
 
-	return 0;
+	return true;
+}
+
+static bool direct_pte_prefetch_many(struct kvm_vcpu *vcpu,
+				     struct kvm_mmu_page *sp,
+				     u64 *start, u64 *end)
+{
+	gfn_t gfn = kvm_mmu_page_get_gfn(sp, spte_index(start));
+	unsigned int access = sp->role.access;
+
+	return kvm_mmu_prefetch_sptes(vcpu, gfn, start, end - start, access);
 }
 
 static void __direct_pte_prefetch(struct kvm_vcpu *vcpu,
@@ -2940,8 +2949,9 @@ static void __direct_pte_prefetch(struct kvm_vcpu *vcpu,
 		if (is_shadow_present_pte(*spte) || spte == sptep) {
 			if (!start)
 				continue;
-			if (direct_pte_prefetch_many(vcpu, sp, start, spte) < 0)
+			if (!direct_pte_prefetch_many(vcpu, sp, start, spte))
 				return;
+
 			start = NULL;
 		} else if (!start)
 			start = spte;
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index b02d0abfca68..e1c2f098d9d5 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -533,9 +533,7 @@ static bool
 FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 		     u64 *spte, pt_element_t gpte)
 {
-	struct kvm_memory_slot *slot;
 	unsigned pte_access;
-	struct page *page;
 	gfn_t gfn;
 
 	if (FNAME(prefetch_invalid_gpte)(vcpu, sp, spte, gpte))
@@ -545,16 +543,7 @@ FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 	pte_access = sp->role.access & FNAME(gpte_access)(gpte);
 	FNAME(protect_clean_gpte)(vcpu->arch.mmu, &pte_access, gpte);
 
-	slot = gfn_to_memslot_dirty_bitmap(vcpu, gfn, pte_access & ACC_WRITE_MASK);
-	if (!slot)
-		return false;
-
-	if (kvm_prefetch_pages(slot, gfn, &page, 1) != 1)
-		return false;
-
-	mmu_set_spte(vcpu, slot, spte, pte_access, gfn, page_to_pfn(page), NULL);
-	kvm_release_page_clean(page);
-	return true;
+	return kvm_mmu_prefetch_sptes(vcpu, gfn, spte, 1, pte_access);
 }
 
 static bool FNAME(gpte_changed)(struct kvm_vcpu *vcpu,
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
