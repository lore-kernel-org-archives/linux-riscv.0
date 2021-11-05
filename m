Return-Path: <SRS0=deyN=PY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AFABC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 23:59:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68BED6113A
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 23:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68BED6113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5O4i/TnKKtiRXDtbdX6RM/WSnYmFgn91ZAkf6aktqI=; b=lYZj0c9PLmXHcv
	DVh+qfjWz1L9ZWGaJZwZ2KJFLEoonT/dTb9HUYs/w3mODxAPs4kLdrJduAwBUlX3nmcvmVHeKOhSD
	+NEGkMA96x+M/1ZvoUbxiyP8d/R8QTcMJo4+UY0RIre/OzUJlcvYbn3WEVUIBfbe4MII2bL0ZQ6NO
	dwKgFEBRltTh411Gev9x/m+t7fKUosVHYvNLLP7ATlJjmhKgLXauHPHru0jU9g65jggIsuTxhILfe
	Ekx/8UL7MO+tRMxi7IlRNUYTfBMPYuQP5ev/H3oHMqOFflHb6WMyCEEQDZ7WnNLsYASRtDVfrMEuT
	efZ0kTxeRMHL2pLGjyJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj972-00CSvP-Ah; Fri, 05 Nov 2021 23:59:12 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj96w-00CSpx-Q3; Fri, 05 Nov 2021 23:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1636156746; x=1667692746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Er5RxKJadD7bsDIJOhUGnJYsnW6DU5RB+Akt9hHrrm4=;
 b=A+x2x4wGpKaTSo07E8syzHxgJyMjgLw2jC3RaLCBCVAODyNXEZCZ+PcX
 i1PmR5MmpgOK6X+BUQvucsH2zsB3egFnKWlId/p4gyvLLhMuia1RkrjaB
 FiTyc8IoU44kIu7pXkK7x6goDCakSHprJXt2L9vTEPsB7PMS95j83oAAX
 cCCrAk7vx1QsVBkdDIy/Na/HaRPX99chEaPutZ7bUeWgpTNJfQddWXJT/
 28E1yI7l3S0Ga5bm9bFHFCARh2Bgz0kVoyCFttmpklmEuuw4mGx3O3NnX
 eKlY3irUPo25mSfeb1fxEXWbZXFu0w2YnLg0WahDs2KQ9p9kgobcJSr0k g==;
X-IronPort-AV: E=Sophos;i="5.87,212,1631548800"; d="scan'208";a="183840506"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Nov 2021 07:59:03 +0800
IronPort-SDR: ztvny1jjg+CoYuA9Hkd6ucOK7szZWLInNTv9059d1mJZseJt5EIDSRGx99u7DfVuCz86vuJCi3
 KE0EQGl38xEefVgJUk6zyZg814Z798xdFw9EqnaPI/i5VDuobeem2RxpF26ATV2F+E0Fegs370
 iy3PbGREL7xR2pBB2eo2S4yN82HMR/7i5aPqJ7kxnQiXUNyrxF04C0NqChmhMGz0CUkJFPBJYK
 P6geJVY79Cs8ZEf1mSZvZxWtuCFNhFRBt0ScERDw9Y7QS+LmHkYSPMlrtZLLBkGZgpFKBHonk0
 OajiAknAxALQyhXP53AjfZGQ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 16:32:47 -0700
IronPort-SDR: 2pByQIwvnZxVNsg3qiQi15VIOnwm8U/03nFqck+hOmTJ9V+2z65HGPmvXtzj/luzCU8xUEV9n2
 1rqeyVA+EfMFml9NNbMZgdTUiF96e1moODcXiQoRYvrfvmn/BRgvxh3GfefpamOyXCNHSU2Ypa
 xcj6+m0eocZpH7P2vQOQ5ETKhMiZ2MsDANAPsUkxqS5ANCTmvvPL5iqG1xwkjZdhuiqb/2O/kE
 kvIVHut1u2mzqLcNcjBjrlux8FtxBzrr/5Lx6CYvW07Aa640rNJ6X/eww0eZbygd7rGTEnik/7
 Jho=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.48])
 by uls-op-cesaip02.wdc.com with ESMTP; 05 Nov 2021 16:59:03 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>, pbonzini@redhat.com,
 Sean Christopherson <seanjc@google.com>
Subject: [PATCH v4 3/5] RISC-V: KVM: Add SBI v0.2 base extension
Date: Fri,  5 Nov 2021 16:58:50 -0700
Message-Id: <20211105235852.3011900-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105235852.3011900-1-atish.patra@wdc.com>
References: <20211105235852.3011900-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_165906_942473_B4EA82AD 
X-CRM114-Status: GOOD (  19.41  )
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
index 0d42693cb65e..4f9370b6032e 100644
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
index d3d5ff3a6019..84c02922a329 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -24,4 +24,5 @@ kvm-y += vcpu_fp.o
 kvm-y += vcpu_switch.o
 kvm-y += vcpu_sbi.o
 kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
+kvm-y += vcpu_sbi_base.o
 kvm-y += vcpu_timer.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 06b42f6977e1..92b682f4f29e 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -39,9 +39,10 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
 	.handler = NULL,
 };
 #endif
-
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
 static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_v01,
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
