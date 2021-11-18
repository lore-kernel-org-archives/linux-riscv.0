Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B68FC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 08:40:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0096961B30
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 08:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0096961B30
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ojoTkG/z7QBypIqQL5UmTUvMP0Wg831t1jURaN9F+CI=; b=AmI5DDWTG21c93
	AjeZH4Rtzr9iPzUS6+MqjPNR+SXGrqW1bTE7IfRU5Kfkwb69KWzchsETdDFBqQ8JjQmALsnJKcHI2
	sbb3k4VeZIAo/SchHNOWfZJr5T9izMWbi++90NNDBFhP2JBtZ9M/lj8vneh/2O55NJqe1Wp4GSpxM
	z4z4HAMRp1VQbtY7o+/YxNMm7Sga4NVOPcjv9IHSJHpsVZ9GK5Of18rjV5CKFXZ0KBYGavoH1D6fj
	XLYuaIKL2zb2oqh+kxZaGRxKff+Z+ooGwxMGuKUXrZmneC66eALFl9G0H57v5Cr0pYECSUEzm8R/Y
	EiEzet9/eRNsgELR9cAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mncxt-007Doe-EE; Thu, 18 Nov 2021 08:40:17 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mncxm-007Dkd-BZ
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 08:40:13 +0000
Received: by mail-oi1-x231.google.com with SMTP id 7so12631898oip.12
 for <linux-riscv@lists.infradead.org>; Thu, 18 Nov 2021 00:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8twek1m7P+ROuB6btdTSUlQBALtlClpcdzGEr3mbhL8=;
 b=WrtVbrdnt02rMvZGmlVFPcMbxQNK4f1VjFNkFogslynwRFcBY0ExkiZ2lMLUdSf18v
 Ml5Z4qD0OYrl/5CG2JzY60WV10khQUVIcTaJDONI67SxutmVkNQ+2NYasy9CV2MXbRFe
 QqdzW6B5K3DC5AKucFM/XAKqAZAXCnlOewk69iiLsCScanqTlwtn8XGPLrd123zamRIW
 UYf8+A3rKJ/QJW7W7sXOjfhlbyCTNAvgidcelPPG/HkS1MvsLT5VmYtyQ+C32IRIs6lO
 K2AqY/0U3UenxJ+sAdUMRR8bXAN6+mVBrFCIfBZYfAB8fg9P//zUB9dXeA+aKE7AiaUO
 YjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8twek1m7P+ROuB6btdTSUlQBALtlClpcdzGEr3mbhL8=;
 b=ny/dZd6BFHWNX7TvHb0B8F0SHOD6rAuanh5XFz8PY+Dedw9ZUIKDH2rxYXmR0c0Qit
 JD3V16y+38yQhJdtRIbDHuWu/Xsr0W54Hm+RucQGBfPngRL4D/Cc3w312W8FiC2eEwb4
 yXZXhU51HCRIFjznE3TSSZNCodZAU1o8KTcSGPeoxHQRH15nPihKVy4oGcLt2TTLQdsW
 w1rvw64MwZRuXPkM0SeT6/dAPGWu0NB4oxi7p0ryVFYcR7gXl884jZyu6tRO2LDnPhbp
 Zizd8j3CmFg6AbSjc6YwOV/BIXYSy6N2IwAp7k3FzjvQ+usywu8pRntYOUfur2qF0+T/
 0FUQ==
X-Gm-Message-State: AOAM532jc0LQrhofWnx3maKPqHlYo++sLiN5NcXnqirHOQezqsKTW1CQ
 LUbTYZQ+5XxDQkr2lYQ2D6tFWA==
X-Google-Smtp-Source: ABdhPJzvGkxeiXZPYUKJP/EnO7suj028rbKoZHxh7H2wJ2ZOQjuAUhvigQASWsea2fXnVmUMH/ZUhg==
X-Received: by 2002:a05:6808:7db:: with SMTP id
 f27mr6107749oij.83.1637224809041; 
 Thu, 18 Nov 2021 00:40:09 -0800 (PST)
Received: from fedora.. (99-13-229-45.lightspeed.snjsca.sbcglobal.net.
 [99.13.229.45])
 by smtp.gmail.com with ESMTPSA id p14sm422100oov.0.2021.11.18.00.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 00:40:08 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v5 3/5] RISC-V: KVM: Add SBI v0.2 base extension
Date: Thu, 18 Nov 2021 00:39:10 -0800
Message-Id: <20211118083912.981995-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211118083912.981995-1-atishp@rivosinc.com>
References: <20211118083912.981995-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_004010_455229_2C97FB4E 
X-CRM114-Status: GOOD (  18.64  )
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

SBI v0.2 base extension defined to allow backward compatibility and
probing of future extensions. This is also the only mandatory SBI
extension that must be implemented by SBI implementors.

Reviewed-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  2 +
 arch/riscv/include/asm/sbi.h          |  8 +++
 arch/riscv/kvm/Makefile               |  1 +
 arch/riscv/kvm/vcpu_sbi.c             |  3 +-
 arch/riscv/kvm/vcpu_sbi_base.c        | 70 +++++++++++++++++++++++++++
 5 files changed, 83 insertions(+), 1 deletion(-)
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
index a8e0191cd9fc..915a044a0b4f 100644
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
index 000000000000..641015549d12
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_base.c
@@ -0,0 +1,70 @@
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
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
