Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0757FD2444F
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 00:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LKBr5my2ABOVRAAPoUjiooXv82BYEKKboYYPDphBtAI=; b=SUCTQ6Ldfn+oF4
	q9x4FhVf2WNI/rs+AAP4RDsEFmuAKztyYsIstB+u7yJJ1xf92OiE1IsHFthy4a2g+bezh0pecRrV9
	dBpA1eldVDmgyJcgrYcqIuqJHrxdG9po3uP8Hcw8NNpT8qt2x9EN9RSpBQVvFDTji+TynuARyJOeS
	PCcSeGvnLtITtEqPDl8gAEBxMH00WNOnXJ4EFS8bQWi+04OWRGpj3e+kGGWB+zY0kvD/KEsLcR58C
	adVOVNJANvyNqfwaN0TIrRFTxdnr3FKRW091DSojAaajQb4dreyVCDdvE0hkmDuhGWYf60mAF+1b5
	GMH18z0cBdEDS9fjm2DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz363-0000000EiKd-0FOR;
	Fri, 11 Oct 2024 00:01:31 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsj-0000000DrcI-3xFi
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:29 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e1159159528so3623547276.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584844; x=1729189644; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ojyPU0tzKIRRbswoqL6JjpEgqRgu1FFXpokE5rqa8U0=;
        b=OAZSNh4NZXQ/Zipvt47P/0efWGRR16annLUzUsTQgPtiN5G+fdWQUGTrVxyFBmqnhB
         5AwMcO0uoBvpg7YhIua7lfEp5t/Wdpj3/l3GdjJ7VGRuLVwzna5mFAu5gcMnBfIGaUJv
         J6ZtjS5V8iY78UnacO6paUXR+XjxiokqAg6xpYBPOjRZbJJ2/OlFErl6lNLT3KX2S1eP
         I8AQ8GkmS6CRQMk3isu+HpdKOIFg7PcvPLchk2swDOijcWMRHLjAwION6+UAevFGARbl
         XMgILnZ8FZ3qaVR2BJLppR7eXDvA4spUXJRz/lQJetwc+AO7yz1h7BktBMonH7m3/0Ta
         6SNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584844; x=1729189644;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojyPU0tzKIRRbswoqL6JjpEgqRgu1FFXpokE5rqa8U0=;
        b=jFIVHVp0D1UiUuQdDg2k3NKntzF2MFxVn/2tycnf/63vv4+Rs58vcvPr6qY4jGwja8
         YQxUVjWJBttmYCJquRe4btfrCy/YEZOESi/VtQQE1fuIVAQ7f5/7Bz3jIryewvHjUcGb
         Hu/u2i33J+FEmCdTi4SMTIa2V+NrihtXLw9Ez5j/XFc2sChHBSy3KuTyatGkSXS7Z1YC
         sPEv/dvvfyXpawZXWsyXM3g8gX+Njikx+sciWvYR5j7O/C2DQr9WiLVkgJBXBQLUxSez
         n/MAhGtNCL/V050vM4Q/CmgWQgGwYov6kzWRt95ez/xfV7LJhgRwdqXx9E4j4tTXef3X
         +ymQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiLPNeShuZAUZhdBG2monmYwrMgPJkvdfsq/1g955YPAGh6VF4mwjdfeEPxTVWx+yXzVn+XcQWgs9w3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSgJRIsyvRoyEUCKSlECeDWf8q/xCyrWnCvnln2JxTeHVRA2yq
	31diAKUkAPt86uQ2JTm4PG5rjQH6YaKjeWwhkqAMPC/T3NtzngpsA/KNAGuu4yVLjDIpKcr8msG
	Fxg==
X-Google-Smtp-Source: AGHT+IHEyKrdGSoNbMWcRNiKhgC/jPgVf/TjauaPCrq7yqhpXyuJQagleroMC0w40O7lZsOojHLr7EwrZqI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:6805:0:b0:e20:cfc2:a326 with SMTP id
 3f1490d57ef6-e29184333b9mr26276.6.1728584844184; Thu, 10 Oct 2024 11:27:24
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:14 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-73-seanjc@google.com>
Subject: [PATCH v13 72/85] KVM: MIPS: Use kvm_faultin_pfn() to map pfns into
 the guest
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_112726_233136_C2F933E3 
X-CRM114-Status: GOOD (  12.04  )
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

Convert MIPS to kvm_faultin_pfn()+kvm_release_faultin_page(), which
are new APIs to consolidate arch code and provide consistent behavior
across all KVM architectures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 69463ab24d97..d2c3b6b41f18 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -557,6 +557,7 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	bool writeable;
 	unsigned long prot_bits;
 	unsigned long mmu_seq;
+	struct page *page;
 
 	/* Try the fast path to handle old / clean pages */
 	srcu_idx = srcu_read_lock(&kvm->srcu);
@@ -578,7 +579,7 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	mmu_seq = kvm->mmu_invalidate_seq;
 	/*
 	 * Ensure the read of mmu_invalidate_seq isn't reordered with PTE reads
-	 * in gfn_to_pfn_prot() (which calls get_user_pages()), so that we don't
+	 * in kvm_faultin_pfn() (which calls get_user_pages()), so that we don't
 	 * risk the page we get a reference to getting unmapped before we have a
 	 * chance to grab the mmu_lock without mmu_invalidate_retry() noticing.
 	 *
@@ -590,7 +591,7 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	smp_rmb();
 
 	/* Slow path - ask KVM core whether we can access this GPA */
-	pfn = gfn_to_pfn_prot(kvm, gfn, write_fault, &writeable);
+	pfn = kvm_faultin_pfn(vcpu, gfn, write_fault, &writeable, &page);
 	if (is_error_noslot_pfn(pfn)) {
 		err = -EFAULT;
 		goto out;
@@ -602,10 +603,10 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 		/*
 		 * This can happen when mappings are changed asynchronously, but
 		 * also synchronously if a COW is triggered by
-		 * gfn_to_pfn_prot().
+		 * kvm_faultin_pfn().
 		 */
 		spin_unlock(&kvm->mmu_lock);
-		kvm_release_pfn_clean(pfn);
+		kvm_release_page_unused(page);
 		goto retry;
 	}
 
@@ -632,10 +633,7 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	if (out_buddy)
 		*out_buddy = *ptep_buddy(ptep);
 
-	if (writeable)
-		kvm_set_pfn_dirty(pfn);
-	kvm_release_pfn_clean(pfn);
-
+	kvm_release_faultin_page(kvm, page, false, writeable);
 	spin_unlock(&kvm->mmu_lock);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
