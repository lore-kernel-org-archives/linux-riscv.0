Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4131AC3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TuGUZ0zkwW+vHRTox8rXsNJ/mntpQBfClb6yUWHpPPY=; b=veLsAIqGRTsIdt
	BlvQVwQ+DjjksDqyv6PBAY0WEpbJ7fQ6dBianQ9Jrj9/83xzlZ6uVYb7hUrpw0mPl6SwZbMfQCP4P
	eq3zqEGl06FjNN6VpJzbIdM89WmDyUPMzcGnhGNzLvNR7LgZpPHrdgWMLI4PO56eHDhqBvb0MpcWj
	+EiaZ6NlcP3k1cDK0Ap0Pw3UVueF+UiWA41pA9CLCBaN5MfEHhHvPWEGlQVxHUMRfXaT68N/omUr1
	37rrld6bP1MiuiRTmbwqqFPYLohHAHxV7gxCmuQjXZvncYouTH7ohm7IastkAtFQJajwLdNDiTI4b
	nRZ7+F/nUbrqa+xj3gwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXV0V-00000005Z6C-3Dh3;
	Sat, 27 Jul 2024 00:09:55 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUl9-00000005QGS-1KBA
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:05 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-70e9ea89b42so1344065b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038042; x=1722642842; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9zY2YEu1HUtjdcDr5plCoNlYuLGLbh4OhGnITp611eA=;
        b=lCii9c1JIOtwqfdmo8tdvPuGAIAdWHVvMRLwHoBu4XIiWl/gSKD5LI9zcvNQUZ23eQ
         Ty0jDPMFDtI6pZOwd2F3igE4Ct/6xE7BwTqVd5jl6YNahxjUBZu7Vojpsh6pRVfhe6ux
         5jAw+C+hakxjACPzjC8TkRNAT97l/ROSYMXa6zGjbtxg5mf2t1iDskvNPLIc6A9RkwTq
         x5xjbS6n6JEEXYlM5D7XWLbFF+eYvgizIHiCopONIQ6e+d2aKmQ5pmNIF2GZlsLdFlWl
         d9Au4uucGQievHr2guERMEnwtvrGbnNx1SSo223a+hUWXfSS+xQ94/Xh8F/DpmPhgm8b
         lJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038042; x=1722642842;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zY2YEu1HUtjdcDr5plCoNlYuLGLbh4OhGnITp611eA=;
        b=w2DMQV0Gc+6L3sdada8coKGs5iKh3vSvNwW8zwoEOjrWVkEwoonJm/pLAJHd3dOv3V
         FoCPQiP66HSA9RWMmOd4xFe3apJDJR2bZ9fsFVzXH1xLdiZbVGR7alknXmjfmneo7Xpb
         4T7QAxOGVenhTMz1IILKIV4TgiHcSqPX6tPpm9Jj0GjR2HTKI6Sr0I2Ims4SErKG11wP
         xpWAF4XR2QX7PunjAAXfTzxHeu+f3WMLsU1aZd24FXR/30fC3rwCZvz9WzTSGxQ7SXG+
         sf2v0QTDGBTWvll8sWWtX2+A3Clna33SVVtnI8cGwz7BKUHd0gRC7ittJsJyr+gZIdq3
         09eg==
X-Forwarded-Encrypted: i=1; AJvYcCXruEGs57fyYYIY5Tg9WyIjgHVOefhgjP/u6uCR383NGOpgm9aWWxIT3M6zhHjbTQeY9I52t2Aad+TQoWzy4PuUleitmEFai68WIZNZbxZ9
X-Gm-Message-State: AOJu0Yya1lqJxQyQE/FSzUA3vFRVh0s1hHq5j+Tabgdh/x5EVmNCoXRv
	Z/xlQxm7xP+zkSRDSUtxzFrLiLXyAOMVauL7jwOb1x1vsG66zHUcGub10qbU2Z0gb0d5i0+Vq41
	4bg==
X-Google-Smtp-Source: AGHT+IFj2ro53tB8A9NyZ1GYVrgqdx/ajbf6jMsbjIk3q7R62qDhpHqlToArJZlcHrNz2kHOoBaEKLt0+7c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:66e5:b0:70d:27ca:96b8 with SMTP id
 d2e1a72fcca58-70ece926ad1mr25418b3a.0.1722038041966; Fri, 26 Jul 2024
 16:54:01 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:50 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-42-seanjc@google.com>
Subject: [PATCH v12 41/84] KVM: x86/mmu: Mark pages/folios dirty at the origin
 of make_spte()
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
X-CRM114-CacheID: sfid-20240726_165403_414231_888CFDBD 
X-CRM114-Status: GOOD (  17.07  )
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

Move the marking of folios dirty from make_spte() out to its callers,
which have access to the _struct page_, not just the underlying pfn.
Once all architectures follow suit, this will allow removing KVM's ugly
hack where KVM elevates the refcount of VM_MIXEDMAP pfns that happen to
be struct page memory.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c         | 29 +++++++++++++++++++++++++++--
 arch/x86/kvm/mmu/paging_tmpl.h |  5 +++++
 arch/x86/kvm/mmu/spte.c        | 11 -----------
 3 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 1cdd67707461..7e7b855ce1e1 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2918,7 +2918,16 @@ static bool kvm_mmu_prefetch_sptes(struct kvm_vcpu *vcpu, gfn_t gfn, u64 *sptep,
 	for (i = 0; i < nr_pages; i++, gfn++, sptep++) {
 		mmu_set_spte(vcpu, slot, sptep, access, gfn,
 			     page_to_pfn(pages[i]), NULL);
-		kvm_release_page_clean(pages[i]);
+
+		/*
+		 * KVM always prefetches writable pages from the primary MMU,
+		 * and KVM can make its SPTE writable in the fast page, without
+		 * notifying the primary MMU.  Mark pages/folios dirty now to
+		 * ensure file data is written back if it ends up being written
+		 * by the guest.  Because KVM's prefetching GUPs writable PTEs,
+		 * the probability of unnecessary writeback is extremely low.
+		 */
+		kvm_release_page_dirty(pages[i]);
 	}
 
 	return true;
@@ -4314,7 +4323,23 @@ static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
 static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 				      struct kvm_page_fault *fault, int r)
 {
-	kvm_release_pfn_clean(fault->pfn);
+	lockdep_assert_once(lockdep_is_held(&vcpu->kvm->mmu_lock) ||
+			    r == RET_PF_RETRY);
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
+	if (!fault->map_writable || r == RET_PF_RETRY)
+		kvm_release_pfn_clean(fault->pfn);
+	else
+		kvm_release_pfn_dirty(fault->pfn);
 }
 
 static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index b6897916c76b..2e2d87a925ac 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -953,6 +953,11 @@ static int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int
 		  spte_to_pfn(spte), spte, true, false,
 		  host_writable, &spte);
 
+	/*
+	 * There is no need to mark the pfn dirty, as the new protections must
+	 * be a subset of the old protections, i.e. synchronizing a SPTE cannot
+	 * change the SPTE from read-only to writable.
+	 */
 	return mmu_spte_update(sptep, spte);
 }
 
diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index 9b8795bd2f04..2c5650390d3b 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -277,17 +277,6 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 		mark_page_dirty_in_slot(vcpu->kvm, slot, gfn);
 	}
 
-	/*
-	 * If the page that KVM got from the primary MMU is writable, i.e. if
-	 * it's host-writable, mark the page/folio dirty.  As alluded to above,
-	 * folios can't be safely marked dirty in the fast page fault handler,
-	 * and so KVM must (somewhat) speculatively mark the folio dirty even
-	 * though it isn't guaranteed to be written as KVM won't mark the folio
-	 * dirty if/when the SPTE is made writable.
-	 */
-	if (host_writable)
-		kvm_set_pfn_dirty(pfn);
-
 	*new_spte = spte;
 	return wrprot;
 }
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
