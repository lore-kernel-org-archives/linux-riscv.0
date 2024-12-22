Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4633E7718E
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Dec 2024 03:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zPLINV6F8vfiLhYiwXx7ChF1Cd0HRh3SEfSurIzZjJs=; b=ghzZpqYFIGLQ5i
	ktj3lK+GVZSEL93RoxWN/h+zRc6neHPklOuYjvY2VQU/uU4NmxkOfkD+e29y7NFevxbFBd0IoRomf
	Zhq7Hfc1FgRMW/bQvm2T80BG5tvTMnnQGDWKsZ4o/6MeFiNPU2zexbQ1Vn2Ro391uRKy5sixRV9CS
	LK+3SrFAt7jwMvAc29ouAjBLTrchWerP9nWt/rVY8VbDz+X4B6FmLFMQkQKBF2aNWa5xrChRdE/QR
	l2lFF6HEvpxbQM6NnK5UIHeJL9U6mILDaJx11e9sA86It+QIfXnrTspb2H01Cw5ybO4FxASaKaSI/
	F5kI2u9Z8SDhadJkZInQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPCoh-00000007kc4-36yr;
	Sun, 22 Dec 2024 03:39:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPCof-00000007kaq-0WA8
	for linux-riscv@lists.infradead.org;
	Sun, 22 Dec 2024 03:39:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C56535C05D1;
	Sun, 22 Dec 2024 03:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0358EC4CEDC;
	Sun, 22 Dec 2024 03:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734838779;
	bh=YsSsykQI/zCGdnp6v4qHrZEgmyzMR46UoPncJ5gBPxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GMlQpZ7G5ls4ZBAdP+bfzbyP0YpqcBvB4tt0LPku8yKqNMLkKo0EBu2S9yiNbGO7U
	 A2u/fuCSu/ykVw5U5fNYge5g68uiGla5OPFTMPCWI1PK2m/ngaxN1HwuMai7FhpJTy
	 C6+NpQN+Y00DH/cjUUT2bkpYi2WBvxtcjVmd+5nm39ZeQ3MMpd6AGBOLbmuafScBgY
	 bcZQKgqm2AKtAWNCbc/4Pu5oktQogxMBWHNJtM++bH8RDhWiUSvjC+WXT743sbWE3n
	 /ntDtOdjRzihpcJfjda8j48ZPEOXV1htfPcIynmLT3CJYJgc8s+iC+ehPhvKO7l25D
	 6sBHkunFEFc2A==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	bjorn@rivosinc.com,
	conor@kernel.org,
	leobras@redhat.com,
	peterz@infradead.org,
	parri.andrea@gmail.com,
	will@kernel.org,
	longman@redhat.com,
	boqun.feng@gmail.com,
	arnd@arndb.de,
	alexghiti@rivosinc.com,
	ajones@ventanamicro.com,
	rkrcmar@ventanamicro.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 1/3] RISC-V: paravirt: Add pvqspinlock KVM backend
Date: Sat, 21 Dec 2024 22:39:15 -0500
Message-Id: <20241222033917.1754495-2-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241222033917.1754495-1-guoren@kernel.org>
References: <20241222033917.1754495-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_193941_267622_F10B7990 
X-CRM114-Status: GOOD (  15.68  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Add the files functions needed to support the SBI PVLOCK (paravirt
qspinlock kick_cpu) extension. Implement kvm_sbi_ext_pvlock_kick_-
cpu(), and we only need to call the kvm_vcpu_kick() and bring
target_vcpu from the halt state.

Reviewed-by: Leonardo Bras <leobras@redhat.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
 arch/riscv/include/asm/sbi.h          |  5 +++
 arch/riscv/include/uapi/asm/kvm.h     |  1 +
 arch/riscv/kvm/Makefile               |  1 +
 arch/riscv/kvm/vcpu_sbi.c             |  4 ++
 arch/riscv/kvm/vcpu_sbi_pvlock.c      | 57 +++++++++++++++++++++++++++
 6 files changed, 69 insertions(+)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_pvlock.c

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index b96705258cf9..bc37131938ad 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -88,6 +88,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pvlock;
 
 #ifdef CONFIG_RISCV_PMU_SBI
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 6c82318065cf..6b2adda2b064 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -35,6 +35,7 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
+	SBI_EXT_PVLOCK = 0xAB0401,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -401,6 +402,10 @@ enum sbi_ext_nacl_feature {
 #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
 #define SBI_NACL_SHMEM_SRET_X_LAST		31
 
+enum sbi_ext_pvlock_fid {
+	SBI_EXT_PVLOCK_KICK_CPU = 0,
+};
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 3482c9a73d1b..4590570a8fc3 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -198,6 +198,7 @@ enum KVM_RISCV_SBI_EXT_ID {
 	KVM_RISCV_SBI_EXT_VENDOR,
 	KVM_RISCV_SBI_EXT_DBCN,
 	KVM_RISCV_SBI_EXT_STA,
+	KVM_RISCV_SBI_EXT_PVLOCK,
 	KVM_RISCV_SBI_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 0fb1840c3e0a..4e1a82a7eeab 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -32,6 +32,7 @@ kvm-y += vcpu_sbi_replace.o
 kvm-y += vcpu_sbi_sta.o
 kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
 kvm-y += vcpu_switch.o
+kvm-y += vcpu_sbi_pvlock.o
 kvm-y += vcpu_timer.o
 kvm-y += vcpu_vector.o
 kvm-y += vm.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 6e704ed86a83..c770bef51a2f 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -82,6 +82,10 @@ static const struct kvm_riscv_sbi_extension_entry sbi_ext[] = {
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
index 000000000000..55d889ddc2cd
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_pvlock.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c), 2024 Alibaba Cloud
+ *
+ * Authors:
+ *     Guo Ren <guoren@linux.alibaba.com>
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
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
