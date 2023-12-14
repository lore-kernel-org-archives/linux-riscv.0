Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFCDC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 10:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OYSjaenhAmqNDPJWkBJ1YAJIggjfl1Xcvinl11PHglY=; b=EHvGDdSjMqE0U8
	e1yAMeTsjrQGkuj8d2M2l9Q7I5C1VqvEo+csBIprGqiLgiyAsPM4osGpsEFFFssujIsDMdQ788rrr
	bNHCbxi1KerjW4yKwN3rpFLt+w47+uwTYdZvFfEV07JhjQyJPmZyOASkHb1cM6+lLADIEGeOeqgWF
	KzsTn1EUicEQHJUEJhGqIf3OnV2LJIIZn2PisE3oxRa05MYZ6/1eLPrC7buARcvsGFuYgY/bFK0v5
	pg3WPy+XWszbvuscUUsM5CpzWgsteuXKI9gVg8O0G1PI1r3fm+a/c7fzibpjpDPDT1VRYAz6RXP1t
	H0ZgCqxhE3fYdaGrqH/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDilI-00HRVW-2v;
	Thu, 14 Dec 2023 10:16:12 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDilB-00HRIN-0N
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 10:16:06 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c46d6784eso39839045e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 02:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702548960; x=1703153760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9z0wgw7c1ACY0OXaouY2QfTkuMcYS+PVo6Y2wv+kfs=;
        b=WA8t8aGeLq212gRPHuSCj/G7Q62gLHsXslRAsJtf8BVzEoYLG20UwnZXFUp+7AfXk0
         d35na+hRw38Ygcxm343TAqyiGEmIYkZlb3OYu1XijzkVcdYGvoKkbIDxsQEqrFZmKoQZ
         JQHtkBbgXSAuf3F/bj2ch/AOjpBuH51zzokyWyCBz96fnmRVVPSsRtYfud2LaQsVyXuW
         iAFcdflqInYVBKH65FqdcGoY2tSBCB4dDdbMuuezoTTmFI9YL+5dSYV3cyWKhDk22pjw
         fXZhOLUB8ErFwpdOEvJoMR4d/qn1UKZ3pCbIlseu/ZJU+fzcQTJcnnazTU2gquB6MRHA
         f7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702548960; x=1703153760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9z0wgw7c1ACY0OXaouY2QfTkuMcYS+PVo6Y2wv+kfs=;
        b=nSrHx2kX54ogvbBgSyZd9538DSyt6h92V2wyA+nfGfG6/DIlOxr47bYPlZmzAixr1W
         mfKLY5RJYvXnJjwvGZheFV+V2UwFGFe09BD43LBJCXtny3fzpNmZm3jj0iWCkxw7DWI0
         pXPBdaUS4p0+7ddDKwUfa9R7TY/nuQVb3TUqRlQJmbwYBIf1dtpqJCyqif6TrB9GlXCx
         Jc//9CSiNH9+itcTqyR1bKYxPb2aI3dgkcXxqXVOuntU3I/YbSDokRWGIeeIeNOuyMcv
         O7xx5SsRfAVWwEqw7TEs0yT+KrlMellqSYKuEBVGTTKsMtw/x8QjMW4BhtGa9R46WbGt
         y7Vg==
X-Gm-Message-State: AOJu0Yzkn/8oqZkablLTBh3bo3nUlsIZ1jFMah0Z5HE0xM6PKxG0XUra
	WaPNIQmia5gVqi3fS1HbgijY6Q==
X-Google-Smtp-Source: AGHT+IGZ9AhHTgJYYQdcMzfopk/2VTVccWhKtFnEy35KuQx9NmDe9qnj6vpjEZ2H7uzqWvgT+zRFhA==
X-Received: by 2002:a05:600c:3657:b0:40c:2d85:3a13 with SMTP id y23-20020a05600c365700b0040c2d853a13mr4944422wmq.185.1702548959717;
        Thu, 14 Dec 2023 02:15:59 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c470900b0040c4acaa4bfsm13074951wmo.19.2023.12.14.02.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:15:59 -0800 (PST)
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
Subject: [PATCH v2 04/13] RISC-V: KVM: Add SBI STA extension skeleton
Date: Thu, 14 Dec 2023 11:15:56 +0100
Message-ID: <20231214101552.100721-19-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214101552.100721-15-ajones@ventanamicro.com>
References: <20231214101552.100721-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_021605_162280_DF050A7B 
X-CRM114-Status: GOOD (  15.48  )
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
