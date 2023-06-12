Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDFAC7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 05:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vd4zV+4VMcXb1pVGGaiJXM+EkVEcrwTN/jagQgU0W6g=; b=HCTa7iI4KqUaa1
	FJ+c7ewGzhpyZVCjYho4336QSeWFtBre7YzbYIGkbUJxQp6Uf9/vQmovAfid16FdAQdLHFM/gOnY2
	5K+Ly6WVJz6idf6fcO7YXr38x5HGhJRNHY7VM9Eh9yO1sIWqnMwdzu+wePClJyfrZ9zUNp7ojQjnv
	wEVLNfI4MyAiw32VpM/sUnORGw8NGhgEyca8lXT8vgUOvyoRkLbmFn9a4Ld715BfJ5oiTFNKe1FJI
	DlggP0gai82Jj1kmlkJw6ICIIJBfzso81uhHjaeBGQ1MViB9QV8FiTeMX6gp6Ht7C/laOV+VxabCC
	BxJFAN3CkYek03MRzcoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8aHk-002fni-0G;
	Mon, 12 Jun 2023 05:40:12 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8aHh-002fm5-0T
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 05:40:10 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6b2b6910facso2144601a34.1
        for <linux-riscv@lists.infradead.org>; Sun, 11 Jun 2023 22:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686548408; x=1689140408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHI7epT+Fy97+emlJi+4eK1ecltNEEWPjySlfbPu41Y=;
        b=BApsxhrkSkvg4Nuc+wVcIKW2mAFK+m8oqlApJR/Pyf0gk35EpIilg98AOGcECXxJm3
         GXcLHjdMUhUs0r61Zqhylyyj6YZS1m9kXuKcBUwBr/0yZ8y+wfeEL16Y0RUp0Qu9QdMz
         Ml1wUgBZ4eFUwsF4P//yGZh5JPy+O5HVQ3gz7E+ds5tSdI/T7PJCAa4wEyEkQyZSFZnF
         8hbzRg8Jdh7dx4vmhrBa5CjPmxGQYC8NjPE7klnBCjgDlJMkxC6/4aX7SXoDztw5v7pG
         pnB0bAaXNBvv5nOH9yKthfrhADpZTI8riylIigbFeISjnsPseo51igP1JbL1bJEBfLS2
         48gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686548408; x=1689140408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHI7epT+Fy97+emlJi+4eK1ecltNEEWPjySlfbPu41Y=;
        b=Qdk/oVyHC0DhfE1GZj80E4Y5r7n/7YdbE6ai1ClFRxPtMJzJG1sUP5B9oy+sFkmmWM
         eym1jgPLh5KFs8mduYOsnDGNDj78qN/W8GF4nZ5vZDA9v7YJQAbmDQC6U2RNcvz6/+WH
         Rp8vwLekznDSBAac14ToRZ53CW35GiUtSFeszXNryuf4+UXrx+TDkxX5KPLPrVvUj9N9
         5aky1Bah8hIgWLUM344v/XuuBvZg4C50GLhFFUlq5eXEMTor5hJprFZKweGK7sebXCpd
         5DU8MkNH8dFWDcuR4fHttgBwTELrFARVht2znQZ1I41D4llQduEavZyIL/98LAd9Hw3x
         lqdg==
X-Gm-Message-State: AC+VfDzOBTppdm7Zuyk378+Ss7DykC8YQvcvmiPK/t8dVHpHb5g0DWvd
	NpImWyfdGYmjl+WBkJqQlO2KyQ==
X-Google-Smtp-Source: ACHHUZ7kt3s8/ywPZS8qv4FAX83F7Jh9eu8CjXlTR1A+7Dg/pBBSl+o7XayiDbx0eQhHHiiRFxNWyw==
X-Received: by 2002:a05:6830:1452:b0:6b0:c4ba:4940 with SMTP id w18-20020a056830145200b006b0c4ba4940mr6155737otp.21.1686548407951;
        Sun, 11 Jun 2023 22:40:07 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id lv19-20020a056871439300b001a30d846520sm5534869oab.7.2023.06.11.22.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 22:40:07 -0700 (PDT)
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
Subject: [PATCH v2 05/10] RISC-V: KVM: Skeletal in-kernel AIA irqchip support
Date: Mon, 12 Jun 2023 11:09:27 +0530
Message-Id: <20230612053932.58604-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230612053932.58604-1-apatel@ventanamicro.com>
References: <20230612053932.58604-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_224009_184236_A05A2AC8 
X-CRM114-Status: GOOD (  16.72  )
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
Reviewed-by: Atish Patra <atishp@rivosinc.com>
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
