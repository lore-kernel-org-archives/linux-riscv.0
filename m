Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041D9C3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 23:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y512gvkzrE9VzS2JuHn71Pjzw62nTLCnwlICP+0Ph24=; b=225o4Eap2WbK6P
	Nh6Sglog2bDNMMyF6dyPnnflhyKqmbdRUw93T53Ev8sKLkY/A3jqtAhd0Q50WYbd9SI0GkUQZa154
	kzu980VKuGzLBCR2iL/X2tVLKPXFs64FsW9/uasyNbRMiSkxj2JL8Dcroe17Ef6etozCrXHee6esC
	VjPugJLgAqPNCCOVUg1ygAq4JXs61vE65IoadUQNk2WGjPU9KF5BbNul/hzQRW6XC4fehK1WM9ipW
	h8vpCAEIUwJ5xM8x+MeZzLaUXjVNTHB8ZQuCZ/R6/Nze7hovItGz/6IlOG8fygvClTSnd5HkN5h7m
	EoObWZsOzAlhbnSn7YmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUoi-00000005ShL-2rSO;
	Fri, 26 Jul 2024 23:57:44 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUk8-00000005PNd-49uQ
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:06 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fc5e1ab396so11764035ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037980; x=1722642780; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OCfqpOOOZn7LpwpHWWHUZjndC9uE6mObDYxnDRBBpAY=;
        b=zeQVfyBDSt5ZHvwYebEP0uro5oBdHpEzHPdBkpvI/I4x17yijVY2J2UxY2jxcAcFMt
         bCieqLC0T5S+zNfqauINpfVaWWl5WcaMm2+FOcGrF4DrJj9QujYpALc7ptADkxRgnvwH
         Bf6ok3gPx94pJ0AFJOgWsxa3/Ko1J8NSrE0PNCh178TKkV7OlCWzGp1OPQKCvA9pR1rv
         OlVTlZovgjBAs3eZD1epXdokQKo2A6l5w46qdopqUkHJ191TzSV7VKah51UPiqjprS5K
         o1El7+rwwUtPhozESv9J4pxs81utV5X6rvNSajjD5Nu/U1Mjr0NUCnS1qUsLnIrRmCnR
         r6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037980; x=1722642780;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCfqpOOOZn7LpwpHWWHUZjndC9uE6mObDYxnDRBBpAY=;
        b=Ol6rr5Kl7sfy7JnP1KLaudSlalrRi3hdEYaTfuJ1uOds1FSPVi6AtQfxF+jWr7Gxa7
         bZNopw6pOE9hEfPVKpAhY38i7eJG8LdZn6WZZ2rF6v23nCniLUq5gQ+k1cHQHTscVDE6
         5jToTHZJ7db5GnCwqrctRbjD13HemffffjE8tTZF7hFkbCLJkfcd2wElbO6ZmxH0TPpI
         kSo/4Gk31XT0PmZ48HVMBpLldJVY6naSeXSieG6JCvu8sRDgd3nbe7odIBFEKUKpz/uk
         4ukEh4CocrMwJEsJoH8b2fzIk1+hwatJdFA8naBbvpHlbNUCVCtFLwVEJWl1ibO94ztW
         4XjA==
X-Forwarded-Encrypted: i=1; AJvYcCWpJX1ClowN5RXfd+WUfPyKjm7rTkB9oUipLHnAIl1LG0iTjUUV5mcOgUiUt8xJjGFnY8cj2SYnFXSgX5JMxwHSKikNzcqkK4jKBF6xgKQo
X-Gm-Message-State: AOJu0YyR6BySQRWqSJuzAoC9OwNHI5YqozAuzV176NJOvLTpZzI1CZnQ
	FnSPJWJLs0kthi+PtFxc5mGG2fSLjvWK5wGWhDmHVuNXAdt5/+jpGTZmB0ufILbGE9M54K8YhEi
	yjA==
X-Google-Smtp-Source: AGHT+IGEij7x5iOOrUuL0BYhT5Dm9YFKfO4AZ5nK1acS0T3wJ2KiuANG5aiKSF+tpPt4GoCINPA3jjFDrnM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2341:b0:1fd:d740:b1e5 with SMTP id
 d9443c01a7336-1ff04850898mr447825ad.6.1722037979718; Fri, 26 Jul 2024
 16:52:59 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:20 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-12-seanjc@google.com>
Subject: [PATCH v12 11/84] KVM: Rename gfn_to_page_many_atomic() to kvm_prefetch_pages()
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
X-CRM114-CacheID: sfid-20240726_165301_291783_9295CB45 
X-CRM114-Status: GOOD (  12.30  )
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

Rename gfn_to_page_many_atomic() to kvm_prefetch_pages() to try and
communicate its true purpose, as the "atomic" aspect is essentially a
side effect of the fact that x86 uses the API while holding mmu_lock.
E.g. even if mmu_lock weren't held, KVM wouldn't want to fault-in pages,
as the goal is to opportunistically grab surrounding pages that have
already been accessed and/or dirtied by the host, and to do so quickly.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c         | 2 +-
 arch/x86/kvm/mmu/paging_tmpl.h | 2 +-
 include/linux/kvm_host.h       | 4 ++--
 virt/kvm/kvm_main.c            | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index b7642f1f993f..c1914f02c5e1 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2912,7 +2912,7 @@ static int direct_pte_prefetch_many(struct kvm_vcpu *vcpu,
 	if (!slot)
 		return -1;
 
-	ret = gfn_to_page_many_atomic(slot, gfn, pages, end - start);
+	ret = kvm_prefetch_pages(slot, gfn, pages, end - start);
 	if (ret <= 0)
 		return -1;
 
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index 6b215a932158..bc801d454f41 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -549,7 +549,7 @@ FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 	if (!slot)
 		return false;
 
-	if (gfn_to_page_many_atomic(slot, gfn, &page, 1) != 1)
+	if (kvm_prefetch_pages(slot, gfn, &page, 1) != 1)
 		return false;
 
 	mmu_set_spte(vcpu, slot, spte, pte_access, gfn, page_to_pfn(page), NULL);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index c5d39a337aa3..79fed9fea638 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1192,8 +1192,8 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm);
 void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 				   struct kvm_memory_slot *slot);
 
-int gfn_to_page_many_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
-			    struct page **pages, int nr_pages);
+int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
+		       struct page **pages, int nr_pages);
 
 struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn);
 unsigned long gfn_to_hva(struct kvm *kvm, gfn_t gfn);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 656e931ac39e..803299778cf8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3060,8 +3060,8 @@ kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn);
 
-int gfn_to_page_many_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
-			    struct page **pages, int nr_pages)
+int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
+		       struct page **pages, int nr_pages)
 {
 	unsigned long addr;
 	gfn_t entry = 0;
@@ -3075,7 +3075,7 @@ int gfn_to_page_many_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
 
 	return get_user_pages_fast_only(addr, nr_pages, FOLL_WRITE, pages);
 }
-EXPORT_SYMBOL_GPL(gfn_to_page_many_atomic);
+EXPORT_SYMBOL_GPL(kvm_prefetch_pages);
 
 /*
  * Do not use this helper unless you are absolutely certain the gfn _must_ be
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
