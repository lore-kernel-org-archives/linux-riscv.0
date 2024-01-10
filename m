Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E62DC47073
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 23:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6c9ZFus8/YMaBhTnrcI9SjmhGcuYhorpO1/u4ke8FqY=; b=o0nKYIkrp2uB8S
	Hj4FSm5/WXdIcVjk06VaAGacuRuUB3fH1/YtZoqJSdjemcTf7CzVDxyZBEj97yuRbkF3ZQU3LjYrl
	intjul0NOjNoeusucKZe0LYzppBoqvNGofWoCW61iOnsyM1EEX2La12ZkwMZn84MVUmChVbqvdYly
	5HcF9qy2ZiK3+Cy7D+kHiI6y80MPu88gKINCX+35GOjHZ/79ND7gJVnjjxdhTRfAR8asxtMN6abep
	lzJ2KQN+78R/uQDxaoFmAPKLkl7wT55/CfFCFtUrLAdmKf7jpcjoBr7rzSC4/9oOgCNX9ii4KJe/x
	hqTmwgOdpXTuC1Juhcqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNhmr-00Edo5-1K;
	Wed, 10 Jan 2024 23:15:05 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNhmf-00EdXu-2g
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 23:14:58 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7bef44df5c6so38425739f.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 15:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704928491; x=1705533291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWlgYeXsuNgCyW020s2adM6IRYxW5Wo3bqNd72j3CD8=;
        b=QiFbRd9V9ihAV3zSvY5aCkJXJMN4r/4TT+U6+LiiPTlDFTIbPOS/fTwjWvcbBvt4tr
         9ZlU4RYH+euATBuSMNcqS76tFVwfOzD6fE4UmeBHS2ycHXVfgvs6aZsQbY3w+pgkaAlM
         dJLtGsJBS/bWP2CU3hHngVdYe6Z0+WOzVSQsHcTGKjPCemkVtDZLmXpxkASA9CezhKEC
         VsLxiNF4EWPPw5KdgNX4UpYcle3OFvHoSDGCLv5qP/EKMEOHM0aZnLj1wAOvyvhF1esO
         gKn3tkYJHATY/9VohLsFSpur6Jj52dJoRHFQ7SU8gWxDdblJ57j3Av0rK4c2wwc+KYFN
         hgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704928491; x=1705533291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWlgYeXsuNgCyW020s2adM6IRYxW5Wo3bqNd72j3CD8=;
        b=NT2zrFXsLeFPZyRp/lzzobB3cC7rg2oSdrHZvaoYxp+Uu6SmhN6uxFGTznanPa46cY
         HqSuezTk6zEXG4AmOYrk9TfUvTA9OqpT2tpBYDFPmMfbJb2WpSbCm5qGlwPZAWLZ/w5b
         8d/cfCdG1V9wdeWHWriIosxLDGu2J0sVc5R5vameZ3Mwa/hg4MtS/FCXbCJLl4Y/Lc9L
         KKF+wxtFZpE4cFOTFd/zY6Zzj7UPw9XlBsxrWiHf8UnNeZFasz8Up3sN+UNKZ/+zEnr+
         b8KsuCwxlmFhUis0YBDEadlZsY1h3KYBCc1bVYk304mmpC3KPigm7WCj9lHV4LzzNVdI
         Xsgw==
X-Gm-Message-State: AOJu0YyGbPY7fhd5VABMMWE5F9UMUOLXRCxUaGZupOo6fmpH0gu8Ynpp
	JWK339kMWBRIHiTU4xcNKCD4aYK4Hxje2A==
X-Google-Smtp-Source: AGHT+IEPb09LsphlDq1Rk8zGKNQaGPFqSiA8IfRYfePxNk48f+I1mTYlmenfwuqtcwnKtflOaUT0Xg==
X-Received: by 2002:a05:6e02:1d8c:b0:35f:bea3:bd00 with SMTP id h12-20020a056e021d8c00b0035fbea3bd00mr751045ila.14.1704928491538;
        Wed, 10 Jan 2024 15:14:51 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id co13-20020a0566383e0d00b0046e3b925818sm1185503jab.37.2024.01.10.15.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 15:14:51 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [v3 09/10] RISC-V: KVM: Add perf sampling support for guests
Date: Wed, 10 Jan 2024 15:13:58 -0800
Message-Id: <20240110231359.1239367-10-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110231359.1239367-1-atishp@rivosinc.com>
References: <20240110231359.1239367-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_151453_957025_E706D69D 
X-CRM114-Status: GOOD (  31.16  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Vladimir Isaev <vladimir.isaev@syntacore.com>, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
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

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h          |  3 +-
 arch/riscv/include/asm/kvm_vcpu_pmu.h |  3 ++
 arch/riscv/include/uapi/asm/kvm.h     |  1 +
 arch/riscv/kvm/aia.c                  |  5 ++
 arch/riscv/kvm/vcpu.c                 |  8 +--
 arch/riscv/kvm/vcpu_onereg.c          |  9 +++-
 arch/riscv/kvm/vcpu_pmu.c             | 70 +++++++++++++++++++++++++--
 7 files changed, 89 insertions(+), 10 deletions(-)

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
diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index 586bab84be35..8cb21a4f862c 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -36,6 +36,7 @@ struct kvm_pmc {
 	bool started;
 	/* Monitoring event ID */
 	unsigned long event_idx;
+	struct kvm_vcpu *vcpu;
 };
 
 /* PMU data structure per vcpu */
@@ -50,6 +51,8 @@ struct kvm_pmu {
 	bool init_done;
 	/* Bit map of all the virtual counter used */
 	DECLARE_BITMAP(pmc_in_use, RISCV_KVM_MAX_COUNTERS);
+	/* Bit map of all the virtual counter overflown */
+	DECLARE_BITMAP(pmc_overflown, RISCV_KVM_MAX_COUNTERS);
 	/* The address of the counter snapshot area (guest physical address) */
 	gpa_t snapshot_addr;
 	/* The actual data of the snapshot */
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index d6b7a5b95874..d5aea43bc797 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -139,6 +139,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZIHPM,
 	KVM_RISCV_ISA_EXT_SMSTATEEN,
 	KVM_RISCV_ISA_EXT_ZICOND,
+	KVM_RISCV_ISA_EXT_SSCOFPMF,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index a944294f6f23..0f0a9d11bb5f 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -545,6 +545,9 @@ void kvm_riscv_aia_enable(void)
 	enable_percpu_irq(hgei_parent_irq,
 			  irq_get_trigger_type(hgei_parent_irq));
 	csr_set(CSR_HIE, BIT(IRQ_S_GEXT));
+	/* Enable IRQ filtering for overflow interrupt only if sscofpmf is present */
+	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSCOFPMF))
+		csr_write(CSR_HVIEN, BIT(IRQ_PMU_OVF));
 }
 
 void kvm_riscv_aia_disable(void)
@@ -558,6 +561,8 @@ void kvm_riscv_aia_disable(void)
 		return;
 	hgctrl = get_cpu_ptr(&aia_hgei);
 
+	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSCOFPMF))
+		csr_clear(CSR_HVIEN, BIT(IRQ_PMU_OVF));
 	/* Disable per-CPU SGEI interrupt */
 	csr_clear(CSR_HIE, BIT(IRQ_S_GEXT));
 	disable_percpu_irq(hgei_parent_irq);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b5ca9f2e98ac..f83f0226439f 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -382,7 +382,8 @@ int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
 	if (irq < IRQ_LOCAL_MAX &&
 	    irq != IRQ_VS_SOFT &&
 	    irq != IRQ_VS_TIMER &&
-	    irq != IRQ_VS_EXT)
+	    irq != IRQ_VS_EXT &&
+	    irq != IRQ_PMU_OVF)
 		return -EINVAL;
 
 	set_bit(irq, vcpu->arch.irqs_pending);
@@ -397,14 +398,15 @@ int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
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
index fc34557f5356..1eaaa919aa61 100644
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
@@ -88,6 +89,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_I:
 	case KVM_RISCV_ISA_EXT_M:
 	case KVM_RISCV_ISA_EXT_SSTC:
+	case KVM_RISCV_ISA_EXT_SSCOFPMF:
 	case KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_RISCV_ISA_EXT_ZBA:
@@ -117,8 +119,13 @@ void kvm_riscv_vcpu_setup_isa(struct kvm_vcpu *vcpu)
 	for (i = 0; i < ARRAY_SIZE(kvm_isa_ext_arr); i++) {
 		host_isa = kvm_isa_ext_arr[i];
 		if (__riscv_isa_extension_available(NULL, host_isa) &&
-		    kvm_riscv_vcpu_isa_enable_allowed(i))
+		    kvm_riscv_vcpu_isa_enable_allowed(i)) {
+			/* Sscofpmf depends on interrupt filtering defined in ssaia */
+			if (host_isa == RISCV_ISA_EXT_SSCOFPMF &&
+			    !__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSAIA))
+				continue;
 			set_bit(host_isa, vcpu->arch.isa);
+		}
 	}
 }
 
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index b3112c23ad33..063e11685340 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -229,6 +229,47 @@ static int kvm_pmu_validate_counter_mask(struct kvm_pmu *kvpmu, unsigned long ct
 	return 0;
 }
 
+static void kvm_riscv_pmu_overflow(struct perf_event *perf_event,
+				   struct perf_sample_data *data,
+				   struct pt_regs *regs)
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
+	 * Thus, the host may continue to interrupt and inject it to the guest
+	 * even without the guest configuring the next event. Depending on the hardware
+	 * the host may have some sluggishness only if privilege mode filtering is not
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
 static long kvm_pmu_create_perf_event(struct kvm_pmc *pmc, struct perf_event_attr *attr,
 				      unsigned long flags, unsigned long eidx,
 				      unsigned long evtdata)
@@ -248,7 +289,7 @@ static long kvm_pmu_create_perf_event(struct kvm_pmc *pmc, struct perf_event_att
 	 */
 	attr->sample_period = kvm_pmu_get_sample_period(pmc);
 
-	event = perf_event_create_kernel_counter(attr, -1, current, NULL, pmc);
+	event = perf_event_create_kernel_counter(attr, -1, current, kvm_riscv_pmu_overflow, pmc);
 	if (IS_ERR(event)) {
 		pr_err("kvm pmu event creation failed for eidx %lx: %ld\n", eidx, PTR_ERR(event));
 		return PTR_ERR(event);
@@ -473,6 +514,12 @@ int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
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
 
@@ -539,7 +586,13 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 			else if (pmc->perf_event)
 				pmc->counter_val += perf_event_read_value(pmc->perf_event,
 									  &enabled, &running);
-			/* TODO: Add counter overflow support when sscofpmf support is added */
+			/*
+			 * The counter and overflow indicies in the snapshot region are w.r.to
+			 * cbase. Modify the set bit in the counter mask instead of the pmc_index
+			 * which indicates the absolute counter index.
+			 */
+			if (test_bit(pmc_index, kvpmu->pmc_overflown))
+				kvpmu->sdata->ctr_overflow_mask |= (1UL << i);
 			kvpmu->sdata->ctr_values[i] = pmc->counter_val;
 			kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
 					     sizeof(struct riscv_pmu_snapshot_data));
@@ -548,15 +601,20 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 		if (flags & SBI_PMU_STOP_FLAG_RESET) {
 			pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
 			clear_bit(pmc_index, kvpmu->pmc_in_use);
+			clear_bit(pmc_index, kvpmu->pmc_overflown);
 			if (snap_flag_set) {
 				/* Clear the snapshot area for the upcoming deletion event */
 				kvpmu->sdata->ctr_values[i] = 0;
+				/*
+				 * Only clear the given counter as the caller is responsible to
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
 
@@ -699,6 +757,7 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 		pmc = &kvpmu->pmc[i];
 		pmc->idx = i;
 		pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
+		pmc->vcpu = vcpu;
 		if (i < kvpmu->num_hw_ctrs) {
 			pmc->cinfo.type = SBI_PMU_CTR_TYPE_HW;
 			if (i < 3)
@@ -731,13 +790,14 @@ void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
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
 	kvm_pmu_clear_snapshot_area(vcpu);
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
