Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900ECC04FE2
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 23:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ors7sQxJh9V09ttMbDDBuZ6UNLUZWooh6UQneXm4oV8=; b=5FMH6ZZN3REv1M+jVrDhAV4YEl
	UkLU+acqv6aKEV4q/AqRxwUDN4ysOEfdCuCw2r8AOvhnFs7fnT84YmZkXolh/TLWEKIp281Did4Fi
	1BqFlo5mX9WHYNwf9w/CLtrRLeyw8Vi7jC8i7hOq2QVDIOcx85g/LvxFlc5VB2tHdiT+etX/OQGzV
	0wxOsu0qydggoFZyuUVfnKOEqjFzxM7X6VoXl8WcGsbGFypqAsH4Yv0Ke/Q2U63ZtJQrbt9N01w+x
	6KTEE2anpq7TRroEwef1IXaEkjSJOaO2C6M1701Yj4j82N1ExzoIR6QrHo35lnEEAGbessHpWFXsy
	jqKyQIEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVth-003dJy-0j;
	Tue, 08 Aug 2023 23:13:53 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVtV-003d5A-1r
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 23:13:45 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d4df4a2c5dcso4105548276.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 16:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691536418; x=1692141218;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yofTwj8ZWcGjgw9v2JlEZNUSzmrec+LwekHHUJcpAoM=;
        b=dpvxAljlEqRicljPQxNOJb+MByUQynWkaoJYtNkwzaTYBVofoDLxhXQ4NUQQ/PzLSf
         NAtCKDbb8oJ0I+3uBtvhYWPM5zzVcZGZW3pDxQOMxKp+lvQ7BjdFrNc/q/apmXEYUx/b
         QhVGqmoFiocVQByOfmb4QZxlbWrg6Ieus4zhxHuCqIJKlof4GWqyS/gC4YZttzjEIT/h
         Whg24RDAmIE9PEXxBdCoM/i4l/H27VeCyO3o8GhqYAZYL0To+EyyDC+2J360ckq2AoBz
         pk0d/gNWDg05ec8YE3MwSGw7fdP5YwY4vaL8VuAGMAaNIrbzBVJmLTs6Pw2oc6uWyPcm
         NgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691536418; x=1692141218;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yofTwj8ZWcGjgw9v2JlEZNUSzmrec+LwekHHUJcpAoM=;
        b=Yfn75YhCv4LvWfxRirtdbE/nXqmHIvvyEsEeFSWd3D6eryzgqM/vX7jX9pQgDKkGaI
         HbSxwnjKejI5b5huQ3D7FqZ+/FkegAKy+4WLLkKob79wgc1+3w4uZy1TdGZxNh2gR9gT
         NjatCa9bgbNCc+jx6oyr7vhp7LJoeCdlPweOC8+iiTYMkZcRWrxq8DMFEKBHn+TByXHW
         zpfRy0ub6h1BRs7oWjh3VxP8USvoiFK826kMXAztskx8dp3ebxCc3k/vrsbpV/XA6wp4
         4WMTTH4n9CRe6KU3SDz8dMeqkIZkMWPfedX4eOto/sR44MWnwAtvW4kSjtvMFyJGsci+
         5ceQ==
X-Gm-Message-State: AOJu0Yw03/BAsfh2J9dvFbyEvCl9oQc84HU6cHaCvZwGhLY7FBaPgLaL
	QKf9dAVW2jYMofBDad7FUzPWhSbZmBIt
X-Google-Smtp-Source: AGHT+IEMoPWfeZ+OLCK2D9UT69oNcAo0brgl53831EkFIxzA/BaKPU3QvQO6q12mm6VixOduKcfqU57b7CIQ
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a25:e90b:0:b0:d35:bf85:5aa0 with SMTP id
 n11-20020a25e90b000000b00d35bf855aa0mr23366ybd.4.1691536418029; Tue, 08 Aug
 2023 16:13:38 -0700 (PDT)
Date: Tue,  8 Aug 2023 23:13:19 +0000
In-Reply-To: <20230808231330.3855936-1-rananta@google.com>
Mime-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230808231330.3855936-4-rananta@google.com>
Subject: [PATCH v8 03/14] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
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
	kvm@vger.kernel.org, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_161341_638873_99B1918D 
X-CRM114-Status: GOOD (  10.88  )
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
