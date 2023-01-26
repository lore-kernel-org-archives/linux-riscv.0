Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C1BC54EAA
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 19:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PwRDLXwEZxlWYWecb0TZCWhSFDeA+PmqzIxGFIEuyg0=; b=ZGffh1AdLyPHZOyOgN+iNaKFZ5
	+mtaC7Y3S/6UCBdZb2PCgkGWKOkGv9k4kozvmrmew8q0zjpOI/wJsqYtCisrjzRV90fk1xX4dnxcp
	ElCtD9UAdkBkSIZ//pc95i60IimVAVAMnchL8qC3nfHHCbiKxq2PgeV203pLXuAR2tMGKugSgAI0p
	nQuuTZUqL19KaquI7my11Cj6lG+X4ke00xSL8wUz4UPhthwC+1OXB5PkTvE5Rvm/CuLKiuTGC4efC
	VQ1KjriMY5BYRMxHNcbU76NrwgrfKVxT+Dc7AIzqlbIIMOfssdmIlzlMQiA6qNWjtsElbM8A1dG9C
	Jko0JJdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL8Gy-00COiw-26; Thu, 26 Jan 2023 19:51:00 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL7B2-00CAaS-I4
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 18:40:52 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-4ff7c6679f2so29685097b3.12
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jan 2023 10:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fYo1QkIhSVZeHSzALDDU8J+gIjGzOBs4iF8dI9WHJaI=;
        b=XtpoXrhy2rHdAzZgIBGT/PpU/B+14+2DiihYjtwNXYwCnPl93EFPcg73sjusrpK1EU
         JZTQ3FweXmy5njYY63ANBWzyE0RB8W3WxjKA87kjYxDBRGIvlMrKdHLjuAlIgG4h36mK
         NX62Y+rf9lcWKjwJxtJgr6FsDnQWFy39tkM07iygvyXBzqfnTgt3kK5jtKjE0IIZdkNr
         cqwEX4Qy+TOwmCam2ZyPnSSDvf18PHkpaIzO6gGANdQ/qsxR+mqmtq/nBfs9Sq2URXNK
         8CIXUdJneD8W2ZadFbp9a7eRtO+YWiliIEv6SZczVCGiis4I0cU5yUKEnRASzrtcFzh8
         uCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fYo1QkIhSVZeHSzALDDU8J+gIjGzOBs4iF8dI9WHJaI=;
        b=bF/tNQR9lVw7pc0Pgrv+tXpD/trRmZAvs/bAsl3RF9poHszPPu+Pc/6rhhmKC0Mhbv
         w6Uy6WX8CTAWfFaDj1dL9NE4nAy43URqIHpeWUiGM2sNwQ/B+FOhSWc6wuVtNpvbUDcP
         r+eo4pwMGcX/cPqpPNgRUOmUbWx6EEE9q4gFxz6v4tjyY23Vz584BHOH78vYt8N+8E9M
         PEOXkDaZiO+rjEgO2Nlr5bp2B3+2X4zf0Vpf2uUnbCEEJg/fNdf3EnWKe3KuIpBZHaoJ
         B3kNM/D4Xu9iMKbW4NSgu0dJ4ku1LJL2pdpCo/FHbamRxPzY4cmP7R/t3hD1UikksQzL
         RrXw==
X-Gm-Message-State: AFqh2kp+XMdePwEQzSJDl/H72JFPNSRHN7dSPFutO9XxIprRDp9wc0Xa
	IN9X2bufkqMGK5Zc3c7pBytJ6ttWIg8heA==
X-Google-Smtp-Source: AMrXdXt4+cEudOMUQ+wmd2s6+inK0nZHf04IpM9LI66+wdfbYuk0qDByjFe/kn38T2DiSoaNDbGQN4nimnoacw==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:a87:0:b0:800:ea7e:bb0 with SMTP id
 129-20020a250a87000000b00800ea7e0bb0mr3066381ybk.516.1674758447197; Thu, 26
 Jan 2023 10:40:47 -0800 (PST)
Date: Thu, 26 Jan 2023 10:40:22 -0800
In-Reply-To: <20230126184025.2294823-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230126184025.2294823-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230126184025.2294823-5-dmatlack@google.com>
Subject: [PATCH v2 4/7] KVM: x86/mmu: Rename kvm_flush_remote_tlbs_with_address()
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	David Matlack <dmatlack@google.com>, Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_104048_645153_64F8C18B 
X-CRM114-Status: GOOD (  10.83  )
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

Rename kvm_flush_remote_tlbs_with_address() to
kvm_flush_remote_tlbs_range(). This name is shorter, which reduces the
number of callsites that need to be broken up across multiple lines, and
more readable since it conveys a range of memory is being flushed rather
than a single address.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 14 +++++---------
 arch/x86/kvm/mmu/mmu_internal.h |  7 +++----
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index b257f937d8a4..215a8b7f5e03 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -247,8 +247,7 @@ static inline bool kvm_available_flush_tlb_with_range(void)
 	return kvm_x86_ops.tlb_remote_flush_with_range;
 }
 
-void kvm_flush_remote_tlbs_with_address(struct kvm *kvm,
-		u64 start_gfn, u64 pages)
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, u64 start_gfn, u64 pages)
 {
 	struct kvm_tlb_range range;
 	int ret = -EOPNOTSUPP;
@@ -5826,9 +5825,8 @@ slot_handle_level_range(struct kvm *kvm, const struct kvm_memory_slot *memslot,
 
 		if (need_resched() || rwlock_needbreak(&kvm->mmu_lock)) {
 			if (flush && flush_on_yield) {
-				kvm_flush_remote_tlbs_with_address(kvm,
-						start_gfn,
-						iterator.gfn - start_gfn + 1);
+				kvm_flush_remote_tlbs_range(kvm, start_gfn,
+							    iterator.gfn - start_gfn + 1);
 				flush = false;
 			}
 			cond_resched_rwlock_write(&kvm->mmu_lock);
@@ -6183,8 +6181,7 @@ void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end)
 	}
 
 	if (flush)
-		kvm_flush_remote_tlbs_with_address(kvm, gfn_start,
-						   gfn_end - gfn_start);
+		kvm_flush_remote_tlbs_range(kvm, gfn_start, gfn_end - gfn_start);
 
 	kvm_mmu_invalidate_end(kvm, 0, -1ul);
 
@@ -6573,8 +6570,7 @@ void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
 	 * is observed by any other operation on the same memslot.
 	 */
 	lockdep_assert_held(&kvm->slots_lock);
-	kvm_flush_remote_tlbs_with_address(kvm, memslot->base_gfn,
-					   memslot->npages);
+	kvm_flush_remote_tlbs_range(kvm, memslot->base_gfn, memslot->npages);
 }
 
 void kvm_mmu_slot_leaf_clear_dirty(struct kvm *kvm,
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index cc58631e2336..3bb21d29d84c 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -170,14 +170,13 @@ bool kvm_mmu_slot_gfn_write_protect(struct kvm *kvm,
 				    struct kvm_memory_slot *slot, u64 gfn,
 				    int min_level);
 
-void kvm_flush_remote_tlbs_with_address(struct kvm *kvm,
-					u64 start_gfn, u64 pages);
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, u64 start_gfn, u64 pages);
 
 /* Flush the given page (huge or not) of guest memory. */
 static inline void kvm_flush_remote_tlbs_gfn(struct kvm *kvm, gfn_t gfn, int level)
 {
-	kvm_flush_remote_tlbs_with_address(kvm, gfn_round_for_level(gfn, level),
-					   KVM_PAGES_PER_HPAGE(level));
+	kvm_flush_remote_tlbs_range(kvm, gfn_round_for_level(gfn, level),
+				    KVM_PAGES_PER_HPAGE(level));
 }
 
 unsigned int pte_list_count(struct kvm_rmap_head *rmap_head);
-- 
2.39.1.456.gfc5497dd1b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
