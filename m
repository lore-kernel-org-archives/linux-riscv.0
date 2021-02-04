Return-Path: <SRS0=a4kH=HG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66EAC433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 05:33:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42ADC64DF0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 05:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42ADC64DF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R6QLou6LMPPIbEZ0aCK+XOgecWBXqbo20DAyinjcX/A=; b=NhPuS/NAViza8vqzpd6ay3xyg
	7A5a/0soG0i9Bpa55lNmbxNrW2zNoJ0plUlv68k6cULwQ16LHDmUkCKIOWbmecypOsc8rNsSOEKui
	wCU3dJi4/8XuLXeKRU/S3q8TRuAbnFUuoOIJvamD+pRIWkGZZ7wTcdBWb/3sv1gZjYU9p/vLK1FK5
	49orZ90WcBOWcustiQtg/cvmT2QG90d+l0/nZP47q7LFHmDRo4EK1ACZaEH6tZJnyYe/CXoQWDqBc
	Udnmmy4Gz8UFPP0m9nofSuy1VG+oQm9avKlXmUCHV027nRGRAEmKrZR8r0031JKWP0yi3YEZg3L0i
	7sO/5S4KA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7XGH-00066R-Pj; Thu, 04 Feb 2021 05:33:01 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7XGC-00063f-6A; Thu, 04 Feb 2021 05:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612416775; x=1643952775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KKoZm/yRaWYpbDjxNyImgz6OnxMRCIBlc1M6mN/Snb4=;
 b=BWcNSn5FUemzVPJT5XNz5LnrGQ2K+6H81uczN2v8T96FJsREbVAYj9EI
 0wd6WuyvXK9frAWGKhgirh78vAic+gEfWVqcUj47DnT6t3kSJyRUvFBne
 H13LIinwUMvvfi4NgJVZzxhcQAu/iOuSiDpibEZQscKTSaZHjbViE2h0l
 nAjmKRI8Hv/MHe6T+vlorjnj4E9QsCMoq1bBRGQ+ilWqTKB2SowIxbUJK
 oaFUw1MtIG2hqV0kSwtyN/kHhv/2cem8C5h0jq/U7zPze0TKWzrnOhMNh
 P467phmaXKUwfyWbTthYDv5XxiCwXwDKCDYB9AtvXcDydDI/sazW12B1h g==;
IronPort-SDR: 2T9T8QyyXlb7wAf/2EUctmjYKX2bP/HPp8oBMNcFgsAEAGJT+d9njzLXXlaEyB6Wubli7Mu4Of
 j9zEw8YJyx+YBpB+t3iSFCN6UknbSx50VWx4UFsT8Vx+ofVse7uj2p4iZMWs5pnoJV4xPHuadW
 R9+7HJe0SfrLt6R/wnaP1eO7ag3WouKdnUAFEuKd4Km4o7HlwYSikQPQgb7XxFazVveDgReBaR
 +Vgt5VUbMxBqXvnMfEplAomno/wiWbNSWGeK5jsUqMxcDfDb7iU4vCEFVSmbw1+PHxukoAjvc0
 M1E=
X-IronPort-AV: E=Sophos;i="5.79,400,1602518400"; d="scan'208";a="159086431"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Feb 2021 13:32:53 +0800
IronPort-SDR: Ds6i/W1An4joSm6QzNYmX5CGOq1rcrIr/GBR/XLgnHs7IO8sUet3Edhp7/+E3fATs7t6HHIguH
 0IC57SF5xb8ntHcy15GcfIsCgUhm6zZxWMHdhTOlEvbaIlCcmtd9y4ioDnysNCIPbdTXNJPA9y
 OQ/cwKrW9e/saYSATkbP8BFR1x0K8qTGMbZT00z3dZbrhUPYgGvFj2q1U2cPecDO3OLZbsBUav
 MaNLYA2Pig3GE0vveXqxDH2ZmJlM/dHBW12XwLlbYBo24nHgI1bFbL85s/+7xaAoFy31nTbQij
 2EbWwo64ErZRkCfchPI3U48R
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 21:14:57 -0800
IronPort-SDR: alPokM4Ni8YztwJSBFlZvtaYzFjJvz7QCcB0erZK2+Wb5cT6Mxt0WIBRbZryZm9dHk7/ja734c
 iTWetN/DrwEXAgES68K1mA26oNtJjmfHnHm8tNkAYZrpHthQp/7vnQVuKszl3NcBv95wshIPR8
 lVGqwM3o1OEojPUJoT6s3idyEtiMJDP53bOOlrtmMl6H14ism29w38eII3CNSVCIJtgBOPKJ/I
 wg6+FWvGe426rpHzljdP2zQLHXBVyAN5sXdmX9XRzTo/a76bk+m/5/mvyfDqyqwT96hdU5FoA+
 8Q8=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO jedi-01.hgst.com) ([10.86.63.165])
 by uls-op-cesaip02.wdc.com with ESMTP; 03 Feb 2021 21:32:53 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] RISC-V: Mark the existing SBI v0.1 implementation as
 legacy
Date: Wed,  3 Feb 2021 21:32:34 -0800
Message-Id: <20210204053239.1609558-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204053239.1609558-1-atish.patra@wdc.com>
References: <20210204053239.1609558-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_003256_488277_D4368301 
X-CRM114-Status: GOOD (  27.24  )
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

The existing SBI specification impelementation follows v0.1 or legacy
specification. The latest specification known as v0.2 allows more
scalability and performance improvements.

Rename the existing implementation as legacy and provide a way to allow
future extensions.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  29 +++++
 arch/riscv/kvm/vcpu_sbi.c             | 149 ++++++++++++++++++++------
 2 files changed, 148 insertions(+), 30 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi.h

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
new file mode 100644
index 000000000000..5b3523a01bce
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/**
+ * Copyright (c) 2020 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *     Atish Patra <atish.patra@wdc.com>
+ */
+
+#ifndef __RISCV_KVM_VCPU_SBI_H__
+#define __RISCV_KVM_VCPU_SBI_H__
+
+#define KVM_SBI_VERSION_MAJOR 0
+#define KVM_SBI_VERSION_MINOR 2
+
+struct kvm_vcpu_sbi_extension {
+	unsigned long extid_start;
+	unsigned long extid_end;
+	/**
+	 * SBI extension handler. It can be defined for a given extension or group of
+	 * extension. But it should always return linux error codes rather than SBI
+	 * specific error codes.
+	 */
+	int (*handler)(struct kvm_vcpu *vcpu, struct kvm_run *run,
+		       unsigned long *out_val, struct kvm_cpu_trap *utrap,
+		       bool *exit);
+};
+
+const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid);
+#endif /* __RISCV_KVM_VCPU_SBI_H__ */
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 9d1d25cf217f..a96ed3e3a9a3 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -12,9 +12,25 @@
 #include <asm/csr.h>
 #include <asm/sbi.h>
 #include <asm/kvm_vcpu_timer.h>
+#include <asm/kvm_vcpu_sbi.h>
 
-#define SBI_VERSION_MAJOR			0
-#define SBI_VERSION_MINOR			1
+static int kvm_linux_err_map_sbi(int err)
+{
+	switch (err) {
+	case 0:
+		return SBI_SUCCESS;
+	case -EPERM:
+		return SBI_ERR_DENIED;
+	case -EINVAL:
+		return SBI_ERR_INVALID_PARAM;
+	case -EFAULT:
+		return SBI_ERR_INVALID_ADDRESS;
+	case -EOPNOTSUPP:
+		return SBI_ERR_NOT_SUPPORTED;
+	default:
+		return SBI_ERR_FAILURE;
+	};
+}
 
 static void kvm_sbi_system_shutdown(struct kvm_vcpu *vcpu,
 				    struct kvm_run *run, u32 type)
@@ -70,16 +86,17 @@ int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	return 0;
 }
 
-int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
+static int kvm_sbi_ext_legacy_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				      unsigned long *out_val,
+				      struct kvm_cpu_trap *utrap,
+				      bool *exit)
 {
 	ulong hmask;
-	int i, ret = 1;
+	int i, ret = 0;
 	u64 next_cycle;
 	struct kvm_vcpu *rvcpu;
-	bool next_sepc = true;
 	struct cpumask cm, hm;
 	struct kvm *kvm = vcpu->kvm;
-	struct kvm_cpu_trap utrap = { 0 };
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 
 	if (!cp)
@@ -93,8 +110,7 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 		 * handled in kernel so we forward these to user-space
 		 */
 		kvm_riscv_vcpu_sbi_forward(vcpu, run);
-		next_sepc = false;
-		ret = 0;
+		*exit = true;
 		break;
 	case SBI_EXT_0_1_SET_TIMER:
 #if __riscv_xlen == 32
@@ -102,47 +118,42 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 #else
 		next_cycle = (u64)cp->a0;
 #endif
-		kvm_riscv_vcpu_timer_next_event(vcpu, next_cycle);
+		ret = kvm_riscv_vcpu_timer_next_event(vcpu, next_cycle);
 		break;
 	case SBI_EXT_0_1_CLEAR_IPI:
-		kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_SOFT);
+		ret = kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_SOFT);
 		break;
 	case SBI_EXT_0_1_SEND_IPI:
 		if (cp->a0)
 			hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0,
-							   &utrap);
+							   utrap);
 		else
 			hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
-		if (utrap.scause) {
-			utrap.sepc = cp->sepc;
-			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
-			next_sepc = false;
+		if (utrap->scause)
 			break;
-		}
+
 		for_each_set_bit(i, &hmask, BITS_PER_LONG) {
 			rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
-			kvm_riscv_vcpu_set_interrupt(rvcpu, IRQ_VS_SOFT);
+			ret = kvm_riscv_vcpu_set_interrupt(rvcpu, IRQ_VS_SOFT);
+			if (ret < 0)
+				break;
 		}
 		break;
 	case SBI_EXT_0_1_SHUTDOWN:
 		kvm_sbi_system_shutdown(vcpu, run, KVM_SYSTEM_EVENT_SHUTDOWN);
-		next_sepc = false;
-		ret = 0;
+		*exit = true;
 		break;
 	case SBI_EXT_0_1_REMOTE_FENCE_I:
 	case SBI_EXT_0_1_REMOTE_SFENCE_VMA:
 	case SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID:
 		if (cp->a0)
 			hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0,
-							   &utrap);
+							   utrap);
 		else
 			hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
-		if (utrap.scause) {
-			utrap.sepc = cp->sepc;
-			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
-			next_sepc = false;
+		if (utrap->scause)
 			break;
-		}
+
 		cpumask_clear(&cm);
 		for_each_set_bit(i, &hmask, BITS_PER_LONG) {
 			rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
@@ -152,22 +163,100 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 		}
 		riscv_cpuid_to_hartid_mask(&cm, &hm);
 		if (cp->a7 == SBI_EXT_0_1_REMOTE_FENCE_I)
-			sbi_remote_fence_i(cpumask_bits(&hm));
+			ret = sbi_remote_fence_i(cpumask_bits(&hm));
 		else if (cp->a7 == SBI_EXT_0_1_REMOTE_SFENCE_VMA)
-			sbi_remote_hfence_vvma(cpumask_bits(&hm),
+			ret = sbi_remote_hfence_vvma(cpumask_bits(&hm),
 						cp->a1, cp->a2);
 		else
-			sbi_remote_hfence_vvma_asid(cpumask_bits(&hm),
+			ret = sbi_remote_hfence_vvma_asid(cpumask_bits(&hm),
 						cp->a1, cp->a2, cp->a3);
 		break;
 	default:
-		/* Return error for unsupported SBI calls */
-		cp->a0 = SBI_ERR_NOT_SUPPORTED;
+		ret = -EINVAL;
 		break;
 	};
 
+	return ret;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_legacy = {
+	.extid_start = SBI_EXT_0_1_SET_TIMER,
+	.extid_end = SBI_EXT_0_1_SHUTDOWN,
+	.handler = kvm_sbi_ext_legacy_handler,
+};
+
+static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
+	&vcpu_sbi_ext_legacy,
+};
+
+const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid)
+{
+	int i = 0;
+
+	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
+		if (sbi_ext[i]->extid_start <= extid &&
+		    sbi_ext[i]->extid_end >= extid)
+			return sbi_ext[i];
+	}
+
+	return NULL;
+}
+
+int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
+{
+	int ret = 1;
+	bool next_sepc = true;
+	bool userspace_exit = false;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	const struct kvm_vcpu_sbi_extension *sbi_ext;
+	struct kvm_cpu_trap utrap = { 0 };
+	unsigned long out_val = 0;
+	bool ext_is_v01 = false;
+
+	if (!cp)
+		return -EINVAL;
+
+	sbi_ext = kvm_vcpu_sbi_find_ext(cp->a7);
+	if (sbi_ext && sbi_ext->handler) {
+		if (cp->a7 >= SBI_EXT_0_1_SET_TIMER &&
+		    cp->a7 <= SBI_EXT_0_1_SHUTDOWN)
+			ext_is_v01 = true;
+		ret = sbi_ext->handler(vcpu, run, &out_val, &utrap, &userspace_exit);
+	} else {
+		/* Return error for unsupported SBI calls */
+		cp->a0 = SBI_ERR_NOT_SUPPORTED;
+		goto ecall_done;
+	}
+
+	/* Handle special error cases i.e trap, exit or userspace forward */
+	if (utrap.scause) {
+		/* No need to increment sepc or exit ioctl loop */
+		ret = 1;
+		utrap.sepc = cp->sepc;
+		kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
+		next_sepc = false;
+		goto ecall_done;
+	}
+
+	/* Exit ioctl loop or Propagate the error code the guest */
+	if (userspace_exit) {
+		next_sepc = false;
+		ret = 0;
+	} else {
+		/**
+		 * SBI extension handler always returns an Linux error code. Convert
+		 * it to the SBI specific error code that can be propagated the SBI
+		 * caller.
+		 */
+		ret = kvm_linux_err_map_sbi(ret);
+		cp->a0 = ret;
+		ret = 1;
+	}
+ecall_done:
 	if (next_sepc)
 		cp->sepc += 4;
+	if (!ext_is_v01)
+		cp->a1 = out_val;
 
 	return ret;
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
