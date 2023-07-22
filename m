Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA15EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 03:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pYtS52CsEQVLAriKJraFizGt/Ad/Bvpt2i2huST5Bfs=; b=gtQFZUnKcg8sVbzih5UMpTTbQY
	Ctpw9SnN/kV//p+Wtj/rN4PYt9L+ygMhZ1O/uKMogX4vUBP7TyGGN8BMVA1ZyDNCtZgYLC91ejOyd
	W20c1E2cQzrGwqkMyg1IDC5nMFoMkcetVIwzKaB6u3LkOAbi3jIB/pWJ+Y9SBQGP0DhATkrTG2trL
	CtWc2TxsofcEt6WS5xsCuAn1b6ybYY8pzqst0WzxwZruAAC+8t6oW75La2LHA3uUcCvhKs2UWJ1Iw
	6NWmcCFDE7uxutejbKGo6Def45PhYtKJyFD6CtquctyaVt5dGxf/6AKB3mzN0t674G3RN404uJ9mE
	AA/wjoXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN3Ln-00FiTa-1k;
	Sat, 22 Jul 2023 03:32:11 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2Gq-00FbqH-0N
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 02:23:03 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-56942442eb0so27247687b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 19:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689992577; x=1690597377;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SI6Gva1qvgHyCE7QYiuLXB9Rb6SmeiZnCZaqC2WR/Sc=;
        b=pclINCkRdRgYAwaus01ejO4ihWr9A2XfL0ddUkYV/8EArvjBZbbuZd1gAvOxilC3EG
         LI5ig+mCKvx5zZiKKeWtoSn1KRLqe9PQt44bIhGnETmctKhIlGGYczLFfINjjUmeV8eM
         vF/f00G3soAZho0MrsjCa00CHbPDXDffhgNgwsvO6ihBYLorYgrQRClyFLc4+ju/Ndg2
         KuE5q+mG/CiKyTPw9stpjZ4mmv5/rWSOe25ukny2y+mj1Vac8JoETMrp/Yu7K8MxNjLv
         ZwVGfuZusT3+e53fBM7XlIyyfghatocIbRyjEOEWb7qvJx+JIJLcOjh2l5X25Jd+zX6l
         km/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689992577; x=1690597377;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SI6Gva1qvgHyCE7QYiuLXB9Rb6SmeiZnCZaqC2WR/Sc=;
        b=io1qnPTZqe7I0+DpEuCJIwoB10b5SpMmXGLXW4pM7J4bLDfe/M4nZnXY5E+Xiq0G+1
         bgQiOK35inoSPkyvtRbhk5/dfVKnTPApBF3bj4z/cGn+6vHoPRZVpY8j6/PtC3NKhkLi
         OR7FI13/L7wRN+UBo4VegAhBowN1BboClLIBRmduwJGfpn/Mahu3giRJxqhKVDBseVBg
         hjwTKr/AUh0snmfS/pUoo9aSrbnrd0cXGMSJRr4KILdj2eN2NiXvNAkq6HsdSXp9lZdw
         Isj+HEwgZG5dXk6+LIvkXq7id22wOVtjqCSRXuhaN/TU2HaEv2mZuNwp6SWG2NADMdkh
         aECg==
X-Gm-Message-State: ABy/qLa3YAaMM7oGwCc0d4KWbq3N4GQ1vr82VwZoYD1ZW4bf12p4uioN
	TLXK+vXs+O8/xCswTqLf0WW/WdAdA+Um
X-Google-Smtp-Source: APBJJlE74S44aAdDkeUWprjnh97a+iXOQv70bhnTttKdjXjLztwho8eu5se6DQmHFzL4Hoaq3q6ibV20GsDb
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a81:e801:0:b0:57a:793:7fb0 with SMTP id
 a1-20020a81e801000000b0057a07937fb0mr15253ywm.3.1689992577014; Fri, 21 Jul
 2023 19:22:57 -0700 (PDT)
Date: Sat, 22 Jul 2023 02:22:41 +0000
In-Reply-To: <20230722022251.3446223-1-rananta@google.com>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230722022251.3446223-3-rananta@google.com>
Subject: [PATCH v7 02/12] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Anata <rananta@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_192300_152794_600CEE81 
X-CRM114-Status: GOOD (  10.00  )
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

Stop depending on CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL and opt to
standardize on kvm_arch_flush_remote_tlbs() since it avoids
duplicating the generic TLB stats across architectures that implement
their own remote TLB flush.

This adds an extra function call to the ARM64 kvm_flush_remote_tlbs()
path, but that is a small cost in comparison to flushing remote TLBs.

In addition, instead of just incrementing remote_tlb_flush_requests
stat, the generic interface would also increment the
remote_tlb_flush stat.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 3 +++
 arch/arm64/kvm/Kconfig            | 1 -
 arch/arm64/kvm/mmu.c              | 6 +++---
 3 files changed, 6 insertions(+), 4 deletions(-)

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
-- 
2.41.0.487.g6d72f3e995-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
