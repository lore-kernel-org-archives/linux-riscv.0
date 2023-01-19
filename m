Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2613AC004D4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 18:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5hE7Yj95nCdhU/t8/a68iof2fFmWrak5Mg//OZXzcec=; b=HMdljLHRnVcIUfUUpGTwB4xIWr
	7heGhUvMnCo4T1Czmih4ap+uTGukFUU/+rJ9vIwLBo7q4Meu+7keB2MDElKygjA5crvA4OxpSn83C
	VAdPvKVKffvkyblD0jHAZYrGPtec8CFS6VrT7flVFPj+rPCJV31tE/vUpRsPuJovRgxyWNCRoPUWa
	gZrZokFaXZ0fYytJ1lV89EKKbUQhk/lNb0+bsTIVwNLXB7wNhgdo9TZ9olUu+1J751oNmnxD2Fsbe
	+hK2A5bfVKCqGtkdIKHbiyElGg9bXQpooR282PTkjAY8oE9N89aE77CVe3VCzdinj6ApZ7LBRC64g
	zWAqE4PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZvp-006cuF-2W; Thu, 19 Jan 2023 18:46:37 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYpj-006JtR-7q
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 17:36:22 +0000
Received: by mail-pf1-x44a.google.com with SMTP id f22-20020a056a00239600b0058d956679f5so1226466pfc.5
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 09:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Im+iiLjR8kItTyPOE/eTt5JfrQ6vH6VP6QUOOm0Kk1I=;
        b=NDaypEfM14bF96rZQ8+HhBj+hk7vULL62aBgTYqOMJZbA/TFlcBoOs9sPPdVNfYfNe
         hy+wfSSH4BDSz1WThBSYqt2sAf1ehWletnOkE7HUQytb+gI9Re8OgzkWS2mo1I6jEgoP
         A5YK5ZDo9WyQsEjxWBT4rvnxMYwhUntLdJ3c9JnoqQ/mZ7YKkBJREatylJnm/6q91ADW
         UAGK49Ncp5vq94p02BqMu7KO0bKoiDBTYjkeh1wCPeC5Jistb1klwpTxOTnWW3mROQTd
         HXspEOaka5MwYa6n+2RX9A6Q2UndlbAAikglk4E+3jUfk4fiFTsd+YClS+rJmA2nHT4G
         mg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Im+iiLjR8kItTyPOE/eTt5JfrQ6vH6VP6QUOOm0Kk1I=;
        b=Ueza/j0tAtVl2i5VxBMD4sodL84YKDv4e/tp6BVih3/z15kKaJdW7cRv3kVs4b+vUs
         NtaHmmIPfsvdCPd14z5K/s9mki+D5AEQ4fbZNtNfyHRDy0oMcM9+iJohQC7GcTC+wiiI
         2SjFXQdqRkbDtxOYCN60lUUjgY3DJSNNRscgGq3bl8/F4veM3P68BWK9stD1T/nJrOn3
         8Adduqv4L3cRpC6RAkgThrNosMU8hcRAK6Va4vcQOBV7vP/TwtqhvHBLrsboPGIB1L5y
         iFS9HxxPqEBk7dfV6iPd2E4s2TNLhMCwq0HFv6m8gGLU44zu0vrQzPiJAzbXmyY6vxcQ
         vRxQ==
X-Gm-Message-State: AFqh2ko8ayJFKIcWKuK7fOXqcxuzLMxK2S6nedKEfbIh8KhEibICZb9o
	5Rqs/LeSIlFVqDLLJ/94jusbB8DNjqfuhA==
X-Google-Smtp-Source: AMrXdXsA1M5z0iLozIPBN4P/zxpeV5zGDay7QgahgmS5l1uDJTAuZVCtHiq4az1VYA3Tk0bmeBp7KsSDRfSGJg==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a17:902:f24a:b0:192:ed88:bc8f with SMTP
 id j10-20020a170902f24a00b00192ed88bc8fmr1232044plc.25.1674149771693; Thu, 19
 Jan 2023 09:36:11 -0800 (PST)
Date: Thu, 19 Jan 2023 09:35:53 -0800
In-Reply-To: <20230119173559.2517103-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230119173559.2517103-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Message-ID: <20230119173559.2517103-2-dmatlack@google.com>
Subject: [PATCH 1/7] KVM: Rename kvm_arch_flush_remote_tlb() to kvm_arch_flush_remote_tlbs()
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
X-CRM114-CacheID: sfid-20230119_093615_368535_D0895C92 
X-CRM114-Status: GOOD (  10.99  )
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
index 4d2bc08794e4..1bacc3de2432 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1789,8 +1789,8 @@ static inline struct kvm *kvm_arch_alloc_vm(void)
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
index 109b18e2789c..76711afe4d17 100644
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
2.39.0.246.g2a6d74b583-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
