Return-Path: <SRS0=deyN=PY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB52C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 23:59:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61BED610CD
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 23:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61BED610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmv+bqM4iLsy4fZhxG0hFPxDSpLW4DkMSXgBDV7bRfQ=; b=y68xz+YPoONG05
	lZPrD6JUuDC87rRMoxQck87FPu7SZAiitAXfsRJ82yI/yOzeE4yK/lDNFdQ/kT6Y9Bmhbq2Yd60iL
	gcq6h+tbQQ3gvG6r9TGhqw69OSPSCK4ir7Xkivp5xppALIJ3fNlwsG66PsPR2hV4Kqd0mf2rmvd1W
	x1ROAr8QuAS8n05o6mOL65JIPic35D8aKdQQVoV0fKEdJhhTAQnIV/7rtOCdlJ4+deENcvWe4tA+Z
	2uWnCqe6eO/AnaOUSDrc9i5hKD8BjOX8iIo5f/GjS3SL1U+I6zDb9tGNeviaAz3D89XTgDmzuY/2O
	nswdSCMKfhGR4TL1a7Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj970-00CSuK-Da; Fri, 05 Nov 2021 23:59:10 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj96u-00CSpx-Lf; Fri, 05 Nov 2021 23:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1636156744; x=1667692744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oAAklw2+l3Z+7rUkDWJ+Pk60d+W6Gai8Zdl3z5WLmn4=;
 b=GXdpLSVQMPcVbGz+frJQJGaGSFGJBYHperkG9pIVq1Ep1qFGmcO1UGXs
 /Mincxf9SJWVWdDOX3q8+qJ6RxrxDaD0eYdzJrnIB8OFq0ADEJbzqxsHx
 zLfVrAEsTW/CDmac4GSbuHlSJkpQpQ3FshVbewLnesNXLfJ/IrzPzXJjy
 0gjAN4uTDG041I3GGMsvrzMqu3+3uwXONX7S2HCR34VwVr8isW6mu5vQg
 qamj1OmN71ud9/wLWPRbRlAvPKiz8DWZoTbKNCao/HomkNVfGv3zZ+Dok
 KRWy9NCt63BJunCpBbhHL7TR5TuPNyxVWEAvr0tBUFhfxfHyQZFbUOIXB Q==;
X-IronPort-AV: E=Sophos;i="5.87,212,1631548800"; d="scan'208";a="183840500"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Nov 2021 07:59:02 +0800
IronPort-SDR: bQkNicv+q9IyAbw8Igc9hZTKsreCqZLIWkM9xPZk3XQ2ppzYSKDahCP97pzeeYq3Msdx70HPX8
 O0uHLyPNMncwZrG0cd0WpWicvoYm7SBKiUdLbkEgnLkzBfMp/fWAriD1n8ThPYEUUrnuLCWiBu
 09bAI7+OZkz+rBzRQgzBT3N0Jg0ouWMlBUQj/EF4sCn9K85OZcB8GfiMoJBxs1uXQxzQDsUPRl
 KFmvgYL9bOiuue7G1yTmFPueeAm6RdIN6rwwbv2x3qvAx0vQq1/f75ipFvGgZY74/20wxbqh2+
 lAX1og1wR34SQ7sOokZePf6Y
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 16:32:46 -0700
IronPort-SDR: 6I4QEXh2k8Tvp4lrFF0q9Fcf6ZEsiD2oVrlSCtYZzXFLRYzcdgtShfxX84k+ulbNGJhE/XVrb6
 ShUzRzKhp0qFva7/JuG0AxkpQMF7jmxY8vbpsvKYcf+HB+6JDMbQ4zIAkbMRzWJ9s3gdHGyD6T
 dwqGTfGH2tgAGNWTzwckIQjx9R3qR7P17IlkbssJUw6etHwU9WHqVjh2ushANW1fkxPzHVp4Bt
 dnikvKdA5ApxHtsoClqFYEehIyRDvA+q5yQkH2ev3Z1e9RYtMnkZPemdO4bePKpqe5BrI0nyP5
 yAs=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.48])
 by uls-op-cesaip02.wdc.com with ESMTP; 05 Nov 2021 16:59:02 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>, pbonzini@redhat.com,
 Sean Christopherson <seanjc@google.com>
Subject: [PATCH v4 1/5] RISC-V: KVM: Mark the existing SBI implementation as
 v01
Date: Fri,  5 Nov 2021 16:58:48 -0700
Message-Id: <20211105235852.3011900-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105235852.3011900-1-atish.patra@wdc.com>
References: <20211105235852.3011900-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_165904_807632_40990E12 
X-CRM114-Status: GOOD (  26.61  )
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

The existing SBI specification impelementation follows v0.1
specification. The latest specification known as v0.2 allows more
scalability and performance improvements.

Rename the existing implementation as v01 and provide a way to allow
future extensions.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  29 +++++
 arch/riscv/kvm/vcpu_sbi.c             | 147 +++++++++++++++++++++-----
 2 files changed, 147 insertions(+), 29 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi.h

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
new file mode 100644
index 000000000000..1a4cb0db2d0b
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/**
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
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
index eb3c045edf11..05cab5f27eee 100644
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
 
 static void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu,
 				       struct kvm_run *run)
@@ -72,16 +88,17 @@ static void kvm_sbi_system_shutdown(struct kvm_vcpu *vcpu,
 	run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
 }
 
-int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
+static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
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
@@ -95,8 +112,7 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 		 * handled in kernel so we forward these to user-space
 		 */
 		kvm_riscv_vcpu_sbi_forward(vcpu, run);
-		next_sepc = false;
-		ret = 0;
+		*exit = true;
 		break;
 	case SBI_EXT_0_1_SET_TIMER:
 #if __riscv_xlen == 32
@@ -104,47 +120,42 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
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
@@ -154,22 +165,100 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
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
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
+	.extid_start = SBI_EXT_0_1_SET_TIMER,
+	.extid_end = SBI_EXT_0_1_SHUTDOWN,
+	.handler = kvm_sbi_ext_v01_handler,
+};
+
+static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
+	&vcpu_sbi_ext_v01,
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
 		/* Return error for unsupported SBI calls */
 		cp->a0 = SBI_ERR_NOT_SUPPORTED;
-		break;
+		goto ecall_done;
 	}
 
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
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
