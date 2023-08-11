Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33F7EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 04:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GAABVTnITJkhTpierVM8pxi4/gSISfJcPbAfO//6dUM=; b=KDlBCwJPaoku1mXak6+R4MEZv3
	jNQ5cuBM3T1Itx7NipUWORoRLcfzEGPMmoUmxwyk+CxW2wE/91eZ0PtGQOtxMmG0YmibjQZ/Hsa8a
	CG5KObDE8ydWFD3KkHHQSQ5Z0djBfJ7EukJ/cukjKmBBAxbyBK4lWcueX8+DWddsrduzZ6rtvq9jb
	cnn7lB4LsMocinKdghNVLerdV2l3Os85+A3mHzg2BKMIMmGOMjCwR7v6HlB8Cmx3EU2i0Su1Xn+y4
	0rY6AMmAfFz05e2kqHvKZA+cvYoOMdFzDeXfvv/hfMNbM+AOc4oSfLNvoTk7xn/omHuIthQwwF+80
	jvmFbXQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUK95-009Qjk-37;
	Fri, 11 Aug 2023 04:53:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUK7y-009Pjp-2f
	for linux-riscv@bombadil.infradead.org;
	Fri, 11 Aug 2023 04:51:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=K3pnh3N/YIF0SxqOcKLFCFAu/7kR/Uv7ltNd2DAApng=; b=oI2Q+8/htJpeSjMfpqHE/Z61/k
	ZLgxqM9Lxp6iDXtPAJWUgtXuoxPnxjF5jOeXv/RQndrtar54/Y0FtWfz4fSI890dnamCNNG0jmIcZ
	y/MCRBnVVpldC82Tiy2GBaFSMF5QsskBBsiHUZcUAzWAYxqTyhayoBgioYULAJxb78RQ4STSRQbUg
	hhPDnddzVbEyBWQW0xtEWFhZhpm44DlSmh0x9gBC1qpJc+Dcx4Bxh9w0Q4VM5oTAGt/FL9tpjHkky
	qgB0CRby9cb6xKYGLlLv3o8YB+UtBCTP435rOE1+EbZxrIpAA+PBeDbAUNBWM1CvvPv/bG1yTVfaJ
	GF72UqLg==;
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUK7t-007HYM-1T
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 04:51:57 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-6bb31d627ebso1836851a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 21:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691729500; x=1692334300;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K3pnh3N/YIF0SxqOcKLFCFAu/7kR/Uv7ltNd2DAApng=;
        b=Q/eD8y0h2l6JvWr9yxmhkzDz3/gU+uCMrAapE+RfKfpEujedU2m/cioIEtNiwyWcDq
         6oU/mRQTOMuz+meNoZkHUXpRaB1Kf60Q4R97OmOR3SyHx7RuYNOseDNnfQaON1qyo5sp
         Yy7qpgB8KdX4r7NgDYWnxRanbAd0O25zsnOgYls8iU4oaEYwKOd4OuGHRAElOOULjwZ7
         zv+qj9vFVZl3xEcKvgpLumSuTYsp2PPSqwEIKmfHkh1NMsSMLhmU4qETWPBj1KkWIsjx
         AfAcpwHEssHw6PsET2R5l/KBjsPVbkindLK/jYg8Jg4IOgwBWrE2JstApGnRH9vE/HVL
         nJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691729500; x=1692334300;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3pnh3N/YIF0SxqOcKLFCFAu/7kR/Uv7ltNd2DAApng=;
        b=UPdxQ/WAH05KBqrz7UAvAiNKvJUTBpeC2Tax5StqJb7oQLfBN3a/8mdV3mKbhbUuC1
         POa7XfBRK5TUNBXatQazbYOuY2RclAsF77vqDtHNVLNydWU1Ecnxa3JRWZcGVltYTzTD
         oGbs/eUXJjEnv7jRTVgVlzkgTORLIPdqMHu+vOPC6tC6iZF1LkANQtEabzLBc6yj/dRD
         yhogknzrN2XiiqkKXPZonNZleS/dvDBSuj930hFW4joV9ZW+pDj5ZxrduqjqDmC0fVl+
         4vCZSkhCoTXTKU/gPKbFQMTr7iF+3Xy1FRPN9dF0Vfqu/KULW4YZlkm+SRzv7xcEoTXR
         SEhg==
X-Gm-Message-State: AOJu0Yw1cTsZDwp+uisAxv4GumfxeZdtpyKcHMf4GXRhA8hisp0DqyMx
	nRGMJstpNVjFt8Z/Y5QZEU87jlBp5WwF
X-Google-Smtp-Source: AGHT+IFGVe7NxFpz5VE0E4/WvtFaQI/uiF+IxB2dFVJtq+EJbiYPxTNleKK3q6v99h+PTIzxrx3AKKcqdkl2
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6870:7685:b0:1c2:d3de:c298 with SMTP
 id dx5-20020a056870768500b001c2d3dec298mr3535oab.11.1691729500567; Thu, 10
 Aug 2023 21:51:40 -0700 (PDT)
Date: Fri, 11 Aug 2023 04:51:18 +0000
In-Reply-To: <20230811045127.3308641-1-rananta@google.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230811045127.3308641-6-rananta@google.com>
Subject: [PATCH v9 05/14] KVM: Allow range-based TLB invalidation from common code
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
X-CRM114-CacheID: sfid-20230811_055153_640688_2FCD08A5 
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

From: David Matlack <dmatlack@google.com>

Make kvm_flush_remote_tlbs_range() visible in common code and create a
default implementation that just invalidates the whole TLB.

This paves the way for several future features/cleanups:

 - Introduction of range-based TLBI on ARM.
 - Eliminating kvm_arch_flush_remote_tlbs_memslot()
 - Moving the KVM/x86 TDP MMU to common code.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/x86/include/asm/kvm_host.h |  2 ++
 arch/x86/kvm/mmu/mmu.c          | 10 ++++------
 arch/x86/kvm/mmu/mmu_internal.h |  3 ---
 include/linux/kvm_host.h        | 11 +++++++++++
 virt/kvm/kvm_main.c             | 13 +++++++++++++
 5 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index a2d3cfc2eb75c..b547d17c58f63 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1804,6 +1804,8 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 		return -ENOTSUPP;
 }
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+
 #define kvm_arch_pmi_in_guest(vcpu) \
 	((vcpu) && (vcpu)->arch.handling_intr_from_guest)
 
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index ec169f5c7dce2..00f7bda9202f2 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -278,16 +278,14 @@ static inline bool kvm_available_flush_remote_tlbs_range(void)
 	return kvm_x86_ops.flush_remote_tlbs_range;
 }
 
-void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
-				 gfn_t nr_pages)
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages)
 {
 	int ret = -EOPNOTSUPP;
 
 	if (kvm_x86_ops.flush_remote_tlbs_range)
-		ret = static_call(kvm_x86_flush_remote_tlbs_range)(kvm, start_gfn,
-								   nr_pages);
-	if (ret)
-		kvm_flush_remote_tlbs(kvm);
+		ret = static_call(kvm_x86_flush_remote_tlbs_range)(kvm, gfn, nr_pages);
+
+	return ret;
 }
 
 static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index);
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index d39af5639ce97..86cb83bb34804 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -170,9 +170,6 @@ bool kvm_mmu_slot_gfn_write_protect(struct kvm *kvm,
 				    struct kvm_memory_slot *slot, u64 gfn,
 				    int min_level);
 
-void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
-				 gfn_t nr_pages);
-
 /* Flush the given page (huge or not) of guest memory. */
 static inline void kvm_flush_remote_tlbs_gfn(struct kvm *kvm, gfn_t gfn, int level)
 {
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ade5d4500c2ce..89d2614e4b7a6 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1359,6 +1359,7 @@ int kvm_vcpu_yield_to(struct kvm_vcpu *target);
 void kvm_vcpu_on_spin(struct kvm_vcpu *vcpu, bool yield_to_kernel_mode);
 
 void kvm_flush_remote_tlbs(struct kvm *kvm);
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages);
 
 #ifdef KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE
 int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min);
@@ -1488,6 +1489,16 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
 #endif
 
+#ifndef __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+static inline int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
+						    gfn_t gfn, u64 nr_pages)
+{
+	return -EOPNOTSUPP;
+}
+#else
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages);
+#endif
+
 #ifdef __KVM_HAVE_ARCH_NONCOHERENT_DMA
 void kvm_arch_register_noncoherent_dma(struct kvm *kvm);
 void kvm_arch_unregister_noncoherent_dma(struct kvm *kvm);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d6b0507861550..26e91000f579d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -366,6 +366,19 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
 }
 EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs);
 
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages)
+{
+	if (!kvm_arch_flush_remote_tlbs_range(kvm, gfn, nr_pages))
+		return;
+
+	/*
+	 * Fall back to a flushing entire TLBs if the architecture range-based
+	 * TLB invalidation is unsupported or can't be performed for whatever
+	 * reason.
+	 */
+	kvm_flush_remote_tlbs(kvm);
+}
+
 static void kvm_flush_shadow_all(struct kvm *kvm)
 {
 	kvm_arch_flush_shadow_all(kvm);
-- 
2.41.0.640.ga95def55d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
