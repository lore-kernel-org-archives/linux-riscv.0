Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201DECAC5A5
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hT6njIug7D2iUHiP4sKzLjMOCiKgmAZBROOYRS3nUJA=; b=vEKlU/DdEFz3Mh
	NBp0q7LF34atXJTjrHpvQUkQqsqlsJfwm+fpaz8cZ82BHqJfbyKgbEbtZi33Lgi/KBD1tc/wlSVik
	qg/wNeiSjgd2oxCmjSA8mSCiLZWMToW7x+cYUrjWNugLavdwZqkygVfY5OjxIgIA4wzKkB/2QYGLD
	jj3upl4bHWdFoUuYTNcPrDSJdAdpgdRAQqUVEszC8ZiBSx1jKYjdT6t1+xP9maiMTDf6ZjduIEJE4
	8Gire7UIwBIF1udqpvUJ7OnfGzyDNdAvCZdV1ZRFEfaUegk1ihBKDRRVQYu+yB5GaTDji4nHhtSKb
	8lfmoxHVtNmD1wzQKQkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04Mb-00000005ttr-2OsT;
	Sat, 20 Sep 2025 20:39:21 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MU-00000005tcp-06bG
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:39:15 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-88762f20125so307800839f.0
        for <linux-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400752; x=1759005552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8WX1C9GPAWWC8UTFlF9ZhDr+Hidw1k8q7PXizEBEqk=;
        b=DY7TkgErDGQoPLqB8R9rpJE6UIYnZSt2bb0T21uCRLuWKMmJB7iVPk0U68rw3Cgwjw
         3ZfTfYf8yDctswIZfFp37nToa6HgQyW0M/glV0Nk0efkGVtXM4eeVXuR2cqNQjZybwFH
         2nkjJIXosOvVJo1ugjOsD1jUFz3SAmUPpUpHtIxo/kQzmfraSn/bGH+J+3X7Y/KeE3Zg
         6Vs76X4l93YCVwFxQai/kJfukrIdXoaBffIfxiywYJF7VpnifuOZDu8PKwn00iAcQt9w
         W1VTEL4Wl5OKSuVzSlmoMlnwgZB12JCmSdASJBmGZLXMNXOLKUAze07B4uqiQrYbLVRO
         W7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400752; x=1759005552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8WX1C9GPAWWC8UTFlF9ZhDr+Hidw1k8q7PXizEBEqk=;
        b=ZyJl5x9rWy++IduTOCgPgEKw+JrQ2A83h76e23QR78Oj94FUQJVfrqCm+irRnhTI0O
         uMzLnjG1xWA4IRd+OtccjXNXDnDCGTZnHuqUpULeKO3NM5Nu+PI7wlRUVaRug0nH8f8h
         qqWls1NcxZimiOL442B+l50GLNdhwNnuViQL/sqHFbdjwsq90x0hUcQcqh7D9Xo/trAa
         S5kqs7Tf50XpruI2uyOuSX841m7Zd2KRsXMAAC0HJnEmjkQsRAZSqQ1ARMV+VA01BoEq
         w7dcjUt16w3cgEMW7VYRJpCuv045euVyZkMfwSGzs7H1M8WyXiE1GVgLpH/XPA8qCXHE
         aLSg==
X-Forwarded-Encrypted: i=1; AJvYcCXVIsipFkxfknw+mY5lRRRpAma/LFvqmuPSqNwfQMALbEQkGnyH3/gMfa1lHVg0kcWLwhaMhFHIazQtfg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz80un6pBYwM9kJvKHjaCjEz7hqvSYSzhrrprxQLA+3c/ulodIx
	tDmXzxm44BHXeK9qHgBes8/b8C40q1/SYbG8m8V6A2E3GkM9rHFu1G2isUyfjiYVFM0=
X-Gm-Gg: ASbGncuRh6pkVnfA0+Z8pLyQLdO12gmaDVYT9lJHWsO9vi6VlbwDugNVHI5Ho4bnTdI
	RQ9m52UoubJ1QqzYrkXNlt7XkvXHEbCj8lmJ7365iZ35w1me9G+p4geBttbcGvXl2Y1Z39vSYta
	M27QjCOM2xEmMFMHqi/12UjCxqJzSmjo0B0oasHDGJZRNx45EjQV/UbraAJK7O3l+jhvISQoLnQ
	YHPJPbgbn+B2G8IOCvQoWlcYfqqGreeC7MGyzS1L2UZt5eiVqIX0lWJVzvfXjnHIJlzh765AjqC
	7Yht3MYdPqeLwwpcVjw5pYtfSnz2JTmqJWeCDkwfeozB2cZRUezQXxCKZkseGGH/7Dn63LTMnsJ
	rH0pkv5igOdlleWvSIhkJwYlp
X-Google-Smtp-Source: AGHT+IEw0TKfGEJ+b3BMNokPnUzbTHiLPG9/O6bJ0/KE+jKkggTkLT3hwVdxbWwTqoRlHAMYp3DVrA==
X-Received: by 2002:a05:6602:3809:b0:89a:674d:93aa with SMTP id ca18e2360f4ac-8adbd77fbafmr1269552139f.0.1758400752391;
        Sat, 20 Sep 2025 13:39:12 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8a4832339c5sm292330039f.26.2025.09.20.13.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:39:11 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com,
	zong.li@sifive.com,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr
Subject: [RFC PATCH v2 15/18] RISC-V: KVM: Add guest file irqbypass support
Date: Sat, 20 Sep 2025 15:39:05 -0500
Message-ID: <20250920203851.2205115-35-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133914_098422_4B6CC13C 
X-CRM114-Status: GOOD (  20.01  )
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

Add all the functions needed to wire up irqbypass support and
implement kvm_arch_update_irqfd_routing() which makes
irq_set_vcpu_affinity() calls whenever the assigned device updates
its target addresses. Also implement calls to irq_set_vcpu_affinity()
from kvm_riscv_vcpu_aia_imsic_update() which are needed to update
the IOMMU mappings when the hypervisor migrates a VCPU to another
CPU (requiring a change to the target guest interrupt file).

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/Kconfig     |   1 +
 arch/riscv/kvm/aia_imsic.c | 143 ++++++++++++++++++++++++++++++++++++-
 arch/riscv/kvm/vm.c        |  31 ++++++++
 3 files changed, 173 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 968a33ab23b8..76cfd85c5c40 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -21,6 +21,7 @@ config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support"
 	depends on RISCV_SBI && MMU
 	select HAVE_KVM_IRQCHIP
+	select HAVE_KVM_IRQ_BYPASS
 	select HAVE_KVM_IRQ_ROUTING
 	select HAVE_KVM_MSI
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index fda0346f0ea1..148ae94fa17b 100644
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
 #include <asm/kvm_mmu.h>
 
 #define IMSIC_MAX_EIX	(IMSIC_MAX_ID / BITS_PER_TYPE(u64))
@@ -719,6 +721,14 @@ void kvm_riscv_vcpu_aia_imsic_put(struct kvm_vcpu *vcpu)
 	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
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
@@ -769,6 +779,132 @@ void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
 	kvm_riscv_aia_free_hgei(old_vsfile_cpu, old_vsfile_hgei);
 }
 
+void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
+				   struct kvm_kernel_irq_routing_entry *old,
+				   struct kvm_kernel_irq_routing_entry *new)
+{
+	struct riscv_iommu_ir_vcpu_info vcpu_info;
+	struct kvm *kvm = irqfd->kvm;
+	struct kvm_aia *aia = &kvm->arch.aia;
+	int host_irq = irqfd->producer->irq;
+	struct irq_data *irqdata = irq_get_irq_data(host_irq);
+	unsigned long tmp, flags;
+	struct kvm_vcpu *vcpu;
+	struct imsic *imsic;
+	struct msi_msg msg;
+	u64 msi_addr_mask;
+	gpa_t target;
+	int ret;
+
+	if (old && old->type == KVM_IRQ_ROUTING_MSI &&
+	    new && new->type == KVM_IRQ_ROUTING_MSI &&
+	    !memcmp(&old->msi, &new->msi, sizeof(new->msi)))
+		return;
+
+	if (!new) {
+		if (!WARN_ON_ONCE(!old) && old->type == KVM_IRQ_ROUTING_MSI) {
+			ret = irq_set_vcpu_affinity(host_irq, NULL);
+			WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
+		}
+		return;
+	}
+
+	if (new->type != KVM_IRQ_ROUTING_MSI)
+		return;
+
+	target = ((gpa_t)new->msi.address_hi << 32) | new->msi.address_lo;
+	if (WARN_ON_ONCE(target & (IMSIC_MMIO_PAGE_SZ - 1)))
+		return;
+
+	msg = (struct msi_msg){
+		.address_hi = new->msi.address_hi,
+		.address_lo = new->msi.address_lo,
+		.data = new->msi.data,
+	};
+
+	kvm_for_each_vcpu(tmp, vcpu, kvm) {
+		if (target == vcpu->arch.aia_context.imsic_addr)
+			break;
+	}
+	if (!vcpu)
+		return;
+
+	msi_addr_mask = kvm_riscv_aia_msi_addr_mask(aia);
+	vcpu_info = (struct riscv_iommu_ir_vcpu_info){
+		.gpa = target,
+		.msi_addr_mask = msi_addr_mask,
+		.msi_addr_pattern = (target >> IMSIC_MMIO_PAGE_SHIFT) & ~msi_addr_mask,
+		.group_index_bits = aia->nr_group_bits,
+		.group_index_shift = aia->nr_group_shift,
+	};
+
+	imsic = vcpu->arch.aia_context.imsic_state;
+
+	read_lock_irqsave(&imsic->vsfile_lock, flags);
+
+	if (WARN_ON_ONCE(imsic->vsfile_cpu < 0))
+		goto out;
+
+	vcpu_info.hpa = imsic->vsfile_pa;
+
+	ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
+	WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
+	if (ret)
+		goto out;
+
+	irq_data_get_irq_chip(irqdata)->irq_write_msi_msg(irqdata, &msg);
+
+out:
+	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+}
+
+static void kvm_riscv_vcpu_irq_update(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
+	gpa_t gpa = vcpu->arch.aia_context.imsic_addr;
+	struct kvm_aia *aia = &kvm->arch.aia;
+	u64 msi_addr_mask = kvm_riscv_aia_msi_addr_mask(aia);
+	struct riscv_iommu_ir_vcpu_info vcpu_info = {
+		.gpa = gpa,
+		.hpa = imsic->vsfile_pa,
+		.msi_addr_mask = msi_addr_mask,
+		.msi_addr_pattern = (gpa >> IMSIC_MMIO_PAGE_SHIFT) & ~msi_addr_mask,
+		.group_index_bits = aia->nr_group_bits,
+		.group_index_shift = aia->nr_group_shift,
+	};
+	struct kvm_kernel_irq_routing_entry *irq_entry;
+	struct kvm_kernel_irqfd *irqfd;
+	gpa_t target;
+	int host_irq, ret;
+
+	spin_lock_irq(&kvm->irqfds.lock);
+
+	list_for_each_entry(irqfd, &kvm->irqfds.items, list) {
+		if (!irqfd->producer)
+			continue;
+
+		irq_entry = &irqfd->irq_entry;
+		if (irq_entry->type != KVM_IRQ_ROUTING_MSI)
+			continue;
+
+		target = ((gpa_t)irq_entry->msi.address_hi << 32) | irq_entry->msi.address_lo;
+		if (WARN_ON_ONCE(target & (IMSIC_MMIO_PAGE_SZ - 1)))
+			continue;
+
+		if (target != gpa)
+			continue;
+
+		host_irq = irqfd->producer->irq;
+		ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
+		WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
+		if (ret == -EOPNOTSUPP)
+			break;
+	}
+
+	spin_unlock_irq(&kvm->irqfds.lock);
+}
+
 int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
 {
 	unsigned long flags;
@@ -836,14 +972,17 @@ int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
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
index 66d91ae6e9b2..1d33cff73e00 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -11,6 +11,8 @@
 #include <linux/module.h>
 #include <linux/uaccess.h>
 #include <linux/kvm_host.h>
+#include <linux/kvm_irqfd.h>
+#include <asm/kvm_aia.h>
 #include <asm/kvm_mmu.h>
 
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
@@ -56,6 +58,35 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 	kvm_riscv_aia_destroy_vm(kvm);
 }
 
+bool kvm_arch_has_irq_bypass(void)
+{
+	return true;
+}
+
+int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *cons,
+				     struct irq_bypass_producer *prod)
+{
+	struct kvm_kernel_irqfd *irqfd =
+		container_of(cons, struct kvm_kernel_irqfd, consumer);
+
+	irqfd->producer = prod;
+	kvm_arch_update_irqfd_routing(irqfd, NULL, &irqfd->irq_entry);
+
+	return 0;
+}
+
+void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
+				      struct irq_bypass_producer *prod)
+{
+	struct kvm_kernel_irqfd *irqfd =
+		container_of(cons, struct kvm_kernel_irqfd, consumer);
+
+	WARN_ON(irqfd->producer != prod);
+
+	kvm_arch_update_irqfd_routing(irqfd, &irqfd->irq_entry, NULL);
+	irqfd->producer = NULL;
+}
+
 int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irql,
 			  bool line_status)
 {
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
