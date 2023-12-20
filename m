Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DDDC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 16:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ABSdupdRTM7Wj1uwS3m248fyPJQy/swdcBFX3sjbeiA=; b=Ro8DjbT40sz8YX
	CociqwWddQGOi6S4ZQRKhLcWG6bsD9lPHy0n/D0/TdVrFD04RWz79NDS9aUzGOIp9DasTQ4R9BZUU
	lkzaE59maEOyBE3khcDNjvu5pIy+fv1KLDmOs1TMahCBcPOBpEVZzNDDXAVLj/shZxn0DVF6VnEJK
	QRJHOrafTWfby7ombc5DXDdBH67sYwVjv1j4zojLy9wy+IsQsSBqH1yNhBrmGpieq97BtRGg/1HZy
	mr2NS2bjerT+ZCghlPKmKWT+oR0O4iXciY3gaH2bC5ZGs0TdW1hN2RxEUnj1UVpoZriB5f8fNSm5T
	sWDbEnDL7Xp/GiTfK6vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFz05-000ME4-30;
	Wed, 20 Dec 2023 16:00:49 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyzp-000Lsm-1Q
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 16:00:36 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-33666946422so3076952f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 08:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703088028; x=1703692828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ef7BOv98cAGOovGfjdBZq243xgaKf+nknpOtiiGkzlE=;
        b=LQ3hmuWy0700PmPAqI3E/mv7gevGLrKS2QnZ6yPhwpuWrz+T5UbopuW5kIrCvXact9
         L+uULQgKY6/bpdDhj760bO0eB7Om+qpYCMuOxdAiSlAY7kLZTBXRKbKv1AGQhM8M5NZj
         aoJ7kwau1Zir48iGNTnvQbfrHpOOmYrC/WHYbGaWku0NNsmeXy3Z2kn/zGmEpHkgEf5i
         7MELyo3Ga3Masbs0MwRH95zn7E7VBh72vxW+0SPDTP9K42aMpQlBz+XYALcRa6XBXdMH
         JG7doSPyPXAPJoswVtrZQbWGawPuOsztT7dXl7O1EAA0GcIRhRInXcIYUmqpY3Hn6HVM
         mIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703088028; x=1703692828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ef7BOv98cAGOovGfjdBZq243xgaKf+nknpOtiiGkzlE=;
        b=SBqnEnTzZgW9C2ztMLs8fkLR42XvTWyPu48MJL98AFYdj75scCaH3b6lZOMiwBRr/l
         GRT3ZPzpEd3ZVaye6nnwsf1XBvZGwlUACTFwsROyS9xrjPWj7EI7KZxftBAmv8i3ufdL
         mr3OwbHgOC3AgkkeZ4s+9C5OqGeM3OXsm6lRiGgcXMML2SrtJpNGUD5aIxnJoP37RUja
         3GrffOJ3aH/Pq7Zs0mpiWlA4bKA8gP4NKCymvt00oZppwRHRjqGwyxKa5x7zryTIUTwP
         LTqt/IEzJ3SixZYrzU8A3ze0xloNJtOH/EOhQ579VcYj68HpmS/7xuZlqW69TmoGIseB
         +AWQ==
X-Gm-Message-State: AOJu0YyZrMt6fnFeXiTEpE7Fthlm6wfDhnnbGMELe1v/oeM8AdHpXdvN
	kcsz4GvjvsuXoBpDnySa5Pf9HQ==
X-Google-Smtp-Source: AGHT+IEUaGQVUmOJpZrX/6wcMiUkr7MlMCgJwXmlqp3SKkS+7blylWY6WOfvZFXTaKATAxCW7rwCPQ==
X-Received: by 2002:adf:f68c:0:b0:336:64cd:3fc3 with SMTP id v12-20020adff68c000000b0033664cd3fc3mr3328065wrp.59.1703088027960;
        Wed, 20 Dec 2023 08:00:27 -0800 (PST)
Received: from localhost (cst-prg-16-115.cust.vodafone.cz. [46.135.16.115])
        by smtp.gmail.com with ESMTPSA id d5-20020a5d5385000000b0033662cf5e51sm10303884wrv.93.2023.12.20.08.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 08:00:27 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org,
	conor.dooley@microchip.com,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 04/13] RISC-V: KVM: Add SBI STA extension skeleton
Date: Wed, 20 Dec 2023 17:00:17 +0100
Message-ID: <20231220160012.40184-19-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220160012.40184-15-ajones@ventanamicro.com>
References: <20231220160012.40184-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_080033_519883_4A99EF9F 
X-CRM114-Status: GOOD (  15.53  )
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

Add the files and functions needed to support the SBI STA
(steal-time accounting) extension. In the next patches we'll
complete the functions to fully enable SBI STA support.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
 arch/riscv/include/uapi/asm/kvm.h     |  1 +
 arch/riscv/kvm/Makefile               |  1 +
 arch/riscv/kvm/vcpu_sbi.c             |  4 +++
 arch/riscv/kvm/vcpu_sbi_sta.c         | 47 +++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_sta.c

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index bffda0ac59b6..99c23bb37a37 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -76,6 +76,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
 
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 60d3b21dead7..e961d79622fb 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -157,6 +157,7 @@ enum KVM_RISCV_SBI_EXT_ID {
 	KVM_RISCV_SBI_EXT_EXPERIMENTAL,
 	KVM_RISCV_SBI_EXT_VENDOR,
 	KVM_RISCV_SBI_EXT_DBCN,
+	KVM_RISCV_SBI_EXT_STA,
 	KVM_RISCV_SBI_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 4c2067fc59fc..c9646521f113 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -26,6 +26,7 @@ kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
 kvm-y += vcpu_sbi_base.o
 kvm-y += vcpu_sbi_replace.o
 kvm-y += vcpu_sbi_hsm.o
+kvm-y += vcpu_sbi_sta.o
 kvm-y += vcpu_timer.o
 kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o vcpu_sbi_pmu.o
 kvm-y += aia.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index dcdff4458190..088daaa23dd8 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -70,6 +70,10 @@ static const struct kvm_riscv_sbi_extension_entry sbi_ext[] = {
 		.ext_idx = KVM_RISCV_SBI_EXT_DBCN,
 		.ext_ptr = &vcpu_sbi_ext_dbcn,
 	},
+	{
+		.ext_idx = KVM_RISCV_SBI_EXT_STA,
+		.ext_ptr = &vcpu_sbi_ext_sta,
+	},
 	{
 		.ext_idx = KVM_RISCV_SBI_EXT_EXPERIMENTAL,
 		.ext_ptr = &vcpu_sbi_ext_experimental,
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
new file mode 100644
index 000000000000..839911dcd837
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ */
+
+#include <linux/kvm_host.h>
+
+#include <asm/kvm_vcpu_sbi.h>
+#include <asm/sbi.h>
+
+static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
+{
+	return SBI_ERR_FAILURE;
+}
+
+static int kvm_sbi_ext_sta_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				   struct kvm_vcpu_sbi_return *retdata)
+{
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	unsigned long funcid = cp->a6;
+	int ret;
+
+	switch (funcid) {
+	case SBI_EXT_STA_STEAL_TIME_SET_SHMEM:
+		ret = kvm_sbi_sta_steal_time_set_shmem(vcpu);
+		break;
+	default:
+		ret = SBI_ERR_NOT_SUPPORTED;
+		break;
+	}
+
+	retdata->err_val = ret;
+
+	return 0;
+}
+
+static unsigned long kvm_sbi_ext_sta_probe(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta = {
+	.extid_start = SBI_EXT_STA,
+	.extid_end = SBI_EXT_STA,
+	.handler = kvm_sbi_ext_sta_handler,
+	.probe = kvm_sbi_ext_sta_probe,
+};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
