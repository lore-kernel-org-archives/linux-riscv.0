Return-Path: <SRS0=a4kH=HG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DBCC433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 05:33:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 088F964F55
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 05:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 088F964F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7xQEFOCVx6QxFP8+cMV0oYGelPUmHcSvKbUF4YL9ec0=; b=zS/C7aPnGhs5TTQwVuE0WCC0n
	cqOTDx0jgxrhI5dwHkDWxC6KELd0NxnKvq2SlODgj5LRbRgIIWSn9xEsaEh07+fXn0EDMkr3g8W0b
	9HZQlsQpmF+xFy0WPV8j9/W2DxzgBz2WD1x3xODSQZnBtmXpFzIy4sZJtNcrfqJLd75k2OFVGV3TX
	qKU9ViQ7IrL915Bec+3izM/H0jgUthUIBJd6tTkfnOmS/RSWkBDb7ZdLg/rMTM18hBWnu+a6ktTmO
	tWKlc+vRDONWKEx9Xx85lRbF0+ZjRDzV4f/uAUz4oO3lzxJFoPu7PA6OKSVXvIH3fflmJj5+eJkuQ
	ZLCJ+biRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7XGN-00069D-39; Thu, 04 Feb 2021 05:33:07 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7XGF-00063g-BF; Thu, 04 Feb 2021 05:33:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612416779; x=1643952779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iJJFwG2gkbnbjw60ClRHydP01kI34Va6crHsBOaLVlg=;
 b=gXuhpdOEMk+BaSvHYhx7pX7f1j+RDXEwDOnXa3kalL/2e8ar09IcKG4C
 LVm+LI9/rx//X2W2tBhWgckzJ+6nAUj3XCMEcKjVVY1j6wQY//nB0KJ0s
 sF8xrFrEaTOv2o5uvhw/8Eo9Wt1paRNkn/1XgIkRMxP0Myqqbk9amvSDD
 Cz6AUJBbisnn1u3Bic61TwfYr3WIDeTsldxHmOqyD8tuLudLfiJKHiCDG
 RnmT94i5hg1VRNiuvuv4XDJ6vzsCVBeWfCVdbAydfy7VtHxsyAzL33Awf
 k+wBnDTUBfIuMcJt9HMgpM1axmBEsSV5AoPSKEhzzQCv5PE5s59qySZGE Q==;
IronPort-SDR: 9hf9FD4SG7YiEQ9JcFoPWpXdgZHjYPSfl86Z6J+uIFnhfNZ42G5GluBrINTOkip1hONp5d+4co
 ncKSHEPt4gBq9y3aka9ZlK53FWnRhYYKeF8UgJREFrDHzwuB4ERW/B6CZycr0LYtH9YGXg9XxB
 CqoQvP/FFL/Kj5kMCy2ljZwS24mYNNOsEMOAID6kVjfzU8XR4ItnllWgtc3ctJew7ItskWCTwz
 zSvyzWw1Gp2OUTGcZueo3kbEdB4tNiG1qXiHqtf/zunFMMfdgNtMsSaJHYuGTX4HwFoYRFWatv
 rYM=
X-IronPort-AV: E=Sophos;i="5.79,400,1602518400"; d="scan'208";a="159086447"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Feb 2021 13:32:55 +0800
IronPort-SDR: 2jx3Ljeo2f1JlAfxBfxeqb9UawFWKc823yI5T3VlCJ7suBh1VVOJUKgr/MiHpKpwOLHRrKGzo7
 +Rkcohn+iCLZWK+D2RpSgtulNLzamA3Hs/F6h7lGgg08l2E09vb6t1Ti+KPFDj9H/1xdl6kXiM
 UI3Sjluy5rcbQf/I5HzsA820RWlIK9HwMj6z0e0gN7ATCpm5YKZ03g/vqSBYSYB19Q0zoMXTtT
 BZyAjlO6n41YvXICRZrEvmo/WP970nlRh7TSJw0RqPpkD6punXwWlMTQA3fHTy+0uv9krd7A9P
 J1+HiHkBMY++dqVRg5zdnpZQ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 21:14:58 -0800
IronPort-SDR: 4R48TJ4/jE8aBRDzH1Bve/9tnQIAQY1hzu5HSv0ZaOglyETzd51vYvYkiNrKl5znvMCta/BT6S
 4PNQQ1106jmLs63vgZ1ARujbRdG4YRHR8ZKY83MfEd8We+BXODBSthzWf/ieH/Fb2Kz18b+PWy
 gLchyCfdpYZJexMrtvAcs0msiz8d/w9NupwdzdCpN3XAc8ghOTsd9S3q4ttPAq1l9cMAFnyiN9
 kVXh7g1qoV+VabhHIQ0FBd1iSwl/MvL/fFhhOe76XWTfU4JOpwA/9/TlQranVwVcrAEHcvDKbv
 1sM=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO jedi-01.hgst.com) ([10.86.63.165])
 by uls-op-cesaip02.wdc.com with ESMTP; 03 Feb 2021 21:32:55 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] RISC-V: Add SBI HSM extension in KVM
Date: Wed,  3 Feb 2021 21:32:38 -0800
Message-Id: <20210204053239.1609558-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204053239.1609558-1-atish.patra@wdc.com>
References: <20210204053239.1609558-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_003259_683071_83F35AD0 
X-CRM114-Status: GOOD (  22.99  )
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
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
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
 arch/riscv/kvm/Makefile       |   2 +-
 arch/riscv/kvm/vcpu.c         |  19 ++++++
 arch/riscv/kvm/vcpu_sbi.c     |   4 ++
 arch/riscv/kvm/vcpu_sbi_hsm.c | 109 ++++++++++++++++++++++++++++++++++
 5 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_hsm.c

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 4a405f583d32..881e89078785 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -106,6 +106,7 @@ enum sbi_srst_reset_reason {
 #define SBI_ERR_INVALID_PARAM	-3
 #define SBI_ERR_DENIED		-4
 #define SBI_ERR_INVALID_ADDRESS	-5
+#define SBI_ERR_ALREADY_AVAILABLE -6
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 302501295397..5627c9c7f249 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -11,5 +11,5 @@ kvm-objs := $(common-objs-y)
 
 kvm-objs += main.o vm.o vmid.o tlb.o mmu.o
 kvm-objs += vcpu.o vcpu_exit.o vcpu_switch.o vcpu_timer.o
-kvm-objs += vcpu_sbi.o vcpu_sbi_base.o vcpu_sbi_legacy.o vcpu_sbi_replace.o
+kvm-objs += vcpu_sbi.o vcpu_sbi_base.o vcpu_sbi_legacy.o vcpu_sbi_replace.o vcpu_sbi_hsm.o
 obj-$(CONFIG_KVM)	+= kvm.o
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index bcc4af9d2fa9..99f94ab27cea 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -130,6 +130,13 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 	struct kvm_vcpu_csr *reset_csr = &vcpu->arch.guest_reset_csr;
 	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 	struct kvm_cpu_context *reset_cntx = &vcpu->arch.guest_reset_context;
+	bool loaded;
+
+	/* Disable preemption to avoid race with preempt notifiers */
+	preempt_disable();
+	loaded = (vcpu->cpu != -1);
+	if (loaded)
+		kvm_arch_vcpu_put(vcpu);
 
 	memcpy(csr, reset_csr, sizeof(*csr));
 
@@ -141,6 +148,11 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	WRITE_ONCE(vcpu->arch.irqs_pending, 0);
 	WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
+
+	/* Reset the guest CSRs for hotplug usecase */
+	if (loaded)
+		kvm_arch_vcpu_load(vcpu, smp_processor_id());
+	preempt_enable();
 }
 
 int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
@@ -182,6 +194,13 @@ int kvm_arch_vcpu_setup(struct kvm_vcpu *vcpu)
 
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
index e21ce1e69e03..20ef59ed83a6 100644
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
@@ -35,6 +37,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
 
 static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_legacy,
@@ -42,6 +45,7 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_time,
 	&vcpu_sbi_ext_ipi,
 	&vcpu_sbi_ext_rfence,
+	&vcpu_sbi_ext_hsm,
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
new file mode 100644
index 000000000000..ce6cfe125559
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -0,0 +1,109 @@
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
+	/* Make sure that the reset request is enqueued before power on */
+	smp_wmb();
+	kvm_riscv_vcpu_power_on(target_vcpu);
+
+	return 0;
+}
+
+static int kvm_sbi_hsm_vcpu_stop(struct kvm_vcpu *vcpu)
+{
+	if ((!vcpu) || (vcpu->arch.power_off))
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
