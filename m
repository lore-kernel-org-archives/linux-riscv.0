Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE91EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 00:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JoXWCMy4abdk7nHUU2fcPt5SIvsLZfol0kw83zh1F7Y=; b=YLtVPD5uGqKSEumzjnLI96kOw7
	lK6u3VqCQzK34MgiW69TTnahnqfr6V/ZLsgeLMVrTGrkzcPzCMPrk7jsGRKI1vgAivhUq16OFjfGB
	jWZ+h3BxW22oJlbmBGsYptIzFIBlRYEjlYvCgTsYANtzo+NfXZcjdHmqjL2OQLiCjO+Fj3NisSoNF
	V7LnkFezuBCu/vXZd/KRaQc3XXxnRBq025MbtfplyF5NdHm8WDUhtE1+uFTFqqGQhhedEt0NYzA6K
	O1eXv8TN4QX9VYFZ5zRgIYcgNjdQGCGlq/DZiBHf3+m40rxMZV59Vv018MRoVEz0F+S860MpeOcHw
	AsefojmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKTYa-007aXm-2F;
	Sat, 15 Jul 2023 00:54:44 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKTYB-007aDW-18
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 00:54:23 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-3a1ec37ccbbso4170872b6e.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 17:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689382458; x=1689987258;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U4OZjoW9BqjNxcy4RlxY9pkc5PoIDGveDxU+kXtMBcc=;
        b=KKRWmCcpJXud3QITKn5f94EERCBvnHfPo2Jd+ekvTDvit1ZKtL2At/rqLvkk4EbxYh
         bmv7L5z/I6o+5NvucbGQ3K/kzCTqCMksln5zbsw+MH51Mq23uoECcPykuMVuXgs/PZud
         5lgv/htkcYPoczACz2XxnIE0lYxBwMph7p2vFFTX1Bbj2MJhQ9+vg3FCoV+ZWqWxc0Fs
         8w/rrCxOr/GEutoHZlF+pVrS1gEqAxig3LcGCszVXObyi6SOjyH9F0QOp4wPuHsmLJot
         viR1y/i87qN0pJZ1fI3ZxyhwcGyqozylSHVo1vzB+ZQbxgU2/o0DLNIpJ0px4eAfctld
         qWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689382458; x=1689987258;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4OZjoW9BqjNxcy4RlxY9pkc5PoIDGveDxU+kXtMBcc=;
        b=HwTSBu6sXIYlbc+lq/6WyMHN1A23Z3VI0Y0Dzvk5Mk/SD1yUwQI0xiC8dn/gG1fntA
         wqo9D2b1sHWM45sYDLFsrZAyS2PxvCwB85gH5ekabMMjSJ7jx6illpN6VX+nm7F+mxqc
         2ptSv977URvz0vPn87gve3rmeL9stzhZU6FsdrUnTVk8buU4OIQu8KgvsZ8XZY2pArbn
         e3ObPXZexhKZr6b4/PEBt09GTLitpUI1b2OBo9Vu5w+Hbo0baCJedmNEwrVxFOQOTIUM
         Xtf06VPx5hGZtGLdCV2Q/R5jE/Lp8cCWx2gDPubLMTz28OvFixUu1HGxNSBtR2ndPEgZ
         t4aA==
X-Gm-Message-State: ABy/qLZya4j4UIuC4uvjFtp2B515exrzcz7m4DPoNsqGTrCeabFXTY1e
	N+4bGJnW1e7k/vqXoXDy+9NQfcA1+r4c
X-Google-Smtp-Source: APBJJlHuS8cIctisxFR2eCx11We7uRlijX+IqW5kBp1R23rbpuDDG4OLeHpdRXsyz6OpKgpcWVQKaGIlx/8R
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6808:d4f:b0:3a4:26e5:8b24 with SMTP id
 w15-20020a0568080d4f00b003a426e58b24mr7748513oik.9.1689382458208; Fri, 14 Jul
 2023 17:54:18 -0700 (PDT)
Date: Sat, 15 Jul 2023 00:54:01 +0000
In-Reply-To: <20230715005405.3689586-1-rananta@google.com>
Mime-Version: 1.0
References: <20230715005405.3689586-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.455.g037347b96a-goog
Message-ID: <20230715005405.3689586-8-rananta@google.com>
Subject: [PATCH v6 07/11] KVM: arm64: Define kvm_tlb_flush_vmid_range()
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Raghavendra Rao Anata <rananta@google.com>, David Matlack <dmatlack@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Gavin Shan <gshan@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_175419_429169_B55C6B8F 
X-CRM114-Status: UNSURE (   9.15  )
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

Implement the helper kvm_tlb_flush_vmid_range() that acts
as a wrapper for range-based TLB invalidations. For the
given VMID, use the range-based TLBI instructions to do
the job or fallback to invalidating all the TLB entries.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 10 ++++++++++
 arch/arm64/kvm/hyp/pgtable.c         | 20 ++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 8294a9a7e566..5e8b1ff07854 100644
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
index aa740a974e02..5d14d5d5819a 100644
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
2.41.0.455.g037347b96a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
