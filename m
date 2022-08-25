Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C158ECAAA2
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Aug 2022 23:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0kMpiVPA0TFTjATKtmasksh6Fe8FJA/ieKHNZiqN+DE=; b=jahZQFnhAsWXEP
	v7YIVwqTwyYpmbXNCZlnNwCOmBED5uQaIAuogBvXdlHByI1Fy8SKkjfsyFwYnih80YXlVH++p3oO9
	3x6X25oRzg70hKpE5eAL/PUHOtA8u4RNdHVVISRdpz3gu1o3StTLP4EYgdx5S7Hqr3Y49fhDriy0S
	5YCOHQuqUMk8slu8nhMYdkHceC4Jei1dOM4666qu9T7KXp9HlAT2FMndAxXESyr+v/qIHqHi6JqAJ
	hwGaXwzsBQx0ieiki7RO5kWAWOuuPrZYBm8IHsilVIl8n77CjZ5PuKEY2ritYVGGG41aFQWY80zrc
	Q5lF8YKAewlDQzradIGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRMkh-004JPt-Mi; Thu, 25 Aug 2022 23:59:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRMkf-004JDO-6L
	for linux-riscv@bombadil.infradead.org; Thu, 25 Aug 2022 23:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gMN8DAWXzBJk9iSBUfW/QyFFZWZuY8KBpYav4gTwpSU=; b=fGww3Ane/FvA65EUzD7RV0Cn32
	DVLPtwT/TM3cVFK3WOhC+V15Vbd5lC4GSum+oNVTrzi7evrVWm1jPe7C7+qx1X1hyO53GnrAKjkIV
	ss6r20Lk0d0aDFlaXy9Icyudv9WrfRKaam5aYtw2IY0VqQELq8FQBGcuQDmhrK2bPvcWQu7qYlvQi
	fua/bysyGjBm5iVkH/xEF9hTW1bPzLBgkGgpE2HMlB4LXxzMAjL4wXGkdrCz/i1SykRNGl+q/+pOD
	sizHDZ1ikA+cI7nQlYAmLpHOG0FNSAEABiwbVfOWdM0lyOZL2+m4KdFPx1RD+ISn4Je9x6mA+SMNw
	t+fR5Asw==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRMEN-0068wy-0Z
	for linux-riscv@lists.infradead.org; Thu, 25 Aug 2022 23:25:50 +0000
Received: by mail-pj1-x1049.google.com with SMTP id d16-20020a17090ad3d000b001fb42eb7467so17665pjw.9
        for <linux-riscv@lists.infradead.org>; Thu, 25 Aug 2022 16:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc;
        bh=gMN8DAWXzBJk9iSBUfW/QyFFZWZuY8KBpYav4gTwpSU=;
        b=k/VnPS3Avcyf8y12Dai2ATcxUmpDEFAlHtqHWSKGhxjT4Vhlo5GsmzjzRovXIQoToK
         /cVnaYr1ykESlLVNNK+t2ufwentaza0JW4BtboHI9Qw5XauRoBxkJ/LyoQWOKOFiEGSS
         n2G3NVh/e1Mqwx+mvIROA5QEpmujoLPwX5icVZ2O/E1FhBbbE5MyCHYy3lBaAPoGMPyB
         Fbql0NmIiOpXf61dCJzjhY8uPTCZSQNe9T+DA4FM9plfxEWLbxHR+3oVvrcvveq/goce
         vvXk5VPAuVoOQ8+nMdblfbru4J2Ipl2Jcjxwm/E9+nZvI14q8jW5EE1Fu7yGL6JMksCY
         94aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc;
        bh=gMN8DAWXzBJk9iSBUfW/QyFFZWZuY8KBpYav4gTwpSU=;
        b=fcckPkBZgQzYFtzC5S15K8wiLYUU4w7Rh8fwGgZwe9m0I5+YQZHSrKG0204KuDu+fz
         OFl/htpUkBhfEP535k57Xq5h1v160UB1909ZlTq/6zK8u6xGssUb0pbOewt+VGhe/PlM
         fHKdrMz3Kb7b9cK71U2siEpTHKuPx3rkE6uea28exUsPn1aciin22i5bVI0xYk2TiKKE
         FGPo0TTbri9YVSEw1b6Bb63AnceYtQobiY+bxtDtV8O+FOUgDx//sRnv80wMxlXz0pky
         XISjwusqJWp7FvxHGXuoJFI4WNcMpc+/ihZ4KXcLtRQVsJ/RjyBMPLJkMJlPhdA/ofgT
         1ccA==
X-Gm-Message-State: ACgBeo0VY3zs+N0COK6/pO7XFH1CDUUTeQ6kq63WXQAwj6ldNtXNf5SA
	a0/bzctpFkF1ob8POuCg8bE1aAvVCA8=
X-Google-Smtp-Source: AA6agR4puys/Z5jXTPDaJYPynDwF4eqnZlaLYimDxxudykXc1F+A7TB7h00cz8hneIZ8xf4MI9E8Jl/4Eh0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:10ca:b0:536:ec31:827c with SMTP id
 d10-20020a056a0010ca00b00536ec31827cmr1221322pfu.67.1661469933060; Thu, 25
 Aug 2022 16:25:33 -0700 (PDT)
Date: Thu, 25 Aug 2022 23:25:20 +0000
In-Reply-To: <20220825232522.3997340-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220825232522.3997340-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220825232522.3997340-6-seanjc@google.com>
Subject: [PATCH v5 5/7] KVM: selftests: Make arm64's MMIO ucall multi-VM friendly
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
X-CRM114-CacheID: sfid-20220826_002548_312156_53643DB4 
X-CRM114-Status: GOOD (  15.99  )
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
global in the host is not thread-safe.  To fix that bug, add
write_guest_global() to allow stuffing a VM's copy of a "global" without
modifying the host value.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h     | 15 +++++++++++++++
 .../testing/selftests/kvm/lib/aarch64/ucall.c | 19 ++++++++++++++-----
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 24fde97f6121..59d52b58a1a6 100644
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
@@ -714,6 +716,19 @@ kvm_userspace_memory_region_find(struct kvm_vm *vm, uint64_t start,
 	memcpy(&(g), _p, sizeof(g));				\
 })
 
+/*
+ * Write a global value, but only in the VM's (guest's) domain.  Primarily used
+ * for "globals" that hold per-VM values (VMs always duplicate code and global
+ * data into their own region of physical memory), but can be used anytime it's
+ * undesirable to change the host's copy of the global.
+ */
+#define write_guest_global(vm, g, val) ({			\
+	typeof(g) *_p = addr_gva2hva(vm, (vm_vaddr_t)&(g));	\
+	typeof(g) _val = val;					\
+								\
+	memcpy(_p, &(_val), sizeof(g));				\
+})
+
 void assert_on_unhandled_exception(struct kvm_vcpu *vcpu);
 
 void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu,
diff --git a/tools/testing/selftests/kvm/lib/aarch64/ucall.c b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
index f02ae27c3e43..1c38bd260f90 100644
--- a/tools/testing/selftests/kvm/lib/aarch64/ucall.c
+++ b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
@@ -6,20 +6,29 @@
  */
 #include "kvm_util.h"
 
+/*
+ * ucall_exit_mmio_addr holds per-VM values (global data is duplicated by each
+ * VM), it must not be accessed from host code.
+ */
 static vm_vaddr_t *ucall_exit_mmio_addr;
 
+static void ucall_set_mmio_addr(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
+{
+	vm->ucall_mmio_addr = mmio_gpa;
+
+	write_guest_global(vm, ucall_exit_mmio_addr, (vm_vaddr_t *)mmio_gpa);
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
@@ -32,7 +41,7 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 	struct kvm_run *run = vcpu->run;
 
 	if (run->exit_reason == KVM_EXIT_MMIO &&
-	    run->mmio.phys_addr == (uint64_t)ucall_exit_mmio_addr) {
+	    run->mmio.phys_addr == vcpu->vm->ucall_mmio_addr) {
 		vm_vaddr_t gva;
 
 		TEST_ASSERT(run->mmio.is_write && run->mmio.len == 8,
-- 
2.37.2.672.g94769d06f0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
