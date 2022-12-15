Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FCFC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 17:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujyKhj0Pu03lrOT1OkCOWQLHnwRH3geelREnp3lRO1c=; b=whGrLSJEAz+rIZ
	gxeqfrQbwwgzWp8Q1b7zG11KxX1CQw7SWHoz3PnyWVf/WISvauyfw4t/PWkbRCv6uUN571QQvD6iT
	frMWxkfNgHNZNUlNTUkP7ZXW5JRf0p2PKsmqSC88IMMvHruvXdyzON/Nh1W6MbN+uXNw09J5RhaTw
	em/jq6l2iuNU2/7xKqsZpyFRH+TgjRT42USYf7GtFikbcAqNYiqeq8UVUd5tT+ATGTBkbAVJF0oT7
	SNj70BYkdpojx6Y3yG5xnYl8ATsP6m2hrFK1clKjAuj+ciLrPJO6jtW614dsnht6lVsMgh0Q/T0ZO
	QLM2qewVSNEk9POPT1tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rc0-00ARf7-NF; Thu, 15 Dec 2022 17:01:36 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rbj-00ARU5-7p
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 17:01:23 +0000
Received: by mail-pj1-x1035.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so3327477pje.5
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 09:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhs+JrFmy876qsXRL5CBd5BerbPW3etQeVs8SpsZcQw=;
        b=U6oNR8T4Jsx3E3L822kTsxHd5TEGEsxBn3CCUI2SeekPDUkSTGJ3fOb7abTtiH2h4F
         LFLmL/RlSDx5Gy7NL57xvVYxQFVz3At/fTJ5lhTAnbcZtYlPv3YqbA8/oF0LW4z1rrLd
         2NzR+yITnwiEjMORqQ9wRHog+vOR75SHj03EJOOROKOWaE3zKorgx1eElPSSsd7BZpML
         t3+2flYfKJ2PRenAgW4s3fOk2QnyIDjhXZ8B7xxbGaydBqH/Z9PJlSz91Pj30V5kediS
         avY61zS5vHm0YooUmCNwe++UdZaFGHKwFMLtTH+sp3nepkSe07opJjxQVAJJko1VQZXp
         Vjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhs+JrFmy876qsXRL5CBd5BerbPW3etQeVs8SpsZcQw=;
        b=WaW2WFYMeyD97xQrQPODSfuBQdsnQKQKkC9d+WUj/0WS5dNROhfM8fHyY3Vm96/2cI
         8xA+O+h1hODHLsespAZ2kRQaaN6KBRmXGw+0U6YwJqv0Zy6zp0hPZxnyrDXiHII5Hhq8
         Kr2t6T+QIee/b/EbL9db5RxBZE3fP0Nybbig7MyqQCZGCiQNcWn5EfUklc1SQ8xFyawB
         bKsbSWVtgs/AWv5/17UUoJyXcwFOFRrXUYav9t056Hkm8Hrhh8uaQO+FyN6FlNzVqzAV
         nV9ilPiZXBSPKPDwgGCnNZezZ8GFdUzeQRFZuWyPeFn0uKvz4l9/laesWD5sRpIGVjfJ
         tpWw==
X-Gm-Message-State: ANoB5pkj+dH/XjWauktTuLpOoiqebuRchIZyE2MQpbDC5AfihyRyxTOi
	+pLuX4vQT1YkfocCcG2pG9RpHw==
X-Google-Smtp-Source: AA0mqf5DHC3LSXbUYgba/exs/9GOB/5X0REqYDp696TBPWA4irASk74J17kx3gV/3kuJxQkkUN+9Gw==
X-Received: by 2002:a17:902:8b81:b0:185:441e:2d78 with SMTP id ay1-20020a1709028b8100b00185441e2d78mr27030692plb.15.1671123678696;
        Thu, 15 Dec 2022 09:01:18 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902780a00b001897bfc9800sm4067449pll.53.2022.12.15.09.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 09:01:18 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Eric Lin <eric.lin@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 06/11] RISC-V: KVM: Add skeleton support for perf
Date: Thu, 15 Dec 2022 09:00:41 -0800
Message-Id: <20221215170046.2010255-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215170046.2010255-1-atishp@rivosinc.com>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_090119_357578_8DA9E5E4 
X-CRM114-Status: GOOD (  28.29  )
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

This patch only adds barebore structure of perf implementation. Most of
the function returns zero at this point and will be implemented
fully in the future.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_host.h     |   3 +
 arch/riscv/include/asm/kvm_vcpu_pmu.h |  76 ++++++++++++++
 arch/riscv/kvm/Makefile               |   1 +
 arch/riscv/kvm/vcpu.c                 |   5 +
 arch/riscv/kvm/vcpu_insn.c            |   2 +-
 arch/riscv/kvm/vcpu_pmu.c             | 142 ++++++++++++++++++++++++++
 6 files changed, 228 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_pmu.h
 create mode 100644 arch/riscv/kvm/vcpu_pmu.c

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 93f43a3..f9874b4 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -18,6 +18,7 @@
 #include <asm/kvm_vcpu_insn.h>
 #include <asm/kvm_vcpu_sbi.h>
 #include <asm/kvm_vcpu_timer.h>
+#include <asm/kvm_vcpu_pmu.h>
 
 #define KVM_MAX_VCPUS			1024
 
@@ -228,6 +229,8 @@ struct kvm_vcpu_arch {
 
 	/* Don't run the VCPU (blocked) */
 	bool pause;
+
+	struct kvm_pmu pmu;
 };
 
 static inline void kvm_arch_hardware_unsetup(void) {}
diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
new file mode 100644
index 0000000..6a8c0f7
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 Rivos Inc
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
+#define RISCV_KVM_MAX_FW_CTRS 32
+#define RISCV_MAX_COUNTERS      64
+
+/* Per virtual pmu counter data */
+struct kvm_pmc {
+	u8 idx;
+	struct perf_event *perf_event;
+	uint64_t counter_val;
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
+#define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu)
+#define pmu_to_vcpu(pmu)  (container_of((pmu), struct kvm_vcpu, arch.pmu))
+
+int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_ext_data *edata);
+int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
+				struct kvm_vcpu_sbi_ext_data *edata);
+int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
+				 unsigned long ctr_mask, unsigned long flag, uint64_t ival,
+				 struct kvm_vcpu_sbi_ext_data *edata);
+int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
+				unsigned long ctr_mask, unsigned long flag,
+				struct kvm_vcpu_sbi_ext_data *edata);
+int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_base,
+				     unsigned long ctr_mask, unsigned long flag,
+				     unsigned long eidx, uint64_t edata,
+				     struct kvm_vcpu_sbi_ext_data *extdata);
+int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
+				struct kvm_vcpu_sbi_ext_data *edata);
+int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
+
+#else
+struct kvm_pmu {
+};
+
+static inline int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
+static inline void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu) {}
+static inline void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu) {}
+#endif
+#endif
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
index 7c08567..b746f21 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -137,6 +137,7 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	WRITE_ONCE(vcpu->arch.irqs_pending, 0);
 	WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
+	kvm_riscv_vcpu_pmu_reset(vcpu);
 
 	vcpu->arch.hfence_head = 0;
 	vcpu->arch.hfence_tail = 0;
@@ -194,6 +195,9 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	/* Setup VCPU timer */
 	kvm_riscv_vcpu_timer_init(vcpu);
 
+	/* setup performance monitoring */
+	kvm_riscv_vcpu_pmu_init(vcpu);
+
 	/* Reset VCPU */
 	kvm_riscv_reset_vcpu(vcpu);
 
@@ -216,6 +220,7 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 	/* Cleanup VCPU timer */
 	kvm_riscv_vcpu_timer_deinit(vcpu);
 
+	kvm_riscv_vcpu_pmu_deinit(vcpu);
 	/* Free unused pages pre-allocated for G-stage page table mappings */
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_cache);
 }
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 0bb5276..1ff2649 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -213,7 +213,7 @@ struct csr_func {
 		    unsigned long wr_mask);
 };
 
-static const struct csr_func csr_funcs[] = { };
+static const struct csr_func csr_funcs[] = {};
 
 /**
  * kvm_riscv_vcpu_csr_return -- Handle CSR read/write after user space
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
new file mode 100644
index 0000000..0f0748f1
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 Rivos Inc
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
+int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_ext_data *edata)
+{
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+
+	edata->out_val = kvpmu->num_fw_ctrs + kvpmu->num_hw_ctrs;
+
+	return 0;
+}
+
+int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
+				struct kvm_vcpu_sbi_ext_data *edata)
+{
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+
+	if ((cidx > RISCV_MAX_COUNTERS) || (cidx == 1)) {
+		edata->err_val = SBI_ERR_INVALID_PARAM;
+		return 0;
+	}
+
+	edata->out_val = kvpmu->pmc[cidx].cinfo.value;
+
+	return 0;
+}
+
+int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
+				 unsigned long ctr_mask, unsigned long flag, uint64_t ival,
+				 struct kvm_vcpu_sbi_ext_data *edata)
+{
+	/* TODO */
+	return 0;
+}
+
+int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
+				unsigned long ctr_mask, unsigned long flag,
+				struct kvm_vcpu_sbi_ext_data *edata)
+{
+	/* TODO */
+	return 0;
+}
+
+int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_base,
+				     unsigned long ctr_mask, unsigned long flag,
+				     unsigned long eidx, uint64_t edata,
+				     struct kvm_vcpu_sbi_ext_data *extdata)
+{
+	/* TODO */
+	return 0;
+}
+
+int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
+				struct kvm_vcpu_sbi_ext_data *edata)
+{
+	/* TODO */
+	return 0;
+}
+
+int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
+{
+	int i = 0, num_fw_ctrs, ret, num_hw_ctrs = 0, hpm_width = 0;
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+
+	ret = riscv_pmu_get_hpm_info(&hpm_width, &num_hw_ctrs);
+	if (ret < 0)
+		return ret;
+
+	if (!hpm_width || !num_hw_ctrs) {
+		pr_err("Can not initialize PMU for vcpu with NULL hpmcounter width/count\n");
+		return -EINVAL;
+	}
+
+	if ((num_hw_ctrs + RISCV_KVM_MAX_FW_CTRS) > RISCV_MAX_COUNTERS)
+		num_fw_ctrs = RISCV_MAX_COUNTERS - num_hw_ctrs;
+	else
+		num_fw_ctrs = RISCV_KVM_MAX_FW_CTRS;
+
+	kvpmu->num_hw_ctrs = num_hw_ctrs;
+	kvpmu->num_fw_ctrs = num_fw_ctrs;
+	/*
+	 * There is no corelation betwen the logical hardware counter and virtual counters.
+	 * However, we need to encode a hpmcounter CSR in the counter info field so that
+	 * KVM can trap n emulate the read. This works well in the migraiton usecase as
+	 * KVM doesn't care if the actual hpmcounter is available in the hardware or not.
+	 */
+	for (i = 0; i < kvm_pmu_num_counters(kvpmu); i++) {
+		/* TIME CSR shouldn't be read from perf interface */
+		if (i == 1)
+			continue;
+		kvpmu->pmc[i].idx = i;
+		if (i < kvpmu->num_hw_ctrs) {
+			kvpmu->pmc[i].cinfo.type = SBI_PMU_CTR_TYPE_HW;
+			if (i < 3)
+				/* CY, IR counters */
+				kvpmu->pmc[i].cinfo.width = 63;
+			else
+				kvpmu->pmc[i].cinfo.width = hpm_width;
+			/*
+			 * The CSR number doesn't have any relation with the logical
+			 * hardware counters. The CSR numbers are encoded sequentially
+			 * to avoid maintaining a map between the virtual counter
+			 * and CSR number.
+			 */
+			kvpmu->pmc[i].cinfo.csr = CSR_CYCLE + i;
+		} else {
+			kvpmu->pmc[i].cinfo.type = SBI_PMU_CTR_TYPE_FW;
+			kvpmu->pmc[i].cinfo.width = BITS_PER_LONG - 1;
+		}
+	}
+
+	kvpmu->init_done = true;
+
+	return 0;
+}
+
+void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu)
+{
+	/* TODO */
+}
+
+void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
+{
+	/* TODO */
+}
+
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
