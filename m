Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B24C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 11:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Et5ovEiUVvmeU1KD2vA0h1dkmOm+JtDfyU52mZX38E=; b=RXL+nQQwy3VpI0
	B7MEJx5YfB/7zq7dZQBPlpxNoQGdQXawccox0txNaE9J+s9dkGV1PuG9/vdxPlNhlPFSMp6cBZrqF
	MKrTdUbaYMR3l2IM31d3K1tR2glPZo9LLorXWTLlWMoc3Xd4qRjMAVQZ6YwQ+9wDapEyRzlDixqsi
	mRSjMhuO8QrUpjPXy0Spph0QbQ7U2sAWlHlF/jF3Vr/PqlQt3wS0LmGd1NSEVQv2Z/c2ZIGKYax8+
	RzSAsk1kAXvnsfS3EyP5EqvrILUjK7DuENK2B31vMMo4Ut4VFm6jrr9ZpM+AK6r7/e2dFTDLVI7qA
	QWnG27iRh7KJxG577S2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFVs-009dmh-1C;
	Wed, 17 May 2023 11:40:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFVr-009dm7-1b
	for linux-riscv@bombadil.infradead.org;
	Wed, 17 May 2023 11:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XnOhsCKUNf4j2F648NsHEKKBHDpVNoPzgPfBBed6WBg=; b=RFJmyVUEl4zPnrowhRfAaRGPPq
	+x+1oZDYSR0NfubgUPA2ZKxOXW18HxQQ2EkoBEKc4HpBOtHRdQuaRU5FLfUD7qyJg3ScxHqgBlaKo
	uJ/1PSOE/Fl8V1oAAGvmPoMv5JL3djkZS9M3naVnbnKQolJqPPj6aK6hXirDYu5kkZ92EohiedwPm
	FVTkNb6dpIH/1g/CsKrTXNVBwdSf8hsHlF2IL16mROrOaVgXgjb3cso0NThGg11V5fGfNarFRJA8c
	G9GKaLSH7LSWGh1XEFUad71ejRpOOn1dGboMcBgP2XJziG66q9JbFI8QWevzdIMzTZe82jHumBLuR
	jV5woi2Q==;
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzElS-00DCI5-1n
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 10:52:16 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6aaef8ca776so262811a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 May 2023 03:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684320732; x=1686912732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnOhsCKUNf4j2F648NsHEKKBHDpVNoPzgPfBBed6WBg=;
        b=g2yi3AaRkRwdBtQd5CqRoeg8TTW8xKU3XmhgS6LAVponwNaamGMYJAqmHrlwQITSd7
         sZFUmJSqaB2LAASj4vO6JAuxtgYgJTV091bASYnT79J7AuD46vBQ8kztOiF35gDKod/u
         WzzJtgDM6A3xzBGpjRRQ+tkgd/PP3bzVmhWbj9wiHa67krT9Furp02pZ/9Ehg/0GL1s4
         r5pXrGoAfjpmMXOHhLXIFbGaFS9YHQOU8VifIaWIdxnv3r+iNS0e0v/A7V589cDadcMB
         MctvEpk2KQGIBo/EqDbVwkX34nPOnBcstFgc0vhPWWoeSERTeb+6YF8FOCgzF6/VYD1h
         VfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684320732; x=1686912732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnOhsCKUNf4j2F648NsHEKKBHDpVNoPzgPfBBed6WBg=;
        b=iKmkMibUBc8grGnTfNmdKMM/NqwE/wWihEyaKXCK5fIXpTreiOccCMghj/PpKAbmUl
         sowdACoAn4QH2nEKLQ7yqHdcNbFbnK9ZOTAC7YU5LRoBOC6RwKySawYy5nnQaNu8TNEA
         FmxR56kdnQVnGM7NP+Oufi8zHNDyuqd/x/AXvnFEGRPjFsc+1YW4r/oH0waAcZM7S4Sl
         FVusQgdgPtZQXwMXyASqmtRb80nP5dwdgxi4L3CwV/QpQBJhxe3Y78ZaK4hQIFKI3Nee
         r4kFSRMCL1rlcUC55vjuA6FEVUxFMM1CpiPGuPzUmc/QRtDGkkX2iXyZqw4Q4JxKTC5c
         YIQg==
X-Gm-Message-State: AC+VfDzJRGlja3Yrq+FNhxgbKVmpSkaafjpPbgTApByR5mfAMI81TM6y
	9xzX2W7KxkwAq2oPriCTZ4+WuQ==
X-Google-Smtp-Source: ACHHUZ4QRhXpGGdXM2qHmqmIZ3HYfQgH1aLNjkUKY8D7KEBAQRhAKW/SUpzqiGVgA91qNxhIAt0zCA==
X-Received: by 2002:a05:6830:139a:b0:6ab:7b2:d2d4 with SMTP id d26-20020a056830139a00b006ab07b2d2d4mr14282130otq.37.1684320732561;
        Wed, 17 May 2023 03:52:12 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w1-20020a9d77c1000000b006ade3815527sm2279896otl.22.2023.05.17.03.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 03:52:12 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 05/10] RISC-V: KVM: Skeletal in-kernel AIA irqchip support
Date: Wed, 17 May 2023 16:21:30 +0530
Message-Id: <20230517105135.1871868-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517105135.1871868-1-apatel@ventanamicro.com>
References: <20230517105135.1871868-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_115214_727126_263F344F 
X-CRM114-Status: GOOD (  16.81  )
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

To incrementally implement in-kernel AIA irqchip support, we first
add minimal skeletal support which only compiles but does not provide
any functionality.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_aia.h  |  20 ++++++
 arch/riscv/include/asm/kvm_host.h |   4 ++
 arch/riscv/include/uapi/asm/kvm.h |   4 ++
 arch/riscv/kvm/Kconfig            |   4 ++
 arch/riscv/kvm/aia.c              |   8 +++
 arch/riscv/kvm/vm.c               | 115 ++++++++++++++++++++++++++++++
 6 files changed, 155 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index 0938e0cadf80..3bc0a0e47a15 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -45,6 +45,7 @@ struct kvm_vcpu_aia {
 #define irqchip_in_kernel(k)		((k)->arch.aia.in_kernel)
 
 extern unsigned int kvm_riscv_aia_nr_hgei;
+extern unsigned int kvm_riscv_aia_max_ids;
 DECLARE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
 #define kvm_riscv_aia_available() \
 	static_branch_unlikely(&kvm_riscv_aia_available)
@@ -116,6 +117,25 @@ static inline void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu)
 {
 }
 
+static inline int kvm_riscv_aia_inject_msi_by_id(struct kvm *kvm,
+						 u32 hart_index,
+						 u32 guest_index, u32 iid)
+{
+	return 0;
+}
+
+static inline int kvm_riscv_aia_inject_msi(struct kvm *kvm,
+					   struct kvm_msi *msi)
+{
+	return 0;
+}
+
+static inline int kvm_riscv_aia_inject_irq(struct kvm *kvm,
+					   unsigned int irq, bool level)
+{
+	return 0;
+}
+
 static inline void kvm_riscv_aia_init_vm(struct kvm *kvm)
 {
 }
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index ee0acccb1d3b..871432586a63 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -27,6 +27,8 @@
 
 #define KVM_VCPU_MAX_FEATURES		0
 
+#define KVM_IRQCHIP_NUM_PINS		1024
+
 #define KVM_REQ_SLEEP \
 	KVM_ARCH_REQ_FLAGS(0, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_VCPU_RESET		KVM_ARCH_REQ(1)
@@ -318,6 +320,8 @@ int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
 bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
 void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu);
 
+int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines);
+
 void __kvm_riscv_unpriv_trap(void);
 
 unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index f92790c9481a..332d4a274891 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -15,6 +15,7 @@
 #include <asm/bitsperlong.h>
 #include <asm/ptrace.h>
 
+#define __KVM_HAVE_IRQ_LINE
 #define __KVM_HAVE_READONLY_MEM
 
 #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
@@ -203,6 +204,9 @@ enum KVM_RISCV_SBI_EXT_ID {
 #define KVM_REG_RISCV_SBI_MULTI_REG_LAST	\
 		KVM_REG_RISCV_SBI_MULTI_REG(KVM_RISCV_SBI_EXT_MAX - 1)
 
+/* One single KVM irqchip, ie. the AIA */
+#define KVM_NR_IRQCHIPS			1
+
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 28891e583259..dfc237d7875b 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -21,6 +21,10 @@ config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
 	depends on RISCV_SBI && MMU
 	select HAVE_KVM_EVENTFD
+	select HAVE_KVM_IRQCHIP
+	select HAVE_KVM_IRQFD
+	select HAVE_KVM_IRQ_ROUTING
+	select HAVE_KVM_MSI
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_GENERIC_HARDWARE_ENABLING
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 3f97575707eb..18c442c15ff2 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -26,6 +26,7 @@ static DEFINE_PER_CPU(struct aia_hgei_control, aia_hgei);
 static int hgei_parent_irq;
 
 unsigned int kvm_riscv_aia_nr_hgei;
+unsigned int kvm_riscv_aia_max_ids;
 DEFINE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
 
 static int aia_find_hgei(struct kvm_vcpu *owner)
@@ -618,6 +619,13 @@ int kvm_riscv_aia_init(void)
 	 */
 	kvm_riscv_aia_nr_hgei = 0;
 
+	/*
+	 * Find number of guest MSI IDs
+	 *
+	 * TODO: To be updated later by AIA IMSIC HW guest file support
+	 */
+	kvm_riscv_aia_max_ids = IMSIC_MAX_ID;
+
 	/* Initialize guest external interrupt line management */
 	rc = aia_hgei_init();
 	if (rc)
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 6ef15f78e80f..d2349326b2ce 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -55,6 +55,121 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 	kvm_riscv_aia_destroy_vm(kvm);
 }
 
+int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irql,
+			  bool line_status)
+{
+	if (!irqchip_in_kernel(kvm))
+		return -ENXIO;
+
+	return kvm_riscv_aia_inject_irq(kvm, irql->irq, irql->level);
+}
+
+int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
+		struct kvm *kvm, int irq_source_id,
+		int level, bool line_status)
+{
+	struct kvm_msi msi;
+
+	if (!level)
+		return -1;
+
+	msi.address_lo = e->msi.address_lo;
+	msi.address_hi = e->msi.address_hi;
+	msi.data = e->msi.data;
+	msi.flags = e->msi.flags;
+	msi.devid = e->msi.devid;
+
+	return kvm_riscv_aia_inject_msi(kvm, &msi);
+}
+
+static int kvm_riscv_set_irq(struct kvm_kernel_irq_routing_entry *e,
+			     struct kvm *kvm, int irq_source_id,
+			     int level, bool line_status)
+{
+	return kvm_riscv_aia_inject_irq(kvm, e->irqchip.pin, level);
+}
+
+int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines)
+{
+	struct kvm_irq_routing_entry *ents;
+	int i, rc;
+
+	ents = kcalloc(lines, sizeof(*ents), GFP_KERNEL);
+	if (!ents)
+		return -ENOMEM;
+
+	for (i = 0; i < lines; i++) {
+		ents[i].gsi = i;
+		ents[i].type = KVM_IRQ_ROUTING_IRQCHIP;
+		ents[i].u.irqchip.irqchip = 0;
+		ents[i].u.irqchip.pin = i;
+	}
+	rc = kvm_set_irq_routing(kvm, ents, lines, 0);
+	kfree(ents);
+
+	return rc;
+}
+
+bool kvm_arch_can_set_irq_routing(struct kvm *kvm)
+{
+	return irqchip_in_kernel(kvm);
+}
+
+int kvm_set_routing_entry(struct kvm *kvm,
+			  struct kvm_kernel_irq_routing_entry *e,
+			  const struct kvm_irq_routing_entry *ue)
+{
+	int r = -EINVAL;
+
+	switch (ue->type) {
+	case KVM_IRQ_ROUTING_IRQCHIP:
+		e->set = kvm_riscv_set_irq;
+		e->irqchip.irqchip = ue->u.irqchip.irqchip;
+		e->irqchip.pin = ue->u.irqchip.pin;
+		if ((e->irqchip.pin >= KVM_IRQCHIP_NUM_PINS) ||
+		    (e->irqchip.irqchip >= KVM_NR_IRQCHIPS))
+			goto out;
+		break;
+	case KVM_IRQ_ROUTING_MSI:
+		e->set = kvm_set_msi;
+		e->msi.address_lo = ue->u.msi.address_lo;
+		e->msi.address_hi = ue->u.msi.address_hi;
+		e->msi.data = ue->u.msi.data;
+		e->msi.flags = ue->flags;
+		e->msi.devid = ue->u.msi.devid;
+		break;
+	default:
+		goto out;
+	}
+	r = 0;
+out:
+	return r;
+}
+
+int kvm_arch_set_irq_inatomic(struct kvm_kernel_irq_routing_entry *e,
+			      struct kvm *kvm, int irq_source_id, int level,
+			      bool line_status)
+{
+	if (!level)
+		return -EWOULDBLOCK;
+
+	switch (e->type) {
+	case KVM_IRQ_ROUTING_MSI:
+		return kvm_set_msi(e, kvm, irq_source_id, level, line_status);
+
+	case KVM_IRQ_ROUTING_IRQCHIP:
+		return kvm_riscv_set_irq(e, kvm, irq_source_id,
+					 level, line_status);
+	}
+
+	return -EWOULDBLOCK;
+}
+
+bool kvm_arch_irqchip_in_kernel(struct kvm *kvm)
+{
+	return irqchip_in_kernel(kvm);
+}
+
 int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 {
 	int r;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
