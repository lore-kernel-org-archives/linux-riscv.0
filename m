Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726CBC6379F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 18:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Un/t0TEjV90uLpQhMrQCSi7wzALPTJOeoLOPMGiXRa4=; b=l3hSEbErsC/vMnzlKkRpd9hI2X
	uYG/w2PwPDVE7cskXVMiC7Ttc+70Y6wcDvYt0V1Jvcb3EQtQkOBx3nWys4BXJXbnofkYoc9H7mX6g
	wNtxb8XpaV4VAxS2/ZC/wULg1WyIVuZ+09MMGH7WgHgBqpLPRAt/v2HFqv+p/rLb8MUZAAe+meLM+
	UY+bRA9s4dBwhGSmpkd+dhdl/wYNOLw6lZI6gM1pa6gwmI8xE6OEjIXy8boCDiCvxu5YRFFJVzbx6
	RgPQzrlc/xEuR9oSUT+5u0qs8y7wR3wAkpyhHTBk5cL5mZaCgCgl5UhGGj0/Dq4+FRENnST5KyKUY
	YiErb5gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZFI-006RGg-Kt; Thu, 19 Jan 2023 18:02:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZF5-006R9M-GI
	for linux-riscv@bombadil.infradead.org; Thu, 19 Jan 2023 18:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uRsWL56kSi67VtsSY7eQAHDzJKepa9d7c1+Ibj0vcQE=; b=m8mbvQDOd7hQ4rMGuvsBXqp1dG
	eDilTvtk8S3FwsvLcLtsiUrg6Yy0nnR9GuGzKMs0stETX5t7Et3Lhd1v2NKxa7Bwp5gWK6KyC3R6/
	CopH3IidnLd82axnTq/pFcRJM/GoVJ8m/LWN44XPHWwaQzmoAI0SNhIo/hYzhvvLxCXDwYkn4/EOi
	GXtQmTuzzI/vBufXl1Q2obl2BncFzZ0GG+Q07AlN+M1JuK3GMxCExKgCBwNACPQlNXHtxeZG5P+bi
	JEJ0o90J1C5Ff9IN2a4RIIf3CG5KsBoDD0wLtdDXsRxGLVHFfw9wvkFLEUxkhw4afYMcuPeJDvUza
	vOS1VN6Q==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pIYpQ-000NaT-1p
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jan 2023 17:36:02 +0000
Received: by mail-pl1-x64a.google.com with SMTP id p15-20020a170902a40f00b00192b2bbb7f8so1740531plq.14
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 09:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uRsWL56kSi67VtsSY7eQAHDzJKepa9d7c1+Ibj0vcQE=;
        b=gdGKLjSmqiX0cZ4pDCgzo2Y0Hyb2rjNgz7MfmYG1QliR3dntIqZmp0W8DNiCubrZO1
         XsKZLH7MrwgaCgv+5+A2LrwtrkYwB/JhwPa0G9QSb1a+ZOBIs/d+0rd6/3sCTB3he/EF
         w+T3HbOsaFwiWm2ryF+AZedsM3RjPq7l/aAuD6VoXBPScK1ekZ0lYVASS6RGuJaLya4i
         y4D1SF2w+A4KK/c/bvLEOBKiq8/KzVXEUr+4XVpi7H/56swFVF2GGkxBdeI5TeL1PB5t
         UFJqbf3AxHGvKpyee1QezxYYmacb1TRuX4uDlTJBNOQNoQU7VIrHZHHOLMTZcAImPV3R
         mrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRsWL56kSi67VtsSY7eQAHDzJKepa9d7c1+Ibj0vcQE=;
        b=A7WRo4OsvDNSSRI/TqrapkH0/IFsq8cIM5vbsTJHFpuaqQuvG+hcjwHsX/KVC1Hblo
         ScBVrrSgn/Eh47HmeVjFNmK88dNRHmv8gbWHXqh5dc4UN4Jc8wRRQ24UxdTcdZ6CKp2W
         tBoCN2N0MewMEih0bn+w84ddSg8UrqOsZwSPV+DCjzo8prKD1EIuaqe5+UMVsM/DI72e
         o+h9Sn/ED+bpkfMvu3X4lVZxMtCJhG972lnenQkF9kl+1mihHygC2HY/O/++5Yz2gUpm
         0ejR2faBOfq+m8aBldP6fYc0LvSn7VacPLBeWk0f7+Tn32CYk/4qJzMPAWwOMJreQLiD
         9uPQ==
X-Gm-Message-State: AFqh2koNoFlYUP/+mjQsvLhmfleMKz8updRfKTcnEBfnAR6SEtsbnheu
	EoiVIkxirUtUw+/3vyHjexmZsWutm2m50w==
X-Google-Smtp-Source: AMrXdXt+vZkjJ1zTNoZ5Qo+DVNwjuzxDWfY3Xw9nwrJNx+t6oQZNxW3uxoy7KZtRAAY7IFKfRsyg6/TxW0wYVw==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a63:3116:0:b0:477:7f69:2749 with SMTP id
 x22-20020a633116000000b004777f692749mr930497pgx.372.1674149781458; Thu, 19
 Jan 2023 09:36:21 -0800 (PST)
Date: Thu, 19 Jan 2023 09:35:58 -0800
In-Reply-To: <20230119173559.2517103-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230119173559.2517103-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Message-ID: <20230119173559.2517103-7-dmatlack@google.com>
Subject: [PATCH 6/7] KVM: Allow range-based TLB invalidation from common code
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
X-CRM114-CacheID: sfid-20230119_173557_124775_F3E24A76 
X-CRM114-Status: GOOD (  13.73  )
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

Make kvm_flush_remote_tlbs_range() visible in common code and create a
default implementation that just invalidates the whole TLB.

This paves the way for several future cleanups:
 - Introduction of range-based TLBI on ARM.
 - Eliminating kvm_arch_flush_remote_tlbs_memslot()
 - Moving the KVM/x86 TDP MMU to common code.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/include/asm/kvm_host.h |  3 +++
 arch/x86/kvm/mmu/mmu.c          |  5 ++---
 arch/x86/kvm/mmu/mmu_internal.h |  1 -
 include/linux/kvm_host.h        |  9 +++++++++
 virt/kvm/kvm_main.c             | 13 +++++++++++++
 5 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 1bacc3de2432..420713ac8916 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1799,6 +1799,9 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 		return -ENOTSUPP;
 }
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages);
+
 #define kvm_arch_pmi_in_guest(vcpu) \
 	((vcpu) && (vcpu)->arch.handling_intr_from_guest)
 
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 1e2c2d711dbb..491c28d22cbe 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -246,7 +246,7 @@ static inline bool kvm_available_flush_tlb_with_range(void)
 	return kvm_x86_ops.tlb_remote_flush_with_range;
 }
 
-void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages)
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages)
 {
 	struct kvm_tlb_range range;
 	int ret = -EOPNOTSUPP;
@@ -257,8 +257,7 @@ void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages)
 	if (kvm_x86_ops.tlb_remote_flush_with_range)
 		ret = static_call(kvm_x86_tlb_remote_flush_with_range)(kvm, &range);
 
-	if (ret)
-		kvm_flush_remote_tlbs(kvm);
+	return ret;
 }
 
 static void mark_mmio_spte(struct kvm_vcpu *vcpu, u64 *sptep, u64 gfn,
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index 851982a25502..d5599f2d3f96 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -164,7 +164,6 @@ void kvm_mmu_gfn_allow_lpage(const struct kvm_memory_slot *slot, gfn_t gfn);
 bool kvm_mmu_slot_gfn_write_protect(struct kvm *kvm,
 				    struct kvm_memory_slot *slot, u64 gfn,
 				    int min_level);
-void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages);
 unsigned int pte_list_count(struct kvm_rmap_head *rmap_head);
 
 extern int nx_huge_pages;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 76711afe4d17..acfb17d9b44d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1356,6 +1356,7 @@ int kvm_vcpu_yield_to(struct kvm_vcpu *target);
 void kvm_vcpu_on_spin(struct kvm_vcpu *vcpu, bool usermode_vcpu_not_eligible);
 
 void kvm_flush_remote_tlbs(struct kvm *kvm);
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 pages);
 
 #ifdef KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE
 int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min);
@@ -1484,6 +1485,14 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 }
 #endif
 
+#ifndef __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+static inline int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
+						   gfn_t gfn, u64 pages)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 #ifdef __KVM_HAVE_ARCH_NONCOHERENT_DMA
 void kvm_arch_register_noncoherent_dma(struct kvm *kvm);
 void kvm_arch_unregister_noncoherent_dma(struct kvm *kvm);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fefd3e3c8fe1..c9fc693a39d9 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -368,6 +368,19 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
 }
 EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs);
 
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 pages)
+{
+	if (!kvm_arch_flush_remote_tlbs_range(kvm, gfn, pages))
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
2.39.0.246.g2a6d74b583-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
