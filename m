Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BABEB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 07:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kTT3n237nG37pJNjEnsCg1XmUyrKIZsYFBHCZnVsOY=; b=Rd2HAa0bVsaZYm
	bn95jU1faARBrlXBhtJUxlneIR5EBMkMYQVcD91zzhZDQWv4YBFCx3TSWRVI0Fn333N/QQJtLN4pI
	Niafzt+fSm4zvqgwmvtWOfNmTzs0yJa2OWY+Dw4ZmY7jp4T+t/hGs2G3AbReldbj0AZA8LYsvXrVL
	5GvwhkSP9Dhed0z1wL/BOWk+7rPUbN7GkY4Pk3s1v1hhsoGLqPdnz6sy30GkgyLGZ9TgUMl++42Y9
	9qkNhzHNs/Sm3a6L5KaBcFFYZmFcD6R2BsyGfJzPFR+LXH+b6D9+UsjsMojNrkITpgdZPJDmg3bcn
	SPP9pIBblqtRk5udG4uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hVC-00E1TW-1E;
	Thu, 15 Jun 2023 07:34:42 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hV6-00E1Oy-0k
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 07:34:39 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b50e309602so8626945ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 00:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686814475; x=1689406475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6Rq1yi2+qD0HFNpBzumkvByzhdG8I7NvHz0A/3B5uA=;
        b=D01H5OrVIr8we3GFahjjLHOivkiaE0jKVyBdXjUGqt0vsAO+bn24SN+JpiLa0PUN1H
         2Z6DX6it+lm1BaxQA9tDe7zTNNqfjuyjWywwmeFRsHlKPMa+nsCsHmRzD5QD9pysNvME
         MZD3apcuHfjaQOsjcnTqFZwXpqvNYfneO33m755HSZ0yX1KEDAUuC95Z9pGTTLQddnsk
         f50Dxqrk2DcJYPfmdNKO0VjvN6FEzFdOoDuPv6aq8wrMkbl9vVR8dNuuItzJA0gn/SJY
         +yGqUkXWeDXotS0UNBjQNGetCAo2kzU6BiLjW4KR1jmG4Fr7wkMM/VjXt819XqNZKPjn
         RBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686814475; x=1689406475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6Rq1yi2+qD0HFNpBzumkvByzhdG8I7NvHz0A/3B5uA=;
        b=Bjsk6wh0/2r+jkNTfH6074zxoJEBjjf9UBzrvzGlvO6+jdzSo6kAzmpVobnX4bSszD
         gqpBlhqQcye37cph0geoE1WZ8IaQ1Lc7bmwEoYOTio45CTRZXERvwqJV7dml+Ld2WTmx
         CVhLDaOQo9hKL/8FpsXCMEkrM7h7uw8kXcgwgsy840YNRyb4tF5JexxiVbg5Y0TnFG0a
         McyIATKpcM2ladDCt46WfweisM3M7aruRcnf6lo7WrcZlKLT0Msv0qJKvGk4HCwRyM3G
         wWm7rktfpJyIQjrGXb3ebsHU+rJ9WtRf/elS3nuTRcfXZVu7zTZqquHGoFBjuKBWQMYP
         zVng==
X-Gm-Message-State: AC+VfDyRmAa/6NIuyUb1mXf1nzrrpQeiXiQUVGuFUeugdbznIYOOi7lA
	t5JhTnKbNdjbJqjSbyiTHdQIsg==
X-Google-Smtp-Source: ACHHUZ4l7irIUA/CXf68cBSaDH7QdRt29DwIkNVyjOIFDLs8AX8gkGfmdfm1sIJDRXEdvS6whAibZg==
X-Received: by 2002:a17:902:da91:b0:1b5:1e24:8a76 with SMTP id j17-20020a170902da9100b001b51e248a76mr455504plx.65.1686814475589;
        Thu, 15 Jun 2023 00:34:35 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id ji1-20020a170903324100b001b016313b1dsm8049855plb.86.2023.06.15.00.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 00:34:35 -0700 (PDT)
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
Subject: [PATCH v3 10/10] RISC-V: KVM: Expose IMSIC registers as attributes of AIA irqchip
Date: Thu, 15 Jun 2023 13:03:53 +0530
Message-Id: <20230615073353.85435-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615073353.85435-1-apatel@ventanamicro.com>
References: <20230615073353.85435-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_003436_276296_B991BDAD 
X-CRM114-Status: GOOD (  20.66  )
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

We expose IMSIC registers as KVM device attributes of the in-kernel
AIA irqchip device. This will allow KVM user-space to save/restore
IMISC state of each VCPU using KVM device ioctls().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_aia.h  |   3 +
 arch/riscv/include/uapi/asm/kvm.h |  17 +++
 arch/riscv/kvm/aia_device.c       |  29 ++++-
 arch/riscv/kvm/aia_imsic.c        | 170 ++++++++++++++++++++++++++++++
 4 files changed, 217 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index a4f6ebf90e31..1f37b600ca47 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -97,6 +97,9 @@ int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_aia_imsic_rmw(struct kvm_vcpu *vcpu, unsigned long isel,
 				 unsigned long *val, unsigned long new_val,
 				 unsigned long wr_mask);
+int kvm_riscv_aia_imsic_rw_attr(struct kvm *kvm, unsigned long type,
+				bool write, unsigned long *val);
+int kvm_riscv_aia_imsic_has_attr(struct kvm *kvm, unsigned long type);
 void kvm_riscv_vcpu_aia_imsic_reset(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
 				    u32 guest_index, u32 offset, u32 iid);
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 9ed822fc5589..61d7fecc4899 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -255,6 +255,23 @@ enum KVM_RISCV_SBI_EXT_ID {
  */
 #define KVM_DEV_RISCV_AIA_GRP_APLIC		3
 
+/*
+ * The lower 12-bits of the device attribute type contains the iselect
+ * value of the IMSIC register (range 0x70-0xFF) whereas the higher order
+ * bits contains the VCPU id.
+ */
+#define KVM_DEV_RISCV_AIA_GRP_IMSIC		4
+#define KVM_DEV_RISCV_AIA_IMSIC_ISEL_BITS	12
+#define KVM_DEV_RISCV_AIA_IMSIC_ISEL_MASK	\
+		((1U << KVM_DEV_RISCV_AIA_IMSIC_ISEL_BITS) - 1)
+#define KVM_DEV_RISCV_AIA_IMSIC_MKATTR(__vcpu, __isel)	\
+		(((__vcpu) << KVM_DEV_RISCV_AIA_IMSIC_ISEL_BITS) | \
+		 ((__isel) & KVM_DEV_RISCV_AIA_IMSIC_ISEL_MASK))
+#define KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(__attr)	\
+		((__attr) & KVM_DEV_RISCV_AIA_IMSIC_ISEL_MASK)
+#define KVM_DEV_RISCV_AIA_IMSIC_GET_VCPU(__attr)	\
+		((__attr) >> KVM_DEV_RISCV_AIA_IMSIC_ISEL_BITS)
+
 /* One single KVM irqchip, ie. the AIA */
 #define KVM_NR_IRQCHIPS			1
 
diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index c649ad6e8e0a..84dae351b6d7 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -327,7 +327,7 @@ static int aia_set_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
 	u32 nr;
 	u64 addr;
 	int nr_vcpus, r = -ENXIO;
-	unsigned long type = (unsigned long)attr->attr;
+	unsigned long v, type = (unsigned long)attr->attr;
 	void __user *uaddr = (void __user *)(long)attr->addr;
 
 	switch (attr->group) {
@@ -374,6 +374,15 @@ static int aia_set_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
 		r = kvm_riscv_aia_aplic_set_attr(dev->kvm, type, nr);
 		mutex_unlock(&dev->kvm->lock);
 
+		break;
+	case KVM_DEV_RISCV_AIA_GRP_IMSIC:
+		if (copy_from_user(&v, uaddr, sizeof(v)))
+			return -EFAULT;
+
+		mutex_lock(&dev->kvm->lock);
+		r = kvm_riscv_aia_imsic_rw_attr(dev->kvm, type, true, &v);
+		mutex_unlock(&dev->kvm->lock);
+
 		break;
 	}
 
@@ -386,7 +395,7 @@ static int aia_get_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
 	u64 addr;
 	int nr_vcpus, r = -ENXIO;
 	void __user *uaddr = (void __user *)(long)attr->addr;
-	unsigned long type = (unsigned long)attr->attr;
+	unsigned long v, type = (unsigned long)attr->attr;
 
 	switch (attr->group) {
 	case KVM_DEV_RISCV_AIA_GRP_CONFIG:
@@ -435,6 +444,20 @@ static int aia_get_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
 		if (copy_to_user(uaddr, &nr, sizeof(nr)))
 			return -EFAULT;
 
+		break;
+	case KVM_DEV_RISCV_AIA_GRP_IMSIC:
+		if (copy_from_user(&v, uaddr, sizeof(v)))
+			return -EFAULT;
+
+		mutex_lock(&dev->kvm->lock);
+		r = kvm_riscv_aia_imsic_rw_attr(dev->kvm, type, false, &v);
+		mutex_unlock(&dev->kvm->lock);
+		if (r)
+			return r;
+
+		if (copy_to_user(uaddr, &v, sizeof(v)))
+			return -EFAULT;
+
 		break;
 	}
 
@@ -473,6 +496,8 @@ static int aia_has_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
 		break;
 	case KVM_DEV_RISCV_AIA_GRP_APLIC:
 		return kvm_riscv_aia_aplic_has_attr(dev->kvm, attr->attr);
+	case KVM_DEV_RISCV_AIA_GRP_IMSIC:
+		return kvm_riscv_aia_imsic_has_attr(dev->kvm, attr->attr);
 	}
 
 	return -ENXIO;
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 2dc09dcb8ab5..8f108cfa80e5 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -277,6 +277,33 @@ static u32 imsic_mrif_topei(struct imsic_mrif *mrif, u32 nr_eix, u32 nr_msis)
 	return 0;
 }
 
+static int imsic_mrif_isel_check(u32 nr_eix, unsigned long isel)
+{
+	u32 num = 0;
+
+	switch (isel) {
+	case IMSIC_EIDELIVERY:
+	case IMSIC_EITHRESHOLD:
+		break;
+	case IMSIC_EIP0 ... IMSIC_EIP63:
+		num = isel - IMSIC_EIP0;
+		break;
+	case IMSIC_EIE0 ... IMSIC_EIE63:
+		num = isel - IMSIC_EIE0;
+		break;
+	default:
+		return -ENOENT;
+	};
+#ifndef CONFIG_32BIT
+	if (num & 0x1)
+		return -EINVAL;
+#endif
+	if ((num / 2) >= nr_eix)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int imsic_mrif_rmw(struct imsic_mrif *mrif, u32 nr_eix,
 			  unsigned long isel, unsigned long *val,
 			  unsigned long new_val, unsigned long wr_mask)
@@ -407,6 +434,86 @@ static void imsic_vsfile_read(int vsfile_hgei, int vsfile_cpu, u32 nr_eix,
 			 imsic_vsfile_local_read, &idata, 1);
 }
 
+struct imsic_vsfile_rw_data {
+	int hgei;
+	int isel;
+	bool write;
+	unsigned long val;
+};
+
+static void imsic_vsfile_local_rw(void *data)
+{
+	struct imsic_vsfile_rw_data *idata = data;
+	unsigned long new_hstatus, old_hstatus, old_vsiselect;
+
+	old_vsiselect = csr_read(CSR_VSISELECT);
+	old_hstatus = csr_read(CSR_HSTATUS);
+	new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
+	new_hstatus |= ((unsigned long)idata->hgei) << HSTATUS_VGEIN_SHIFT;
+	csr_write(CSR_HSTATUS, new_hstatus);
+
+	switch (idata->isel) {
+	case IMSIC_EIDELIVERY:
+		if (idata->write)
+			imsic_vs_csr_write(IMSIC_EIDELIVERY, idata->val);
+		else
+			idata->val = imsic_vs_csr_read(IMSIC_EIDELIVERY);
+		break;
+	case IMSIC_EITHRESHOLD:
+		if (idata->write)
+			imsic_vs_csr_write(IMSIC_EITHRESHOLD, idata->val);
+		else
+			idata->val = imsic_vs_csr_read(IMSIC_EITHRESHOLD);
+		break;
+	case IMSIC_EIP0 ... IMSIC_EIP63:
+	case IMSIC_EIE0 ... IMSIC_EIE63:
+#ifndef CONFIG_32BIT
+		if (idata->isel & 0x1)
+			break;
+#endif
+		if (idata->write)
+			imsic_eix_write(idata->isel, idata->val);
+		else
+			idata->val = imsic_eix_read(idata->isel);
+		break;
+	default:
+		break;
+	}
+
+	csr_write(CSR_HSTATUS, old_hstatus);
+	csr_write(CSR_VSISELECT, old_vsiselect);
+}
+
+static int imsic_vsfile_rw(int vsfile_hgei, int vsfile_cpu, u32 nr_eix,
+			   unsigned long isel, bool write,
+			   unsigned long *val)
+{
+	int rc;
+	struct imsic_vsfile_rw_data rdata;
+
+	/* We can only access register if we have a IMSIC VS-file */
+	if (vsfile_cpu < 0 || vsfile_hgei <= 0)
+		return -EINVAL;
+
+	/* Check IMSIC register iselect */
+	rc = imsic_mrif_isel_check(nr_eix, isel);
+	if (rc)
+		return rc;
+
+	/* We can only access register on local CPU */
+	rdata.hgei = vsfile_hgei;
+	rdata.isel = isel;
+	rdata.write = write;
+	rdata.val = (write) ? *val : 0;
+	on_each_cpu_mask(cpumask_of(vsfile_cpu),
+			 imsic_vsfile_local_rw, &rdata, 1);
+
+	if (!write)
+		*val = rdata.val;
+
+	return 0;
+}
+
 static void imsic_vsfile_local_clear(int vsfile_hgei, u32 nr_eix)
 {
 	u32 i;
@@ -758,6 +865,69 @@ int kvm_riscv_vcpu_aia_imsic_rmw(struct kvm_vcpu *vcpu, unsigned long isel,
 	return rc;
 }
 
+int kvm_riscv_aia_imsic_rw_attr(struct kvm *kvm, unsigned long type,
+				bool write, unsigned long *val)
+{
+	u32 isel, vcpu_id;
+	unsigned long flags;
+	struct imsic *imsic;
+	struct kvm_vcpu *vcpu;
+	int rc, vsfile_hgei, vsfile_cpu;
+
+	if (!kvm_riscv_aia_initialized(kvm))
+		return -ENODEV;
+
+	vcpu_id = KVM_DEV_RISCV_AIA_IMSIC_GET_VCPU(type);
+	vcpu = kvm_get_vcpu_by_id(kvm, vcpu_id);
+	if (!vcpu)
+		return -ENODEV;
+
+	isel = KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(type);
+	imsic = vcpu->arch.aia_context.imsic_state;
+
+	read_lock_irqsave(&imsic->vsfile_lock, flags);
+
+	rc = 0;
+	vsfile_hgei = imsic->vsfile_hgei;
+	vsfile_cpu = imsic->vsfile_cpu;
+	if (vsfile_cpu < 0) {
+		if (write) {
+			rc = imsic_mrif_rmw(imsic->swfile, imsic->nr_eix,
+					    isel, NULL, *val, -1UL);
+			imsic_swfile_extirq_update(vcpu);
+		} else
+			rc = imsic_mrif_rmw(imsic->swfile, imsic->nr_eix,
+					    isel, val, 0, 0);
+	}
+
+	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+
+	if (!rc && vsfile_cpu >= 0)
+		rc = imsic_vsfile_rw(vsfile_hgei, vsfile_cpu, imsic->nr_eix,
+				     isel, write, val);
+
+	return rc;
+}
+
+int kvm_riscv_aia_imsic_has_attr(struct kvm *kvm, unsigned long type)
+{
+	u32 isel, vcpu_id;
+	struct imsic *imsic;
+	struct kvm_vcpu *vcpu;
+
+	if (!kvm_riscv_aia_initialized(kvm))
+		return -ENODEV;
+
+	vcpu_id = KVM_DEV_RISCV_AIA_IMSIC_GET_VCPU(type);
+	vcpu = kvm_get_vcpu_by_id(kvm, vcpu_id);
+	if (!vcpu)
+		return -ENODEV;
+
+	isel = KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(type);
+	imsic = vcpu->arch.aia_context.imsic_state;
+	return imsic_mrif_isel_check(imsic->nr_eix, isel);
+}
+
 void kvm_riscv_vcpu_aia_imsic_reset(struct kvm_vcpu *vcpu)
 {
 	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
