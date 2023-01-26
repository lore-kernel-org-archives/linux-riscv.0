Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9F9C05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 19:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=I+ayKvSqRAtLGtou6fAZV5+Fc5h1rq6doNbZfMkGkeM=; b=e5/DuS4i5ynRxwlyNUf10kb+DH
	1nf7rGtVlZ5Fe3BLZ/PMGtFMGaBlpwdmVBKOXmhenKgQf4N+F4X9pC/2Ua9RLbsmrDRkHXxcCXcdy
	4eQPYC3omsHC7YbmUGXaskUu/ntAOFNygKK+ytpts0LggRQ8nVXt1pvze/66d7G0ncgMij/cCgOh4
	ZAxo3W1G21Hrr59AHM8ZA3NidUXJfFAYLnfkfmKg6PZZdwyNGdjed1rp47p9kOP5ftM36zx8qI0eL
	UiKckUkqHfTuvaY2+1VBOOi7PuiGE5UY9qecUbtN1KEORAS+enQujc1aCoQjbCqD0BQvCV4BaiW7k
	Oo1nfuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL8CK-00CMnz-Ep; Thu, 26 Jan 2023 19:46:12 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL7B0-00CAX1-4c
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 18:40:47 +0000
Received: by mail-pf1-x449.google.com with SMTP id s4-20020a056a00194400b0058d9b9fecb6so1292197pfk.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jan 2023 10:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kZP81PLAnHNDx3GXesSgkXFkQVto1UMwgVjZaHf1Ujs=;
        b=CN97RPsVxakVAMNzoVgifIxHO7Qc6I+3Chv8q6AUj/33DacoubRt4hlf1rGpDMVcu9
         BteBBEZV5xsBPqp2pfvplk3cV5vURHG/LZrTeY3ic9a4DGf1OlCShLIqCwKqI7tewWT9
         fSUwnR+73z2FgLxzIYPMxIllEa//lcD6/f8KrhN6s173FNw0IdzuT6WvVyPtF4A4CSEb
         4ooBqyB4V+iT0k0lwB2Rri2VSbO4xjGGzroabkijs1oClX61v2IgHjRczsdqA4NdoSV8
         30SP90M4kOfgow4CxBuCpxlb94g47JJjdKDGxhCcWK6pApN671Iad8fKW7xrCVKoVl6T
         /Img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZP81PLAnHNDx3GXesSgkXFkQVto1UMwgVjZaHf1Ujs=;
        b=Jx47bwRUxo52SXAiBwBic8LSVOx/oboS2yhtkRIHAA45+88QL0eGYthPJJ4DCmwK46
         5sWLylulyorxzQTa1XNoxJyUVR7/ZbzVyDP7xyeUEdBjhljItzAzKkYoydGL765mw9CI
         gwF9nnOVTHDi20mtLySY6sQ/AYaMdZC5q7xuZhifPvVyfJrD/mpnVXuIqNcgLKoHyqhL
         YYJKNRryvXnHC3hpfcf5LO8yGHetIlqqncGX/uh5HVLLZ+DjxxYmxbrKPyXq9lT5fP3P
         oMM9mZY6B2Bd8pXvvbR01i0hyI3tyRdBLrnJRbdd1uf2NGRQzc3skoyC8mLKOeT7n0PG
         bk+A==
X-Gm-Message-State: AO0yUKUaQfkOIzkIktuua8fzXluKSEJVuubGU8bMatRQFSESdlM/XFYv
	PlkzLSpfhHJx6XKj7AyoDgMc4nZ0HWIVTw==
X-Google-Smtp-Source: AK7set9b7QjZr2BHLuSuqUJvTE1JaAlxAxR9G70Gmjtg/69HMjJHGtaiG0T6CeCuYXvr3oVQxLGFHTSvO3p4Mg==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a62:cd09:0:b0:590:7611:1c48 with SMTP id
 o9-20020a62cd09000000b0059076111c48mr743965pfg.21.1674758443763; Thu, 26 Jan
 2023 10:40:43 -0800 (PST)
Date: Thu, 26 Jan 2023 10:40:20 -0800
In-Reply-To: <20230126184025.2294823-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230126184025.2294823-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230126184025.2294823-3-dmatlack@google.com>
Subject: [PATCH v2 2/7] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
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
X-CRM114-CacheID: sfid-20230126_104046_206091_A9D82C35 
X-CRM114-Status: GOOD (  13.01  )
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
---
 arch/arm64/include/asm/kvm_host.h | 3 +++
 arch/arm64/kvm/Kconfig            | 1 -
 arch/arm64/kvm/mmu.c              | 6 +++---
 virt/kvm/Kconfig                  | 3 ---
 virt/kvm/kvm_main.c               | 2 --
 5 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 113e20fdbb56..062800f1dc54 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -998,6 +998,9 @@ int __init kvm_set_ipa_limit(void);
 #define __KVM_HAVE_ARCH_VM_ALLOC
 struct kvm *kvm_arch_alloc_vm(void);
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
+int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
+
 static inline bool kvm_vm_is_protected(struct kvm *kvm)
 {
 	return false;
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index ca6eadeb7d1a..e9ac57098a0b 100644
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
index 01352f5838a0..8840f65e0e40 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -80,15 +80,15 @@ static bool memslot_is_logging(struct kvm_memory_slot *memslot)
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
index 277507463678..fefd3e3c8fe1 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -347,7 +347,6 @@ bool kvm_make_all_cpus_request(struct kvm *kvm, unsigned int req)
 }
 EXPORT_SYMBOL_GPL(kvm_make_all_cpus_request);
 
-#ifndef CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
 void kvm_flush_remote_tlbs(struct kvm *kvm)
 {
 	++kvm->stat.generic.remote_tlb_flush_requests;
@@ -368,7 +367,6 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
 		++kvm->stat.generic.remote_tlb_flush;
 }
 EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs);
-#endif
 
 static void kvm_flush_shadow_all(struct kvm *kvm)
 {
-- 
2.39.1.456.gfc5497dd1b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
