Return-Path: <SRS0=deyN=PY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06ACEC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 23:59:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9B4D610CD
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 23:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9B4D610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GP7hs10w3/ERBWvEZ9x2KSgay+AS0uySx9GyHPaIVHM=; b=xW1JxJ4nFwdaGH
	5LrZ81SZqwk1kwDHifkUeU6eGYPCkAClSTUngdUn8XXAk+wyQq08cCDerw268ZS7axlLygisEjABj
	3uggpEBmgwJAOCQmGVvuXbGScp5qk668thTC9gmDa44D6POTKVHcgy04SsMRds5KRjvBiOu+3wIZD
	s+YulOrFP8pkXcPkRdw+NQHZ+WUmCoUOocjBmfxJN+OYiEJfrKejK2FaB68Wktiy4urrdSFvXMviF
	07uJEZ7PDR5q+v/5xoKkCnzDQTdDGiG1bsS39+5VNXZZR4938Bz3YCfDE6F07xhwiX2OdPNuJ4etz
	ScjHamhGXTpTCf7fg6pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj974-00CSwV-5U; Fri, 05 Nov 2021 23:59:14 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj96w-00CSpw-JK; Fri, 05 Nov 2021 23:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1636156746; x=1667692746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ry3CefX/Tp4xaLpui45N/sUnV2uYJCRDeodPmHhQp30=;
 b=Dk231y/Mlfx0tbJTQ3ckWaCCQcjIiH/F9MpbF4TkcaqUDLJjgRwCTzNg
 QVyn9IIgAcONWHu/uRVj18UM39r5BJk7sExJg6FyjQmKgJHHc3M9TlGlD
 2Gh+wG00K7iISQHxxGp9VnClN2Q1vfXzi0wy37u3/EdCiMAB9LpB/GVJe
 5D2DvvwCpW8LgR3WN3x08kzPvV4g0VtUl7yVjWrMQtRrCatCQZ1/o7SHJ
 vQOIxO6h38QI/DqY+IE4c/NhswjFJznEftt62LAIigHB/TZYfb3sJ9vyk
 yUEb7pXsygfJqwmH2dAWhHCOjMaRFJMoMRFlFjxBDaXZocgNol60GyKa/ Q==;
X-IronPort-AV: E=Sophos;i="5.87,212,1631548800"; d="scan'208";a="183840504"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Nov 2021 07:59:02 +0800
IronPort-SDR: rEXLYXmRdJ35fdKypTJ9YaCPppLf3KMO6HMOPX38JasY0eBX9S/a7y46mKP5sqRZNxvFAGYMj9
 FFQtKDCdhbfsJk0XdVjuvAxDjTUZgSVzr7zJq34jUugvYMHYXtn7NBhbHnmwfnoLe7s4ahOk5q
 1ygoVn2sriCdSGLEj8txSQ5lUXV4qDx95KcTv3LwF3z1GHslDyADzJUymVwNsJzo4WZu5qVbtX
 XpE8rQa/27FlnX3YXCvSen5GdN1zW5zePmhOIf/5prbnhp+a+K8wmZ0c32Sc/BlYQNYcdGZ/3Z
 iRBNtEWhV0J1QPW+zP2ZMwQL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 16:32:46 -0700
IronPort-SDR: nPfFgdVx3EqyS/bfu7H2v5XNaDKqbaygz/10P+fMvqqhGn/0V1iDl3bF00LnyxkfaQm9XaEr/g
 neXs+JNseTJBl9wDooouv0o8jYtvJjR8DJb/jyKkghJToE5QBUTLaQrGtAkC8MBhXuzWINwRU5
 u5MYWgpzHVDFPGwElPzqE2zJdeu88HQBbQRoSmnW2mtmMb4G1Aq9XwfYkMAkID977O5O57iD6l
 ij+jfLiFA+OSi/A/jcJHUo3GCV4qn9aqZtZRllKyCQp8D9SRg08//mA97IkIrdy2IO5iNetpSi
 8Fw=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.48])
 by uls-op-cesaip02.wdc.com with ESMTP; 05 Nov 2021 16:59:03 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>, pbonzini@redhat.com,
 Sean Christopherson <seanjc@google.com>
Subject: [PATCH v4 2/5] RISC-V: KVM: Reorganize SBI code by moving SBI v0.1 to
 its own file
Date: Fri,  5 Nov 2021 16:58:49 -0700
Message-Id: <20211105235852.3011900-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105235852.3011900-1-atish.patra@wdc.com>
References: <20211105235852.3011900-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_165906_745481_87178008 
X-CRM114-Status: GOOD (  25.82  )
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
 arch/riscv/kvm/vcpu_sbi.c             | 151 +++-----------------------
 arch/riscv/kvm/vcpu_sbi_v01.c         | 129 ++++++++++++++++++++++
 4 files changed, 149 insertions(+), 134 deletions(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_v01.c

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
index 30cdd1df0098..d3d5ff3a6019 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -23,4 +23,5 @@ kvm-y += vcpu_exit.o
 kvm-y += vcpu_fp.o
 kvm-y += vcpu_switch.o
 kvm-y += vcpu_sbi.o
+kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
 kvm-y += vcpu_timer.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 05cab5f27eee..06b42f6977e1 100644
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
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
+#else
+static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
+	.extid_start = -1UL,
+	.extid_end = -1UL,
+	.handler = NULL,
+};
+#endif
+
+static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
+	&vcpu_sbi_ext_v01,
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
-static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
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
-	}
-
-	return ret;
-}
-
-const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
-	.extid_start = SBI_EXT_0_1_SET_TIMER,
-	.extid_end = SBI_EXT_0_1_SHUTDOWN,
-	.handler = kvm_sbi_ext_v01_handler,
-};
-
-static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
-	&vcpu_sbi_ext_v01,
-};
-
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid)
 {
 	int i = 0;
@@ -220,9 +111,11 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 
 	sbi_ext = kvm_vcpu_sbi_find_ext(cp->a7);
 	if (sbi_ext && sbi_ext->handler) {
+#ifdef CONFIG_RISCV_SBI_V01
 		if (cp->a7 >= SBI_EXT_0_1_SET_TIMER &&
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
diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
new file mode 100644
index 000000000000..5a8e2afc8a57
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_v01.c
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
+static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
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
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
+	.extid_start = SBI_EXT_0_1_SET_TIMER,
+	.extid_end = SBI_EXT_0_1_SHUTDOWN,
+	.handler = kvm_sbi_ext_v01_handler,
+};
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
