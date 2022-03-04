Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84D6C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 20:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOipk+4w3ZqXfwAdFnYAWUU9brlMLHTW+RJzvmdMZRw=; b=YBpMrhx+ZD5eCJ
	Msk1dcqkDGNF5nU8Yw7gSkbMgppBZAg6FUyM5YtJkccZwoXevKwHgtR3oqELJLnLFJp3tnIe2rr1c
	JN/kdpafOAprAEdT4qVGezun0jzai9BgzyZdl+O6KXnIV4vGXUcOTDh+jsMZ8Qqdfqr3yupfEiPjM
	gl9bio5TnNtvzuv2khZM4XZZ+0GhtXpBHRp6rGaizB0Uk7TZHOw3+X3jxSO3uoDVdleyDRcQ9JdMA
	V7EFOlEDtI214XdV/ErTTDOf7QRQGbrZXW/Vh97r8XbxsqMW/6i793n/F7J7V/cqu3dcL6tQjyP4E
	SF7FuP/iXPD7wHSFb4Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQEGd-00BtXd-CW; Fri, 04 Mar 2022 20:11:11 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQEGJ-00BtF2-T3
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 20:10:55 +0000
Received: by mail-qt1-x836.google.com with SMTP id s15so8367474qtk.10
 for <linux-riscv@lists.infradead.org>; Fri, 04 Mar 2022 12:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L51YRqAFrRt3gsxpEsaQpEo6O6Me/Tnsaqxdxx3Jl7c=;
 b=4eof9vIa/d6JqWuLNTaKiN/PrUkL783d6CCn3/pUhV6FSDGx+QxWSw3F4SYWH7epnf
 rS3GyBOOUn3lFUemonsCilsMAuQzJbtwoNJhKGa4+3y57/ngZki6wA/ol8RmnooOpux/
 WsLCpIX68ygFaRFvyG5fGa/H2z42Lmb2lyM9YDr+hBonFY0CzxpN1BZbJ//3tyVtShCL
 EJgOk8B2nKhB1QN2GNY1Jnxhapgm372lCximzTAw2BLYxV+J/Svzx3ooMy8zmdMyzxQ9
 eLl0zB5ctgkLdzSyUIy1Jy53gs0xn2MRygQauroS1JODqa96yG+G3tcQqXHiRBaU/pK7
 fBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L51YRqAFrRt3gsxpEsaQpEo6O6Me/Tnsaqxdxx3Jl7c=;
 b=qT4llq8uA+XQjRD0cF9Q3rroVHtcCeT4spCMj3glSIhTfC4msfMXY+asWVv7DqnEz7
 VLjhS6r8OA/W6Mia2v/H7H8ecsqgOo3a7mWYJnmPeH+v965+m9X2XBsn5B9ArHXN8AaJ
 5N/OIGHcUeeO9xkfC8Q2+/08ejdNSyLNHUfrZpNsbvdE3olrL2BoYpSIjf7JrC0ipqGs
 nM36xt5ej9aAsk3uhOYt9B5ktHN8VMTpLKjKUzgV3CSWa2g7VOi3sfdCFZY78l/+8oKW
 izGn8ewmgHD5yD/QenksEuR/UydLNL0XBpk6mKdR8MU7TbXgic0MiKdECTq7jzwlY89M
 C7jA==
X-Gm-Message-State: AOAM531hkPHR/c/N0WtCCJVDhMUKX3A4NBTsqz/eTpW5eXzcqC3t9av/
 hMzfmc+v2a5lDYrE1R3g5nb85A==
X-Google-Smtp-Source: ABdhPJzXnidy0NB75gUwHIVSkZRVeRst/1zieIZpV1fgsGvQbDm4p2FbHJlV02Cn81qtkFokiEkN9g==
X-Received: by 2002:ac8:7d42:0:b0:2de:4d3b:11cf with SMTP id
 h2-20020ac87d42000000b002de4d3b11cfmr368624qtb.415.1646424651107; 
 Fri, 04 Mar 2022 12:10:51 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 20-20020ac84e94000000b002de8f564305sm4605481qtp.1.2022.03.04.12.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 12:10:50 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH v2 7/7] RISC-V: KVM: Support sstc extension
Date: Fri,  4 Mar 2022 12:10:20 -0800
Message-Id: <20220304201020.810380-8-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304201020.810380-1-atishp@rivosinc.com>
References: <20220304201020.810380-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_121052_004322_B0ADE202 
X-CRM114-Status: GOOD (  19.40  )
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

Sstc extension allows the guest to program the vstimecmp CSR directly
instead of making an SBI call to the hypervisor to program the next
event. The timer interrupt is also directly injected to the guest by
the hardware in this case. To maintain backward compatibility, the
hypervisors also update the vstimecmp in an SBI set_time call if
the hardware supports it. Thus, the older kernels in guest also
take advantage of the sstc extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_host.h       |   1 +
 arch/riscv/include/asm/kvm_vcpu_timer.h |   8 +-
 arch/riscv/include/uapi/asm/kvm.h       |   1 +
 arch/riscv/kvm/main.c                   |  12 ++-
 arch/riscv/kvm/vcpu.c                   |   4 +-
 arch/riscv/kvm/vcpu_timer.c             | 138 +++++++++++++++++++++++-
 6 files changed, 158 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 99ef6a120617..2ed93cdb334f 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -135,6 +135,7 @@ struct kvm_vcpu_csr {
 	unsigned long hvip;
 	unsigned long vsatp;
 	unsigned long scounteren;
+	u64 vstimecmp;
 };
 
 struct kvm_vcpu_arch {
diff --git a/arch/riscv/include/asm/kvm_vcpu_timer.h b/arch/riscv/include/asm/kvm_vcpu_timer.h
index 375281eb49e0..a24a265f3ccb 100644
--- a/arch/riscv/include/asm/kvm_vcpu_timer.h
+++ b/arch/riscv/include/asm/kvm_vcpu_timer.h
@@ -28,6 +28,11 @@ struct kvm_vcpu_timer {
 	u64 next_cycles;
 	/* Underlying hrtimer instance */
 	struct hrtimer hrt;
+
+	/* Flag to check if sstc is enabled or not */
+	bool sstc_enabled;
+	/* A function pointer to switch between stimecmp or hrtimer at runtime */
+	int (*timer_next_event)(struct kvm_vcpu *vcpu, u64 ncycles);
 };
 
 int kvm_riscv_vcpu_timer_next_event(struct kvm_vcpu *vcpu, u64 ncycles);
@@ -39,6 +44,7 @@ int kvm_riscv_vcpu_timer_init(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_timer_deinit(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_timer_reset(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu);
 int kvm_riscv_guest_timer_init(struct kvm *kvm);
-
+bool kvm_riscv_vcpu_timer_pending(struct kvm_vcpu *vcpu);
 #endif
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 92bd469e2ba6..d2f02ba1947a 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -96,6 +96,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_H,
 	KVM_RISCV_ISA_EXT_I,
 	KVM_RISCV_ISA_EXT_M,
+	KVM_RISCV_ISA_EXT_SSTC,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 2e5ca43c8c49..83c4db7fc35f 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -32,7 +32,7 @@ int kvm_arch_hardware_setup(void *opaque)
 
 int kvm_arch_hardware_enable(void)
 {
-	unsigned long hideleg, hedeleg;
+	unsigned long hideleg, hedeleg, henvcfg;
 
 	hedeleg = 0;
 	hedeleg |= (1UL << EXC_INST_MISALIGNED);
@@ -51,6 +51,16 @@ int kvm_arch_hardware_enable(void)
 
 	csr_write(CSR_HCOUNTEREN, -1UL);
 
+	if (riscv_isa_extension_available(NULL, SSTC)) {
+#ifdef CONFIG_64BIT
+		henvcfg = csr_read(CSR_HENVCFG);
+		csr_write(CSR_HENVCFG, henvcfg | 1UL<<HENVCFG_STCE);
+#else
+		henvcfg = csr_read(CSR_HENVCFGH);
+		csr_write(CSR_HENVCFGH, henvcfg | 1UL<<HENVCFGH_STCE);
+#endif
+	}
+
 	csr_write(CSR_HVIP, 0);
 
 	return 0;
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index a3ae7042c696..f7c08a182e3a 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -143,7 +143,7 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 
 int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
 {
-	return kvm_riscv_vcpu_has_interrupts(vcpu, 1UL << IRQ_VS_TIMER);
+	return kvm_riscv_vcpu_timer_pending(vcpu);
 }
 
 void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
@@ -374,6 +374,7 @@ static unsigned long kvm_isa_ext_arr[] = {
 	RISCV_ISA_EXT_h,
 	RISCV_ISA_EXT_i,
 	RISCV_ISA_EXT_m,
+	RISCV_ISA_EXT_SSTC,
 };
 
 static int kvm_riscv_vcpu_get_reg_isa_ext(struct kvm_vcpu *vcpu,
@@ -757,6 +758,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 				     vcpu->arch.isa);
 	kvm_riscv_vcpu_host_fp_restore(&vcpu->arch.host_context);
 
+	kvm_riscv_vcpu_timer_save(vcpu);
 	csr_write(CSR_HGATP, 0);
 
 	csr->vsstatus = csr_read(CSR_VSSTATUS);
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 5c4c37ff2d48..d226a931de92 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -69,7 +69,18 @@ static int kvm_riscv_vcpu_timer_cancel(struct kvm_vcpu_timer *t)
 	return 0;
 }
 
-int kvm_riscv_vcpu_timer_next_event(struct kvm_vcpu *vcpu, u64 ncycles)
+static int kvm_riscv_vcpu_update_vstimecmp(struct kvm_vcpu *vcpu, u64 ncycles)
+{
+#if __riscv_xlen == 32
+		csr_write(CSR_VSTIMECMP, ncycles & 0xFFFFFFFF);
+		csr_write(CSR_VSTIMECMPH, ncycles >> 32);
+#else
+		csr_write(CSR_VSTIMECMP, ncycles);
+#endif
+		return 0;
+}
+
+static int kvm_riscv_vcpu_update_hrtimer(struct kvm_vcpu *vcpu, u64 ncycles)
 {
 	struct kvm_vcpu_timer *t = &vcpu->arch.timer;
 	struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
@@ -88,6 +99,68 @@ int kvm_riscv_vcpu_timer_next_event(struct kvm_vcpu *vcpu, u64 ncycles)
 	return 0;
 }
 
+int kvm_riscv_vcpu_timer_next_event(struct kvm_vcpu *vcpu, u64 ncycles)
+{
+	struct kvm_vcpu_timer *t = &vcpu->arch.timer;
+
+	return t->timer_next_event(vcpu, ncycles);
+}
+
+static enum hrtimer_restart kvm_riscv_vcpu_vstimer_expired(struct hrtimer *h)
+{
+	u64 delta_ns;
+	struct kvm_vcpu_timer *t = container_of(h, struct kvm_vcpu_timer, hrt);
+	struct kvm_vcpu *vcpu = container_of(t, struct kvm_vcpu, arch.timer);
+	struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
+
+	if (kvm_riscv_current_cycles(gt) < t->next_cycles) {
+		delta_ns = kvm_riscv_delta_cycles2ns(t->next_cycles, gt, t);
+		hrtimer_forward_now(&t->hrt, ktime_set(0, delta_ns));
+		return HRTIMER_RESTART;
+	}
+
+	t->next_set = false;
+	kvm_vcpu_kick(vcpu);
+
+	return HRTIMER_NORESTART;
+}
+
+bool kvm_riscv_vcpu_timer_pending(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_timer *t = &vcpu->arch.timer;
+	struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
+	u64 vstimecmp_val = vcpu->arch.guest_csr.vstimecmp;
+
+	if (!kvm_riscv_delta_cycles2ns(vstimecmp_val, gt, t) ||
+	    kvm_riscv_vcpu_has_interrupts(vcpu, 1UL << IRQ_VS_TIMER))
+		return true;
+	else
+		return false;
+}
+
+static void kvm_riscv_vcpu_timer_blocking(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_timer *t = &vcpu->arch.timer;
+	struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
+	u64 delta_ns;
+	u64 vstimecmp_val = vcpu->arch.guest_csr.vstimecmp;
+
+	if (!t->init_done)
+		return;
+
+	delta_ns = kvm_riscv_delta_cycles2ns(vstimecmp_val, gt, t);
+	if (delta_ns) {
+		t->next_cycles = vstimecmp_val;
+		hrtimer_start(&t->hrt, ktime_set(0, delta_ns), HRTIMER_MODE_REL);
+		t->next_set = true;
+	}
+}
+
+static void kvm_riscv_vcpu_timer_unblocking(struct kvm_vcpu *vcpu)
+{
+	kvm_riscv_vcpu_timer_cancel(&vcpu->arch.timer);
+}
+
 int kvm_riscv_vcpu_get_reg_timer(struct kvm_vcpu *vcpu,
 				 const struct kvm_one_reg *reg)
 {
@@ -180,10 +253,20 @@ int kvm_riscv_vcpu_timer_init(struct kvm_vcpu *vcpu)
 		return -EINVAL;
 
 	hrtimer_init(&t->hrt, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	t->hrt.function = kvm_riscv_vcpu_hrtimer_expired;
 	t->init_done = true;
 	t->next_set = false;
 
+	/* Enable sstc for every vcpu if available in hardware */
+	if (riscv_isa_extension_available(NULL, SSTC)) {
+		t->sstc_enabled = true;
+		t->hrt.function = kvm_riscv_vcpu_vstimer_expired;
+		t->timer_next_event = kvm_riscv_vcpu_update_vstimecmp;
+	} else {
+		t->sstc_enabled = false;
+		t->hrt.function = kvm_riscv_vcpu_hrtimer_expired;
+		t->timer_next_event = kvm_riscv_vcpu_update_hrtimer;
+	}
+
 	return 0;
 }
 
@@ -202,7 +285,7 @@ int kvm_riscv_vcpu_timer_reset(struct kvm_vcpu *vcpu)
 	return kvm_riscv_vcpu_timer_cancel(&vcpu->arch.timer);
 }
 
-void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
+static void kvm_riscv_vcpu_update_timedelta(struct kvm_vcpu *vcpu)
 {
 	struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
 
@@ -214,6 +297,55 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 #endif
 }
 
+void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_csr *csr;
+	struct kvm_vcpu_timer *t = &vcpu->arch.timer;
+
+	kvm_riscv_vcpu_update_timedelta(vcpu);
+
+	if (!t->sstc_enabled)
+		return;
+
+	csr = &vcpu->arch.guest_csr;
+#ifdef CONFIG_64BIT
+	csr_write(CSR_VSTIMECMP, csr->vstimecmp);
+#else
+	csr_write(CSR_VSTIMECMP, (u32)csr->vstimecmp);
+	csr_write(CSR_VSTIMECMPH, (u32)(csr->vstimecmp >> 32));
+#endif
+
+	/* timer should be enabled for the remaining operations */
+	if (unlikely(!t->init_done))
+		return;
+
+	kvm_riscv_vcpu_timer_unblocking(vcpu);
+}
+
+void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_csr *csr;
+	struct kvm_vcpu_timer *t = &vcpu->arch.timer;
+
+	if (!t->sstc_enabled)
+		return;
+
+	csr = &vcpu->arch.guest_csr;
+	t = &vcpu->arch.timer;
+#ifdef CONFIG_64BIT
+	csr->vstimecmp = csr_read(CSR_VSTIMECMP);
+#else
+	csr->vstimecmp = csr_read(CSR_VSTIMECMP);
+	csr->vstimecmp |= (u64)csr_read(CSR_VSTIMECMPH) << 32;
+#endif
+	/* timer should be enabled for the remaining operations */
+	if (unlikely(!t->init_done))
+		return;
+
+	if (kvm_vcpu_is_blocking(vcpu))
+		kvm_riscv_vcpu_timer_blocking(vcpu);
+}
+
 int kvm_riscv_guest_timer_init(struct kvm *kvm)
 {
 	struct kvm_guest_timer *gt = &kvm->arch.timer;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
