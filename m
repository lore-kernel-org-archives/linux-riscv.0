Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD27C4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 11:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cUdgrbZE1bEo0MeuKr7QKq2kc+9hJsl7mmzeOag+aU=; b=uX6mboswhs16Pa
	c/K73/M8c2VPS+UqQbMc6sdtmepE4XVMPOdGrtouyEnkLBv5k9ZOiT06ukDQ5ZLsGvJ0oKRZTcf6s
	YbeF/bfAsqdECcOI4CuLFinvbXu/KiBY3VXDnhU/s6D+yRMy8GP1qzmkQkA0mfIA7S1NzNc11lnx7
	5HLHAl352jReWEyW/UUVkPHT4BmNhOqDlDGkC4QAXJAMly0Ae2x1z621BmXkWGedNrlp1KyMkqmAk
	FgEQGijeDxF9sqiDjW5FiA2rMg76jZKHWEhfUzngyZyZk7/SgmQdQKBoBMBVmfDCp9rVQrjHloLHP
	PE9a0tMInxJYXzHgH1KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRs2O-00Bcs3-1L;
	Mon, 22 Jan 2024 11:00:20 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqu0-00BMPM-1N;
	Mon, 22 Jan 2024 09:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705916856; x=1737452856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CShUSY54xBLTmqnpSFLWdsNSkrvcvMhuK3xhvNi4dS8=;
  b=KrOH1md0YRudZtmbN1A/Kepu4GjjLhJdqj6dfNJUJ56kvUqzvVqhFA3v
   QSLXt2nTjm7U92h5gW8GD7YQYz3HEkEfjZsV2ENbiJ5C9PVicyCbIqbWc
   ER8SJDz4nAMFTrBmBYA19bNha3rBFFC9AdU1HaJAkGLCpCSifZi7yzs3V
   BPPXCURd9DUdp1tL5DRFupUDIFjtWV7b6FbOKkUXqNwYJGa7CKz9D1TuM
   s8Q6gv1aGqZihyGpreO/1ZLppqlD0NKzV0vnGs5O7PudsN2xNIaM+wpgy
   O0BXB6yhk+nGmRIFRtG9B7mAFQv6cAQjiq9VE7OSBHQ0e7qYCEyt+DYi4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="22641937"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="22641937"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 01:47:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="778535554"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="778535554"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 01:47:26 -0800
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Cc: xiaobo55x@gmail.com,
	ajones@ventanamicro.com,
	Haibo Xu <haibo1.xu@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	wchen <waylingii@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Minda Chen <minda.chen@starfivetech.com>,
	Sean Christopherson <seanjc@google.com>,
	Like Xu <likexu@tencent.com>,
	Peter Xu <peterx@redhat.com>,
	Vipin Sharma <vipinsh@google.com>,
	Aaron Lewis <aaronlewis@google.com>,
	Thomas Huth <thuth@redhat.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v5 09/12] KVM: riscv: selftests: Add exception handling support
Date: Mon, 22 Jan 2024 17:58:39 +0800
Message-Id: <f0df76e546fefb047c83c2f49ea54f6123011475.1705916069.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705916069.git.haibo1.xu@intel.com>
References: <cover.1705916069.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_014736_552562_899405A4 
X-CRM114-Status: GOOD (  18.48  )
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

Add the infrastructure for guest exception handling in riscv selftests.
Customized handlers can be enabled by vm_install_exception_handler(vector)
or vm_install_interrupt_handler().

The code is inspired from that of x86/arm64.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../selftests/kvm/include/kvm_util_base.h     |   7 ++
 .../selftests/kvm/include/riscv/processor.h   |  43 ++++++++
 .../selftests/kvm/lib/riscv/handlers.S        | 101 ++++++++++++++++++
 .../selftests/kvm/lib/riscv/processor.c       |  69 ++++++++++++
 5 files changed, 221 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/lib/riscv/handlers.S

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index a18d18994fe8..f514c81877ce 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -53,6 +53,7 @@ LIBKVM_s390x += lib/s390x/diag318_test_handler.c
 LIBKVM_s390x += lib/s390x/processor.c
 LIBKVM_s390x += lib/s390x/ucall.c
 
+LIBKVM_riscv += lib/riscv/handlers.S
 LIBKVM_riscv += lib/riscv/processor.c
 LIBKVM_riscv += lib/riscv/ucall.c
 
diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index a18db6a7b3cf..135ae2eb5249 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -932,4 +932,11 @@ void kvm_selftest_arch_init(void);
 
 void kvm_arch_vm_post_create(struct kvm_vm *vm);
 
+void vm_init_vector_tables(struct kvm_vm *vm);
+void vcpu_init_vector_tables(struct kvm_vcpu *vcpu);
+
+struct ex_regs;
+typedef void(*exception_handler_fn)(struct ex_regs *);
+void vm_install_exception_handler(struct kvm_vm *vm, int vector, exception_handler_fn handler);
+
 #endif /* SELFTEST_KVM_UTIL_BASE_H */
diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index 6f9e1e5e466d..b68b1b731a34 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -42,6 +42,49 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
 #define RISCV_ISA_EXT_REG(idx)	__kvm_reg_id(KVM_REG_RISCV_ISA_EXT, \
 					     idx, KVM_REG_SIZE_ULONG)
 
+struct ex_regs {
+	unsigned long ra;
+	unsigned long sp;
+	unsigned long gp;
+	unsigned long tp;
+	unsigned long t0;
+	unsigned long t1;
+	unsigned long t2;
+	unsigned long s0;
+	unsigned long s1;
+	unsigned long a0;
+	unsigned long a1;
+	unsigned long a2;
+	unsigned long a3;
+	unsigned long a4;
+	unsigned long a5;
+	unsigned long a6;
+	unsigned long a7;
+	unsigned long s2;
+	unsigned long s3;
+	unsigned long s4;
+	unsigned long s5;
+	unsigned long s6;
+	unsigned long s7;
+	unsigned long s8;
+	unsigned long s9;
+	unsigned long s10;
+	unsigned long s11;
+	unsigned long t3;
+	unsigned long t4;
+	unsigned long t5;
+	unsigned long t6;
+	unsigned long epc;
+	unsigned long status;
+	unsigned long cause;
+};
+
+#define NR_VECTORS  2
+#define NR_EXCEPTIONS  32
+#define EC_MASK  (NR_EXCEPTIONS - 1)
+
+void vm_install_interrupt_handler(struct kvm_vm *vm, exception_handler_fn handler);
+
 /* L3 index Bit[47:39] */
 #define PGTBL_L3_INDEX_MASK			0x0000FF8000000000ULL
 #define PGTBL_L3_INDEX_SHIFT			39
diff --git a/tools/testing/selftests/kvm/lib/riscv/handlers.S b/tools/testing/selftests/kvm/lib/riscv/handlers.S
new file mode 100644
index 000000000000..aa0abd3f35bb
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/riscv/handlers.S
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023 Intel Corporation
+ */
+
+#ifndef __ASSEMBLY__
+#define __ASSEMBLY__
+#endif
+
+#include <asm/csr.h>
+
+.macro save_context
+	addi  sp, sp, (-8*34)
+	sd    x1, 0(sp)
+	sd    x2, 8(sp)
+	sd    x3, 16(sp)
+	sd    x4, 24(sp)
+	sd    x5, 32(sp)
+	sd    x6, 40(sp)
+	sd    x7, 48(sp)
+	sd    x8, 56(sp)
+	sd    x9, 64(sp)
+	sd    x10, 72(sp)
+	sd    x11, 80(sp)
+	sd    x12, 88(sp)
+	sd    x13, 96(sp)
+	sd    x14, 104(sp)
+	sd    x15, 112(sp)
+	sd    x16, 120(sp)
+	sd    x17, 128(sp)
+	sd    x18, 136(sp)
+	sd    x19, 144(sp)
+	sd    x20, 152(sp)
+	sd    x21, 160(sp)
+	sd    x22, 168(sp)
+	sd    x23, 176(sp)
+	sd    x24, 184(sp)
+	sd    x25, 192(sp)
+	sd    x26, 200(sp)
+	sd    x27, 208(sp)
+	sd    x28, 216(sp)
+	sd    x29, 224(sp)
+	sd    x30, 232(sp)
+	sd    x31, 240(sp)
+	csrr  s0, CSR_SEPC
+	csrr  s1, CSR_SSTATUS
+	csrr  s2, CSR_SCAUSE
+	sd    s0, 248(sp)
+	sd    s1, 256(sp)
+	sd    s2, 264(sp)
+.endm
+
+.macro restore_context
+	ld    s2, 264(sp)
+	ld    s1, 256(sp)
+	ld    s0, 248(sp)
+	csrw  CSR_SCAUSE, s2
+	csrw  CSR_SSTATUS, s1
+	csrw  CSR_SEPC, s0
+	ld    x31, 240(sp)
+	ld    x30, 232(sp)
+	ld    x29, 224(sp)
+	ld    x28, 216(sp)
+	ld    x27, 208(sp)
+	ld    x26, 200(sp)
+	ld    x25, 192(sp)
+	ld    x24, 184(sp)
+	ld    x23, 176(sp)
+	ld    x22, 168(sp)
+	ld    x21, 160(sp)
+	ld    x20, 152(sp)
+	ld    x19, 144(sp)
+	ld    x18, 136(sp)
+	ld    x17, 128(sp)
+	ld    x16, 120(sp)
+	ld    x15, 112(sp)
+	ld    x14, 104(sp)
+	ld    x13, 96(sp)
+	ld    x12, 88(sp)
+	ld    x11, 80(sp)
+	ld    x10, 72(sp)
+	ld    x9, 64(sp)
+	ld    x8, 56(sp)
+	ld    x7, 48(sp)
+	ld    x6, 40(sp)
+	ld    x5, 32(sp)
+	ld    x4, 24(sp)
+	ld    x3, 16(sp)
+	ld    x2, 8(sp)
+	ld    x1, 0(sp)
+	addi  sp, sp, (8*34)
+.endm
+
+.balign 4
+.global exception_vectors
+exception_vectors:
+	save_context
+	move  a0, sp
+	call  route_exception
+	restore_context
+	sret
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index d146ca71e0c0..efd9ac4b0198 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -13,6 +13,8 @@
 
 #define DEFAULT_RISCV_GUEST_STACK_VADDR_MIN	0xac0000
 
+static vm_vaddr_t exception_handlers;
+
 static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
 {
 	return (v + vm->page_size) & ~(vm->page_size - 1);
@@ -364,6 +366,73 @@ void vcpu_args_set(struct kvm_vcpu *vcpu, unsigned int num, ...)
 	va_end(ap);
 }
 
+void kvm_exit_unexpected_exception(int vector, int ec)
+{
+	ucall(UCALL_UNHANDLED, 2, vector, ec);
+}
+
 void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
 {
+	struct ucall uc;
+
+	if (get_ucall(vcpu, &uc) == UCALL_UNHANDLED) {
+		TEST_FAIL("Unexpected exception (vector:0x%lx, ec:0x%lx)",
+			uc.args[0], uc.args[1]);
+	}
+}
+
+struct handlers {
+	exception_handler_fn exception_handlers[NR_VECTORS][NR_EXCEPTIONS];
+};
+
+void route_exception(struct ex_regs *regs)
+{
+	struct handlers *handlers = (struct handlers *)exception_handlers;
+	int vector = 0, ec;
+
+	ec = regs->cause & ~CAUSE_IRQ_FLAG;
+	if (ec >= NR_EXCEPTIONS)
+		goto unexpected_exception;
+
+	/* Use the same handler for all the interrupts */
+	if (regs->cause & CAUSE_IRQ_FLAG) {
+		vector = 1;
+		ec = 0;
+	}
+
+	if (handlers && handlers->exception_handlers[vector][ec])
+		return handlers->exception_handlers[vector][ec](regs);
+
+unexpected_exception:
+	return kvm_exit_unexpected_exception(vector, ec);
+}
+
+void vcpu_init_vector_tables(struct kvm_vcpu *vcpu)
+{
+	extern char exception_vectors;
+
+	vcpu_set_reg(vcpu, RISCV_CSR_REG(stvec), (unsigned long)&exception_vectors);
+}
+
+void vm_init_vector_tables(struct kvm_vm *vm)
+{
+	vm->handlers = __vm_vaddr_alloc(vm, sizeof(struct handlers),
+				   vm->page_size, MEM_REGION_DATA);
+
+	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
+}
+
+void vm_install_exception_handler(struct kvm_vm *vm, int vector, exception_handler_fn handler)
+{
+	struct handlers *handlers = addr_gva2hva(vm, vm->handlers);
+
+	assert(vector < NR_EXCEPTIONS);
+	handlers->exception_handlers[0][vector] = handler;
+}
+
+void vm_install_interrupt_handler(struct kvm_vm *vm, exception_handler_fn handler)
+{
+	struct handlers *handlers = addr_gva2hva(vm, vm->handlers);
+
+	handlers->exception_handlers[1][0] = handler;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
