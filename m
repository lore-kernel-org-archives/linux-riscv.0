Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA4CC05027
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 00:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mh4EOAeE1CkDlUcTOg7vmpmyx/eS2i4v8Lr+g4LN2Y=; b=CKXOSd5C3HBN0M
	YJIjg5vkjPC28fCcn4C5JoNoXgMELzcGABs1lrGOQ3rPnvQhh+/57vaJwRussqm8xEy1zF93AduL6
	vreVncDTqjL3FJtXFCyBlc4N8Ozk409MKp+Wsevp4d0mUQvM9nvKfU6vu5yY/wTjuvtGS2RhQERoK
	ZQPm4R1m/heaTxgM1gANEPOYV9PNzzRsjK9B4+fgrs02c/qFHBf97zLRWUj7TmhfCTEyMe77WizRd
	lnLN/dFnIy4EVIAz2wBkSEsrSDiGDlvOH91BpLpfPJRTMZa9cixCIRiJV74iF4K11wH75Fs9E1NO/
	jeYrEVNA3CKUOpPawg+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNN3z-00Dv34-JO; Thu, 02 Feb 2023 00:02:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNN3y-00Dv1u-DM
	for linux-riscv@bombadil.infradead.org; Thu, 02 Feb 2023 00:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KT5xATxquwHFSN7yZb29vP5DfgWelyL6nGymQqoc7PI=; b=aCN/RIicEKaA/ml1FshDhoHr1m
	q2fX5tUkZln5yIRF6Dst3GoiJqnWpUT0bn7MkMaH3T1mgM6f+vJz7cyCfbPC7QNP3opMiXHWZHxVS
	mfiECXwnEfoYrDJY2fVucZriTofidLXSEQc/MItFDxz+Mip538vwG1iwHuZ59fhPVfkarq0S+6Sy+
	5eClg7wSWdhqJn30b7TKT07MUYIgLLp9nwMtpMT0Hwu7DJdPTxCYNk7eRFzbDA7f+0upS8pX2BSaX
	wBPNDNLGg3VbSkUTRs3zVdLm+vp9CxFDBvkSu3X+20oHWTj7xhPpT5N5pChR+YCsqtjziRg+jyTmV
	CRKbDnqw==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pNMHM-004wig-1Y
	for linux-riscv@lists.infradead.org;
	Wed, 01 Feb 2023 23:12:48 +0000
Received: by mail-pj1-x102c.google.com with SMTP id t12-20020a17090aae0c00b00229f4cff534so4390463pjq.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 15:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KT5xATxquwHFSN7yZb29vP5DfgWelyL6nGymQqoc7PI=;
        b=5NjNrjmrxGbHdsrpDGepeoiWZ8PembhZK+1BePWGR9HGoJvVlH2qCI0kjmv4INqqV/
         wHdcPPxvsPlaIs6Mh/JhItcfElDD5ZusSGliYmMIhlCTaaEb48zO2MP6VxB5jYxaxf9H
         lRjr/7r6Nb1B7pDGmucQaXcdoucOYsjhATSmbA/DFKoA9HgL9pIiWSh5gEwDqcanRPsA
         6luINUNn6f1zuyqVf3FSUUSrlyBXSYZ709bSsDCAqEqEeszE+UlcDPu1VDPbcUeH89lH
         t4QztEvX0NjuWFBbEsZ6kStWsw47CuYViD3kBpbl5CQvo/1yqXy+FFsbLD8QpubiPQuN
         v51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KT5xATxquwHFSN7yZb29vP5DfgWelyL6nGymQqoc7PI=;
        b=IBkAAJCo2VYIGuXcMVgT1yZpFTLB4kuCpemteNpdRXcoHTt+6HqOwQYR8+bybJB6B3
         /KBM5zag2PGAvPQONwlgmNzWsUrtvlCD7yAs79N8TR9G6CMw9aEEXRN7xs6G5Gi+DQtn
         zNpf8/IciMDa6yODYkpQ2wwiXc4WJa2kEAkj2cLOAZP7084Z7eIN3DvUObYt3ZCpze9T
         5fKH1PqFODk4q6tvRI/EgOlU/J1//FJF9l7eNpxgaiYf8Vj/avdfzCxxWzDLNkPfWbxc
         KJbfa9Tyra3Syhevjs4gZCA++ixZxzAD2lJRHdr4f6k4CgO0tLtQkG8LAb//XLyWsTo6
         r8fQ==
X-Gm-Message-State: AO0yUKUKwIVVEHDFIp+CZPgF4WbdESXNmeb08erPTdRpEzK2vd9yS21q
	1s9AHhhAb9k7mxZQ93NOW0iBZw==
X-Google-Smtp-Source: AK7set8hzhfUXujshm3XAWgfY3O6wgMxhK78fMroLk0GqLgeqrYrGcVGaPZ+PPGHXRo4kXv5NeEgjg==
X-Received: by 2002:a17:90a:34b:b0:22c:6b8e:1ccb with SMTP id 11-20020a17090a034b00b0022c6b8e1ccbmr4206074pjf.21.1675293180229;
        Wed, 01 Feb 2023 15:13:00 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090a510300b0022bf0b0e1b7sm1861774pjh.10.2023.02.01.15.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 15:12:59 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 08/14] RISC-V: KVM: Add SBI PMU extension support
Date: Wed,  1 Feb 2023 15:12:44 -0800
Message-Id: <20230201231250.3806412-9-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201231250.3806412-1-atishp@rivosinc.com>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_231236_561183_7001245F 
X-CRM114-Status: GOOD (  19.34  )
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
 arch/riscv/kvm/vcpu_sbi_pmu.c | 85 +++++++++++++++++++++++++++++++++++
 3 files changed, 97 insertions(+), 1 deletion(-)
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
index 0000000..e028b0a
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -0,0 +1,85 @@
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
+	uint64_t temp;
+
+	/* Return not supported if PMU is not initialized */
+	if (!kvpmu->init_done)
+		return -EINVAL;
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
+		 * Forward the error to the user space because its an error happened
+		 * within host kernel. The other option would be convert this to
+		 * an SBI error and forward to the guest.
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
+unsigned long kvm_sbi_ext_pmu_probe(struct kvm_vcpu *vcpu)
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
