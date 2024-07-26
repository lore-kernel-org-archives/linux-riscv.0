Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A40BC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 23:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBFSWqI0cz9n/nK2zyaq0k6VzTebmPM6x1E+jnfeYbk=; b=ZBk8yUddD/Qwff
	N1BbyVht+TsbCfxl/H33l/OzCUCG79SaQUb4Qol2LmgcQRVy/3pZg3vmY8s02liDaQCmCLPOamk04
	LZxHcbXLgSeKybTqmzknATMUqWV/xJx72rga4xECs1paG2MuE+lPM4ZIkkn73ySJd/rNJgfpfpUNH
	yPmrJWsBSTgOvkf0AXpf1AD2g9gFvedAf19F9uguYCDA/h+22AxBR49UMXjqnHRTEXOgcK3NJ/ma6
	urGB6RckiQ8Gv9Sm7E/w7R6P09OeiDwEWHRS+zvt9E5uWo67HRvpC+irBXW7uxarG413oRhRoMxe+
	RR05V4Wd3EcIPSyMqggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUph-00000005TCk-02tJ;
	Fri, 26 Jul 2024 23:58:45 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUkF-00000005PTI-1oTZ
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:11 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2cb54eac976so1660215a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037986; x=1722642786; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=U9CL7WNG+bQMLxeBtbO0jb1Rey3S/NViM9NTHyPIsWo=;
        b=dwEl4jOuhWtVvWSnPsuQCaefPpXFBLy8O5p/hCuU1bt6S10pkqfQbjERsZG2lNTGso
         oDUzrorj5rHfpiDJatLzeio21NkUgDxsGy5wtrmucfOpBffLZwaK2ghxtqM3FwP49VV+
         J50JfPpkbL916r6uq2Q5b3W7zMIsij2tX660nfl74AOPymeD22jmZOHme7QJwm2KkAd+
         ZwKCWoNZN8uGNF5h98UaMep8V5EsUS7cxEM8cotFnJ8JCXKBofK/K7aHBn6pXHtMWS3I
         2cm5RtlVT+/R3FvqeNol9rXfNGzMzRWkcU8IdCK/ApfKKLs/VaM87Y51sGQanysZKftb
         +Yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037986; x=1722642786;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9CL7WNG+bQMLxeBtbO0jb1Rey3S/NViM9NTHyPIsWo=;
        b=GLmU/ShPJ2RUuiZJllxpjlTI7NZ2mDJCVswFr86vIhcvvshmomnkfQmAQpwcCySaLS
         8dt138F6L7Mk0b/saU1XzAp3pHOLdni7Gc6bVzehi6XzhdLubMbqX3VMkfHYs8e5N9qY
         4nm8JBsD+ggz6bgvVR/2i/Ey03737ve5r97rAw94kZIxf5v5/9mjwkyTwVA8VS25LHfT
         SPmH/TwZrBog3q9HhM2kfPUV6x3r/c9X87VHoZH2YqTPcnFynPHZ7k+3gAvIzVCegi8I
         ZHtShE9zGMoLx1YZOp1Scs+t76x+va8j9inkH/oE1e/rCBj8bZFC+UACH41ERIv8Ujad
         lDSA==
X-Forwarded-Encrypted: i=1; AJvYcCUMF9UXsq4Uy1ZB7LqtIpJUsYqSAqIBIZx0K2qEvDriSem3epqn2Rij60KnPk3X/XXwtptxETvHD7ug2ttVRNLff40tvFn7UmbqieIBpNRE
X-Gm-Message-State: AOJu0YwpLYoCBcmSPGfClVqsLTw2J82NkCHy/1AH4Xt3pahQByoj8/eW
	gjQlq5c3tEgjDE8ZhSy3PK4DSZmGTMdTSZtkL6TUrsVIrIjiaQ6Q81Hd3vYZPRLz4/jujPryULI
	9Ug==
X-Google-Smtp-Source: AGHT+IHnRzETq13gV9xdTjZ59JsUWCUSm1ccdx7THxn20zb30PlPil4gPX7Xa7ZvU4LkGPt7E6DUyKfDh3Y=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:fd10:b0:2c9:26a1:3762 with SMTP id
 98e67ed59e1d1-2cf7e5b209bmr21293a91.3.1722037985956; Fri, 26 Jul 2024
 16:53:05 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:23 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-15-seanjc@google.com>
Subject: [PATCH v12 14/84] KVM: Replace "async" pointer in gfn=>pfn with
 "no_wait" and error code
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
X-CRM114-CacheID: sfid-20240726_165307_638390_1E220202 
X-CRM114-Status: GOOD (  21.32  )
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

Add a pfn error code to communicate that hva_to_pfn() failed because I/O
was needed and disallowed, and convert @async to a constant @no_wait
boolean.  This will allow eliminating the @no_wait param by having callers
pass in FOLL_NOWAIT along with other FOLL_* flags.

Signed-off-by: David Stevens <stevensd@chromium.org>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c   | 18 +++++++++++-------
 include/linux/kvm_host.h |  3 ++-
 virt/kvm/kvm_main.c      | 29 +++++++++++++++--------------
 virt/kvm/kvm_mm.h        |  2 +-
 virt/kvm/pfncache.c      |  4 ++--
 5 files changed, 31 insertions(+), 25 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index d76390ef49b2..eb9ad0283fd5 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4328,17 +4328,21 @@ static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
 
 static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 {
-	bool async;
-
 	if (fault->is_private)
 		return kvm_faultin_pfn_private(vcpu, fault);
 
-	async = false;
-	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, &async,
+	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, true,
 					  fault->write, &fault->map_writable,
 					  &fault->hva);
-	if (!async)
-		return RET_PF_CONTINUE; /* *pfn has correct page already */
+
+	/*
+	 * If resolving the page failed because I/O is needed to fault-in the
+	 * page, then either set up an asynchronous #PF to do the I/O, or if
+	 * doing an async #PF isn't possible, retry with I/O allowed.  All
+	 * other failures are terminal, i.e. retrying won't help.
+	 */
+	if (fault->pfn != KVM_PFN_ERR_NEEDS_IO)
+		return RET_PF_CONTINUE;
 
 	if (!fault->prefetch && kvm_can_do_async_pf(vcpu)) {
 		trace_kvm_try_async_get_page(fault->addr, fault->gfn);
@@ -4356,7 +4360,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	 * to wait for IO.  Note, gup always bails if it is unable to quickly
 	 * get a page and a fatal signal, i.e. SIGKILL, is pending.
 	 */
-	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, true, NULL,
+	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, true, true,
 					  fault->write, &fault->map_writable,
 					  &fault->hva);
 	return RET_PF_CONTINUE;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 6d4503e8eabe..92b2922e2216 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -97,6 +97,7 @@
 #define KVM_PFN_ERR_HWPOISON	(KVM_PFN_ERR_MASK + 1)
 #define KVM_PFN_ERR_RO_FAULT	(KVM_PFN_ERR_MASK + 2)
 #define KVM_PFN_ERR_SIGPENDING	(KVM_PFN_ERR_MASK + 3)
+#define KVM_PFN_ERR_NEEDS_IO	(KVM_PFN_ERR_MASK + 4)
 
 /*
  * error pfns indicate that the gfn is in slot but faild to
@@ -1218,7 +1219,7 @@ kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable);
 kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn);
 kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
-			       bool interruptible, bool *async,
+			       bool interruptible, bool no_wait,
 			       bool write_fault, bool *writable, hva_t *hva);
 
 void kvm_release_pfn_clean(kvm_pfn_t pfn);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 03af1a0090b1..c2efdfe26d5b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2789,7 +2789,7 @@ static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
  * The slow path to get the pfn of the specified host virtual address,
  * 1 indicates success, -errno is returned if error is detected.
  */
-static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
+static int hva_to_pfn_slow(unsigned long addr, bool no_wait, bool write_fault,
 			   bool interruptible, bool *writable, kvm_pfn_t *pfn)
 {
 	/*
@@ -2812,7 +2812,7 @@ static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
 
 	if (write_fault)
 		flags |= FOLL_WRITE;
-	if (async)
+	if (no_wait)
 		flags |= FOLL_NOWAIT;
 	if (interruptible)
 		flags |= FOLL_INTERRUPTIBLE;
@@ -2928,8 +2928,8 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
  * Pin guest page in memory and return its pfn.
  * @addr: host virtual address which maps memory to the guest
  * @interruptible: whether the process can be interrupted by non-fatal signals
- * @async: whether this function need to wait IO complete if the
- *         host page is not in the memory
+ * @no_wait: whether or not this function need to wait IO complete if the
+ *	     host page is not in the memory
  * @write_fault: whether we should get a writable host page
  * @writable: whether it allows to map a writable host page for !@write_fault
  *
@@ -2938,7 +2938,7 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
  * 2): @write_fault = false && @writable, @writable will tell the caller
  *     whether the mapping is writable.
  */
-kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
+kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool no_wait,
 		     bool write_fault, bool *writable)
 {
 	struct vm_area_struct *vma;
@@ -2950,7 +2950,7 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 	if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
 		return pfn;
 
-	npages = hva_to_pfn_slow(addr, async, write_fault, interruptible,
+	npages = hva_to_pfn_slow(addr, no_wait, write_fault, interruptible,
 				 writable, &pfn);
 	if (npages == 1)
 		return pfn;
@@ -2959,7 +2959,7 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 
 	mmap_read_lock(current->mm);
 	if (npages == -EHWPOISON ||
-	      (!async && check_user_page_hwpoison(addr))) {
+	    (!no_wait && check_user_page_hwpoison(addr))) {
 		pfn = KVM_PFN_ERR_HWPOISON;
 		goto exit;
 	}
@@ -2976,9 +2976,10 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 		if (r < 0)
 			pfn = KVM_PFN_ERR_FAULT;
 	} else {
-		if (async && vma_is_valid(vma, write_fault))
-			*async = true;
-		pfn = KVM_PFN_ERR_FAULT;
+		if (no_wait && vma_is_valid(vma, write_fault))
+			pfn = KVM_PFN_ERR_NEEDS_IO;
+		else
+			pfn = KVM_PFN_ERR_FAULT;
 	}
 exit:
 	mmap_read_unlock(current->mm);
@@ -2986,7 +2987,7 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 }
 
 kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
-			       bool interruptible, bool *async,
+			       bool interruptible, bool no_wait,
 			       bool write_fault, bool *writable, hva_t *hva)
 {
 	unsigned long addr = __gfn_to_hva_many(slot, gfn, NULL, write_fault);
@@ -3008,21 +3009,21 @@ kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
 		writable = NULL;
 	}
 
-	return hva_to_pfn(addr, interruptible, async, write_fault, writable);
+	return hva_to_pfn(addr, interruptible, no_wait, write_fault, writable);
 }
 EXPORT_SYMBOL_GPL(__gfn_to_pfn_memslot);
 
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable)
 {
-	return __gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn, false, NULL,
+	return __gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn, false, false,
 				    write_fault, writable, NULL);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_prot);
 
 kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	return __gfn_to_pfn_memslot(slot, gfn, false, NULL, true, NULL, NULL);
+	return __gfn_to_pfn_memslot(slot, gfn, false, false, true, NULL, NULL);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot);
 
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index a3fa86f60d6c..51f3fee4ca3f 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -20,7 +20,7 @@
 #define KVM_MMU_UNLOCK(kvm)		spin_unlock(&(kvm)->mmu_lock)
 #endif /* KVM_HAVE_MMU_RWLOCK */
 
-kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
+kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool no_wait,
 		     bool write_fault, bool *writable);
 
 #ifdef CONFIG_HAVE_KVM_PFNCACHE
diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index 58c706a610e5..32dc61f48c81 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -197,8 +197,8 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
 			cond_resched();
 		}
 
-		/* We always request a writeable mapping */
-		new_pfn = hva_to_pfn(gpc->uhva, false, NULL, true, NULL);
+		/* We always request a writable mapping */
+		new_pfn = hva_to_pfn(gpc->uhva, false, false, true, NULL);
 		if (is_error_noslot_pfn(new_pfn))
 			goto out_error;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
