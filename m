Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F6DC46CD7
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 20:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c92mGpv/1EJU+LQp2FkSsEO+TzSP21gTBM9Sqr9DfJY=; b=spfh4yGhdsliy0
	OeUKBzhScBo/x52wZ5rqx5IrEPaQ2k66MvkSS2j8wXhTptblXae7lyq67aDG8CSrdbxBCTScqX9ED
	uNJeB1tsygN3JcuO7ekZt9TX7fqjG7Gr/041rZo22JO9yXsEqKOYIVg39EY99BpFHSt4zG8zQ06s+
	sVzoV03H0wqNWNAGXmr9ikad7eRPlorKPQDXk0QdogZCYEO0asRJoHgPq/YmXFhEY2ceg2u0Pa0a1
	jaikQJ2Dy43NmH0Ss5j5Svg8/s6l0y/jcKztCX0uUy7406wx3M60y73Nx5AqSrK7ttC3I986GpAir
	uvudVhLmjwzojtJDl52g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rExwG-008Q32-1h;
	Sun, 17 Dec 2023 20:40:40 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rExwC-008Pz4-3D
	for linux-riscv@lists.infradead.org;
	Sun, 17 Dec 2023 20:40:38 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50bfd8d5c77so2424361e87.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Dec 2023 12:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702845634; x=1703450434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+d89FGlW8uU7BxXGJ5yTN/jLWIL41Tj4iXPYsfWwAZY=;
        b=BCvIORgahiDdMM6Vi6aHDH5YXHFnZpEnSy307CnwAMwn3avxX6fc/8cGhsTIPrYPQ5
         7r7sGH9YpY3Jgl1cJNUT+J85B+lL/8bJfHxALhOq4ZnsMiD9L7PqAktUqpRbUFwAb4Ld
         +R661BHJNm5AWRk7EzfXmw60I05UYDMDF4TVpzVHz499KBZQUf5fGpRfTLUX/udEQEZQ
         U9eZQhTUmaiuFwoZip9FDgPMpGLrjmvxg6PqeICzBzUZ30y9JHMjF+cDfQLUohsoMy9G
         D3njGA//DlXS33ynj4DteR6qAI32e58O2SnxfBIeMmbT6d/qjfz63tnKh7X94d3Ek0Dq
         hCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702845634; x=1703450434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+d89FGlW8uU7BxXGJ5yTN/jLWIL41Tj4iXPYsfWwAZY=;
        b=xFgbxSG7VQSsrdrFSHZ59/G7vPas+pwxTWIiTOQzeZ0U3s1qB7zS0k815RrTu5Sbjs
         a/DA0GoI/ev6bm2BBvQVCHXCuVn/UxXxvVk3seBqm4nAajQf1ocMG1C7gFU9Ut9rornL
         zdj4gbwfjnMtdkTVFfqfWxRDB/AtTuopdkFLFcMbISpZcFdW7Z5pWWxJzG5087qoxJ0g
         VZ7gvicwRZb/ccJ2XhECkkyXtuGKS8Pamw6tw0dmRkhAsCWMKtPrXv2tuL5AUqfe/ojN
         PiZ4JAk9HAEf/72ybQM1Zza9n1oq+712l1ZaLJYiqkOhxYIWuik7iAZsWmwaJBIkuu8v
         3BCw==
X-Gm-Message-State: AOJu0YweAHwZGwOoWiKxMitq0c/IU8kyeAODVoKLkpSdqWvasa7BxKpd
	RFgLF/sDy7AnWnqhChkqApU3Jg==
X-Google-Smtp-Source: AGHT+IGaGjUzlqaEdCfyqPOB7cC+hg78YM+9kfj/FXBbuW+nr2gBrZIAxYC4fVxXGTopJKaX8HSCCw==
X-Received: by 2002:a05:6512:21cf:b0:50b:e29b:2f01 with SMTP id d15-20020a05651221cf00b0050be29b2f01mr2885756lft.264.1702845634647;
        Sun, 17 Dec 2023 12:40:34 -0800 (PST)
Received: from localhost (cst-prg-88-42.cust.vodafone.cz. [46.135.88.42])
        by smtp.gmail.com with ESMTPSA id jw23-20020a17090776b700b00a23365f1290sm1464388ejc.218.2023.12.17.12.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 12:40:34 -0800 (PST)
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
	conor.dooley@microchip.com
Subject: [PATCH v3 04/13] RISC-V: KVM: Add SBI STA extension skeleton
Date: Sun, 17 Dec 2023 21:40:24 +0100
Message-ID: <20231217204019.36492-19-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231217204019.36492-15-ajones@ventanamicro.com>
References: <20231217204019.36492-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_124037_048640_41B46339 
X-CRM114-Status: GOOD (  15.26  )
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
