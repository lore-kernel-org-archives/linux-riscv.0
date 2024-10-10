Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6528CD2444F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 21:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AGU/GqKu5gmitGlqNZL0ex+Vjx34GEE9NoP6G2B4ALA=; b=wEbu/iUTxrizKW
	cK8/DQ03MdchjX8e8bS0AyjkUd9dhqm0Qbt5tzhPk2BCYTWWPolYw67+9eUqTRzvhcHM+qcADnqPP
	6iQNDjN61n4iAZD4MmIjeJzgGWpHU3pOSiLQ8vibW1qauUn93x3zRWImt0/4qgxIo+VK3Wrba8gH+
	FZI+YCcD/Fu0MTLAboWxi7nL14vbKj5g7ZsfRd6Wk5c3iubJDPZ3bkC6IOoK+riO+kqBc2RenBspi
	4/xO+Lpw/RfKv1I9rcQrJ6NJ5LZ+wDm/fwzl30CfaISOLYmIZbwGS6/q4496h8Yrz6YrKvYhhh46h
	neAH8cbHgvoZxU1GIsYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0zj-0000000ESpJ-2pR6;
	Thu, 10 Oct 2024 21:46:51 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsb-0000000DrVO-30Ey
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:19 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-71e019ab268so1589828b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584835; x=1729189635; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9LTMkDJZxM2S5Qh4t0DfHllWvhtFq1rJ9EqXHTYHy/A=;
        b=Ezg7/CMWQDMLN8YEdrgAzjhCIggY01A7M2zQRTVFeivnUP9xNYMnDgSn08tTNAQswa
         kqk7p2xGoJBvlWCJY2F295EpfrTh6Gs382v094DWZ6fCATf7c3raAMlaHVsWLbMuZX8q
         lhxCBrETU5/+2nt/FLnhY0WsswBeH/2OGGYCpGMOpF9BEDb2/zwz1gDzgmFNd4XSF4Jc
         yE5+qnvk/nYcYh7E+904AvUOhyHPUho7ahqpJEfAu8ClaWnh4qMEVzY/715tDYQ7YiPf
         TRld3kwCAO1N9Z5t2zjmuJFVNJrxILimSxqerNKmR1ypmopxODnWp9w7ztgiyY+zhKy6
         q3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584835; x=1729189635;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LTMkDJZxM2S5Qh4t0DfHllWvhtFq1rJ9EqXHTYHy/A=;
        b=esiW/Bc6+LMpM0xGBsek8715lS3Xc9X60tbK3ttWnxJvOgpXq/XoVRQ3Cayy2pjSm1
         sfl0NJZTnn3XldqKFfGk+SlhrQZ5wltvf556yyyVAmcOIuISlvLWpaCZVJ/xFipvpuNd
         VYwSXCMc3XWfBiziCopxK+I3TiIZQr4K7eWjKNPLoG7FqXkZazNyXuXjoJQ5L6UJLZs3
         iI21VMijSTONV0ISsxvlCfJY1xJBXHXzq4u5aX6a3NPa5hTWTBEP/X8FE6H6GLHtYjJO
         c73/WUnqqbo2O5HXQEnfpbW5bnKZcvPco4LR7FIWNZA2oBxDLZFE974bDQGMXF81hg49
         soDg==
X-Forwarded-Encrypted: i=1; AJvYcCVFNA+mxsv18vYd8jb0gybm8pxk04ZEoUFXTIgQGTEVIqKPlE6Al/ZyTaoQ0rNoNlddEqoxYPDkduoe9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcl2wy4fTS6q/CzulhNdlnZzNv7R8idicwps1PrjMftXWoiiyB
	COwvwddaiGDXHAAaRB8VDHVpRZm+oeqX2LDuaYzo4wz/Mvj7OgtxGfVR8ksuGSb1TVIPItZx2C8
	h6Q==
X-Google-Smtp-Source: AGHT+IExt7obORK9hFSNzpsBdJKygVAVx/dPvrUuCl2bsyTFt9B1GPfq0Q1aHG/lNRl/yht5gsZcWFEXy1g=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:8614:b0:70d:fba:c51c with SMTP id
 d2e1a72fcca58-71e1dbd032amr6898b3a.3.1728584835380; Thu, 10 Oct 2024 11:27:15
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:10 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-69-seanjc@google.com>
Subject: [PATCH v13 68/85] KVM: LoongArch: Use kvm_faultin_pfn() to map pfns
 into the guest
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
X-CRM114-CacheID: sfid-20241010_112718_441417_D536197B 
X-CRM114-Status: GOOD (  12.62  )
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

Convert LoongArch to kvm_faultin_pfn()+kvm_release_faultin_page(), which
are new APIs to consolidate arch code and provide consistent behavior
across all KVM architectures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 7066cafcce64..4d203294767c 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -780,6 +780,7 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_memory_slot *memslot;
 	struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
+	struct page *page;
 
 	/* Try the fast path to handle old / clean pages */
 	srcu_idx = srcu_read_lock(&kvm->srcu);
@@ -807,7 +808,7 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 	mmu_seq = kvm->mmu_invalidate_seq;
 	/*
 	 * Ensure the read of mmu_invalidate_seq isn't reordered with PTE reads in
-	 * gfn_to_pfn_prot() (which calls get_user_pages()), so that we don't
+	 * kvm_faultin_pfn() (which calls get_user_pages()), so that we don't
 	 * risk the page we get a reference to getting unmapped before we have a
 	 * chance to grab the mmu_lock without mmu_invalidate_retry() noticing.
 	 *
@@ -819,7 +820,7 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 	smp_rmb();
 
 	/* Slow path - ask KVM core whether we can access this GPA */
-	pfn = gfn_to_pfn_prot(kvm, gfn, write, &writeable);
+	pfn = kvm_faultin_pfn(vcpu, gfn, write, &writeable, &page);
 	if (is_error_noslot_pfn(pfn)) {
 		err = -EFAULT;
 		goto out;
@@ -831,10 +832,10 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 		/*
 		 * This can happen when mappings are changed asynchronously, but
 		 * also synchronously if a COW is triggered by
-		 * gfn_to_pfn_prot().
+		 * kvm_faultin_pfn().
 		 */
 		spin_unlock(&kvm->mmu_lock);
-		kvm_release_pfn_clean(pfn);
+		kvm_release_page_unused(page);
 		if (retry_no > 100) {
 			retry_no = 0;
 			schedule();
@@ -900,10 +901,7 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 		++kvm->stat.pages;
 	kvm_set_pte(ptep, new_pte);
 
-	if (writeable)
-		kvm_set_pfn_dirty(pfn);
-	kvm_release_pfn_clean(pfn);
-
+	kvm_release_faultin_page(kvm, page, false, writeable);
 	spin_unlock(&kvm->mmu_lock);
 
 	if (prot_bits & _PAGE_DIRTY)
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
