Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B5BC3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ngtC+oTXYHye893M6ZXHUuXsZO0e4Wq95VzDsyvO6yI=; b=uReodTnI/jssSP
	BR5jRVKFrxHgAcHKeGcxMnfDITSZIFuS59zK96/GQEHnV0QTU1KkQRnqgA+hOOPWpG5QJUJzMZBPH
	7nUafKyK5MhhukreWyc/qNnJH35TgtpCssPVpsyJYXhoeWuS3P0jtWVUkFcKCriGnuTcvxBI2AlrR
	5NS45GYCo2byRrXF6XE+xVCf/gv1p871b+dHpgPSTGF60vjhr4zs7IrBmliPUaySIx3J+ddroUIUJ
	KPCikSjGAeYGLGV5VOPi1pOIJ39sLrrrf17s71SCcsf0iJqcjajpSLYcv/MVvI7i+lm50QFAGGGIy
	vGDZ1C3E3jj1DkAyvXzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUu8-00000005VYa-2mMi;
	Sat, 27 Jul 2024 00:03:20 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUkd-00000005Pno-0olh
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:32 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-70d1df50db2so1367926b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038010; x=1722642810; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=tUI1d5PvM6nQSFLRYt7w7bGZCStWjtac1YnX2jIYbCg=;
        b=oIIsEW897Ml3oEqV1ukXS5s/BrFGFitpm7/uhyxWAtaNaqAOmNAa7L/mkMl5ljqKcj
         b522IN0r6O0dTcmOkCOnYgd2qMoS2gwb/YWjfKu7JcfZMeBxefC8C/oVuZ4vDBhxnTj5
         pUbZL0Dr2BUii5s3STiGXu0cx+4u4BCbUx19v//DJKz4747L1fWwdRPMorl4mIB4oTUW
         egdGYsv5PqbeaV4toAebuKnW9qNx0b9kRxax2FNS0DS6xcRwBej4z6doDpxB+TtsW+BQ
         rlJMlj0R1/B6mQ/b1NxZL8YOuQtLvhrF2rx4w+eGk/ZQuMKdlrLGvMY7PedROfNgZC7S
         Rl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038010; x=1722642810;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUI1d5PvM6nQSFLRYt7w7bGZCStWjtac1YnX2jIYbCg=;
        b=u8V46AuSDsbjtO4uiaruDAk3buXBSmPWhM96DHok27nsUi9UPi6XCdcUow7fgDfr8Y
         rxZ9UmqYCzHplUVwsys6HdGP12qxBEoExKw6+kJOjunebE5CFDooq/jbdDQrbQZJJ4Wa
         1vKBlf8DUSEd1Y/QQf0zQOANQ/bM1ESltzNNcC7Vy37PR0prxLh1mc6HQgG9xM4wAg8K
         MDjzAVDC3IjgbyBu6CzVLmw2fehlxC517YpcNW1VklOjDjJ+I4MNltNjsv4KETrLlxsO
         ehhV3J0F+eegkK2XaURFBdXHGDlCU9CJiSp4hesrnChsznD9h7OMgFCTWmLAqh4d+30f
         x+IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm8pDm9yDPNL7k5MmTcV/N+4VEY2WG4T3500AvIYNfRDBhDJXSUyNRmVHcUQSPLuZXFdtD6K7lvwGE8prS9RUiAHyg/mzGBZN2yDYMLQf2
X-Gm-Message-State: AOJu0Yy7Z2UG+suK4vfHBb6Z9/G1I1HCDysu8BEj52XyuBKeVIMzbbKR
	ttrJmfi+j8+yJyiTCPi87mQGIv+/J0t6XC2LwbLSJ9X43A9Ti08LZvIBm9OW2C42dAxc6OxOhpo
	Zuw==
X-Google-Smtp-Source: AGHT+IGIDN5ccGIB3cs8xyjoNBA33aBwY8OuaAQU+QnM7LAxDHF+KLZuhqGJARF7orYR9wXwPpBL0fgCScs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:8593:b0:70d:3466:2f1a with SMTP id
 d2e1a72fcca58-70ece63fd2emr7784b3a.1.1722038009466; Fri, 26 Jul 2024 16:53:29
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:34 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-26-seanjc@google.com>
Subject: [PATCH v12 25/84] KVM: Provide refcounted page as output field in
 struct kvm_follow_pfn
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
X-CRM114-CacheID: sfid-20240726_165331_323127_E09D99FD 
X-CRM114-Status: GOOD (  22.84  )
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

Add kvm_follow_pfn.refcounted_page as an output for the "to pfn" APIs to
"return" the struct page that is associated with the returned pfn (if KVM
acquired a reference to the page).  This will eventually allow removing
KVM's hacky kvm_pfn_to_refcounted_page() code, which is error prone and
can't detect pfns that are valid, but aren't (currently) refcounted.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 100 +++++++++++++++++++++-----------------------
 virt/kvm/kvm_mm.h   |   9 ++++
 2 files changed, 56 insertions(+), 53 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 8e83d3f043f1..31570c5627e3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2756,6 +2756,46 @@ static inline int check_user_page_hwpoison(unsigned long addr)
 	return rc == -EHWPOISON;
 }
 
+static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *page,
+				 pte_t *pte, bool writable)
+{
+	kvm_pfn_t pfn;
+
+	WARN_ON_ONCE(!!page == !!pte);
+
+	if (kfp->map_writable)
+		*kfp->map_writable = writable;
+
+	/*
+	 * FIXME: Remove this once KVM no longer blindly calls put_page() on
+	 *	  every pfn that points at a struct page.
+	 *
+	 * Get a reference for follow_pte() pfns if they happen to point at a
+	 * struct page, as KVM will ultimately call kvm_release_pfn_clean() on
+	 * the returned pfn, i.e. KVM expects to have a reference.
+	 *
+	 * Certain IO or PFNMAP mappings can be backed with valid struct pages,
+	 * but be allocated without refcounting, e.g. tail pages of
+	 * non-compound higher order allocations.  Grabbing and putting a
+	 * reference to such pages would cause KVM to prematurely free a page
+	 * it doesn't own (KVM gets and puts the one and only reference).
+	 * Don't allow those pages until the FIXME is resolved.
+	 */
+	if (pte) {
+		pfn = pte_pfn(*pte);
+		page = kvm_pfn_to_refcounted_page(pfn);
+		if (page && !get_page_unless_zero(page))
+			return KVM_PFN_ERR_FAULT;
+	} else {
+		pfn = page_to_pfn(page);
+	}
+
+	if (kfp->refcounted_page)
+		*kfp->refcounted_page = page;
+
+	return pfn;
+}
+
 /*
  * The fast path to get the writable pfn which will be stored in @pfn,
  * true indicates success, otherwise false is returned.  It's also the
@@ -2774,9 +2814,7 @@ static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 		return false;
 
 	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &page)) {
-		*pfn = page_to_pfn(page);
-		if (kfp->map_writable)
-			*kfp->map_writable = true;
+		*pfn = kvm_resolve_pfn(kfp, page, NULL, true);
 		return true;
 	}
 
@@ -2808,23 +2846,15 @@ static int hva_to_pfn_slow(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 	if (npages != 1)
 		return npages;
 
-	if (!kfp->map_writable)
-		goto out;
-
-	if (kfp->flags & FOLL_WRITE) {
-		*kfp->map_writable = true;
-		goto out;
-	}
-
 	/* map read fault as writable if possible */
-	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &wpage)) {
-		*kfp->map_writable = true;
+	if (!(flags & FOLL_WRITE) && kfp->map_writable &&
+	    get_user_page_fast_only(kfp->hva, FOLL_WRITE, &wpage)) {
 		put_page(page);
 		page = wpage;
+		flags |= FOLL_WRITE;
 	}
 
-out:
-	*pfn = page_to_pfn(page);
+	*pfn = kvm_resolve_pfn(kfp, page, NULL, flags & FOLL_WRITE);
 	return npages;
 }
 
@@ -2839,20 +2869,9 @@ static bool vma_is_valid(struct vm_area_struct *vma, bool write_fault)
 	return true;
 }
 
-static int kvm_try_get_pfn(kvm_pfn_t pfn)
-{
-	struct page *page = kvm_pfn_to_refcounted_page(pfn);
-
-	if (!page)
-		return 1;
-
-	return get_page_unless_zero(page);
-}
-
 static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 			       struct kvm_follow_pfn *kfp, kvm_pfn_t *p_pfn)
 {
-	kvm_pfn_t pfn;
 	pte_t *ptep;
 	pte_t pte;
 	spinlock_t *ptl;
@@ -2882,38 +2901,13 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 	pte = ptep_get(ptep);
 
 	if (write_fault && !pte_write(pte)) {
-		pfn = KVM_PFN_ERR_RO_FAULT;
+		*p_pfn = KVM_PFN_ERR_RO_FAULT;
 		goto out;
 	}
 
-	if (kfp->map_writable)
-		*kfp->map_writable = pte_write(pte);
-	pfn = pte_pfn(pte);
-
-	/*
-	 * Get a reference here because callers of *hva_to_pfn* and
-	 * *gfn_to_pfn* ultimately call kvm_release_pfn_clean on the
-	 * returned pfn.  This is only needed if the VMA has VM_MIXEDMAP
-	 * set, but the kvm_try_get_pfn/kvm_release_pfn_clean pair will
-	 * simply do nothing for reserved pfns.
-	 *
-	 * Whoever called remap_pfn_range is also going to call e.g.
-	 * unmap_mapping_range before the underlying pages are freed,
-	 * causing a call to our MMU notifier.
-	 *
-	 * Certain IO or PFNMAP mappings can be backed with valid
-	 * struct pages, but be allocated without refcounting e.g.,
-	 * tail pages of non-compound higher order allocations, which
-	 * would then underflow the refcount when the caller does the
-	 * required put_page. Don't allow those pages here.
-	 */
-	if (!kvm_try_get_pfn(pfn))
-		r = -EFAULT;
-
+	*p_pfn = kvm_resolve_pfn(kfp, NULL, &pte, pte_write(pte));
 out:
 	pte_unmap_unlock(ptep, ptl);
-	*p_pfn = pfn;
-
 	return r;
 }
 
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index d5a215958f06..d3ac1ba8ba66 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -35,6 +35,15 @@ struct kvm_follow_pfn {
 	 * Set to true if a writable mapping was obtained.
 	 */
 	bool *map_writable;
+
+	/*
+	 * Optional output.  Set to a valid "struct page" if the returned pfn
+	 * is for a refcounted or pinned struct page, NULL if the returned pfn
+	 * has no struct page or if the struct page is not being refcounted
+	 * (e.g. tail pages of non-compound higher order allocations from
+	 * IO/PFNMAP mappings).
+	 */
+	struct page **refcounted_page;
 };
 
 kvm_pfn_t hva_to_pfn(struct kvm_follow_pfn *kfp);
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
