Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6660AC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 23:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TdumEVdjnH502GC94ybdB4xK5v5zqCbrvCv5D4vn6/8=; b=n/yzo1ZMsWDW46
	NRqHNL9z66K1bprNdnnoLh+p6Ucw4K4S9J3X+c53G7WwRhAjX3HSwbEVb09W9YWsq5ltztISeIqRX
	EsNEFY0jaxfqcJxir9qz9i2pT74OrTNoBlGNRiun4pktSxULaesHh+n+WGk3NciWewZppevG3pnqM
	ZwGphZSG5iWwmZ9t9qMjFQG/j/aR5bTtnxmhRs8Ap5lL1YtTwhZNUy5YtpUzPS7pFtdHIYDt6x/5G
	g//rfvegXvE73tHkcCOCVRcbRbnQMa1P+AKwYsQqykii0U4Gjy9XWGof3v0oY6IgIUYbfO9kb/C+D
	IXcPLqsSvCbW6e2U9m2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxyb-00000007Ja3-0bIv;
	Fri, 19 Apr 2024 23:49:05 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxxm-00000007Iqx-04i6
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 23:48:17 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1e455b630acso17499935ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 16:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713570490; x=1714175290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKTtbmGlTca3GDN90GmBspWSs6MvKTDAMqkt3K0sDb4=;
        b=qTFCMlZR1z5mx6YphEdzNsMMwBinIIjltlv1fZGhMWPS2utO8kB2PADT8oemVVrz8O
         WBaoAzE67Zt2zWRM8RWGfS5HJrIkng/AldbV1xhE/7cefKYdEex9DTI1F9EzN+u60mKw
         bvbSPg/EA98/rbtLErXSpcFxO6qQeslp+MKvXsH+M0iLnz5A95i6pyZmNqboC8gM6iHw
         awFNLVCVCOjiPS2jGpp0TCWqC6Inl1i9mSuCMjWHKJ0rc3vWuY4c+UbOSx6YFus9TL1Z
         XMrTypQcuDPxk5+qHUNW08SvO+PbcBISpZHERYcOPpeekwA1dB8GZjTegEGSSMYalT4p
         zT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713570490; x=1714175290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKTtbmGlTca3GDN90GmBspWSs6MvKTDAMqkt3K0sDb4=;
        b=Y92W2BJrf4ZNXtjxjPpyEVrPmuYVeqbDHEgqFTy3UdaTvzlbnnWb4qNJiCKgzyGGZ1
         lQnFUjT5JtO8FafRpw3GXa6N5/IlwKe6WmipqjQG4JNlrY7n8sxbcHZa3wSI8eCnlRWd
         JT3RzMCuzWHKiApFyM+EuO+wDoMzwGmeyCu08g4SqUBFxlX6uC7GWmBUT2JnG/9gJ1qw
         bu+DBrfGzdSaYiZxeDauXb6xH4WZ8rQR/0KtQJ+/gyXf4O7Q9dbFTm2qiDOA0Ul+rvWT
         fsuKFqLT03AEpKFc6bEdcLA2biaa1Za3S0CI+3VHlmW0SJmPm6/T06RWgI+LxYcca257
         8dqg==
X-Forwarded-Encrypted: i=1; AJvYcCX5gAd6C0eerSlUcqfyoHoeOWLKYsAKWe0muJe1UrYOx/grQQIoejb092peR4y+U6v9/Mu8yv9cW7OkxhB5IgUp20dFsYCMXYq5kiZgKXRz
X-Gm-Message-State: AOJu0YwJZKDOwChjagcstmJ7aKtjVPkLpcD1aRYFha75e9uoc4Lre5uc
	cUl0uE1hZhJB5nbTjwiZudGpC86/+/0wva/iTIXwo7nEh8QTQLceJH1llB4rvmY=
X-Google-Smtp-Source: AGHT+IHpOEj4FNwgzuHe+U6+OwtkD0xaw7owhTcaGk/1V85WXr/n5d3AhtIrQe93jf0iKzygwrzjxA==
X-Received: by 2002:a17:902:d510:b0:1e4:1873:843c with SMTP id b16-20020a170902d51000b001e41873843cmr4085453plg.62.1713570490496;
        Fri, 19 Apr 2024 16:48:10 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902d11100b001e42f215f33sm3924017plw.85.2024.04.19.16.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 16:48:10 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	samuel.holland@sifive.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v8 14/24] RISC-V: KVM: Add perf sampling support for guests
Date: Sat, 20 Apr 2024 08:17:30 -0700
Message-Id: <20240420151741.962500-15-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420151741.962500-1-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_164814_281966_51B4AD4E 
X-CRM114-Status: GOOD (  30.91  )
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

KVM enables perf for guest via counter virtualization. However, the
sampling can not be supported as there is no mechanism to enabled
trap/emulate scountovf in ISA yet. Rely on the SBI PMU snapshot
to provide the counter overflow data via the shared memory.

In case of sampling event, the host first sets the guest's LCOFI
interrupt and injects to the guest via irq filtering mechanism defined
in AIA specification. Thus, ssaia must be enabled in the host in order
to use perf sampling in the guest. No other AIA dependency w.r.t kernel
is required.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h          |  3 +-
 arch/riscv/include/asm/kvm_vcpu_pmu.h |  3 ++
 arch/riscv/include/uapi/asm/kvm.h     |  1 +
 arch/riscv/kvm/aia.c                  |  5 ++
 arch/riscv/kvm/vcpu.c                 | 15 ++++--
 arch/riscv/kvm/vcpu_onereg.c          |  6 +++
 arch/riscv/kvm/vcpu_pmu.c             | 68 +++++++++++++++++++++++++--
 7 files changed, 93 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 9d1b07932794..25966995da04 100644
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
index 77a1fc4d203d..257f17641e00 100644
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
index b1c503c2959c..e878e7cc3978 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -167,6 +167,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZFA,
 	KVM_RISCV_ISA_EXT_ZTSO,
 	KVM_RISCV_ISA_EXT_ZACAS,
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
index b5ca9f2e98ac..bb10771b2b18 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -365,6 +365,13 @@ void kvm_riscv_vcpu_sync_interrupts(struct kvm_vcpu *vcpu)
 		}
 	}
 
+	/* Sync up the HVIP.LCOFIP bit changes (only clear) by the guest */
+	if ((csr->hvip ^ hvip) & (1UL << IRQ_PMU_OVF)) {
+		if (!(hvip & (1UL << IRQ_PMU_OVF)) &&
+		    !test_and_set_bit(IRQ_PMU_OVF, v->irqs_pending_mask))
+			clear_bit(IRQ_PMU_OVF, v->irqs_pending);
+	}
+
 	/* Sync-up AIA high interrupts */
 	kvm_riscv_vcpu_aia_sync_interrupts(vcpu);
 
@@ -382,7 +389,8 @@ int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
 	if (irq < IRQ_LOCAL_MAX &&
 	    irq != IRQ_VS_SOFT &&
 	    irq != IRQ_VS_TIMER &&
-	    irq != IRQ_VS_EXT)
+	    irq != IRQ_VS_EXT &&
+	    irq != IRQ_PMU_OVF)
 		return -EINVAL;
 
 	set_bit(irq, vcpu->arch.irqs_pending);
@@ -397,14 +405,15 @@ int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
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
index 994adc26db4b..c676275ea0a0 100644
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
@@ -99,6 +100,9 @@ static bool kvm_riscv_vcpu_isa_enable_allowed(unsigned long ext)
 	switch (ext) {
 	case KVM_RISCV_ISA_EXT_H:
 		return false;
+	case KVM_RISCV_ISA_EXT_SSCOFPMF:
+		/* Sscofpmf depends on interrupt filtering defined in ssaia */
+		return __riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSAIA);
 	case KVM_RISCV_ISA_EXT_V:
 		return riscv_v_vstate_ctrl_user_allowed();
 	default:
@@ -116,6 +120,8 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_C:
 	case KVM_RISCV_ISA_EXT_I:
 	case KVM_RISCV_ISA_EXT_M:
+	/* There is not architectural config bit to disable sscofpmf completely */
+	case KVM_RISCV_ISA_EXT_SSCOFPMF:
 	case KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_RISCV_ISA_EXT_SVNAPOT:
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 2ebccd73680f..a801ed52dc9b 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -230,6 +230,47 @@ static int kvm_pmu_validate_counter_mask(struct kvm_pmu *kvpmu, unsigned long ct
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
@@ -249,7 +290,7 @@ static long kvm_pmu_create_perf_event(struct kvm_pmc *pmc, struct perf_event_att
 	 */
 	attr->sample_period = kvm_pmu_get_sample_period(pmc);
 
-	event = perf_event_create_kernel_counter(attr, -1, current, NULL, pmc);
+	event = perf_event_create_kernel_counter(attr, -1, current, kvm_riscv_pmu_overflow, pmc);
 	if (IS_ERR(event)) {
 		pr_err("kvm pmu event creation failed for eidx %lx: %ld\n", eidx, PTR_ERR(event));
 		return PTR_ERR(event);
@@ -443,6 +484,8 @@ int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 		pmc_index = i + ctr_base;
 		if (!test_bit(pmc_index, kvpmu->pmc_in_use))
 			continue;
+		/* The guest started the counter again. Reset the overflow status */
+		clear_bit(pmc_index, kvpmu->pmc_overflown);
 		pmc = &kvpmu->pmc[pmc_index];
 		if (flags & SBI_PMU_START_FLAG_SET_INIT_VALUE) {
 			pmc->counter_val = ival;
@@ -546,7 +589,13 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
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
+				kvpmu->sdata->ctr_overflow_mask |= BIT(i);
 			kvpmu->sdata->ctr_values[i] = pmc->counter_val;
 			shmem_needs_update = true;
 		}
@@ -554,6 +603,15 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 		if (flags & SBI_PMU_STOP_FLAG_RESET) {
 			pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
 			clear_bit(pmc_index, kvpmu->pmc_in_use);
+			clear_bit(pmc_index, kvpmu->pmc_overflown);
+			if (snap_flag_set) {
+				/*
+				 * Only clear the given counter as the caller is responsible to
+				 * validate both the overflow mask and configured counters.
+				 */
+				kvpmu->sdata->ctr_overflow_mask &= ~BIT(i);
+				shmem_needs_update = true;
+			}
 		}
 	}
 
@@ -703,6 +761,7 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 		pmc = &kvpmu->pmc[i];
 		pmc->idx = i;
 		pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
+		pmc->vcpu = vcpu;
 		if (i < kvpmu->num_hw_ctrs) {
 			pmc->cinfo.type = SBI_PMU_CTR_TYPE_HW;
 			if (i < 3)
@@ -735,13 +794,14 @@ void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
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
