Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AB9D2F7FA
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 07:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bN05fNeLXtbhE9pi+wYY8WpdSncqNGGgYvc19itEwnU=; b=cZ0bya87ggnPls
	btnBeOyLlPrZaKo9mU4GJaZYiOX5JoOeedOcBgqaTH6J0ZsJ3JTNgdFXVwASbwJy84qdidmYLqMas
	VSavjlpeDFmTu9VyEKfLSB5jzvI6GP3RbN68c82m0W6a6RPmOQ1JvmRz5ceXzbxDqwP/Gj9QUG06c
	shIjWIxQiJDJOAtaWd/sHbO+MCSJsey9PNtLa7ZwRzIu5AHmy/x3ddxyydQMtyLiKihRhoLsm2JDB
	PnezOVEyF2nzKrXANVDcZO491anhUzf6OkmW7zh0CQihItBf4f+osWLnGdfG0MYrSYfc3eesOncjb
	NmnDVhBVyxOieMtfYvTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1LCp-0000000E1bV-3gXU;
	Thu, 17 Oct 2024 07:45:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1LCZ-0000000E1XM-3NU4
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 07:45:50 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43055b43604so7023755e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 00:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1729151142; x=1729755942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woTML/5ZDHyGQ0YYvz/X6kZNXhvtBfBNJgckT1nJb9k=;
        b=m6K9lgYuHfkMjRN0V+SKw2tT3peOe48AhI6ff8sYZ5nqu8OVFfyN5Sbf8G6iYt1wRy
         q28CosH5F3P6lF3P9omiE5ea42+V29SPZIZaylUPGicUtTrAOtpvJ4xIYf5JCq/DQ/2K
         rRlpaebRpweStNsAmIVczu7hRrC+0x9wxU3+u6i30UOD2s1dsTR5rtbtwW7aw7K6OC0D
         HOCTjzv+vJTtrq0F2x8+VpoZO6chrdKAqG1q/legS+vb9lAeYsT5jtkZO14smky1QOOU
         BoUOR7ou3dHfIYYAUKFDM+KRFlnjSYAT4tessc8wShIbN38ARGpgJeet3Ca03jl7nFAz
         WH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729151142; x=1729755942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woTML/5ZDHyGQ0YYvz/X6kZNXhvtBfBNJgckT1nJb9k=;
        b=nGAID/UcYsm3h/HgT6TIUvAGp4P1A4Pv7owyKNGAVE2VAsuWGToBLx5qcD8KedtCnE
         WrZs017+L7MP8GIRp99lcO4Pi/c6R8yU3NpFuz7BCMFUpiHoBpSZH9i/Hwef8G4gi0mG
         /2TXAD3379rmF2ne1KUG21dLLZDAMOlTlIsgtS9tjGOnxYNiF9RvioLHJWDGR2z8yTa2
         23z1tZJEvOG0yAUyLRnGV9Ryo+6j09WSYF9Tkt0j5DfhpeFApq9hiDXaRqFIiyME7OVQ
         sTL7xYxmGtfjdvQOrnv1H8xuiuo0x9G4+AAKJbi7CuRNHL94IlzUDvLmyAUQiN6OjlPg
         HvPg==
X-Forwarded-Encrypted: i=1; AJvYcCW0Z+PbKhDTnTX8bfIV0d9qXlvyOaYov1JS/l2qm1MyxtbS9UkM0Ii+h7xlJNfXUJ9tvW9cFVwwBJpO5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ+wXXpooxynEL/wTWAmPbRTvb/xicz/+7s1mV5GHZhWyqJ6B7
	Eag+V9WrEw5n/kZG2wImkwM9XcAMTRJR4s2dwgPfPq/f0iMxUU71W9rbGCLVz90=
X-Google-Smtp-Source: AGHT+IHtmlQpeYDYhk4M8D62cK0Z3JEcnhvtjTCZOs/M5ta2JoDxGpUmCJ7jdo8KIzjjkJJYX//6lQ==
X-Received: by 2002:adf:ce8b:0:b0:37c:ce58:5a1a with SMTP id ffacd0b85a97d-37d86d69849mr4296564f8f.54.1729151141592;
        Thu, 17 Oct 2024 00:45:41 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc11ff7sm6388861f8f.92.2024.10.17.00.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 00:45:41 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [PATCH 1/2] RISC-V: KVM: Add SBI system suspend support
Date: Thu, 17 Oct 2024 09:45:40 +0200
Message-ID: <20241017074538.18867-5-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241017074538.18867-4-ajones@ventanamicro.com>
References: <20241017074538.18867-4-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_004543_875186_651462C1 
X-CRM114-Status: GOOD (  19.01  )
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

Implement a KVM SBI SUSP extension handler. The handler only
validates the system suspend entry criteria and prepares for resuming
in the appropriate state at the resume_addr (as specified by the SBI
spec), but then it forwards the call to the VMM where any system
suspend behavior may be implemented. Since VMM support is needed, KVM
disables the extension by default.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
 arch/riscv/include/uapi/asm/kvm.h     |  1 +
 arch/riscv/kvm/Makefile               |  1 +
 arch/riscv/kvm/vcpu_sbi.c             |  4 ++
 arch/riscv/kvm/vcpu_sbi_system.c      | 73 +++++++++++++++++++++++++++
 5 files changed, 80 insertions(+)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_system.c

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index b96705258cf9..4ed6203cdd30 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -85,6 +85,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_susp;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index e97db3296456..08e04ad8b1ab 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -194,6 +194,7 @@ enum KVM_RISCV_SBI_EXT_ID {
 	KVM_RISCV_SBI_EXT_VENDOR,
 	KVM_RISCV_SBI_EXT_DBCN,
 	KVM_RISCV_SBI_EXT_STA,
+	KVM_RISCV_SBI_EXT_SUSP,
 	KVM_RISCV_SBI_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index c2cacfbc06a0..4bfc6ef0e9ad 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -25,6 +25,7 @@ kvm-y += vcpu_sbi.o
 kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
 kvm-y += vcpu_sbi_base.o
 kvm-y += vcpu_sbi_replace.o
+kvm-y += vcpu_sbi_system.o
 kvm-y += vcpu_sbi_hsm.o
 kvm-y += vcpu_sbi_sta.o
 kvm-y += vcpu_timer.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 7de128be8db9..7d8819640aff 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -70,6 +70,10 @@ static const struct kvm_riscv_sbi_extension_entry sbi_ext[] = {
 		.ext_idx = KVM_RISCV_SBI_EXT_DBCN,
 		.ext_ptr = &vcpu_sbi_ext_dbcn,
 	},
+	{
+		.ext_idx = KVM_RISCV_SBI_EXT_SUSP,
+		.ext_ptr = &vcpu_sbi_ext_susp,
+	},
 	{
 		.ext_idx = KVM_RISCV_SBI_EXT_STA,
 		.ext_ptr = &vcpu_sbi_ext_sta,
diff --git a/arch/riscv/kvm/vcpu_sbi_system.c b/arch/riscv/kvm/vcpu_sbi_system.c
new file mode 100644
index 000000000000..5d55e08791fa
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_system.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ */
+
+#include <linux/kvm_host.h>
+
+#include <asm/kvm_vcpu_sbi.h>
+#include <asm/sbi.h>
+
+static int kvm_sbi_ext_susp_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				    struct kvm_vcpu_sbi_return *retdata)
+{
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	struct kvm_cpu_context *reset_cntx;
+	unsigned long funcid = cp->a6;
+	unsigned long hva, i;
+	struct kvm_vcpu *tmp;
+
+	switch (funcid) {
+	case SBI_EXT_SUSP_SYSTEM_SUSPEND:
+		if (cp->a0 != SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM) {
+			retdata->err_val = SBI_ERR_INVALID_PARAM;
+			return 0;
+		}
+
+		if (!(cp->sstatus & SR_SPP)) {
+			retdata->err_val = SBI_ERR_FAILURE;
+			return 0;
+		}
+
+		hva = kvm_vcpu_gfn_to_hva_prot(vcpu, cp->a1 >> PAGE_SHIFT, NULL);
+		if (kvm_is_error_hva(hva)) {
+			retdata->err_val = SBI_ERR_INVALID_ADDRESS;
+			return 0;
+		}
+
+		kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
+			if (tmp == vcpu)
+				continue;
+			if (!kvm_riscv_vcpu_stopped(tmp)) {
+				retdata->err_val = SBI_ERR_DENIED;
+				return 0;
+			}
+		}
+
+		spin_lock(&vcpu->arch.reset_cntx_lock);
+		reset_cntx = &vcpu->arch.guest_reset_context;
+		reset_cntx->sepc = cp->a1;
+		reset_cntx->a0 = vcpu->vcpu_id;
+		reset_cntx->a1 = cp->a2;
+		spin_unlock(&vcpu->arch.reset_cntx_lock);
+
+		kvm_make_request(KVM_REQ_VCPU_RESET, vcpu);
+
+		/* userspace provides the suspend implementation */
+		kvm_riscv_vcpu_sbi_forward(vcpu, run);
+		retdata->uexit = true;
+		break;
+	default:
+		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
+		break;
+	}
+
+	return 0;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_susp = {
+	.extid_start = SBI_EXT_SUSP,
+	.extid_end = SBI_EXT_SUSP,
+	.default_disabled = true,
+	.handler = kvm_sbi_ext_susp_handler,
+};
-- 
2.46.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
