Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81033C32774
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 03:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8ReWX6HhxoBlxxF3T4C272BVVj/9fdDx7N0Fr5RPBo=; b=VYzB88ACWTVbcN
	VBwOOIxdvpGn0I0SYM9q5X2BnFhr31e47iYgezKMJO8aN9tWl0yZj1qVWl/HCm6/j42GteIQKZ/5X
	VxDxGnQtGlucF6vPiptbSolgXjrNKdVU86TSCzU1b0aDea+a+SJAkE3X6UahYbBBQZaOYna0ENjhn
	0qAW5YP8FwPS+p+TJWstjpvq6kYR7AH+c+TeLhX0y5bFhfPnDozrqz10yJiTnbaiNu529+oOv+vNv
	LT4GOGv1uTqKvNz3/zW7MOjs9794Go02q1vTiTtWbEz1hVXOiMAQXquRAeu98ICDPHrze+tnNWTdO
	xze0u/XCugLs61ddz3eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQgyd-00AD59-HS; Wed, 24 Aug 2022 03:22:47 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQgxN-00ACRM-9b
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 03:21:30 +0000
Received: by mail-pg1-x549.google.com with SMTP id f186-20020a636ac3000000b0042af745d56cso1444167pgc.17
        for <linux-riscv@lists.infradead.org>; Tue, 23 Aug 2022 20:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:reply-to:from:to:cc;
        bh=0Zu9CHYeQLsVtyyQt2AMWvNl6eTy619WBuTXQTtixSA=;
        b=D55RlPmRHY3855ha+O8WFuydY7xxV00RTpgiyt0tc+7sqW+ZITwJ8rHH4cS6Rgj2Tp
         EHuWTZwJYb/z5yGCzhd4wR6f3rStHwPGFgRn6L9kMUUWot/3PnViuvUo20Btnb7i66Tw
         dO9NyUSAB9cSeN4t5FJi7jZBt1djQF7nRCc7u2BDQCLlF0FJx0JuKeXkajK/Bb3xsZqK
         6tk7zhNHVsj4IdF9tAKxyVew8z6dGtaEOw8q0I3USCIsdic62o4PAhO7p8dmL04RYw3+
         vJCAytqgW15ccVK1stFdEfYnKwvHjs8FRvcUj5bQpNDEkEcfzdtOUCoq+wKJQBUaP8ql
         g1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc;
        bh=0Zu9CHYeQLsVtyyQt2AMWvNl6eTy619WBuTXQTtixSA=;
        b=7y+YXIQieIMPQKxaQrJnpL9z9C0x9hJAxWW81X2xKn6lISCPImwV0uodkzbi8tLAHZ
         iZZZi4v2brtctoIUCFhcjBSP7JJYE/bSfJKaJvCZPjPu8hMoujtD1gVgOebibPHg7kBe
         oMtobwI7lCd2qFeFR2HtlmBfvPNDWKE8afqjgwyGSvCO4RnxFRQOBxJiiCt7vHX3FmQ7
         uh4tDGsXWVO5r0aYhpDfDm3YiTVxnhjmMe5WQcPSmbYmmSHRHYijOFTNpdqnxu2/S2MP
         FR9wxFZskuU9zcnRiz6CaikusZqYullVuJiwnvRle3ab/xdSk7ULQik+yW/hOuflO1l1
         lA+w==
X-Gm-Message-State: ACgBeo3mh7RPrtPYU588z6LsJYMfl6jyKohtL9u+CcuM/yzeginmipae
	iR4DsS/UwU6Plh9zsmuEWlChOSz9B2k=
X-Google-Smtp-Source: AA6agR573qzRI9fRUFVPY21n41Xn0zzpTI2fab3hBfHK20jtmnw9qYoXs3mBXpBUgtjKB0V2MjEeiqR0SSg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:aa7:814d:0:b0:535:c875:dd4f with SMTP id
 d13-20020aa7814d000000b00535c875dd4fmr27515181pfn.4.1661311287578; Tue, 23
 Aug 2022 20:21:27 -0700 (PDT)
Date: Wed, 24 Aug 2022 03:21:14 +0000
In-Reply-To: <20220824032115.3563686-1-seanjc@google.com>
Message-Id: <20220824032115.3563686-6-seanjc@google.com>
Mime-Version: 1.0
References: <20220824032115.3563686-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH v4 5/6] KVM: selftests: Make arm64's MMIO ucall multi-VM friendly
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, Tom Rix <trix@redhat.com>, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.cs.columbia.edu, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>, 
	Peter Gonda <pgonda@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_202129_361772_68CAFEC5 
X-CRM114-Status: GOOD (  16.48  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Fix a mostly-theoretical bug where ARM's ucall MMIO setup could result in
different VMs stomping on each other by cloberring the global pointer.

Fix the most obvious issue by saving the MMIO gpa into the VM.

A more subtle bug is that creating VMs in parallel (on multiple tasks)
could result in a VM using the wrong address.  Synchronizing a global to
a guest effectively snapshots the value on a per-VM basis, i.e. the
"global" is already prepped to work with multiple VMs, but setting the
global in the host and copying it to the guest needs to happen atomically.
To fix that bug, add atomic_sync_global_pointer_to_guest() to sync
"global" pointers that hold per-VM values, i.e. technically need to be
handled in a thread-safe manner.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h     | 16 +++++++++++++++
 .../testing/selftests/kvm/lib/aarch64/ucall.c | 20 ++++++++++++++-----
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 24fde97f6121..9ec7fbe941aa 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -16,6 +16,7 @@
 #include <linux/kvm.h>
 #include "linux/rbtree.h"
 
+#include <asm/atomic.h>
 
 #include <sys/ioctl.h>
 
@@ -81,6 +82,7 @@ struct kvm_vm {
 	struct sparsebit *vpages_mapped;
 	bool has_irqchip;
 	bool pgd_created;
+	vm_paddr_t ucall_mmio_addr;
 	vm_paddr_t pgd;
 	vm_vaddr_t gdt;
 	vm_vaddr_t tss;
@@ -714,6 +716,20 @@ kvm_userspace_memory_region_find(struct kvm_vm *vm, uint64_t start,
 	memcpy(&(g), _p, sizeof(g));				\
 })
 
+/*
+ * Sync a global pointer to the guest that has a per-VM value, in which case
+ * writes to the host copy of the "global" must be serialized (in case a test
+ * is being truly crazy and spawning multiple VMs concurrently).
+ */
+#define atomic_sync_global_pointer_to_guest(vm, g, val) ({	\
+	typeof(g) *_p = addr_gva2hva(vm, (vm_vaddr_t)&(g));	\
+								\
+	while (cmpxchg(&g, NULL, val))				\
+		;						\
+	memcpy(_p, &(g), sizeof(g));				\
+	WRITE_ONCE(g, NULL);					\
+})
+
 void assert_on_unhandled_exception(struct kvm_vcpu *vcpu);
 
 void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu,
diff --git a/tools/testing/selftests/kvm/lib/aarch64/ucall.c b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
index f02ae27c3e43..acb47c813477 100644
--- a/tools/testing/selftests/kvm/lib/aarch64/ucall.c
+++ b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
@@ -6,20 +6,30 @@
  */
 #include "kvm_util.h"
 
+/*
+ * This "global" holds different per-VM values, it must not be accessed from
+ * host code except to sync the guest value, and that must be done atomically.
+ */
 static vm_vaddr_t *ucall_exit_mmio_addr;
 
+static void ucall_set_mmio_addr(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
+{
+	vm->ucall_mmio_addr = mmio_gpa;
+
+	atomic_sync_global_pointer_to_guest(vm, ucall_exit_mmio_addr,
+					    (vm_vaddr_t *)mmio_gpa);
+}
+
 void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
 {
 	virt_pg_map(vm, mmio_gpa, mmio_gpa);
 
-	ucall_exit_mmio_addr = (vm_vaddr_t *)mmio_gpa;
-	sync_global_to_guest(vm, ucall_exit_mmio_addr);
+	ucall_set_mmio_addr(vm, mmio_gpa);
 }
 
 void ucall_arch_uninit(struct kvm_vm *vm)
 {
-	ucall_exit_mmio_addr = 0;
-	sync_global_to_guest(vm, ucall_exit_mmio_addr);
+	ucall_set_mmio_addr(vm, (vm_paddr_t)NULL);
 }
 
 void ucall_arch_do_ucall(vm_vaddr_t uc)
@@ -32,7 +42,7 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 	struct kvm_run *run = vcpu->run;
 
 	if (run->exit_reason == KVM_EXIT_MMIO &&
-	    run->mmio.phys_addr == (uint64_t)ucall_exit_mmio_addr) {
+	    run->mmio.phys_addr == vcpu->vm->ucall_mmio_addr) {
 		vm_vaddr_t gva;
 
 		TEST_ASSERT(run->mmio.is_write && run->mmio.len == 8,
-- 
2.37.1.595.g718a3a8f04-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
