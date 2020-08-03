Return-Path: <SRS0=FXTp=BN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC156C433EA
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2020 17:59:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01AB922B4E
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2020 17:59:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W6kJPGqk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="GLoA8WQf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01AB922B4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H3blfyWL6AbYGkCYMPvwq5NibnqyGtjPAEHVmzlIw24=; b=W6kJPGqkL2Tu0b+QK5icy0UfJ
	EEOa29GF+TRLGIop5vTJS2xQwJqO0ru2O++Qc+YIJoT7qTnYztm9HY/TRUWqkzanfU6VieE6vzzOe
	a2G9vdHmTLJ/9wJfjmRVa419zERn66IXGe4T19vtXgyODbYrEKgE/oZaO+3E0Qrw0gDNOuVWUHPIv
	3kohANXosN3DtyERm/YiGY7iDdJVjDCU0N/zduKXKVGf10PDX5gTkkML0FL+ZGkAOo0H5LLJrgF0L
	LEO6ujrNMEowE3UPY+39jQ4iKfeaGNjbNTWYntw55ZF7S6NXz3dsBKKAxhwwHyvQ3fGnWdmuvftv6
	XDlQOVdww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2ejz-00056i-IV; Mon, 03 Aug 2020 17:59:15 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2ejr-00051j-UT; Mon, 03 Aug 2020 17:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1596477548; x=1628013548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cdgZA81qAts7J/fCdnfoWyqZdWwyvDZqQNei0eHBaQM=;
 b=GLoA8WQffuuJcHRd7xBVrIowyL4AeWo1feDCU53XvD/UjC30Jg6LD8d5
 zUVG86XI1Y7tbAlhi5lfTIavboykRo9lPil3DzQ87PpV1XwK6D+KcT06d
 db3G6Fmu2EIwOUDxs1Et7oi5CdUvlGZf0XSDcktsj7wN8QHmykaINGX2e
 dN0jioV1T2LouQBgr8igR0CdCZWirg25LzmLrltSukMWwDm6a0GtVpmzO
 FuHX5+z6nU9D2tmFYtr+ZVAYhX8yJq86DNuv4MsHFzLIdckEOmDo615ko
 Pacc+Amv16N295D/RAXzvko0WuGuRThw+VMOWigBiPn3b7epreUx4cNYW A==;
IronPort-SDR: SPIujUzDkaq3Fnic8Y4HvfvUpPCLws7v4QJUl4FrHxQMxc9GRsMeUU1S70X3EXP+cliYGwlOc0
 1zFeERcOuVOyyuf6/aSi9gULJ7G1KGQXJVqjBIE3aKW1hjjzyMC8SAnQX9XxbNcNyOubTktI1j
 Rl79ggHFLuZ+pGQhjd3xkYr/xqENBQ3xgHCQ86ZIDeyL0gFsP0z4QepNav9pMc526CabXnZX+V
 FLexfQfTv6IQEDhPUSRqlJCbTscoY429yuWrPmayanBG904aSlbxqcV1MUsg+jJKgbu3aQ03kg
 adg=
X-IronPort-AV: E=Sophos;i="5.75,430,1589212800"; d="scan'208";a="145273249"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Aug 2020 01:59:06 +0800
IronPort-SDR: aEWn3JBnNNsGXGu2jNJMyJveNNKDNDO+OrntymJTAiOPZX6TRjgKhH2y9thwVdifUJTVXSoTab
 gngrmfLZPGtg==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 10:46:27 -0700
IronPort-SDR: 1x2QuS0MR7qUV0C0wIlAdoyBvN9vLmVNMq5tUgACPwMS0Dp4oey0umX8iQzwMY64mB7zwtD+3B
 Hc3f8iBW1+0w==
WDCIronportException: Internal
Received: from cnf007830.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.196])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Aug 2020 10:59:05 -0700
From: Atish Patra <atish.patra@wdc.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/6] RISC-V: Reorganize SBI code by moving legacy SBI to its
 own file
Date: Mon,  3 Aug 2020 10:58:43 -0700
Message-Id: <20200803175846.26272-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200803175846.26272-1-atish.patra@wdc.com>
References: <20200803175846.26272-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_135908_148383_E9CB10FE 
X-CRM114-Status: GOOD (  25.70  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kvm@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexander Graf <graf@amazon.com>,
 Thomas Gleixner <tglx@linutronix.de>
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
 arch/riscv/include/asm/kvm_vcpu_sbi.h |   1 +
 arch/riscv/kvm/Makefile               |   2 +-
 arch/riscv/kvm/vcpu_sbi.c             | 126 +------------------------
 arch/riscv/kvm/vcpu_sbi_legacy.c      | 129 ++++++++++++++++++++++++++
 4 files changed, 136 insertions(+), 122 deletions(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_legacy.c

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 5b3523a01bce..743c71f0c331 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -25,5 +25,6 @@ struct kvm_vcpu_sbi_extension {
 		       bool *exit);
 };
 
+void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid);
 #endif /* __RISCV_KVM_VCPU_SBI_H__ */
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index b56dc1650d2c..8efb78faab5a 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -9,6 +9,6 @@ ccflags-y := -Ivirt/kvm -Iarch/riscv/kvm
 kvm-objs := $(common-objs-y)
 
 kvm-objs += main.o vm.o vmid.o tlb.o mmu.o
-kvm-objs += vcpu.o vcpu_exit.o vcpu_switch.o vcpu_timer.o vcpu_sbi.o
+kvm-objs += vcpu.o vcpu_exit.o vcpu_switch.o vcpu_timer.o vcpu_sbi.o vcpu_sbi_legacy.o
 
 obj-$(CONFIG_KVM)	+= kvm.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index efddac5362a9..85bb7491c0e0 100644
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
@@ -32,23 +30,12 @@ static int kvm_linux_err_map_sbi(int err)
 	};
 }
 
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
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_legacy;
+static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
+	&vcpu_sbi_ext_legacy,
+};
 
-static void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu,
-				       struct kvm_run *run)
+void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
 {
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 
@@ -86,109 +73,6 @@ int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	return 0;
 }
 
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
diff --git a/arch/riscv/kvm/vcpu_sbi_legacy.c b/arch/riscv/kvm/vcpu_sbi_legacy.c
new file mode 100644
index 000000000000..126d97b1292d
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_legacy.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * Copyright (c) 2020 Western Digital Corporation or its affiliates.
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
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
