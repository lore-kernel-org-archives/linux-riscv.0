Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECF6C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWSsi3dWa0kE1ip70XgvooukqC2zlkUjF3ZYCORPdsY=; b=FTgV06wF67KTf7
	CE7T5NXGcIz7u3gmRMCeQGFAOesZYwCD3s2vYVYfWQQo1bafcU+x9Fbi6SNaVcB4qCl919SXjy9pW
	bBMLtqvY29nnp+INSJmw/uDC++LsQ1NAOMl6YFHItdFlcb8OYPlYrLk0lVbjDb/QRVIrs4Qi3SRku
	96vATgMz9haSHL62xBGK/M/M6biCb0ex/xg7VY8bM4hYWYhYCAoaDsf8ildofv+Y3hVDh1KDxmnZH
	VsXlUNHyp0gAtUExF3oubUyRs0Fwt3eOHqPl6Dp0R7WkuAtJHD7dU1AVL+jSYI70lRAdaj3eNggf3
	LTZNC0RChLaNJKKWnDDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVHL-00000005hOJ-1K4A;
	Sat, 27 Jul 2024 00:27:19 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUly-00000005Qx5-1An3
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:57 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fc5f04f356so10598435ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038093; x=1722642893; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=rpwXsNxFJqP0CEr/yEQ2h0r+lN6KBTuvETCSKMoe8FQ=;
        b=zGcKry2mcen4CZCTkukKs+Nhk9bKhk+SJbteeryNgOFo0gyHXiHTxSTM6ZutJQX8a+
         wbkVzTV6013wnb3qCfljUXVSo0MGKnJBug97IFf/qIuj73/edTdpt6XyQK1pVuVNruu7
         vFaMY7lXdOF4zgtKGrBhlCqbkRZgS7+oaE0KY3dqNZAmWcI68rz0tyWjGh1GLzdVTET8
         0d2gW0Eb6+CDTyD9FqMIGZqCH5pa5BdjnJqtkG9mt9R9706NgU2BqS0QopRpEEykp+Wa
         T7IuV5H6inMrQLUD+mR/v7iRJ+WZrtb0y8QEznkeIzIu5jfH8V1mcdIXbvmRqx0fTQ78
         51eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038093; x=1722642893;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpwXsNxFJqP0CEr/yEQ2h0r+lN6KBTuvETCSKMoe8FQ=;
        b=axFPPnUo6WmSt8hJmP25tfz3TfycDMUv0RiY+qQf2yqF4rD1oqsbYRGjkTWfk1Esg/
         i00AhE98XdH3awgkqFQGcspx1XLi07PZ59FLT1LcdPoHqEpzNu8RrwJFbu3tKdnRmvtE
         pJC4swOpKdz8xcPqwxMD3g8v8q/cA0JX+1tMGiXhOar89uwj8BRjqADRZQ8ArrJJ6wrb
         hdBDAfRGleVPjNqt2qs8q4lFdKIifFwWkggawr9KaZEj60NPpihEBuHgg2p2JmvfZzhb
         h3dl8pYGlucXkx+Aohxvp8kyPH83DpvN31I2G4FzjQYu6Ckg8Wl/wudS0dUC+EIGiEcY
         DxNA==
X-Forwarded-Encrypted: i=1; AJvYcCUKaYoWxZIfzMYmw1cex9QHXR+NP4nsTD0qpaoTDAeGHbsN50LsRXXKxmBsPnTrMv+RUp5V1luZP5Lduw/vU+Wn7dP/vt3WiGp242nQbxc9
X-Gm-Message-State: AOJu0YwT9pkDpqBUzx8tbMC/EDhyadAnysImy8Rol9s1I7kQutSmZH13
	G1KVTsPIrIC12HFk06MhE7VS6PVlX2vfcAfb9+o1+uQeVsQ/AilskTTo3/NDJCBPr4jyY6lfZxm
	U4Q==
X-Google-Smtp-Source: AGHT+IEz1qMb/9xSOR6pziERGmR6RlcO2d1FpOxR3ZCse98fOqCGJ5ia3ZBUMMNkI3e0ioyh2oD8FsbOxx8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2341:b0:1fd:63d7:5d34 with SMTP id
 d9443c01a7336-1ff04803eeamr27405ad.5.1722038092373; Fri, 26 Jul 2024 16:54:52
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:14 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-66-seanjc@google.com>
Subject: [PATCH v12 65/84] KVM: LoongArch: Mark "struct page" pfns accessed
 only in "slow" page fault path
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
X-CRM114-CacheID: sfid-20240726_165455_363681_E1D23393 
X-CRM114-Status: GOOD (  12.16  )
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

Mark pages accessed only in the slow path, before dropping mmu_lock when
faulting in guest memory so that LoongArch can convert to
kvm_release_faultin_page() without tripping its lockdep assertion on
mmu_lock being held.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 364dd35e0557..52b5c16cf250 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -552,12 +552,10 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 {
 	int ret = 0;
-	kvm_pfn_t pfn = 0;
 	kvm_pte_t *ptep, changed, new;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_memory_slot *slot;
-	struct page *page;
 
 	spin_lock(&kvm->mmu_lock);
 
@@ -570,8 +568,6 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 
 	/* Track access to pages marked old */
 	new = kvm_pte_mkyoung(*ptep);
-	/* call kvm_set_pfn_accessed() after unlock */
-
 	if (write && !kvm_pte_dirty(new)) {
 		if (!kvm_pte_write(new)) {
 			ret = -EFAULT;
@@ -595,23 +591,11 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 	}
 
 	changed = new ^ (*ptep);
-	if (changed) {
+	if (changed)
 		kvm_set_pte(ptep, new);
-		pfn = kvm_pte_pfn(new);
-		page = kvm_pfn_to_refcounted_page(pfn);
-		if (page)
-			get_page(page);
-	}
+
 	spin_unlock(&kvm->mmu_lock);
 
-	if (changed) {
-		if (kvm_pte_young(changed))
-			kvm_set_pfn_accessed(pfn);
-
-		if (page)
-			put_page(page);
-	}
-
 	if (kvm_pte_dirty(changed))
 		mark_page_dirty(kvm, gfn);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
