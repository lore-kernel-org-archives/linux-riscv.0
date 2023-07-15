Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEA3C001DF
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 02:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yHXJoCtexAPn59WSkWCGhBt6er6Q7SrRLEpj6CPSVb8=; b=BHGjMG8zKYXK9b8An2mB0S+C9j
	AWpSjFrkJqrJeoGFEIUH+6rZTEjujWfpQzCaa/LLaObvaGtDpbh/3g+l/tK74HRClYAU5UxrPZoSP
	QPZci6vySmhaXwGKleFPR2av3n5V2ioHzAHDt9SsB14MFhA9wZgHzt9CzK/5rRVwcoonMH6mZwBmU
	RCcwT2XCOFAEik3qC3IGqoXeWloBzL3xrmrx0gbxYPPWN9aiYdoqdL3Qu9n5FDL/WUjovzDFi4WsT
	U+SAj0Id3Or57fS7m7686wNNnEmJERywxomvL7UVaIUpk9xhqWkJrYHEUH53b+XvytW9H1FFppp/R
	SY3G6QSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKUad-007gHk-0v;
	Sat, 15 Jul 2023 02:00:55 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKTY5-007a8J-2d
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 00:54:18 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-6b9bf7074d4so1364023a34.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 17:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689382452; x=1689987252;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MXSjPU/svtXcQS5ot6a1McSJXmsJ4Jr5KFunceM6E60=;
        b=CFqVOkdVMvikuunMkGCiooa5wnUp6HP3ayIn0UAnXoVWMiTCsEs9mGApZcd30nNAi8
         hsPfynYBVpUDCXieQdVorq2is+M/lVbhsgM1T01beIEo4j9iE6skMHTbQ1k3VSnfRF/X
         iSkmM51QJ5EYlxLneHya6UY83mesjlFueZT6ZwnUdtRzA0ivlTCt3uwgTdb4bQTaNE2t
         av4IwO9GbjqZMJ3BXQMOnVJasQ8hOBAEV0SAaoscijB4pqBb8yIC8Rfm/4GbZQ2KZaNA
         eGrpMHfv21G82nzmbVO4PcqtomvHYQDY9ymd1SQ7++gSEsSCEqHsdQTTLFoeqyKHc2nX
         BMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689382452; x=1689987252;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXSjPU/svtXcQS5ot6a1McSJXmsJ4Jr5KFunceM6E60=;
        b=AeE/JjsE6DeCmEDXtZT4dqINB3upkC2Sr4xVWoqMytNYUmin4ReWuZpRhS4HHD1Gfc
         p3pUTgushK/41U/pDsdfPHcoOKal1wBYIBOyLu+MQyZV+fVMQ80P7uIUc0obh62ntWGA
         TYwRC+z+Xt/ZkH6qTnXdfrM7B3muJtFNNNM3kznVBeK8nKYsYpnI0NnTQ5lxCanUg2dd
         MlvMii3SC4OB4FnaWUvdFCvn8dISXkywB3SpiEcOqwSmV/467Vzo8/YBg5MrHN8pcW/S
         s9vjHa2Rjh/4eYKsW4h5lHwwcZ/yx/fAq1ILfiwFV+w4LKUxN7DtxDkVhzJqU8x0wOzD
         x6Mw==
X-Gm-Message-State: ABy/qLaufGBO0178e61jQ+Ru8cTlNuckpu1wzB/WXw4g6L53lr04QJRa
	1OWIOEdkb8h3pA/X2ZIYjGtP+kNXVqnl
X-Google-Smtp-Source: APBJJlFLy2UEg25qDMciFPz6SaFOG1vg+dNM/dIqR0Aaao9Su4G3l6UDpJUonGz/hoa1CJGkfb2oCBXuZX7P
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6830:6a17:b0:6b7:5691:bdaa with SMTP
 id cz23-20020a0568306a1700b006b75691bdaamr3526210otb.1.1689382452378; Fri, 14
 Jul 2023 17:54:12 -0700 (PDT)
Date: Sat, 15 Jul 2023 00:53:56 +0000
In-Reply-To: <20230715005405.3689586-1-rananta@google.com>
Mime-Version: 1.0
References: <20230715005405.3689586-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.455.g037347b96a-goog
Message-ID: <20230715005405.3689586-3-rananta@google.com>
Subject: [PATCH v6 02/11] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
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
	kvm@vger.kernel.org, Zenghui Yu <zenghui.yu@linux.dev>, Gavin Shan <gshan@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_175413_858208_EC6206EC 
X-CRM114-Status: GOOD (  12.47  )
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

Use kvm_arch_flush_remote_tlbs() instead of
CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL. The two mechanisms solve the same
problem, allowing architecture-specific code to provide a non-IPI
implementation of remote TLB flushing.

Dropping CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL allows KVM to standardize
all architectures on kvm_arch_flush_remote_tlbs() instead of maintaining
two mechanisms.

Opt to standardize on kvm_arch_flush_remote_tlbs() since it avoids
duplicating the generic TLB stats across architectures that implement
their own remote TLB flush.

This adds an extra function call to the ARM64 kvm_flush_remote_tlbs()
path, but that is a small cost in comparison to flushing remote TLBs.

In addition, instead of just incrementing remote_tlb_flush_requests
stat, the generic interface would also increment the
remote_tlb_flush stat.

Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Zenghui Yu <zenghui.yu@linux.dev>
Acked-by: Oliver Upton <oliver.upton@linux.dev>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 arch/arm64/include/asm/kvm_host.h | 3 +++
 arch/arm64/kvm/Kconfig            | 1 -
 arch/arm64/kvm/mmu.c              | 6 +++---
 virt/kvm/Kconfig                  | 3 ---
 virt/kvm/kvm_main.c               | 2 --
 5 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 8b6096753740..7281222f24ef 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1111,6 +1111,9 @@ int __init kvm_set_ipa_limit(void);
 #define __KVM_HAVE_ARCH_VM_ALLOC
 struct kvm *kvm_arch_alloc_vm(void);
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
+int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
+
 static inline bool kvm_vm_is_protected(struct kvm *kvm)
 {
 	return false;
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index f531da6b362e..6b730fcfee37 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -25,7 +25,6 @@ menuconfig KVM
 	select MMU_NOTIFIER
 	select PREEMPT_NOTIFIERS
 	select HAVE_KVM_CPU_RELAX_INTERCEPT
-	select HAVE_KVM_ARCH_TLB_FLUSH_ALL
 	select KVM_MMIO
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_XFER_TO_GUEST_WORK
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6db9ef288ec3..0ac721fa27f1 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -161,15 +161,15 @@ static bool memslot_is_logging(struct kvm_memory_slot *memslot)
 }
 
 /**
- * kvm_flush_remote_tlbs() - flush all VM TLB entries for v7/8
+ * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries for v7/8
  * @kvm:	pointer to kvm structure.
  *
  * Interface to HYP function to flush all VM TLB entries
  */
-void kvm_flush_remote_tlbs(struct kvm *kvm)
+int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 {
-	++kvm->stat.generic.remote_tlb_flush_requests;
 	kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
+	return 0;
 }
 
 static bool kvm_is_device_pfn(unsigned long pfn)
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index b74916de5183..484d0873061c 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -62,9 +62,6 @@ config HAVE_KVM_CPU_RELAX_INTERCEPT
 config KVM_VFIO
        bool
 
-config HAVE_KVM_ARCH_TLB_FLUSH_ALL
-       bool
-
 config HAVE_KVM_INVALID_WAKEUPS
        bool
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 70e5479797ac..d6b050786155 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -345,7 +345,6 @@ bool kvm_make_all_cpus_request(struct kvm *kvm, unsigned int req)
 }
 EXPORT_SYMBOL_GPL(kvm_make_all_cpus_request);
 
-#ifndef CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
 void kvm_flush_remote_tlbs(struct kvm *kvm)
 {
 	++kvm->stat.generic.remote_tlb_flush_requests;
@@ -366,7 +365,6 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
 		++kvm->stat.generic.remote_tlb_flush;
 }
 EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs);
-#endif
 
 static void kvm_flush_shadow_all(struct kvm *kvm)
 {
-- 
2.41.0.455.g037347b96a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
