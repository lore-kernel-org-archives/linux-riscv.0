Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCF9C77B7A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 16:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yqQz34hR4akW/VFMelm3ohJCwVpVbeJr+fnkSH+Muzc=; b=ce+Fg6HFt83bPD2CDmb6OFGfqG
	Jhp55EnZKxprwi8GZfSnFMgWLjoW+Sm5ePOl7Q1mD8ktRdt31pkTKteEtuzmdOGyx0a1kHAJwG2/Z
	qvJ3zupJNJ910U36kmZpS3k7YgaoRhHNNUshO8kVKclOUA/WrBeqL10Sy6/neXVdQfhWfrTP+kTR7
	i6l4VsxgtcSfrzWir9CHcB8qzeltnJHdbbuICxPIokHeOvEOhHxsXibMuQr0n0zyEILgKzmCLHSiK
	5lv7npoZwuyOYgemYY2Z7TSohIf9/at89e/pMiiNIN2qyOIYudBHDnCRSCwGoPUC1egwPewQP6i93
	gQeqNrFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q57ja-007Pgd-04;
	Fri, 02 Jun 2023 16:34:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57jY-007Pfm-0v
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 Jun 2023 16:34:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Hryh0ZWAFdBP/1ensclnMWOs6DFcoKq9t8dEIwwzMjM=; b=mzOvwd96TxWtM50pa61rCCJI5T
	8GXpLX6ExMWEfZRRcayikOCSWtvD8c/+nDNLuOMgOl5Oes6m29pjZ3R99N8yA7/fioLgMBtaxF9Rg
	AYvr4JgW+jeG2/P8/WsbQffYJQwdV9B6GcDVso4bEuHRbA29qHbkZn8g6rwH58ZT/3+c5yKK7uvkb
	rjSwazf2E2h89Ya/56QoVemz9Km0cM+J4VDqcLiEYDgFRLcPIq4omXmZkRArEy8ENIiO5mmiAN8Ps
	AGrTC/JfK7j6DHmKfmIanUO2Uz10tnKgHtUFmp2hxD7wLOdhn0AMbH+Ux+A+h+C4EG+8EPUree+2P
	zH3eVvpw==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q57Ld-009Lmk-Qn
	for linux-riscv@lists.infradead.org; Fri, 02 Jun 2023 16:09:56 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-565ba5667d5so28871807b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jun 2023 09:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685722190; x=1688314190;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hryh0ZWAFdBP/1ensclnMWOs6DFcoKq9t8dEIwwzMjM=;
        b=yFcSJ5sk1YiYcQktVHUrIraA4vq3gzBg01wawQ+99X99BcERdv6aw79BJglFIsX38X
         Jmk2e5UaolCr5t1qAVgv5xhRcuwqz8qsPeKTN4dMinvHjEGhpXtPGawN2ICvlDQZGj8D
         ZmOScsl1sdyn4gxehMyRauugNpIrQjpu1KxL67VdJydhpwrAe8TXpUojYixIDTXpkYLZ
         L/KcS63c1WkLy8I19gAWFgXf90HgC8c3L1xN5Hze37jt9RE4scxALJ3lb9KGpgKF7m+y
         IPNOsGvdWwTPZEtqpxeUuo6lpLAcPxZcX9jQeWMRNApjKkg5jyviIXgCTWMDwLFLuVTH
         Fsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722190; x=1688314190;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hryh0ZWAFdBP/1ensclnMWOs6DFcoKq9t8dEIwwzMjM=;
        b=I8RXb54XVf7z6RBQYbHN1km9sH8pmoYzwMdWZtXfKF9o/fVMNRF56Cx36EXru19KeF
         raZpJbDyDlxg1asPsJm4Icdln0db/cvPrEGzDL7bjfvUouYAYRXRnVPPj6H8ev++rW0K
         1F8Kb7oQHGuIWpWq0ymeGz6ttsCXa5CLhHKfnOCjyJq9JoRXvbjCPXW2PayheLZxYarL
         vmdCQjwN+07AtW3VENGPCQHoSrnePWOYlMyWCwYMKVm8jKIrC0JAxxaPbq1Ig+bKqKTg
         rKLfH487mbmlfQnlp0VZzYecOAY5J0I2wmak7esihxtR2we9U11C+vgX9C5DVNlM3+WU
         gDtw==
X-Gm-Message-State: AC+VfDw/W+sSmolKepOh47vVWq7QITWqpLr3RE75K+uJy08bIWQijXyC
	VLcYOleAR9qmJMCsDcOk+ngpt57KFVd2
X-Google-Smtp-Source: ACHHUZ5M9AG9HKhKFMo8prXUgGc/ucGnPOZDLd1OSRiqHslc40DT/QGSesfErKBawc3k99MHt4wj3TuQ4IOn
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a25:bc7:0:b0:ba8:cbd2:61b3 with SMTP id
 190-20020a250bc7000000b00ba8cbd261b3mr1223005ybl.5.1685722190144; Fri, 02 Jun
 2023 09:09:50 -0700 (PDT)
Date: Fri,  2 Jun 2023 09:09:13 -0700
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230602160914.4011728-1-vipinsh@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230602160914.4011728-16-vipinsh@google.com>
Subject: [PATCH v2 15/16] KVM: arm64: Provide option to pass page walker flag
 for huge page splits
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
X-CRM114-CacheID: sfid-20230602_170953_869109_AA3B60A4 
X-CRM114-Status: UNSURE (   9.08  )
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

Pass enum kvm_pgtable_walk_flags{} to kvm_mmu_split_huge_pages().
Use 0 as the flag value to make it no-op.

In future commit kvm_mmu_split_huge_pages() will be used under both MMU
read lock and MMU write lock. Flag allows to pass intent to use shared
or non-shared page walkers to split the huge pages.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/kvm/mmu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 34d2bd03cf5f..6dd964e3682c 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -118,7 +118,8 @@ static bool need_split_memcache_topup_or_resched(struct kvm *kvm)
 }
 
 static int kvm_mmu_split_huge_pages(struct kvm *kvm, phys_addr_t addr,
-				    phys_addr_t end)
+				    phys_addr_t end,
+				    enum kvm_pgtable_walk_flags flags)
 {
 	struct kvm_mmu_memory_cache *cache;
 	struct kvm_pgtable *pgt;
@@ -153,7 +154,8 @@ static int kvm_mmu_split_huge_pages(struct kvm *kvm, phys_addr_t addr,
 			return -EINVAL;
 
 		next = __stage2_range_addr_end(addr, end, chunk_size);
-		ret = kvm_pgtable_stage2_split(pgt, addr, next - addr, cache, 0);
+		ret = kvm_pgtable_stage2_split(pgt, addr, next - addr, cache,
+					       flags);
 		if (ret)
 			break;
 	} while (addr = next, addr != end);
@@ -1112,7 +1114,7 @@ static void kvm_mmu_split_memory_region(struct kvm *kvm, int slot)
 	end = (memslot->base_gfn + memslot->npages) << PAGE_SHIFT;
 
 	write_lock(&kvm->mmu_lock);
-	kvm_mmu_split_huge_pages(kvm, start, end);
+	kvm_mmu_split_huge_pages(kvm, start, end, 0);
 	write_unlock(&kvm->mmu_lock);
 }
 
@@ -1149,7 +1151,7 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 	 * again.
 	 */
 	if (kvm_dirty_log_manual_protect_and_init_set(kvm))
-		kvm_mmu_split_huge_pages(kvm, start, end);
+		kvm_mmu_split_huge_pages(kvm, start, end, 0);
 	write_unlock(&kvm->mmu_lock);
 }
 
-- 
2.41.0.rc0.172.g3f132b7071-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
