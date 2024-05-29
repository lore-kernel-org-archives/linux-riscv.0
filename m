Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F7CC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 18:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OCArnowRyi5MGQc3VAFgDbh/BCQvMm6NvUdak/Ujd6I=; b=Su00JRdsaiAqBzCc426OErlQQZ
	mCZLdWKQqPex03EE6LEKI1iz8/3SDLKs6dWzpvC9wvgaE1WawIZRj8DdNWaqsa3TY8mOZlzVIWOdv
	O949XxEMdreiGdKJsNPfwlocgj60E1E/n9DTgBvNC7GRs6zoSdaMdC+5p0An2QlRT+3Os7Wx53fqX
	WxmKG/TKn7ZLi7vZozZLTT4fI16GtpWtKWATTEx3VkOpfmT1biMvqjutqqtO4ovDVWjWL691l3iIe
	tpUoIrWMOLjo72wvBzVD96YTypFPJWUxU3BeiObx89GNDxvNjHmMI6dZ3cgy7D5miKN154+d2Gg6F
	OgfR9f2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCNgS-0000000599y-1lVj;
	Wed, 29 May 2024 18:05:56 +0000
Received: from mail-ua1-x949.google.com ([2607:f8b0:4864:20::949])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCNfv-000000058hl-1ErY
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 18:05:27 +0000
Received: by mail-ua1-x949.google.com with SMTP id a1e0cc1a2514c-80a3807d7eeso17761241.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 11:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717005920; x=1717610720; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9IVaEi5zQfJ05wKpIy/u5NLNm+GzTdT+Fqa7TW9318s=;
        b=ELPYzS3r4H+tg+auLLgszbUyd5Z1QrQdUNR0vGZdurOlvaTveAhLppVXU8mEuDP3aP
         y0dm984e3DVI6Y1HR2rnlDZGgewB6xroO29QUx8EolX30ad8TpWwcK+G4o+1NTJQNwvu
         hv2fQiUjCSMwCoJhmiXDq/9wOI4IelUCmnVdA+/bq/MqV1Zj9PnRzF9i361PFtXAOJGy
         ObOTjIS9uFiLYjh+6nczyHgrt84fTxhaubJYBjE6pdblYgEY1eM+URCHTOk28aiZmLlb
         2p2+beiEqREzhEK/tHZ7vbXpXnn5d6i4lk27mR7vzSjZnhIoJDomDoqJh5rpg0bdCB79
         f27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717005920; x=1717610720;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IVaEi5zQfJ05wKpIy/u5NLNm+GzTdT+Fqa7TW9318s=;
        b=jrKy4IXwpVHgAJTkI4NxPvq+lfIhfQyWT83+JrIcL+68oM/YWSpvfptJTCU7f0Sznl
         FOXR1kJ4Da/gRrK0cwFjQ8jafOoNT4H2eTFfRFESR6xC17u9sajRNb9j8nh782WDMVLM
         jEs+peqeqKzAbLoM8oG259B/BG+h44jqqFM16Hy7+ofggNCvpdE4uQqVmQchGjfS5R6F
         yBnUNkgDnkKiBsiv+gbCq3dxHiL45Qucwxo2VR6SSesvOpQRM+DdT8822mxvXPWBOt1e
         d9Rw/fqq2a79C8KGDCrOVFs2hqHLlqA49iYp/UPZX3bDtO11fNDCKpeRJdRM2LDjFuYg
         9Mlg==
X-Forwarded-Encrypted: i=1; AJvYcCWNoDuIfAHPj4PcOY/fLm9+6oPGTvT6zZtYdoVdr8iE65rDCJ6WQQv07DL47TGiQu0aNJKRNuXSAZzNkBkcqolEW9V+/utW8ZHD7tAuN/SI
X-Gm-Message-State: AOJu0YwayvBX22wnFaALKjmNGOKdvrnFZrsFG8nUB1YsC9BEc6R0M5c0
	LiGaSO23AnM2YGAptTEMnrDuvrh1OkDWn9BGFmGdamdLmD14qlseaCxhRxSUuBAullah0H7Oi4k
	HpbU1FTf2ha0HxyCM1A==
X-Google-Smtp-Source: AGHT+IHvckbiyzzys4cYuqrWT42OTG48lfJUuChD2cJY5KHOUyTU+EmIW59KYswmWzGhXx+WNvqLQXCKjQe35xSx
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:6130:2289:b0:80a:5330:87c5 with
 SMTP id a1e0cc1a2514c-80a5330931fmr5289241.2.1717005920232; Wed, 29 May 2024
 11:05:20 -0700 (PDT)
Date: Wed, 29 May 2024 18:05:06 +0000
In-Reply-To: <20240529180510.2295118-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240529180510.2295118-4-jthoughton@google.com>
Subject: [PATCH v4 3/7] KVM: Add lockless memslot walk to KVM
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
X-CRM114-CacheID: sfid-20240529_110523_392926_23E815DA 
X-CRM114-Status: GOOD (  16.76  )
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

Provide flexibility to the architecture to synchronize as optimally as
they can instead of always taking the MMU lock for writing.

The immediate application is to allow architectures to implement the
test/clear_young MMU notifiers more cheaply.

Suggested-by: Yu Zhao <yuzhao@google.com>
Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/linux/kvm_host.h |  1 +
 virt/kvm/kvm_main.c      | 38 +++++++++++++++++++++++++-------------
 2 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 692c01e41a18..4d7c3e8632e6 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -266,6 +266,7 @@ struct kvm_gfn_range {
 	gfn_t end;
 	union kvm_mmu_notifier_arg arg;
 	bool may_block;
+	bool lockless;
 };
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 14841acb8b95..d197b6725cb3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -558,6 +558,7 @@ struct kvm_mmu_notifier_range {
 	on_lock_fn_t on_lock;
 	bool flush_on_ret;
 	bool may_block;
+	bool lockless;
 };
 
 /*
@@ -612,6 +613,10 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
 			 IS_KVM_NULL_FN(range->handler)))
 		return r;
 
+	/* on_lock will never be called for lockless walks */
+	if (WARN_ON_ONCE(range->lockless && !IS_KVM_NULL_FN(range->on_lock)))
+		return r;
+
 	idx = srcu_read_lock(&kvm->srcu);
 
 	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
@@ -643,15 +648,18 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
 			gfn_range.start = hva_to_gfn_memslot(hva_start, slot);
 			gfn_range.end = hva_to_gfn_memslot(hva_end + PAGE_SIZE - 1, slot);
 			gfn_range.slot = slot;
+			gfn_range.lockless = range->lockless;
 
 			if (!r.found_memslot) {
 				r.found_memslot = true;
-				KVM_MMU_LOCK(kvm);
-				if (!IS_KVM_NULL_FN(range->on_lock))
-					range->on_lock(kvm);
-
-				if (IS_KVM_NULL_FN(range->handler))
-					break;
+				if (!range->lockless) {
+					KVM_MMU_LOCK(kvm);
+					if (!IS_KVM_NULL_FN(range->on_lock))
+						range->on_lock(kvm);
+
+					if (IS_KVM_NULL_FN(range->handler))
+						break;
+				}
 			}
 			r.ret |= range->handler(kvm, &gfn_range);
 		}
@@ -660,7 +668,7 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
 	if (range->flush_on_ret && r.ret)
 		kvm_flush_remote_tlbs(kvm);
 
-	if (r.found_memslot)
+	if (r.found_memslot && !range->lockless)
 		KVM_MMU_UNLOCK(kvm);
 
 	srcu_read_unlock(&kvm->srcu, idx);
@@ -686,10 +694,12 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 	return __kvm_handle_hva_range(kvm, &range).ret;
 }
 
-static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn,
-							 unsigned long start,
-							 unsigned long end,
-							 gfn_handler_t handler)
+static __always_inline int kvm_handle_hva_range_no_flush(
+		struct mmu_notifier *mn,
+		unsigned long start,
+		unsigned long end,
+		gfn_handler_t handler,
+		bool lockless)
 {
 	struct kvm *kvm = mmu_notifier_to_kvm(mn);
 	const struct kvm_mmu_notifier_range range = {
@@ -699,6 +709,7 @@ static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn
 		.on_lock	= (void *)kvm_null_fn,
 		.flush_on_ret	= false,
 		.may_block	= false,
+		.lockless	= lockless,
 	};
 
 	return __kvm_handle_hva_range(kvm, &range).ret;
@@ -889,7 +900,8 @@ static int kvm_mmu_notifier_clear_young(struct mmu_notifier *mn,
 	 * cadence. If we find this inaccurate, we might come up with a
 	 * more sophisticated heuristic later.
 	 */
-	return kvm_handle_hva_range_no_flush(mn, start, end, kvm_age_gfn);
+	return kvm_handle_hva_range_no_flush(mn, start, end,
+					     kvm_age_gfn, false);
 }
 
 static int kvm_mmu_notifier_test_young(struct mmu_notifier *mn,
@@ -899,7 +911,7 @@ static int kvm_mmu_notifier_test_young(struct mmu_notifier *mn,
 	trace_kvm_test_age_hva(address);
 
 	return kvm_handle_hva_range_no_flush(mn, address, address + 1,
-					     kvm_test_age_gfn);
+					     kvm_test_age_gfn, false);
 }
 
 static void kvm_mmu_notifier_release(struct mmu_notifier *mn,
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
