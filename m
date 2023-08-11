Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A30C001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 04:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lfM8E1z/HOcm5F3hharerqBh7pZQfzNgIqhlIFmI/0k=; b=jdjgo/deuCZMBlGAdsh3vg/TXw
	8+RwOm03jr+F2oxPh3RH8D8LhvJ1/WrV3VUesFjTg5iappsMmvszJiPlyjpkxL/LGCf1d7uuRywR+
	ORSQ6zzSCDjXt8/AesyHrOaAlO5kSNbtXmBvu8Sv1TMBJG2n982hDq6qyt14SsGRr8PlSpQN4JCvB
	oJrGUEGoHgRwUfv7i92KZabCIKx6pdkIw14L/vYdl1HOOS3Ih7Rfl6Q6CrRLuXu9Edy6Cuua/0QZ3
	qMR/cK7RTZJ6GhBXryUuxDt10xjvy3cUujd+g2UXcSvjZCAKEnq0FNAh2zdLQyTiSZ2A4Kb2cWj8d
	oZmRRG/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUK9A-009QoF-1p;
	Fri, 11 Aug 2023 04:53:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUK80-009Pl5-16
	for linux-riscv@bombadil.infradead.org;
	Fri, 11 Aug 2023 04:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=G001bKqgoFEW2hLjB7/836JCEIDwO1wziDEr7SkyYCE=; b=jt4myudSgoyWrKvwh9QQFCgKXU
	VjmpBdwhUt6gu2u9OhHh+8tH28KeCx1Hm0XYivuC0//xEj8h0rXNM46wm2w//19ChevGS3xyVuR/4
	BuK3upVYnOmG91RrWzy53768eaU9QGLuYD/22dw0OMqWokTRVPAycYvlq5aOSm/2TIozj+jrQWa/T
	I+5kcC6ycGvM3tDkT/rRftZn4o4Lp6ST1+KHZouaYEVIQedVGd0C+7tNqC2kKxi0CFgQtPeYdtP8F
	OostgwUJMo9KnffkozH3l9jroElsiZs8DCfaP2FQy6pyiwD16Yus9pgo5IQSqE32F5OZAU+3a8Ukv
	82a3iTLg==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUK7t-007HYZ-2w
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 04:51:59 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d0d27cd9db9so3197971276.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 21:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691729510; x=1692334310;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=G001bKqgoFEW2hLjB7/836JCEIDwO1wziDEr7SkyYCE=;
        b=W3WTn+szTpGRYJ4Nrsk4rxOWrftcekNscs22xwqlhuJB93Ar0BfqRGdEWyk/Q+jqhP
         ri5qHyFNgBLpKKH06LH+HsWb1MpZhFmzfXxeF/ORAT07Zun/zgnJLSX6I3leqAoY8QXR
         Cn/et64Ad2ndHQvQUM0T7mioUm2x1aprIMcTE/Orm1a2GcZucR8dO9nfLrJGDH4DDtBH
         Zqv+GVr8tvgyxrI1x+huGGPPptiOeQdCMsGwnp+KGtkceCK4aB9KNjMvLKxJMtaqApLO
         0pB9A/SZQYJ4zNbgL0iGKFGckcIBEfW0AiexbMyF7GNuqQ22QUyKuY/29OVGxcSI10vu
         hGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691729510; x=1692334310;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G001bKqgoFEW2hLjB7/836JCEIDwO1wziDEr7SkyYCE=;
        b=YoWnD0/DkX/LvBOLYFc5xkurN7JELLKUFL+PPSSnZN7b6ZP90XINUzt5nqsHFhcQkl
         DwQWLeRXJ+pWLWZhHJEsvQ+hwC2zKGIWkpHnX2O7vN10F1Vz4RfxWiWltvu/RrINwyUr
         +fbV1asINMZfm4VC7O0PXeWNjmzWDurTbkusemlyLVSGktE7c7eE9VeOwuLZu4AO5P0P
         1zslT2cARpM3EN8sURHEapBK3CtYjS5Cyuj9unhvCQKZFIw7qyzyfB90Ad+sG2HkWq4M
         AaKsNpSQ1PCHgbOndEaBtgQu3WuJma+AunmW22oeuYTazk46eB2UBKwgqovgr5VwFNDX
         6c3w==
X-Gm-Message-State: AOJu0YxYH5qdWkCAchiPhI5xEKF5KqJmEQVGsx+G+CaNc/RKP0YY39xb
	DclIq+UBn5XSUiGVrCox4BRyV/lIKp0+
X-Google-Smtp-Source: AGHT+IGp8zLlvGKgsKPT+euh9i0KtpqBPibbJyYiSM4xY/zJavK9m1k0FyNfqcnUQJamiQjlUlH81wBUvAac
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6902:91b:b0:d15:53b5:509f with SMTP id
 bu27-20020a056902091b00b00d1553b5509fmr80327ybb.2.1691729510277; Thu, 10 Aug
 2023 21:51:50 -0700 (PDT)
Date: Fri, 11 Aug 2023 04:51:27 +0000
In-Reply-To: <20230811045127.3308641-1-rananta@google.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230811045127.3308641-15-rananta@google.com>
Subject: [PATCH v9 14/14] KVM: arm64: Use TLBI range-based instructions for unmap
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Anata <rananta@google.com>, 
	David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_055154_034957_CBEAE351 
X-CRM114-Status: GOOD (  14.87  )
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
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 40 +++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 5ef098af17362..eaaae76481fa9 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -831,16 +831,36 @@ static void stage2_make_pte(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t n
 	smp_store_release(ctx->ptep, new);
 }
 
-static void stage2_put_pte(const struct kvm_pgtable_visit_ctx *ctx, struct kvm_s2_mmu *mmu,
-			   struct kvm_pgtable_mm_ops *mm_ops)
+static bool stage2_unmap_defer_tlb_flush(struct kvm_pgtable *pgt)
 {
 	/*
-	 * Clear the existing PTE, and perform break-before-make with
-	 * TLB maintenance if it was valid.
+	 * If FEAT_TLBIRANGE is implemented, defer the individual
+	 * TLB invalidations until the entire walk is finished, and
+	 * then use the range-based TLBI instructions to do the
+	 * invalidations. Condition deferred TLB invalidation on the
+	 * system supporting FWB as the optimization is entirely
+	 * pointless when the unmap walker needs to perform CMOs.
+	 */
+	return system_supports_tlb_range() && stage2_has_fwb(pgt);
+}
+
+static void stage2_unmap_put_pte(const struct kvm_pgtable_visit_ctx *ctx,
+				struct kvm_s2_mmu *mmu,
+				struct kvm_pgtable_mm_ops *mm_ops)
+{
+	struct kvm_pgtable *pgt = ctx->arg;
+
+	/*
+	 * Clear the existing PTE, and perform break-before-make if it was
+	 * valid. Depending on the system support, defer the TLB maintenance
+	 * for the same until the entire unmap walk is completed.
 	 */
 	if (kvm_pte_valid(ctx->old)) {
 		kvm_clear_pte(ctx->ptep);
-		kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu, ctx->addr, ctx->level);
+
+		if (!stage2_unmap_defer_tlb_flush(pgt))
+			kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu,
+					ctx->addr, ctx->level);
 	}
 
 	mm_ops->put_page(ctx->ptep);
@@ -1098,7 +1118,7 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	 * block entry and rely on the remaining portions being faulted
 	 * back lazily.
 	 */
-	stage2_put_pte(ctx, mmu, mm_ops);
+	stage2_unmap_put_pte(ctx, mmu, mm_ops);
 
 	if (need_flush && mm_ops->dcache_clean_inval_poc)
 		mm_ops->dcache_clean_inval_poc(kvm_pte_follow(ctx->old, mm_ops),
@@ -1112,13 +1132,19 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 
 int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
+	int ret;
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_unmap_walker,
 		.arg	= pgt,
 		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABLE_POST,
 	};
 
-	return kvm_pgtable_walk(pgt, addr, size, &walker);
+	ret = kvm_pgtable_walk(pgt, addr, size, &walker);
+	if (stage2_unmap_defer_tlb_flush(pgt))
+		/* Perform the deferred TLB invalidations */
+		kvm_tlb_flush_vmid_range(pgt->mmu, addr, size);
+
+	return ret;
 }
 
 struct stage2_attr_data {
-- 
2.41.0.640.ga95def55d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
