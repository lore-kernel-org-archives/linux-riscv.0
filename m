Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC7DC3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1oZSbZMbTIzmlpt1TXKFTi653dYEDd8p506AH/xoIpM=; b=gBCrJwRB5NPBUE
	KU1L3cuagBMIQYvoe6gwB18Ro8H00heEkL7kQMv8r+z3Zo+MqcAdW+qQd9DNI17t6Ho5nnzezAh/I
	ccFxcCCtAN/vYEt1mrPwx091dgeqBjCQ2DGc6f8wohwqimOZcQziYNJd+nZmZXY8Op6FJB782Hc13
	+khTDsYFYo9NZv+KUzmg/IAKSE8V6wXqMDYcaniq9RHZvPqPBtI78lnl37uW2FAjPpVOKYcu9WSis
	7oBD6dPLy3g+qJPuleCxrAKZ1V6HbKz8e2DeJOX5uV8CZIOfn21e3eyTVjBUMmcCck/ADa5I4gICh
	DrmRwuw9mLe+4uFcQ6Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVCz-00000005fLu-0WGz;
	Sat, 27 Jul 2024 00:22:49 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlc-00000005QgT-1heR
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:35 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-70ecd589debso373745b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038071; x=1722642871; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=caIg6eZHDZieCZ2y8TnIGsflH+xvFOT1i8qMSVM8X2U=;
        b=L6Vh7A+BONb2dq+by+MhTfWBD5KMq4ZcbNgL1qRWH/8nRuuhZk7mFKHCjuL6pdpIg7
         UKTcSULbYwg294JRCwDcMDw3Wt4T7qawJZCJ2ZJVqkow//bFaAud1wxv3eBCvLpy/rSc
         tbLPJWPHv8CYL/6r2LMX6xKCS+NG+QF+UbYp4OeJUHuGIrYIvii2PcYtuYmv8dH0hA8u
         HYf2YWdrPREUt61XQyEnKLmWcnqnHG8b8nqGnRJHuK56INLZ3TaOMCMlPE2cGEpZqO98
         p4S8C7J4UYrMM+AhNyRrTll8edZIKnIdnnTvYSWIrfqiJ1sZ1zlE4q7X5gj+oPceBGlg
         HWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038071; x=1722642871;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caIg6eZHDZieCZ2y8TnIGsflH+xvFOT1i8qMSVM8X2U=;
        b=A6zLStNObw0x4/3Z5ZqmWvVRhjf4hDvQAqWEwARHcUOlND7WybJrEjL5gq4GXjeHOH
         jdp+LP4LqlXKhIReL13+Rn2X4imllVYLPxi2jLgjTro/zJppf5M9sHHAdJGbgf3pMD9t
         JobN2gz5U/IR1XjIzuZS1ksL2dS4S/K+1bHUTCQYsLhHzhcqsx1vQNTRG/UH+I2FszvN
         S/BOmDShcBoShOXUN0x53AhxqSCQ9QJgcRO1DbzMXxfGWp8xxYmZHzO7yBZ/mf/pbcv5
         ifH0C/wmDvWhftOVGhdYPfozlRcC8iroODd/+QGgiktyVcW8rxN6syOMlBw4IMmrXqoU
         fIYw==
X-Forwarded-Encrypted: i=1; AJvYcCUQEItE6Jhzsx3Cl1bVaL1F4aESphRFc8X881+dP7+mTp+9NqD1uVPVuMcxegOoRGJtyqj5vjt1KCml66+BNemFOUWdBmx6f1u+YC0tQbtw
X-Gm-Message-State: AOJu0YwC9+VR7n+vFtlX9avZX/DdlVGoV0k2rySiBzwscM6pfhKTVRkh
	6UtzLvWxT8D5Yg3aXxgIwOGfR1SLJ0x70oVjsJ1bqHcTo243gwLikpnTzl3lCVI0O34cvPVfgPG
	SyQ==
X-Google-Smtp-Source: AGHT+IFCpL56eroYNOyLiVhUcT5fyuFzA98b59p62FwWY/A7pZmePwqTF4FXfEto2ywMz9XC9lExu2Xr4CM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:9445:b0:706:3421:740d with SMTP id
 d2e1a72fcca58-70ece9ecf02mr25759b3a.1.1722038071004; Fri, 26 Jul 2024
 16:54:31 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:04 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-56-seanjc@google.com>
Subject: [PATCH v12 55/84] KVM: arm64: Use __kvm_faultin_pfn() to handle
 memory aborts
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
X-CRM114-CacheID: sfid-20240726_165432_634951_E859CD40 
X-CRM114-Status: GOOD (  12.58  )
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

Convert arm64 to use __kvm_faultin_pfn()+kvm_release_faultin_page().
Three down, six to go.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index ce13c3d884d5..756fc856ab44 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1439,6 +1439,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	long vma_pagesize, fault_granule;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
+	struct page *page;
 
 	if (fault_is_perm)
 		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
@@ -1553,7 +1554,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 
 	/*
 	 * Read mmu_invalidate_seq so that KVM can detect if the results of
-	 * vma_lookup() or __gfn_to_pfn_memslot() become stale prior to
+	 * vma_lookup() or __kvm_faultin_pfn() become stale prior to
 	 * acquiring kvm->mmu_lock.
 	 *
 	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
@@ -1562,8 +1563,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
 
-	pfn = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-				   write_fault, &writable);
+	pfn = __kvm_faultin_pfn(memslot, gfn, write_fault ? FOLL_WRITE : 0,
+				&writable, &page);
 	if (pfn == KVM_PFN_ERR_HWPOISON) {
 		kvm_send_hwpoison_signal(hva, vma_shift);
 		return 0;
@@ -1576,7 +1577,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		 * If the page was identified as device early by looking at
 		 * the VMA flags, vma_pagesize is already representing the
 		 * largest quantity we can map.  If instead it was mapped
-		 * via gfn_to_pfn_prot(), vma_pagesize is set to PAGE_SIZE
+		 * via __kvm_faultin_pfn(), vma_pagesize is set to PAGE_SIZE
 		 * and must not be upgraded.
 		 *
 		 * In both cases, we don't let transparent_hugepage_adjust()
@@ -1685,11 +1686,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	}
 
 out_unlock:
-	if (writable && !ret)
-		kvm_set_pfn_dirty(pfn);
-	else
-		kvm_release_pfn_clean(pfn);
-
+	kvm_release_faultin_page(kvm, page, !!ret, writable);
 	read_unlock(&kvm->mmu_lock);
 
 	/* Mark the page dirty only if the fault is handled successfully */
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
