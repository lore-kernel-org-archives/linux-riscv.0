Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59406EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 17:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=a2s/2duPwruD1RZwAnW7JTcZDNoSPKnl6t9PZhPnGsc=; b=LboRC8dwfX1ES68CYnNvt55ufI
	8jBe+reCvRWR5Ea/zc+ISbzrZBZ/lnhlGGIK6vzuQwgSM5YvkRwreWUYZw2VEiyJHKF7hO/D4T4zs
	sTBPClExIWSnvuPpFyKhAE68JaDPjMmI6jfwVkonThU0gvrSgDz/3PDkGD7dZcLFYYsP94fbDw8AB
	m1A+iAeCJq1rvvhnraPj05dIimkzWBtQVIQsF3o2yrSldUoaMfzo/sGM0wY1+YB1guUiRnmD+yA1C
	aoFoOcCLcHR87xbyJyeChBFBNSt5YW7T03pzqVaxc4mWMDLs8uC6DxCbVrA31ZpEqLePl1egKcx+Q
	YPzI5ONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC1yn-00FHQH-2f;
	Wed, 21 Jun 2023 17:50:53 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC1yQ-00FH3D-0b
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 17:50:34 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-ba81b37d9d2so6654487276.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 10:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687369828; x=1689961828;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j157PG4NSYE82v2fAItKFhVfRcmmpeiCHUTGpM3SOrs=;
        b=Gl6wq+mEywBMdam4XfA6Jx3xs02PqlG2630KExwZ+IZ1eaEu2M8C4gqV/l7wcdwgF3
         /D1SpZQ0iJjXckKesr45c+8QYgxKeaJkXk4CzLhdqEna8C9zX/I5d6oFGpNmP8iq6sY5
         AD2tneZCrgHa95MtCXOU6/zAbzMhBOWLtGo2xx45SVnmLsd1KeV2yL43QUWZzbPYsRE5
         0KFNo+sYozd7eoDI93xm/37wexRwY8LUWph38U1kdZ/ZPiRwyt7W5rsyP0dZypbTXy1d
         v4IZ0o/cb4ZauS58uWHhZOddMD4erO5Pva1AdW/HnuLgUZTI3rDNpeArz5G2OY0RmC2L
         7aKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687369828; x=1689961828;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j157PG4NSYE82v2fAItKFhVfRcmmpeiCHUTGpM3SOrs=;
        b=lp6aBk1k+10V2luZf/tjcO/1i3/Qr0tn4CiS4FKTInBImE1IPJ/GuEPvuw3kVp7tnH
         yxYrIqwgvhpjDfC/gir6tSTdkWPvVQBGC2VnITpJic4fUIwKxgJj9fcDmZ/mN23VDDie
         lj9ztDgcM8bkl6/QqEaoJCmQF8TZ7zwyBP0eV3DaJkbQKq1pK+pYEgFlIBGhEWB1PNin
         FcKlxNLC7ht1VykfTBm73LcHAwVOekDfQm/Zw151EWDrGOGQL2DRznt0b3qvkfuO50hR
         u6qHTzL0aFOrMQHSVwG4d2+yNSizU5VzOnww9s82YjaixbnKXc703W/dmljgJCHRysv3
         p6rA==
X-Gm-Message-State: AC+VfDw/xuTJx79BFWFEuRQKj8wo3pYp1ujiCqwAGjVcPbQYjpdT7FrG
	pz5hzYoCffEKkMOR7/QiwoVp3NcUKNfH
X-Google-Smtp-Source: ACHHUZ6Ys0yNXltl/QNiOKpOLzit3oOUcal/03jYF6PfCeI/5MRSrcuUGPtaAxFV3KRRmbIadAvYp5jsj7ao
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a25:74c9:0:b0:ba8:4ff5:3217 with SMTP id
 p192-20020a2574c9000000b00ba84ff53217mr2202294ybc.3.1687369828056; Wed, 21
 Jun 2023 10:50:28 -0700 (PDT)
Date: Wed, 21 Jun 2023 17:49:58 +0000
In-Reply-To: <20230621175002.2832640-1-rananta@google.com>
Mime-Version: 1.0
References: <20230621175002.2832640-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230621175002.2832640-8-rananta@google.com>
Subject: [RESEND PATCH v5 07/11] KVM: arm64: Define kvm_tlb_flush_vmid_range()
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Raghavendra Rao Anata <rananta@google.com>, David Matlack <dmatlack@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_105030_269616_A182B354 
X-CRM114-Status: UNSURE (   9.37  )
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
---
 arch/arm64/include/asm/kvm_pgtable.h | 10 ++++++++++
 arch/arm64/kvm/hyp/pgtable.c         | 20 ++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 4cd6762bda805..1b12295a83595 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -682,4 +682,14 @@ enum kvm_pgtable_prot kvm_pgtable_stage2_pte_prot(kvm_pte_t pte);
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
index 3d61bd3e591d2..df8ac14d9d3d4 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -631,6 +631,26 @@ static bool stage2_has_fwb(struct kvm_pgtable *pgt)
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
2.41.0.162.gfafddb0af9-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
