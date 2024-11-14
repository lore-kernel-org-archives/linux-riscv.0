Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D4ED68B35
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 16:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8GjQfztaKOsY8sKSnDSLD7JgqNpChQbAuiDP1B14ws=; b=L63n4cvcUExEuQ
	OlG3S4jxoqp2+hh6Hf4/IxiF8uKcrad/POYeQzZ796PN4LsAuzRtiCz3SeYRr1yfFimXpehkp6Nv3
	7iTnamtxgpkCRSx80p4o1yT+8RP4SthqOqGxAzGNGmD29JWobzoZ5F7UIIJBZQ7W89kg+osaetr55
	W1nlHp5OR4rHiriHqXWfU4XmlVz2UcciX2Q9E3njnS6DGop0g0UQ5lOkOy5S76oRoo1T/GWNeoDZY
	Zr9SsBzudRpnMryeinO0LgxYiPN3owCvIOxzDOf/lyXrifjRBXwx9DLx89GDXx1bBu+hJft8wtAtE
	3HqAucIv+iYAAJxQ0PIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYv-000000005Vv-24hc;
	Thu, 14 Nov 2024 16:19:17 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYo-000000005Ge-2FOh
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 16:19:11 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so7197305e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 08:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731601149; x=1732205949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFFBRicSLcryUXTcW4czNg2bW4hUi+sNV0Va2EAONJ0=;
        b=J63P6Iu3Xx9C0kUpKwVtKPntZDviRzlNVMYuDadWrpY8S4DRYO8MT03W3lVckFmOB1
         ZXX5ZXpUBULvRIxZk61SlWztykhynKEP4RApPnb8jMFOhNQbMkN6yx6IKQ0Ltwiz24W9
         8Z0Dz3CeJXOS6yHUndSY+bdII+1R0lt99eC+QcdOCE+j3mG9CYu3MDJowVSG5la95Qys
         C17h/D3lqI9WcvuRROgPKOyRWI1WIIdCt8OF6f5+StMJFIBJ4sbVwtBxjZFEW3NnHNva
         pz81qcWLSCOCd//zB46GRbCuLLmbYn3xrH6CrFyxgDrj7xBXrRUGCUktX3ip6JO7+HZh
         s/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731601149; x=1732205949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFFBRicSLcryUXTcW4czNg2bW4hUi+sNV0Va2EAONJ0=;
        b=jan9wiFwFUvyysjUkxJxd/TdOoAbyfKl73EYQnsEmYbhBP2Y3Tk6jAkrqo3Z9CrAlZ
         lTkZznsch2f9+TtYM7HkLTMpzL+s0wWwgak0dJoW3W5CouKQSLXoy6wHWKD49gmqOl9Q
         Sd5IjB8NFfoAX8Cd4dWe+Nn5kvwfzHPZcFTKzpWYkoCqkICb5pchusqGCJ3hExE0kNZ5
         en0PwB4kzB/pZfyVhAdZoBS8C6Kv0FbxyVdol5yM1hPtzpWW1Q4iaGqRVhqVxJfhnFCj
         yYqv8/SdiUlywMJzsDiVaoyb45pE/Rs94WTbVN+JRhfScnELl4uL3ej+zkwX4rp0cxok
         FCiw==
X-Forwarded-Encrypted: i=1; AJvYcCXXalC2y8X/BdS1WY/BMdEOlhVJUAZRbMqNYsxIG0CE9BymeFlmsNN1DE7En2qe3UafGDYDGBxIM1uoXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWQS2Lk6ujwBSLhfv1hbIwGzbbtZSlw624x/OQKZc9rVO3MCxJ
	rr88GQB8RD7e/nkE2DuqkVm4yyzpmhxLuOMuzqiVgNR04f+gtTM0BVcFCg7uUmmdNX8K/RuUXW2
	DCAI=
X-Google-Smtp-Source: AGHT+IFGPNdzokCF0Smmz2HXrxBVONdHjbl61VaRzcWcWTFU5SBB8vXJqki1qLp7dZUHNDK1wlI75g==
X-Received: by 2002:a05:600c:a48:b0:431:5f1c:8359 with SMTP id 5b1f17b1804b1-432d4ab9134mr73117815e9.15.1731601149016;
        Thu, 14 Nov 2024 08:19:09 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da28b76fsm29185835e9.28.2024.11.14.08.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:19:08 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: tjeznach@rivosinc.com,
	zong.li@sifive.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [RFC PATCH 13/15] RISC-V: KVM: Add guest file irqbypass support
Date: Thu, 14 Nov 2024 17:18:58 +0100
Message-ID: <20241114161845.502027-30-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_081910_642200_F93664FA 
X-CRM114-Status: GOOD (  18.23  )
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

Implement kvm_arch_update_irqfd_routing() which makes
irq_set_vcpu_affinity() calls whenever the assigned device updates
its target addresses and whenever the hypervisor has migrated a
VCPU to another CPU (which requires changing the guest interrupt
file).

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/aia_imsic.c | 132 ++++++++++++++++++++++++++++++++++++-
 arch/riscv/kvm/vm.c        |   2 +-
 2 files changed, 130 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 64b1f3713dd5..6a7c23e25f79 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -11,11 +11,13 @@
 #include <linux/bitmap.h>
 #include <linux/irqchip/riscv-imsic.h>
 #include <linux/kvm_host.h>
+#include <linux/kvm_irqfd.h>
 #include <linux/math.h>
 #include <linux/spinlock.h>
 #include <linux/swab.h>
 #include <kvm/iodev.h>
 #include <asm/csr.h>
+#include <asm/irq.h>
 
 #define IMSIC_MAX_EIX	(IMSIC_MAX_ID / BITS_PER_TYPE(u64))
 
@@ -676,6 +678,14 @@ static void imsic_swfile_update(struct kvm_vcpu *vcpu,
 	imsic_swfile_extirq_update(vcpu);
 }
 
+static u64 kvm_riscv_aia_msi_addr_mask(struct kvm_aia *aia)
+{
+	u64 group_mask = BIT(aia->nr_group_bits) - 1;
+
+	return (group_mask << (aia->nr_group_shift - IMSIC_MMIO_PAGE_SHIFT)) |
+	       (BIT(aia->nr_hart_bits + aia->nr_guest_bits) - 1);
+}
+
 void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
 {
 	unsigned long flags;
@@ -730,7 +740,120 @@ void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
 int kvm_arch_update_irqfd_routing(struct kvm *kvm, unsigned int host_irq,
 				  uint32_t guest_irq, bool set)
 {
-	return -ENXIO;
+	struct irq_data *irqdata = irq_get_irq_data(host_irq);
+	struct kvm_irq_routing_table *irq_rt;
+	struct kvm_vcpu *vcpu;
+	unsigned long tmp, flags;
+	int idx, ret = -ENXIO;
+
+	if (!set)
+		return irq_set_vcpu_affinity(host_irq, NULL);
+
+	idx = srcu_read_lock(&kvm->irq_srcu);
+	irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
+	if (guest_irq >= irq_rt->nr_rt_entries ||
+	    hlist_empty(&irq_rt->map[guest_irq])) {
+		pr_warn_once("no route for guest_irq %u/%u (broken user space?)\n",
+			     guest_irq, irq_rt->nr_rt_entries);
+		goto out;
+	}
+
+	kvm_for_each_vcpu(tmp, vcpu, kvm) {
+		struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
+		gpa_t ippn = vcpu->arch.aia_context.imsic_addr >> IMSIC_MMIO_PAGE_SHIFT;
+		struct kvm_aia *aia = &kvm->arch.aia;
+		struct kvm_kernel_irq_routing_entry *e;
+
+		hlist_for_each_entry(e, &irq_rt->map[guest_irq], link) {
+			struct msi_msg msg[2] = {
+			{
+				.address_hi = e->msi.address_hi,
+				.address_lo = e->msi.address_lo,
+				.data = e->msi.data,
+			},
+			};
+			struct riscv_iommu_vcpu_info vcpu_info = {
+				.msi_addr_mask = kvm_riscv_aia_msi_addr_mask(aia),
+				.group_index_bits = aia->nr_group_bits,
+				.group_index_shift = aia->nr_group_shift,
+			};
+			gpa_t target, tppn;
+
+			if (e->type != KVM_IRQ_ROUTING_MSI)
+				continue;
+
+			target = ((gpa_t)e->msi.address_hi << 32) | e->msi.address_lo;
+			tppn = target >> IMSIC_MMIO_PAGE_SHIFT;
+
+			WARN_ON(target & (IMSIC_MMIO_PAGE_SZ - 1));
+
+			if (ippn != tppn)
+				continue;
+
+			vcpu_info.msi_addr_pattern = tppn & ~vcpu_info.msi_addr_mask;
+			vcpu_info.gpa = target;
+
+			read_lock_irqsave(&imsic->vsfile_lock, flags);
+
+			if (WARN_ON_ONCE(imsic->vsfile_cpu < 0)) {
+				read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+				goto out;
+			}
+
+			vcpu_info.hpa = imsic->vsfile_pa;
+
+			ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
+			if (ret) {
+				read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+				goto out;
+			}
+
+			irq_data_get_irq_chip(irqdata)->irq_write_msi_msg(irqdata, msg);
+
+			read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+		}
+	}
+
+	ret = 0;
+out:
+	srcu_read_unlock(&kvm->irq_srcu, idx);
+	return ret;
+}
+
+static int kvm_riscv_vcpu_irq_update(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
+	struct kvm_aia *aia = &kvm->arch.aia;
+	u64 mask = kvm_riscv_aia_msi_addr_mask(aia);
+	u64 target = vcpu->arch.aia_context.imsic_addr;
+	struct riscv_iommu_vcpu_info vcpu_info = {
+		.msi_addr_pattern = (target >> IMSIC_MMIO_PAGE_SHIFT) & ~mask,
+		.msi_addr_mask = mask,
+		.group_index_bits = aia->nr_group_bits,
+		.group_index_shift = aia->nr_group_shift,
+		.gpa = target,
+		.hpa = imsic->vsfile_pa,
+	};
+	struct kvm_kernel_irqfd *irqfd;
+	int host_irq, ret;
+
+	spin_lock_irq(&kvm->irqfds.lock);
+
+	list_for_each_entry(irqfd, &kvm->irqfds.items, list) {
+		if (!irqfd->producer)
+			continue;
+		host_irq = irqfd->producer->irq;
+		ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
+		if (ret) {
+			spin_unlock_irq(&kvm->irqfds.lock);
+			return ret;
+		}
+	}
+
+	spin_unlock_irq(&kvm->irqfds.lock);
+
+	return 0;
 }
 
 int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
@@ -797,14 +920,17 @@ int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
 	if (ret)
 		goto fail_free_vsfile_hgei;
 
-	/* TODO: Update the IOMMU mapping ??? */
-
 	/* Update new IMSIC VS-file details in IMSIC context */
 	write_lock_irqsave(&imsic->vsfile_lock, flags);
+
 	imsic->vsfile_hgei = new_vsfile_hgei;
 	imsic->vsfile_cpu = vcpu->cpu;
 	imsic->vsfile_va = new_vsfile_va;
 	imsic->vsfile_pa = new_vsfile_pa;
+
+	/* Update the IOMMU mapping */
+	kvm_riscv_vcpu_irq_update(vcpu);
+
 	write_unlock_irqrestore(&imsic->vsfile_lock, flags);
 
 	/*
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 9c5837518c1a..5f697d9a37da 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -78,7 +78,7 @@ EXPORT_SYMBOL_GPL(kvm_arch_has_assigned_device);
 
 bool kvm_arch_has_irq_bypass(void)
 {
-	return false;
+	return true;
 }
 
 int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *cons,
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
