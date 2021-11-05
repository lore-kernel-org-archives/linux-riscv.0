Return-Path: <SRS0=deyN=PY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46F5C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 23:59:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D257610CD
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 23:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D257610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2sHN//SD7C7yQgg3PDrIRyY66fLrJjrXoHYQfIn8Fcs=; b=M8Pn1g8oget7F5
	oMJgp8oWGjTFpwTd+8QhvxGxH7VLRW60oHofK7J/ZL7AViPjSnMIJgfVCYFw94W9Dd77EC1G11L79
	QR+/IfusEb2GrEr+4K5uJI7GzM3Ii7jU/OjFW0VNdSugOlZoiduKE8qpl4ij30u4HuR0qnnlMH5R/
	C2YOBUpgZytDbe7FMRzqTV+p6i4tVbQY3jOCQfMuJYBY066JGVOQvafvJbv0YL9px2VuE/rPypAkP
	ULXcBOTIsYVPZ9tzID8HH53cp0J4Dpl2traQQKTUTPm7TSLGjd79hvxy4Ub7/UK+G4OP9itb1O0VW
	eNzRvr+dA8ArnKc+tvMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj978-00CSzR-EM; Fri, 05 Nov 2021 23:59:18 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj96y-00CSpx-Fj; Fri, 05 Nov 2021 23:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1636156748; x=1667692748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CPBkmZZLjh3iLG2oa7rF/7SGMXdLh45iugpgmq06jR0=;
 b=GEL1cX83miRo7JLmby+tvAswPFkZCCdAzn+qdyZywfZnWVKbqhNfA8Su
 vcZwtDr5jujKevnMBIrBU/H8rNbIuiZSnPGqYjTZI/hLFOAvYEZgwv1E4
 /zjTfWU4c0ZbcYQ2BcyF2zooSg6EtOe1WTI3vkeEbYCvMhvd3Ukun1MzB
 xq/qvFbvKIxjfweFla5iq2Vns0SeTd/7qQoZpSshBrnBKuFQ3Q5RYI61p
 7HBjT9zy5ocF8Y/R5OJV7nlmUS5xrnFmOsSXMAhDMtxC/egu0dWviGp0f
 ZQ+Re6+1J9uAvL48mIrAZj/V3ZjBFAgUjopGtnhqmKgChuA53ekR5JmX4 g==;
X-IronPort-AV: E=Sophos;i="5.87,212,1631548800"; d="scan'208";a="183840511"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Nov 2021 07:59:04 +0800
IronPort-SDR: soZNEzGWfPnLyFu3HM/zHBHQkKtPCCji5MGZLOEfrh/t4o09oU0UBpRSNaKPeWdBs0b/uf6+Ph
 Hzt9iq+kYC1qfOyxP4CEB3qbYZmOacgp62GFJPpF6yomB2zMd7WNtqigEgQXD2vZp6GSA3NOqQ
 OL6ySBxbwjxTcO7KkQs7CmFh7S4+saUjiyBeBWCbb1A6shV7Ol6iONbhkV61vzGLatpQcTXwtq
 ponEWoyz1IyZrEjb4tGgkTLTngkrWcl/ACoAE/G0Q/Xv5Mtw3GSiwzamEW/j24vcWIyLSFLlch
 H33KPsOHC3vITU3+cn+MnCqO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 16:32:48 -0700
IronPort-SDR: Usq9zpvtPvxj8wXdxBMHGJngbrSgxOMSBNgqyOohPmxmbffHG+jDOLZ3zyORCCSD9WL7vh51ok
 xMVcQONiQUfhc2EWL6VTd52yU8KHl46VmRh21ytS+gi1JRNH9tW/qDm9z4CMxfeBPo91/Rvdfg
 uRqw8OopCyvo2dz5A7h8m/huCh4/JZNrZrdukwZKhfqklLzuGDUuFXKmlUzyDaaT1t4NNn6OAI
 EAdS+lHgFYYcqFZfEloyvDfDmc6Jw1lo5x1LWYiAufwXrmwbhrKvfz2SvnOPgIfY2t0CvOV9DF
 MKY=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.48])
 by uls-op-cesaip02.wdc.com with ESMTP; 05 Nov 2021 16:59:04 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>, pbonzini@redhat.com,
 Sean Christopherson <seanjc@google.com>
Subject: [PATCH v4 5/5] RISC-V: KVM: Add SBI HSM extension in KVM
Date: Fri,  5 Nov 2021 16:58:52 -0700
Message-Id: <20211105235852.3011900-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105235852.3011900-1-atish.patra@wdc.com>
References: <20211105235852.3011900-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_165908_650364_13567DD0 
X-CRM114-Status: GOOD (  23.25  )
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

SBI HSM extension allows OS to start/stop harts any time. It also allows
ordered booting of harts instead of random booting.

Implement SBI HSM exntesion and designate the vcpu 0 as the boot vcpu id.
All other non-zero non-booting vcpus should be brought up by the OS
implementing HSM extension. If the guest OS doesn't implement HSM
extension, only single vcpu will be available to OS.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/sbi.h  |   1 +
 arch/riscv/kvm/Makefile       |   1 +
 arch/riscv/kvm/vcpu.c         |  23 ++++++++
 arch/riscv/kvm/vcpu_sbi.c     |   4 ++
 arch/riscv/kvm/vcpu_sbi_hsm.c | 107 ++++++++++++++++++++++++++++++++++
 5 files changed, 136 insertions(+)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_hsm.c

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 4f9370b6032e..79af25c45c8d 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -90,6 +90,7 @@ enum sbi_hsm_hart_status {
 #define SBI_ERR_INVALID_PARAM	-3
 #define SBI_ERR_DENIED		-4
 #define SBI_ERR_INVALID_ADDRESS	-5
+#define SBI_ERR_ALREADY_AVAILABLE -6
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 4757ae158bf3..aaf181a3d74b 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -26,4 +26,5 @@ kvm-y += vcpu_sbi.o
 kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
 kvm-y += vcpu_sbi_base.o
 kvm-y += vcpu_sbi_replace.o
+kvm-y += vcpu_sbi_hsm.o
 kvm-y += vcpu_timer.o
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e3d3aed46184..50158867406d 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -53,6 +53,17 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 	struct kvm_vcpu_csr *reset_csr = &vcpu->arch.guest_reset_csr;
 	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 	struct kvm_cpu_context *reset_cntx = &vcpu->arch.guest_reset_context;
+	bool loaded;
+
+	/**
+	 * The preemption should be disabled here because it races with
+	 * kvm_sched_out/kvm_sched_in(called from preempt notifiers) which
+	 * also calls vcpu_load/put.
+	 */
+	get_cpu();
+	loaded = (vcpu->cpu != -1);
+	if (loaded)
+		kvm_arch_vcpu_put(vcpu);
 
 	memcpy(csr, reset_csr, sizeof(*csr));
 
@@ -64,6 +75,11 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	WRITE_ONCE(vcpu->arch.irqs_pending, 0);
 	WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
+
+	/* Reset the guest CSRs for hotplug usecase */
+	if (loaded)
+		kvm_arch_vcpu_load(vcpu, smp_processor_id());
+	put_cpu();
 }
 
 int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
@@ -100,6 +116,13 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 {
+	/**
+	 * vcpu with id 0 is the designated boot cpu.
+	 * Keep all vcpus with non-zero cpu id in power-off state so that they
+	 * can brought to online using SBI HSM extension.
+	 */
+	if (vcpu->vcpu_idx != 0)
+		kvm_riscv_vcpu_power_off(vcpu);
 }
 
 void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 3502c6166eba..bff753b6e4b0 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -25,6 +25,8 @@ static int kvm_linux_err_map_sbi(int err)
 		return SBI_ERR_INVALID_ADDRESS;
 	case -EOPNOTSUPP:
 		return SBI_ERR_NOT_SUPPORTED;
+	case -EALREADY:
+		return SBI_ERR_ALREADY_AVAILABLE;
 	default:
 		return SBI_ERR_FAILURE;
 	};
@@ -43,6 +45,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
 
 static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_v01,
@@ -50,6 +53,7 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_time,
 	&vcpu_sbi_ext_ipi,
 	&vcpu_sbi_ext_rfence,
+	&vcpu_sbi_ext_hsm,
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
new file mode 100644
index 000000000000..aefee16a1560
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -0,0 +1,107 @@
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
+#include <asm/kvm_vcpu_sbi.h>
+
+static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
+{
+	struct kvm_cpu_context *reset_cntx;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	struct kvm_vcpu *target_vcpu;
+	unsigned long target_vcpuid = cp->a0;
+
+	target_vcpu = kvm_get_vcpu_by_id(vcpu->kvm, target_vcpuid);
+	if (!target_vcpu)
+		return -EINVAL;
+	if (!target_vcpu->arch.power_off)
+		return -EALREADY;
+
+	reset_cntx = &target_vcpu->arch.guest_reset_context;
+	/* start address */
+	reset_cntx->sepc = cp->a1;
+	/* target vcpu id to start */
+	reset_cntx->a0 = target_vcpuid;
+	/* private data passed from kernel */
+	reset_cntx->a1 = cp->a2;
+	kvm_make_request(KVM_REQ_VCPU_RESET, target_vcpu);
+
+	kvm_riscv_vcpu_power_on(target_vcpu);
+
+	return 0;
+}
+
+static int kvm_sbi_hsm_vcpu_stop(struct kvm_vcpu *vcpu)
+{
+	if (vcpu->arch.power_off)
+		return -EINVAL;
+
+	kvm_riscv_vcpu_power_off(vcpu);
+
+	return 0;
+}
+
+static int kvm_sbi_hsm_vcpu_get_status(struct kvm_vcpu *vcpu)
+{
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	unsigned long target_vcpuid = cp->a0;
+	struct kvm_vcpu *target_vcpu;
+
+	target_vcpu = kvm_get_vcpu_by_id(vcpu->kvm, target_vcpuid);
+	if (!target_vcpu)
+		return -EINVAL;
+	if (!target_vcpu->arch.power_off)
+		return SBI_HSM_HART_STATUS_STARTED;
+	else
+		return SBI_HSM_HART_STATUS_STOPPED;
+}
+
+static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				   unsigned long *out_val,
+				   struct kvm_cpu_trap *utrap,
+				   bool *exit)
+{
+	int ret = 0;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	struct kvm *kvm = vcpu->kvm;
+	unsigned long funcid = cp->a6;
+
+	if (!cp)
+		return -EINVAL;
+	switch (funcid) {
+	case SBI_EXT_HSM_HART_START:
+		mutex_lock(&kvm->lock);
+		ret = kvm_sbi_hsm_vcpu_start(vcpu);
+		mutex_unlock(&kvm->lock);
+		break;
+	case SBI_EXT_HSM_HART_STOP:
+		ret = kvm_sbi_hsm_vcpu_stop(vcpu);
+		break;
+	case SBI_EXT_HSM_HART_STATUS:
+		ret = kvm_sbi_hsm_vcpu_get_status(vcpu);
+		if (ret >= 0) {
+			*out_val = ret;
+			ret = 0;
+		}
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+	return ret;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm = {
+	.extid_start = SBI_EXT_HSM,
+	.extid_end = SBI_EXT_HSM,
+	.handler = kvm_sbi_ext_hsm_handler,
+};
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
