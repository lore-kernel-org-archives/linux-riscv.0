Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC99DEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 04:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RqUjeZJiVTpkPAGeMWZIZg3G5e6JqdRnXB/c0bVH1iU=; b=XnRLykdRATimAsv6gfpmVXm3Co
	7aeWtUFaZbGwf5NDNAX65JaVjCw+n+0ZH1lr0yPB9I+vqxazyp+OzJ/1YIx3liRLQoEHSHWrDzuE6
	0Az9z5SNtSo2P626dC3TNoXTrHzrb0IRf3atVgW1WFiojkXqkVGW6AkpKLLTn1xwIZINeBY3mTGfW
	YxM2P1gN6/SOlGvztSV7FoJt/bw8trno8HVSMCFByIvVbRVk8r9HRqcbyTvGMkHfUGVlXEJqRVP8a
	BjfbNT1SwAS3BQI4zJ0tcOSa9kvzsXyGALTZt4Rn27BrfFI4uS7uavi4+OxZhMR9IVVoJnThGFwcG
	BykI0A+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUK81-009Pn9-2q;
	Fri, 11 Aug 2023 04:52:01 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUK7g-009PTZ-26
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 04:51:46 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-6bb0bb2bdd5so1690419a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 21:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691729498; x=1692334298;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ASzbcsqwIIPxgx+XyAMT2G1wf8WK9Z2hf5Cip/a2faA=;
        b=uAabUmiZLe4MoUbS9wWG4jcqfN0u7QlPThTWrmHmQHgIqkO2BufLaqzmmlZnIyCOO+
         T/L4kbkpAFt+ZBdM8kowjgzj6ukuum0CjGTGLYU3iRP5tAAb3o0Ntc7xlF3UR3cHB4tn
         DeUzU/obpskCQQfPFVk0wKOJHfy6VGzilCBOqGZ4AzgEZ8gbc7vfKZNsMiDf+Mnw4tyT
         6nipzycm7kXiOKYibxHOYUWZ2mkVxSRxc5NUa35+yCEee1ubON6GL22QYtP7OtxRf/u6
         JsUs87W8hFKFBeYOzN3POKlGxAmYSwY+LebXiY8Q3ZfGJNrmkf5yu6H0xJ2oAOGtMDcq
         RlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691729498; x=1692334298;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ASzbcsqwIIPxgx+XyAMT2G1wf8WK9Z2hf5Cip/a2faA=;
        b=YBm8DpZyCPvirItTB7qb6YtRSag3UlFpMulCeaF7oZze9ZXx0fQgqqxzBiZOb4saDG
         21UuVg7MvyeInqeSIH+8y8ZVIq5055x4cQXt7BwqdIzRJBzNfUqoKWJgv3lHOzHdKcJG
         eksb53H0gzEAOOb93mkw/fndAHaYyljrSPJrwZZZmVa6D0os1QBZ3pI0S9zV3zfomL/L
         QC9FqVOnVLsZ2cHu67BclTa/0LMti2/EOJ1JckWRhfGYJogeE0QQ/rX96ghU8VzrP5W6
         sG2Cdl51O9oehQc/inAyau1yAPTtg7ogmdR3RwfnnrBxmTSKPIYTcTFVwQNqxhNvBcMK
         nQGg==
X-Gm-Message-State: AOJu0YxgoKJIMlNZSPG5o4ythndT3Uh2joj6Z9OdVfCdayN5xhMn9qgY
	I5RNYW+E4LSFoeHG9TxuZpCCPcvGvMfG
X-Google-Smtp-Source: AGHT+IE/nnO7E1ywpn5IoMTUCGRwpLBu6xlqSUrvCHD1gTpM15da9wapCOhtsOAsZCjiWO4g5dJl7qthkafm
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6870:a8a8:b0:1bf:d3b8:5cae with SMTP
 id eb40-20020a056870a8a800b001bfd3b85caemr12117oab.10.1691729498753; Thu, 10
 Aug 2023 21:51:38 -0700 (PDT)
Date: Fri, 11 Aug 2023 04:51:16 +0000
In-Reply-To: <20230811045127.3308641-1-rananta@google.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230811045127.3308641-4-rananta@google.com>
Subject: [PATCH v9 03/14] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
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
	kvm@vger.kernel.org, Shaoqin Huang <shahuang@redhat.com>, Gavin Shan <gshan@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_215140_907787_56623687 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 arch/arm64/include/asm/kvm_host.h | 2 ++
 arch/arm64/kvm/Kconfig            | 1 -
 arch/arm64/kvm/mmu.c              | 6 +++---
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 8b6096753740c..20f2ba149c70c 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1111,6 +1111,8 @@ int __init kvm_set_ipa_limit(void);
 #define __KVM_HAVE_ARCH_VM_ALLOC
 struct kvm *kvm_arch_alloc_vm(void);
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
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
index 6db9ef288ec38..0ac721fa27f18 100644
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
2.41.0.640.ga95def55d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
