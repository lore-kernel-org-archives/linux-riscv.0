Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1490DC001E0
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 02:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0jqqJIftXOhOZGIWrKVxPbfN24GEGkhMDy1/XfWDFCM=; b=H1y8pXr1KkvjeUfdwfO0CXbYrZ
	W6DNGF4xa/7JTx0blco1QqVi5Tm4nolHnlHOpaQbkvGJLqGF8yQkshkmgWx9vs4FXhtjP+PGNy2wO
	Tt9JpI087Dz9IniJwMphFcZGJ6taFYXN8TI1QsBf62c4AsTmxY7Yn58da7442+0VPpsI10XAQSlnV
	172AGXISpAoD59vUshFTdXpFihbbytK9KfD2i7vB48yOak1Lo0+tJRJc5KpAYk+ItPMVZeZkHaL+V
	VNrQh5RJdKeCxQGAadp73BmUhumtwDIL/jZ1TzAbsnjc8FfnUbp6wcjHYhLrIiquUXxZg+S7tA8hK
	B3/mDSlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2Hd-00FcM8-1J;
	Sat, 22 Jul 2023 02:23:49 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2Gt-00Fbvf-2A
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 02:23:09 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d052f49702dso1013776276.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 19:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689992583; x=1690597383;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E8R5tRLm4LxOnjTEGwM7a4ioC3VdBYtUr1OruyGFhsg=;
        b=cfBIBtaMGZEf4AhY6J0548A+CtaTY7s4VELnEIeFABxI92SvaWQW27WRnp+/q887jd
         b1TjIDORVqU07EPUQ/Q19Kx672JDaqfeiAMzany/gcKSRQRyhlDPKz73ZGnNHtbWJBcs
         UdVEkbrC7PTnQ3AO+JgNGaP9tE7X1Jr8LevbOQPisjvpV/1GUqvSezpBlGv+V1Pa8Bk/
         Dz7iMBvzxCmA92YdIR4l8vs0QhvpSPRaa9AWLGqWcLL0gam+6TRFZut+BKtU94QsycPh
         UUDfnGqhH3nalOxviTCBnCVfFkZB08T951R3KSDpXW/NULcZOSqnOMHnzE4x6FrSPe5l
         ug3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689992583; x=1690597383;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E8R5tRLm4LxOnjTEGwM7a4ioC3VdBYtUr1OruyGFhsg=;
        b=SbAXe5PuVGSxq/27OX+1XQcpU2Lar3Oa5D7Wv6sHnhB+qWsaytEZ1XfrbBLw2bkE09
         OoVN78imJqHGruXU7oNzdZ49ot/qj+pyl8bq17uAoK/t5o+O7b2ClZ1MZe615aXcytxR
         hnpnvW4gdjX6kmj7Ag2K5pnsOJ/EzZTt8HARav6gy8pDioFbebH1N8l9MVvT4IouiNdH
         PBvxB3caTmHu3mF8Y0oex55PknueYuf2OFXKF/NdecVnQQW4W7nfRI+I8yYFvooBz0+c
         pp1ZYeS7mt0FytmWzm498tbFywFR5Bo3x32xRFpNsBxlMIstPPu6BwA248bY5fi4tM0Y
         A+DA==
X-Gm-Message-State: ABy/qLYQnRP/qQvrO9RJTrrgf/A/drLhNAak5E+vnEVn/4jZLn3jPJcO
	Yw63fZHuB8DS6DeyPpaCcYF6yWYOkmR4
X-Google-Smtp-Source: APBJJlHQt1NDcPAocmh72u+0bhsq/dtXjKO55NUZwrSeo0TWR6BjgNiz1KwqJUxErtKe8+mwZ90j9gI+Kx9y
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6902:102f:b0:c22:38c2:43de with SMTP
 id x15-20020a056902102f00b00c2238c243demr26408ybt.11.1689992582937; Fri, 21
 Jul 2023 19:23:02 -0700 (PDT)
Date: Sat, 22 Jul 2023 02:22:47 +0000
In-Reply-To: <20230722022251.3446223-1-rananta@google.com>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230722022251.3446223-9-rananta@google.com>
Subject: [PATCH v7 08/12] KVM: arm64: Define kvm_tlb_flush_vmid_range()
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Anata <rananta@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Gavin Shan <gshan@redhat.com>, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_192303_744397_411FCFFC 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Implement the helper kvm_tlb_flush_vmid_range() that acts
as a wrapper for range-based TLB invalidations. For the
given VMID, use the range-based TLBI instructions to do
the job or fallback to invalidating all the TLB entries.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 10 ++++++++++
 arch/arm64/kvm/hyp/pgtable.c         | 20 ++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 8294a9a7e566..5e8b1ff07854 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -754,4 +754,14 @@ enum kvm_pgtable_prot kvm_pgtable_stage2_pte_prot(kvm_pte_t pte);
  *	   kvm_pgtable_prot format.
  */
 enum kvm_pgtable_prot kvm_pgtable_hyp_pte_prot(kvm_pte_t pte);
+
+/**
+ * kvm_tlb_flush_vmid_range() - Invalidate/flush a range of TLB entries
+ *
+ * @mmu:	Stage-2 KVM MMU struct
+ * @addr:	The base Intermediate physical address from which to invalidate
+ * @size:	Size of the range from the base to invalidate
+ */
+void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
+				phys_addr_t addr, size_t size);
 #endif	/* __ARM64_KVM_PGTABLE_H__ */
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index aa740a974e02..5d14d5d5819a 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -670,6 +670,26 @@ static bool stage2_has_fwb(struct kvm_pgtable *pgt)
 	return !(pgt->flags & KVM_PGTABLE_S2_NOFWB);
 }
 
+void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
+				phys_addr_t addr, size_t size)
+{
+	unsigned long pages, inval_pages;
+
+	if (!system_supports_tlb_range()) {
+		kvm_call_hyp(__kvm_tlb_flush_vmid, mmu);
+		return;
+	}
+
+	pages = size >> PAGE_SHIFT;
+	while (pages > 0) {
+		inval_pages = min(pages, MAX_TLBI_RANGE_PAGES);
+		kvm_call_hyp(__kvm_tlb_flush_vmid_range, mmu, addr, inval_pages);
+
+		addr += inval_pages << PAGE_SHIFT;
+		pages -= inval_pages;
+	}
+}
+
 #define KVM_S2_MEMATTR(pgt, attr) PAGE_S2_MEMATTR(attr, stage2_has_fwb(pgt))
 
 static int stage2_set_prot_attr(struct kvm_pgtable *pgt, enum kvm_pgtable_prot prot,
-- 
2.41.0.487.g6d72f3e995-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
