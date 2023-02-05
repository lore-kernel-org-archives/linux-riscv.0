Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A8EC636CC
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Feb 2023 02:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JeRg0AnXEkttHK+A6sHWNPul3d1lWjnmWbvfgXDssjg=; b=v949qxfkKyEnac
	EIpp8N/s7KK29s35rq1gNgVIcHYSMy3YiWqgyuSMJUd4wnPqzu7ZKqALeF20/bx4h1TKO5rwvyX04
	vdFI5bRxH9afXTC00lpw4JTABa7nlUa31c3a16ttgUutMm771lWsvz48o+jw9VKy5qvudskgIG0B8
	cI56Rkttj+3o7Lms4hDuHbBJoDkEC32QXYuofDXT1dRPqWAuGswgHhnvxLqnVZKJ+sNJPacPlZCK5
	zvBnrkdB321hiJJv+zLGhpnYcJ+V+Xs4FB7cwTFlKdXy+7EdFvGl7tpz45AzmPcSoM9Xmt7GOH7bL
	2SBP85v7LwPyJLDLCVpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOUa8-005rdo-O1; Sun, 05 Feb 2023 02:16:40 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOTcv-005oEb-HH
	for linux-riscv@lists.infradead.org; Sun, 05 Feb 2023 01:15:33 +0000
Received: by mail-pl1-x632.google.com with SMTP id m13so8858910plx.13
        for <linux-riscv@lists.infradead.org>; Sat, 04 Feb 2023 17:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmRF2fKcTKxsdNB0xClj8TkKk5+mI7LC2HC2JBle1ss=;
        b=7vOgc6jqkos/iEUATBq3CTWXeZetSpBFp9iVcekISsVOuLwmgKriv/QlavY+7YhBjK
         Q9JlHxwi2veXZdt7xVl/W5KkaU9zqQFKzYxnVymflVnV89gbkoyWuwNbSN278vclGUzf
         Uy85AGS1UBM0MTC+9kiEntwGk+MNz8nSlVl/ha0n2oqU+9CFiFzGqaZsYFRUaWgH7XQI
         gB9cE+MqUNfYYicU0osciGK4qbf2XfFNhdWpQfArojRSXj5wHqlDOWpokxrePqZ5UvuT
         j5KcJAxg0Vk51EtiR96drg5FwM6ord9eaDUqeicg1uLcGOM4n6Ldkno6CZG2wFIa+IvW
         sRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmRF2fKcTKxsdNB0xClj8TkKk5+mI7LC2HC2JBle1ss=;
        b=geMH1e6mx+DiJLCiYcjoI7rvexHJBc2+0Ie/nWm/+RQij/yx8Zb1EbtZP8DUGoagau
         aNh31ni92dUwrKImajVVh/66Xp/5ykq4j0lBxHPqMMhXJbnRZ4aRwttVcVKmzJFfRHxl
         oAx5ZhRdOsD3hLbd/ZhGmm/XwqYfbS5nTJ+Y8zAgwLjxg3b7VciZo4ldX4OXMknT23tO
         KclziYQkLxxz5lc1KbeTfQQgkUWz5vlN+NNRgFuOL68o3G1AM1axhswXyXBE9se25r+O
         ma4BXZHhqFiEN+gxXh9FOWZx8wxWwHIQctemB3Thm4tql8YBYxGxdW6rnTe56odc36X8
         DBGg==
X-Gm-Message-State: AO0yUKUGdMoQ+8oJ3WkLtsxb9a/rzxkLP13iLgyD33f8gr6nFjIX0NQl
	RJvoQ72Cb2jhJp2HJc1ifXW22w==
X-Google-Smtp-Source: AK7set8uIqjK+J4fh7eb+26IB5cNPDD+YoITwEkJus8B2PKiyK6PLXxSGPD8Nn741c0hzxJqlkxr+Q==
X-Received: by 2002:a17:90b:4c02:b0:230:a39f:4992 with SMTP id na2-20020a17090b4c0200b00230a39f4992mr1135832pjb.11.1675559729079;
        Sat, 04 Feb 2023 17:15:29 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id c7-20020a17090a020700b0023080c4c3bcsm2721917pjc.31.2023.02.04.17.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 17:15:28 -0800 (PST)
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
Subject: [PATCH v5 07/14] RISC-V: KVM: Add skeleton support for perf
Date: Sat,  4 Feb 2023 17:15:08 -0800
Message-Id: <20230205011515.1284674-8-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230205011515.1284674-1-atishp@rivosinc.com>
References: <20230205011515.1284674-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_171529_597754_69950BA4 
X-CRM114-Status: GOOD (  27.97  )
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

This patch only adds barebone structure of perf implementation. Most of
the function returns zero at this point and will be implemented
fully in the future.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_host.h     |   4 +
 arch/riscv/include/asm/kvm_vcpu_pmu.h |  78 +++++++++++++++
 arch/riscv/kvm/Makefile               |   1 +
 arch/riscv/kvm/vcpu.c                 |   7 ++
 arch/riscv/kvm/vcpu_pmu.c             | 135 ++++++++++++++++++++++++++
 5 files changed, 225 insertions(+)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_pmu.h
 create mode 100644 arch/riscv/kvm/vcpu_pmu.c

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 93f43a3..b90be9a 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -18,6 +18,7 @@
 #include <asm/kvm_vcpu_insn.h>
 #include <asm/kvm_vcpu_sbi.h>
 #include <asm/kvm_vcpu_timer.h>
+#include <asm/kvm_vcpu_pmu.h>
 
 #define KVM_MAX_VCPUS			1024
 
@@ -228,6 +229,9 @@ struct kvm_vcpu_arch {
 
 	/* Don't run the VCPU (blocked) */
 	bool pause;
+
+	/* Performance monitoring context */
+	struct kvm_pmu pmu_context;
 };
 
 static inline void kvm_arch_hardware_unsetup(void) {}
diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
new file mode 100644
index 0000000..40905db
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023 Rivos Inc
+ *
+ * Authors:
+ *     Atish Patra <atishp@rivosinc.com>
+ */
+
+#ifndef __KVM_VCPU_RISCV_PMU_H
+#define __KVM_VCPU_RISCV_PMU_H
+
+#include <linux/perf/riscv_pmu.h>
+#include <asm/kvm_vcpu_sbi.h>
+#include <asm/sbi.h>
+
+#ifdef CONFIG_RISCV_PMU_SBI
+#define RISCV_KVM_MAX_FW_CTRS	32
+
+#if RISCV_KVM_MAX_FW_CTRS > 32
+#error "Maximum firmware counter can not exceed 32 without increasing the RISCV_MAX_COUNTERS"
+#endif
+
+#define RISCV_MAX_COUNTERS 64
+
+/* Per virtual pmu counter data */
+struct kvm_pmc {
+	u8 idx;
+	struct perf_event *perf_event;
+	u64 counter_val;
+	union sbi_pmu_ctr_info cinfo;
+	/* Event monitoring status */
+	bool started;
+};
+
+/* PMU data structure per vcpu */
+struct kvm_pmu {
+	struct kvm_pmc pmc[RISCV_MAX_COUNTERS];
+	/* Number of the virtual firmware counters available */
+	int num_fw_ctrs;
+	/* Number of the virtual hardware counters available */
+	int num_hw_ctrs;
+	/* A flag to indicate that pmu initialization is done */
+	bool init_done;
+	/* Bit map of all the virtual counter used */
+	DECLARE_BITMAP(pmc_in_use, RISCV_MAX_COUNTERS);
+};
+
+#define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu_context)
+#define pmu_to_vcpu(pmu)  (container_of((pmu), struct kvm_vcpu, arch.pmu_context))
+
+int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_return *retdata);
+int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
+				struct kvm_vcpu_sbi_return *retdata);
+int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
+				 unsigned long ctr_mask, unsigned long flags, u64 ival,
+				 struct kvm_vcpu_sbi_return *retdata);
+int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
+				unsigned long ctr_mask, unsigned long flags,
+				struct kvm_vcpu_sbi_return *retdata);
+int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_base,
+				     unsigned long ctr_mask, unsigned long flags,
+				     unsigned long eidx, u64 evtdata,
+				     struct kvm_vcpu_sbi_return *retdata);
+int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
+				struct kvm_vcpu_sbi_return *retdata);
+void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
+
+#else
+struct kvm_pmu {
+};
+
+static inline void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu) {}
+static inline void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu) {}
+static inline void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu) {}
+#endif /* CONFIG_RISCV_PMU_SBI */
+#endif /* !__KVM_VCPU_RISCV_PMU_H */
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 019df920..5de1053 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -25,3 +25,4 @@ kvm-y += vcpu_sbi_base.o
 kvm-y += vcpu_sbi_replace.o
 kvm-y += vcpu_sbi_hsm.o
 kvm-y += vcpu_timer.o
+kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 7c08567..7d010b0 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -138,6 +138,8 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 	WRITE_ONCE(vcpu->arch.irqs_pending, 0);
 	WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
 
+	kvm_riscv_vcpu_pmu_reset(vcpu);
+
 	vcpu->arch.hfence_head = 0;
 	vcpu->arch.hfence_tail = 0;
 	memset(vcpu->arch.hfence_queue, 0, sizeof(vcpu->arch.hfence_queue));
@@ -194,6 +196,9 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	/* Setup VCPU timer */
 	kvm_riscv_vcpu_timer_init(vcpu);
 
+	/* setup performance monitoring */
+	kvm_riscv_vcpu_pmu_init(vcpu);
+
 	/* Reset VCPU */
 	kvm_riscv_reset_vcpu(vcpu);
 
@@ -216,6 +221,8 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 	/* Cleanup VCPU timer */
 	kvm_riscv_vcpu_timer_deinit(vcpu);
 
+	kvm_riscv_vcpu_pmu_deinit(vcpu);
+
 	/* Free unused pages pre-allocated for G-stage page table mappings */
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_cache);
 }
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
new file mode 100644
index 0000000..4919255
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -0,0 +1,135 @@
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
+#include <linux/perf/riscv_pmu.h>
+#include <asm/csr.h>
+#include <asm/kvm_vcpu_sbi.h>
+#include <asm/kvm_vcpu_pmu.h>
+#include <linux/kvm_host.h>
+
+#define kvm_pmu_num_counters(pmu) ((pmu)->num_hw_ctrs + (pmu)->num_fw_ctrs)
+
+int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_return *retdata)
+{
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+
+	retdata->out_val = kvm_pmu_num_counters(kvpmu);
+
+	return 0;
+}
+
+int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
+				struct kvm_vcpu_sbi_return *retdata)
+{
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+
+	if (cidx > RISCV_MAX_COUNTERS || cidx == 1) {
+		retdata->err_val = SBI_ERR_INVALID_PARAM;
+		return 0;
+	}
+
+	retdata->out_val = kvpmu->pmc[cidx].cinfo.value;
+
+	return 0;
+}
+
+int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
+				 unsigned long ctr_mask, unsigned long flags, u64 ival,
+				 struct kvm_vcpu_sbi_return *retdata)
+{
+	/* TODO */
+	return 0;
+}
+
+int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
+				unsigned long ctr_mask, unsigned long flags,
+				struct kvm_vcpu_sbi_return *retdata)
+{
+	/* TODO */
+	return 0;
+}
+
+int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_base,
+				     unsigned long ctr_mask, unsigned long flags,
+				     unsigned long eidx, u64 evtdata,
+				     struct kvm_vcpu_sbi_return *retdata)
+{
+	/* TODO */
+	return 0;
+}
+
+int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
+				struct kvm_vcpu_sbi_return *retdata)
+{
+	/* TODO */
+	return 0;
+}
+
+void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
+{
+	int i = 0, ret, num_hw_ctrs = 0, hpm_width = 0;
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	struct kvm_pmc *pmc;
+
+	ret = riscv_pmu_get_hpm_info(&hpm_width, &num_hw_ctrs);
+	if (ret < 0 || !hpm_width || !num_hw_ctrs)
+		return;
+
+	/*
+	 * Increase the number of hardware counters to offset the time counter.
+	 */
+	kvpmu->num_hw_ctrs = num_hw_ctrs + 1;
+	kvpmu->num_fw_ctrs = SBI_PMU_FW_MAX;
+
+	/*
+	 * There is no correlation between the logical hardware counter and virtual counters.
+	 * However, we need to encode a hpmcounter CSR in the counter info field so that
+	 * KVM can trap n emulate the read. This works well in the migration use case as
+	 * KVM doesn't care if the actual hpmcounter is available in the hardware or not.
+	 */
+	for (i = 0; i < kvm_pmu_num_counters(kvpmu); i++) {
+		/* TIME CSR shouldn't be read from perf interface */
+		if (i == 1)
+			continue;
+		pmc = &kvpmu->pmc[i];
+		pmc->idx = i;
+		if (i < kvpmu->num_hw_ctrs) {
+			pmc->cinfo.type = SBI_PMU_CTR_TYPE_HW;
+			if (i < 3)
+				/* CY, IR counters */
+				pmc->cinfo.width = 63;
+			else
+				pmc->cinfo.width = hpm_width;
+			/*
+			 * The CSR number doesn't have any relation with the logical
+			 * hardware counters. The CSR numbers are encoded sequentially
+			 * to avoid maintaining a map between the virtual counter
+			 * and CSR number.
+			 */
+			pmc->cinfo.csr = CSR_CYCLE + i;
+		} else {
+			pmc->cinfo.type = SBI_PMU_CTR_TYPE_FW;
+			pmc->cinfo.width = BITS_PER_LONG - 1;
+		}
+	}
+
+	kvpmu->init_done = true;
+}
+
+void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
+{
+	/* TODO */
+}
+
+void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu)
+{
+	kvm_riscv_vcpu_pmu_deinit(vcpu);
+}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
