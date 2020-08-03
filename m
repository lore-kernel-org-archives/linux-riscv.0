Return-Path: <SRS0=FXTp=BN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18094C433E4
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2020 17:59:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AC6E22B45
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2020 17:59:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Clma2CkY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="EeYgyzrg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AC6E22B45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TzZvWDIAPdj9gav1mge0YKi6E5BBLMe99uJsp7bWs7A=; b=Clma2CkYY0rQXYyXjhSB4dvbC
	E7FKBYMZmKJFUgjbZGIKGZSPZMEcgkMxjx1qFn5XYXkIJ+CZCOFTVrd0xfp7X9kZn1T45N8shx369
	tMN+C0NG5ffk/0cpKPH0LZ08QXDYHu8HPQqwgD3a4fS8cAY88Buweo9l8TwMHr8518HoJ8Au+n0AK
	b00X8yQ6rSpt71m9qVX8++7zc0bpeux6iz6GmuXwPkeeXCAgALoPQPbqTrC9O8yMjcyQ7pyiBC71I
	iU2CG/bJyznmNJn2Cf5mGkgei5A9HPROi4SR9flKu6cIS/4vU85aWP3MH1V0SyfpBGc+PUbhkCoov
	QLp4m+U0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2ek0-000577-7n; Mon, 03 Aug 2020 17:59:16 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2ejr-00051f-Ux; Mon, 03 Aug 2020 17:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1596477548; x=1628013548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qPmtegxxbSB9RTlj4BBlMzdfmESXwNOsCOxFYG1zCtU=;
 b=EeYgyzrgOFGur5mH3vhOfzVbvzlFOBnw7OApZ7BPPxh+E2V9vq3iCIdr
 ZEQpUswBJI1QAAoRaQLvch2QztxizMYoKER0FnwHQwPm3HvyzFoRrpqOk
 a5UbCjELW79V846Jh2XLOgaFyOVOZFzWPXfxTYf7GSgJQhvHqn0xjrHvs
 zauXpbw4GYO0OP0VWEi9fw6H9mlmbCAS5JFyf7jadzENGixTrnNyrOytU
 YvlEXPUskmD2mWbQpWhw+zxVzyINNor+rfqiC/UK8X7UFoUIC1Y66/9Dw
 OAlk4YtQB5ZS7I+KA0Qy+PYgg14E0wF6vZarEmoj3L8XLgujGcAq8QnOs w==;
IronPort-SDR: HD5BKPYM/lPtIe6s6cUhfiol8nAvJAJAB/t6KonJFb07AzJzh+FxCxIA1/ldU6U4kweB0EzwTD
 HOjzCbEzi7esu4dHL0xdojvRL7aW6ULnPjxj52p8t0qRNGVXm/IxiSTf2kUHUiXts6va7Lc3ow
 ColE2KlDPB2F+FGnMoRN/h/35sWPl66sWzPyPn0ziSslez71ZpPNN7pQ7MowCLd86zdZ4VQZb5
 WdaiK/nuejATfCO07U8xu0DyT7GfKiD2IVZRajRgiuF3dsobutBv1vcDz3lFBt1TKiqECFvYRH
 Xik=
X-IronPort-AV: E=Sophos;i="5.75,430,1589212800"; d="scan'208";a="145273250"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Aug 2020 01:59:07 +0800
IronPort-SDR: uRXNJL6UZ6eKh1+GCGJcrXlFy5J+6i69HKy4D8FVadqPwMiD2kHUWkFl3OI0fcAA2Hu8WBz1yp
 hmz70s81l3NQ==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 10:46:28 -0700
IronPort-SDR: UhN4Hz3RhIS2TGFKWzyLUGEL5Rl/ZPk/mOR0AYzlA2gP8UjJrOWPq+7kvyHh2CZEt0zFX4mrMY
 0V9dAC21SUMA==
WDCIronportException: Internal
Received: from cnf007830.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.196])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Aug 2020 10:59:05 -0700
From: Atish Patra <atish.patra@wdc.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 4/6] RISC-V: Add SBI v0.2 base extension
Date: Mon,  3 Aug 2020 10:58:44 -0700
Message-Id: <20200803175846.26272-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200803175846.26272-1-atish.patra@wdc.com>
References: <20200803175846.26272-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_135908_195425_642D54B8 
X-CRM114-Status: GOOD (  21.67  )
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

SBI v0.2 base extension defined to allow backward compatibility and
probing of future extensions. This is also the only mandatory SBI
extension that must be implemented by SBI implementors.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  2 +
 arch/riscv/include/asm/sbi.h          |  8 +++
 arch/riscv/kvm/Makefile               |  4 +-
 arch/riscv/kvm/vcpu_sbi.c             |  3 ++
 arch/riscv/kvm/vcpu_sbi_base.c        | 73 +++++++++++++++++++++++++++
 5 files changed, 88 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_base.c

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 743c71f0c331..e208c8ac57fe 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -9,6 +9,8 @@
 #ifndef __RISCV_KVM_VCPU_SBI_H__
 #define __RISCV_KVM_VCPU_SBI_H__
 
+#define KVM_SBI_IMPID 3
+
 #define KVM_SBI_VERSION_MAJOR 0
 #define KVM_SBI_VERSION_MINOR 2
 
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 2355515785eb..7d8f2b389253 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -27,6 +27,14 @@ enum sbi_ext_id {
 	SBI_EXT_IPI = 0x735049,
 	SBI_EXT_RFENCE = 0x52464E43,
 	SBI_EXT_HSM = 0x48534D,
+
+	/* Experimentals extensions must lie within this range */
+	SBI_EXT_EXPERIMENTAL_START = 0x0800000,
+	SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
+
+	/* Vendor extensions must lie within this range */
+	SBI_EXT_VENDOR_START = 0x09000000,
+	SBI_EXT_VENDOR_END = 0x09FFFFFF,
 };
 
 enum sbi_ext_base_fid {
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 8efb78faab5a..a95c91ba9a51 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -9,6 +9,6 @@ ccflags-y := -Ivirt/kvm -Iarch/riscv/kvm
 kvm-objs := $(common-objs-y)
 
 kvm-objs += main.o vm.o vmid.o tlb.o mmu.o
-kvm-objs += vcpu.o vcpu_exit.o vcpu_switch.o vcpu_timer.o vcpu_sbi.o vcpu_sbi_legacy.o
-
+kvm-objs += vcpu.o vcpu_exit.o vcpu_switch.o vcpu_timer.o
+kvm-objs += vcpu_sbi.o vcpu_sbi_base.o vcpu_sbi_legacy.o
 obj-$(CONFIG_KVM)	+= kvm.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 85bb7491c0e0..bb50d63f78e7 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -31,8 +31,11 @@ static int kvm_linux_err_map_sbi(int err)
 }
 
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_legacy;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
+
 static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_legacy,
+	&vcpu_sbi_ext_base,
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
new file mode 100644
index 000000000000..025d0eae50b0
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_base.c
@@ -0,0 +1,73 @@
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
+static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				    unsigned long *out_val,
+				    struct kvm_cpu_trap *trap, bool *exit)
+{
+	int ret = 0;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	struct sbiret ecall_ret;
+
+	if (!cp)
+		return -EINVAL;
+
+	switch (cp->a6) {
+	case SBI_EXT_BASE_GET_SPEC_VERSION:
+		*out_val = (KVM_SBI_VERSION_MAJOR <<
+			    SBI_SPEC_VERSION_MAJOR_SHIFT) |
+			    KVM_SBI_VERSION_MINOR;
+		break;
+	case SBI_EXT_BASE_GET_IMP_ID:
+		*out_val = KVM_SBI_IMPID;
+		break;
+	case SBI_EXT_BASE_GET_IMP_VERSION:
+		*out_val = 0;
+		break;
+	case SBI_EXT_BASE_PROBE_EXT:
+		*out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
+		if ((!*out_val) &&
+		    ((cp->a0 >= SBI_EXT_EXPERIMENTAL_START &&
+		     cp->a0 <= SBI_EXT_EXPERIMENTAL_END) ||
+		    ((cp->a0 >= SBI_EXT_VENDOR_START &&
+		     cp->a0 <= SBI_EXT_VENDOR_END)))) {
+		/* For experimental/vendor extensions forward to the userspace*/
+			kvm_riscv_vcpu_sbi_forward(vcpu, run);
+			*exit = true;
+		}
+		break;
+	case SBI_EXT_BASE_GET_MVENDORID:
+	case SBI_EXT_BASE_GET_MARCHID:
+	case SBI_EXT_BASE_GET_MIMPID:
+		ecall_ret = sbi_ecall(SBI_EXT_BASE, cp->a6, 0, 0, 0, 0, 0, 0);
+		if (!ecall_ret.error)
+			*out_val = ecall_ret.value;
+		/*TODO: We are unnecessarily converting the error twice */
+		ret = sbi_err_map_linux_errno(ecall_ret.error);
+		break;
+	default:
+		ret = -ENOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base = {
+	.extid_start = SBI_EXT_BASE,
+	.extid_end = SBI_EXT_BASE,
+	.handler = kvm_sbi_ext_base_handler,
+};
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
