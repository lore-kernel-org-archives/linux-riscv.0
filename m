Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA3BC3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FOk79nHJsQe50E3O6HW6adQP4QsAa3CJhll7ddtN/Ms=; b=VBJWVIREUpxD7W
	/oIxH3f4FI6fqSyI8jW3VBmzTDhgK83sTAZ/r4jv5DAorEvqAIGmQ+hl/R2ZYiFwFBK4KRbQr2NN+
	+sWOgAHXl3P180l2k0H2zbu8dPsE49E8RzwdOXDJYNmWOVBRO4fPywzR1+EuvYSd+4mnlLcP2HP1+
	FtGkpjHLWjhCHeGw7e/GsIOHs4PIOEAcBN4n9jH2cfdR2rWFahzOvZJaywjtVa/yXTmozWM8fwKeu
	dXACnSy28uDgtLyOIHE4RGmCgji8cyKw/8F4ckrg9jQd1TiOOv8CqnBmNpx7saghb/Jx8PlMkHZLy
	bpScskSXsMTu033NWfoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXV9W-00000005dGp-200G;
	Sat, 27 Jul 2024 00:19:14 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlO-00000005QTS-0zry
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:23 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fc6f3ac7beso10762485ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038057; x=1722642857; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=l9BW/dK5c/4ryaOpC0RxFiUBYVnD4MPO1UqGokFlyv8=;
        b=rwltHS3Fz9Iauzuo3pJpgwu/pOrEGW1j/bhMwzhBdfd15DWg3bSOarD5elcMoJuls7
         22FUF4qXnsJKLDFzOVNue7CQXZKpD6rmQdhGpDUrLe3GrM3gVgT7xEtPT9YteNuuJHNm
         JkrYtNXVXnyyz5d6N9i+HrKT3lgZCVGQe1m1TzGHbbF5ZHEJAc6PqOHxoygAE55vRN6u
         J27B/M8Ud30wFON9izgtx9XJWYSArcqVnx1hmzqg1pXhJKIr31hcDLcASguw4Ug1kiFZ
         ynpWpOZ4QPREdiSsXVfQKMEvjuxWsWupPA0u5ceimx7eqkiNqCNn/Ze5UljiXjsg9Uyh
         NgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038057; x=1722642857;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9BW/dK5c/4ryaOpC0RxFiUBYVnD4MPO1UqGokFlyv8=;
        b=W2hqLzjKeQcek6jluScc3PUBi9G8dvwcZx0lFQUQEZ7uiSIY455KQQ+EF/rfm8ebdZ
         idjRvfBB0cTNTqrqGNzaAqcJWKL6+vzBXoNZmCMRz07oiIBPfMfyIsnovNzEqesPkGtL
         wyRqHNd1ONe6wxQ9t+3yEcqMHs6F6eEVfPmDcCocWo3v7gf44HfVJeyJBDkb+rgGsQ/x
         s+sDk9o8RfwXMRjbEAgUJlCmUQ5cfmMRjEcGzEcoJOrQyo1y9pVNFoP60AL0ByzlBfBm
         qnjNv+R5Mk2h24EjeyeZIsSlXaNfmwwhKOKYV/3kVKwGf68slsl5drER99CnrdVxZaar
         HKeA==
X-Forwarded-Encrypted: i=1; AJvYcCUF3s0y+DkAFvUpaQ0TVwpFulHmOkO8TpL3Iu/5Da722iIksvjurHM0I8XucDqbVe9FaS99ZG1lMScWoXCSqlnxUEzo2Pgm47ivip6Swp7+
X-Gm-Message-State: AOJu0YzW2vWLMAoNW9dRmSY08R0iAmnShJ+ZyAyEqyntEWjERGOmvWXk
	Hi0dhoGySDajczRy37N0mYX1ExKi+aIX4oKUNLQRt8WWe7WM5jZcdMYABY91YO5tzI6wlSTbYr7
	o8Q==
X-Google-Smtp-Source: AGHT+IH3COIaUp2rXSDrmiVRXNOzjzCRiof8RV2PU1lQ3pUgA2jXVKIIsmrd9aJoYDTjtMdA3IOsVNqBhcc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ea06:b0:1f9:cbe5:e422 with SMTP id
 d9443c01a7336-1ff0488dbf2mr744395ad.8.1722038056933; Fri, 26 Jul 2024
 16:54:16 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:57 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-49-seanjc@google.com>
Subject: [PATCH v12 48/84] KVM: Move x86's API to release a faultin page to
 common KVM
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
X-CRM114-CacheID: sfid-20240726_165418_427727_10EDB46D 
X-CRM114-Status: GOOD (  15.30  )
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

Move KVM x86's helper that "finishes" the faultin process to common KVM
so that the logic can be shared across all architectures.  Note, not all
architectures implement a fast page fault path, but the gist of the
comment applies to all architectures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c   | 24 ++----------------------
 include/linux/kvm_host.h | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 95beb50748fc..2a0cfa225c8d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4323,28 +4323,8 @@ static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
 static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 				      struct kvm_page_fault *fault, int r)
 {
-	lockdep_assert_once(lockdep_is_held(&vcpu->kvm->mmu_lock) ||
-			    r == RET_PF_RETRY);
-
-	if (!fault->refcounted_page)
-		return;
-
-	/*
-	 * If the page that KVM got from the *primary MMU* is writable, and KVM
-	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
-	 * may mark a folio dirty even if KVM created a read-only SPTE, e.g. if
-	 * the GFN is write-protected.  Folios can't be safely marked dirty
-	 * outside of mmu_lock as doing so could race with writeback on the
-	 * folio.  As a result, KVM can't mark folios dirty in the fast page
-	 * fault handler, and so KVM must (somewhat) speculatively mark the
-	 * folio dirty if KVM could locklessly make the SPTE writable.
-	 */
-	if (r == RET_PF_RETRY)
-		kvm_release_page_unused(fault->refcounted_page);
-	else if (!fault->map_writable)
-		kvm_release_page_clean(fault->refcounted_page);
-	else
-		kvm_release_page_dirty(fault->refcounted_page);
+	kvm_release_faultin_page(vcpu->kvm, fault->refcounted_page,
+				 r == RET_PF_RETRY, fault->map_writable);
 }
 
 static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9d2a97eb30e4..91341cdc6562 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1216,6 +1216,32 @@ static inline void kvm_release_page_unused(struct page *page)
 void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
 
+static inline void kvm_release_faultin_page(struct kvm *kvm, struct page *page,
+					    bool unused, bool dirty)
+{
+	lockdep_assert_once(lockdep_is_held(&kvm->mmu_lock) || unused);
+
+	if (!page)
+		return;
+
+	/*
+	 * If the page that KVM got from the *primary MMU* is writable, and KVM
+	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
+	 * may mark a folio dirty even if KVM created a read-only SPTE, e.g. if
+	 * the GFN is write-protected.  Folios can't be safely marked dirty
+	 * outside of mmu_lock as doing so could race with writeback on the
+	 * folio.  As a result, KVM can't mark folios dirty in the fast page
+	 * fault handler, and so KVM must (somewhat) speculatively mark the
+	 * folio dirty if KVM could locklessly make the SPTE writable.
+	 */
+	if (unused)
+		kvm_release_page_unused(page);
+	else if (dirty)
+		kvm_release_page_dirty(page);
+	else
+		kvm_release_page_clean(page);
+}
+
 kvm_pfn_t kvm_lookup_pfn(struct kvm *kvm, gfn_t gfn);
 kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
 			    unsigned int foll, bool *writable,
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
