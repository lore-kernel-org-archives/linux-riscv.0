Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E68C7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 17:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QPWYrsEDf/pLQNY84xG7dqXKTYpCMqpBwgxy15X3SQk=; b=d/3pjye7CUWR3BHKtScRSq6gOQ
	OmXb6UeaRa/SpZlx+4E0F6NbaqeGP1fBJ8A5ZQxlFM0OhzXh/QdoYz7n81R7mESAxTKnFjgohK5oy
	anK1M0fv/f8KqptVAeyUzXP5crPuw2d+3GNMGcB9oCROP1kvYuu+CAXWbuxjg1m651zK4kMdXkRNg
	W7i5+NGypWPlSoU3bmU6JtS71JHV8HtC/HNhp/N/qZEOxxqZj+ze5VloZwFbbaqCCEcMveqDK+dyK
	vnrrIgl9ErAPsHqB3OwaUinGOYakJcKlTWSnwltSGrpQd94mDOSYZ5E1FPHG7O4S6M6JoM/fN1Ubq
	7LywFDwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q58NS-007Vs9-1m;
	Fri, 02 Jun 2023 17:15:50 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57LY-007LR8-2w
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 16:09:50 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-56942442eb0so20414267b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jun 2023 09:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685722188; x=1688314188;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ATfYeV4iZLydVfrv7VkfrrcrF6Iyfqli3wOIB/41cFU=;
        b=Rqyu16keB0kE0WrdwrfeOOljSmmTEf5ym2HasOLzHF8ArvodVvyp0S6Lr0lp8jhqaO
         yU7vlRlNbGqDi7zvQpbHT6R5zFRE8DckASYhOzfH9V34Q20hh77zuuNe12GxNtHCZXh5
         lnbwZ2Svz+2HB81mY68YPRkYswYr7F2GvqW0LS+zjsO1U81VkyPUwY6eD2Ki1IgFqmLS
         03LcT6Q3zPmFBx5Lk1wR2QR7kJ2u+CVAlb7S/W7GXhPrjwIAChkVcnGC08nkCFgLZ6+3
         IJyon3TZZUbxyP2iFDZRsS+2chcqzC8RuTMktYv6Efxwhi8TOTgmYLyH3MqqUylTOe6h
         6cPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722188; x=1688314188;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ATfYeV4iZLydVfrv7VkfrrcrF6Iyfqli3wOIB/41cFU=;
        b=d9fvOoAet85GeawvswVREPJq9kF/GAWOuOtWEdrGtcCZT3FKqueTX+7u2xOpBm2Jsl
         rUz7cW0pEvPP0cNxyYtCVzJ9iMA0imgeL4fxoONcGjG43IjbkNEMc+9+uHCwSZpoPZ8H
         Z9II9R2aBGVFC1T2aWBkVv1VELg1gtp9Ag1nPlP1ftEcMbMdWkrP9YdKfAaizff9pGJe
         AbFaBAEaibgxy1+Oy15PuTkUcOJGH0wSxypGUOETtB40hfQr+b4mdPSt44az/PjqM0Jh
         /Eoa02Hmz/qJ3MuxiurA6N0NRtcPquX4PJLR8KNhnDNAlZsRyIjtASgIVHFwL8e4cb49
         yfNA==
X-Gm-Message-State: AC+VfDz1EOeIbIKt1oeDnn36Ui5exrYQBJRStmS3RaWlU0oIdVSGrAa2
	iaOyWh8d0V9Sf+fw8Kj4JpOBWaNjvmPV
X-Google-Smtp-Source: ACHHUZ4IW8kR8j7bn7igS1kcMhvfZS4XncKRF7NLGQ8SgKKpwW4y3+9yGIJ+PiwzD8LO4pWUxsLhYeKpfotT
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a25:e706:0:b0:bac:5d2c:844b with SMTP id
 e6-20020a25e706000000b00bac5d2c844bmr1305917ybh.8.1685722187745; Fri, 02 Jun
 2023 09:09:47 -0700 (PDT)
Date: Fri,  2 Jun 2023 09:09:12 -0700
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230602160914.4011728-1-vipinsh@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230602160914.4011728-15-vipinsh@google.com>
Subject: [PATCH v2 14/16] KVM: arm64: Pass page walker flags from callers of
 stage 2 split walker
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
X-CRM114-CacheID: sfid-20230602_090948_954146_E36F1989 
X-CRM114-Status: GOOD (  12.93  )
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

Pass enum kvm_pgtable_walk_flags{} to kvm_pgtable_stage2_split() walker
from its caller.

This allows split walker users to specify if they want to run split
logic via shared walker or non-shared walker.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 4 +++-
 arch/arm64/kvm/hyp/pgtable.c         | 5 +++--
 arch/arm64/kvm/mmu.c                 | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 145be12a5fc2..fbf5c6c509fb 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -684,6 +684,7 @@ int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * @size:	 Size of the range.
  * @mc:		 Cache of pre-allocated and zeroed memory from which to allocate
  *		 page-table pages.
+ * @flags:	 Page walker flags
  *
  * The function tries to split any level 1 or 2 entry that overlaps
  * with the input range (given by @addr and @size).
@@ -693,7 +694,8 @@ int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * blocks in the input range as allowed by @mc_capacity.
  */
 int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
-			     struct kvm_mmu_memory_cache *mc);
+			     struct kvm_mmu_memory_cache *mc,
+			     enum kvm_pgtable_walk_flags flags);
 
 /**
  * kvm_pgtable_walk() - Walk a page-table.
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 23cda3de2dd4..7e84be13d76d 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1408,11 +1408,12 @@ static int stage2_split_walker(const struct kvm_pgtable_visit_ctx *ctx,
 }
 
 int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
-			     struct kvm_mmu_memory_cache *mc)
+			     struct kvm_mmu_memory_cache *mc,
+			     enum kvm_pgtable_walk_flags flags)
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_split_walker,
-		.flags	= KVM_PGTABLE_WALK_LEAF,
+		.flags	= flags | KVM_PGTABLE_WALK_LEAF,
 		.arg	= mc,
 	};
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 7c966f6f1a41..34d2bd03cf5f 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -153,7 +153,7 @@ static int kvm_mmu_split_huge_pages(struct kvm *kvm, phys_addr_t addr,
 			return -EINVAL;
 
 		next = __stage2_range_addr_end(addr, end, chunk_size);
-		ret = kvm_pgtable_stage2_split(pgt, addr, next - addr, cache);
+		ret = kvm_pgtable_stage2_split(pgt, addr, next - addr, cache, 0);
 		if (ret)
 			break;
 	} while (addr = next, addr != end);
-- 
2.41.0.rc0.172.g3f132b7071-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
