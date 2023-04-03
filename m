Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EC2C761A6
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 10:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ICLhGnY5Z8JezG8izSls6aUegNqBxNx8mOe5zMFSV7o=; b=v6ULmfyMfLaMap
	U5RTIcxDsSgZtY2CNOUwazwoU65zY2HadC0wl+TQlqzmqq+bLEr6yD1ipIG8A4sIz26J7bN57s1W2
	fj8qDtVZA0PIUmplAfGBffl07PZA5oczN9HVqpx+ep0LbBzcHzanBjhW8Gssy1zwA8CDphZ8AEnKN
	gQ5X4tQLLo0KPJvtKTlQ6xzyzV9/dOW9a5Hy6EMTKgkHcyMG/aGj6CUiZ5zEWuZYnT9ZO02yxXrsu
	9froMPBafW+4EDyWNuuMNo7hjIkJqiVkhc+HrUj1pihjHaLeGSlsAhU29jLkP68N+BggTh/CT6Eq5
	4k6+9ANRj2VRLDp6CI8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjHgs-00EzRl-0w;
	Mon, 03 Apr 2023 10:45:34 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGZg-00EjRC-0J
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 09:34:06 +0000
Received: by mail-ot1-x32a.google.com with SMTP id q23-20020a05683031b700b006a1370e214aso12405656ots.11
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 02:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680514444; x=1683106444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIvz+5NA5w/GkrB31UnJwC4BDULmbACp0ieETGerotU=;
        b=LZVATg8CljZT6ubWdlVvDtncteqdsMKbCDfcXxSs+nuvZNR3tX6DtsAPs4o8fxlfUh
         4/R/sIdks1iaA7azSOJVgpzQF969/ZvUUUbYoNDSVb/yW42erUfRS4mQP9SkFGaZVVzM
         fl7GAlqhR6eIa5z/B0zAYzXV1e6vgfSXZx30qgP9wixzAcDAurQ0uMlUa4qRmHX97ci+
         /9YsrLdTFV2lqK7ffzMsAjRuTEMS5ZB/jsOtsOIk1vynxawoOOybr7QckiRiBVLH8g5Q
         mom+Y7wL84ADxYjs1maL8ibh6F4iY87TaPps0h4QDy8G6Gmd6k0u9h5mEIOwpquK2uJ0
         mHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680514444; x=1683106444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIvz+5NA5w/GkrB31UnJwC4BDULmbACp0ieETGerotU=;
        b=N8bFj3jv7qKC9IgMW9sa/yd0PNAWh4QkeRlA539YnfW1mC0+dMvm2JtywBw4gQk0wF
         ePpWF3I3XnOhXWdBvZ5G5yjSyELGmfZbJcMTkztitu5aTQVAD+Iz+Ury3G/+UTYC18P6
         NnO4VTp7Rs1LZWxi3kiwUCt83Ev3bXzJXsZ2rXy1h0uUP3QHpgREWFbsYUBfeoz56Udd
         OtxVvwbWXxpaKP6dSVB7RLnloWkEjXvOkAXPjy4gFm9YoJ2ZPgECQm0NYGQ12Q049aY9
         QIUktAlxmWf69/YMZSJW7/ba5+uzosefdOvIbcex9aKLzgZq1y9oTTcxeSWQnZyzho59
         bepg==
X-Gm-Message-State: AAQBX9ck24WS+oqJHPjVmKV+tRAEQxLEAzr+OwUqViIGtAztiWObSitL
	XBqRrS01PUI/votKqoxpHtCeWg==
X-Google-Smtp-Source: AKy350YaHJ8DuF++f45jsmqQl0IWm3ctwyuYLIyC0aZ73PvJgPQZWyqcCftBHuKjQldNfuWVG/4F4w==
X-Received: by 2002:a05:6830:16c5:b0:693:d7bf:dc26 with SMTP id l5-20020a05683016c500b00693d7bfdc26mr9415561otr.6.1680514443573;
        Mon, 03 Apr 2023 02:34:03 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id f5-20020a9d6c05000000b006a154373578sm3953953otq.39.2023.04.03.02.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 02:34:03 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 7/8] RISC-V: KVM: Virtualize per-HART AIA CSRs
Date: Mon,  3 Apr 2023 15:03:09 +0530
Message-Id: <20230403093310.2271142-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403093310.2271142-1-apatel@ventanamicro.com>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_023404_166600_D1956284 
X-CRM114-Status: GOOD (  19.56  )
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

The AIA specification introduce per-HART AIA CSRs which primarily
support:
* 64 local interrupts on both RV64 and RV32
* priority for each of the 64 local interrupts
* interrupt filtering for local interrupts

This patch virtualize above mentioned AIA CSRs and also extend
ONE_REG interface to allow user-space save/restore Guest/VM
view of these CSRs.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_aia.h  |  88 +++++----
 arch/riscv/include/asm/kvm_host.h |   7 +-
 arch/riscv/include/uapi/asm/kvm.h |   7 +
 arch/riscv/kvm/aia.c              | 317 ++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c             |  53 +++--
 5 files changed, 415 insertions(+), 57 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index 258a835d4c32..1de0717112e5 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -12,6 +12,7 @@
 
 #include <linux/jump_label.h>
 #include <linux/kvm_types.h>
+#include <asm/csr.h>
 
 struct kvm_aia {
 	/* In-kernel irqchip created */
@@ -21,7 +22,22 @@ struct kvm_aia {
 	bool		initialized;
 };
 
+struct kvm_vcpu_aia_csr {
+	unsigned long vsiselect;
+	unsigned long hviprio1;
+	unsigned long hviprio2;
+	unsigned long vsieh;
+	unsigned long hviph;
+	unsigned long hviprio1h;
+	unsigned long hviprio2h;
+};
+
 struct kvm_vcpu_aia {
+	/* CPU AIA CSR context of Guest VCPU */
+	struct kvm_vcpu_aia_csr guest_csr;
+
+	/* CPU AIA CSR context upon Guest VCPU reset */
+	struct kvm_vcpu_aia_csr guest_reset_csr;
 };
 
 #define kvm_riscv_aia_initialized(k)	((k)->arch.aia.initialized)
@@ -32,48 +48,50 @@ DECLARE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
 #define kvm_riscv_aia_available() \
 	static_branch_unlikely(&kvm_riscv_aia_available)
 
-static inline void kvm_riscv_vcpu_aia_flush_interrupts(struct kvm_vcpu *vcpu)
-{
-}
-
-static inline void kvm_riscv_vcpu_aia_sync_interrupts(struct kvm_vcpu *vcpu)
-{
-}
-
-static inline bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu,
-						     u64 mask)
-{
-	return false;
-}
-
-static inline void kvm_riscv_vcpu_aia_update_hvip(struct kvm_vcpu *vcpu)
-{
-}
-
-static inline void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu)
-{
-}
-
-static inline void kvm_riscv_vcpu_aia_put(struct kvm_vcpu *vcpu)
+#define KVM_RISCV_AIA_IMSIC_TOPEI	(ISELECT_MASK + 1)
+static inline int kvm_riscv_vcpu_aia_imsic_rmw(struct kvm_vcpu *vcpu,
+					       unsigned long isel,
+					       unsigned long *val,
+					       unsigned long new_val,
+					       unsigned long wr_mask)
 {
+	return 0;
 }
 
-static inline int kvm_riscv_vcpu_aia_get_csr(struct kvm_vcpu *vcpu,
-					     unsigned long reg_num,
-					     unsigned long *out_val)
+#ifdef CONFIG_32BIT
+void kvm_riscv_vcpu_aia_flush_interrupts(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_aia_sync_interrupts(struct kvm_vcpu *vcpu);
+#else
+static inline void kvm_riscv_vcpu_aia_flush_interrupts(struct kvm_vcpu *vcpu)
 {
-	*out_val = 0;
-	return 0;
 }
-
-static inline int kvm_riscv_vcpu_aia_set_csr(struct kvm_vcpu *vcpu,
-					     unsigned long reg_num,
-					     unsigned long val)
+static inline void kvm_riscv_vcpu_aia_sync_interrupts(struct kvm_vcpu *vcpu)
 {
-	return 0;
 }
-
-#define KVM_RISCV_VCPU_AIA_CSR_FUNCS
+#endif
+bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask);
+
+void kvm_riscv_vcpu_aia_update_hvip(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu);
+void kvm_riscv_vcpu_aia_put(struct kvm_vcpu *vcpu);
+int kvm_riscv_vcpu_aia_get_csr(struct kvm_vcpu *vcpu,
+			       unsigned long reg_num,
+			       unsigned long *out_val);
+int kvm_riscv_vcpu_aia_set_csr(struct kvm_vcpu *vcpu,
+			       unsigned long reg_num,
+			       unsigned long val);
+
+int kvm_riscv_vcpu_aia_rmw_topei(struct kvm_vcpu *vcpu,
+				 unsigned int csr_num,
+				 unsigned long *val,
+				 unsigned long new_val,
+				 unsigned long wr_mask);
+int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
+				unsigned long *val, unsigned long new_val,
+				unsigned long wr_mask);
+#define KVM_RISCV_VCPU_AIA_CSR_FUNCS \
+{ .base = CSR_SIREG,      .count = 1, .func = kvm_riscv_vcpu_aia_rmw_ireg }, \
+{ .base = CSR_STOPEI,     .count = 1, .func = kvm_riscv_vcpu_aia_rmw_topei },
 
 static inline int kvm_riscv_vcpu_aia_update(struct kvm_vcpu *vcpu)
 {
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 3157cf748df1..ee0acccb1d3b 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -204,8 +204,9 @@ struct kvm_vcpu_arch {
 	 * in irqs_pending. Our approach is modeled around multiple producer
 	 * and single consumer problem where the consumer is the VCPU itself.
 	 */
-	unsigned long irqs_pending;
-	unsigned long irqs_pending_mask;
+#define KVM_RISCV_VCPU_NR_IRQS	64
+	DECLARE_BITMAP(irqs_pending, KVM_RISCV_VCPU_NR_IRQS);
+	DECLARE_BITMAP(irqs_pending_mask, KVM_RISCV_VCPU_NR_IRQS);
 
 	/* VCPU Timer */
 	struct kvm_vcpu_timer timer;
@@ -334,7 +335,7 @@ int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq);
 int kvm_riscv_vcpu_unset_interrupt(struct kvm_vcpu *vcpu, unsigned int irq);
 void kvm_riscv_vcpu_flush_interrupts(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_sync_interrupts(struct kvm_vcpu *vcpu);
-bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, unsigned long mask);
+bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, u64 mask);
 void kvm_riscv_vcpu_power_off(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu);
 
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index cbc3e74fa670..c517e70ddcd6 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -81,6 +81,13 @@ struct kvm_riscv_csr {
 
 /* AIA CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_aia_csr {
+	unsigned long siselect;
+	unsigned long siprio1;
+	unsigned long siprio2;
+	unsigned long sieh;
+	unsigned long siph;
+	unsigned long siprio1h;
+	unsigned long siprio2h;
 };
 
 /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 7a633331cd3e..d530912f28bc 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -26,6 +26,323 @@ static void aia_set_hvictl(bool ext_irq_pending)
 	csr_write(CSR_HVICTL, hvictl);
 }
 
+#ifdef CONFIG_32BIT
+void kvm_riscv_vcpu_aia_flush_interrupts(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
+	unsigned long mask, val;
+
+	if (!kvm_riscv_aia_available())
+		return;
+
+	if (READ_ONCE(vcpu->arch.irqs_pending_mask[1])) {
+		mask = xchg_acquire(&vcpu->arch.irqs_pending_mask[1], 0);
+		val = READ_ONCE(vcpu->arch.irqs_pending[1]) & mask;
+
+		csr->hviph &= ~mask;
+		csr->hviph |= val;
+	}
+}
+
+void kvm_riscv_vcpu_aia_sync_interrupts(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
+
+	if (kvm_riscv_aia_available())
+		csr->vsieh = csr_read(CSR_VSIEH);
+}
+#endif
+
+bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
+{
+	unsigned long seip;
+
+	if (!kvm_riscv_aia_available())
+		return false;
+
+#ifdef CONFIG_32BIT
+	if (READ_ONCE(vcpu->arch.irqs_pending[1]) &
+	    (vcpu->arch.aia_context.guest_csr.vsieh & (unsigned long)(mask >> 32)))
+		return true;
+#endif
+
+	seip = vcpu->arch.guest_csr.vsie;
+	seip &= (unsigned long)mask;
+	seip &= BIT(IRQ_S_EXT);
+	if (!kvm_riscv_aia_initialized(vcpu->kvm) || !seip)
+		return false;
+
+	return false;
+}
+
+void kvm_riscv_vcpu_aia_update_hvip(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+
+	if (!kvm_riscv_aia_available())
+		return;
+
+#ifdef CONFIG_32BIT
+	csr_write(CSR_HVIPH, vcpu->arch.aia_context.guest_csr.hviph);
+#endif
+	aia_set_hvictl((csr->hvip & BIT(IRQ_VS_EXT)) ? true : false);
+}
+
+void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu)
+{
+	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
+
+	if (!kvm_riscv_aia_available())
+		return;
+
+	csr_write(CSR_VSISELECT, csr->vsiselect);
+	csr_write(CSR_HVIPRIO1, csr->hviprio1);
+	csr_write(CSR_HVIPRIO2, csr->hviprio2);
+#ifdef CONFIG_32BIT
+	csr_write(CSR_VSIEH, csr->vsieh);
+	csr_write(CSR_HVIPH, csr->hviph);
+	csr_write(CSR_HVIPRIO1H, csr->hviprio1h);
+	csr_write(CSR_HVIPRIO2H, csr->hviprio2h);
+#endif
+}
+
+void kvm_riscv_vcpu_aia_put(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
+
+	if (!kvm_riscv_aia_available())
+		return;
+
+	csr->vsiselect = csr_read(CSR_VSISELECT);
+	csr->hviprio1 = csr_read(CSR_HVIPRIO1);
+	csr->hviprio2 = csr_read(CSR_HVIPRIO2);
+#ifdef CONFIG_32BIT
+	csr->vsieh = csr_read(CSR_VSIEH);
+	csr->hviph = csr_read(CSR_HVIPH);
+	csr->hviprio1h = csr_read(CSR_HVIPRIO1H);
+	csr->hviprio2h = csr_read(CSR_HVIPRIO2H);
+#endif
+}
+
+int kvm_riscv_vcpu_aia_get_csr(struct kvm_vcpu *vcpu,
+			       unsigned long reg_num,
+			       unsigned long *out_val)
+{
+	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
+
+	if (reg_num >= sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned long))
+		return -EINVAL;
+
+	*out_val = 0;
+	if (kvm_riscv_aia_available())
+		*out_val = ((unsigned long *)csr)[reg_num];
+
+	return 0;
+}
+
+int kvm_riscv_vcpu_aia_set_csr(struct kvm_vcpu *vcpu,
+			       unsigned long reg_num,
+			       unsigned long val)
+{
+	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
+
+	if (reg_num >= sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned long))
+		return -EINVAL;
+
+	if (kvm_riscv_aia_available()) {
+		((unsigned long *)csr)[reg_num] = val;
+
+#ifdef CONFIG_32BIT
+		if (reg_num == KVM_REG_RISCV_CSR_AIA_REG(siph))
+			WRITE_ONCE(vcpu->arch.irqs_pending_mask[1], 0);
+#endif
+	}
+
+	return 0;
+}
+
+int kvm_riscv_vcpu_aia_rmw_topei(struct kvm_vcpu *vcpu,
+				 unsigned int csr_num,
+				 unsigned long *val,
+				 unsigned long new_val,
+				 unsigned long wr_mask)
+{
+	/* If AIA not available then redirect trap */
+	if (!kvm_riscv_aia_available())
+		return KVM_INSN_ILLEGAL_TRAP;
+
+	/* If AIA not initialized then forward to user space */
+	if (!kvm_riscv_aia_initialized(vcpu->kvm))
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+
+	return kvm_riscv_vcpu_aia_imsic_rmw(vcpu, KVM_RISCV_AIA_IMSIC_TOPEI,
+					    val, new_val, wr_mask);
+}
+
+/*
+ * External IRQ priority always read-only zero. This means default
+ * priority order  is always preferred for external IRQs unless
+ * HVICTL.IID == 9 and HVICTL.IPRIO != 0
+ */
+static int aia_irq2bitpos[] = {
+0,     8,   -1,   -1,   16,   24,   -1,   -1, /* 0 - 7 */
+32,   -1,   -1,   -1,   -1,   40,   48,   56, /* 8 - 15 */
+64,   72,   80,   88,   96,  104,  112,  120, /* 16 - 23 */
+-1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, /* 24 - 31 */
+-1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, /* 32 - 39 */
+-1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, /* 40 - 47 */
+-1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, /* 48 - 55 */
+-1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, /* 56 - 63 */
+};
+
+static u8 aia_get_iprio8(struct kvm_vcpu *vcpu, unsigned int irq)
+{
+	unsigned long hviprio;
+	int bitpos = aia_irq2bitpos[irq];
+
+	if (bitpos < 0)
+		return 0;
+
+	switch (bitpos / BITS_PER_LONG) {
+	case 0:
+		hviprio = csr_read(CSR_HVIPRIO1);
+		break;
+	case 1:
+#ifndef CONFIG_32BIT
+		hviprio = csr_read(CSR_HVIPRIO2);
+		break;
+#else
+		hviprio = csr_read(CSR_HVIPRIO1H);
+		break;
+	case 2:
+		hviprio = csr_read(CSR_HVIPRIO2);
+		break;
+	case 3:
+		hviprio = csr_read(CSR_HVIPRIO2H);
+		break;
+#endif
+	default:
+		return 0;
+	};
+
+	return (hviprio >> (bitpos % BITS_PER_LONG)) & TOPI_IPRIO_MASK;
+}
+
+static void aia_set_iprio8(struct kvm_vcpu *vcpu, unsigned int irq, u8 prio)
+{
+	unsigned long hviprio;
+	int bitpos = aia_irq2bitpos[irq];
+
+	if (bitpos < 0)
+		return;
+
+	switch (bitpos / BITS_PER_LONG) {
+	case 0:
+		hviprio = csr_read(CSR_HVIPRIO1);
+		break;
+	case 1:
+#ifndef CONFIG_32BIT
+		hviprio = csr_read(CSR_HVIPRIO2);
+		break;
+#else
+		hviprio = csr_read(CSR_HVIPRIO1H);
+		break;
+	case 2:
+		hviprio = csr_read(CSR_HVIPRIO2);
+		break;
+	case 3:
+		hviprio = csr_read(CSR_HVIPRIO2H);
+		break;
+#endif
+	default:
+		return;
+	};
+
+	hviprio &= ~((unsigned long)TOPI_IPRIO_MASK <<
+		     (bitpos % BITS_PER_LONG));
+	hviprio |= (unsigned long)prio << (bitpos % BITS_PER_LONG);
+
+	switch (bitpos / BITS_PER_LONG) {
+	case 0:
+		csr_write(CSR_HVIPRIO1, hviprio);
+		break;
+	case 1:
+#ifndef CONFIG_32BIT
+		csr_write(CSR_HVIPRIO2, hviprio);
+		break;
+#else
+		csr_write(CSR_HVIPRIO1H, hviprio);
+		break;
+	case 2:
+		csr_write(CSR_HVIPRIO2, hviprio);
+		break;
+	case 3:
+		csr_write(CSR_HVIPRIO2H, hviprio);
+		break;
+#endif
+	default:
+		return;
+	};
+}
+
+static int aia_rmw_iprio(struct kvm_vcpu *vcpu, unsigned int isel,
+			 unsigned long *val, unsigned long new_val,
+			 unsigned long wr_mask)
+{
+	int i, firq, nirqs;
+	unsigned long old_val;
+
+#ifndef CONFIG_32BIT
+	if (isel & 0x1)
+		return KVM_INSN_ILLEGAL_TRAP;
+#endif
+
+	nirqs = 4 * (BITS_PER_LONG / 32);
+	firq = ((isel - ISELECT_IPRIO0) / (BITS_PER_LONG / 32)) * (nirqs);
+
+	old_val = 0;
+	for (i = 0; i < nirqs; i++)
+		old_val |= (unsigned long)aia_get_iprio8(vcpu, firq + i) <<
+			   (TOPI_IPRIO_BITS * i);
+
+	if (val)
+		*val = old_val;
+
+	if (wr_mask) {
+		new_val = (old_val & ~wr_mask) | (new_val & wr_mask);
+		for (i = 0; i < nirqs; i++)
+			aia_set_iprio8(vcpu, firq + i,
+			(new_val >> (TOPI_IPRIO_BITS * i)) & TOPI_IPRIO_MASK);
+	}
+
+	return KVM_INSN_CONTINUE_NEXT_SEPC;
+}
+
+#define IMSIC_FIRST	0x70
+#define IMSIC_LAST	0xff
+int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
+				unsigned long *val, unsigned long new_val,
+				unsigned long wr_mask)
+{
+	unsigned int isel;
+
+	/* If AIA not available then redirect trap */
+	if (!kvm_riscv_aia_available())
+		return KVM_INSN_ILLEGAL_TRAP;
+
+	/* First try to emulate in kernel space */
+	isel = csr_read(CSR_VSISELECT) & ISELECT_MASK;
+	if (isel >= ISELECT_IPRIO0 && isel <= ISELECT_IPRIO15)
+		return aia_rmw_iprio(vcpu, isel, val, new_val, wr_mask);
+	else if (isel >= IMSIC_FIRST && isel <= IMSIC_LAST &&
+		 kvm_riscv_aia_initialized(vcpu->kvm))
+		return kvm_riscv_vcpu_aia_imsic_rmw(vcpu, isel, val, new_val,
+						    wr_mask);
+
+	/* We can't handle it here so redirect to user space */
+	return KVM_INSN_EXIT_TO_USER_SPACE;
+}
+
 void kvm_riscv_aia_enable(void)
 {
 	if (!kvm_riscv_aia_available())
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 15507cd3a595..30acf3ebdc3d 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -141,8 +141,8 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	kvm_riscv_vcpu_aia_reset(vcpu);
 
-	WRITE_ONCE(vcpu->arch.irqs_pending, 0);
-	WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
+	bitmap_zero(vcpu->arch.irqs_pending, KVM_RISCV_VCPU_NR_IRQS);
+	bitmap_zero(vcpu->arch.irqs_pending_mask, KVM_RISCV_VCPU_NR_IRQS);
 
 	kvm_riscv_vcpu_pmu_reset(vcpu);
 
@@ -474,6 +474,7 @@ static int kvm_riscv_vcpu_general_get_csr(struct kvm_vcpu *vcpu,
 	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
 		kvm_riscv_vcpu_flush_interrupts(vcpu);
 		*out_val = (csr->hvip >> VSIP_TO_HVIP_SHIFT) & VSIP_VALID_MASK;
+		*out_val |= csr->hvip & ~IRQ_LOCAL_MASK;
 	} else
 		*out_val = ((unsigned long *)csr)[reg_num];
 
@@ -497,7 +498,7 @@ static inline int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
 	((unsigned long *)csr)[reg_num] = reg_val;
 
 	if (reg_num == KVM_REG_RISCV_CSR_REG(sip))
-		WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
+		WRITE_ONCE(vcpu->arch.irqs_pending_mask[0], 0);
 
 	return 0;
 }
@@ -799,9 +800,9 @@ void kvm_riscv_vcpu_flush_interrupts(struct kvm_vcpu *vcpu)
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 	unsigned long mask, val;
 
-	if (READ_ONCE(vcpu->arch.irqs_pending_mask)) {
-		mask = xchg_acquire(&vcpu->arch.irqs_pending_mask, 0);
-		val = READ_ONCE(vcpu->arch.irqs_pending) & mask;
+	if (READ_ONCE(vcpu->arch.irqs_pending_mask[0])) {
+		mask = xchg_acquire(&vcpu->arch.irqs_pending_mask[0], 0);
+		val = READ_ONCE(vcpu->arch.irqs_pending[0]) & mask;
 
 		csr->hvip &= ~mask;
 		csr->hvip |= val;
@@ -825,12 +826,12 @@ void kvm_riscv_vcpu_sync_interrupts(struct kvm_vcpu *vcpu)
 	if ((csr->hvip ^ hvip) & (1UL << IRQ_VS_SOFT)) {
 		if (hvip & (1UL << IRQ_VS_SOFT)) {
 			if (!test_and_set_bit(IRQ_VS_SOFT,
-					      &v->irqs_pending_mask))
-				set_bit(IRQ_VS_SOFT, &v->irqs_pending);
+					      v->irqs_pending_mask))
+				set_bit(IRQ_VS_SOFT, v->irqs_pending);
 		} else {
 			if (!test_and_set_bit(IRQ_VS_SOFT,
-					      &v->irqs_pending_mask))
-				clear_bit(IRQ_VS_SOFT, &v->irqs_pending);
+					      v->irqs_pending_mask))
+				clear_bit(IRQ_VS_SOFT, v->irqs_pending);
 		}
 	}
 
@@ -843,14 +844,20 @@ void kvm_riscv_vcpu_sync_interrupts(struct kvm_vcpu *vcpu)
 
 int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
 {
-	if (irq != IRQ_VS_SOFT &&
+	/*
+	 * We only allow VS-mode software, timer, and external
+	 * interrupts when irq is one of the local interrupts
+	 * defined by RISC-V privilege specification.
+	 */
+	if (irq < IRQ_LOCAL_MAX &&
+	    irq != IRQ_VS_SOFT &&
 	    irq != IRQ_VS_TIMER &&
 	    irq != IRQ_VS_EXT)
 		return -EINVAL;
 
-	set_bit(irq, &vcpu->arch.irqs_pending);
+	set_bit(irq, vcpu->arch.irqs_pending);
 	smp_mb__before_atomic();
-	set_bit(irq, &vcpu->arch.irqs_pending_mask);
+	set_bit(irq, vcpu->arch.irqs_pending_mask);
 
 	kvm_vcpu_kick(vcpu);
 
@@ -859,25 +866,33 @@ int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
 
 int kvm_riscv_vcpu_unset_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
 {
-	if (irq != IRQ_VS_SOFT &&
+	/*
+	 * We only allow VS-mode software, timer, and external
+	 * interrupts when irq is one of the local interrupts
+	 * defined by RISC-V privilege specification.
+	 */
+	if (irq < IRQ_LOCAL_MAX &&
+	    irq != IRQ_VS_SOFT &&
 	    irq != IRQ_VS_TIMER &&
 	    irq != IRQ_VS_EXT)
 		return -EINVAL;
 
-	clear_bit(irq, &vcpu->arch.irqs_pending);
+	clear_bit(irq, vcpu->arch.irqs_pending);
 	smp_mb__before_atomic();
-	set_bit(irq, &vcpu->arch.irqs_pending_mask);
+	set_bit(irq, vcpu->arch.irqs_pending_mask);
 
 	return 0;
 }
 
-bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, unsigned long mask)
+bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
 {
 	unsigned long ie;
 
 	ie = ((vcpu->arch.guest_csr.vsie & VSIP_VALID_MASK)
-		<< VSIP_TO_HVIP_SHIFT) & mask;
-	if (READ_ONCE(vcpu->arch.irqs_pending) & ie)
+		<< VSIP_TO_HVIP_SHIFT) & (unsigned long)mask;
+	ie |= vcpu->arch.guest_csr.vsie & ~IRQ_LOCAL_MASK &
+		(unsigned long)mask;
+	if (READ_ONCE(vcpu->arch.irqs_pending[0]) & ie)
 		return true;
 
 	/* Check AIA high interrupts */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
