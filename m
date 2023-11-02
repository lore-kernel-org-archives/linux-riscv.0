Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34886C4167D
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 16:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxL//VtV5dvqgqYDxG5TM4IV8yq0wuT8ocUNpV+3Doo=; b=zLOmBc95d18EUm
	NhVWJH4zF8Z0VInIO4vD2Ljx35O+L5VbGETZVABY5UBzpez6noB/sBW/nQ45orvRhFXu3JND7eLjk
	2ISHakDIsnomhq1uhM3XxgyQM8iLejse7WiNFRcye4KqlLNuXOYp6KJ9zocY9XC3/P4Mj+YBwEl8y
	TajaxrMaEPKI7c/TAu69OTNx5gdcQiKyq+Y6wx0OHm2sJ5/N6nYFrfKdAbdznM01/9r3qP3S6Ypcy
	kWJxEOWUMbxhdsL7+5qvGv7sPkbaD9TYr7nzcc5bktK3+FW97LSInevFXQCIE36u6XD16/xup/5XS
	LZMqg7Mu44fIFUTl3aLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyadF-009s1p-32;
	Thu, 02 Nov 2023 16:33:21 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyad9-009ry7-0L;
	Thu, 02 Nov 2023 16:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698942795; x=1730478795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=mmQ4GOTO4KU5w2zIncOEX5knljJfXLvvwf+40dFjEo8=;
  b=awiXp4STEj5P/gSGVmOGmPZrg5rPPMTuzYY3ZG6bdD0588IOII4My256
   tTkhPf0EpXq2stjZPDL+oZUwBmSVocbHvgf9hya4Gpf5bQ/L+PFH/Y2jp
   PAf9DRPoJs+qRqrUZSq+eou+qTaXE+N/bweiN7v9uyxRSHeSbcPavwPcP
   Hq1xdDhMOfYOaT8CgjqJTnizNEZfy9MpjPGXY16YqI9WbuBcz1zpn7Dvo
   yN4Mt2RzAUz9wDzEIBVqFKFXZ6RV/YdDQ/eG0nphOdtVGuq1shIaC+glg
   K0pt8w08RApuqvNRhR11kq0WRnEVHgC3McLlJDg5mIjn6Did2bE3e99Kf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="388570891"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="388570891"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 09:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="9448419"
Received: from arthur-vostro-3668.sh.intel.com ([10.239.159.65])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 09:33:09 -0700
From: Zeng Guang <guang.zeng@intel.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Zeng Guang <guang.zeng@intel.com>
Subject: [RFC PATCH v1 2/8] KVM: selftests: x86: Support guest running on canonical linear-address organization
Date: Thu,  2 Nov 2023 23:51:05 +0800
Message-Id: <20231102155111.28821-3-guang.zeng@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231102155111.28821-1-guang.zeng@intel.com>
References: <20231102155111.28821-1-guang.zeng@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_093315_175140_ACCE5B0C 
X-CRM114-Status: GOOD (  16.90  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Setup execution environment running on 64-bit linear addresses for
user and supervisor mode.

Define the linear address based on 48-bit canonical format in which
bits 63:47 of the address are identical. All addresses to system data
structure are shifted to supervisor-mode address space.

Extend page table mapping for supervisor mode to same guest physical
address. This allows guest in supervisor mode can run in the
corresponding canonical linear address space.

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
---
 .../selftests/kvm/include/x86_64/processor.h  |  6 ++++
 tools/testing/selftests/kvm/lib/kvm_util.c    |  6 ++--
 .../selftests/kvm/lib/x86_64/processor.c      | 28 ++++++++++++-------
 3 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
index 25bc61dac5fb..00f7337a520a 100644
--- a/tools/testing/selftests/kvm/include/x86_64/processor.h
+++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
@@ -1256,4 +1256,10 @@ void virt_map_level(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
 #define PFERR_GUEST_PAGE_MASK	BIT_ULL(PFERR_GUEST_PAGE_BIT)
 #define PFERR_IMPLICIT_ACCESS	BIT_ULL(PFERR_IMPLICIT_ACCESS_BIT)
 
+/*
+ * X86 kernel linear address defines
+ */
+#define KERNEL_LNA_OFFSET 0xffff800000000000
+#define KERNEL_ADDR(x) ((void *)(x) + KERNEL_LNA_OFFSET)
+
 #endif /* SELFTEST_KVM_PROCESSOR_H */
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 7a8af1821f5d..584f111620f3 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -337,9 +337,11 @@ static uint64_t vm_nr_pages_required(enum vm_guest_mode mode,
 	 * smallest page size is used. Considering each page contains x page
 	 * table descriptors, the total extra size for page tables (for extra
 	 * N pages) will be: N/x+N/x^2+N/x^3+... which is definitely smaller
-	 * than N/x*2.
+	 * than N/x*2. To support mapping one set of physical addresses both
+	 * to user-mode addresses and supervisor-mode addresses, it's proper
+	 * to extend the page size to N/x*4.
 	 */
-	nr_pages += (nr_pages + extra_mem_pages) / PTES_PER_MIN_PAGE * 2;
+	nr_pages += (nr_pages + extra_mem_pages) / PTES_PER_MIN_PAGE * 4;
 
 	/* Account for the number of pages needed by ucall. */
 	nr_pages += ucall_nr_pages_required(page_size);
diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 9f4b8c47edce..6f4295a13d00 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -227,6 +227,13 @@ void __virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr, int level)
 void virt_arch_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr)
 {
 	__virt_pg_map(vm, vaddr, paddr, PG_LEVEL_4K);
+
+	/*
+	 * Map same paddr to kernel linear address space. Make execution
+	 * environment supporting running both in user and kernel mode.
+	 */
+	if (!(vaddr & BIT_ULL(63)))
+		__virt_pg_map(vm, (uint64_t)KERNEL_ADDR(vaddr), paddr, PG_LEVEL_4K);
 }
 
 void virt_map_level(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
@@ -505,7 +512,7 @@ static void kvm_setup_gdt(struct kvm_vm *vm, struct kvm_dtable *dt)
 	if (!vm->gdt)
 		vm->gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
 
-	dt->base = vm->gdt;
+	dt->base = (unsigned long)KERNEL_ADDR(vm->gdt);
 	dt->limit = getpagesize();
 }
 
@@ -516,7 +523,7 @@ static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
 		vm->tss = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
 
 	memset(segp, 0, sizeof(*segp));
-	segp->base = vm->tss;
+	segp->base = (unsigned long)KERNEL_ADDR(vm->tss);
 	segp->limit = 0x67;
 	segp->selector = selector;
 	segp->type = 0xb;
@@ -597,8 +604,8 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
 	/* Setup guest general purpose registers */
 	vcpu_regs_get(vcpu, &regs);
 	regs.rflags = regs.rflags | 0x2;
-	regs.rsp = stack_vaddr;
-	regs.rip = (unsigned long) guest_code;
+	regs.rsp = (unsigned long)KERNEL_ADDR(stack_vaddr);
+	regs.rip = (unsigned long)KERNEL_ADDR(guest_code);
 	vcpu_regs_set(vcpu, &regs);
 
 	/* Setup the MP state */
@@ -1103,8 +1110,9 @@ void vm_init_descriptor_tables(struct kvm_vm *vm)
 	vm->handlers = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
 	/* Handlers have the same address in both address spaces.*/
 	for (i = 0; i < NUM_INTERRUPTS; i++)
-		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0,
-			DEFAULT_CODE_SELECTOR);
+		set_idt_entry(vm, i,
+			      (unsigned long)KERNEL_ADDR((unsigned long)(&idt_handlers)[i]),
+			      0, DEFAULT_CODE_SELECTOR);
 }
 
 void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
@@ -1113,13 +1121,13 @@ void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
 	struct kvm_sregs sregs;
 
 	vcpu_sregs_get(vcpu, &sregs);
-	sregs.idt.base = vm->idt;
+	sregs.idt.base = (unsigned long)KERNEL_ADDR(vm->idt);
 	sregs.idt.limit = NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
-	sregs.gdt.base = vm->gdt;
+	sregs.gdt.base = (unsigned long)KERNEL_ADDR(vm->gdt);
 	sregs.gdt.limit = getpagesize() - 1;
 	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
 	vcpu_sregs_set(vcpu, &sregs);
-	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
+	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = (vm_vaddr_t)KERNEL_ADDR(vm->handlers);
 }
 
 void vm_install_exception_handler(struct kvm_vm *vm, int vector,
@@ -1127,7 +1135,7 @@ void vm_install_exception_handler(struct kvm_vm *vm, int vector,
 {
 	vm_vaddr_t *handlers = (vm_vaddr_t *)addr_gva2hva(vm, vm->handlers);
 
-	handlers[vector] = (vm_vaddr_t)handler;
+	handlers[vector] = handler ? (vm_vaddr_t)KERNEL_ADDR(handler) : (vm_vaddr_t)NULL;
 }
 
 void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
-- 
2.21.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
