Return-Path: <SRS0=Gszz=O4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C01C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 03:21:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2044F61019
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 03:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2044F61019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pb9skL90vV2bmYL1ASC2XWHTgFrWUxLmYr3hYE/+vJI=; b=rRWMzGYWw0Blxj
	rWvx23CVBHFda9mnOaTdpfhNqnMs+2IdL0daC2vrPK2KotDw4VDiLzTZ6T8elmZrhb4NPy+fiSzE2
	2YRSXNatgZFxefbxhHugkwloO3MHnv9N/fdcKxckQoKOg1EQoHhudTi9MKir5hVdubnJs3p0l77M3
	Xhl9WfK13gd51CyE1hTWHLT3PI9SGISoaZ5TvmtY6RuL7Ns2OWEDJiDmCZfDFG68oo0BJ7QC3+hyV
	mQpRCJADRkS+s1a9/KpDsWRIjpQeZGu2KDNX2sWa9rkiWiDqTqraS0oxI0bfEvbXJuzSX0q7n7B1U
	9zJdqg+fqSb/yn8ph8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYgRG-001PWY-G9; Fri, 08 Oct 2021 03:20:50 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYgR8-001PSG-8F; Fri, 08 Oct 2021 03:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633663241; x=1665199241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EpLJPbtsFvyJ4JlBOPqbNVw1g1nmngX2jDHxjNeMYq8=;
 b=ccWxnMEMi0CsOtftXUGABF0o3DdFQbDCgUexNWadKG96DkoOaYG1nheE
 m9t85EBNcfywDBAsTob3qoeyXHTYYEodkCqknWrFG1obx1kC4Yi+5T9gB
 9CV4NPlw1SQOoEt1R04oOwznqwKJmVYpoCoJ4XhSr7DWCFhY4aCPGXWUh
 vRXiOP6bLSZuwTTLV94OpBhd/MBr2H+8MEdkuoBPqbib6LhpwX4K9kkHm
 Ht18+ACZA805GCMOLvCBJyHiMELfgj7SWaMUaPx4RHTHsuVV8QQdtjZg8
 pq4Lnbq9C7i1XzLDHBuuQ5FIEi73XryNBojGr3yn7UpKxdRPahsZR03+m A==;
X-IronPort-AV: E=Sophos;i="5.85,356,1624291200"; d="scan'208";a="187014422"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Oct 2021 11:20:39 +0800
IronPort-SDR: Dsf6z1ZPyrjZ+hO4RlO1dC8AjyFLLBD1P5vbLYK31J5bGZEdqtOQU81uUx8MYGZx1oAAm/Z792
 k2GOGvC+Hgff4+Sx+MuGP8JtzYUJJkfVr/8pgeRd/kjzQB3BijYH3vKPp7lO0U95ntiTRr+UDG
 Tf7V++wlNRM0GuITv0slVKCIuva2NzHIa/gd+5KL1mQaUICKCvAwlFnc6MMFn5a98MD7A2vVC5
 211YzFAeA9H/02FdYa8nKB3gTazxh62d33CQt4BpmVH8my5qn9UELsQaitB+Yf7PLKg0gfz+/D
 cRIPHQc7TqoCZXVIBzczAo8n
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 19:55:00 -0700
IronPort-SDR: QLH0vuqzIewwJanN1B8+2WStqn+4r+n6dhdXSHpI3cuFoytp12yeo+/86TaYN75mmCuD/USsgb
 Yao1TxNP1TWX7e5/aZWHNv5OsUwTprnton/b8QsxWi6MegaFwATq6lQJOSIGIHYeYNdrW0tR5l
 PppwYoprtMbinRTyNZftfbxzH16Fqp0oVeQ8GhN8jXg40IsTDeKR0A8dXpXI4jyD8pZWRG0lmR
 Uy/VmDSdZpBCbbZYktaGo4IlpJPU0d8I+7cH40vf+3PQdB3Vf0GRMsy9Iz57HW+p9tgLTArvrp
 Ysg=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.125])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Oct 2021 20:20:41 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anup Patel <anup.patel@wdc.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v3 3/5] RISC-V: Add SBI v0.2 base extension
Date: Thu,  7 Oct 2021 20:20:34 -0700
Message-Id: <20211008032036.2201971-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008032036.2201971-1-atish.patra@wdc.com>
References: <20211008032036.2201971-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_202042_352286_9B607465 
X-CRM114-Status: GOOD (  19.68  )
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

SBI v0.2 base extension defined to allow backward compatibility and
probing of future extensions. This is also the only mandatory SBI
extension that must be implemented by SBI implementors.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  2 +
 arch/riscv/include/asm/sbi.h          |  8 +++
 arch/riscv/kvm/Makefile               |  1 +
 arch/riscv/kvm/vcpu_sbi.c             |  3 +-
 arch/riscv/kvm/vcpu_sbi_base.c        | 73 +++++++++++++++++++++++++++
 5 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_base.c

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 704151969ceb..76e4e17a3e00 100644
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
index 289621da4a2a..20e049857e98 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -28,6 +28,14 @@ enum sbi_ext_id {
 	SBI_EXT_RFENCE = 0x52464E43,
 	SBI_EXT_HSM = 0x48534D,
 	SBI_EXT_SRST = 0x53525354,
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
index 53cbecc44c4c..aaf02efafc0f 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -23,4 +23,5 @@ kvm-y += vcpu_exit.o
 kvm-y += vcpu_switch.o
 kvm-y += vcpu_sbi.o
 kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_legacy.o
+kvm-y += vcpu_sbi_base.o
 kvm-y += vcpu_timer.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index e51de3e4526a..5533ffc25ed0 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -39,9 +39,10 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_legacy = {
 	.handler = NULL,
 };
 #endif
-
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
 static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_legacy,
+	&vcpu_sbi_ext_base,
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
new file mode 100644
index 000000000000..1aeda3e10e7c
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_base.c
@@ -0,0 +1,73 @@
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
+		ret = -EOPNOTSUPP;
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
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
