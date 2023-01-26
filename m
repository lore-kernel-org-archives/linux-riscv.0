Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D2BC05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 19:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+Io680xuhzTx8LFE2auN7t+PrdJvohanIQROGfe+8nQ=; b=mVbYIt4z45y+EF1pUAD2UE4jHM
	RBEZgMiEkmR/LwHy67yoOWAn8mSnjqPfjvn7ITDBteIIaXCxO3LRZubSN86zUSqDOiLVsImO8h6UB
	3WGe+F6IrWNyT5AjKF63jNxsmpSjYMAViKkyRRGS5ynQI+Kye6mN1n3va81ARz3JBO1NxAxIXlr1p
	8ICs3toMl+v8LF/sGsuhFznK0G0Tc+PQoDifIn9Ww1fH5afSIaBUHFXy+n9UxVeOfzliqB+TjjuDl
	MV7Ue5mGiIwW3u8/BkegvUVhtCCICp8LWGWYuHZaWvjr2qewEmlVpKSkYlHls3FFAZ//p7X2BF9pD
	vDS1SnRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL7W4-00CF7b-0h; Thu, 26 Jan 2023 19:02:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL7W0-00CF6J-RQ
	for linux-riscv@bombadil.infradead.org; Thu, 26 Jan 2023 19:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ezUgtXKhXuPYjha0ePsG0F4btuD50o3umoewEXzLrYo=; b=mYPRje7VjzdPMMMgUQFePrmjnH
	3vTG+d588K4HloRlL806f9DqAOF44T0CLfRFRU11/i/5VIgaUyQ3gBA6Ry3R3LQsNZwCJ18/qLytG
	O6QWo4TqiQSY9crLzuIOvzsz2tmkrerUbjRlqj1CnPs2SeXU4+GFVzHtyqoUze0aot5ioGAcY4Faq
	OVi9Iwh4hiUukcDZLtg4AmM/ftb3iJJPtP875zXmXpIUsKAYw8cpWMcfWmu7f0qDvSD8eh11NC/5X
	UExO6HTkg+NdAntwgJZ0AEezjMxchosmxd0qARg9uzitOwKQvO4hxyzYbzpQxJwFv2LnihCB/NzZ9
	LGrKFfBA==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pL7Ah-002WjU-1h
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jan 2023 18:40:41 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id c2-20020a25a2c2000000b008016611ca77so2744615ybn.9
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jan 2023 10:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ezUgtXKhXuPYjha0ePsG0F4btuD50o3umoewEXzLrYo=;
        b=Gpsqv88RToC4u5Pj2L8SL3R5JmaiEzsseLsKjAGf2W0ai4XCaxcEaZ40FOPplTN3Vf
         VWWZzjE3wvU4Omx/EMDJWor6p+CtVw0vx0kDX4wR56THOvuviIRRUdTOkdAkpumMlSPj
         2zThrcMr4+h/AOO7bVBaZwevOoeLNgtReYqVQJMGTPSO1q03cu0HXb5a+PX1OeH6hg2l
         3Jofp5ODG6BhmiK9Qwhevnx1voxW8epNatR33FNb9J447ubNEHUzqrKe76y9VpF6Z5H6
         jWIm+4zdMRwjYA9FmNVHnCZBKD8f7tIeSPpFlW7q4hW2EeGrxce34SDvzpd92ahkOFeM
         ACqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezUgtXKhXuPYjha0ePsG0F4btuD50o3umoewEXzLrYo=;
        b=6zdJXfl6P9j+iLrhkf23j1HrTN6Og+9HulQLUsqjmCgjL9jw/szhkZf1Q2Fv5cQv7f
         mqCPDqpUDTH4S/iKbvfZ/WUxNGLeWrqcD3Uon7kzXgkhnu1PG8v65ubp+z/Ca1vdo3vz
         G1OW7A8WhxJwTmdclhGPgVT5cSNfqU4+vn7CNd4QwfQzJKoIZU/GBiKCz3aunAqY8OLs
         cIqrFFb0Lyik2dEs8CCTRBZdw2zVHlkcgKX2mx/bJwKEpftJLVtMT97yquWD3Jn3SchN
         EJerLxJMjS8O8tQ+dngUbh2UXZwutHELJnBPV2Y3z+pNPyZSMkN6Kj+WTRrNymShdoep
         8V/Q==
X-Gm-Message-State: AO0yUKXsHjx5SrpwoMSm5GPWq3GzShZABv2A5FA+b75gCtGedZaGkLls
	64xvlXiti6EN1NzPJJ2/U0SkvfprfqNvMw==
X-Google-Smtp-Source: AK7set8bVJ/lfXxo8mtCMuZKx7MZIeH+UU2DJ/YhhlgL2AZRSTGRffnv0EiriJ0BPSKw5ZpJDDFOnX5KH94/1Q==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a0d:e701:0:b0:506:66f5:fd24 with SMTP id
 q1-20020a0de701000000b0050666f5fd24mr1102441ywe.130.1674758450457; Thu, 26
 Jan 2023 10:40:50 -0800 (PST)
Date: Thu, 26 Jan 2023 10:40:24 -0800
In-Reply-To: <20230126184025.2294823-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230126184025.2294823-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230126184025.2294823-7-dmatlack@google.com>
Subject: [PATCH v2 6/7] KVM: Allow range-based TLB invalidation from common code
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
X-CRM114-CacheID: sfid-20230126_184027_687565_DE932DF9 
X-CRM114-Status: GOOD (  14.27  )
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

This paves the way for several future features/cleanups:

 - Introduction of range-based TLBI on ARM.
 - Eliminating kvm_arch_flush_remote_tlbs_memslot()
 - Moving the KVM/x86 TDP MMU to common code.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/include/asm/kvm_host.h |  3 +++
 arch/x86/kvm/mmu/mmu.c          |  5 ++---
 arch/x86/kvm/mmu/mmu_internal.h |  2 --
 include/linux/kvm_host.h        |  9 +++++++++
 virt/kvm/kvm_main.c             | 13 +++++++++++++
 5 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 561d31d9a7da..6b2d6ced87ef 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1816,6 +1816,9 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 		return -ENOTSUPP;
 }
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages);
+
 #define kvm_arch_pmi_in_guest(vcpu) \
 	((vcpu) && (vcpu)->arch.handling_intr_from_guest)
 
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 34b670e719af..284c812db63b 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -247,7 +247,7 @@ static inline bool kvm_available_flush_tlb_with_range(void)
 	return kvm_x86_ops.tlb_remote_flush_with_range;
 }
 
-void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages)
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages)
 {
 	struct kvm_tlb_range range;
 	int ret = -EOPNOTSUPP;
@@ -258,8 +258,7 @@ void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages)
 	if (kvm_x86_ops.tlb_remote_flush_with_range)
 		ret = static_call(kvm_x86_tlb_remote_flush_with_range)(kvm, &range);
 
-	if (ret)
-		kvm_flush_remote_tlbs(kvm);
+	return ret;
 }
 
 static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index);
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index 0dba4d8304a6..45de82d8e162 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -170,8 +170,6 @@ bool kvm_mmu_slot_gfn_write_protect(struct kvm *kvm,
 				    struct kvm_memory_slot *slot, u64 gfn,
 				    int min_level);
 
-void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages);
-
 /* Flush the given page (huge or not) of guest memory. */
 static inline void kvm_flush_remote_tlbs_gfn(struct kvm *kvm, gfn_t gfn, int level)
 {
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9366fea46e30..276187f084c8 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1356,6 +1356,7 @@ int kvm_vcpu_yield_to(struct kvm_vcpu *target);
 void kvm_vcpu_on_spin(struct kvm_vcpu *vcpu, bool yield_to_kernel_mode);
 
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
2.39.1.456.gfc5497dd1b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
