Return-Path: <SRS0=Gszz=O4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D03C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 03:21:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DFA360FE3
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 03:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DFA360FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upVOhTqNdywTvo/G8FdIftEnu1QTol9WKZF7nzm9TFM=; b=OP/UBq8zjCAB2r
	sbvZC6cqoPU9DtHCvC2M05J10gtzdQirQIAYta/02Hu48DBOWyas6ebmaDC0vrrYJKOXg/zeSGc7U
	RU9cVMkow7MgdX+Dac/IFIkVj/JRgRs/adKTW/82tOSB/uOiOIeLq1FZE5qcZdQM5QPDIaT+YhU3G
	JMVEvb7TqoU6ENQSQ+uqUDUk6DANhX5E9FfEi9LWc6xBuDt3lEjiDcgGb8cRHsrI8M+pa9w9lMP/x
	5v0V9BOW8AL/SJH2bk1Wwq+/K00s9bmPz0mvoSV8kWGUA2YHUTeshaEU+dNMyccjxwF3MmvvgIR+b
	BCOxWK41WEgGv+xWGSlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYgRE-001PVq-I2; Fri, 08 Oct 2021 03:20:48 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYgR7-001PSs-DG; Fri, 08 Oct 2021 03:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633663240; x=1665199240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W4qhFXpWh/NLUIDvaPMW0YLa7mc2yBrcvO1IdDHuo+8=;
 b=nY6v1E7CGFEsxMQx2nuWSPprGpwUERJN4xC+C+8uVsj4HC0AwKB4KXpu
 zqrGIdYR9NeeHjsX/FEixG6H9j3jaY9EJOtPZR+Ti7XhMxnOe/hm+aU8u
 9hsnfSsvgsKxKF4HQF/zKc0NwvdVaYxHcP50+5auRo6M34JQDEtnt8AMD
 8nf8FfeeYdxdkOkQ0QwsPCLm9maTmXlXTFrMtp69dOguq5KYaRqWPsKSB
 beQ5SDqTi5aXkfPKUkKx1R3uYuXQbrMFyPQcdKX3J//VFZNrRyJCYdbSF
 +ghDuwZxeob7Btipy84KctLr9vmYrBj8c65jmPRkBjy9xFKpa1sVKIGmm A==;
X-IronPort-AV: E=Sophos;i="5.85,356,1624291200"; d="scan'208";a="187014419"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Oct 2021 11:20:39 +0800
IronPort-SDR: 0lI1VVFjyMfMcuEnI64xtE8nJgw4Ml9reY0a9fsTggchkCMsm9mhOwQNs+qTyShi1+kVN8QeAt
 YjzfsOtqWKkhPkkqApaHKtlIVKorsUCNPmmz1S7RfyxSx69xZV5ihANrnp5BqccRZMV7LFe4NF
 zsB7GcieM3e79AotIEKfD6wtx5pZFD2Nen7r1E5sfD2DZVy54QbEJ1o4EsFlTdL/XFt6Ubk2BL
 Q2TBsaw4Xb2rhKeZO51tfqbJY6rbJj2KKBWsyW7b8LFHzRuPUpmiDJLPjGbHCOd5OztRNsWGsM
 SGq8yljloChVmVXH6eqnNP/I
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 19:54:59 -0700
IronPort-SDR: pb2aaO2eRKWU6gEIBZQfVpvrznxQYTotsqDiJdxWKibOAMspcmfE9U+kiHN3la9u/btx1if1p0
 ZkZIscNyNktr+kU90kYQ+Kg8EJ0qfucE0sWguSJ0gF2oEJtdXxpMM76ATK5D87nHIWYqyGenVd
 wRiyyX3eLi6nXMLHcoyGGE7afAM6EOiXsXfLKafzaVWVONlZyCGbkxMK0sVatqgC/JkMx+2bv9
 fNKFazuvdyQBVj+wMeqzOHVaamHBPsH/S83NR8Z2tZjoVruhYmFRFZ89Pay8ElQCv7vV90JQM1
 MqU=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.125])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Oct 2021 20:20:40 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anup Patel <anup.patel@wdc.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v3 2/5] RISC-V: Reorganize SBI code by moving legacy SBI to
 its own file
Date: Thu,  7 Oct 2021 20:20:33 -0700
Message-Id: <20211008032036.2201971-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008032036.2201971-1-atish.patra@wdc.com>
References: <20211008032036.2201971-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_202041_486217_B7E33D5B 
X-CRM114-Status: GOOD (  26.26  )
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

With SBI v0.2, there may be more SBI extensions in future. It makes more
sense to group related extensions in separate files. Guest kernel will
choose appropriate SBI version dynamically.

Move the existing implementation to a separate file so that it can be
removed in future without much conflict.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |   2 +
 arch/riscv/kvm/Makefile               |   1 +
 arch/riscv/kvm/vcpu_sbi.c             | 153 +++-----------------------
 arch/riscv/kvm/vcpu_sbi_legacy.c      | 129 ++++++++++++++++++++++
 4 files changed, 150 insertions(+), 135 deletions(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_legacy.c

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 1a4cb0db2d0b..704151969ceb 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -25,5 +25,7 @@ struct kvm_vcpu_sbi_extension {
 		       bool *exit);
 };
 
+void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid);
+
 #endif /* __RISCV_KVM_VCPU_SBI_H__ */
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 3226696b8340..53cbecc44c4c 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -22,4 +22,5 @@ kvm-y += vcpu.o
 kvm-y += vcpu_exit.o
 kvm-y += vcpu_switch.o
 kvm-y += vcpu_sbi.o
+kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_legacy.o
 kvm-y += vcpu_timer.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 8c168d305763..e51de3e4526a 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -9,9 +9,7 @@
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/kvm_host.h>
-#include <asm/csr.h>
 #include <asm/sbi.h>
-#include <asm/kvm_vcpu_timer.h>
 #include <asm/kvm_vcpu_sbi.h>
 
 static int kvm_linux_err_map_sbi(int err)
@@ -32,8 +30,21 @@ static int kvm_linux_err_map_sbi(int err)
 	};
 }
 
-static void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu,
-				       struct kvm_run *run)
+#ifdef CONFIG_RISCV_SBI_V01
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_legacy;
+#else
+static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_legacy = {
+	.extid_start = -1UL,
+	.extid_end = -1UL,
+	.handler = NULL,
+};
+#endif
+
+static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
+	&vcpu_sbi_ext_legacy,
+};
+
+void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
 {
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 
@@ -71,126 +82,6 @@ int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	return 0;
 }
 
-#ifdef CONFIG_RISCV_SBI_V01
-
-static void kvm_sbi_system_shutdown(struct kvm_vcpu *vcpu,
-				    struct kvm_run *run, u32 type)
-{
-	int i;
-	struct kvm_vcpu *tmp;
-
-	kvm_for_each_vcpu(i, tmp, vcpu->kvm)
-		tmp->arch.power_off = true;
-	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
-
-	memset(&run->system_event, 0, sizeof(run->system_event));
-	run->system_event.type = type;
-	run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
-}
-
-static int kvm_sbi_ext_legacy_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
-				      unsigned long *out_val,
-				      struct kvm_cpu_trap *utrap,
-				      bool *exit)
-{
-	ulong hmask;
-	int i, ret = 0;
-	u64 next_cycle;
-	struct kvm_vcpu *rvcpu;
-	struct cpumask cm, hm;
-	struct kvm *kvm = vcpu->kvm;
-	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
-
-	if (!cp)
-		return -EINVAL;
-
-	switch (cp->a7) {
-	case SBI_EXT_0_1_CONSOLE_GETCHAR:
-	case SBI_EXT_0_1_CONSOLE_PUTCHAR:
-		/*
-		 * The CONSOLE_GETCHAR/CONSOLE_PUTCHAR SBI calls cannot be
-		 * handled in kernel so we forward these to user-space
-		 */
-		kvm_riscv_vcpu_sbi_forward(vcpu, run);
-		*exit = true;
-		break;
-	case SBI_EXT_0_1_SET_TIMER:
-#if __riscv_xlen == 32
-		next_cycle = ((u64)cp->a1 << 32) | (u64)cp->a0;
-#else
-		next_cycle = (u64)cp->a0;
-#endif
-		ret = kvm_riscv_vcpu_timer_next_event(vcpu, next_cycle);
-		break;
-	case SBI_EXT_0_1_CLEAR_IPI:
-		ret = kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_SOFT);
-		break;
-	case SBI_EXT_0_1_SEND_IPI:
-		if (cp->a0)
-			hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0,
-							   utrap);
-		else
-			hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
-		if (utrap->scause)
-			break;
-
-		for_each_set_bit(i, &hmask, BITS_PER_LONG) {
-			rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
-			ret = kvm_riscv_vcpu_set_interrupt(rvcpu, IRQ_VS_SOFT);
-			if (ret < 0)
-				break;
-		}
-		break;
-	case SBI_EXT_0_1_SHUTDOWN:
-		kvm_sbi_system_shutdown(vcpu, run, KVM_SYSTEM_EVENT_SHUTDOWN);
-		*exit = true;
-		break;
-	case SBI_EXT_0_1_REMOTE_FENCE_I:
-	case SBI_EXT_0_1_REMOTE_SFENCE_VMA:
-	case SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID:
-		if (cp->a0)
-			hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0,
-							   utrap);
-		else
-			hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
-		if (utrap->scause)
-			break;
-
-		cpumask_clear(&cm);
-		for_each_set_bit(i, &hmask, BITS_PER_LONG) {
-			rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
-			if (rvcpu->cpu < 0)
-				continue;
-			cpumask_set_cpu(rvcpu->cpu, &cm);
-		}
-		riscv_cpuid_to_hartid_mask(&cm, &hm);
-		if (cp->a7 == SBI_EXT_0_1_REMOTE_FENCE_I)
-			ret = sbi_remote_fence_i(cpumask_bits(&hm));
-		else if (cp->a7 == SBI_EXT_0_1_REMOTE_SFENCE_VMA)
-			ret = sbi_remote_hfence_vvma(cpumask_bits(&hm),
-						cp->a1, cp->a2);
-		else
-			ret = sbi_remote_hfence_vvma_asid(cpumask_bits(&hm),
-						cp->a1, cp->a2, cp->a3);
-		break;
-	default:
-		ret = -EINVAL;
-		break;
-	};
-
-	return ret;
-}
-
-const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_legacy = {
-	.extid_start = SBI_EXT_0_1_SET_TIMER,
-	.extid_end = SBI_EXT_0_1_SHUTDOWN,
-	.handler = kvm_sbi_ext_legacy_handler,
-};
-
-static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
-	&vcpu_sbi_ext_legacy,
-};
-
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid)
 {
 	int i = 0;
@@ -220,9 +111,11 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 
 	sbi_ext = kvm_vcpu_sbi_find_ext(cp->a7);
 	if (sbi_ext && sbi_ext->handler) {
-		if (cp->a7 >= SBI_EXT_0_1_SET_TIMER &&
+#ifdef CONFIG_RISCV_SBI_V01
+		    if (cp->a7 >= SBI_EXT_0_1_SET_TIMER &&
 		    cp->a7 <= SBI_EXT_0_1_SHUTDOWN)
 			ext_is_v01 = true;
+#endif
 		ret = sbi_ext->handler(vcpu, run, &out_val, &utrap, &userspace_exit);
 	} else {
 		/* Return error for unsupported SBI calls */
@@ -262,13 +155,3 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 
 	return ret;
 }
-
-#else
-
-int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
-{
-	kvm_riscv_vcpu_sbi_forward(vcpu, run);
-	return 0;
-}
-
-#endif
diff --git a/arch/riscv/kvm/vcpu_sbi_legacy.c b/arch/riscv/kvm/vcpu_sbi_legacy.c
new file mode 100644
index 000000000000..fb386d227232
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_legacy.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *     Atish Patra <atish.patra@wdc.com>
+ */
+
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/kvm_host.h>
+#include <asm/csr.h>
+#include <asm/sbi.h>
+#include <asm/kvm_vcpu_timer.h>
+#include <asm/kvm_vcpu_sbi.h>
+
+static void kvm_sbi_system_shutdown(struct kvm_vcpu *vcpu,
+				    struct kvm_run *run, u32 type)
+{
+	int i;
+	struct kvm_vcpu *tmp;
+
+	kvm_for_each_vcpu(i, tmp, vcpu->kvm)
+		tmp->arch.power_off = true;
+	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
+
+	memset(&run->system_event, 0, sizeof(run->system_event));
+	run->system_event.type = type;
+	run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
+}
+
+static int kvm_sbi_ext_legacy_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				      unsigned long *out_val,
+				      struct kvm_cpu_trap *utrap,
+				      bool *exit)
+{
+	ulong hmask;
+	int i, ret = 0;
+	u64 next_cycle;
+	struct kvm_vcpu *rvcpu;
+	struct cpumask cm, hm;
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+
+	if (!cp)
+		return -EINVAL;
+
+	switch (cp->a7) {
+	case SBI_EXT_0_1_CONSOLE_GETCHAR:
+	case SBI_EXT_0_1_CONSOLE_PUTCHAR:
+		/*
+		 * The CONSOLE_GETCHAR/CONSOLE_PUTCHAR SBI calls cannot be
+		 * handled in kernel so we forward these to user-space
+		 */
+		kvm_riscv_vcpu_sbi_forward(vcpu, run);
+		*exit = true;
+		break;
+	case SBI_EXT_0_1_SET_TIMER:
+#if __riscv_xlen == 32
+		next_cycle = ((u64)cp->a1 << 32) | (u64)cp->a0;
+#else
+		next_cycle = (u64)cp->a0;
+#endif
+		ret = kvm_riscv_vcpu_timer_next_event(vcpu, next_cycle);
+		break;
+	case SBI_EXT_0_1_CLEAR_IPI:
+		ret = kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_SOFT);
+		break;
+	case SBI_EXT_0_1_SEND_IPI:
+		if (cp->a0)
+			hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0,
+							   utrap);
+		else
+			hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
+		if (utrap->scause)
+			break;
+
+		for_each_set_bit(i, &hmask, BITS_PER_LONG) {
+			rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
+			ret = kvm_riscv_vcpu_set_interrupt(rvcpu, IRQ_VS_SOFT);
+			if (ret < 0)
+				break;
+		}
+		break;
+	case SBI_EXT_0_1_SHUTDOWN:
+		kvm_sbi_system_shutdown(vcpu, run, KVM_SYSTEM_EVENT_SHUTDOWN);
+		*exit = true;
+		break;
+	case SBI_EXT_0_1_REMOTE_FENCE_I:
+	case SBI_EXT_0_1_REMOTE_SFENCE_VMA:
+	case SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID:
+		if (cp->a0)
+			hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0,
+							   utrap);
+		else
+			hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
+		if (utrap->scause)
+			break;
+
+		cpumask_clear(&cm);
+		for_each_set_bit(i, &hmask, BITS_PER_LONG) {
+			rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
+			if (rvcpu->cpu < 0)
+				continue;
+			cpumask_set_cpu(rvcpu->cpu, &cm);
+		}
+		riscv_cpuid_to_hartid_mask(&cm, &hm);
+		if (cp->a7 == SBI_EXT_0_1_REMOTE_FENCE_I)
+			ret = sbi_remote_fence_i(cpumask_bits(&hm));
+		else if (cp->a7 == SBI_EXT_0_1_REMOTE_SFENCE_VMA)
+			ret = sbi_remote_hfence_vvma(cpumask_bits(&hm),
+						cp->a1, cp->a2);
+		else
+			ret = sbi_remote_hfence_vvma_asid(cpumask_bits(&hm),
+						cp->a1, cp->a2, cp->a3);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	};
+
+	return ret;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_legacy = {
+	.extid_start = SBI_EXT_0_1_SET_TIMER,
+	.extid_end = SBI_EXT_0_1_SHUTDOWN,
+	.handler = kvm_sbi_ext_legacy_handler,
+};
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
