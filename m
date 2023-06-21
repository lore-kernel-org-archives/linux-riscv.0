Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB49DEB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 17:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2wznuZ/vg8vsN3epIKpZMFzHXPWREHMJFckODYhOfGs=; b=kuH4ROPtfPgxcAD92ss9mVXLZI
	67HoByGdkXQ8c7h+P9uwSsQtL7YwZvb0y3OjUtZiW7Rx8ms5fp07gymdiCKTcwNvyRNQvuARKVQJd
	0uF2rErllc+adIRbPlNjn3J0NcyBR8arsZpc636L9nCJPKouNLtqDUaJF6vISDK9H2ilB6UPjhlhL
	YWaccazj/2GOvA6ZSU+VXuyhIG1Pd7OUSHJtNCUzoeDpR/qoIXSTx6uXG8z/VB084IvjKxFwdedUu
	+UETDXkJcVOugY28563byNtGcQGo/ep7JTbLdCGIFXMT9shSz3iznMrtlgmw/Rv+2T93j5Pt2G8Kx
	LjAAJEig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC1yf-00FHHH-0r;
	Wed, 21 Jun 2023 17:50:45 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC1yL-00FGyB-2K
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 17:50:29 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-57059e6f9c7so121600757b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 10:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687369824; x=1689961824;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0kDWyMjxvoVHajO1/4l5o4Ja0nzeqDHBQgPru4Ca7PE=;
        b=W51l0QbnmbjxnmmCtuwRuWnx7YubpJlELQpz6rAW3Ho9+5KqkOCPFt4QfJFhF9nUon
         swbQ6/awYlUsaGqw5BY1VoyvwAIrabaj2ur+qqkzwJCB/NNcsB2TLmSfUM9bkTT6i+A4
         zv/DhDYK49UtrL7Z1+rgptqaq9Q8uY3WCpPrvORTrQzEtf3ZKyR4CgzAaNVPIg8XfIOf
         xKKHIilvW0Hfi14ytSJqddkZcKN0LZ/Uu1mc6Uy2aICfHITnrDdzhnZMCpDigz4Ko99J
         zUxuW1o5ZQsYlxMSD8Fc/hkLFRfGl05LWqyGqFNitmFJAcX2vJ9sDvETccbp+2+pgksv
         Gh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687369824; x=1689961824;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0kDWyMjxvoVHajO1/4l5o4Ja0nzeqDHBQgPru4Ca7PE=;
        b=FvCEwcqHVUlApULQ8quYEac57ZMG2njpfo6St627tkRUXYgXgUInZEfaC1ILxfWT7G
         Pvwwu3Rj5rmV0ISSC+XzYoLr6xAp88lrCHpCvbzglXo/a5mrQawndAtG78fk8jX6f2La
         Rks4oS/g8Fvqycj/ZTnK/WPKw/lJfehbWI5lRXb95Jq03uWXvEssEjo+19vE5xa3Q0wC
         a+QMekZyAPcEZUH4hkwty9LKnXu81xgCeZDE01CjkmQi0JtndHQisG9Zu1Pb4iCOns0i
         bin3+NlOI6RadCxGLr6VtyRnmxwSk2ZRGk7ZVYQZ+XxO0fFFtqH6yHJI92kx6vPptLs3
         VoUQ==
X-Gm-Message-State: AC+VfDwoYfLIBkug8u7Ytnzc1vkqiyQMpPzn+wYdWXvE9aQwJLmlJD1Z
	ccTrvOGhK41Gwd+0MdOY6uSU7B4OyUIF
X-Google-Smtp-Source: ACHHUZ5K+kZNE7AXUViYSzsrB/zmiZFidf9JUwCxGExwegY/ED1rp2aL7aai9sJtvuWZdoNkgZU1AlyUF8Hg
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a81:e545:0:b0:56c:e53d:ae90 with SMTP id
 c5-20020a81e545000000b0056ce53dae90mr7488843ywm.4.1687369823914; Wed, 21 Jun
 2023 10:50:23 -0700 (PDT)
Date: Wed, 21 Jun 2023 17:49:54 +0000
In-Reply-To: <20230621175002.2832640-1-rananta@google.com>
Mime-Version: 1.0
References: <20230621175002.2832640-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230621175002.2832640-4-rananta@google.com>
Subject: [RESEND PATCH v5 03/11] KVM: Allow range-based TLB invalidation from
 common code
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
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_105025_773836_277F5F55 
X-CRM114-Status: GOOD (  13.25  )
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
---
 arch/x86/include/asm/kvm_host.h |  3 +++
 arch/x86/kvm/mmu/mmu.c          |  9 ++++-----
 arch/x86/kvm/mmu/mmu_internal.h |  3 ---
 include/linux/kvm_host.h        |  9 +++++++++
 virt/kvm/kvm_main.c             | 13 +++++++++++++
 5 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index f6e3aa617d8b8..5c4dc547c030c 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1804,6 +1804,9 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 		return -ENOTSUPP;
 }
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages);
+
 #define kvm_arch_pmi_in_guest(vcpu) \
 	((vcpu) && (vcpu)->arch.handling_intr_from_guest)
 
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index c8961f45e3b1c..32f7fb1b66c8d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -275,16 +275,15 @@ static inline bool kvm_available_flush_remote_tlbs_range(void)
 	return kvm_x86_ops.flush_remote_tlbs_range;
 }
 
-void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
-				 gfn_t nr_pages)
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages)
 {
 	int ret = -EOPNOTSUPP;
 
 	if (kvm_x86_ops.flush_remote_tlbs_range)
 		ret = static_call(kvm_x86_flush_remote_tlbs_range)(kvm, start_gfn,
-								   nr_pages);
-	if (ret)
-		kvm_flush_remote_tlbs(kvm);
+									pages);
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
index 95c3e364f24b4..a054f48498a8f 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1357,6 +1357,7 @@ int kvm_vcpu_yield_to(struct kvm_vcpu *target);
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
index 600a985b86215..fc4ee20d33cc0 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -371,6 +371,19 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
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
2.41.0.162.gfafddb0af9-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
