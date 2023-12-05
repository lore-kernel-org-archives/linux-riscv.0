Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C45C10F04
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 02:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oCxdkCWi0jLIuAU8coU5Y8nlTV7NizLReY/uSWhgCR0=; b=GhXtoPQCK6d+EH
	oEfJudiX5Xiel3MtykrYrgwlcZdInNZipjdGRzn+CmwjVCYs+W1Z50QE6ZvDixC9BEKB20AUJyYOA
	QsyLeIpVGM942PRcLfaMpf/6O2ia9TJDUrvHvlh/5t7cIyH5lzS0GH/W/tGoK79Up555ecTVc4Zff
	eGOgqJxyVLWK/Fk78YUiVXUPHR/XJeg7wZaVPb3RIQRjZlq5BEYfEdWiQIbcg2RdKkF7ZPnQXc58b
	wDwosTs0Crgvkpe3hE9jDLAIpS50yJLo+GD2Eagehb8AlZmP7qJGp/5BnNI5nE+Baghg64RYV4FRG
	klCw2Uyk7LIfJGWJhQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rALPe-0064BJ-1m;
	Tue, 05 Dec 2023 02:43:54 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rALPW-006421-1Q
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 02:43:50 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6d880219f01so975122a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 18:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701744226; x=1702349026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUFFL9WHJXhpyF2jxsBVxmfmjltHCrCzHnKko1KoPMA=;
        b=lW0cury5NK3gS4l3MiIzoyNqecseUU0Id/dEm1FHsJr6IYe+7eB2NRk+0s++VLPumR
         VBydwxIMLlABNAZrtJsF7yvFA56B8kRRb9n+geKrZER/IZ18nYMk5Hz6EqQFqCX6YUEa
         W/REG3qrZb4DJ1dzPUv2cRF6NBWIBDL//8MiOtbJa2NF9uj/nF+bV1t37XHKzXEcJY/p
         m/2K9RmODIrTOR6DMXzytz8udd+AXYlPN7oMJouoWhsip+T4rfkVIpbtC6M0Gd3rwCDr
         QbBTgkuatoXanAbs+zfbUis8ttpX6ukMhgh6MuXqFoO0umcZT+ltrTwI7GJeS9jLpAYL
         m+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701744226; x=1702349026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUFFL9WHJXhpyF2jxsBVxmfmjltHCrCzHnKko1KoPMA=;
        b=loe13xyHJja4vfEoZ20yIxeg5boOPS6ZgcItwZhnor9FCp9jHPyxU+Jwy175Jcjaid
         EHPYvEuoidIxd71/OEGGiZQnT6TOZ90FLwEKcH2PTqYFPGf8l2Xf234v8Ch1u2Zc/kqX
         nc8+N5UhiNJhs0gt/+eIOxvGTeVTYjq2qAhaj9HjQdu0J6ME2F7fBeuFOGoCW5KLod8I
         4fJqhK0AYxBAaKiaf0yT0X7rmlb7XUDjIkuma+GXYXO4BDesUINsECJZsd6cFs6bL3b7
         H3FgAXTuVlFdWC1e94yuasCsWIW2Vt8+JV82AsPcOb6gMoMb98fna4gTe6De90UfnFiB
         xgGQ==
X-Gm-Message-State: AOJu0Ywey+8wkXRy5PvcJgkBy+KdCQEKX1+Yod0a45Urx1CWdB9o8ry3
	0az+FhcXZiZazSRJkAsi6r9i/g==
X-Google-Smtp-Source: AGHT+IEMmstOAFiJ8gg3Y0WTozLtdyFTXZCkTRoGOpB7jPiJ5WttcikKExLkiwyI+BGtCWCySc1/+g==
X-Received: by 2002:a05:6830:1183:b0:6d8:74e2:94f6 with SMTP id u3-20020a056830118300b006d874e294f6mr2396699otq.60.1701744225782;
        Mon, 04 Dec 2023 18:43:45 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z17-20020a9d62d1000000b006b9848f8aa7sm2157655otk.45.2023.12.04.18.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 18:43:45 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC 8/9] RISC-V: KVM: Add perf sampling support for guests
Date: Mon,  4 Dec 2023 18:43:09 -0800
Message-Id: <20231205024310.1593100-9-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205024310.1593100-1-atishp@rivosinc.com>
References: <20231205024310.1593100-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_184346_793705_E8FCDBA9 
X-CRM114-Status: GOOD (  26.11  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

KVM enables perf for guest via counter virtualization. However, the
sampling can not be supported as there is no mechanism to enabled
trap/emulate scountovf in ISA yet. Rely on the SBI PMU snapshot
to provide the counter overflow data via the shared memory.

In case of sampling event, the host first guest the LCOFI interrupt
and injects to the guest via irq filtering mechanism defined in AIA
specification. Thus, ssaia must be enabled in the host in order to
use perf sampling in the guest. No other AIA dpeendancy w.r.t kernel
is required.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h      |  3 +-
 arch/riscv/include/uapi/asm/kvm.h |  1 +
 arch/riscv/kvm/main.c             |  1 +
 arch/riscv/kvm/vcpu.c             |  8 ++--
 arch/riscv/kvm/vcpu_onereg.c      |  1 +
 arch/riscv/kvm/vcpu_pmu.c         | 69 ++++++++++++++++++++++++++++---
 6 files changed, 73 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 88cdc8a3e654..bec09b33e2f0 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -168,7 +168,8 @@
 #define VSIP_TO_HVIP_SHIFT	(IRQ_VS_SOFT - IRQ_S_SOFT)
 #define VSIP_VALID_MASK		((_AC(1, UL) << IRQ_S_SOFT) | \
 				 (_AC(1, UL) << IRQ_S_TIMER) | \
-				 (_AC(1, UL) << IRQ_S_EXT))
+				 (_AC(1, UL) << IRQ_S_EXT) | \
+				 (_AC(1, UL) << IRQ_PMU_OVF))
 
 /* AIA CSR bits */
 #define TOPI_IID_SHIFT		16
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 60d3b21dead7..741c16f4518e 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -139,6 +139,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZIHPM,
 	KVM_RISCV_ISA_EXT_SMSTATEEN,
 	KVM_RISCV_ISA_EXT_ZICOND,
+	KVM_RISCV_ISA_EXT_SSCOFPMF,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 225a435d9c9a..5a3a4cee0e3d 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -43,6 +43,7 @@ int kvm_arch_hardware_enable(void)
 	csr_write(CSR_HCOUNTEREN, 0x02);
 
 	csr_write(CSR_HVIP, 0);
+	csr_write(CSR_HVIEN, 1UL << IRQ_PMU_OVF);
 
 	kvm_riscv_aia_enable();
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e087c809073c..2d9f252356c3 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -380,7 +380,8 @@ int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
 	if (irq < IRQ_LOCAL_MAX &&
 	    irq != IRQ_VS_SOFT &&
 	    irq != IRQ_VS_TIMER &&
-	    irq != IRQ_VS_EXT)
+	    irq != IRQ_VS_EXT &&
+	    irq != IRQ_PMU_OVF)
 		return -EINVAL;
 
 	set_bit(irq, vcpu->arch.irqs_pending);
@@ -395,14 +396,15 @@ int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
 int kvm_riscv_vcpu_unset_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
 {
 	/*
-	 * We only allow VS-mode software, timer, and external
+	 * We only allow VS-mode software, timer, counter overflow and external
 	 * interrupts when irq is one of the local interrupts
 	 * defined by RISC-V privilege specification.
 	 */
 	if (irq < IRQ_LOCAL_MAX &&
 	    irq != IRQ_VS_SOFT &&
 	    irq != IRQ_VS_TIMER &&
-	    irq != IRQ_VS_EXT)
+	    irq != IRQ_VS_EXT &&
+	    irq != IRQ_PMU_OVF)
 		return -EINVAL;
 
 	clear_bit(irq, vcpu->arch.irqs_pending);
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index f8c9fa0c03c5..19a0e4eaf0df 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -36,6 +36,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	/* Multi letter extensions (alphabetically sorted) */
 	KVM_ISA_EXT_ARR(SMSTATEEN),
 	KVM_ISA_EXT_ARR(SSAIA),
+	KVM_ISA_EXT_ARR(SSCOFPMF),
 	KVM_ISA_EXT_ARR(SSTC),
 	KVM_ISA_EXT_ARR(SVINVAL),
 	KVM_ISA_EXT_ARR(SVNAPOT),
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 622c4ee89e7b..86c8e92f92d3 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -229,6 +229,47 @@ static int kvm_pmu_validate_counter_mask(struct kvm_pmu *kvpmu, unsigned long ct
 	return 0;
 }
 
+static void kvm_riscv_pmu_overflow(struct perf_event *perf_event,
+				  struct perf_sample_data *data,
+				  struct pt_regs *regs)
+{
+	struct kvm_pmc *pmc = perf_event->overflow_handler_context;
+	struct kvm_vcpu *vcpu = pmc->vcpu;
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	struct riscv_pmu *rpmu = to_riscv_pmu(perf_event->pmu);
+	u64 period;
+
+	/*
+	 * Stop the event counting by directly accessing the perf_event.
+	 * Otherwise, this needs to deferred via a workqueue.
+	 * That will introduce skew in the counter value because the actual
+	 * physical counter would start after returning from this function.
+	 * It will be stopped again once the workqueue is scheduled
+	 */
+	rpmu->pmu.stop(perf_event, PERF_EF_UPDATE);
+
+	/*
+	 * The hw counter would start automatically when this function returns.
+	 * Thus, the host may continue to interrupts and inject it to the guest
+	 * even without guest configuring the next event. Depending on the hardware
+	 * the host may some sluggishness only if privilege mode filtering is not
+	 * available. In an ideal world, where qemu is not the only capable hardware,
+	 * this can be removed.
+	 * FYI: ARM64 does this way while x86 doesn't do anything as such.
+	 * TODO: Should we keep it for RISC-V ?
+	 */
+	period = -(local64_read(&perf_event->count));
+
+	local64_set(&perf_event->hw.period_left, 0);
+	perf_event->attr.sample_period = period;
+	perf_event->hw.sample_period = period;
+
+	set_bit(pmc->idx, kvpmu->pmc_overflown);
+	kvm_riscv_vcpu_set_interrupt(vcpu, IRQ_PMU_OVF);
+
+	rpmu->pmu.start(perf_event, PERF_EF_RELOAD);
+}
+
 static int kvm_pmu_create_perf_event(struct kvm_pmc *pmc, struct perf_event_attr *attr,
 				     unsigned long flags, unsigned long eidx, unsigned long evtdata)
 {
@@ -247,7 +288,7 @@ static int kvm_pmu_create_perf_event(struct kvm_pmc *pmc, struct perf_event_attr
 	 */
 	attr->sample_period = kvm_pmu_get_sample_period(pmc);
 
-	event = perf_event_create_kernel_counter(attr, -1, current, NULL, pmc);
+	event = perf_event_create_kernel_counter(attr, -1, current, kvm_riscv_pmu_overflow, pmc);
 	if (IS_ERR(event)) {
 		pr_err("kvm pmu event creation failed for eidx %lx: %ld\n", eidx, PTR_ERR(event));
 		return PTR_ERR(event);
@@ -466,6 +507,12 @@ int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 		}
 	}
 
+	/* The guest have serviced the interrupt and starting the counter again */
+	if (test_bit(IRQ_PMU_OVF, vcpu->arch.irqs_pending)) {
+		clear_bit(pmc_index, kvpmu->pmc_overflown);
+		kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_PMU_OVF);
+	}
+
 out:
 	retdata->err_val = sbiret;
 
@@ -537,7 +584,12 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 		}
 
 		if (bSnapshot && !sbiret) {
-			//TODO: Add counter overflow support when sscofpmf support is added
+			/* The counter and overflow indicies in the snapshot region are w.r.to
+			 * cbase. Modify the set bit in the counter mask instead of the pmc_index
+			 * which indicates the absolute counter index.
+			 */
+			if (test_bit(pmc_index, kvpmu->pmc_overflown))
+				kvpmu->sdata->ctr_overflow_mask |= (1UL << i);
 			kvpmu->sdata->ctr_values[i] = pmc->counter_val;
 			kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
 					     sizeof(struct riscv_pmu_snapshot_data));
@@ -546,15 +598,19 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 		if (flags & SBI_PMU_STOP_FLAG_RESET) {
 			pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
 			clear_bit(pmc_index, kvpmu->pmc_in_use);
+			clear_bit(pmc_index, kvpmu->pmc_overflown);
 			if (bSnapshot) {
 				/* Clear the snapshot area for the upcoming deletion event */
 				kvpmu->sdata->ctr_values[i] = 0;
+				/* Only clear the given counter as the caller is responsible to
+				 * validate both the overflow mask and configured counters.
+				 */
+				kvpmu->sdata->ctr_overflow_mask &= ~(1UL << i);
 				kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
 						     sizeof(struct riscv_pmu_snapshot_data));
 			}
 		}
 	}
-
 out:
 	retdata->err_val = sbiret;
 
@@ -729,15 +785,16 @@ void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
 	if (!kvpmu)
 		return;
 
-	for_each_set_bit(i, kvpmu->pmc_in_use, RISCV_MAX_COUNTERS) {
+	for_each_set_bit(i, kvpmu->pmc_in_use, RISCV_KVM_MAX_COUNTERS) {
 		pmc = &kvpmu->pmc[i];
 		pmc->counter_val = 0;
 		kvm_pmu_release_perf_event(pmc);
 		pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
 	}
-	bitmap_zero(kvpmu->pmc_in_use, RISCV_MAX_COUNTERS);
+	bitmap_zero(kvpmu->pmc_in_use, RISCV_KVM_MAX_COUNTERS);
+	bitmap_zero(kvpmu->pmc_overflown, RISCV_KVM_MAX_COUNTERS);
 	memset(&kvpmu->fw_event, 0, SBI_PMU_FW_MAX * sizeof(struct kvm_fw_event));
-	kvpmu->snapshot_addr = INVALID_GPA;
+	kvm_pmu_clear_snapshot_area(vcpu);
 }
 
 void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
