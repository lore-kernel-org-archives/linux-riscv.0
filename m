Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D4BC0015E
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 02:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1bRi1EAVRghmJofJp0qulHlGKTqSJaP3xRR4vpiULyM=; b=zBJ/atda2U/sk4R1YOPdrl34XB
	uP2t2LQlKCsCMyV4lxS01LSB+PwEQqJtu5VHak3AHrSLwHEvwoVnW46dwZ8oiHAa3lLEW0Mdht9n4
	QLGyOSS9Hc7aygO670Ij6J+hqu1w05kIzt4TasCRceNXCZ/egLUNAibT5B+3+OPLTd7cyt/gWhUha
	h+rgjSQbJY1WWTJa1ibKslZiP/4dcPTO3lXlZPeoTz0rXknr0XjAjJSqaT30xnNd0iLyKA6Qz8HXl
	Yuwr7YXUt/9HqgJsB6GEOAK1v/WgR1IQv/V5rNR3mrw1tfSF+R2g7iExqyr92tV+Jcsux8muL03rL
	tBPbeFUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2IG-00FcwC-1a;
	Sat, 22 Jul 2023 02:24:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2HJ-00FcBr-22
	for linux-riscv@bombadil.infradead.org;
	Sat, 22 Jul 2023 02:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CAxgFYrkZ9qbsDUo1uJQpSTW39yNyw7CK8s0M5hY5O0=; b=Qa73S8rQCJOaXyNd4LTFdfGvXt
	1pFkAk4lYOMFnPqHlRTfg8/wNjXiICuK2ihZ9BjxGVQOzttwyupJQ4Gy4/2pUemU2iz5MTXH8+OdF
	S7Im0xIxk6hEezIxoLK16XQiBfyjOW/QhrqhVMV/DG/r/aWyNKhEZ7bv5r+v7A77NtJ9zELKwGcTS
	blbthWBZrthwXJ+o8LHDJNSCgob735f6pzOfwbkpH5TAfTmI7X3aOuwntMwiRxWpIFom4Y1Eks+Y8
	P8tz9SlrHRJhfGwmfcn06hd8aU5QfeXchyKYC5K4fTZ+E46/smjqzQPUu5WxqLzH12Jmv8vIOPR0G
	m8RfpKJQ==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2Gy-000IRE-26
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 02:23:28 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c4f27858e4eso2924315276.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 19:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689992587; x=1690597387;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CAxgFYrkZ9qbsDUo1uJQpSTW39yNyw7CK8s0M5hY5O0=;
        b=3iFGmjsCWI0cSr6R+O6VEjCyfW9zvlMHhWJhG+l839P3FsYO4gL1EVp1Zvl8J5KBZm
         gWDHLZwbR5T/RsdaSMNr+PWsaXoHdcJclYOVj00Ryvz0JXZ4BYS8/+hx3pK8yUTJJeTo
         a5/Y/WZRJ+Cpgl2754cfdsBfDPMsEJuS4tz3ZfnIVNX/gGU28fvxGMohv8fTo1VivHM+
         k5v3mRdaKw/ow8ksLRSjR5aq5SfbYF/x22thzHDkHXkkUesujuRvwYduBTk7tl7yPQ2N
         TmTvFyIwsFPUtv4YYKm+MwQFY8Nm7KPPVkWXEVgsNp0Pql6llfmedndioi5rKnBNAGiA
         xZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689992587; x=1690597387;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CAxgFYrkZ9qbsDUo1uJQpSTW39yNyw7CK8s0M5hY5O0=;
        b=g5iFf/TEqkNInw9lOqcaWtL9r0JCeBBmVh/qXY9BTI2X+kCc3ACVP5Dfrnbt0UrbiV
         ix8f93jgYW9mDPIGHu0AFiHkArakXV5mlfo9HGknMa5/GUSIruqJ+D6y2nKx50ci8kD+
         Ln6qJQfyZUrFZm/laoe6ET8084MI3D5ndpN/xa70aMmmikqyXkjDfmZRgbILYYfBY/jN
         iSU0qOwFd3b5+XfNQDW2XZ3t5YbQklFJIm/Fwi0kbyiyyAKznF0S0rTSZ3C4kRnmC24b
         5nlVkZ6XhFuygrYDHqlmYUWJxecaE2o/CDBJW7z9SJ/YkPLmM4zb9bMkbHpZ8sf7eJMP
         A8bA==
X-Gm-Message-State: ABy/qLY8dn/G8VwQ+k9NiIoz+RmOBPognFIxRIEXIrdd4JfhipV/Ajt1
	GwMiNxq2niIuzXT2e8KemfyHG5/y9/jt
X-Google-Smtp-Source: APBJJlGMDpIVJqpXTTAq2sIMW6qbt+e8DqurrZE8mbv8BJ0pkJpydFhWPniYpjZ4KSuFNcWAmdJj1syWWRwO
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a25:2fd5:0:b0:cb0:e4d4:f4ff with SMTP id
 v204-20020a252fd5000000b00cb0e4d4f4ffmr22044ybv.3.1689992586869; Fri, 21 Jul
 2023 19:23:06 -0700 (PDT)
Date: Sat, 22 Jul 2023 02:22:51 +0000
In-Reply-To: <20230722022251.3446223-1-rananta@google.com>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230722022251.3446223-13-rananta@google.com>
Subject: [PATCH v7 12/12] KVM: arm64: Use TLBI range-based intructions for unmap
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
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_032309_238794_FBEBA5BE 
X-CRM114-Status: GOOD (  16.77  )
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
2.41.0.487.g6d72f3e995-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
