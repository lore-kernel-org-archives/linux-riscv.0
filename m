Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7A6C636CC
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Feb 2023 02:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=smMJ5Kv76LTPCI/mKxdw+cY+1KHVMXBUc98hYIeAW0g=; b=TzMAfVe8eOWV9B
	0A6oKg2s4ewpf0e0wonkto2/eRukEHxlwnrQ4lR/YYEB11Xh8o0VvZC3QNN/RC4xz5Rj/RCXkrsd0
	j0YYSRcb6dRrlsDvx/nkZQHztIDHBL6bm6CobcDjDhxDg7hTheW7gQT3gexRHC6KzEqdT9seiu0Fz
	H37QH6Dh67JUm9Z+wdHgs54LM1g+pWESWMwNfwIsRvGLsK0lfNuJ2CU0yIFzPicmKXEp5G7pwQW+g
	UCSTs2xq2Fek7jMxUO3wQi6kraWWUNCfXXSs33Eo1EUf7U5YAjhlfonHY1nzhKNSeZOkOIwSmaglF
	ANACTTmknkJUzOKU9H6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOUaQ-005rtC-V9; Sun, 05 Feb 2023 02:16:59 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOTd8-005oEs-2u
	for linux-riscv@lists.infradead.org; Sun, 05 Feb 2023 01:15:45 +0000
Received: by mail-pj1-x102e.google.com with SMTP id mi9so8533559pjb.4
        for <linux-riscv@lists.infradead.org>; Sat, 04 Feb 2023 17:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gG9hdNpqSHyyiW/kY0PtWrSKIXU+zOCOJ2WI9yMHzdg=;
        b=NrgdXdgsnEPBD0D7s8HlbYKiz6iJJDx0D/nBEP5Qqi61Ch7DapV4hAhTIibqHhM+Ly
         W6QhKTE0QSPNmdDHOe/GFSyI+s76VYwQbcYmT+O0qIbzui5CNEvbffIMmUh6Q5tYzzlh
         ezWQg5X/RGfP6CwIXjOE2f/TUL4m+laTITDHrv85qcx5wLzmPa8qJHO4EVsvM0LBtpBu
         AYowC8LX9onYBl5i72QZ/4NwbXOxJOi8aQMmGgBT5xS90MIGX6CB1N8p3iROisyOsUlv
         Jd1V4R93o4PyacN72SJJkSF/Ap4YErqQLehzYI9Ssc0C4Xub+CrgR8Ne5qAS57Zcxr4c
         Ie6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gG9hdNpqSHyyiW/kY0PtWrSKIXU+zOCOJ2WI9yMHzdg=;
        b=nZIQkUdDecx7ncd0HCCPDnxnWH6dJoKBGMRxW/xlYTannAH9I4f2dUTCza536huV0+
         EIw1u72Px8E7IYo9bdu9SX6UXbWB5eSzmgHhl8NmU7gEIdakFUrThBThwQIwvG8DWQRd
         XTC50EZCeOToOCgkcrqOBPk8zOLsTU6NyRmcouGtAkw35cvqHqCfwXgCTgc01mxXxl1K
         fl+YP0ssT7cn9N+xTxFPf6yrf6WFeaa1QznMym/CCcgdsN3Z7cYKDAjtZKbF2R4zdLLz
         sFmXFfdUUukDM9jHuAlRc95TKU0EDgDHXSu6307N3zQAWKMfc5BPaPqwyquc6mUB01kI
         /Xwg==
X-Gm-Message-State: AO0yUKWUJwTsuYva6iCxX6vRwjMx1cC7PjZG4/90W7SrMgsawKP6GvoR
	PN2APxbhj2bl1bnnHbzgLQ7H0A==
X-Google-Smtp-Source: AK7set+olOeEhVPuVuQQRmpyyi+q7ViFoGVFHgOxpZ8EjOgorDRGrTpxCtG273Lp9b7bYT/JOlcp7w==
X-Received: by 2002:a17:90a:c092:b0:230:ac49:9802 with SMTP id o18-20020a17090ac09200b00230ac499802mr230784pjs.22.1675559729917;
        Sat, 04 Feb 2023 17:15:29 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id c7-20020a17090a020700b0023080c4c3bcsm2721917pjc.31.2023.02.04.17.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 17:15:29 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v5 08/14] RISC-V: KVM: Add SBI PMU extension support
Date: Sat,  4 Feb 2023 17:15:09 -0800
Message-Id: <20230205011515.1284674-9-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230205011515.1284674-1-atishp@rivosinc.com>
References: <20230205011515.1284674-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_171542_196520_DCCB7941 
X-CRM114-Status: GOOD (  19.55  )
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

SBI PMU extension allows KVM guests to configure/start/stop/query about
the PMU counters in virtualized enviornment as well.

In order to allow that, KVM implements the entire SBI PMU extension.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/Makefile       |  2 +-
 arch/riscv/kvm/vcpu_sbi.c     | 11 +++++
 arch/riscv/kvm/vcpu_sbi_pmu.c | 87 +++++++++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c

diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 5de1053..278e97c 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -25,4 +25,4 @@ kvm-y += vcpu_sbi_base.o
 kvm-y += vcpu_sbi_replace.o
 kvm-y += vcpu_sbi_hsm.o
 kvm-y += vcpu_timer.o
-kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o
+kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o vcpu_sbi_pmu.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index fe2897e..15fde15 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -20,6 +20,16 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
 };
 #endif
 
+#ifdef CONFIG_RISCV_PMU_SBI
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
+#else
+static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
+	.extid_start = -1UL,
+	.extid_end = -1UL,
+	.handler = NULL,
+};
+#endif
+
 static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_v01,
 	&vcpu_sbi_ext_base,
@@ -28,6 +38,7 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_rfence,
 	&vcpu_sbi_ext_srst,
 	&vcpu_sbi_ext_hsm,
+	&vcpu_sbi_ext_pmu,
 	&vcpu_sbi_ext_experimental,
 	&vcpu_sbi_ext_vendor,
 };
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
new file mode 100644
index 0000000..9fdc1e1
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Rivos Inc
+ *
+ * Authors:
+ *     Atish Patra <atishp@rivosinc.com>
+ */
+
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/kvm_host.h>
+#include <asm/csr.h>
+#include <asm/sbi.h>
+#include <asm/kvm_vcpu_sbi.h>
+
+static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				   struct kvm_vcpu_sbi_return *retdata)
+{
+	int ret = 0;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	unsigned long funcid = cp->a6;
+	u64 temp;
+
+	/* Return not supported if PMU is not initialized */
+	if (!kvpmu->init_done) {
+		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
+		return 0;
+	}
+
+	switch (funcid) {
+	case SBI_EXT_PMU_NUM_COUNTERS:
+		ret = kvm_riscv_vcpu_pmu_num_ctrs(vcpu, retdata);
+		break;
+	case SBI_EXT_PMU_COUNTER_GET_INFO:
+		ret = kvm_riscv_vcpu_pmu_ctr_info(vcpu, cp->a0, retdata);
+		break;
+	case SBI_EXT_PMU_COUNTER_CFG_MATCH:
+#if defined(CONFIG_32BIT)
+		temp = ((uint64_t)cp->a5 << 32) | cp->a4;
+#else
+		temp = cp->a4;
+#endif
+		/*
+		 * This can fail if perf core framework fails to create an event.
+		 * Forward the error to userspace because it's an error happened
+		 * within the host kernel. The other option would be to convert
+		 * this an SBI error and forward to the guest.
+		 */
+		ret = kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1,
+						       cp->a2, cp->a3, temp, retdata);
+		break;
+	case SBI_EXT_PMU_COUNTER_START:
+#if defined(CONFIG_32BIT)
+		temp = ((uint64_t)cp->a4 << 32) | cp->a3;
+#else
+		temp = cp->a3;
+#endif
+		ret = kvm_riscv_vcpu_pmu_ctr_start(vcpu, cp->a0, cp->a1, cp->a2,
+						   temp, retdata);
+		break;
+	case SBI_EXT_PMU_COUNTER_STOP:
+		ret = kvm_riscv_vcpu_pmu_ctr_stop(vcpu, cp->a0, cp->a1, cp->a2, retdata);
+		break;
+	case SBI_EXT_PMU_COUNTER_FW_READ:
+		ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
+		break;
+	default:
+		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
+	}
+
+	return ret;
+}
+
+static unsigned long kvm_sbi_ext_pmu_probe(struct kvm_vcpu *vcpu)
+{
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+
+	return kvpmu->init_done;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
+	.extid_start = SBI_EXT_PMU,
+	.extid_end = SBI_EXT_PMU,
+	.handler = kvm_sbi_ext_pmu_handler,
+	.probe = kvm_sbi_ext_pmu_probe,
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
