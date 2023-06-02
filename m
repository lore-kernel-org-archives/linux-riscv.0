Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7E9C7EE24
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 16:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zYFqvEbNIrlwoLpibGGCVjLDrXBI/Ym+exOHVTNN/4s=; b=HuSCb3Eos3hIpCw/XiIDGDSvih
	Q28SUYwhd+gadWF0m4CqEJgtFzGJDi+6fhFwP36eNvpIXrjQVnUXyH3RmKC8lyQNPrUseFLvH7FAv
	XCrTHDj1y6NS7YWok0cmusH7pxONlLSgL68TNn8xkvcT7xGIuue5UiXBMcmp08vssrSVCzsHZw6ah
	2ylVo9W2LP+I60zCPy73oLxerTJJ/re+7YjIebSoOF7rOX2DGzbvAvPDuQcnpH/munmPTgag7WB0C
	2FF+3wcZN5SnKVVf6BnJlgm2rI6RZx+UiShE45SrESfoPRx0kI+6oTYjQE6eZ3ZsqH8RDZmiSqIru
	t31MVqoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q57q9-007R7M-31;
	Fri, 02 Jun 2023 16:41:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57q8-007R6I-1a
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 Jun 2023 16:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GJx+yypKzd3COmz5TQWkFGxt9Sb1HD5xNFJXRHqVvy0=; b=GdWtbguzJF/qKI+JDnb4wKg53e
	DLhh62+CI5T/dcoy50I45qw4l+6cczFH9ysrBQT7YzpgLYJEDgL+yAlHMSklIlFheNf3XRSsPivWe
	hhnXYcZ+m//Ws5uTYvoJw8N91rD0ebcNClv4xzJHtOwJzGQ/UqUp1rwxezn/u3AjbtAxcqsPfVCxc
	LloQjbJKcVvb+Cjey51yxN8ndIJV6lTBdRP/TVnrmzbm28rRYCVJEChYgTzekhnfAnuBT3L4ug9qz
	2siyDNLbz66yZc9qTyHvObetTv6Q2OaBKxpHIX0CyRgnYTuQg0Q/r+ODo+gJjZOgzEhbM39gmoh4y
	MDYr8/6A==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57LO-001N8m-1B
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 16:09:41 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-babb5e91ab4so3222987276.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jun 2023 09:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685722176; x=1688314176;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GJx+yypKzd3COmz5TQWkFGxt9Sb1HD5xNFJXRHqVvy0=;
        b=szBGu+EQ2vs8Q3A0ZT1RS79FNLRJxSOVkrDrBBX7rmCKLzKn/b+E4mNymytABzCLif
         EgUFXaPy7nG7KM6jDjkYBO0vsJLxZ4XBjsoF6X75ZimJDOLxnKGoSfjvnPNLfA9vSHBD
         s9ihl+kXGelNmLHAJZYRz4+yQ+Fx6J3bT5bOlL9FOfNpgH6MN5wQNIGrZvk2XbL68tHF
         B/csW1RkKWfzpRPcNxb+4yNUfWvhAhXwGpxjibheJUkN4+CaHLLPZUdUbJv/P8pKuPN/
         Cvmf4i9nzVBBvNWz3J0YGn8SEauVZOkYjg+xhiWvEBlTBwkFZHPSrYROctUU+loxAFaS
         zjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722176; x=1688314176;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GJx+yypKzd3COmz5TQWkFGxt9Sb1HD5xNFJXRHqVvy0=;
        b=VQRXTgbTBuYkWZzxbeY0K76kd6fEoFppL7kMTcYK0TPsfdITaMPAIBz3lW+DRX/528
         D/QSxYnxL3XnFdiQ3MdyXuim+Z720iBRg5SgDFZhcKkleWCUxKNfiQR9yg6sYgOM+D0P
         vXFUu3HOHUo0bTApwPec1yZFHY5ULxBKeSWaPyjdHNBJgpEJtjRWLatetF87QWpEBceZ
         SmVn/EVakWx6iyyD2lHP9900ioZ3R7ul5rzaGo8AlwlUPFVz1tMwWFoMb0XWkRefr+f4
         HYNIYgAt3PpDvJ30ZLp1jdZ5vg5+gfesSwIyViLnbr+5TizsJ8ysfwDSE2R9pF4YNeq3
         tblw==
X-Gm-Message-State: AC+VfDy3skTPA3iDot+0vP2B2yZqAtaC5gviLG+176gdjWzneXGuoW17
	I4zYcjpska8Q1mTH9YaFYrEsi/bQta/1
X-Google-Smtp-Source: ACHHUZ55GAWUbCX2pBxCQpbjCqZ+MgzCwRW5rUzsUOGzP4VGdNUP2AN+4xPnboHdKBOoO7J5TTwkex+IpQ+T
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a05:6902:100a:b0:bad:600:1833 with SMTP id
 w10-20020a056902100a00b00bad06001833mr2072241ybt.0.1685722176005; Fri, 02 Jun
 2023 09:09:36 -0700 (PDT)
Date: Fri,  2 Jun 2023 09:09:06 -0700
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230602160914.4011728-1-vipinsh@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230602160914.4011728-9-vipinsh@google.com>
Subject: [PATCH v2 08/16] KMV: arm64: Pass page table walker flags to stage2_apply_range_*()
From: Vipin Sharma <vipinsh@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com, 
	tsbogend@alpha.franken.de, anup@brainfault.org, atishp@atishpatra.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, pbonzini@redhat.com, dmatlack@google.com, 
	ricarkol@google.com
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_170938_483098_9AF4DA83 
X-CRM114-Status: GOOD (  16.60  )
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

Allow stage2_apply_range_*() to accept enum kvm_pgtable_walk_flags{}
for stage 2 walkers. Pass 0 as the flag value from all of its caller
effectively making it a no-op.

Page table walker flags  will be used in future commits to enable
clear-dirty-log operation under MMU read lock.

Current users of stage2_apply_range_*() API runs under assumption of
holding MMU write lock. Stage2 page table walkers then run under the
same assumption. In future commits, when clear-dirty-log is modified to
run under MMU read lock then this flag will be used to pass shared page
walk intent.

No functional changes intended.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h  | 12 +++++++++---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c |  4 ++--
 arch/arm64/kvm/hyp/pgtable.c          | 16 ++++++++++------
 arch/arm64/kvm/mmu.c                  | 26 ++++++++++++++++----------
 4 files changed, 37 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index d542a671c564..8ef7e8f3f054 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -560,6 +560,7 @@ int kvm_pgtable_stage2_set_owner(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
  * @addr:	Intermediate physical address from which to remove the mapping.
  * @size:	Size of the mapping.
+ * @flags:	Page-table walker flags.
  *
  * The offset of @addr within a page is ignored and @size is rounded-up to
  * the next page boundary.
@@ -572,7 +573,8 @@ int kvm_pgtable_stage2_set_owner(struct kvm_pgtable *pgt, u64 addr, u64 size,
  *
  * Return: 0 on success, negative error code on failure.
  */
-int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
+int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size,
+			     enum kvm_pgtable_walk_flags flags);
 
 /**
  * kvm_pgtable_stage2_wrprotect() - Write-protect guest stage-2 address range
@@ -580,6 +582,7 @@ int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
  * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
  * @addr:	Intermediate physical address from which to write-protect,
  * @size:	Size of the range.
+ * @flags:	Page-table walker flags.
  *
  * The offset of @addr within a page is ignored and @size is rounded-up to
  * the next page boundary.
@@ -590,7 +593,8 @@ int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
  *
  * Return: 0 on success, negative error code on failure.
  */
-int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size);
+int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size,
+				 enum kvm_pgtable_walk_flags flags);
 
 /**
  * kvm_pgtable_stage2_mkyoung() - Set the access flag in a page-table entry.
@@ -662,13 +666,15 @@ bool kvm_pgtable_stage2_is_young(struct kvm_pgtable *pgt, u64 addr);
  * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
  * @addr:	Intermediate physical address from which to flush.
  * @size:	Size of the range.
+ * @flags:	Page-table walker flags.
  *
  * The offset of @addr within a page is ignored and @size is rounded-up to
  * the next page boundary.
  *
  * Return: 0 on success, negative error code on failure.
  */
-int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size);
+int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size,
+			     enum kvm_pgtable_walk_flags flags);
 
 /**
  * kvm_pgtable_stage2_split() - Split a range of huge pages into leaf PTEs pointing
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index d35e75b13ffe..13f5cf5f87c3 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -333,11 +333,11 @@ static int host_stage2_unmap_dev_all(void)
 	/* Unmap all non-memory regions to recycle the pages */
 	for (i = 0; i < hyp_memblock_nr; i++, addr = reg->base + reg->size) {
 		reg = &hyp_memory[i];
-		ret = kvm_pgtable_stage2_unmap(pgt, addr, reg->base - addr);
+		ret = kvm_pgtable_stage2_unmap(pgt, addr, reg->base - addr, 0);
 		if (ret)
 			return ret;
 	}
-	return kvm_pgtable_stage2_unmap(pgt, addr, BIT(pgt->ia_bits) - addr);
+	return kvm_pgtable_stage2_unmap(pgt, addr, BIT(pgt->ia_bits) - addr, 0);
 }
 
 struct kvm_mem_range {
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 364b68013038..a3a0812b2301 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1044,12 +1044,14 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	return 0;
 }
 
-int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
+int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size,
+			     enum kvm_pgtable_walk_flags flags)
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_unmap_walker,
 		.arg	= pgt,
-		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABLE_POST,
+		.flags	= flags | KVM_PGTABLE_WALK_LEAF |
+			  KVM_PGTABLE_WALK_TABLE_POST,
 	};
 
 	return kvm_pgtable_walk(pgt, addr, size, &walker);
@@ -1128,11 +1130,12 @@ static int stage2_update_leaf_attrs(struct kvm_pgtable *pgt, u64 addr,
 	return 0;
 }
 
-int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
+int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size,
+				 enum kvm_pgtable_walk_flags flags)
 {
 	return stage2_update_leaf_attrs(pgt, addr, size, 0,
 					KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
-					NULL, NULL, 0);
+					NULL, NULL, flags);
 }
 
 kvm_pte_t kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr)
@@ -1213,11 +1216,12 @@ static int stage2_flush_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	return 0;
 }
 
-int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
+int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size,
+			     enum kvm_pgtable_walk_flags flags)
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_flush_walker,
-		.flags	= KVM_PGTABLE_WALK_LEAF,
+		.flags	= flags | KVM_PGTABLE_WALK_LEAF,
 		.arg	= pgt,
 	};
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 0c2c2c0846f1..1030921d89f8 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -55,7 +55,9 @@ static phys_addr_t stage2_range_addr_end(phys_addr_t addr, phys_addr_t end)
  */
 static int stage2_apply_range(struct kvm_s2_mmu *mmu, phys_addr_t addr,
 			      phys_addr_t end,
-			      int (*fn)(struct kvm_pgtable *, u64, u64),
+			      enum kvm_pgtable_walk_flags flags,
+			      int (*fn)(struct kvm_pgtable *, u64, u64,
+					enum kvm_pgtable_walk_flags),
 			      bool resched)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
@@ -68,7 +70,7 @@ static int stage2_apply_range(struct kvm_s2_mmu *mmu, phys_addr_t addr,
 			return -EINVAL;
 
 		next = stage2_range_addr_end(addr, end);
-		ret = fn(pgt, addr, next - addr);
+		ret = fn(pgt, addr, next - addr, flags);
 		if (ret)
 			break;
 
@@ -79,8 +81,8 @@ static int stage2_apply_range(struct kvm_s2_mmu *mmu, phys_addr_t addr,
 	return ret;
 }
 
-#define stage2_apply_range_resched(mmu, addr, end, fn)			\
-	stage2_apply_range(mmu, addr, end, fn, true)
+#define stage2_apply_range_resched(mmu, addr, end, flags, fn)		\
+	stage2_apply_range(mmu, addr, end, flags, fn, true)
 
 /*
  * Get the maximum number of page-tables pages needed to split a range
@@ -316,7 +318,7 @@ static void __unmap_stage2_range(struct kvm_s2_mmu *mmu, phys_addr_t start, u64
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
 	WARN_ON(size & ~PAGE_MASK);
-	WARN_ON(stage2_apply_range(mmu, start, end, kvm_pgtable_stage2_unmap,
+	WARN_ON(stage2_apply_range(mmu, start, end, 0, kvm_pgtable_stage2_unmap,
 				   may_block));
 }
 
@@ -331,7 +333,8 @@ static void stage2_flush_memslot(struct kvm *kvm,
 	phys_addr_t addr = memslot->base_gfn << PAGE_SHIFT;
 	phys_addr_t end = addr + PAGE_SIZE * memslot->npages;
 
-	stage2_apply_range_resched(&kvm->arch.mmu, addr, end, kvm_pgtable_stage2_flush);
+	stage2_apply_range_resched(&kvm->arch.mmu, addr, end, 0,
+				   kvm_pgtable_stage2_flush);
 }
 
 /**
@@ -1041,10 +1044,13 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
  * @mmu:        The KVM stage-2 MMU pointer
  * @addr:	Start address of range
  * @end:	End address of range
+ * @flags:	Page-table walker flags.
  */
-static void stage2_wp_range(struct kvm_s2_mmu *mmu, phys_addr_t addr, phys_addr_t end)
+static void stage2_wp_range(struct kvm_s2_mmu *mmu, phys_addr_t addr, phys_addr_t end,
+			    enum kvm_pgtable_walk_flags flags)
 {
-	stage2_apply_range_resched(mmu, addr, end, kvm_pgtable_stage2_wrprotect);
+	stage2_apply_range_resched(mmu, addr, end, flags,
+				   kvm_pgtable_stage2_wrprotect);
 }
 
 /**
@@ -1073,7 +1079,7 @@ static void kvm_mmu_wp_memory_region(struct kvm *kvm, int slot)
 	end = (memslot->base_gfn + memslot->npages) << PAGE_SHIFT;
 
 	write_lock(&kvm->mmu_lock);
-	stage2_wp_range(&kvm->arch.mmu, start, end);
+	stage2_wp_range(&kvm->arch.mmu, start, end, 0);
 	write_unlock(&kvm->mmu_lock);
 	kvm_flush_remote_tlbs(kvm);
 }
@@ -1128,7 +1134,7 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 	write_lock(&kvm->mmu_lock);
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
-	stage2_wp_range(&kvm->arch.mmu, start, end);
+	stage2_wp_range(&kvm->arch.mmu, start, end, 0);
 
 	/*
 	 * Eager-splitting is done when manual-protect is set.  We
-- 
2.41.0.rc0.172.g3f132b7071-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
