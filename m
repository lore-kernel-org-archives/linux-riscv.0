Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B72DCCF9F0
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 03:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYQmk7ZuzwDX3HYjnx7/5Q7DQXos7/l3MXc/WGUWh8g=; b=KxVgEj1JcfiG9h
	2GmamesRrkLdlvAxhFpDEQpGSfHOM3Wby4Kz0bhcmK3eG7l/2CEDrUdU8chyTIwZkG5QDdDVVIY5p
	1daNDfko/Aq56zmCeN54zngC6gXVh6LVY3oDrTumrQ+CN9JeOxOyBtBfs0D3SFK6erABsYZGMChh9
	Jj5XZPNIpYh+JmUZtLGGJ0E0WQsPeg2XJ7Xljxq3PaOScWtf3N3d+6Jpc7uFRUYdDtxU0Gc8S5muI
	v5kuKPg0hvQ+zYwLry40jYSxD7xEPxTpsNlhcVCvKQRviz3+Ri/NlqNybo043YANqZwUmGs8g6Wdd
	597zb2YSRf9/saCM2Zfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfZL-00000005JWz-1vSo;
	Fri, 31 Oct 2025 03:12:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfZJ-00000005JVY-3ZN2
	for linux-riscv@bombadil.infradead.org;
	Fri, 31 Oct 2025 03:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xNGsI4Fcz8Ygjs6edMVyqevEJBqZOvKsoSBpDUFSXRw=; b=cuh9z/pOU1WX7YmF64qXxS0OPb
	UYAnG7lS4kWfByfBMGDbJI6pVTPWcIdEkEilyxpzDilVgC95IjH9zap52buVZjqar/VTBIxIuaQRr
	Hbj4WIFohxOkdx1RvnB8431H4N8hi6Ky57gQMCdwF1XLLepTzWWBktgMjhbJk8+0LaAHn1NzaY0CI
	l/eNT8PnG4agaqC7bGdtigt45tYKKw6piLnp0NsIi9ZczmPSuOxof1pwSN09rfay24+QDtvW/d/Gh
	13BIkEq+3OjkIqboTHqFcyW/ApJj+u9iuyTjt6fUVQ7s06I3b8cbLG6e4ue0ZXypN344xY27NThHn
	04FZ0B5Q==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfZE-000000039Z8-2Uer
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 03:12:48 +0000
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8BxVNAhKQRpnuwcAA--.62900S3;
	Fri, 31 Oct 2025 11:12:33 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJBxysAbKQRpGMkeAQ--.13727S4;
	Fri, 31 Oct 2025 11:12:32 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/6] KVM: LoongArch: selftests: Add exception handler register interface
Date: Fri, 31 Oct 2025 11:12:23 +0800
Message-Id: <20251031031227.4020738-3-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20251031031227.4020738-1-maobibo@loongson.cn>
References: <20251031031227.4020738-1-maobibo@loongson.cn>
MIME-Version: 1.0
X-CM-TRANSID: qMiowJBxysAbKQRpGMkeAQ--.13727S4
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_031246_404935_3AE38502 
X-CRM114-Status: UNSURE (   8.29  )
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

Add interrupt and exception handler register interface. When exception
happens, execute registered exception handler if exists, else report
error.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 .../kvm/include/loongarch/processor.h         | 14 +++++++++
 .../selftests/kvm/lib/loongarch/processor.c   | 29 +++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/loongarch/processor.h b/tools/testing/selftests/kvm/include/loongarch/processor.h
index 374caddfb0db..a18ac7bff303 100644
--- a/tools/testing/selftests/kvm/include/loongarch/processor.h
+++ b/tools/testing/selftests/kvm/include/loongarch/processor.h
@@ -84,6 +84,11 @@
 #define LOONGARCH_CSR_EUEN		0x2
 #define LOONGARCH_CSR_ECFG		0x4
 #define LOONGARCH_CSR_ESTAT		0x5  /* Exception status */
+#define  CSR_ESTAT_EXC_SHIFT		16
+#define  CSR_ESTAT_EXC_WIDTH		6
+#define  CSR_ESTAT_EXC			(0x3f << CSR_ESTAT_EXC_SHIFT)
+#define    EXCCODE_INT			0    /* Interrupt */
+#define      INT_TI			11   /* Timer interrupt*/
 #define LOONGARCH_CSR_ERA		0x6  /* ERA */
 #define LOONGARCH_CSR_BADV		0x7  /* Bad virtual address */
 #define LOONGARCH_CSR_EENTRY		0xc
@@ -133,6 +138,15 @@ struct ex_regs {
 #define PRMD_OFFSET_EXREGS		offsetof(struct ex_regs, prmd)
 #define EXREGS_SIZE			sizeof(struct ex_regs)
 
+#define VECTOR_NUM			64
+typedef void(*handler_fn)(struct ex_regs *);
+struct handlers {
+	handler_fn exception_handlers[VECTOR_NUM];
+};
+
+void vm_init_descriptor_tables(struct kvm_vm *vm);
+void vm_install_exception_handler(struct kvm_vm *vm, int vector, handler_fn handler);
+
 #else
 #define PC_OFFSET_EXREGS		((EXREGS_GPRS + 0) * 8)
 #define ESTAT_OFFSET_EXREGS		((EXREGS_GPRS + 1) * 8)
diff --git a/tools/testing/selftests/kvm/lib/loongarch/processor.c b/tools/testing/selftests/kvm/lib/loongarch/processor.c
index 0ac1abcb71cb..be537c5ff74e 100644
--- a/tools/testing/selftests/kvm/lib/loongarch/processor.c
+++ b/tools/testing/selftests/kvm/lib/loongarch/processor.c
@@ -11,6 +11,7 @@
 #define LOONGARCH_GUEST_STACK_VADDR_MIN		0x200000
 
 static vm_paddr_t invalid_pgtable[4];
+static vm_vaddr_t exception_handlers;
 
 static uint64_t virt_pte_index(struct kvm_vm *vm, vm_vaddr_t gva, int level)
 {
@@ -184,6 +185,13 @@ void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
 void route_exception(struct ex_regs *regs)
 {
 	unsigned long pc, estat, badv;
+	int vector;
+	struct handlers *handlers;
+
+	handlers = (struct handlers *)exception_handlers;
+	vector = (regs->estat & CSR_ESTAT_EXC) >> CSR_ESTAT_EXC_SHIFT;
+	if (handlers && handlers->exception_handlers[vector])
+		return handlers->exception_handlers[vector](regs);
 
 	pc = regs->pc;
 	badv  = regs->badv;
@@ -192,6 +200,27 @@ void route_exception(struct ex_regs *regs)
 	while (1) ;
 }
 
+void vm_init_descriptor_tables(struct kvm_vm *vm)
+{
+	void *addr;
+
+	vm->handlers = __vm_vaddr_alloc(vm, sizeof(struct handlers),
+			LOONGARCH_GUEST_STACK_VADDR_MIN, MEM_REGION_DATA);
+
+	addr = addr_gva2hva(vm, vm->handlers);
+	memset(addr, 0, vm->page_size);
+	exception_handlers = vm->handlers;
+	sync_global_to_guest(vm, exception_handlers);
+}
+
+void vm_install_exception_handler(struct kvm_vm *vm, int vector, handler_fn handler)
+{
+	struct handlers *handlers = addr_gva2hva(vm, vm->handlers);
+
+	assert(vector < VECTOR_NUM);
+	handlers->exception_handlers[vector] = handler;
+}
+
 void vcpu_args_set(struct kvm_vcpu *vcpu, unsigned int num, ...)
 {
 	int i;
-- 
2.39.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
