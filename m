Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0CCC982EE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 12:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kmP5xbYGMxAg61SCJe0RdCDhDJpqE2jCWMvTna/tmxI=; b=3BP8v3hDlPRNg+
	5d5cXhBjmcyxB1dk5j+UQifmpAGWjYzm8c1xv9aHC/tdviLosPyYKV2g7i5ubqya5z4CYDRwek7kA
	PqHSFFfmzBkWU//Ln+AyyZm15Y4LVDu7YGhggdpVcknMe6VxQSxxgoZo21f4Oj0il3mc1g14o0IkG
	NUzCk1syFhozEOunVFPpAuAyx7VSIaKrGizdLXwqTyIK0J+hoVucQT52er2rNrusqz5U7Umdd7UGT
	T4RN67UFL/mubCFRXpADdX1H84u+v7l+DvV3AFSYapV58LbhvMZaavJEck92mVjLp01NkuQY/58zk
	MDYMLT5LyLstWWREMseQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8d7M-000000023YU-3iR3;
	Mon, 21 Sep 2026 12:27:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8d7H-000000023Wb-3roH;
	Mon, 21 Sep 2026 12:27:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A04D600D1;
	Mon, 21 Sep 2026 12:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3511F00893;
	Mon, 21 Sep 2026 12:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789993646;
	bh=dFvHrjq0ePXXh5iBLlUENtWHcaZyZBRhrnp1IAHS2tI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Z601kbIa9VSfIfHNKTEpmBalJufxQA/bArlgRDVF37yrMBOBoyWhpgkWJ+Xut1PKi
	 o6gEp2mkBaghr4j1DpATyzKBQp8qZURn6Tk7m/fmazSpf80LqYSkrFxphZ6oomow1I
	 5eWkwReNwMc84goCHDydh0J8BbTrCBIbjqpyREhZpOv5nZiN9qUOqlnqYSHpqd4Sr2
	 hnoXYXL+c4TqRz3nxQofwUHM5o9qn5+6FXmGnQiPUzFMlE8Kv+JqPCvuuYXZApTZ3a
	 ifkNNg8icwnqKOL8v+vqV9bRlwaOFIckKtpCQPVzreuSnB7DiB4SyRneQ4+dlrs4UV
	 1DOwgBQDoZlOQ==
From: "GUO Ren (XuanTie)" <guoren@kernel.org>
Date: Mon, 21 Sep 2026 12:27:01 +0000
Subject: [PATCH RFC v4 1/4] RISC-V: paravirt: Add pvqspinlock KVM backend
MIME-Version: 1.0
Message-Id: <20260921-pvqspinlock-v4-1-409a22aed6ef@kernel.org>
References: <20260921-pvqspinlock-v4-0-409a22aed6ef@kernel.org>
In-Reply-To: <20260921-pvqspinlock-v4-0-409a22aed6ef@kernel.org>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Fangyu Yu <fangyu.yu@linux.alibaba.com>, 
 CHEN Jiankang <yubin.cjk@alibaba-inc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Leonardo Bras <leobras@redhat.com>, 
 "GUO Ren (XuanTie)" <guoren@kernel.org>
X-Mailer: b4 0.16.0
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

Add the KVM backend for the SBI PVLOCK (paravirt qspinlock kick_cpu)
extension. kvm_sbi_ext_pvlock_kick_cpu() kicks the target vCPU out of
the halted state via kvm_vcpu_kick(), and yields to it with
kvm_vcpu_yield_to() when the target is already runnable.

Reviewed-by: Leonardo Bras <leobras@redhat.com>
Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
 arch/riscv/include/asm/sbi.h          |  5 ++++
 arch/riscv/include/uapi/asm/kvm.h     |  1 +
 arch/riscv/kvm/Makefile               |  1 +
 arch/riscv/kvm/vcpu_sbi.c             |  4 +++
 arch/riscv/kvm/vcpu_sbi_pvlock.c      | 54 +++++++++++++++++++++++++++++++++++
 6 files changed, 66 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index f01a2860c751..cdc16e64ad19 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -114,6 +114,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_mpxy;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pvlock;
 
 #ifdef CONFIG_RISCV_PMU_SBI
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 5725e0ca4dda..724ab834ad85 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -38,6 +38,7 @@ enum sbi_ext_id {
 	SBI_EXT_FWFT = 0x46574654,
 	SBI_EXT_MPXY = 0x4D505859,
 	SBI_EXT_DBTR = 0x44425452,
+	SBI_EXT_PVLOCK = 0x50564C4B,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -534,6 +535,10 @@ union sbi_dbtr_shmem_entry {
 	struct sbi_dbtr_id_msg id;
 };
 
+enum sbi_ext_pvlock_fid {
+	SBI_EXT_PVLOCK_KICK_CPU = 0,
+};
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 20d9959ca44f..110a0d62113f 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -228,6 +228,7 @@ enum KVM_RISCV_SBI_EXT_ID {
 	KVM_RISCV_SBI_EXT_SUSP,
 	KVM_RISCV_SBI_EXT_FWFT,
 	KVM_RISCV_SBI_EXT_MPXY,
+	KVM_RISCV_SBI_EXT_PVLOCK,
 	KVM_RISCV_SBI_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 296c2ba05089..404a4c5f8984 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -38,6 +38,7 @@ kvm-y += vcpu_sbi_sta.o
 kvm-y += vcpu_sbi_system.o
 kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
 kvm-y += vcpu_switch.o
+kvm-y += vcpu_sbi_pvlock.o
 kvm-y += vcpu_timer.o
 kvm-y += vcpu_vector.o
 kvm-y += vm.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 1c4f874368fb..07f72e619fd5 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -94,6 +94,10 @@ static const struct kvm_riscv_sbi_extension_entry sbi_ext[] = {
 		.ext_idx = KVM_RISCV_SBI_EXT_VENDOR,
 		.ext_ptr = &vcpu_sbi_ext_vendor,
 	},
+	{
+		.ext_idx = KVM_RISCV_SBI_EXT_PVLOCK,
+		.ext_ptr = &vcpu_sbi_ext_pvlock,
+	},
 };
 
 static const struct kvm_riscv_sbi_extension_entry *
diff --git a/arch/riscv/kvm/vcpu_sbi_pvlock.c b/arch/riscv/kvm/vcpu_sbi_pvlock.c
new file mode 100644
index 000000000000..728e59f3f18f
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_pvlock.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 GUO Ren (XuanTie) <guoren@kernel.org>
+ */
+
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/kvm_host.h>
+#include <asm/sbi.h>
+#include <asm/kvm_vcpu_sbi.h>
+
+static int kvm_sbi_ext_pvlock_kick_cpu(struct kvm_vcpu *vcpu)
+{
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_vcpu *target;
+
+	target = kvm_get_vcpu_by_id(kvm, cp->a0);
+	if (!target)
+		return SBI_ERR_INVALID_PARAM;
+
+	kvm_vcpu_kick(target);
+
+	if (READ_ONCE(target->ready))
+		kvm_vcpu_yield_to(target);
+
+	return SBI_SUCCESS;
+}
+
+static int kvm_sbi_ext_pvlock_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				      struct kvm_vcpu_sbi_return *retdata)
+{
+	int ret = 0;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	unsigned long funcid = cp->a6;
+
+	switch (funcid) {
+	case SBI_EXT_PVLOCK_KICK_CPU:
+		ret = kvm_sbi_ext_pvlock_kick_cpu(vcpu);
+		break;
+	default:
+		ret = SBI_ERR_NOT_SUPPORTED;
+	}
+
+	retdata->err_val = ret;
+
+	return 0;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pvlock = {
+	.extid_start = SBI_EXT_PVLOCK,
+	.extid_end = SBI_EXT_PVLOCK,
+	.handler = kvm_sbi_ext_pvlock_handler,
+};

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
