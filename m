Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B803C761A6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 15:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQYpoFzPCeKUbrLs4/U9rR8DATmxAjWTKHw9I61d8g4=; b=q/Sx25pRwEoW64
	VfbRyalecWyY8E/HvkkjkmNfcB+wxPZpj+xh+yubXrkTga5/8ty4A8Ja8TvlM6Nr6MEduWuDyFgga
	dLf+VIOprsmRw9J2xlAD07tMBH75YG9ClAI9IEA1vh+D0htTL5WYjlpaAW5/zn6gCTt8QdwRUoH23
	WfbMbXcylRfYorYbeXbHwEKSislHVpPVB6fyh+ph/KdVfkabevzNsaRWBpvZcERPNImbfMP77IFR2
	sjLOYnpdvSO/LI8OKvoiCTjqJ4f1GMhf/WfoVEgGgW2hMuTdWtP1uHT03B6T8p+IRoX+hlNAY4a7s
	ycDiQH2tTwKYTPbhkJiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjiha-0021bP-15;
	Tue, 04 Apr 2023 15:36:06 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjihX-00218z-0t
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 15:36:05 +0000
Received: by mail-oi1-x22e.google.com with SMTP id w13so13120455oik.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 08:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680622563; x=1683214563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHJz7LoGzJAaY+a2gjipZQgKBTwuq7YhNeEdYRTEY44=;
        b=gzRotIn5Hrh2y3yBI2Mbq86dmRN4WVORLHIDPBOP/Z0/e5+oB8m9vs3ToD4r1K3cN0
         cSuXTIUbb5a4Yx+WUhAL1zRY4aUWXBOX1ijb0gmPbJmGZE5G41ufKq9yF/8NntQ5moFA
         qS5qBhqQszpTnlB1pEE6M7JThhBbNL/HJtBisD95mWLztKg2CHVZ1IALyAV+4x5BxmD2
         klvotJd7+Gq76CQuG1eijRhaB5iU9BGfXn3G8D0BTO1p8WHnIXbuJuIsfGE9vzlJagzp
         UGu9PQ14sgPkAlFpdAw8ruzePTywhl5+ej1j/jbGIB6AYPVshra9HaOc0DG9UsZxENP3
         fsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680622563; x=1683214563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHJz7LoGzJAaY+a2gjipZQgKBTwuq7YhNeEdYRTEY44=;
        b=v8Ts2Cc8Qts3JcDz6fiBBET7D5uK+IYmpUBMnQ3WJ067ICEziyu7IetKCl0sOqW/mv
         K42mawE3cyuPV9ivwDqTmILmlOImSJe6wbpGuXs/3GZUeuNtNkdwoI5wgH+m0nOXDAcf
         QFiw60ZWx3e9oFZWSp9FyVENaxhAgoFds4iN+obmuMG6zfqMw8pbK6k9LBoDF05rkeyP
         0lNFjisfhRQhu/tnA+3eVuT0UCHeGTUM3gtffn1oXZ449twXdOEvRQpCoh2JQj5zr1Oi
         brEh67pRr1vd56j+kqZ2RZB2HF+GThsot8hfruR7WRId/gIKa5G1um7tPl5j48qb9PCD
         pECw==
X-Gm-Message-State: AAQBX9cmgRS7L0vr4xXUgu+5R6jsXcEGaCgWLPbwuZuu6ISUfIyC+tht
	AzbB50Ye1bMYP4Q6RXYWyzFmGA==
X-Google-Smtp-Source: AKy350ZD0dsZP92XtBwe05izfKnQBfkPMC8uXEUeowtbU3CpVFkekRnjrHqrsVpC35RhiKj3egcCeA==
X-Received: by 2002:aca:910:0:b0:387:3239:61f3 with SMTP id 16-20020aca0910000000b00387323961f3mr1508750oij.21.1680622562763;
        Tue, 04 Apr 2023 08:36:02 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w124-20020acadf82000000b00387384dc768sm5325803oig.9.2023.04.04.08.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 08:36:02 -0700 (PDT)
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
Subject: [PATCH v4 9/9] RISC-V: KVM: Implement guest external interrupt line management
Date: Tue,  4 Apr 2023 21:04:52 +0530
Message-Id: <20230404153452.2405681-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404153452.2405681-1-apatel@ventanamicro.com>
References: <20230404153452.2405681-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_083603_315901_469AAC97 
X-CRM114-Status: GOOD (  22.36  )
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
---
 arch/riscv/include/asm/kvm_aia.h |  10 ++
 arch/riscv/kvm/aia.c             | 239 +++++++++++++++++++++++++++++++
 arch/riscv/kvm/main.c            |   3 +-
 arch/riscv/kvm/vcpu.c            |   2 +
 4 files changed, 253 insertions(+), 1 deletion(-)

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
index 4bf1e83add55..d5585992d3d9 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -8,11 +8,46 @@
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
+	struct aia_hgei_control *hgctrl = this_cpu_ptr(&aia_hgei);
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
+	return hgei;
+}
+
 static void aia_set_hvictl(bool ext_irq_pending)
 {
 	unsigned long hvictl;
@@ -56,6 +91,7 @@ void kvm_riscv_vcpu_aia_sync_interrupts(struct kvm_vcpu *vcpu)
 
 bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
 {
+	int hgei;
 	unsigned long seip;
 
 	if (!kvm_riscv_aia_available())
@@ -74,6 +110,10 @@ bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
 	if (!kvm_riscv_aia_initialized(vcpu->kvm) || !seip)
 		return false;
 
+	hgei = aia_find_hgei(vcpu);
+	if (hgei > 0)
+		return !!(csr_read(CSR_HGEIP) & BIT(hgei));
+
 	return false;
 }
 
@@ -348,6 +388,142 @@ int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
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
+	struct aia_hgei_control *hgctrl = this_cpu_ptr(&aia_hgei);
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
@@ -362,21 +538,79 @@ void kvm_riscv_aia_enable(void)
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
+	struct aia_hgei_control *hgctrl = this_cpu_ptr(&aia_hgei);
+
 	if (!kvm_riscv_aia_available())
 		return;
 
+	/* Disable per-CPU SGEI interrupt */
+	csr_clear(CSR_HIE, BIT(IRQ_S_GEXT));
+	disable_percpu_irq(hgei_parent_irq);
+
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
 
@@ -385,4 +619,9 @@ int kvm_riscv_aia_init(void)
 
 void kvm_riscv_aia_exit(void)
 {
+	if (!kvm_riscv_aia_available())
+		return;
+
+	/* Cleanup the HGEI state */
+	aia_hgei_exit();
 }
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 6396352b4e4d..b0b46f48f31e 100644
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
index 811c7e9a308c..c8f3ea84385c 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -249,10 +249,12 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
 
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
