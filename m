Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949D5C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 23:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vEWdbHVyCWPdcriUinWH1+d9W/vlUwkXjb4Yrb68tdc=; b=cMEVfSofr/jyAG
	SchjVvrFUl9eyLZ/gkh22VWJEUOfElRBNjcUIyPl0NvxvWKXTeyAMUx8n7wm1tDzFwVREBAd2WH0K
	KIvrOUquyBjKq2sLJC5KJ3xBj9mkn+1zrZI8wH35O9xyXNCpcVXYNwa7q2OJJk8prLQ0aA7xSuA1L
	VdMITE1fB3zZ05EcnolCQVXIpn98rpXKWjds6HVQn7Yjz50mI5EXhpMcNsnQtj8QsLlvkVso+FM5U
	huTLxK3lqOwp3qRVi5zMKmw6Cp/GBx6UZcU9X/m1hoXOEHyd18QAcEAcnqlqvvCKWO2LmUk8D3AU9
	wVV+9NXNnAZhD9zF5vNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUqZ-00000005TjW-1Ihn;
	Fri, 26 Jul 2024 23:59:39 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUkL-00000005PYB-1RuJ
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:15 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-70eab26e146so1297081b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037992; x=1722642792; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=dQWjrE4jvr4hAuT3wkfi5A++VZy4br+IJ16QmEjL6no=;
        b=xs096Zpk/rxO8N78ay9J8lgHkgTFCr5BaqZo9gQzDkD//Yl0KooNZ6aQsM0rTy4xmV
         f1Xgc9H1F9CDeCxboL7eIX2G9yfCNMaYlhzIqws9AXVnemXfzJQtD6vxclrn3uzCi0bB
         yVqdCjaa5dqglh6DrQ7Yxz3skQ3afzatH/WdQQB0NR2cFMVDqZ+K0xQGh+yKXMQD5iTn
         JYq537TJTapv1BeGDOR+z626YgjXwPgKQ61zY8Bb6zDQVcVLi3Xt3OTyLtgz59iceyDY
         5l960+ScvTUn5548lIEYO8vYGNuRVJedOPw955fQbI/2Jd8VuOKfHbY1t9yCw0pAD6/r
         jetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037992; x=1722642792;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQWjrE4jvr4hAuT3wkfi5A++VZy4br+IJ16QmEjL6no=;
        b=XN0pIw0VVAa5O111gpbRjOm6HLDVZG4ppA0XvyTOfsaQg305SvZgLvHqcgDHOEGE2j
         tC5GUgZjX/Z/Uo1VUdJ3MWdgCXwjw+Pkj9SzTVtC7GFqIkEfhpoKZfjkahPN1fLpK6RN
         MBcxIq74rUQBKmwr81O0wlBfSsw9wuliIxicLcqUE04ngB+0UFA55LzbuwjW/A8ZR60b
         J+xz9pQZofJfFsUgsT+57ukwFd9bLx3u3gNgMxYgiMcMjKEKKmn6FcKLYPFh7KVBvU+9
         MKD9thdxRuGqdmYUJAT43tRXpboiSLqB8U1WNnuMiiMa2s7s/V3Lmc0LtabzzPP1j2yp
         2YOg==
X-Forwarded-Encrypted: i=1; AJvYcCVP0tpW/SxVkZBHH9Y6J0n79aQ0M5Q3Pl6vHdpLlMwuu4pWxh+WMuiBXsQf/lB/kDs7I6ATrFma0u4YcQAP7lo2FMl8i5VB2qActM7GIuj+
X-Gm-Message-State: AOJu0YwIDgtJhG07ZZlTz5uclkQ13QY7uPA22yiRCj6OkHU1JR56CwKD
	vnmZruv8FIGmdTAGLPWH6evqxGa0n34eMFGlbU9Qzy+FfwpjAErQtLwlWzDHRQADhKAYL1Yz6RQ
	aqg==
X-Google-Smtp-Source: AGHT+IF64dFMfvjIHcwYUOw27WNHnHBsH0QN8lopZ3C9XrG9iD55Iu+E93imY7RdCCfaNaEEdqDD7q46L3E=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:66e5:b0:70d:1e28:1c33 with SMTP id
 d2e1a72fcca58-70ece9ecd04mr9965b3a.1.1722037991679; Fri, 26 Jul 2024 16:53:11
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:26 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-18-seanjc@google.com>
Subject: [PATCH v12 17/84] KVM: Introduce kvm_follow_pfn() to eventually
 replace "gfn_to_pfn" APIs
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
X-CRM114-CacheID: sfid-20240726_165313_593683_95E50C3B 
X-CRM114-Status: GOOD (  25.66  )
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

From: David Stevens <stevensd@chromium.org>

Introduce kvm_follow_pfn() to eventually supplant the various "gfn_to_pfn"
APIs, albeit by adding more wrappers.  The primary motivation of the new
helper is to pass a structure instead of an ever changing set of parameters,
e.g. so that tweaking the behavior, inputs, and/or outputs of the "to pfn"
helpers doesn't require churning half of KVM.

In the more distant future, the APIs exposed to arch code could also
follow suit, e.g. by adding something akin to x86's "struct kvm_page_fault"
when faulting in guest memory.  But for now, the goal is purely to clean
up KVM's "internal" MMU code.

As part of the conversion, replace the write_fault, interruptible, and
no-wait boolean flags with FOLL_WRITE, FOLL_INTERRUPTIBLE, and FOLL_NOWAIT
respectively.  Collecting the various FOLL_* flags into a single field
will again ease the pain of passing new flags.

Signed-off-by: David Stevens <stevensd@chromium.org>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 166 +++++++++++++++++++++++---------------------
 virt/kvm/kvm_mm.h   |  20 +++++-
 virt/kvm/pfncache.c |   9 ++-
 3 files changed, 111 insertions(+), 84 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6e3bb202c1b3..56c2d11761e0 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2761,8 +2761,7 @@ static inline int check_user_page_hwpoison(unsigned long addr)
  * true indicates success, otherwise false is returned.  It's also the
  * only part that runs if we can in atomic context.
  */
-static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
-			    bool *writable, kvm_pfn_t *pfn)
+static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 {
 	struct page *page[1];
 
@@ -2771,14 +2770,13 @@ static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
 	 * or the caller allows to map a writable pfn for a read fault
 	 * request.
 	 */
-	if (!(write_fault || writable))
+	if (!((kfp->flags & FOLL_WRITE) || kfp->map_writable))
 		return false;
 
-	if (get_user_page_fast_only(addr, FOLL_WRITE, page)) {
+	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, page)) {
 		*pfn = page_to_pfn(page[0]);
-
-		if (writable)
-			*writable = true;
+		if (kfp->map_writable)
+			*kfp->map_writable = true;
 		return true;
 	}
 
@@ -2789,8 +2787,7 @@ static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
  * The slow path to get the pfn of the specified host virtual address,
  * 1 indicates success, -errno is returned if error is detected.
  */
-static int hva_to_pfn_slow(unsigned long addr, bool no_wait, bool write_fault,
-			   bool interruptible, bool *writable, kvm_pfn_t *pfn)
+static int hva_to_pfn_slow(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 {
 	/*
 	 * When a VCPU accesses a page that is not mapped into the secondary
@@ -2803,34 +2800,30 @@ static int hva_to_pfn_slow(unsigned long addr, bool no_wait, bool write_fault,
 	 * Note that get_user_page_fast_only() and FOLL_WRITE for now
 	 * implicitly honor NUMA hinting faults and don't need this flag.
 	 */
-	unsigned int flags = FOLL_HWPOISON | FOLL_HONOR_NUMA_FAULT;
-	struct page *page;
+	unsigned int flags = FOLL_HWPOISON | FOLL_HONOR_NUMA_FAULT | kfp->flags;
+	struct page *page, *wpage;
 	int npages;
 
-	if (writable)
-		*writable = write_fault;
-
-	if (write_fault)
-		flags |= FOLL_WRITE;
-	if (no_wait)
-		flags |= FOLL_NOWAIT;
-	if (interruptible)
-		flags |= FOLL_INTERRUPTIBLE;
-
-	npages = get_user_pages_unlocked(addr, 1, &page, flags);
+	npages = get_user_pages_unlocked(kfp->hva, 1, &page, flags);
 	if (npages != 1)
 		return npages;
 
+	if (!kfp->map_writable)
+		goto out;
+
+	if (kfp->flags & FOLL_WRITE) {
+		*kfp->map_writable = true;
+		goto out;
+	}
+
 	/* map read fault as writable if possible */
-	if (unlikely(!write_fault) && writable) {
-		struct page *wpage;
-
-		if (get_user_page_fast_only(addr, FOLL_WRITE, &wpage)) {
-			*writable = true;
-			put_page(page);
-			page = wpage;
-		}
+	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &wpage)) {
+		*kfp->map_writable = true;
+		put_page(page);
+		page = wpage;
 	}
+
+out:
 	*pfn = page_to_pfn(page);
 	return npages;
 }
@@ -2857,23 +2850,23 @@ static int kvm_try_get_pfn(kvm_pfn_t pfn)
 }
 
 static int hva_to_pfn_remapped(struct vm_area_struct *vma,
-			       unsigned long addr, bool write_fault,
-			       bool *writable, kvm_pfn_t *p_pfn)
+			       struct kvm_follow_pfn *kfp, kvm_pfn_t *p_pfn)
 {
 	kvm_pfn_t pfn;
 	pte_t *ptep;
 	pte_t pte;
 	spinlock_t *ptl;
+	bool write_fault = kfp->flags & FOLL_WRITE;
 	int r;
 
-	r = follow_pte(vma, addr, &ptep, &ptl);
+	r = follow_pte(vma, kfp->hva, &ptep, &ptl);
 	if (r) {
 		/*
 		 * get_user_pages fails for VM_IO and VM_PFNMAP vmas and does
 		 * not call the fault handler, so do it here.
 		 */
 		bool unlocked = false;
-		r = fixup_user_fault(current->mm, addr,
+		r = fixup_user_fault(current->mm, kfp->hva,
 				     (write_fault ? FAULT_FLAG_WRITE : 0),
 				     &unlocked);
 		if (unlocked)
@@ -2881,7 +2874,7 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 		if (r)
 			return r;
 
-		r = follow_pte(vma, addr, &ptep, &ptl);
+		r = follow_pte(vma, kfp->hva, &ptep, &ptl);
 		if (r)
 			return r;
 	}
@@ -2893,8 +2886,8 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 		goto out;
 	}
 
-	if (writable)
-		*writable = pte_write(pte);
+	if (kfp->map_writable)
+		*kfp->map_writable = pte_write(pte);
 	pfn = pte_pfn(pte);
 
 	/*
@@ -2924,22 +2917,7 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 	return r;
 }
 
-/*
- * Pin guest page in memory and return its pfn.
- * @addr: host virtual address which maps memory to the guest
- * @interruptible: whether the process can be interrupted by non-fatal signals
- * @no_wait: whether or not this function need to wait IO complete if the
- *	     host page is not in the memory
- * @write_fault: whether we should get a writable host page
- * @writable: whether it allows to map a writable host page for !@write_fault
- *
- * The function will map a writable host page for these two cases:
- * 1): @write_fault = true
- * 2): @write_fault = false && @writable, @writable will tell the caller
- *     whether the mapping is writable.
- */
-kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool no_wait,
-		     bool write_fault, bool *writable)
+kvm_pfn_t hva_to_pfn(struct kvm_follow_pfn *kfp)
 {
 	struct vm_area_struct *vma;
 	kvm_pfn_t pfn;
@@ -2947,11 +2925,10 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool no_wait,
 
 	might_sleep();
 
-	if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
+	if (hva_to_pfn_fast(kfp, &pfn))
 		return pfn;
 
-	npages = hva_to_pfn_slow(addr, no_wait, write_fault, interruptible,
-				 writable, &pfn);
+	npages = hva_to_pfn_slow(kfp, &pfn);
 	if (npages == 1)
 		return pfn;
 	if (npages == -EINTR)
@@ -2959,24 +2936,25 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool no_wait,
 
 	mmap_read_lock(current->mm);
 	if (npages == -EHWPOISON ||
-	    (!no_wait && check_user_page_hwpoison(addr))) {
+	    (!(kfp->flags & FOLL_NOWAIT) && check_user_page_hwpoison(kfp->hva))) {
 		pfn = KVM_PFN_ERR_HWPOISON;
 		goto exit;
 	}
 
 retry:
-	vma = vma_lookup(current->mm, addr);
+	vma = vma_lookup(current->mm, kfp->hva);
 
 	if (vma == NULL)
 		pfn = KVM_PFN_ERR_FAULT;
 	else if (vma->vm_flags & (VM_IO | VM_PFNMAP)) {
-		r = hva_to_pfn_remapped(vma, addr, write_fault, writable, &pfn);
+		r = hva_to_pfn_remapped(vma, kfp, &pfn);
 		if (r == -EAGAIN)
 			goto retry;
 		if (r < 0)
 			pfn = KVM_PFN_ERR_FAULT;
 	} else {
-		if (no_wait && vma_is_valid(vma, write_fault))
+		if ((kfp->flags & FOLL_NOWAIT) &&
+		    vma_is_valid(vma, kfp->flags & FOLL_WRITE))
 			pfn = KVM_PFN_ERR_NEEDS_IO;
 		else
 			pfn = KVM_PFN_ERR_FAULT;
@@ -2986,41 +2964,69 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool no_wait,
 	return pfn;
 }
 
+static kvm_pfn_t kvm_follow_pfn(struct kvm_follow_pfn *kfp)
+{
+	kfp->hva = __gfn_to_hva_many(kfp->slot, kfp->gfn, NULL,
+				     kfp->flags & FOLL_WRITE);
+
+	if (kfp->hva == KVM_HVA_ERR_RO_BAD)
+		return KVM_PFN_ERR_RO_FAULT;
+
+	if (kvm_is_error_hva(kfp->hva))
+		return KVM_PFN_NOSLOT;
+
+	if (memslot_is_readonly(kfp->slot) && kfp->map_writable) {
+		*kfp->map_writable = false;
+		kfp->map_writable = NULL;
+	}
+
+	return hva_to_pfn(kfp);
+}
+
 kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
 			       bool interruptible, bool no_wait,
 			       bool write_fault, bool *writable)
 {
-	unsigned long addr = __gfn_to_hva_many(slot, gfn, NULL, write_fault);
-
-	if (kvm_is_error_hva(addr)) {
-		if (writable)
-			*writable = false;
-
-		return addr == KVM_HVA_ERR_RO_BAD ? KVM_PFN_ERR_RO_FAULT :
-						    KVM_PFN_NOSLOT;
-	}
-
-	/* Do not map writable pfn in the readonly memslot. */
-	if (writable && memslot_is_readonly(slot)) {
-		*writable = false;
-		writable = NULL;
-	}
-
-	return hva_to_pfn(addr, interruptible, no_wait, write_fault, writable);
+	struct kvm_follow_pfn kfp = {
+		.slot = slot,
+		.gfn = gfn,
+		.map_writable = writable,
+	};
+
+	if (write_fault)
+		kfp.flags |= FOLL_WRITE;
+	if (no_wait)
+		kfp.flags |= FOLL_NOWAIT;
+	if (interruptible)
+		kfp.flags |= FOLL_INTERRUPTIBLE;
+
+	return kvm_follow_pfn(&kfp);
 }
 EXPORT_SYMBOL_GPL(__gfn_to_pfn_memslot);
 
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable)
 {
-	return __gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn, false, false,
-				    write_fault, writable);
+	struct kvm_follow_pfn kfp = {
+		.slot = gfn_to_memslot(kvm, gfn),
+		.gfn = gfn,
+		.flags = write_fault ? FOLL_WRITE : 0,
+		.map_writable = writable,
+	};
+
+	return kvm_follow_pfn(&kfp);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_prot);
 
 kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	return __gfn_to_pfn_memslot(slot, gfn, false, false, true, NULL);
+	struct kvm_follow_pfn kfp = {
+		.slot = slot,
+		.gfn = gfn,
+		.flags = FOLL_WRITE,
+	};
+
+	return kvm_follow_pfn(&kfp);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot);
 
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index 51f3fee4ca3f..d5a215958f06 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -20,8 +20,24 @@
 #define KVM_MMU_UNLOCK(kvm)		spin_unlock(&(kvm)->mmu_lock)
 #endif /* KVM_HAVE_MMU_RWLOCK */
 
-kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool no_wait,
-		     bool write_fault, bool *writable);
+
+struct kvm_follow_pfn {
+	const struct kvm_memory_slot *slot;
+	const gfn_t gfn;
+
+	unsigned long hva;
+
+	/* FOLL_* flags modifying lookup behavior, e.g. FOLL_WRITE. */
+	unsigned int flags;
+
+	/*
+	 * If non-NULL, try to get a writable mapping even for a read fault.
+	 * Set to true if a writable mapping was obtained.
+	 */
+	bool *map_writable;
+};
+
+kvm_pfn_t hva_to_pfn(struct kvm_follow_pfn *kfp);
 
 #ifdef CONFIG_HAVE_KVM_PFNCACHE
 void gfn_to_pfn_cache_invalidate_start(struct kvm *kvm,
diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index 32dc61f48c81..067daf9ad6ef 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -159,6 +159,12 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
 	kvm_pfn_t new_pfn = KVM_PFN_ERR_FAULT;
 	void *new_khva = NULL;
 	unsigned long mmu_seq;
+	struct kvm_follow_pfn kfp = {
+		.slot = gpc->memslot,
+		.gfn = gpa_to_gfn(gpc->gpa),
+		.flags = FOLL_WRITE,
+		.hva = gpc->uhva,
+	};
 
 	lockdep_assert_held(&gpc->refresh_lock);
 
@@ -197,8 +203,7 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
 			cond_resched();
 		}
 
-		/* We always request a writable mapping */
-		new_pfn = hva_to_pfn(gpc->uhva, false, false, true, NULL);
+		new_pfn = hva_to_pfn(&kfp);
 		if (is_error_noslot_pfn(new_pfn))
 			goto out_error;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
