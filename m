Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A20C54798
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 00:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GRnm8qkP2yz4zT4QL8RllDwO7o/EDvxQfv/mKuwjkWc=; b=cld5JmFGgmMBel
	YQ+wsdkHXXrabbJASeCYF7ETgfbCZpCMNrDzp3iSj/F5bKjECatbkta4QTR4NIsG3PWDw4M9ROjH5
	6Yr70MDtCw9s025/iGFJon5PjpmN/wS7NW68n12R9OwKzKiTaXZisBqfNxWcVwSewFDvZKVxqx/PA
	FNV2UnGiXobHegWH5PE7MlyWcEwhfTFJzEc0rByVzfAaQy4aYNOMgHZMNHtXKlt9B9+IJSuNCnioh
	s4IEFrFZoC6EAZ2NqJasdgVoS61ca/XgmjwqZNp/z8P8mp2g3lSBlpReMP5F1aouH0WFDLwxyXAEB
	0BJTwstvdBS3X/uh5M3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJhH-00000007F5E-0RfC;
	Fri, 23 Feb 2024 00:45:52 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJem-00000007Dtr-1Hi8
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 00:43:20 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6e089fc10c9so141411b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 16:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708648995; x=1709253795; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=5xSck0kmkPmdifT3b5IqGmDzhnUFDNPygC9r66kostc=;
        b=sqMZa+CY714d9T+PSaPpTgJBH6B9jLzGbrX278O6nIM8OGsPZb/ewa2VOtteAH+SMM
         yiZQMr2Mc/1BRza0Evzg0RGL0m/1xlnd1r52O9gAB5dvhQUHlZ02qkQEObrxIX5nanx/
         See3zkdxSmzi2lmdO0fbCu68TzCA3KZ/iimmksc1d5D1pO3PU+3VVwOmj9I2uGNLrH/V
         HJnzIN6Ck9L0fRTe1/qgG0OsV9BEpg59wCIP23TkPkQXM1wAVNhiVhct3aF8TjXzsynz
         OOC2SyYfJmivC2lObw3JJ008JH261I1Tz/RirU0JtsVIRlxH/9gt1wdIlF/qCDaa0CW0
         AhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708648995; x=1709253795;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xSck0kmkPmdifT3b5IqGmDzhnUFDNPygC9r66kostc=;
        b=bXfHuZMaKY7/vCyaEZQ3wPftVAcAfLM0iav6F4todUr5x6hsDbW/5quAbKMIJoAKR2
         QyhwhTsjrU7uiwJh4hAHuoCG6TLC6/DF49J2pGD5GKTwrsxJvDBrdrZ5hWNlFpdKJhWn
         4259RZGyq2b9Fz2YcS/DRhORrtvfAM2sdbjnagAS11lgrG87D+YgaKhQD+6gI2HXwO6O
         AN9kba+4LMzQLjNb9LahRpjLyzHuO02QRAU0BXjDNwvjeiEQC6qmV2YwM3IsE4+a23WW
         9G0PJUeBUkhh6llRQbr3h9jyZlLeFfNp7/JJuRWPMTviyrdwNY3h6keUQYg1L8Gp7T5e
         WvPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFwFSFRp8WryZ6ZjcqyjPn8X3imhDtyWPeVhhW4JsSS+y+ERo/GA9RmzEu4hLsC++UrqJcAfkR39GrgUUUI3tP+IUQVdYKBp7oLeZCPmjk
X-Gm-Message-State: AOJu0Yxzcg6doiooeFgaDRvoJekrhN9XsoWWiETR8wVRgZ+O5jCpHA6J
	r0O3DxXpkdxbt3A7uFp97pTNwogec5OhRi7kdti3sZy/hPlGS+kRRyjTIp93qLlD1n3WwZwGFFe
	g0A==
X-Google-Smtp-Source: AGHT+IFB6M2rOVCDVxCF+KOWKQZKQwIJ1lp1wD007XU4N9VSw/D1xYHfznSXOlgl1HSeFtLBBbcKp5MS4rw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:23c7:b0:6e4:d2ba:b4c4 with SMTP id
 g7-20020a056a0023c700b006e4d2bab4c4mr40112pfc.3.1708648995172; Thu, 22 Feb
 2024 16:43:15 -0800 (PST)
Date: Thu, 22 Feb 2024 16:42:54 -0800
In-Reply-To: <20240223004258.3104051-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240223004258.3104051-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240223004258.3104051-8-seanjc@google.com>
Subject: [PATCH v9 07/11] KVM: selftests: Allow tagging protected memory in
 guest page tables
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Andrew Jones <andrew.jones@linux.dev>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Carlos Bilbao <carlos.bilbao@amd.com>, 
	Peter Gonda <pgonda@google.com>, Itaru Kitayama <itaru.kitayama@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_164316_511586_47F0F9E5 
X-CRM114-Status: GOOD (  19.61  )
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

From: Peter Gonda <pgonda@google.com>

Add support for tagging and untagging guest physical address, e.g. to
allow x86's SEV and TDX guests to embed shared vs. private information in
the GPA.  SEV (encryption, a.k.a. C-bit) and TDX (shared, a.k.a. S-bit)
steal bits from the guest's physical address space that is consumed by the
CPU metadata, i.e. effectively aliases the "real" GPA.

Implement generic "tagging" so that the shared vs. private metadata can be
managed by x86 without bleeding too many details into common code.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Ackerly Tng <ackerleytng@google.com>
cc: Andrew Jones <andrew.jones@linux.dev>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>
Tested-by: Carlos Bilbao <carlos.bilbao@amd.com>
Originally-by: Michael Roth <michael.roth@amd.com>
Signed-off-by: Peter Gonda <pgonda@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../kvm/include/aarch64/kvm_util_arch.h       |  7 +++++++
 .../selftests/kvm/include/kvm_util_base.h     | 13 ++++++++++++
 .../kvm/include/riscv/kvm_util_arch.h         |  7 +++++++
 .../kvm/include/s390x/kvm_util_arch.h         |  7 +++++++
 .../kvm/include/x86_64/kvm_util_arch.h        | 21 +++++++++++++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 17 +++++++++++++++
 .../selftests/kvm/lib/x86_64/processor.c      | 15 ++++++++++++-
 7 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h

diff --git a/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
new file mode 100644
index 000000000000..218f5cdf0d86
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
+#define _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
+
+struct kvm_vm_arch {};
+
+#endif  // _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index cb3159af6db3..4b266dc0c9bd 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -18,9 +18,11 @@
 #include <linux/types.h>
 
 #include <asm/atomic.h>
+#include <asm/kvm.h>
 
 #include <sys/ioctl.h>
 
+#include "kvm_util_arch.h"
 #include "sparsebit.h"
 
 /*
@@ -113,6 +115,9 @@ struct kvm_vm {
 	vm_vaddr_t idt;
 	vm_vaddr_t handlers;
 	uint32_t dirty_ring_size;
+	uint64_t gpa_tag_mask;
+
+	struct kvm_vm_arch arch;
 
 	/* Cache of information for binary stats interface */
 	int stats_fd;
@@ -605,6 +610,12 @@ void *addr_gva2hva(struct kvm_vm *vm, vm_vaddr_t gva);
 vm_paddr_t addr_hva2gpa(struct kvm_vm *vm, void *hva);
 void *addr_gpa2alias(struct kvm_vm *vm, vm_paddr_t gpa);
 
+
+static inline vm_paddr_t vm_untag_gpa(struct kvm_vm *vm, vm_paddr_t gpa)
+{
+	return gpa & ~vm->gpa_tag_mask;
+}
+
 void vcpu_run(struct kvm_vcpu *vcpu);
 int _vcpu_run(struct kvm_vcpu *vcpu);
 
@@ -1114,4 +1125,6 @@ void kvm_selftest_arch_init(void);
 
 void kvm_arch_vm_post_create(struct kvm_vm *vm);
 
+bool vm_is_gpa_protected(struct kvm_vm *vm, vm_paddr_t paddr);
+
 #endif /* SELFTEST_KVM_UTIL_BASE_H */
diff --git a/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h b/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
new file mode 100644
index 000000000000..c8280d5659ce
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _TOOLS_LINUX_ASM_RISCV_KVM_HOST_H
+#define _TOOLS_LINUX_ASM_RISCV_KVM_HOST_H
+
+struct kvm_vm_arch {};
+
+#endif  // _TOOLS_LINUX_ASM_RISCV_KVM_HOST_H
diff --git a/tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h b/tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h
new file mode 100644
index 000000000000..4c4c1c1e4bf8
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _TOOLS_LINUX_ASM_S390_KVM_HOST_H
+#define _TOOLS_LINUX_ASM_S390_KVM_HOST_H
+
+struct kvm_vm_arch {};
+
+#endif  // _TOOLS_LINUX_ASM_S390_KVM_HOST_H
diff --git a/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
new file mode 100644
index 000000000000..17bb38236d97
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _TOOLS_LINUX_ASM_X86_KVM_HOST_H
+#define _TOOLS_LINUX_ASM_X86_KVM_HOST_H
+
+#include <stdbool.h>
+#include <stdint.h>
+
+struct kvm_vm_arch {
+	uint64_t c_bit;
+	uint64_t s_bit;
+};
+
+static inline bool __vm_arch_has_protected_memory(struct kvm_vm_arch *arch)
+{
+	return arch->c_bit || arch->s_bit;
+}
+
+#define vm_arch_has_protected_memory(vm) \
+	__vm_arch_has_protected_memory(&(vm)->arch)
+
+#endif  // _TOOLS_LINUX_ASM_X86_KVM_HOST_H
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index e7f4f84f2e68..19511137d1ae 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1597,6 +1597,8 @@ void *addr_gpa2hva(struct kvm_vm *vm, vm_paddr_t gpa)
 {
 	struct userspace_mem_region *region;
 
+	gpa = vm_untag_gpa(vm, gpa);
+
 	region = userspace_mem_region_find(vm, gpa, gpa);
 	if (!region) {
 		TEST_FAIL("No vm physical memory at 0x%lx", gpa);
@@ -2305,3 +2307,18 @@ void __attribute((constructor)) kvm_selftest_init(void)
 
 	kvm_selftest_arch_init();
 }
+
+bool vm_is_gpa_protected(struct kvm_vm *vm, vm_paddr_t paddr)
+{
+	sparsebit_idx_t pg = 0;
+	struct userspace_mem_region *region;
+
+	if (!vm_arch_has_protected_memory(vm))
+		return false;
+
+	region = userspace_mem_region_find(vm, paddr, paddr);
+	TEST_ASSERT(region, "No vm physical memory at 0x%lx", paddr);
+
+	pg = paddr >> vm->page_shift;
+	return sparsebit_is_set(region->protected_phy_pages, pg);
+}
diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 615d05247470..6c1d2c0ec584 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -157,6 +157,8 @@ static uint64_t *virt_create_upper_pte(struct kvm_vm *vm,
 {
 	uint64_t *pte = virt_get_pte(vm, parent_pte, vaddr, current_level);
 
+	paddr = vm_untag_gpa(vm, paddr);
+
 	if (!(*pte & PTE_PRESENT_MASK)) {
 		*pte = PTE_PRESENT_MASK | PTE_WRITABLE_MASK;
 		if (current_level == target_level)
@@ -200,6 +202,8 @@ void __virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr, int level)
 		    "Physical address beyond maximum supported,\n"
 		    "  paddr: 0x%lx vm->max_gfn: 0x%lx vm->page_size: 0x%x",
 		    paddr, vm->max_gfn, vm->page_size);
+	TEST_ASSERT(vm_untag_gpa(vm, paddr) == paddr,
+		    "Unexpected bits in paddr: %lx", paddr);
 
 	/*
 	 * Allocate upper level page tables, if not already present.  Return
@@ -222,6 +226,15 @@ void __virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr, int level)
 	TEST_ASSERT(!(*pte & PTE_PRESENT_MASK),
 		    "PTE already present for 4k page at vaddr: 0x%lx", vaddr);
 	*pte = PTE_PRESENT_MASK | PTE_WRITABLE_MASK | (paddr & PHYSICAL_PAGE_MASK);
+
+	/*
+	 * Neither SEV nor TDX supports shared page tables, so only the final
+	 * leaf PTE needs manually set the C/S-bit.
+	 */
+	if (vm_is_gpa_protected(vm, paddr))
+		*pte |= vm->arch.c_bit;
+	else
+		*pte |= vm->arch.s_bit;
 }
 
 void virt_arch_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr)
@@ -496,7 +509,7 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
 	 * No need for a hugepage mask on the PTE, x86-64 requires the "unused"
 	 * address bits to be zero.
 	 */
-	return PTE_GET_PA(*pte) | (gva & ~HUGEPAGE_MASK(level));
+	return vm_untag_gpa(vm, PTE_GET_PA(*pte)) | (gva & ~HUGEPAGE_MASK(level));
 }
 
 static void kvm_setup_gdt(struct kvm_vm *vm, struct kvm_dtable *dt)
-- 
2.44.0.rc0.258.g7320e95886-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
