Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE0DEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 07:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3PA/gjPrDkUaSRFpLtwBLFO7GaqIo9FvGntdUsIXFA=; b=MHa3vMVjGuwxeo
	OVw+RzyOmIFCG9jqdHH+YvApwFxWUD93DyG1LhMsMle2pV/t4tZwad7tuz9rN9wwzbNBKhNTt/HjW
	2L+xbkm+lWauR/RiZPjBL+xiNh4ZpQ+wUSaMqS/wS5HuAV3Nw6MuEEvKSuCc5UHFtXjRUPzeerXFM
	hk7R1bX+L4XT+5eOboG9buB5J9soyibrZ/Gi5K6t0ldLKkTEPl+0OyRL2TobUbnVJ7BKczAsRnuak
	AmHcREfJvUI30NJkaiNUOR5iZVxyJuSiKPy6NjIwpuNWwDvHZVfCvqTn5xysh9WQ90GRmGmwFYrcd
	83Y/aJ3OXis/MO6XsEsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hUj-00E17T-14;
	Thu, 15 Jun 2023 07:34:13 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hUf-00E14e-1o
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 07:34:11 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b5018cb4dcso9728665ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 00:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686814448; x=1689406448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNbAHcdjHwv4iW/ZPMySouot4umzQzwv5+IFQnyeg/0=;
        b=CLbUDuQkVrUbWhazzlsD+afGwJGj7r/aClM6Nr2e5FO8on2zv6KpSVk9MCgngCFtgx
         xD5PuZX2CflB0UfUWEh9bFmiwqXr5RtiuHOFM6Rj/TrKRkc43KgIn4u6BFLH+OWPxKIl
         H6MhV1LoP+uxOP/73dUX/z9Q8Y9G25E5RtTHBpJGFq/GfKM1tFeKxcZ95Xba8oaOeDrE
         7anUDZxu1x7rar220iZ5SydQ1D7efrqPgVfaId6CXr0LCxfsjsFLSsmq7WURqZKEFM0L
         9d7cocXj/m3DENrmfBHrXRKteVsF0tIaAzwU0wLccsg2Q4OpFGbxWyF6G3hKw/csJ7JE
         4pIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686814448; x=1689406448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNbAHcdjHwv4iW/ZPMySouot4umzQzwv5+IFQnyeg/0=;
        b=OFE40YCXNth+yzrN7CI9VrQNfPSIUim9mi7D9rq1btFDpECHXMqF7sRFkdThkZneet
         O76NnD3i3ODpbuTSaTKaEFgObDfDzQ+YOdx1O511GmaFTRctk/hztA1iX/cRV4eeRyY2
         QFvIFS7i/vGFD5IF1hxBrxZefgMVHDriCen7jthw7mNRzvdKwvOldoHTQLQtFHHoPP7p
         MAZkUCcbeTrjoPVmSB9cQgZVYu2l/d5E1XFNl746kyKOjyqWwapqKi23KBwIPtkYcMsg
         cHoPWweRRyUvmpqtIz8e6rQHt6rRuycMJ4loR45DvkhbuBeZH3uB7h1JevDWyEx3Su0O
         GSkQ==
X-Gm-Message-State: AC+VfDzIcio9IOcCbc1bm2Qh9d1uIqAWvUIOXfEP6syIrfshDZtnJFb7
	q5BszBQXOtacd5o4XuFJV9U/0A==
X-Google-Smtp-Source: ACHHUZ4UN0WG+1wB4R6U2uP/UWBwRBcxYB9743nQk/eN5YfVIOaGteYEH8AQPPTlTJDHyPXKR1zeBg==
X-Received: by 2002:a17:902:ef89:b0:1b3:e6ba:3539 with SMTP id iz9-20020a170902ef8900b001b3e6ba3539mr5856714plb.51.1686814445997;
        Thu, 15 Jun 2023 00:34:05 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id ji1-20020a170903324100b001b016313b1dsm8049855plb.86.2023.06.15.00.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 00:34:05 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 01/10] RISC-V: KVM: Implement guest external interrupt line management
Date: Thu, 15 Jun 2023 13:03:44 +0530
Message-Id: <20230615073353.85435-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615073353.85435-1-apatel@ventanamicro.com>
References: <20230615073353.85435-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_003409_598171_746C5D06 
X-CRM114-Status: GOOD (  22.04  )
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

The RISC-V host will have one guest external interrupt line for each
VS-level IMSICs associated with a HART. The guest external interrupt
lines are per-HART resources and hypervisor can use HGEIE, HGEIP, and
HIE CSRs to manage these guest external interrupt lines.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_aia.h |  10 ++
 arch/riscv/kvm/aia.c             | 244 +++++++++++++++++++++++++++++++
 arch/riscv/kvm/main.c            |   3 +-
 arch/riscv/kvm/vcpu.c            |   2 +
 4 files changed, 258 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index 1de0717112e5..0938e0cadf80 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -44,10 +44,15 @@ struct kvm_vcpu_aia {
 
 #define irqchip_in_kernel(k)		((k)->arch.aia.in_kernel)
 
+extern unsigned int kvm_riscv_aia_nr_hgei;
 DECLARE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
 #define kvm_riscv_aia_available() \
 	static_branch_unlikely(&kvm_riscv_aia_available)
 
+static inline void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
+{
+}
+
 #define KVM_RISCV_AIA_IMSIC_TOPEI	(ISELECT_MASK + 1)
 static inline int kvm_riscv_vcpu_aia_imsic_rmw(struct kvm_vcpu *vcpu,
 					       unsigned long isel,
@@ -119,6 +124,11 @@ static inline void kvm_riscv_aia_destroy_vm(struct kvm *kvm)
 {
 }
 
+int kvm_riscv_aia_alloc_hgei(int cpu, struct kvm_vcpu *owner,
+			     void __iomem **hgei_va, phys_addr_t *hgei_pa);
+void kvm_riscv_aia_free_hgei(int cpu, int hgei);
+void kvm_riscv_aia_wakeon_hgei(struct kvm_vcpu *owner, bool enable);
+
 void kvm_riscv_aia_enable(void);
 void kvm_riscv_aia_disable(void);
 int kvm_riscv_aia_init(void);
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 4f1286fc7f17..1cee75a8c883 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -8,11 +8,47 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/bitops.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/kvm_host.h>
+#include <linux/percpu.h>
+#include <linux/spinlock.h>
 #include <asm/hwcap.h>
 
+struct aia_hgei_control {
+	raw_spinlock_t lock;
+	unsigned long free_bitmap;
+	struct kvm_vcpu *owners[BITS_PER_LONG];
+};
+static DEFINE_PER_CPU(struct aia_hgei_control, aia_hgei);
+static int hgei_parent_irq;
+
+unsigned int kvm_riscv_aia_nr_hgei;
 DEFINE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
 
+static int aia_find_hgei(struct kvm_vcpu *owner)
+{
+	int i, hgei;
+	unsigned long flags;
+	struct aia_hgei_control *hgctrl = get_cpu_ptr(&aia_hgei);
+
+	raw_spin_lock_irqsave(&hgctrl->lock, flags);
+
+	hgei = -1;
+	for (i = 1; i <= kvm_riscv_aia_nr_hgei; i++) {
+		if (hgctrl->owners[i] == owner) {
+			hgei = i;
+			break;
+		}
+	}
+
+	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
+
+	put_cpu_ptr(&aia_hgei);
+	return hgei;
+}
+
 static void aia_set_hvictl(bool ext_irq_pending)
 {
 	unsigned long hvictl;
@@ -56,6 +92,7 @@ void kvm_riscv_vcpu_aia_sync_interrupts(struct kvm_vcpu *vcpu)
 
 bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
 {
+	int hgei;
 	unsigned long seip;
 
 	if (!kvm_riscv_aia_available())
@@ -74,6 +111,10 @@ bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
 	if (!kvm_riscv_aia_initialized(vcpu->kvm) || !seip)
 		return false;
 
+	hgei = aia_find_hgei(vcpu);
+	if (hgei > 0)
+		return !!(csr_read(CSR_HGEIP) & BIT(hgei));
+
 	return false;
 }
 
@@ -348,6 +389,143 @@ int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
 	return KVM_INSN_EXIT_TO_USER_SPACE;
 }
 
+int kvm_riscv_aia_alloc_hgei(int cpu, struct kvm_vcpu *owner,
+			     void __iomem **hgei_va, phys_addr_t *hgei_pa)
+{
+	int ret = -ENOENT;
+	unsigned long flags;
+	struct aia_hgei_control *hgctrl = per_cpu_ptr(&aia_hgei, cpu);
+
+	if (!kvm_riscv_aia_available() || !hgctrl)
+		return -ENODEV;
+
+	raw_spin_lock_irqsave(&hgctrl->lock, flags);
+
+	if (hgctrl->free_bitmap) {
+		ret = __ffs(hgctrl->free_bitmap);
+		hgctrl->free_bitmap &= ~BIT(ret);
+		hgctrl->owners[ret] = owner;
+	}
+
+	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
+
+	/* TODO: To be updated later by AIA in-kernel irqchip support */
+	if (hgei_va)
+		*hgei_va = NULL;
+	if (hgei_pa)
+		*hgei_pa = 0;
+
+	return ret;
+}
+
+void kvm_riscv_aia_free_hgei(int cpu, int hgei)
+{
+	unsigned long flags;
+	struct aia_hgei_control *hgctrl = per_cpu_ptr(&aia_hgei, cpu);
+
+	if (!kvm_riscv_aia_available() || !hgctrl)
+		return;
+
+	raw_spin_lock_irqsave(&hgctrl->lock, flags);
+
+	if (hgei > 0 && hgei <= kvm_riscv_aia_nr_hgei) {
+		if (!(hgctrl->free_bitmap & BIT(hgei))) {
+			hgctrl->free_bitmap |= BIT(hgei);
+			hgctrl->owners[hgei] = NULL;
+		}
+	}
+
+	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
+}
+
+void kvm_riscv_aia_wakeon_hgei(struct kvm_vcpu *owner, bool enable)
+{
+	int hgei;
+
+	if (!kvm_riscv_aia_available())
+		return;
+
+	hgei = aia_find_hgei(owner);
+	if (hgei > 0) {
+		if (enable)
+			csr_set(CSR_HGEIE, BIT(hgei));
+		else
+			csr_clear(CSR_HGEIE, BIT(hgei));
+	}
+}
+
+static irqreturn_t hgei_interrupt(int irq, void *dev_id)
+{
+	int i;
+	unsigned long hgei_mask, flags;
+	struct aia_hgei_control *hgctrl = get_cpu_ptr(&aia_hgei);
+
+	hgei_mask = csr_read(CSR_HGEIP) & csr_read(CSR_HGEIE);
+	csr_clear(CSR_HGEIE, hgei_mask);
+
+	raw_spin_lock_irqsave(&hgctrl->lock, flags);
+
+	for_each_set_bit(i, &hgei_mask, BITS_PER_LONG) {
+		if (hgctrl->owners[i])
+			kvm_vcpu_kick(hgctrl->owners[i]);
+	}
+
+	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
+
+	put_cpu_ptr(&aia_hgei);
+	return IRQ_HANDLED;
+}
+
+static int aia_hgei_init(void)
+{
+	int cpu, rc;
+	struct irq_domain *domain;
+	struct aia_hgei_control *hgctrl;
+
+	/* Initialize per-CPU guest external interrupt line management */
+	for_each_possible_cpu(cpu) {
+		hgctrl = per_cpu_ptr(&aia_hgei, cpu);
+		raw_spin_lock_init(&hgctrl->lock);
+		if (kvm_riscv_aia_nr_hgei) {
+			hgctrl->free_bitmap =
+				BIT(kvm_riscv_aia_nr_hgei + 1) - 1;
+			hgctrl->free_bitmap &= ~BIT(0);
+		} else
+			hgctrl->free_bitmap = 0;
+	}
+
+	/* Find INTC irq domain */
+	domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(),
+					  DOMAIN_BUS_ANY);
+	if (!domain) {
+		kvm_err("unable to find INTC domain\n");
+		return -ENOENT;
+	}
+
+	/* Map per-CPU SGEI interrupt from INTC domain */
+	hgei_parent_irq = irq_create_mapping(domain, IRQ_S_GEXT);
+	if (!hgei_parent_irq) {
+		kvm_err("unable to map SGEI IRQ\n");
+		return -ENOMEM;
+	}
+
+	/* Request per-CPU SGEI interrupt */
+	rc = request_percpu_irq(hgei_parent_irq, hgei_interrupt,
+				"riscv-kvm", &aia_hgei);
+	if (rc) {
+		kvm_err("failed to request SGEI IRQ\n");
+		return rc;
+	}
+
+	return 0;
+}
+
+static void aia_hgei_exit(void)
+{
+	/* Free per-CPU SGEI interrupt */
+	free_percpu_irq(hgei_parent_irq, &aia_hgei);
+}
+
 void kvm_riscv_aia_enable(void)
 {
 	if (!kvm_riscv_aia_available())
@@ -362,21 +540,82 @@ void kvm_riscv_aia_enable(void)
 	csr_write(CSR_HVIPRIO1H, 0x0);
 	csr_write(CSR_HVIPRIO2H, 0x0);
 #endif
+
+	/* Enable per-CPU SGEI interrupt */
+	enable_percpu_irq(hgei_parent_irq,
+			  irq_get_trigger_type(hgei_parent_irq));
+	csr_set(CSR_HIE, BIT(IRQ_S_GEXT));
 }
 
 void kvm_riscv_aia_disable(void)
 {
+	int i;
+	unsigned long flags;
+	struct kvm_vcpu *vcpu;
+	struct aia_hgei_control *hgctrl;
+
 	if (!kvm_riscv_aia_available())
 		return;
+	hgctrl = get_cpu_ptr(&aia_hgei);
+
+	/* Disable per-CPU SGEI interrupt */
+	csr_clear(CSR_HIE, BIT(IRQ_S_GEXT));
+	disable_percpu_irq(hgei_parent_irq);
 
 	aia_set_hvictl(false);
+
+	raw_spin_lock_irqsave(&hgctrl->lock, flags);
+
+	for (i = 0; i <= kvm_riscv_aia_nr_hgei; i++) {
+		vcpu = hgctrl->owners[i];
+		if (!vcpu)
+			continue;
+
+		/*
+		 * We release hgctrl->lock before notifying IMSIC
+		 * so that we don't have lock ordering issues.
+		 */
+		raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
+
+		/* Notify IMSIC */
+		kvm_riscv_vcpu_aia_imsic_release(vcpu);
+
+		/*
+		 * Wakeup VCPU if it was blocked so that it can
+		 * run on other HARTs
+		 */
+		if (csr_read(CSR_HGEIE) & BIT(i)) {
+			csr_clear(CSR_HGEIE, BIT(i));
+			kvm_vcpu_kick(vcpu);
+		}
+
+		raw_spin_lock_irqsave(&hgctrl->lock, flags);
+	}
+
+	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
+
+	put_cpu_ptr(&aia_hgei);
 }
 
 int kvm_riscv_aia_init(void)
 {
+	int rc;
+
 	if (!riscv_isa_extension_available(NULL, SxAIA))
 		return -ENODEV;
 
+	/* Figure-out number of bits in HGEIE */
+	csr_write(CSR_HGEIE, -1UL);
+	kvm_riscv_aia_nr_hgei = fls_long(csr_read(CSR_HGEIE));
+	csr_write(CSR_HGEIE, 0);
+	if (kvm_riscv_aia_nr_hgei)
+		kvm_riscv_aia_nr_hgei--;
+
+	/* Initialize guest external interrupt line management */
+	rc = aia_hgei_init();
+	if (rc)
+		return rc;
+
 	/* Enable KVM AIA support */
 	static_branch_enable(&kvm_riscv_aia_available);
 
@@ -385,4 +624,9 @@ int kvm_riscv_aia_init(void)
 
 void kvm_riscv_aia_exit(void)
 {
+	if (!kvm_riscv_aia_available())
+		return;
+
+	/* Cleanup the HGEI state */
+	aia_hgei_exit();
 }
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index a7112d583637..48ae0d4b3932 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -116,7 +116,8 @@ static int __init riscv_kvm_init(void)
 	kvm_info("VMID %ld bits available\n", kvm_riscv_gstage_vmid_bits());
 
 	if (kvm_riscv_aia_available())
-		kvm_info("AIA available\n");
+		kvm_info("AIA available with %d guest external interrupts\n",
+			 kvm_riscv_aia_nr_hgei);
 
 	rc = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 	if (rc) {
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 8bd9f2a8a0b9..2db62c6c0d3e 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -250,10 +250,12 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
 {
+	kvm_riscv_aia_wakeon_hgei(vcpu, true);
 }
 
 void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
 {
+	kvm_riscv_aia_wakeon_hgei(vcpu, false);
 }
 
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
