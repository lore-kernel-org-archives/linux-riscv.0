Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378CCC10F1B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 19:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FPKcAYZ7+qhOpmSreYpP1j2eF81OJGrwKJyEdV3Ex2A=; b=Sp5jn8hrjagEeXh4ZRwHpHwXj0
	tBjGMWJ0nQ6emTtQ+B/3jyitPIqmJfApqd2kYoaTyCWakqLOECM9tFFapnXlnkV/DYb66Fw4bibBQ
	TWIQm14gDCjI3CVnUkUlMbt+mwVA/yj/yL1V7d6fH5m17NRQIbo+v6UL/PZzLEPAYEPpXTey378tB
	TZ94Se0p1/exY76/cEE3Ut1zg7D0vOuj8Ih9eKiBYMLVaYDhn/QIbPAg/taLKnyagIXhlEcCj+Loz
	5E4T849GhpTLrRlHa+nCAMCH0PAGXTck1zKYf+J79/CQiyEVFr8BYBQdjz3kMdeEVL7Si5i8nV95F
	Y2AIjIRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mks-009tZo-Mz; Thu, 08 Dec 2022 19:40:26 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3MkT-009t2W-O0
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:40:04 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-36810cfa61fso24785557b3.6
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4nLMUWhCbgygsyxQ4LP+FBPYpvg+KdNjD6AAx7BEWII=;
        b=rW1pkR31ur5/8vzbX6I0g9dHa5ieQLfxMNHl7/CiYy31x1gmEotFcgfb6bMg1XD9l4
         cVrOC8CHqZzC+Gd2V/LwvTlYuSZNohfxzCXcTVs+DyirYljuXOWNIY4uY7CZr2a2YKF5
         72eri2VmsAQGQbk2L3oKVAoFTeSQShiiqL6JV3UiQ4QZOs2UwURjWE1AFC0PhC62yXox
         X0dKf4S1b8a4rdREripCobtwsSCC9MJx4k5wGRfNkLSnee4Y5BiQ4yQ0Og5S8kz28vfk
         0som8w77mpuwlpN/KA9+tJzi+pYWYZboOtEkERDzhNWA7MhWTNWQZafjFT2UdiruzKAQ
         QPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4nLMUWhCbgygsyxQ4LP+FBPYpvg+KdNjD6AAx7BEWII=;
        b=fL50YpjdB5hu2x07E7xpkKkIFyev+tUwQz5EKvrwZx2so0vQrZpQFkb67uavuNQmwP
         1fS7vS+8+GTqri/YvoSeNxXbRoyzTGkF0VaAvcIGi8j+d5Icmbpx/NxYrjr6KixCB5bg
         A+TugP1LRAQEaP6Z2FQ/eObjU8Vkpd42Vq8a4y535X2TW8ax6rWU/a/zDDLzAvF+B8HH
         hcbsNsqo3pNeJDSg0S2lWx+Tjk1Msk+XiFziehOhFnYEVY5RVqCkFZ1uFJF5hhnwMgGi
         rReKxAfpriJFJ7XCjxwe8nA5zPlRtlNTcQS+QA/goMLw/NW9vcjx/VLW4pVxMyS/3Po9
         dO9Q==
X-Gm-Message-State: ANoB5pnDcnH5uZ8JH4qtFFKhbv+cwjfKOWvFeOS1O/8GPTWIjaebG0KT
	QRd9EjurDQPnigym2cSQBpHcF3pduWHxPg==
X-Google-Smtp-Source: AA0mqf5kUDO3Tr6gk/fzW/ARrxEhzmkAXRSHhWoL0H7mQ0gz5ri8bxcSR3iro0wxy+7xhENFLIaYZergQrtKPg==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:5:0:b0:6fc:8f88:813b with SMTP id
 5-20020a250005000000b006fc8f88813bmr27601586yba.629.1670528399532; Thu, 08
 Dec 2022 11:39:59 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:51 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-32-dmatlack@google.com>
Subject: [RFC PATCH 31/37] KVM: x86/MMU: Use gfn_t in kvm_flush_remote_tlbs_range()
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Matlack <dmatlack@google.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Nadav Amit <namit@vmware.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Krish Sadhukhan <krish.sadhukhan@oracle.com>, Ricardo Koller <ricarkol@google.com>, 
	Jing Zhang <jingzhangos@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_114001_809513_4453A8FE 
X-CRM114-Status: GOOD (  10.51  )
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

Use gfn_t instead of u64 for the start_gfn parameter to
kvm_flush_remote_tlbs_range(), since that is the standard type for GFNs
throughout KVM.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 2 +-
 arch/x86/kvm/mmu/mmu_internal.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 4a28adaa92b4..19963ed83484 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -244,7 +244,7 @@ static inline bool kvm_available_flush_tlb_with_range(void)
 	return kvm_x86_ops.tlb_remote_flush_with_range;
 }
 
-void kvm_flush_remote_tlbs_range(struct kvm *kvm, u64 start_gfn, u64 pages)
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages)
 {
 	struct kvm_tlb_range range;
 	int ret = -EOPNOTSUPP;
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index d35a5b408b98..e44fe7ad3cfb 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -65,7 +65,7 @@ void kvm_mmu_gfn_allow_lpage(const struct kvm_memory_slot *slot, gfn_t gfn);
 bool kvm_mmu_slot_gfn_write_protect(struct kvm *kvm,
 				    struct kvm_memory_slot *slot, u64 gfn,
 				    int min_level);
-void kvm_flush_remote_tlbs_range(struct kvm *kvm, u64 start_gfn, u64 pages);
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages);
 unsigned int pte_list_count(struct kvm_rmap_head *rmap_head);
 
 extern int nx_huge_pages;
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
