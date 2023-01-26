Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE8FC54EAA
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 19:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VMqvMVCVJS68WlaD3lVe+mVBbkyX4z0L/eRNZxL4pCE=; b=iUyz1+/lPjFYt6WoxF97dsZjid
	b6JZtH+TrOM4o5+msViiPuF8iRm5q24q/regg6IhsOUCZOtPJSvdww2zbZrz8Za7IKMfmHxf0Yb+V
	DwmcUCpXcqMlm8nV4gYBwHeRXcvCKCefgJ8WE759bjySI8f2jV91i9rRj5x3bsIEWZgptsephYDQF
	oIHN0PHSkbsMWax57MpWWaev3XL13u7P1qrXjtV0+6vRUjighCDx77pAxNQ4rv43tdEWmwTn6tuzQ
	TD3eMGJlySn6pZPaXskfbBO35HXbSiWJeXzdXj6wu+2kedrtqx+NtrE8nQNMgOZHBF8N0/SWSUpv8
	w+ChghKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL8D0-00CN3v-Fb; Thu, 26 Jan 2023 19:46:54 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL7B0-00CAWf-PM
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 18:40:50 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id n194-20020a2540cb000000b008038647d9ebso2785125yba.5
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jan 2023 10:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h/7CzzPaxtQW9FqsAkJDtgMVrAg2jNAu+hAw27KBMYo=;
        b=g8AX1ipZSIbLVD3gfe58wy2rTVB/dr2ealvgQbKCVGSLZetlE4PQ+KY9VjR6EUXkwp
         caVC4IOIK9MZHE98FrqmtKDHm3UwXI1YznTu7ZINOiTwL8n1tfMC7kDWmiTRS0bBdnBV
         NE+pkBhXOHkGFQeL6PBdUWp7shK46aAs1M0ZglUb+UtSTpNjCBRvN5d0tm5lZqs/Z73c
         hnZsNOAj5AfUZ5l5fXMro8gtq2IYMIXWYeRkjU6KCsqN/wPNKmzEx+P1yOM2G13pXj3A
         tmftnVodPMVKagV7IVRfrPCOx54L8LquGqGx7X6DDLutz07f3Ys2ykl7vlOP/pCGStdi
         aafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h/7CzzPaxtQW9FqsAkJDtgMVrAg2jNAu+hAw27KBMYo=;
        b=6F+AQtpT9BuxNL7HOuZ3ZcQSYZ7v8/ZLq86HRQK+5TGtX2BkJ7I3s/E1GV6siLxbSz
         p8TeX0TixSn8X4yGaQVPTYGBke51ZzChUnn8prpfTZFz+f6OO/Dg4QNkzzF3qA1JWehp
         FmdLzvyB5mVwI6qjQDK2ZqN31C7txh+yq2qT5AIRWRQBrNxCa992nB7MVTkBPTvt/Cnl
         nY4NzqlCMWq2QbwkqjrHVVWqG5feoo3VMuUqVmJ+MBZjdi/5dqg82Rcevf7K2EiOvdG6
         /TZU2DkniYhKQmfc9wSegKeKbhOAG3MZkZ+kvR97NJmzDHjISndR0fyLHUUkhTK7r9E/
         Wrtw==
X-Gm-Message-State: AO0yUKUWVsOiFFY1xhhxxUXm8qNGttZpu/WDjyneACMqyZfROHnRROnv
	J2ARS8ThQtSCv9y3VnyTelGqiIT60xsRfw==
X-Google-Smtp-Source: AK7set8aHl/591d8oPPiS82D685GhQ220gmn327zcVGVq335UGZHfVeBBJY9cAh4v66Bi8yUKxNSXG9xQHgs6Q==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a81:7e4b:0:b0:506:4f19:740c with SMTP id
 p11-20020a817e4b000000b005064f19740cmr1073915ywn.383.1674758441976; Thu, 26
 Jan 2023 10:40:41 -0800 (PST)
Date: Thu, 26 Jan 2023 10:40:19 -0800
In-Reply-To: <20230126184025.2294823-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230126184025.2294823-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230126184025.2294823-2-dmatlack@google.com>
Subject: [PATCH v2 1/7] KVM: Rename kvm_arch_flush_remote_tlb() to kvm_arch_flush_remote_tlbs()
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
X-CRM114-CacheID: sfid-20230126_104046_861630_58E9DC93 
X-CRM114-Status: GOOD (  11.16  )
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

Rename kvm_arch_flush_remote_tlb() and the associated macro
__KVM_HAVE_ARCH_FLUSH_REMOTE_TLB to kvm_arch_flush_remote_tlbs() and
__KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS respectively.

Making the name plural matches kvm_flush_remote_tlbs() and makes it more
clear that this function can affect more than one remote TLB.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/mips/include/asm/kvm_host.h | 4 ++--
 arch/mips/kvm/mips.c             | 2 +-
 arch/x86/include/asm/kvm_host.h  | 4 ++--
 include/linux/kvm_host.h         | 4 ++--
 virt/kvm/kvm_main.c              | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 2803c9c21ef9..849eb482ad15 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -896,7 +896,7 @@ static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
 
-#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLB
-int kvm_arch_flush_remote_tlb(struct kvm *kvm);
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
+int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
 
 #endif /* __MIPS_KVM_HOST_H__ */
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 36c8991b5d39..2e54e5fd8daa 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -981,7 +981,7 @@ void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
 
 }
 
-int kvm_arch_flush_remote_tlb(struct kvm *kvm)
+int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 {
 	kvm_mips_callbacks->prepare_flush_shadow(kvm);
 	return 1;
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index c837b06258f5..561d31d9a7da 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1806,8 +1806,8 @@ static inline struct kvm *kvm_arch_alloc_vm(void)
 #define __KVM_HAVE_ARCH_VM_FREE
 void kvm_arch_free_vm(struct kvm *kvm);
 
-#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLB
-static inline int kvm_arch_flush_remote_tlb(struct kvm *kvm)
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
+static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 {
 	if (kvm_x86_ops.tlb_remote_flush &&
 	    !static_call(kvm_x86_tlb_remote_flush)(kvm))
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index a7d6a6111f5e..9366fea46e30 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1477,8 +1477,8 @@ static inline void kvm_arch_free_vm(struct kvm *kvm)
 }
 #endif
 
-#ifndef __KVM_HAVE_ARCH_FLUSH_REMOTE_TLB
-static inline int kvm_arch_flush_remote_tlb(struct kvm *kvm)
+#ifndef __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
+static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 {
 	return -ENOTSUPP;
 }
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d255964ec331..277507463678 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -363,7 +363,7 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
 	 * kvm_make_all_cpus_request() reads vcpu->mode. We reuse that
 	 * barrier here.
 	 */
-	if (!kvm_arch_flush_remote_tlb(kvm)
+	if (!kvm_arch_flush_remote_tlbs(kvm)
 	    || kvm_make_all_cpus_request(kvm, KVM_REQ_TLB_FLUSH))
 		++kvm->stat.generic.remote_tlb_flush;
 }
-- 
2.39.1.456.gfc5497dd1b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
