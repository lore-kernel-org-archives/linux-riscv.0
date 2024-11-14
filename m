Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207C1D68B33
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 16:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3hueZAnaBcZtBXl42pqbnnjdF01XScZVJDO3SULH0ZA=; b=uZuPlmAtVjkjq5
	R1uK15U1iai6+8U92Wt4UAmAHOdxOc2gGLoMLCwq6EOcfkBIyaU0XCe5wyk/+FaxqApyRDTz7PCYd
	PzjHr5PUroh6Pv/HxVUjTSczZZuWLx6WKRobhDWLXKsDAzqsY/OTA3FHAMFc093TD8/NYDppjw8Xo
	Fy26z/7G3huLy+7C6zS9iMRkQ32U2VLE2MIwrHLj6FKWIM/Odt+GekVvScDK6VfCzyGrxUyqUFtgP
	tVg0PJ7reF3bYPOvjHc71m7LFreWNMz2342D7XkPmXp4Qc/dhrayIQOhbCHKkb837YM8mPSniY02o
	KLXUfBdJTF+GqXuSleNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYo-000000005I2-1Iy3;
	Thu, 14 Nov 2024 16:19:10 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYk-00000000590-3Kz1
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 16:19:08 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-37d3e8d923fso603240f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 08:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731601145; x=1732205945; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmyAZwFmuLjn3p39hRK9ePQAJ1PSqwbQ6F/1nOHrEzM=;
        b=BtURKijusQ8qUDW00fdt1p0pRzR3a0izYughCWMcDtAPuX8I8YU3rHjZ/i1P8/Ivvr
         7TPVqBkFdANSnB0/SPHgTEzTbV5sIQIMqxKcNfGGzf480SsECIdGmF8SDPSb4VElWEK1
         kzsyG7qFM+XCpV9tY8wRZJhicbNI1OYo8/P9UlPvS8uZlvyUwpcFE3Jg8FlFhJ8sCHFo
         daKIjwYeCq5/gFkpUI9wmu243IDAjKcncqqLsmlHiQwunSk5Wc0NxIM5Zzla+BV9mauw
         Wv0SmaArA6bcAKfB46Rr+d6ystP0ozP6vXk1etZVneA36us/7OSlq0bae4J16eKiZmTB
         vHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731601145; x=1732205945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmyAZwFmuLjn3p39hRK9ePQAJ1PSqwbQ6F/1nOHrEzM=;
        b=uFK0xGAjnuhJyWL4shUGgHLGszUDxZIm5Y2ULU38UafeVJi0TR84dUL2azxOklVYhA
         vvk1LJ2C/aatWPvXrUWESAdnLg5Iy+476i4lolTz2JdEXRdJxtXBC3Tp9CIvLyr4X/+r
         ziNlF3xIaZbZ9MTR7JzeDHNdbzLFbV9yVhAgki3Q7ED+hZo1Xbq/yvGowRl/6vU2FGGC
         20BK/BT1V/VwveoX1dqWgk8U7tlh3NYdcVUVcL8s85AiW2BTSj1+GDTZEEhIT53ZPwC/
         dWMa3oB862aM/IoUsEqV+4wkST3uqk0SBpbuBZIO3WPAv488QxnmNWZKTW3wzZ3Vh5Jp
         tCYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0FtXTDgHquye7QOOv0t8VuST2kt0rsw/Xq8s98uBbZYNyGTrghZdQ7fnfyfbixKEvHzU6chul677uww==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxQEtn4QNbLWhStRm2MRMSrDYKwnHxqpGfqLIbBRkoLuyQrqbo
	kMICpoIIpjYQ/+Vqgyqu0/SclsIcu66CP80Y9y2FVcMHvcOkUYAmsulMhoo6wmc=
X-Google-Smtp-Source: AGHT+IEn3qlHsw/D0PT2IEwLbgj1uEV7tnlyKBH8z2H1adqlOAImJaC/GmimW4BKxNwCPjE/Y1igiA==
X-Received: by 2002:a05:6000:210e:b0:382:424:94fe with SMTP id ffacd0b85a97d-382042495edmr11613726f8f.36.1731601144686;
        Thu, 14 Nov 2024 08:19:04 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ae161d8sm1901964f8f.78.2024.11.14.08.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:19:04 -0800 (PST)
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
Subject: [RFC PATCH 10/15] RISC-V: KVM: Add irqbypass skeleton
Date: Thu, 14 Nov 2024 17:18:55 +0100
Message-ID: <20241114161845.502027-27-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_081906_881037_EB7D5937 
X-CRM114-Status: GOOD (  12.52  )
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

Add all the functions needed to wire up irqbypass support.
kvm_arch_update_irqfd_routing() is left unimplemented, so return
false from kvm_arch_has_irq_bypass().

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h |  3 ++
 arch/riscv/kvm/Kconfig            |  1 +
 arch/riscv/kvm/aia_imsic.c        |  6 ++++
 arch/riscv/kvm/vm.c               | 60 +++++++++++++++++++++++++++++++
 4 files changed, 70 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 35eab6e0f4ae..fef7422939f6 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -114,6 +114,9 @@ struct kvm_arch {
 
 	/* AIA Guest/VM context */
 	struct kvm_aia aia;
+
+#define __KVM_HAVE_ARCH_ASSIGNED_DEVICE
+	atomic_t assigned_device_count;
 };
 
 struct kvm_cpu_trap {
diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 333d95da8ebe..9a4feb1e671d 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -21,6 +21,7 @@ config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
 	depends on RISCV_SBI && MMU
 	select HAVE_KVM_IRQCHIP
+	select HAVE_KVM_IRQ_BYPASS
 	select HAVE_KVM_IRQ_ROUTING
 	select HAVE_KVM_MSI
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index a8085cd8215e..64b1f3713dd5 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -727,6 +727,12 @@ void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
 	kvm_riscv_aia_free_hgei(old_vsfile_cpu, old_vsfile_hgei);
 }
 
+int kvm_arch_update_irqfd_routing(struct kvm *kvm, unsigned int host_irq,
+				  uint32_t guest_irq, bool set)
+{
+	return -ENXIO;
+}
+
 int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
 {
 	unsigned long flags;
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 7396b8654f45..9c5837518c1a 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -11,6 +11,9 @@
 #include <linux/module.h>
 #include <linux/uaccess.h>
 #include <linux/kvm_host.h>
+#include <linux/kvm_irqfd.h>
+
+#include <asm/kvm_aia.h>
 
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_GENERIC_VM_STATS()
@@ -55,6 +58,63 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 	kvm_riscv_aia_destroy_vm(kvm);
 }
 
+void kvm_arch_start_assignment(struct kvm *kvm)
+{
+	atomic_inc(&kvm->arch.assigned_device_count);
+}
+EXPORT_SYMBOL_GPL(kvm_arch_start_assignment);
+
+void kvm_arch_end_assignment(struct kvm *kvm)
+{
+	atomic_dec(&kvm->arch.assigned_device_count);
+}
+EXPORT_SYMBOL_GPL(kvm_arch_end_assignment);
+
+bool noinstr kvm_arch_has_assigned_device(struct kvm *kvm)
+{
+	return arch_atomic_read(&kvm->arch.assigned_device_count);
+}
+EXPORT_SYMBOL_GPL(kvm_arch_has_assigned_device);
+
+bool kvm_arch_has_irq_bypass(void)
+{
+	return false;
+}
+
+int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *cons,
+				     struct irq_bypass_producer *prod)
+{
+	struct kvm_kernel_irqfd *irqfd =
+		container_of(cons, struct kvm_kernel_irqfd, consumer);
+	int ret;
+
+	irqfd->producer = prod;
+	kvm_arch_start_assignment(irqfd->kvm);
+	ret = kvm_arch_update_irqfd_routing(irqfd->kvm, prod->irq, irqfd->gsi, true);
+	if (ret)
+		kvm_arch_end_assignment(irqfd->kvm);
+
+	return ret;
+}
+
+void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
+				      struct irq_bypass_producer *prod)
+{
+	struct kvm_kernel_irqfd *irqfd =
+		container_of(cons, struct kvm_kernel_irqfd, consumer);
+	int ret;
+
+	WARN_ON(irqfd->producer != prod);
+	irqfd->producer = NULL;
+
+	ret = kvm_arch_update_irqfd_routing(irqfd->kvm, prod->irq, irqfd->gsi, false);
+	if (ret)
+		pr_info("irq bypass consumer (token %p) unregistration fails: %d\n",
+			irqfd->consumer.token, ret);
+
+	kvm_arch_end_assignment(irqfd->kvm);
+}
+
 int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irql,
 			  bool line_status)
 {
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
