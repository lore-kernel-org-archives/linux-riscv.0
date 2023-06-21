Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AE0EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 17:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1HOgLesv0ohdjVyj/4QJa7g1zhfgk77P9jjjpdx/WLo=; b=tBtTIXM7xC8DyEfEoU2yXqcLpg
	aypYTbBFwGX9zQOJwryjEPwJGLcsv+hzgMfoZHWfMvp1WzIuwfCzQ9QFs9Tbgtc+RCyRr3GqWr8eh
	vPVY1YEWwoJTxDCJDZPEFTwS9fNC1y7iMA9d781Nxi95aWhpL6mc6VVysZsfPaYVqB4YVj34vR/aE
	lfwhS2MR8MHnuXodqcNwtZCPx2LbMtKGuJVYwICTxSnt8NLSchx3tQBku+L+wWnRUpks7HCc5BVS+
	1Pc5oOgcFqEDV3n1KfTOoBdOPfGlsP+KzvLFDrLBIbcmVH+nEwOd9RaknddVRlW++3Dnqdnogr11J
	MtMMZbkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC1yZ-00FHCE-29;
	Wed, 21 Jun 2023 17:50:39 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC1yK-00FGwr-0v
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 17:50:27 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-77e2416ef1bso617547839f.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 10:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687369823; x=1689961823;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=G0J4nFC2Gn0XupCqfzQ5AeLw9Bc/hm7+Rw/GcGHeXZY=;
        b=uDTcZy6WksIxTQoNUyBmNmSYdCye+OOyjLtqei9t+gdrikwCGERe5gniH/1WPexqfV
         S3ddWaWSCcwkePrKdofhK7s43nwKPFXZAsn/aW7QKGEpHYiWe2/4Xk1ZLXtY0+16TJh1
         UWtkWtZHnx6F5hFIZI+w20IyK4MPjSVDx0cbNCAXe0hWZhZsWXS5MqBrp+w+ZkHEg0R1
         Mqugrmhm6iklvk4fQwfhCflTZK5fd430BIy9H2RKcUcUkfZPZuLzY09rEgZw6I29/jre
         0RSo8O9aukpg0nX+yIAhYQC7NT4FBOjIaomVwoTT8v4hh7UcubGQH5ArCBf16Ebv1z4G
         388g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687369823; x=1689961823;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G0J4nFC2Gn0XupCqfzQ5AeLw9Bc/hm7+Rw/GcGHeXZY=;
        b=Rimk1AFAP1SHASSJ6o+sTURCaRfE3TnETUCN3gVEJwuwMGP0IJAVpxzdmeNix3tpA8
         cNNsCZgHMaiFPte/8/VyGVOq7uY9wIKQsAU7fNNmbWKL6FB2K/0WdmHBHpr5hj33NX5g
         oCP8Pnt+3MPgU4wtEWIPWD/i7aIsFPWCF9dmAkVaH+ePCQLNwhRCu+67ZvgGOurMIAy+
         wxVYVwoWxFWu7dDnNYKKnBxIp14qfLdmgXQUjWcIseFEM8P4TN6BLSl95kuOU/lZe6Of
         rl1qeZ8a6yZK+N6MfhtL3HTArE1wJWBg4MDjd1wr5Mr0OSStoyMzE25UlhZNCrRNOE8n
         F1tQ==
X-Gm-Message-State: AC+VfDxZMyyg3p0aH5sIzjeobyGOLEz2XesWXqFSfiz2BbqEzHnHJ4N0
	fwqIKqcb2y2DHtqCJYA2/ZFW3USON3Rn
X-Google-Smtp-Source: ACHHUZ4gtwXMs9gC/Rt6qeSbz3evFOSdeD4CaQ1dSb+oll+qJkTJp5tA3BeUra9pqAn7WPF5b9IewHmx1wSw
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6602:2051:b0:777:b81a:2025 with SMTP
 id z17-20020a056602205100b00777b81a2025mr6317324iod.1.1687369823025; Wed, 21
 Jun 2023 10:50:23 -0700 (PDT)
Date: Wed, 21 Jun 2023 17:49:53 +0000
In-Reply-To: <20230621175002.2832640-1-rananta@google.com>
Mime-Version: 1.0
References: <20230621175002.2832640-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230621175002.2832640-3-rananta@google.com>
Subject: [RESEND PATCH v5 02/11] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
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
	kvm@vger.kernel.org, Zenghui Yu <zenghui.yu@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_105024_353222_067A4EA3 
X-CRM114-Status: GOOD (  12.58  )
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

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Zenghui Yu <zenghui.yu@linux.dev>
Acked-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/include/asm/kvm_host.h | 3 +++
 arch/arm64/kvm/Kconfig            | 1 -
 arch/arm64/kvm/mmu.c              | 6 +++---
 virt/kvm/Kconfig                  | 3 ---
 virt/kvm/kvm_main.c               | 2 --
 5 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7e7e19ef6993e..81ab41b84f436 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1078,6 +1078,9 @@ int __init kvm_set_ipa_limit(void);
 #define __KVM_HAVE_ARCH_VM_ALLOC
 struct kvm *kvm_arch_alloc_vm(void);
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
+int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
+
 static inline bool kvm_vm_is_protected(struct kvm *kvm)
 {
 	return false;
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index f531da6b362e9..6b730fcfee379 100644
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
index 3b9d4d24c361a..d0a0d3dca9316 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -81,15 +81,15 @@ static bool memslot_is_logging(struct kvm_memory_slot *memslot)
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
index b74916de5183a..484d0873061ca 100644
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
index a475ff9ef156d..600a985b86215 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -350,7 +350,6 @@ bool kvm_make_all_cpus_request(struct kvm *kvm, unsigned int req)
 }
 EXPORT_SYMBOL_GPL(kvm_make_all_cpus_request);
 
-#ifndef CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
 void kvm_flush_remote_tlbs(struct kvm *kvm)
 {
 	++kvm->stat.generic.remote_tlb_flush_requests;
@@ -371,7 +370,6 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
 		++kvm->stat.generic.remote_tlb_flush;
 }
 EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs);
-#endif
 
 static void kvm_flush_shadow_all(struct kvm *kvm)
 {
-- 
2.41.0.162.gfafddb0af9-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
