Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C386FC7EE20
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 11:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wR0Mt/vISn9dYzhMQxzpUdq+1SkoDr4lVMQ+huu44Do=; b=GKBJef4VWan8xO
	iOqs3Zi6tC0CJzOI/unvZVhQtRFIpI9DtQoOaDfaFOwOb3lUiatTh2VUthoHjk2ILcLNAzTwYFQb7
	UkXLae9JQwXGGRJW4qo4L/MPB+tL8wl0rUXfBhKdlvhjc+8B4q8mZ7LU0xDqUz0A82fx9rhwxY/bi
	5YROP6qv8ZAPzB4i63tUxKKgoYE/FrnckLM2+22eiduZQ9krqJVJnPDWII6VaLeH4wXTTFKqpKPfB
	+7i8/Ks4DXD3rzr13oK4JvDovn9leh3rF9ZWAOZmFSaRw1NGh2taf8WHglpcFAMrY5Am27QNp8oHf
	7lOZ7wXm1OFjk/Nng00A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poNIO-00G1L4-1F;
	Mon, 17 Apr 2023 11:45:20 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poMBf-00Fkkb-2Z
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 10:34:25 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-94f7a0818aeso40774866b.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 03:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681727656; x=1684319656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bzysn/SQSBTIe8HkUp2onrDpYlcvZH5IYvWISeLFXt0=;
        b=IO8rASurJIFmLqDNE58hHKGaOViLyJVtx1QEsrRbvQVQ009RcVCdODX0pbYq/GSS91
         mJO6Rg0Pk6tj2zzK7+LdIOqe2/haAqujYrunA/rU23ao3KN162h5GGj6LM8qoQTesDPv
         Ub/7Vwd8o3KloRmQbWzdCpFbyUi+Y8slBKe+JHQi1NXj5bdutKFgO3lMzgswP6UvtIqb
         TEkxIz3fIiDsW3kWjoTzS8GTN8tFmOjnd8od5zClZqGfnNV4zPP50/E4Gi4VscgY+y8P
         +FCg/tw+psseAgprvhTuNfGx9jZubnGVeVTtocoz9siR1/YtjNqEMnlTbq14qRHK4QOY
         B7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681727656; x=1684319656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bzysn/SQSBTIe8HkUp2onrDpYlcvZH5IYvWISeLFXt0=;
        b=TgcFlu1m+xs3dR0ersmxmZejElbQyLlxnLjZ5PeLzUSlt7u1ZgN84fNpiAWpyZ+SH/
         gArUPe0hseJ9mhkg13S7e0EJOrZjNQv0P3B0bnah8Z3IMhUcJ8FLlqV5WcPZQIhABGMJ
         ZJ6BgDt4AjXmCGivijNXApyn6fgjoVnpb170zf3ZMHZ/NvvJIyRGku3/xnZRH+c2bJZd
         LGR5oetI6RkwE6irmGdV0VJF6LptDgiG1niw41zYgV6342sCbJoOB6H0oTHc43k5qN27
         mHhaF5gvd3YePpZVKSQb1aY+ulDmqQ7ulNrEhDkGI1r8GnW9Pg5qY0ms1fAU7BiARIIa
         widA==
X-Gm-Message-State: AAQBX9f6/Z8lu7QqvtZaIS2QLOb8tGjEzulS9lmGUqtWjTxpflxsmuDv
	IvHrA2YR+fDcd7OIgj+5jbY4fQ==
X-Google-Smtp-Source: AKy350ZS2h2chzz70Hda2haWoXbPRx4Tc5dq50ANvuO7akyDJZFPmkDt2sGDEJNcWTx8E/7e8ax4Sw==
X-Received: by 2002:aa7:c9d6:0:b0:506:6c4d:3292 with SMTP id i22-20020aa7c9d6000000b005066c4d3292mr11927470edt.25.1681727655756;
        Mon, 17 Apr 2023 03:34:15 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7c6ca000000b00506a5606343sm1565137eds.14.2023.04.17.03.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 03:34:15 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: [RFC PATCH 05/14] RISC-V: KVM: Add SBI STA extension skeleton
Date: Mon, 17 Apr 2023 12:33:53 +0200
Message-Id: <20230417103402.798596-6-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417103402.798596-1-ajones@ventanamicro.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_033419_879722_CA730BAA 
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
index 4278125a38a5..c63c6bbc2f74 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -63,6 +63,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
 
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 47a7c3958229..5b6723c13301 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -124,6 +124,7 @@ enum KVM_RISCV_SBI_EXT_ID {
 	KVM_RISCV_SBI_EXT_PMU,
 	KVM_RISCV_SBI_EXT_EXPERIMENTAL,
 	KVM_RISCV_SBI_EXT_VENDOR,
+	KVM_RISCV_SBI_EXT_STA,
 	KVM_RISCV_SBI_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 278e97c06e0a..ccfed11691c6 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -24,5 +24,6 @@ kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
 kvm-y += vcpu_sbi_base.o
 kvm-y += vcpu_sbi_replace.o
 kvm-y += vcpu_sbi_hsm.o
+kvm-y += vcpu_sbi_sta.o
 kvm-y += vcpu_timer.o
 kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o vcpu_sbi_pmu.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index e52fde504433..2d2033b70e24 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -68,6 +68,10 @@ static const struct kvm_riscv_sbi_extension_entry sbi_ext[] = {
 		.dis_idx = KVM_RISCV_SBI_EXT_PMU,
 		.ext_ptr = &vcpu_sbi_ext_pmu,
 	},
+	{
+		.dis_idx = KVM_RISCV_SBI_EXT_STA,
+		.ext_ptr = &vcpu_sbi_ext_sta,
+	},
 	{
 		.dis_idx = KVM_RISCV_SBI_EXT_EXPERIMENTAL,
 		.ext_ptr = &vcpu_sbi_ext_experimental,
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
new file mode 100644
index 000000000000..de9ad7b7d010
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
+static int kvm_sbi_sta_set_steal_time_shmem(struct kvm_vcpu *vcpu)
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
+	case SBI_EXT_STA_SET_STEAL_TIME_SHMEM:
+		ret = kvm_sbi_sta_set_steal_time_shmem(vcpu);
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
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
