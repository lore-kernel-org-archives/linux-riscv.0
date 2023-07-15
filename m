Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01305C0015E
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 00:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RkajKByo6HNb7iroJ+Z0/yF/mZKRsJ4YQt0Jhd9MeC4=; b=w8MvCMaiDT5OWA7oMDFHP2gOL7
	DIWV0NN3HI2dse7lnEyOHFrmsBJJk2xeGKRxBT6xh2gJg7gYHw9+3LNHobVNjyw80NPyDulunJyPu
	zBRIqLiKDMxVTSugQOtEQ/3q4rRPRhM66m625jYss/zA7nlPW0AJFq4FFGc2aaLKGsavaRVgSqRT1
	hkvjriYh8bohHQGCJ44IAzQ2jhMUqEsPt2PjXSbw+DAYzivXS45EUx/bzHESFMNkG7YE2ASwwRO3j
	LgVc1LwB9MAXWGUNX9XfizxRBjpevPKGwU6HXqySb9dw/MVizuu+lMHrTildn8FrViPhE6hG1j+2O
	Fi2IrnfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKTZ6-007awt-1S;
	Sat, 15 Jul 2023 00:55:16 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKTYG-007aIS-03
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 00:54:28 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-c5cea5773e8so2088861276.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 17:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689382462; x=1689987262;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wUK72LErj/cW/DTmM0D0+KH5bgl9rti1KYfAR7QuG/E=;
        b=sshR00+aAtBOwWYiCZGAYpO4fnVVTo5dI2raRcizF4Tm6lh+XV/lYXfBQd4dBrS+qm
         i9fl23qrXjR5kHI3koSQi2N0fvB1mruZ7myfnUZdtau2iBmAY25ul9EC/XtB0oyjhP+j
         DPSRaMZQvinCY+Tx+9uroryxalSjGSfC6ZTutGuMfsHVSZXDnWp3lgux9oekKpiJWkDd
         LnpF26hYxlw4oSLziHYFF2uWUIJeHfOhfTzx5I6iySyI2QIpX/VckMtq2Y1BylDNSPF6
         bZiFVMVdblBlMiDEWAav1nw/+iNW2eGy7WyE50JOnaa7KlDcyD+Jv7AkWo7c1CCRY5dH
         jolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689382462; x=1689987262;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUK72LErj/cW/DTmM0D0+KH5bgl9rti1KYfAR7QuG/E=;
        b=BD10hyeH4uZnzmRv1VQa+P7guGr07nzWuH8UMSCsE0o4tkD+pGLd/Or/k8GY0GBuQ3
         RULaWIvIfcUzOCBCRChA8F4hKIr46JwO7DTdOy3gZs+jDNRzq73HA8qsujjKsVlP1XB5
         9ALLdzb5sVntkAqZiwuiauY4l06IbUQkmizb0iCl7XDAYomFfonpsR5dx4hSzNH58Sx9
         kq6cyf05OTl6nnnfp4tRyVh9so+l68tWCkyqJ/gOmzmG4IqLsVspYK7/y99KtayTWRSi
         uhIJGjTo5HzQDdvks/2/ONrWt9NbsVCNbLbmHILen4HanqwrFqY0c5HTuGZfWd5AmYBp
         zwEA==
X-Gm-Message-State: ABy/qLbMAUczpZlQRP1/7ZD4Cc3gbPphAs/G3CO37aUzHfytSGLFLsJ/
	2ce95LBiAfk7ZkIvin+4470Wqr27LVEg
X-Google-Smtp-Source: APBJJlE0qITDo/wAXwRSd8iXWERdmKc71Dhpe2SjiRxhIc+LHhnKc3gfGxQ/Ra7EcVIhEZwkmD1LWTU7Ye9M
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a25:32c2:0:b0:c62:5700:6520 with SMTP id
 y185-20020a2532c2000000b00c6257006520mr34849yby.3.1689382462727; Fri, 14 Jul
 2023 17:54:22 -0700 (PDT)
Date: Sat, 15 Jul 2023 00:54:05 +0000
In-Reply-To: <20230715005405.3689586-1-rananta@google.com>
Mime-Version: 1.0
References: <20230715005405.3689586-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.455.g037347b96a-goog
Message-ID: <20230715005405.3689586-12-rananta@google.com>
Subject: [PATCH v6 11/11] KVM: arm64: Use TLBI range-based intructions for unmap
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
X-CRM114-CacheID: sfid-20230714_175424_086953_D5A93617 
X-CRM114-Status: GOOD (  17.19  )
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

The current implementation of the stage-2 unmap walker traverses
the given range and, as a part of break-before-make, performs
TLB invalidations with a DSB for every PTE. A multitude of this
combination could cause a performance bottleneck on some systems.

Hence, if the system supports FEAT_TLBIRANGE, defer the TLB
invalidations until the entire walk is finished, and then
use range-based instructions to invalidate the TLBs in one go.
Condition deferred TLB invalidation on the system supporting FWB,
as the optimization is entirely pointless when the unmap walker
needs to perform CMOs.

Rename stage2_put_pte() to stage2_unmap_put_pte() as the function
now serves the stage-2 unmap walker specifically, rather than
acting generic.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 67 +++++++++++++++++++++++++++++++-----
 1 file changed, 58 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 5ef098af1736..cf88933a2ea0 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -831,16 +831,54 @@ static void stage2_make_pte(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t n
 	smp_store_release(ctx->ptep, new);
 }
 
-static void stage2_put_pte(const struct kvm_pgtable_visit_ctx *ctx, struct kvm_s2_mmu *mmu,
-			   struct kvm_pgtable_mm_ops *mm_ops)
+struct stage2_unmap_data {
+	struct kvm_pgtable *pgt;
+	bool defer_tlb_flush_init;
+};
+
+static bool __stage2_unmap_defer_tlb_flush(struct kvm_pgtable *pgt)
+{
+	/*
+	 * If FEAT_TLBIRANGE is implemented, defer the individual
+	 * TLB invalidations until the entire walk is finished, and
+	 * then use the range-based TLBI instructions to do the
+	 * invalidations. Condition deferred TLB invalidation on the
+	 * system supporting FWB, as the optimization is entirely
+	 * pointless when the unmap walker needs to perform CMOs.
+	 */
+	return system_supports_tlb_range() && stage2_has_fwb(pgt);
+}
+
+static bool stage2_unmap_defer_tlb_flush(struct stage2_unmap_data *unmap_data)
+{
+	bool defer_tlb_flush = __stage2_unmap_defer_tlb_flush(unmap_data->pgt);
+
+	/*
+	 * Since __stage2_unmap_defer_tlb_flush() is based on alternative
+	 * patching and the TLBIs' operations behavior depend on this,
+	 * track if there's any change in the state during the unmap sequence.
+	 */
+	WARN_ON(unmap_data->defer_tlb_flush_init != defer_tlb_flush);
+	return defer_tlb_flush;
+}
+
+static void stage2_unmap_put_pte(const struct kvm_pgtable_visit_ctx *ctx,
+				struct kvm_s2_mmu *mmu,
+				struct kvm_pgtable_mm_ops *mm_ops)
 {
+	struct stage2_unmap_data *unmap_data = ctx->arg;
+
 	/*
-	 * Clear the existing PTE, and perform break-before-make with
-	 * TLB maintenance if it was valid.
+	 * Clear the existing PTE, and perform break-before-make if it was
+	 * valid. Depending on the system support, the TLB maintenance for
+	 * the same can be deferred until the entire unmap is completed.
 	 */
 	if (kvm_pte_valid(ctx->old)) {
 		kvm_clear_pte(ctx->ptep);
-		kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu, ctx->addr, ctx->level);
+
+		if (!stage2_unmap_defer_tlb_flush(unmap_data))
+			kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu,
+					ctx->addr, ctx->level);
 	}
 
 	mm_ops->put_page(ctx->ptep);
@@ -1070,7 +1108,8 @@ int kvm_pgtable_stage2_set_owner(struct kvm_pgtable *pgt, u64 addr, u64 size,
 static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 			       enum kvm_pgtable_walk_flags visit)
 {
-	struct kvm_pgtable *pgt = ctx->arg;
+	struct stage2_unmap_data *unmap_data = ctx->arg;
+	struct kvm_pgtable *pgt = unmap_data->pgt;
 	struct kvm_s2_mmu *mmu = pgt->mmu;
 	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
 	kvm_pte_t *childp = NULL;
@@ -1098,7 +1137,7 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	 * block entry and rely on the remaining portions being faulted
 	 * back lazily.
 	 */
-	stage2_put_pte(ctx, mmu, mm_ops);
+	stage2_unmap_put_pte(ctx, mmu, mm_ops);
 
 	if (need_flush && mm_ops->dcache_clean_inval_poc)
 		mm_ops->dcache_clean_inval_poc(kvm_pte_follow(ctx->old, mm_ops),
@@ -1112,13 +1151,23 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 
 int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
+	int ret;
+	struct stage2_unmap_data unmap_data = {
+		.pgt = pgt,
+		.defer_tlb_flush_init = __stage2_unmap_defer_tlb_flush(pgt),
+	};
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_unmap_walker,
-		.arg	= pgt,
+		.arg	= &unmap_data,
 		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABLE_POST,
 	};
 
-	return kvm_pgtable_walk(pgt, addr, size, &walker);
+	ret = kvm_pgtable_walk(pgt, addr, size, &walker);
+	if (stage2_unmap_defer_tlb_flush(&unmap_data))
+		/* Perform the deferred TLB invalidations */
+		kvm_tlb_flush_vmid_range(pgt->mmu, addr, size);
+
+	return ret;
 }
 
 struct stage2_attr_data {
-- 
2.41.0.455.g037347b96a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
