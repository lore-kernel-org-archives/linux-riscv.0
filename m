Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5ACC04FDF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 23:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3AXiIGPI1u3s2nMJAFyK5/q0+69tRB7cM2MLQtMEhwg=; b=I7ou+LlN+mIn2xbmp9U/AZtNrD
	DbpJmzrD2dPVWzBrEsihHd1bPmUNP4uT69VLxA2oVapFwR4+/B8AiWiO3FpSXcnYEIoXENVxHW954
	6wG2co2aDx7SKTj+bXOPpG4bohFjtGce1Y+N/2HNMLT1iVpZhti1VfJlUIXpZrqBcN3A7IZccMj0z
	yK55HHekWwbnn0udDmFuR2jQHdfMW6gVpvZ2P9hD+eJ2/EOEsOqNPucXG5JE7bvWnSYt70Vci7LZi
	SFF8ldffl1lgyaO+Mk3XtVWUyZo/Vpcphr5GrmzR2mkk/IJxRn0zz37EPUEIBdyPZFgnSlkuh6kuy
	vCIqOMuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVtu-003dZw-1l;
	Tue, 08 Aug 2023 23:14:06 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVtc-003dBU-0q
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 23:13:51 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-6bd06019013so2707265a34.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 16:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691536425; x=1692141225;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CwKTqZRHBF6wuN1C9cAW2HapO35gWwZnaXscRj6lwnc=;
        b=2WhdyxPqAZMQPm2b5LDRFghWynjBi1UCopSK1ma1kbSftgbyoXHvV4F9IDWxcU9bjD
         x/E9HP43OeHzZX28ncf+Kk6FnjBLF/r9fVsQhiqEHw1zjRX24sDt0GrY2/p3GalF1S2v
         N5lNsSn9Na5ATp2cklHDX8LTBtETR2s+9HHST3Ohuu7lmur160dOSvrfZ/KSaEE1NZwE
         MTqoVPht1r4GCjkIudPtbkdQsI5Nu98lnQML5VoXE8em5TrezcFzlkSPwtr/1nuEkMDe
         WUXQqHSd/d2erJlQAn4TX7ybCyK2/vQdT6g7QkZRS1d+VIMG2dqDkc81KuQJiZISQlHN
         UINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691536425; x=1692141225;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CwKTqZRHBF6wuN1C9cAW2HapO35gWwZnaXscRj6lwnc=;
        b=NV1W7SH8LWN5YYxQYReXjJ8r7uDxeYeOc/wLsGqJErUfHbjDPqAGXj/ELRSNASnpab
         wg7WzojxwamR/sDG/izP0wW9mTxoE1/cNN093QUJf3v8cfZkj4PPjuJycwxIT6AQENBR
         ErDCjnSAKfLmpvVwGmYBw7dpskxXkQQ9yeuGhX1rvf47GwvpdzQ+/evgt/jcYaOMXdxK
         yRpzqFZc0vY8pPWyAGe4TUEKNgwRCLAsbwAwGGURF4PotRd81OKoX/LoY813At9fBp7b
         7MnuBQfCG54Z/uL2uKewfh9MLMPp9AgP2iwBN4t16oS3lEkbT/+VanHehslTYvHQ2cym
         CXLg==
X-Gm-Message-State: AOJu0YwCxRro6ltLF6lqYLagqNeCnRmY0/wDGrw5F40PN2pW1ZG9ognF
	64TMoSeL7AJjpdANFNuWITOBo7B1Sf23
X-Google-Smtp-Source: AGHT+IF6ugFOVb6y8tlgF6YsRwtDTq1sT4bykRxLroalTTYHrfBZlxunAEzdOs30Q1iqHJ3u3x2Z2p1PQHN7
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6870:8c0f:b0:1bb:ad9e:2978 with SMTP
 id ec15-20020a0568708c0f00b001bbad9e2978mr334671oab.10.1691536425651; Tue, 08
 Aug 2023 16:13:45 -0700 (PDT)
Date: Tue,  8 Aug 2023 23:13:26 +0000
In-Reply-To: <20230808231330.3855936-1-rananta@google.com>
Mime-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230808231330.3855936-11-rananta@google.com>
Subject: [PATCH v8 10/14] KVM: arm64: Define kvm_tlb_flush_vmid_range()
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
	kvm@vger.kernel.org, Gavin Shan <gshan@redhat.com>, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_161348_325585_F35C85A4 
X-CRM114-Status: GOOD (  10.09  )
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

Implement the helper kvm_tlb_flush_vmid_range() that acts
as a wrapper for range-based TLB invalidations. For the
given VMID, use the range-based TLBI instructions to do
the job or fallback to invalidating all the TLB entries.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 10 ++++++++++
 arch/arm64/kvm/hyp/pgtable.c         | 20 ++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 8294a9a7e566d..5e8b1ff07854b 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -754,4 +754,14 @@ enum kvm_pgtable_prot kvm_pgtable_stage2_pte_prot(kvm_pte_t pte);
  *	   kvm_pgtable_prot format.
  */
 enum kvm_pgtable_prot kvm_pgtable_hyp_pte_prot(kvm_pte_t pte);
+
+/**
+ * kvm_tlb_flush_vmid_range() - Invalidate/flush a range of TLB entries
+ *
+ * @mmu:	Stage-2 KVM MMU struct
+ * @addr:	The base Intermediate physical address from which to invalidate
+ * @size:	Size of the range from the base to invalidate
+ */
+void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
+				phys_addr_t addr, size_t size);
 #endif	/* __ARM64_KVM_PGTABLE_H__ */
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index aa740a974e024..5d14d5d5819a1 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -670,6 +670,26 @@ static bool stage2_has_fwb(struct kvm_pgtable *pgt)
 	return !(pgt->flags & KVM_PGTABLE_S2_NOFWB);
 }
 
+void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
+				phys_addr_t addr, size_t size)
+{
+	unsigned long pages, inval_pages;
+
+	if (!system_supports_tlb_range()) {
+		kvm_call_hyp(__kvm_tlb_flush_vmid, mmu);
+		return;
+	}
+
+	pages = size >> PAGE_SHIFT;
+	while (pages > 0) {
+		inval_pages = min(pages, MAX_TLBI_RANGE_PAGES);
+		kvm_call_hyp(__kvm_tlb_flush_vmid_range, mmu, addr, inval_pages);
+
+		addr += inval_pages << PAGE_SHIFT;
+		pages -= inval_pages;
+	}
+}
+
 #define KVM_S2_MEMATTR(pgt, attr) PAGE_S2_MEMATTR(attr, stage2_has_fwb(pgt))
 
 static int stage2_set_prot_attr(struct kvm_pgtable *pgt, enum kvm_pgtable_prot prot,
-- 
2.41.0.640.ga95def55d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
