Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7834AC25B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 19:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/nTRBxoV8JpdcaoKxrW0LLAvoSjOGThC/QTEf5uQm9s=; b=r94g+rdJWfQh+7Zq0LkMAsth6F
	9L5J7wo/gI+NsOs0z1JfcArCZEpJQ7RJrx0ezQ8glvsg3vSUurpgMnPk0N6OeSRyWy8cczMxKU7AT
	hMjtv/FV2SlQ6xr3LenykfVViQBLGrAwQqWe3gJN/+m2xWEqW8LaIBHa9jUFoUG5VoKBus7qNZEuw
	uQ2jSmXi7ehuRJbBC8HghnIQ8O0bz6l4tm4RdDs/N8wg1DGf7h5aQVNOcJTSgl+U5yw/YV45F6ANC
	4rgrUuZj5WpVUDYcQeJYfeNB4RuQqi4f8QzUb5xdFC0JSXvyam0OA4p7fatmybBRZ8w7hM+JKjjHK
	uRPlirGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCOmH-00000005JR5-2pZm;
	Wed, 29 May 2024 19:16:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCNg3-000000058pP-1drW
	for linux-riscv@bombadil.infradead.org;
	Wed, 29 May 2024 18:05:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=K/D/1FA4Uw1YrzG6+cN1+7larQcduYYAcSD+7tGLFpU=; b=SYucbSC0jVNTnj5dToxEUrBRjW
	n3EFgadIaJufTt9P6ZS7UJ9EXmix1EgoVm5t60we4wfOyntF7PLHvrib/fsqYeZ5KWtsumERz5n1g
	4ZYSitTQ7e8L8UoGf07SsJiO2z8kJH3tohWRKtI5HCnj6IYZH8Xm2SDnTSjiBu74blnp8gE2j579N
	8MHwCc1lnQ1SQ5BCiwaDcUe10Vh3yxjY+/v4OY/bHmrGtDXMQJNna5DRh53tAlaoemvTdevMac5te
	B+1ldLyILbE0R8CUxNLKfZmUG9vegxeN+NxqICJy4uGmYa9WXdvlQlXtGduH2GvdBreUr9J9wzAnP
	8tN4aWww==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCNfw-0000000E1ol-3T6o
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 18:05:28 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-627e9a500faso36958047b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 11:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717005923; x=1717610723; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K/D/1FA4Uw1YrzG6+cN1+7larQcduYYAcSD+7tGLFpU=;
        b=H+XBvkUeg8sDezRU6S5ZIMZGpzQdoBOMC2MUFjLWT1TeCQhEH/bo4Lvj0pyqnYvhJX
         rWkYzWcXOfqcxmbIkjZh8bVd1fYMsdCud8OEQqrTYcgWGMlNqEyq9KnFQ9XJCReO4t+s
         AvPavWWckLcPHSri8kcVQfHDedaslGrOpf8BDj8tNbfrVeXiPJtd71384bfND6hGsmvM
         HSqlHVQAAr6mLm1GXWFl+kGjoeyssqHaJ65kkXr1/OeRhX+lbY+GWfy2l89ijig2vV2q
         7fWZMFvZZ63WhL/z7c0ZkcspCbHJ/PGcPh57rJWzq/60MY0/YmPEeMtGHPpLw+9GS6Yl
         FiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717005923; x=1717610723;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/D/1FA4Uw1YrzG6+cN1+7larQcduYYAcSD+7tGLFpU=;
        b=apy3ae+AaaeCMbG5Ilw5UvC4BV9ZMQsnYMx4G5pL53KiMlFuy3DPFk0u/AUgADZDgo
         Ot8zz8dJKBU/P5wJvU3ZQmZr74HfDlFOEfK9DO5Kj68jvkcW2pRLQdIwncq2W3G1m0TB
         auc34tS1i3z2Ae+0/sNDsgWr1gkICQngQmCRP+GGxrrA/b5WU2mQvZcTFjD6TLOdtPLn
         RPrCaJDnnbFNEFdryM28Fd5Wb9PH7FWja+RfJP98GchNhflsh+ta8LIaTV9wZcGvUvh7
         u+C40gxMaevWujcjRDIduM5hZZ7loXbnQ+7wMZsEaXetMYOzFfLnBwekXir2JtFsY+lJ
         Z2kw==
X-Forwarded-Encrypted: i=1; AJvYcCXCU87N4QUJvF/IwsXeNv6U7++G0e/IUM0x6cjn2hZ1FN1Rncossi8nr6niDXmfA0f4xvh8AptOAck8YdoSVCF5EQfOYrA/bf79/ibCVlyB
X-Gm-Message-State: AOJu0Yz3EkkivTAQ9iK63mw8kJ0KtyG/x+ME76wxO9BAOuRWHStqcsBF
	83lNbSadVp1dZu1/MJ090Rl5xynwuOYhAZIu/t2ebjbRU1SkY2Qm4X6/WBFnOYvtLNShJWckTbW
	1QjegH1likT2Ri6NM9g==
X-Google-Smtp-Source: AGHT+IFSnjz7OFMOWeVI0MI1apHPovJ16H+bOSMdUdDO7KbUX1eLZ6QqkPj6sVplMDT0O6FTB3I8hMUTstLZ6+/c
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:690c:6010:b0:61a:e7f7:a4cc with
 SMTP id 00721157ae682-62a08dd7631mr39296497b3.4.1717005922981; Wed, 29 May
 2024 11:05:22 -0700 (PDT)
Date: Wed, 29 May 2024 18:05:09 +0000
In-Reply-To: <20240529180510.2295118-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240529180510.2295118-7-jthoughton@google.com>
Subject: [PATCH v4 6/7] KVM: arm64: Relax locking for kvm_test_age_gfn and kvm_age_gfn
From: James Houghton <jthoughton@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Ankit Agrawal <ankita@nvidia.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Bibo Mao <maobibo@loongson.cn>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	James Houghton <jthoughton@google.com>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Sean Christopherson <seanjc@google.com>, Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_190525_033479_4422723E 
X-CRM114-Status: GOOD (  14.97  )
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

Replace the MMU write locks for read locks.

Grabbing the read lock instead of the write lock is safe because the
only requirement we have is that the stage-2 page tables do not get
deallocated while we are walking them. The stage2_age_walker() callback
is safe to race with itself; update the comment to reflect the
synchronization change.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 9 ++++-----
 arch/arm64/kvm/mmu.c         | 8 ++++----
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 9e2bbee77491..eabb07c66a07 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1319,10 +1319,8 @@ static int stage2_age_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	data->young = true;
 
 	/*
-	 * stage2_age_walker() is always called while holding the MMU lock for
-	 * write, so this will always succeed. Nonetheless, this deliberately
-	 * follows the race detection pattern of the other stage-2 walkers in
-	 * case the locking mechanics of the MMU notifiers is ever changed.
+	 * This walk may not be exclusive; the PTE is permitted to change
+	 * from under us.
 	 */
 	if (data->mkold && !stage2_try_set_pte(ctx, new))
 		return -EAGAIN;
@@ -1345,7 +1343,8 @@ bool kvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr,
 	struct kvm_pgtable_walker walker = {
 		.cb		= stage2_age_walker,
 		.arg		= &data,
-		.flags		= KVM_PGTABLE_WALK_LEAF,
+		.flags		= KVM_PGTABLE_WALK_LEAF |
+				  KVM_PGTABLE_WALK_SHARED,
 	};
 
 	WARN_ON(kvm_pgtable_walk(pgt, addr, size, &walker));
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 8337009dde77..40e7427462a7 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1775,7 +1775,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 	bool young = false;
 
-	write_lock(&kvm->mmu_lock);
+	read_lock(&kvm->mmu_lock);
 
 	if (!kvm->arch.mmu.pgt)
 		goto out;
@@ -1785,7 +1785,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 						    size, true);
 
 out:
-	write_unlock(&kvm->mmu_lock);
+	read_unlock(&kvm->mmu_lock);
 	return young;
 }
 
@@ -1794,7 +1794,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 	bool young = false;
 
-	write_lock(&kvm->mmu_lock);
+	read_lock(&kvm->mmu_lock);
 
 	if (!kvm->arch.mmu.pgt)
 		goto out;
@@ -1804,7 +1804,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 						    size, false);
 
 out:
-	write_unlock(&kvm->mmu_lock);
+	read_unlock(&kvm->mmu_lock);
 	return young;
 }
 
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
