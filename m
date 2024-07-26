Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD37C3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=11lMdSabjLvL5Pk1FTx2eSbsYq8fgVAwtqx3uUh1dAU=; b=LYlH+fTBSfxXtf
	R2+lgLYv8ZJ7mLNdKvc/x3kGVVR18Q4FG8HHUhw8xk+lkrym/XPfQV6kgpYj6IRpvxUphX3tV0nq9
	1eekac8wqctwXydwGtn8E1aP/TiSqnuX+QZwssjuQWArd7FGoVCIXSJvUImeX6QVOn5w5m6HvJcBe
	HB4YqoR53NBRLOQVuRIcZ23boCvQ3VR/OuWj2UsgwTmVulkHqL+Pdwk4eXmM1cxVNKEd2tEV93Dk8
	v25gEAZpZ3CNgAreGsc+QjIgUGlwjGguhPUhtaG4i1zyrICDLVkJNHqC895b4cf32InBIhyArYq8b
	voqFoKC9ABJlMtuBDpsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUvb-00000005WMC-01bk;
	Sat, 27 Jul 2024 00:04:51 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUkl-00000005Pvi-057a
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:44 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-70e93462241so1461452b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038018; x=1722642818; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hlhq7We3LF/Ul7sqre1CZocM6x6KNUXlB6LyC83BMPc=;
        b=Rimon+EmJLdmFAU/YCFWwPAynZDrSIiIUDPOfVWli3+6vmBXbpmxN1aF/tS7Z+yKfe
         FZ/OE66ljZHOW7flSTxNWWvXhWPz7iuDs0m5dPCYDHV9GFZvawreVCuSStXWJH5tHnb2
         krXpkkMyQsBL57JpsHGm9l4CuVY7gL17WI/K2oeg3F12kTdaRZLi2Se5w1If6OHFOzCx
         vOeFUoKk1uthZGP/BEcQyLhCqxrq20kWaqfixxgWZP1WG896sTJULtxFctJpd/rYZC0x
         67CyS3QyG615/tOK7fEsmeE2MBYDxNFCq3FynXpTDb31GGo9vc2p6rAgxt9MpEE3JjiR
         +dKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038018; x=1722642818;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlhq7We3LF/Ul7sqre1CZocM6x6KNUXlB6LyC83BMPc=;
        b=HUga7CkxQfOp7EMeSawSixWv4URMHMOkFha+cIUrhY5DYRUrzsILux2X+BloISteFt
         nimNvWkLIgOiLDNfuS849F9cwPlVplKA1I3WigM3Zd0TkbEoxhOisJyTNloRRQwniz+j
         ZI/sViTW6pJ9HCrUZi6ZO/PjyGn9tZH9RQQY8CyrQnDaNAJUtLUGWePIGm9jfqcdBmLX
         +m8zjBqJOg0C4CE1nytdUCuUjSCDdjbn90eog8d4o9lw0UhpN90NKLmShEraqF9eAVQV
         zzR2CSnqQMAu6c4+2bOnD0ATBjsKibcWVCtoCim0D0IaIKSLdLSd7681+Kr/C/8aAQas
         3X7A==
X-Forwarded-Encrypted: i=1; AJvYcCWWbzLGO8owcI+UfdY6ZYdJRELgDEuUPnkn5iBAuqpie4b+1BLaeosDz/zFiFCS8m7Y/wYyRry0cDVdFKnTOzKi6ZqXdzUGZ2YHyO2qJ+tX
X-Gm-Message-State: AOJu0YysqUCRGktTRSdXKkN2XHtm+myHDdOefBiBJgQt6dgilA2HBN6g
	rEe+jltQLQ+A3a7oGlhdMG/vA2LlGAG81Trz4NmIprqUGuGRhMhJI183nPKNA41pWYbsYClwJYZ
	NWA==
X-Google-Smtp-Source: AGHT+IHh1dyWiT0um9sPElrkv3mBIH4IG/eZ2ITHeKZHWjYM95v4ERaP3jgKxmY1KlRL2J6TSkYz8SuqfJg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2f10:b0:70e:9de1:9edf with SMTP id
 d2e1a72fcca58-70ece9fc2c1mr8667b3a.1.1722038017517; Fri, 26 Jul 2024 16:53:37
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:38 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-30-seanjc@google.com>
Subject: [PATCH v12 29/84] KVM: Pin (as in FOLL_PIN) pages during kvm_vcpu_map()
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
X-CRM114-CacheID: sfid-20240726_165339_378991_44C45669 
X-CRM114-Status: GOOD (  23.63  )
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

Pin, as in FOLL_PIN, pages when mapping them for direct access by KVM.
As per Documentation/core-api/pin_user_pages.rst, writing to a page that
was gotten via FOLL_GET is explicitly disallowed.

  Correct (uses FOLL_PIN calls):
      pin_user_pages()
      write to the data within the pages
      unpin_user_pages()

  INCORRECT (uses FOLL_GET calls):
      get_user_pages()
      write to the data within the pages
      put_page()

Unfortunately, FOLL_PIN is a "private" flag, and so kvm_follow_pfn must
use a one-off bool instead of being able to piggyback the "flags" field.

Link: https://lwn.net/Articles/930667
Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  2 +-
 virt/kvm/kvm_main.c      | 54 +++++++++++++++++++++++++++++-----------
 virt/kvm/kvm_mm.h        |  7 ++++++
 3 files changed, 47 insertions(+), 16 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 8b5ac3305b05..3d4094ece479 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -280,7 +280,7 @@ struct kvm_host_map {
 	 * can be used as guest memory but they are not managed by host
 	 * kernel).
 	 */
-	struct page *refcounted_page;
+	struct page *pinned_page;
 	struct page *page;
 	void *hva;
 	kvm_pfn_t pfn;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 255cbed83b40..4a9b99c11355 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2824,9 +2824,12 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *page,
 	 */
 	if (pte) {
 		pfn = pte_pfn(*pte);
-		page = kvm_pfn_to_refcounted_page(pfn);
-		if (page && !get_page_unless_zero(page))
-			return KVM_PFN_ERR_FAULT;
+
+		if (!kfp->pin) {
+			page = kvm_pfn_to_refcounted_page(pfn);
+			if (page && !get_page_unless_zero(page))
+				return KVM_PFN_ERR_FAULT;
+		}
 	} else {
 		pfn = page_to_pfn(page);
 	}
@@ -2845,16 +2848,24 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *page,
 static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 {
 	struct page *page;
+	bool r;
 
 	/*
-	 * Fast pin a writable pfn only if it is a write fault request
-	 * or the caller allows to map a writable pfn for a read fault
-	 * request.
+	 * Try the fast-only path when the caller wants to pin/get the page for
+	 * writing.  If the caller only wants to read the page, KVM must go
+	 * down the full, slow path in order to avoid racing an operation that
+	 * breaks Copy-on-Write (CoW), e.g. so that KVM doesn't end up pointing
+	 * at the old, read-only page while mm/ points at a new, writable page.
 	 */
 	if (!((kfp->flags & FOLL_WRITE) || kfp->map_writable))
 		return false;
 
-	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &page)) {
+	if (kfp->pin)
+		r = pin_user_pages_fast(kfp->hva, 1, FOLL_WRITE, &page) == 1;
+	else
+		r = get_user_page_fast_only(kfp->hva, FOLL_WRITE, &page);
+
+	if (r) {
 		*pfn = kvm_resolve_pfn(kfp, page, NULL, true);
 		return true;
 	}
@@ -2883,10 +2894,21 @@ static int hva_to_pfn_slow(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 	struct page *page, *wpage;
 	int npages;
 
-	npages = get_user_pages_unlocked(kfp->hva, 1, &page, flags);
+	if (kfp->pin)
+		npages = pin_user_pages_unlocked(kfp->hva, 1, &page, flags);
+	else
+		npages = get_user_pages_unlocked(kfp->hva, 1, &page, flags);
 	if (npages != 1)
 		return npages;
 
+	/*
+	 * Pinning is mutually exclusive with opportunistically mapping a read
+	 * fault as writable, as KVM should never pin pages when mapping memory
+	 * into the guest (pinning is only for direct accesses from KVM).
+	 */
+	if (WARN_ON_ONCE(kfp->map_writable && kfp->pin))
+		goto out;
+
 	/* map read fault as writable if possible */
 	if (!(flags & FOLL_WRITE) && kfp->map_writable &&
 	    get_user_page_fast_only(kfp->hva, FOLL_WRITE, &wpage)) {
@@ -2895,6 +2917,7 @@ static int hva_to_pfn_slow(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 		flags |= FOLL_WRITE;
 	}
 
+out:
 	*pfn = kvm_resolve_pfn(kfp, page, NULL, flags & FOLL_WRITE);
 	return npages;
 }
@@ -3119,10 +3142,11 @@ int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map)
 		.slot = gfn_to_memslot(vcpu->kvm, gfn),
 		.gfn = gfn,
 		.flags = FOLL_WRITE,
-		.refcounted_page = &map->refcounted_page,
+		.refcounted_page = &map->pinned_page,
+		.pin = true,
 	};
 
-	map->refcounted_page = NULL;
+	map->pinned_page = NULL;
 	map->page = NULL;
 	map->hva = NULL;
 	map->gfn = gfn;
@@ -3159,16 +3183,16 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map, bool dirty)
 	if (dirty)
 		kvm_vcpu_mark_page_dirty(vcpu, map->gfn);
 
-	if (map->refcounted_page) {
+	if (map->pinned_page) {
 		if (dirty)
-			kvm_release_page_dirty(map->refcounted_page);
-		else
-			kvm_release_page_clean(map->refcounted_page);
+			kvm_set_page_dirty(map->pinned_page);
+		kvm_set_page_accessed(map->pinned_page);
+		unpin_user_page(map->pinned_page);
 	}
 
 	map->hva = NULL;
 	map->page = NULL;
-	map->refcounted_page = NULL;
+	map->pinned_page = NULL;
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_unmap);
 
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index d3ac1ba8ba66..acef3f5c582a 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -30,6 +30,13 @@ struct kvm_follow_pfn {
 	/* FOLL_* flags modifying lookup behavior, e.g. FOLL_WRITE. */
 	unsigned int flags;
 
+	/*
+	 * Pin the page (effectively FOLL_PIN, which is an mm/ internal flag).
+	 * The page *must* be pinned if KVM will write to the page via a kernel
+	 * mapping, e.g. via kmap(), mremap(), etc.
+	 */
+	bool pin;
+
 	/*
 	 * If non-NULL, try to get a writable mapping even for a read fault.
 	 * Set to true if a writable mapping was obtained.
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
