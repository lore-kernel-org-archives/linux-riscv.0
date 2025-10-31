Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F77CCF9FA
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 03:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C0tYAkS8gDdMYxHG1DKpt+AlfW5bPufN4OV1yAgNSYU=; b=rc5G3ekQ+FyVLp
	W184jO8OpYBcyc6FZs9HxV/qvW31YoKqsGe3PbDgMjIgwjGcdJKMK6o0J9cThASeo7pRXcdW97Hw2
	IICabS71JWysWyyP5oMWIyNMZ7dQ4h6ljfZCxB8UE1XdwDtegqmyk45Qond8xHQ86mYDc4msov2ka
	WwzXoCq+ubb2xSQ+TzZhFL5h8k4Cd6EjGlZ0/hzaS6mMCjk/rIKHS/bn7bUV0WOSFh97tGJA/Pe92
	vRRy0kfqqIZH8tMVBX9Gi+98sKys5jaT9pdWEWfRh0bg/NfQ3QBbIhNpCOBsHv22hRks8rVGyTfAT
	ef9qmwiTfwCi/y5fB3Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfZL-00000005JWC-0EiV;
	Fri, 31 Oct 2025 03:12:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfZJ-00000005JVT-2w65
	for linux-riscv@bombadil.infradead.org;
	Fri, 31 Oct 2025 03:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OC87YPVLzqOVSM7pNNQn3pAr5KWMLRjuZEvXFBEnE88=; b=r65RUS74GDubeqQ8vCC5EOO+q5
	Ax+kyPupLUW9bgvx645jlbt6vQKHPzt/Qmo/NUd9EjKjd9dezxppcWNJQXiX6JPyLb9AMoKSRAv/T
	KvCKxx2qJb9wdklad6a7A/7EdToBPC7tonktA7pjGgfxxutaRYaIv+1LIlH7SVigC00JO7OCGWyBz
	F6P7eSaybOPBZ9LHLc5xG6zEM7N60JcjBMcKlIUL8Kj3OMIixrWQOCM+15HCSJLq1bEZLfsjrl5Id
	BzAShs6iLZgUesuz47UNzKo203Z+OVHrxun1PmjLVAZD9MtEVTjroUCXHNejFNCYbK7JQy8dhap5o
	X10eUM0A==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfZE-000000039cn-0Wc1
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 03:12:48 +0000
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8DxN9EjKQRpqOwcAA--.63099S3;
	Fri, 31 Oct 2025 11:12:35 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJBxysAbKQRpGMkeAQ--.13727S5;
	Fri, 31 Oct 2025 11:12:33 +0800 (CST)
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
Subject: [PATCH 3/6] KVM: LoongArch: selftests: Add basic interfaces
Date: Fri, 31 Oct 2025 11:12:24 +0800
Message-Id: <20251031031227.4020738-4-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20251031031227.4020738-1-maobibo@loongson.cn>
References: <20251031031227.4020738-1-maobibo@loongson.cn>
MIME-Version: 1.0
X-CM-TRANSID: qMiowJBxysAbKQRpGMkeAQ--.13727S5
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_031245_964491_45F67407 
X-CRM114-Status: UNSURE (   7.03  )
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

Add some basic function interfaces such as CSR register access,
local irq enable or disable APIs.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 .../kvm/include/loongarch/processor.h         | 52 +++++++++++++++++++
 .../selftests/kvm/lib/loongarch/processor.c   |  5 ++
 2 files changed, 57 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/loongarch/processor.h b/tools/testing/selftests/kvm/include/loongarch/processor.h
index a18ac7bff303..b027f8f4dac7 100644
--- a/tools/testing/selftests/kvm/include/loongarch/processor.h
+++ b/tools/testing/selftests/kvm/include/loongarch/processor.h
@@ -118,6 +118,28 @@
 #define  CSR_TLBREHI_PS_SHIFT		0
 #define  CSR_TLBREHI_PS			(0x3fUL << CSR_TLBREHI_PS_SHIFT)
 
+#define csr_read(csr)				\
+({						\
+	register unsigned long __v;		\
+	__asm__ __volatile__(			\
+		"csrrd %[val], %[reg]\n\t"	\
+		: [val] "=r" (__v)		\
+		: [reg] "i" (csr)		\
+		: "memory");			\
+	__v;					\
+})
+
+#define csr_write(v, csr)			\
+({						\
+	register unsigned long __v = v;		\
+	__asm__ __volatile__ (			\
+		"csrwr %[val], %[reg]\n\t"	\
+		: [val] "+r" (__v)		\
+		: [reg] "i" (csr)		\
+		: "memory");			\
+	__v;					\
+})
+
 #define EXREGS_GPRS			(32)
 
 #ifndef __ASSEMBLER__
@@ -147,6 +169,36 @@ struct handlers {
 void vm_init_descriptor_tables(struct kvm_vm *vm);
 void vm_install_exception_handler(struct kvm_vm *vm, int vector, handler_fn handler);
 
+static inline void local_irq_enable(void)
+{
+	unsigned int flags = CSR_CRMD_IE;
+
+	register unsigned int mask asm("$t0") = CSR_CRMD_IE;
+
+	__asm__ __volatile__(
+		"csrxchg %[val], %[mask], %[reg]\n\t"
+		: [val] "+r" (flags)
+		: [mask] "r" (mask), [reg] "i" (LOONGARCH_CSR_CRMD)
+		: "memory");
+}
+
+static inline void local_irq_disable(void)
+{
+	unsigned int flags = 0;
+
+	register unsigned int mask asm("$t0") = CSR_CRMD_IE;
+
+	__asm__ __volatile__(
+		"csrxchg %[val], %[mask], %[reg]\n\t"
+		: [val] "+r" (flags)
+		: [mask] "r" (mask), [reg] "i" (LOONGARCH_CSR_CRMD)
+		: "memory");
+}
+
+static inline void cpu_relax(void)
+{
+	asm volatile("nop" ::: "memory");
+}
 #else
 #define PC_OFFSET_EXREGS		((EXREGS_GPRS + 0) * 8)
 #define ESTAT_OFFSET_EXREGS		((EXREGS_GPRS + 1) * 8)
diff --git a/tools/testing/selftests/kvm/lib/loongarch/processor.c b/tools/testing/selftests/kvm/lib/loongarch/processor.c
index be537c5ff74e..20ba476ccb72 100644
--- a/tools/testing/selftests/kvm/lib/loongarch/processor.c
+++ b/tools/testing/selftests/kvm/lib/loongarch/processor.c
@@ -373,3 +373,8 @@ void vcpu_arch_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
 	regs.pc = (uint64_t)guest_code;
 	vcpu_regs_set(vcpu, &regs);
 }
+
+uint32_t guest_get_vcpuid(void)
+{
+	return csr_read(LOONGARCH_CSR_CPUID);
+}
-- 
2.39.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
