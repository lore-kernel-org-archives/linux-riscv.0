Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8168CC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 16:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kume10rCTDoUy8mAAUcC69OncZMQHTcvViUaykObDKM=; b=mM2G7CllzqtjXq
	w3uDWr451yIOvs3/gMavNjeSev/K38vEBMbFH+cMNeu/Nc+eQ4LxG1ZA04Xdeo7dYbh61lOPSuq1I
	pmnpm4gv29VFR+WF/IIpHGJ7vXIanEBVTEd9hmjwDFsHSvieQvsOc8oGNJqY+LRM4iV3ezOkqZESK
	CUj6IsEijT174bxastN/eFevScoe+RtxEHjr+hSEsO4NybZoARRqp7TZ3yLhRSUDZauJTNJU+Gd2g
	k+s6uHmRSigVlG0/UugFbBOlXNxsVDC+76utelWanPTRGdppkFB36FU5XXxwWpnc+RXAggCBivj7z
	aEQ/5V+KUowd7nAOBxBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyadT-009sFV-0w;
	Thu, 02 Nov 2023 16:33:35 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyadM-009s6p-0V;
	Thu, 02 Nov 2023 16:33:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698942808; x=1730478808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WxHy+lyqLdvpJ5ob22qLT8DuRUFaYkwxGfUFQQncCmI=;
  b=R0TWpNISgYoTfhV9Wgl5YAyUAwfEOykKVhoBJiUc4V2mX/ANavjPw3jP
   OUvCISwqqtTQ1WIw0PR2PuOeRE51qM2ip7CgC1Qz02WYk8pQgpwyPEkTk
   BMkVcEIXwFzcG+d5rwBBfZ4eOvJ4CbYEkmiT0m6dEWNmCR2Fz6l0vA3a7
   wMNcGYa1CDroebj7DvIubZVNO2DeTZrZywhQQrMWZJMuKWvYfFWbBm8I6
   Il+ntINBFyrSxcT/c/p60zl6mb2vEnN7wc3xcCClCPj9LW1VosgSuic6N
   /Wd4xV4EIhldOmvuczYpKrx6Xny08hf4TGTYi3FJitRclgu0mtwsRoRlT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="388571002"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="388571002"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 09:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="9448507"
Received: from arthur-vostro-3668.sh.intel.com ([10.239.159.65])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 09:33:23 -0700
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
Subject: [RFC PATCH v1 5/8] KVM: selftests: x86: Prepare setup for user mode support
Date: Thu,  2 Nov 2023 23:51:08 +0800
Message-Id: <20231102155111.28821-6-guang.zeng@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231102155111.28821-1-guang.zeng@intel.com>
References: <20231102155111.28821-1-guang.zeng@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_093328_257850_96CAB7B2 
X-CRM114-Status: GOOD (  15.46  )
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

Extend the page size of stack memory that can be shared for user mode.
And configure the canonical linear address of the stack point(RSP0) for
privilege level 0 in TSS segment which processor will use to switch task,
e.g. from user mode back to supervisor mode triggered by interrupt.

Refactor KVM segment set API to support user mode setup.

No functional change intended.

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
---
 .../selftests/kvm/include/kvm_util_base.h     |  3 +-
 .../selftests/kvm/include/x86_64/processor.h  | 18 +++++++++
 .../selftests/kvm/lib/x86_64/processor.c      | 37 +++++++++++++------
 3 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index dbaa2cf83c1c..6f580bc519f4 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -71,6 +71,7 @@ struct kvm_vcpu {
 	struct kvm_dirty_gfn *dirty_gfns;
 	uint32_t fetch_index;
 	uint32_t dirty_gfns_count;
+	uint64_t stack_vaddr;
 };
 
 struct userspace_mem_regions {
@@ -167,7 +168,7 @@ static inline struct userspace_mem_region *vm_get_mem_region(struct kvm_vm *vm,
 #define KVM_GUEST_PAGE_TABLE_MIN_PADDR	0x180000
 
 #define DEFAULT_GUEST_STACK_VADDR_MIN	0xab6000
-#define DEFAULT_STACK_PGS		5
+#define DEFAULT_STACK_PGS		10
 
 enum vm_guest_mode {
 	VM_MODE_P52V48_4K,
diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
index 00f7337a520a..4b167e3e0370 100644
--- a/tools/testing/selftests/kvm/include/x86_64/processor.h
+++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
@@ -1072,6 +1072,24 @@ struct ex_regs {
 	uint64_t rflags;
 };
 
+struct tss64_t {
+	uint32_t res1;
+	uint64_t rsp0;
+	uint64_t rsp1;
+	uint64_t rsp2;
+	uint64_t res2;
+	uint64_t ist1;
+	uint64_t ist2;
+	uint64_t ist3;
+	uint64_t ist4;
+	uint64_t ist5;
+	uint64_t ist6;
+	uint64_t ist7;
+	uint64_t res3;
+	uint16_t res4;
+	uint16_t iomap_base;
+} __attribute__((packed));
+
 struct idt_entry {
 	uint16_t offset0;
 	uint16_t selector;
diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 525b714ee13c..487e1f829031 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -16,6 +16,9 @@
 
 #define DEFAULT_CODE_SELECTOR 0x8
 #define DEFAULT_DATA_SELECTOR 0x10
+#define DEFAULT_TSS_SELECTOR 0x18
+#define USER_CODE_SELECTOR 0x23
+#define USER_DATA_SELECTOR 0x2B
 
 #define MAX_NR_CPUID_ENTRIES 100
 
@@ -442,7 +445,7 @@ static void kvm_seg_fill_gdt_64bit(struct kvm_vm *vm, struct kvm_segment *segp)
 
 
 /*
- * Set Long Mode Flat Kernel Code Segment
+ * Set Long Mode Flat Code Segment
  *
  * Input Args:
  *   vm - VM whose GDT is being filled, or NULL to only write segp
@@ -454,14 +457,16 @@ static void kvm_seg_fill_gdt_64bit(struct kvm_vm *vm, struct kvm_segment *segp)
  * Return: None
  *
  * Sets up the KVM segment pointed to by @segp, to be a code segment
- * with the selector value given by @selector.
+ * with the selector value given by @selector. The @selector.dpl
+ * decides the descriptor privilege level, user or kernel.
  */
-static void kvm_seg_set_kernel_code_64bit(struct kvm_vm *vm, uint16_t selector,
+static void kvm_seg_set_code_64bit(struct kvm_vm *vm, uint16_t selector,
 	struct kvm_segment *segp)
 {
 	memset(segp, 0, sizeof(*segp));
 	segp->selector = selector;
 	segp->limit = 0xFFFFFFFFu;
+	segp->dpl = selector & 0x3;
 	segp->s = 0x1; /* kTypeCodeData */
 	segp->type = 0x08 | 0x01 | 0x02; /* kFlagCode | kFlagCodeAccessed
 					  * | kFlagCodeReadable
@@ -474,7 +479,7 @@ static void kvm_seg_set_kernel_code_64bit(struct kvm_vm *vm, uint16_t selector,
 }
 
 /*
- * Set Long Mode Flat Kernel Data Segment
+ * Set Long Mode Flat Data Segment
  *
  * Input Args:
  *   vm - VM whose GDT is being filled, or NULL to only write segp
@@ -486,14 +491,16 @@ static void kvm_seg_set_kernel_code_64bit(struct kvm_vm *vm, uint16_t selector,
  * Return: None
  *
  * Sets up the KVM segment pointed to by @segp, to be a data segment
- * with the selector value given by @selector.
+ * with the selector value given by @selector. The @selector.dpl
+ * decides the descriptor privilege level, user or kernel.
  */
-static void kvm_seg_set_kernel_data_64bit(struct kvm_vm *vm, uint16_t selector,
+static void kvm_seg_set_data_64bit(struct kvm_vm *vm, uint16_t selector,
 	struct kvm_segment *segp)
 {
 	memset(segp, 0, sizeof(*segp));
 	segp->selector = selector;
 	segp->limit = 0xFFFFFFFFu;
+	segp->dpl = selector & 0x3;
 	segp->s = 0x1; /* kTypeCodeData */
 	segp->type = 0x00 | 0x01 | 0x02; /* kFlagData | kFlagDataAccessed
 					  * | kFlagDataWritable
@@ -561,10 +568,10 @@ static void vcpu_setup(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 		sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
 
 		kvm_seg_set_unusable(&sregs.ldt);
-		kvm_seg_set_kernel_code_64bit(vm, DEFAULT_CODE_SELECTOR, &sregs.cs);
-		kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.ds);
-		kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.es);
-		kvm_setup_tss_64bit(vm, &sregs.tr, 0x18);
+		kvm_seg_set_code_64bit(vm, DEFAULT_CODE_SELECTOR, &sregs.cs);
+		kvm_seg_set_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.ds);
+		kvm_seg_set_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.es);
+		kvm_setup_tss_64bit(vm, &sregs.tr, DEFAULT_TSS_SELECTOR);
 		break;
 
 	default:
@@ -589,6 +596,7 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
 	struct kvm_regs regs;
 	vm_vaddr_t stack_vaddr;
 	struct kvm_vcpu *vcpu;
+	struct tss64_t *tss_hva;
 
 	stack_vaddr = __vm_vaddr_alloc(vm, DEFAULT_STACK_PGS * getpagesize(),
 				       DEFAULT_GUEST_STACK_VADDR_MIN,
@@ -613,6 +621,13 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
 	vcpu_init_cpuid(vcpu, kvm_get_supported_cpuid());
 	vcpu_setup(vm, vcpu);
 
+	/* Save address of stack pool used for vCPU */
+	vcpu->stack_vaddr = stack_vaddr;
+
+	/* Setup canonical linear address form of the RSP0 for task switch */
+	tss_hva = (struct tss64_t *)addr_gva2hva(vm, vm->tss);
+	tss_hva->rsp0 = (uint64_t)KERNEL_ADDR(stack_vaddr);
+
 	/* Setup guest general purpose registers */
 	vcpu_regs_get(vcpu, &regs);
 	regs.rflags = regs.rflags | 0x2;
@@ -1137,7 +1152,7 @@ void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
 	sregs.idt.limit = NUM_INTERRUPTS * sizeof(struct idt_entry) - 1;
 	sregs.gdt.base = (unsigned long)KERNEL_ADDR(vm->gdt);
 	sregs.gdt.limit = getpagesize() - 1;
-	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
+	kvm_seg_set_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
 	vcpu_sregs_set(vcpu, &sregs);
 	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = (vm_vaddr_t)KERNEL_ADDR(vm->handlers);
 }
-- 
2.21.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
