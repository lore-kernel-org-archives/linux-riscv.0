Return-Path: <SRS0=YRhX=PZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A242C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Nov 2021 04:28:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B83D60F45
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Nov 2021 04:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B83D60F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DbCDtbOfe3prEFdINQmEsk05tYnHzDumYiZeTDEN7tI=; b=KjpaIMxEfAYQZX
	yrakgf8fZj/6DPHdBjyVTWeRBfGUsD7/dYSyMh6oSko1WsR2RIJrMRgCGtV3e7d0YkN0dtfH9+1cf
	R1sgDWU5dyZUxgXUWzxhpzKejVPEgWkznsgjDZV/Ce0/WVI9qQEeYHF9jHIYq0aFHVLDQNX2G7Rl3
	eO7ELXSkXpEMy07nHY01X2po624AlYRHpTQvvs7mIFbhl/zdlypTnxLr7e+O/nzNi+kAQwKTgq3gJ
	VHEy6LoQ5fzJYcvgjZzRXtBPeoS/s427mCKi+JM/5ZHhL5q3pzsnZhBrJGEYg/EtLWAj0IMMZlwY2
	D4lDeLGySOy39GtqFw6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjDJJ-00CeTJ-OO; Sat, 06 Nov 2021 04:28:09 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjDJF-00CeSs-Rp; Sat, 06 Nov 2021 04:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636172870;
 bh=YZMVXFKTkjVrz80ezlaRYsqRt3UuPX6gr5RD1dEt9lE=;
 h=X-UI-Sender-Class:Date:From:To:CC:Subject:In-Reply-To:References;
 b=V4U9AmwbWaIQURzNt7tBuj/aWnLEtI1n3fd5s9Og44TY1Jj2RQjsakUMo6A+cHsx1
 ZgLfrfakljXG6EaYqFTh2MALYdNlmNG4FYGW2HScI0HitzJlle1Yu1/sD22LTGaPJe
 j0OseXwV+G69tqDLTxLLozuXoKzDZuWcDmVeA4Oc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [127.0.0.1] ([88.152.144.157]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuDc7-1mTCYa46SD-00uZ4n; Sat, 06
 Nov 2021 05:27:50 +0100
Date: Sat, 06 Nov 2021 05:27:51 +0100
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org
CC: Anup Patel <anup.patel@wdc.com>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>, pbonzini@redhat.com,
 Sean Christopherson <seanjc@google.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_1/5=5D_RISC-V=3A_KVM=3A_Mark_?=
 =?US-ASCII?Q?the_existing_SBI_implementation_as_v01?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20211105235852.3011900-2-atish.patra@wdc.com>
References: <20211105235852.3011900-1-atish.patra@wdc.com>
 <20211105235852.3011900-2-atish.patra@wdc.com>
Message-ID: <DF82A93F-50CD-4A68-A8A6-0056E6248172@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ojJ5yr2d53Qu0JOZb+BzZFolZzHoY1m1khS9Ubejetc8WNJN4Gv
 WrivTCg5A5UkGNfUD+aZBPA221FPlfmuO94kQ8ixDDx+CK0/mXSwIdVTZ5UcSLkgHfLcoD1
 zaxHZ9L7on6PGRuBEyBewbejqFje/mxETSOxgHvfmxorPLt/Zqx9/xU3Bonv5QgZlC0KdPe
 C6rF2DIWkrjGY9JOAwVOw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q2YHUv3cTng=:bfsfNK5xRLXCDTjTkSYwq8
 Be+jfAX2zX4f1eFLWE4jYDUGWg/8nCATmHs9hSGjuwc7b/UqN9iT70vrvjMQ9KH2T72EAeYNE
 okzqEU5SU6xBuST46q+g7PWYdZTu30KuLc2LhKaEoLku8yi2UMzQkpdPf8LI3ymG+XtRoURyL
 JXIt2fb/th6af3Kf0yK17f5a7oCVoSvuCwVjETgWC++TD4zBbhZwqdxLpeuNlttthoDI/TCLb
 xEf79NL/pF5K80JrccGcrT3pEHfsMG2CA0CfCVLn8/GIBK8YHqviGxA9egC7ABQfpMYHUzax7
 1q8qul2PEGveahhSaeNe/pwXA1zUaYUQ+K78HtrJxOBB4XlUpp+F7tvrtHBoHOyzbf/Y850CW
 OlQb5LrJypcGNefw0ac6+FID9nZiC4YoqlSz6+AGgGubAiEt31lm/hb7E/M3FNdd7sedHPqmS
 jiXS8GR4ceBTA1E30dEK8cIiSEURBPI9FlNoWkS4EKEdXPAeDvF945p9L0KS9qawbZlh1JAjR
 K3NRnpvrm2UQeNE1lrjYsuvRKkq4YYjgwpN2XfUVWz+jK5XAjqkmA+ZtE6vL2owF0aaOwiNjU
 fVVa7BRfd0krKFN3E+aIbm1HscHRPS0Ea/T9t0hiyUFPtiKGe+qAN6Ex1rYfaVF5gbUa+6EHh
 yNycoYDu6k+tz06Bw07UcJMLE7clZiaRS1l4sBD9OBy+hcOzZdec0YUbNo4/IxO+IXZEB+di6
 rqOucbZ3KDDI/X/UurqQw1DPWVlnzzdQ7mgHsOsYhJp9cHMatOB5HlrCpgm7biSxgcOP4UsGb
 OJzuhzCWkKpJnGNdBfz6/0jKw6vEojnKel4KnfidFMlGodZi4HoRUWTn4P3A7pB0lLDKdbiPF
 4RREPRL5/FtyxEMKnkbkNeK58YUKY8/1u1bSec1aizx/ZfalERhSjoKtkOr7R9/81MfzD+SGB
 9PRcJbEhdqC13sWB9ih6Y8I6RUgCqZNyFWpG4kvisZEGGtbIunzoY21s7qMLEAfSQCyxNeKQm
 jO1LwTT3gsH4QcJy9jsV7kXvh/qRKB8v8tLL5Hg1ifvQwePM7cHzFsVtpcTZrHvfQ+QJFT/II
 7dwcYadydN3WY4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_212806_288238_53E267B4 
X-CRM114-Status: GOOD (  16.06  )
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

Am 6. November 2021 00:58:48 MEZ schrieb Atish Patra <atish.patra@wdc.com>:
>The existing SBI specification impelementation follows v0.1
>specification. The latest specification known as v0.2 allows more
>scalability and performance improvements.

Isn't 0.3 the current SBI specification version?

Especially the system reset extension would be valuable for KVM.

(This is not meant to stop merging this patch series.)

Best regards

Heinrich


>
>Rename the existing implementation as v01 and provide a way to allow
>future extensions.
>
>Signed-off-by: Atish Patra <atish.patra@wdc.com>
>---
> arch/riscv/include/asm/kvm_vcpu_sbi.h |  29 +++++
> arch/riscv/kvm/vcpu_sbi.c             | 147 +++++++++++++++++++++-----
> 2 files changed, 147 insertions(+), 29 deletions(-)
> create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi.h
>
>diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
>new file mode 100644
>index 000000000000..1a4cb0db2d0b
>--- /dev/null
>+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
>@@ -0,0 +1,29 @@
>+/* SPDX-License-Identifier: GPL-2.0-only */
>+/**
>+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
>+ *
>+ * Authors:
>+ *     Atish Patra <atish.patra@wdc.com>
>+ */
>+
>+#ifndef __RISCV_KVM_VCPU_SBI_H__
>+#define __RISCV_KVM_VCPU_SBI_H__
>+
>+#define KVM_SBI_VERSION_MAJOR 0
>+#define KVM_SBI_VERSION_MINOR 2
>+
>+struct kvm_vcpu_sbi_extension {
>+	unsigned long extid_start;
>+	unsigned long extid_end;
>+	/**
>+	 * SBI extension handler. It can be defined for a given extension or group of
>+	 * extension. But it should always return linux error codes rather than SBI
>+	 * specific error codes.
>+	 */
>+	int (*handler)(struct kvm_vcpu *vcpu, struct kvm_run *run,
>+		       unsigned long *out_val, struct kvm_cpu_trap *utrap,
>+		       bool *exit);
>+};
>+
>+const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid);
>+#endif /* __RISCV_KVM_VCPU_SBI_H__ */
>diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
>index eb3c045edf11..05cab5f27eee 100644
>--- a/arch/riscv/kvm/vcpu_sbi.c
>+++ b/arch/riscv/kvm/vcpu_sbi.c
>@@ -12,9 +12,25 @@
> #include <asm/csr.h>
> #include <asm/sbi.h>
> #include <asm/kvm_vcpu_timer.h>
>+#include <asm/kvm_vcpu_sbi.h>
> 
>-#define SBI_VERSION_MAJOR			0
>-#define SBI_VERSION_MINOR			1
>+static int kvm_linux_err_map_sbi(int err)
>+{
>+	switch (err) {
>+	case 0:
>+		return SBI_SUCCESS;
>+	case -EPERM:
>+		return SBI_ERR_DENIED;
>+	case -EINVAL:
>+		return SBI_ERR_INVALID_PARAM;
>+	case -EFAULT:
>+		return SBI_ERR_INVALID_ADDRESS;
>+	case -EOPNOTSUPP:
>+		return SBI_ERR_NOT_SUPPORTED;
>+	default:
>+		return SBI_ERR_FAILURE;
>+	};
>+}
> 
> static void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu,
> 				       struct kvm_run *run)
>@@ -72,16 +88,17 @@ static void kvm_sbi_system_shutdown(struct kvm_vcpu *vcpu,
> 	run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
> }
> 
>-int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
>+static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>+				      unsigned long *out_val,
>+				      struct kvm_cpu_trap *utrap,
>+				      bool *exit)
> {
> 	ulong hmask;
>-	int i, ret = 1;
>+	int i, ret = 0;
> 	u64 next_cycle;
> 	struct kvm_vcpu *rvcpu;
>-	bool next_sepc = true;
> 	struct cpumask cm, hm;
> 	struct kvm *kvm = vcpu->kvm;
>-	struct kvm_cpu_trap utrap = { 0 };
> 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> 
> 	if (!cp)
>@@ -95,8 +112,7 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
> 		 * handled in kernel so we forward these to user-space
> 		 */
> 		kvm_riscv_vcpu_sbi_forward(vcpu, run);
>-		next_sepc = false;
>-		ret = 0;
>+		*exit = true;
> 		break;
> 	case SBI_EXT_0_1_SET_TIMER:
> #if __riscv_xlen == 32
>@@ -104,47 +120,42 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
> #else
> 		next_cycle = (u64)cp->a0;
> #endif
>-		kvm_riscv_vcpu_timer_next_event(vcpu, next_cycle);
>+		ret = kvm_riscv_vcpu_timer_next_event(vcpu, next_cycle);
> 		break;
> 	case SBI_EXT_0_1_CLEAR_IPI:
>-		kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_SOFT);
>+		ret = kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_SOFT);
> 		break;
> 	case SBI_EXT_0_1_SEND_IPI:
> 		if (cp->a0)
> 			hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0,
>-							   &utrap);
>+							   utrap);
> 		else
> 			hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
>-		if (utrap.scause) {
>-			utrap.sepc = cp->sepc;
>-			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
>-			next_sepc = false;
>+		if (utrap->scause)
> 			break;
>-		}
>+
> 		for_each_set_bit(i, &hmask, BITS_PER_LONG) {
> 			rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
>-			kvm_riscv_vcpu_set_interrupt(rvcpu, IRQ_VS_SOFT);
>+			ret = kvm_riscv_vcpu_set_interrupt(rvcpu, IRQ_VS_SOFT);
>+			if (ret < 0)
>+				break;
> 		}
> 		break;
> 	case SBI_EXT_0_1_SHUTDOWN:
> 		kvm_sbi_system_shutdown(vcpu, run, KVM_SYSTEM_EVENT_SHUTDOWN);
>-		next_sepc = false;
>-		ret = 0;
>+		*exit = true;
> 		break;
> 	case SBI_EXT_0_1_REMOTE_FENCE_I:
> 	case SBI_EXT_0_1_REMOTE_SFENCE_VMA:
> 	case SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID:
> 		if (cp->a0)
> 			hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0,
>-							   &utrap);
>+							   utrap);
> 		else
> 			hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
>-		if (utrap.scause) {
>-			utrap.sepc = cp->sepc;
>-			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
>-			next_sepc = false;
>+		if (utrap->scause)
> 			break;
>-		}
>+
> 		cpumask_clear(&cm);
> 		for_each_set_bit(i, &hmask, BITS_PER_LONG) {
> 			rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
>@@ -154,22 +165,100 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
> 		}
> 		riscv_cpuid_to_hartid_mask(&cm, &hm);
> 		if (cp->a7 == SBI_EXT_0_1_REMOTE_FENCE_I)
>-			sbi_remote_fence_i(cpumask_bits(&hm));
>+			ret = sbi_remote_fence_i(cpumask_bits(&hm));
> 		else if (cp->a7 == SBI_EXT_0_1_REMOTE_SFENCE_VMA)
>-			sbi_remote_hfence_vvma(cpumask_bits(&hm),
>+			ret = sbi_remote_hfence_vvma(cpumask_bits(&hm),
> 						cp->a1, cp->a2);
> 		else
>-			sbi_remote_hfence_vvma_asid(cpumask_bits(&hm),
>+			ret = sbi_remote_hfence_vvma_asid(cpumask_bits(&hm),
> 						cp->a1, cp->a2, cp->a3);
> 		break;
> 	default:
>+		ret = -EINVAL;
>+		break;
>+	}
>+
>+	return ret;
>+}
>+
>+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
>+	.extid_start = SBI_EXT_0_1_SET_TIMER,
>+	.extid_end = SBI_EXT_0_1_SHUTDOWN,
>+	.handler = kvm_sbi_ext_v01_handler,
>+};
>+
>+static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
>+	&vcpu_sbi_ext_v01,
>+};
>+
>+const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid)
>+{
>+	int i = 0;
>+
>+	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
>+		if (sbi_ext[i]->extid_start <= extid &&
>+		    sbi_ext[i]->extid_end >= extid)
>+			return sbi_ext[i];
>+	}
>+
>+	return NULL;
>+}
>+
>+int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
>+{
>+	int ret = 1;
>+	bool next_sepc = true;
>+	bool userspace_exit = false;
>+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
>+	const struct kvm_vcpu_sbi_extension *sbi_ext;
>+	struct kvm_cpu_trap utrap = { 0 };
>+	unsigned long out_val = 0;
>+	bool ext_is_v01 = false;
>+
>+	if (!cp)
>+		return -EINVAL;
>+
>+	sbi_ext = kvm_vcpu_sbi_find_ext(cp->a7);
>+	if (sbi_ext && sbi_ext->handler) {
>+		if (cp->a7 >= SBI_EXT_0_1_SET_TIMER &&
>+		    cp->a7 <= SBI_EXT_0_1_SHUTDOWN)
>+			ext_is_v01 = true;
>+		ret = sbi_ext->handler(vcpu, run, &out_val, &utrap, &userspace_exit);
>+	} else {
> 		/* Return error for unsupported SBI calls */
> 		cp->a0 = SBI_ERR_NOT_SUPPORTED;
>-		break;
>+		goto ecall_done;
> 	}
> 
>+	/* Handle special error cases i.e trap, exit or userspace forward */
>+	if (utrap.scause) {
>+		/* No need to increment sepc or exit ioctl loop */
>+		ret = 1;
>+		utrap.sepc = cp->sepc;
>+		kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
>+		next_sepc = false;
>+		goto ecall_done;
>+	}
>+
>+	/* Exit ioctl loop or Propagate the error code the guest */
>+	if (userspace_exit) {
>+		next_sepc = false;
>+		ret = 0;
>+	} else {
>+		/**
>+		 * SBI extension handler always returns an Linux error code. Convert
>+		 * it to the SBI specific error code that can be propagated the SBI
>+		 * caller.
>+		 */
>+		ret = kvm_linux_err_map_sbi(ret);
>+		cp->a0 = ret;
>+		ret = 1;
>+	}
>+ecall_done:
> 	if (next_sepc)
> 		cp->sepc += 4;
>+	if (!ext_is_v01)
>+		cp->a1 = out_val;
> 
> 	return ret;
> }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
