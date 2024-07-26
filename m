Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9412EC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 23:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V72/S99ZLYredzkIO+yZ6s2EQmFkwzEvjWINXCO5Gr4=; b=YQIu/sZnMaN3Ip
	oo+E1WjIqn8MtWwXiuy80H/GB63vYvceuqvhsvIah85kta3PR6qo1x0QiaVY9vcbx2qXDVbRHyadi
	kz1IrmRIVbqb9NVYOT4UodCIHbTM/z8u+24PShxfTmLEuGXiz4wD4zsoXndXW60Ems0I1VPkgtL55
	cOkOkQypYsFqYyrCfCAkGFbONxOoKsQwHK8ayVKipjF0gv5P0dYUp1aqXohV4BJO5nbTZzaYcoFSO
	YrhWW2vONpExYGCQd9Q5/5pwI2UE5dlqM5DkqxjMtZTdjKwj5YzGeZi6hEWhIqccCoy/Bp5gXYI0f
	mJ096o9ve218aJqKfcew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlx-00000005QxP-33Qr;
	Fri, 26 Jul 2024 23:54:53 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUjt-00000005PAc-0uZr
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:52:46 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fc54c57a92so10621805ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037964; x=1722642764; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=oJ4Czs6Wm6GL3WD+/Q+iqutVJUfrJPNLt1yka1W8eMI=;
        b=e3mlaXFq3kXHLxKh1ZEXJE7y9azzwcQTw1Ro1qT/6AJZfyXrfBCVOgfnZoaIsEFr9G
         NtrjUQjOZfxWBi/rk+WXajNdHpphQdycAPvmD04phGs6Bqx7asMFPGhRjnghfN4bSkaV
         ioa9zHcwqMan9mQ1Ueas1vEP+Uq9fZPi/BXSDEnJfmiXg36oxasVjGhYgFsXUX0Ft+Tx
         b4Q3rQmGDkMOAasyGPx7mJE/PfJaRSwPMiCbxTRiQ+hxxKxC0HMs+1aLwyVHGiIPNy+P
         SxcFnUdMnzLxM4kmObl4+c58l+rkhMujVWyJXU5WQf5hs9gxXjzfeEIow2oSACgfqxB0
         5S+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037964; x=1722642764;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJ4Czs6Wm6GL3WD+/Q+iqutVJUfrJPNLt1yka1W8eMI=;
        b=aXIg0TQ6d1a1HIypYztBLDumpRyD17AMaBz7ZgZoUCTfeeZYbL2PssIiHUFnVVKao/
         fXoPDxYJ17yl+X3BkEACt/poEakH5I5NrigWLD8WQBiK+7jLvid4ZdFDL6HHJykc5DzV
         2Dzxh4mYpVwTPeOVRfYeLLqpJZOIyb4q6q3PZz8dyYM/nS05qHeKKaTpR6xHTdAgt69I
         ydxtXyqL+crxT7u/kem5rsfLI+OyAMxNp2GFdx3m59Lkv46bD8FI6fOPKVSN2JxgmXIP
         Xj163qMvLdTL41s+BKE+ZnlG20ZgJRoTQBUE+IMn+3pQYB2c8IjvDPIAIXkfrUwkfwR+
         2rjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPYgUDosCEOz85nshu4kwHvVjsCFiF/L+TWma5vP/q6oDD1tl382Maw2oMJx6CHQyR5PjCHX9tg5Axuio6Kb91GTMGc6sO1Vr5XPOC6fx3
X-Gm-Message-State: AOJu0YwgP6ePWgCy7fHPww7QBcwGXdoKRxmjuEo5urK/A2xpD7Qi0Glr
	j1LndNShMbj/bU0nu1zxvCw4mN9QkPDt9j9y3NR9C7iWHLPMDP7nhEnhef6sAN3glt/TI1PkW0M
	zzQ==
X-Google-Smtp-Source: AGHT+IE4QseE8FQyDppGpUcmrzEgygvCajM4BiXmkGQ8bCrs1hHMNuBsnO5u2Op4CzG6c9mnubgf1na2VnA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f683:b0:1fc:27be:42dd with SMTP id
 d9443c01a7336-1ff0479bbb4mr799825ad.1.1722037964087; Fri, 26 Jul 2024
 16:52:44 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:12 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-4-seanjc@google.com>
Subject: [PATCH v12 03/84] KVM: Drop KVM_ERR_PTR_BAD_PAGE and instead return
 NULL to indicate an error
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
X-CRM114-CacheID: sfid-20240726_165245_333945_61833909 
X-CRM114-Status: GOOD (  12.38  )
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

Remove KVM_ERR_PTR_BAD_PAGE and instead return NULL, as "bad page" is just
a leftover bit of weirdness from days of old when KVM stuffed a "bad" page
into the guest instead of actually handling missing pages.  See commit
cea7bb21280e ("KVM: MMU: Make gfn_to_page() always safe").

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_pr.c          |  2 +-
 arch/powerpc/kvm/book3s_xive_native.c |  2 +-
 arch/s390/kvm/vsie.c                  |  2 +-
 arch/x86/kvm/lapic.c                  |  2 +-
 include/linux/kvm_host.h              |  7 -------
 virt/kvm/kvm_main.c                   | 15 ++++++---------
 6 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index a7d7137ea0c8..1bdcd4ee4813 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -645,7 +645,7 @@ static void kvmppc_patch_dcbz(struct kvm_vcpu *vcpu, struct kvmppc_pte *pte)
 	int i;
 
 	hpage = gfn_to_page(vcpu->kvm, pte->raddr >> PAGE_SHIFT);
-	if (is_error_page(hpage))
+	if (!hpage)
 		return;
 
 	hpage_offset = pte->raddr & ~PAGE_MASK;
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index 6e2ebbd8aaac..d9bf1bc3ff61 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -654,7 +654,7 @@ static int kvmppc_xive_native_set_queue_config(struct kvmppc_xive *xive,
 	}
 
 	page = gfn_to_page(kvm, gfn);
-	if (is_error_page(page)) {
+	if (!page) {
 		srcu_read_unlock(&kvm->srcu, srcu_idx);
 		pr_err("Couldn't get queue page %llx!\n", kvm_eq.qaddr);
 		return -EINVAL;
diff --git a/arch/s390/kvm/vsie.c b/arch/s390/kvm/vsie.c
index 54deafd0d698..566697ee37eb 100644
--- a/arch/s390/kvm/vsie.c
+++ b/arch/s390/kvm/vsie.c
@@ -661,7 +661,7 @@ static int pin_guest_page(struct kvm *kvm, gpa_t gpa, hpa_t *hpa)
 	struct page *page;
 
 	page = gfn_to_page(kvm, gpa_to_gfn(gpa));
-	if (is_error_page(page))
+	if (!page)
 		return -EINVAL;
 	*hpa = (hpa_t)page_to_phys(page) + (gpa & ~PAGE_MASK);
 	return 0;
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index a7172ba59ad2..6d65b36fac29 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -2629,7 +2629,7 @@ int kvm_alloc_apic_access_page(struct kvm *kvm)
 	}
 
 	page = gfn_to_page(kvm, APIC_DEFAULT_PHYS_BASE >> PAGE_SHIFT);
-	if (is_error_page(page)) {
+	if (!page) {
 		ret = -EFAULT;
 		goto out;
 	}
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 689e8be873a7..3d9617d1de41 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -153,13 +153,6 @@ static inline bool kvm_is_error_gpa(gpa_t gpa)
 	return gpa == INVALID_GPA;
 }
 
-#define KVM_ERR_PTR_BAD_PAGE	(ERR_PTR(-ENOENT))
-
-static inline bool is_error_page(struct page *page)
-{
-	return IS_ERR(page);
-}
-
 #define KVM_REQUEST_MASK           GENMASK(7,0)
 #define KVM_REQUEST_NO_WAKEUP      BIT(8)
 #define KVM_REQUEST_WAIT           BIT(9)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d0788d0a72cc..fd8c212b8de7 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3085,19 +3085,14 @@ EXPORT_SYMBOL_GPL(gfn_to_page_many_atomic);
  */
 struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
 {
-	struct page *page;
 	kvm_pfn_t pfn;
 
 	pfn = gfn_to_pfn(kvm, gfn);
 
 	if (is_error_noslot_pfn(pfn))
-		return KVM_ERR_PTR_BAD_PAGE;
+		return NULL;
 
-	page = kvm_pfn_to_refcounted_page(pfn);
-	if (!page)
-		return KVM_ERR_PTR_BAD_PAGE;
-
-	return page;
+	return kvm_pfn_to_refcounted_page(pfn);
 }
 EXPORT_SYMBOL_GPL(gfn_to_page);
 
@@ -3191,7 +3186,8 @@ static void kvm_set_page_accessed(struct page *page)
 
 void kvm_release_page_clean(struct page *page)
 {
-	WARN_ON(is_error_page(page));
+	if (WARN_ON(!page))
+		return;
 
 	kvm_set_page_accessed(page);
 	put_page(page);
@@ -3215,7 +3211,8 @@ EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
 
 void kvm_release_page_dirty(struct page *page)
 {
-	WARN_ON(is_error_page(page));
+	if (WARN_ON(!page))
+		return;
 
 	kvm_set_page_dirty(page);
 	kvm_release_page_clean(page);
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
