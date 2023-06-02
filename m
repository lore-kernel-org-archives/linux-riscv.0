Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9944CC7EE24
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 16:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wjpVTFc+af7s+tq35WqQhSKMav3Ah/EHIb2CKIIO1wo=; b=yEBZ+gQA745RJhMH9FjRCMOy2o
	VIO/y5hHkntbzhoTM0iRr2pfwZMmkWaJmvYG9ti7Js2v8gVH/mhwDY5P5D0v2Lb0RdEQH5UiSALJ1
	6QcOo3z3NVGRp77nCk8cemYQet8viAOAOWMRMWGNr3CA2XwCCeqPt7xHI9g40ht5+8ZlRwackDd1K
	9B3CbLQJLVEa4FCK/YDXEA6Qb3cU9JxIfaxEDrUvyb3uOZPK5PJMl9UoiHrKB7b1BEozoG2V6PvsL
	pHBFHPW4SRcyatJH5Q6XX4bbby0KP3X233jTKiKGxItZy+UVjdQ1CW6vUAMgHBg+k400WBBIJkv0A
	lTj9NhkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q57q6-007R5h-2U;
	Fri, 02 Jun 2023 16:41:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57q5-007R58-2h
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 Jun 2023 16:41:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XlXfZDaqwtQ8jb+NBFxxHmMdNa0dhVq7sf+3J9mNCvc=; b=A+Px8dY+2zxuf0Hkbjk7iOGyC9
	xraJ/5iCAA2mGaQjcsY2AH/LpAXvsx5dkbjC4QJXY9zY8B/HtgIuI4aktunjJFL+KDxmcN5agr2fR
	fo4faQGUEpC9DLNxvuYYROmliCM4wMvNDecggF89FFHiM9uSudUhtcHjSf6fNuOMyaQ0pZ8RW559q
	oy9vQJzxzVnKwfrMZaMT9z3m440C50Pm3gYeO+Wqz0fXWhdCGlf5hbd70HyQpTns1EPCs6BhaxGjj
	3E1CvwUdu4atd8LHKXq3RZdAeRtqyQZA2E4tZApX2LtrsJwsg/6FGCwP/igsqxbJ+0KrYa4r+SG3z
	CDvP5paw==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57LL-001N7q-1j
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 16:10:14 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5340957a1f1so975326a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jun 2023 09:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685722174; x=1688314174;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XlXfZDaqwtQ8jb+NBFxxHmMdNa0dhVq7sf+3J9mNCvc=;
        b=Cav0E0cCrA4YixnMBQKMfIUVj88wiap2lnIB8ag1Iz/8mWp6WkXueCvYRCBiVgJMpL
         yz6b5GmGWPhdoaqfWLr4eMh+mes1ArSi+nNH2aSvBuPWl2X06K+1JFMN+UK2I8zKDZ+Y
         An4/Ccw/5HBcgWIwlUsNKHK+GBxiwi6UrW0Rt5OfBwhcgGTE2dlnkWyH08h03FWRL/+p
         PpYax2iQC4+/Q7s8QR0zA1oOFG5toYWxuVQyxHq17uCmAv8sJvsjFT497G95S2n7vNCo
         An7ffox8QUfjjPO3WBaFb5yO8HO3WOQ44El3H8raJwdkFn/AASepix+It/ssVM4Hws1C
         WsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722174; x=1688314174;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XlXfZDaqwtQ8jb+NBFxxHmMdNa0dhVq7sf+3J9mNCvc=;
        b=dAgHt10EmJmrxgZ0CFbGfvla2tHsWFSFvL2znBBR3UrmRW9A1HnMv6uqb7RiRq2Iz9
         uQlLqcMzm8WASFkzKaNyhehRtMX5cHWWM7xuCxyc/NBxg6W3XdawjWxMM1Hkw0sZOaRR
         xZvRheyQaCy0UFDMrh+upBgV7F/w7/MmSR1NUT9WUt0TjlzqzOfZf/377UcgtktTX5rb
         QPWcJw3egFeemF47xw9BsFMYW8O80CGxYTyq2MFXKpcx9oH/VCS3a0U94+XiAu8JL/0y
         3AIERXvvdP2pQbAkAjb+o1VdmEIehpzhelcch3Q5/NvNJ13FUg+FahIwY/UDTlaYCt4o
         m5Bg==
X-Gm-Message-State: AC+VfDyG9Zc4qbpHDtgFMe9xofzpY+PyfwQ+Cy5Y3fD/E/toA3rksUS6
	ojccRXkeyZitbwEpu94Avyv/RyXbxTn3
X-Google-Smtp-Source: ACHHUZ63/E8GjVgWNJSqqa8vS+/kUt+EPMZ2lBAM1R4WdW2tBWK9Y4EulGJYzAllZOblN3IVUjTbhEd8OzIe
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a63:385:0:b0:530:70cb:6da9 with SMTP id
 127-20020a630385000000b0053070cb6da9mr2521810pgd.10.1685722173764; Fri, 02
 Jun 2023 09:09:33 -0700 (PDT)
Date: Fri,  2 Jun 2023 09:09:05 -0700
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230602160914.4011728-1-vipinsh@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230602160914.4011728-8-vipinsh@google.com>
Subject: [PATCH v2 07/16] KVM: mmu: Move mmu lock/unlock to arch code for
 clear dirty log
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
X-CRM114-CacheID: sfid-20230602_170935_837740_4E7B1C5D 
X-CRM114-Status: GOOD (  14.83  )
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

Move mmu_lock lock and unlock calls from common code in
kvm_clear_dirty_log_protect() to arch specific code in
kvm_arch_mmu_enable_log_dirty_pt_masked(). None of the other code inside
the for loop of kvm_arch_mmu_enable_log_dirty_pt_masked() needs mmu_lock
exclusivity apart from the arch specific API call.

Future commits will change clear dirty log operations under mmu read
lock instead of write lock for ARM and, potentially, x86 architectures.

No functional changes intended.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/kvm/mmu.c   | 2 ++
 arch/mips/kvm/mmu.c    | 2 ++
 arch/riscv/kvm/mmu.c   | 2 ++
 arch/x86/kvm/mmu/mmu.c | 3 +++
 virt/kvm/dirty_ring.c  | 2 --
 virt/kvm/kvm_main.c    | 4 ----
 6 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6db9ef288ec3..0c2c2c0846f1 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1125,6 +1125,7 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 	phys_addr_t start = (base_gfn +  __ffs(mask)) << PAGE_SHIFT;
 	phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
 
+	write_lock(&kvm->mmu_lock);
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
 	stage2_wp_range(&kvm->arch.mmu, start, end);
@@ -1139,6 +1140,7 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 	 */
 	if (kvm_dirty_log_manual_protect_and_init_set(kvm))
 		kvm_mmu_split_huge_pages(kvm, start, end);
+	write_unlock(&kvm->mmu_lock);
 }
 
 static void kvm_send_hwpoison_signal(unsigned long address, short lsb)
diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index e8c08988ed37..33c5af333ff9 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -419,7 +419,9 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 	gfn_t start = base_gfn +  __ffs(mask);
 	gfn_t end = base_gfn + __fls(mask);
 
+	spin_lock(&kvm->mmu_lock);
 	kvm_mips_mkclean_gpa_pt(kvm, start, end);
+	spin_unlock(&kvm->mmu_lock);
 }
 
 /*
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index f2eb47925806..fe026ff5eb65 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -399,7 +399,9 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 	phys_addr_t start = (base_gfn +  __ffs(mask)) << PAGE_SHIFT;
 	phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
 
+	spin_lock(&kvm->mmu_lock);
 	gstage_wp_range(kvm, start, end);
+	spin_unlock(&kvm->mmu_lock);
 }
 
 void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index c8961f45e3b1..6fff4228e31c 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1382,6 +1382,7 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 				struct kvm_memory_slot *slot,
 				gfn_t gfn_offset, unsigned long mask)
 {
+	write_lock(&kvm->mmu_lock);
 	/*
 	 * Huge pages are NOT write protected when we start dirty logging in
 	 * initially-all-set mode; must write protect them here so that they
@@ -1412,6 +1413,8 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 		kvm_mmu_clear_dirty_pt_masked(kvm, slot, gfn_offset, mask);
 	else
 		kvm_mmu_write_protect_pt_masked(kvm, slot, gfn_offset, mask);
+
+	write_unlock(&kvm->mmu_lock);
 }
 
 int kvm_cpu_dirty_log_size(void)
diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
index c1cd7dfe4a90..d894c58d2152 100644
--- a/virt/kvm/dirty_ring.c
+++ b/virt/kvm/dirty_ring.c
@@ -66,9 +66,7 @@ static void kvm_reset_dirty_gfn(struct kvm *kvm, u32 slot, u64 offset, u64 mask)
 	if (!memslot || (offset + __fls(mask)) >= memslot->npages)
 		return;
 
-	KVM_MMU_LOCK(kvm);
 	kvm_arch_mmu_enable_log_dirty_pt_masked(kvm, memslot, offset, mask);
-	KVM_MMU_UNLOCK(kvm);
 }
 
 int kvm_dirty_ring_alloc(struct kvm_dirty_ring *ring, int index, u32 size)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 13aed654111a..747bfa2f1dd3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2160,7 +2160,6 @@ static int kvm_get_dirty_log_protect(struct kvm *kvm, struct kvm_dirty_log *log)
 		dirty_bitmap_buffer = kvm_second_dirty_bitmap(memslot);
 		memset(dirty_bitmap_buffer, 0, n);
 
-		KVM_MMU_LOCK(kvm);
 		for (i = 0; i < n / sizeof(long); i++) {
 			unsigned long mask;
 			gfn_t offset;
@@ -2176,7 +2175,6 @@ static int kvm_get_dirty_log_protect(struct kvm *kvm, struct kvm_dirty_log *log)
 			kvm_arch_mmu_enable_log_dirty_pt_masked(kvm, memslot,
 								offset, mask);
 		}
-		KVM_MMU_UNLOCK(kvm);
 	}
 
 	if (flush)
@@ -2271,7 +2269,6 @@ static int kvm_clear_dirty_log_protect(struct kvm *kvm,
 	if (copy_from_user(dirty_bitmap_buffer, log->dirty_bitmap, n))
 		return -EFAULT;
 
-	KVM_MMU_LOCK(kvm);
 	for (offset = log->first_page, i = offset / BITS_PER_LONG,
 		 n = DIV_ROUND_UP(log->num_pages, BITS_PER_LONG); n--;
 	     i++, offset += BITS_PER_LONG) {
@@ -2294,7 +2291,6 @@ static int kvm_clear_dirty_log_protect(struct kvm *kvm,
 								offset, mask);
 		}
 	}
-	KVM_MMU_UNLOCK(kvm);
 
 	if (flush)
 		kvm_arch_flush_remote_tlbs_memslot(kvm, memslot);
-- 
2.41.0.rc0.172.g3f132b7071-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
