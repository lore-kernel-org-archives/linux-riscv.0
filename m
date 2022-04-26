Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72133C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Apr 2022 18:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/x7rV2WEnBynb/HDxsCHwENtuTt5TFWgCHDfEOg+Udw=; b=Nl7bu78A8qQVOt
	gPpttpUlTfCmPdWFam2ecm+q7SRfutOo5KGrYUyUpUS6l1JCR6YNWOGMH4i9JZrRAvmYChu6MHdHX
	lPJplrEH6/9Dal529SICPZTqTLEZAu0a0uxSubFao9o7ScFKqUrjnMxmhzNr6zVUInZ1H0CTpbZGS
	zo6vsFLCvDQEi2SqsGGdJrHNx98Ol1BSq9W82az5VVId/AdPsxQW3yfZmgTy1amCFc5vLHVsEoFuB
	7uQF9DaPAZioMjkzdhfCmQ7LrIy0PyjlptYnUDtxWQm62dfx+izguPFiShj2g6cvvYeM0kiIcwGbM
	YyW8J/GMs0U0bU9ZfMwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njQJX-00FrKq-DS; Tue, 26 Apr 2022 18:53:31 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njQJG-00FrAm-RU
 for linux-riscv@lists.infradead.org; Tue, 26 Apr 2022 18:53:17 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so2953816pju.2
 for <linux-riscv@lists.infradead.org>; Tue, 26 Apr 2022 11:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6cFlsnzmTTm5Xa66rH6KwzB/ux+mVCgL41wPwnI7Qx8=;
 b=OWjJIkZ/YgZx4Cpr0ozr69PHay6bOYKiY/0i/E2coBccOMx1uBjGyoJtX+VR73iOWp
 9r1QjEqgaWhY8NCosjfqE8/13Lz582Otu1u7HLFxm3YZAqRWjA4i4vb8U1M7GYYBzVaU
 2rEsSyYKsvEIzclvKcG6GdhUOckM+al/RwOR3D/fKNT7haiaWOHjNne7Ut+o8Un1ZT3J
 zk6oJG/dAxiRyRiX7G1Z3i5f9clL/mHPWYt4ULe6r44mtc/3woeRHn7+CY3pDTj3oabQ
 K/ifyZ06XHxQDXpgFfOwpO5ZNLYt36ozOWMuXNOXJ/7GCxGNxHi5aKV4E8GJta9838F4
 f0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6cFlsnzmTTm5Xa66rH6KwzB/ux+mVCgL41wPwnI7Qx8=;
 b=mJb5nAXtxeoYQ5xxx6WUN5GHvVDNchZVrNIxJV1jdSp9LzLnb0jBwWFLbkLfmuteQa
 nI1XCTKUkTXPOXCfmYLVUm4Lq8nwiYwkdsTRsoU1A/yF8SMcUI8qK2dJwUTTWV1Yxo+e
 kyGblJOuPBg+w1pbGvaqNjUixlmar6XWvKDkttUzusNI7zELbw7ZWcxx0Ae2NAntlTDo
 BsQhxeyv0NCVUKd+bsXA4gj0HlvEkkeDcYjYWAIbyOmqZNjbMAQ9iZDVvr2Kb2Gfu8e9
 BR4ODvvFZ7ypNXy8FC6xlApUzo5TK2TfaKIkJoEHsuMUWWXGTxRBOxNFItfcarAtHlKd
 XQaQ==
X-Gm-Message-State: AOAM532ff+9ZVrgBvogVlo6HlhEB8AwT5MJ9fcFKndDziu4ISBDi5Bfa
 jD4LUEQ873THWlutI1KYdHjrMQ==
X-Google-Smtp-Source: ABdhPJxMXG7bgj2sBNfkDEkhV8AwVjIZNQ2rPJw1G8XIQJ8Gs0AqWxXktxNSheZlvq160WrOXvWZwQ==
X-Received: by 2002:a17:90a:d0c5:b0:1c9:ec78:18e5 with SMTP id
 y5-20020a17090ad0c500b001c9ec7818e5mr39005065pjw.53.1650999193879; 
 Tue, 26 Apr 2022 11:53:13 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 cl18-20020a17090af69200b001cd4989ff5asm3839664pjb.33.2022.04.26.11.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:53:13 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 4/4] RISC-V: KVM: Support sstc extension
Date: Tue, 26 Apr 2022 11:52:45 -0700
Message-Id: <20220426185245.281182-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426185245.281182-1-atishp@rivosinc.com>
References: <20220426185245.281182-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_115314_977656_A4C94AAA 
X-CRM114-Status: GOOD (  19.84  )
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
 arch/riscv/kvm/vcpu.c                   |   5 +-
 arch/riscv/kvm/vcpu_timer.c             | 138 +++++++++++++++++++++++-
 6 files changed, 159 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 78da839657e5..50a97c821f83 100644
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
index 93492eb292fd..da1559725b03 100644
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
@@ -754,6 +755,8 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 				     vcpu->arch.isa);
 	kvm_riscv_vcpu_host_fp_restore(&vcpu->arch.host_context);
 
+	kvm_riscv_vcpu_timer_save(vcpu);
+
 	csr->vsstatus = csr_read(CSR_VSSTATUS);
 	csr->vsie = csr_read(CSR_VSIE);
 	csr->vstvec = csr_read(CSR_VSTVEC);
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
