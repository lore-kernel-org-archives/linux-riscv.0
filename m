Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82701C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 08:40:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47DA961B30
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 08:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47DA961B30
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=njkwwTW2jHfTg+zHn7jdpYDOmRJtBGynwc5A4sE7tIo=; b=v7d2o50MyKJkuM
	rElDtTmV1PKeu+9F04+BgwuAUYoOksIu60LE1MJID45KaGj3TS4eDrhxP1UOLMzU6VlN4mMJF8kBy
	9UbeEU0vWTVn48/v0PfXzFpRtg7STPxEj7sIiHOpqW8G+xyC84ANW0PaSf61N2bnxiDb41UBrfF+G
	dbLlD1GAzNPAIxuzCRfs0DBFRrnMU6aesFlNIirYA7aGQMyp8msHAqTqgQzqpkOBaY22AbS5zf5Vj
	1dFcL58OmKS9za3wXlfmKIZAjYzhw0FdShx2wIfqW+8eqBKR59lqkfQWPZbgvlQJ4amzHxbabzlIA
	8uKnQjD81X+i2ZArvxhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mncxq-007DnI-Ab; Thu, 18 Nov 2021 08:40:14 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mncxi-007Diy-Ro
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 08:40:10 +0000
Received: by mail-oo1-xc29.google.com with SMTP id
 w5-20020a4a2745000000b002c2649b8d5fso1636089oow.10
 for <linux-riscv@lists.infradead.org>; Thu, 18 Nov 2021 00:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j5rnL+4PBNac93hwYSim5xX6bG0qtM8Vy6bQe7kCJ8s=;
 b=Ma/tYlfvaTz8KqSm3kIDsGZo8cY9c64c46DbdIkz+WHUBPknCgYV4fEI8d0SOmWPQt
 2wtobzEcrTETfKNhuXGVgWlK5RcPACfBdTTs4sAj/m97kBMHtsyakKXHwOh43lfC3D+M
 +Uz99k+gOIC3SEV7fXixA0ILCQTmEav9b/RQ/sWb2O9IP6vVsOxO76RwW6cq7fTTTCyP
 5YnLJxA83vYLs2y5WfDGbHRsuL9C7qAMYrxAl0lxnZxb2OXgoU2FUsVbt6b33Z20hWEI
 S7pLx8ssXz+rSSqWd7FjnuNO/ak1/3/gD2VQqy4/qqEKJtoMd1fSwIkEOYpDphKThZtV
 Itng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j5rnL+4PBNac93hwYSim5xX6bG0qtM8Vy6bQe7kCJ8s=;
 b=ZvB7QYXqwty78BxQSJ1ZY8VsFDUx3yMJBNsxtI6pjVmJo7XX87PP09/n8uPid7JMeI
 MfeBIMw4ucitrTC/9xBz+yld7/VEFiIaW+HjCoBblIoAzKSphwDXfnGyHtos+/czlt6x
 fq1K8wqbk4EVq72KSrYj+a+I9Wt77L7ATZezE2k8B7M/Hjn3LWGzVUPVN/qd3aM77vXe
 XJo67dMZYxoE0jMyjQSR2DuK8wH1QAUN+ps4ygJD0C43Tb0is77IwCJMpiwpymIUwvum
 46Tv6JzVQv+5zIF3ZjEmbl/wID969szlQxBju2eapGyDMGvJs/mhEY/m8BG2yXd7Nk5v
 Glzg==
X-Gm-Message-State: AOAM53023QEPye4MVHfSyQMNjPskwuo7n7b3Qq9d1bk3BDlYCw04Aey1
 phHbZv773XK3/scOjL96sPDkqw==
X-Google-Smtp-Source: ABdhPJwLk+wjI9jaszIsjbCnufZRlUzurBZILMJYvuF6vUi+X56nO16gSQvofgvDcQazHSwGimvY9A==
X-Received: by 2002:a4a:7559:: with SMTP id g25mr9158757oof.54.1637224805586; 
 Thu, 18 Nov 2021 00:40:05 -0800 (PST)
Received: from fedora.. (99-13-229-45.lightspeed.snjsca.sbcglobal.net.
 [99.13.229.45])
 by smtp.gmail.com with ESMTPSA id p14sm422100oov.0.2021.11.18.00.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 00:40:05 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v5 1/5] RISC-V: KVM: Mark the existing SBI implementation as
 v01
Date: Thu, 18 Nov 2021 00:39:08 -0800
Message-Id: <20211118083912.981995-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211118083912.981995-1-atishp@rivosinc.com>
References: <20211118083912.981995-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_004006_951712_1EF9C117 
X-CRM114-Status: GOOD (  26.46  )
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

From: Atish Patra <atish.patra@wdc.com>

The existing SBI specification impelementation follows v0.1
specification. The latest specification allows more
scalability and performance improvements.

Rename the existing implementation as v01 and provide a way to allow
future extensions.

Reviewed-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  29 +++++
 arch/riscv/kvm/vcpu_sbi.c             | 149 ++++++++++++++++++++------
 2 files changed, 145 insertions(+), 33 deletions(-)
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
index eb3c045edf11..32376906ff20 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * Copyright (c) 2019 Western Digital Corporation or its affiliates.
  *
  * Authors:
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
@@ -72,21 +88,19 @@ static void kvm_sbi_system_shutdown(struct kvm_vcpu *vcpu,
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
 
-	if (!cp)
-		return -EINVAL;
-
 	switch (cp->a7) {
 	case SBI_EXT_0_1_CONSOLE_GETCHAR:
 	case SBI_EXT_0_1_CONSOLE_PUTCHAR:
@@ -95,8 +109,7 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 		 * handled in kernel so we forward these to user-space
 		 */
 		kvm_riscv_vcpu_sbi_forward(vcpu, run);
-		next_sepc = false;
-		ret = 0;
+		*exit = true;
 		break;
 	case SBI_EXT_0_1_SET_TIMER:
 #if __riscv_xlen == 32
@@ -104,47 +117,42 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
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
@@ -154,22 +162,97 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
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
 	}
 
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
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
