Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCE6C25B6F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 19:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aG0xYFeYIlbC8Y6CicDSD1ZY7ww/zTN1izBTFdGgY78=; b=LvPUB9u8mjwapS
	2E6uK1+afCUn5JgeGEpbqtabmIe/KCaJuyeDhMo0wer9yKRUljkNoWuD2tbTKVstvuYQcMpG9JRRh
	kmSzK5Mk7VQS0LuF2sjdj0mRXwwR+1vnvMd8hgLXP1jmg3xEHY8p+AaObran9JkNTQuPqq/s+LHZz
	bvPb/fagHtrIGEWL6BrOJ8J5/jAMmvroTeHg/dBM+TIrUzYDmx8WX/CM6oUfuAAX3WcP7OXoqA+TY
	+uwIh0ecDaNPC77dDDLvPpeCuqmK+BxhJ8wZ5rtF86cPd4uPeZbR25he3H2oDfYpi+TnkWzct79SL
	EluQqYKENyoQSZkx/34Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwSXv-00H5Pj-1X;
	Fri, 27 Oct 2023 19:31:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRTx-00Gx4m-03
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Oct 2023 18:22:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yZ4F+cCxLEA4PAApSP/v5UU01C7c86XBvQlNJK8gQkw=; b=epq9V3MmCrtSwDiEMNo49QJly7
	ZkzOS9gPbU3qtuR/t8X6LpDQZ0/O5S+jf39VvjHHNB78Od2h5ebzRAAjBQRrFjTyKdTpK7bVZS3BU
	NIKlfoiAPMzDr6f3MX59fOQpLS0jMSy5f512mln+cW/xIyyaxEkGUcHkMC4HZn0ND125ztP2A4+7L
	Ie5RZGha+oab1i32BeAETmkfoIQN7NcdfZG1Dr931xop8SkObPIV2B5BWVgJgfgtKnYpQDvoupeNG
	0+0lAgVyCPjL7X1t0q6fRyc/A64kByJcMc1d4wHrqOgOB86ZFoBTFm5pa1kdAfYUFl6nNRUCGuDZP
	C4TES9yQ==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qwRTt-004svo-4m
	for linux-riscv@lists.infradead.org; Fri, 27 Oct 2023 18:22:51 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5af9b0850fdso9978467b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430965; x=1699035765; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=yZ4F+cCxLEA4PAApSP/v5UU01C7c86XBvQlNJK8gQkw=;
        b=gAlgfICVFoZpzrxbpO2wkY3UuLalER5f/VdT+Q2iGJ/bYtIz6N/LMTYPhFRPTcED3K
         nXV2lrVtSbaIx/lbCzom4SNzKuMczzphrdrM+lPioInfDZ0OGKVDCrRnk7NP2w5Y3l/r
         LSJ1rqPNY75vokEsQcIazgrtd41Cgl/y3XbtP0XHXj1xcLm3aCkqABtJ58LB7PQxfCU4
         7tiUwhd5Z4KUaCAt0EeTOMWlFlm+qyCTV00dq+tHm82cSNZ0uwaQ82AKSF4nigLVpmxZ
         F8vm2tOzZuzt/6NLSKZh+ZffdVWTPopMF18m6VFbrVxCc+CLHbghDnAF2VE3psIY3lG6
         y1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430965; x=1699035765;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZ4F+cCxLEA4PAApSP/v5UU01C7c86XBvQlNJK8gQkw=;
        b=Ewo3s8QUsOY/3xn8BRaZgx5MiK/E30jPUQu43477nLiJSC2TsptxltydaYgEVX1lTw
         tUQ8We7JzELxKa+yV2FOjovdhBsVVOPxgeW5sKxOkOSrApxwQHRAi5Sku5dao3rLpBmI
         kLLPTbFpVfotyqBtxBmtNff9Ez7Xz8oxBt2eJY4h/RyJ5jsgNOqa9IM6NjOG0ZJ7FVvO
         KK55/yNXhXL1Qfh5iAmqLE+FgmNS0ODNHv6Ryox3ekLDKcFwEAoI2RNwvXZWpZk+smXg
         phtxkaJyML5hu7DwQrvFPLJxOnYRMoQ61LoTb0TRELvn42oH7IRdV+jBLm8Ru6/sHuQT
         RXyA==
X-Gm-Message-State: AOJu0YyyBk8nZCiHsbzpyqq5coimRjX5Gn7Xq0Eho3b0p6sk8N3eQevL
	njTzdtZGC4QdANdNoHoGBUxA8oLzk/E=
X-Google-Smtp-Source: AGHT+IGwuIwT1CUNj+EGBgkfDLIp57neyP6oJZbU4jqENzEgZhephR9TVXqJjgCFT4zzJuNYuq9lZ329bBo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:a14c:0:b0:59b:e97e:f7e2 with SMTP id
 y73-20020a81a14c000000b0059be97ef7e2mr73613ywg.4.1698430965278; Fri, 27 Oct
 2023 11:22:45 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:21:52 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-11-seanjc@google.com>
Subject: [PATCH v13 10/35] KVM: Add a dedicated mmu_notifier flag for
 reclaiming freed memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_192249_201355_0E51D7EB 
X-CRM114-Status: GOOD (  17.43  )
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

Handle AMD SEV's kvm_arch_guest_memory_reclaimed() hook by having
__kvm_handle_hva_range() return whether or not an overlapping memslot
was found, i.e. mmu_lock was acquired.  Using the .on_unlock() hook
works, but kvm_arch_guest_memory_reclaimed() needs to run after dropping
mmu_lock, which makes .on_lock() and .on_unlock() asymmetrical.

Use a small struct to return the tuple of the notifier-specific return,
plus whether or not overlap was found.  Because the iteration helpers are
__always_inlined, practically speaking, the struct will never actually be
returned from a function call (not to mention the size of the struct will
be two bytes in practice).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 53 +++++++++++++++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 16 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 3f5b7c2c5327..2bc04c8ae1f4 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -561,6 +561,19 @@ struct kvm_mmu_notifier_range {
 	bool may_block;
 };
 
+/*
+ * The inner-most helper returns a tuple containing the return value from the
+ * arch- and action-specific handler, plus a flag indicating whether or not at
+ * least one memslot was found, i.e. if the handler found guest memory.
+ *
+ * Note, most notifiers are averse to booleans, so even though KVM tracks the
+ * return from arch code as a bool, outer helpers will cast it to an int. :-(
+ */
+typedef struct kvm_mmu_notifier_return {
+	bool ret;
+	bool found_memslot;
+} kvm_mn_ret_t;
+
 /*
  * Use a dedicated stub instead of NULL to indicate that there is no callback
  * function/handler.  The compiler technically can't guarantee that a real
@@ -582,22 +595,25 @@ static const union kvm_mmu_notifier_arg KVM_MMU_NOTIFIER_NO_ARG;
 	     node;							     \
 	     node = interval_tree_iter_next(node, start, last))	     \
 
-static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
-						  const struct kvm_mmu_notifier_range *range)
+static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
+							   const struct kvm_mmu_notifier_range *range)
 {
-	bool ret = false, locked = false;
+	struct kvm_mmu_notifier_return r = {
+		.ret = false,
+		.found_memslot = false,
+	};
 	struct kvm_gfn_range gfn_range;
 	struct kvm_memory_slot *slot;
 	struct kvm_memslots *slots;
 	int i, idx;
 
 	if (WARN_ON_ONCE(range->end <= range->start))
-		return 0;
+		return r;
 
 	/* A null handler is allowed if and only if on_lock() is provided. */
 	if (WARN_ON_ONCE(IS_KVM_NULL_FN(range->on_lock) &&
 			 IS_KVM_NULL_FN(range->handler)))
-		return 0;
+		return r;
 
 	idx = srcu_read_lock(&kvm->srcu);
 
@@ -631,8 +647,8 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 			gfn_range.end = hva_to_gfn_memslot(hva_end + PAGE_SIZE - 1, slot);
 			gfn_range.slot = slot;
 
-			if (!locked) {
-				locked = true;
+			if (!r.found_memslot) {
+				r.found_memslot = true;
 				KVM_MMU_LOCK(kvm);
 				if (!IS_KVM_NULL_FN(range->on_lock))
 					range->on_lock(kvm);
@@ -640,14 +656,14 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 				if (IS_KVM_NULL_FN(range->handler))
 					break;
 			}
-			ret |= range->handler(kvm, &gfn_range);
+			r.ret |= range->handler(kvm, &gfn_range);
 		}
 	}
 
-	if (range->flush_on_ret && ret)
+	if (range->flush_on_ret && r.ret)
 		kvm_flush_remote_tlbs(kvm);
 
-	if (locked) {
+	if (r.found_memslot) {
 		KVM_MMU_UNLOCK(kvm);
 		if (!IS_KVM_NULL_FN(range->on_unlock))
 			range->on_unlock(kvm);
@@ -655,8 +671,7 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 
 	srcu_read_unlock(&kvm->srcu, idx);
 
-	/* The notifiers are averse to booleans. :-( */
-	return (int)ret;
+	return r;
 }
 
 static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
@@ -677,7 +692,7 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 		.may_block	= false,
 	};
 
-	return __kvm_handle_hva_range(kvm, &range);
+	return __kvm_handle_hva_range(kvm, &range).ret;
 }
 
 static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn,
@@ -696,7 +711,7 @@ static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn
 		.may_block	= false,
 	};
 
-	return __kvm_handle_hva_range(kvm, &range);
+	return __kvm_handle_hva_range(kvm, &range).ret;
 }
 
 static bool kvm_change_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
@@ -798,7 +813,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 		.end		= range->end,
 		.handler	= kvm_mmu_unmap_gfn_range,
 		.on_lock	= kvm_mmu_invalidate_begin,
-		.on_unlock	= kvm_arch_guest_memory_reclaimed,
+		.on_unlock	= (void *)kvm_null_fn,
 		.flush_on_ret	= true,
 		.may_block	= mmu_notifier_range_blockable(range),
 	};
@@ -830,7 +845,13 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 	gfn_to_pfn_cache_invalidate_start(kvm, range->start, range->end,
 					  hva_range.may_block);
 
-	__kvm_handle_hva_range(kvm, &hva_range);
+	/*
+	 * If one or more memslots were found and thus zapped, notify arch code
+	 * that guest memory has been reclaimed.  This needs to be done *after*
+	 * dropping mmu_lock, as x86's reclaim path is slooooow.
+	 */
+	if (__kvm_handle_hva_range(kvm, &hva_range).found_memslot)
+		kvm_arch_guest_memory_reclaimed(kvm);
 
 	return 0;
 }
-- 
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
