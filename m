Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E86AC77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 10:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gjmvNFQ+We62VqGxqVQC13FFZIZR0UsTFVH9hCy7EkM=; b=NjKQmvzeB/j1jj
	2a1eOQqRZ6rWR9AXgZ/OegSDp4sjqnaUKST+KpDqNc1ZMdZItqpr7YO6fl13G1Q7PsLCoR2scJuCa
	z7h5x3qfe260eI5+PEpnqSJkTY6r69+r3quj3GMYKLeuviTmRcmwbSMAt57fqnm0FxPjvNqZeoClg
	u/JvuuYlcE3LT0DnC622+A7Qh0tS41NHVUoTEtEWscbqslQCuigjiW28Idiy2PYodTsLncDble+Qw
	IWxNnBMxu+3Z2I2JKorBWIqqU9U9STtkaYb+IJyzStZnCN7mOPCh2J7biGkT6PRcNHP1yrOrSB+Td
	nINdc14JrUqKaOSpXEJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEls-009UbE-1K;
	Wed, 17 May 2023 10:52:40 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzElo-009UVg-2o
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 10:52:38 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6ab02aeac3fso262775a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 17 May 2023 03:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684320756; x=1686912756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5ryKBZ0Xc8y6adyB9ImP44uhqiVXgFjoOdr8C6NkOU=;
        b=EX5i7G4Vkwriau0BdUlqN37IVFZ+JxXtJ1vX934nZrY/q/AMFo5N3XxX8hXxl/UWUo
         X7/HwNIkcPLuZSljKhOxGD5KsAOTk/PlF0jnyd9WWS2+ALoklBdR5OrNd4+Y+tU/PPgW
         GGAEX/MRnU239ngeCsGNM13+slDPI8FuDrSSBIdMB7qUiBHSyxJHTAhvtlFgq4Ezu6aA
         LHVnBLDKniYz9Q6fepDeWbZd/XTaecv7OPwqsf7ifMn3FMXBDqqNokgcujMej60fn0OF
         F+n0rPI2fWlxQzXO2sBDkxz6TJFx1TAHrl29SMowAExsRwPDRM4HyE8QfhvGEHH3lkSZ
         HNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684320756; x=1686912756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5ryKBZ0Xc8y6adyB9ImP44uhqiVXgFjoOdr8C6NkOU=;
        b=iNdd8emqR/HSczL4U5kHKPVEdcfy0i6iK0gfMbEjx3C0kuTAOe4IFxYgGRxdwbZU0h
         /LX2V9iqF8jfXJ+x5VZTFfyEa6V6O8b/ofHkvee3dHhz1mEpI020a5RuMQtgmKHrhiiI
         GVTPxLOk3yoW/MrAgwSEQQFMhx7ZyJ6YwcfwzQ2+SC2opN+NN7WyF8PyXe4bZ3IyuZV6
         YUHPT7iUmA4R9qpp/RpHjLCEEQ5OwSqnPzZmz6hAlgKKtjyNU4qiCI+HL3wqtccoYXKP
         jTPP960UlLayQ6V8170pSNPHCpZY4dwy0d5P+EwN+U6zyJhn2O+Kdvuf2RqUE7B0ynz/
         4AEQ==
X-Gm-Message-State: AC+VfDxrhsywUjnWKMqfLPaety4bzYNo2HMg5JTKYwHPaaHl5FH/MZpY
	8jWM8Nq2sDEpYOohDSdBCk/VFA==
X-Google-Smtp-Source: ACHHUZ5s4SwMoW/06FzkzoJPhGYzd7L05r6M3BOwRh14UiN7EBmtN61+dSjma3HD/cUgdaysjqTDug==
X-Received: by 2002:a9d:4b0b:0:b0:6ad:c49b:bcbc with SMTP id q11-20020a9d4b0b000000b006adc49bbcbcmr5192712otf.28.1684320756456;
        Wed, 17 May 2023 03:52:36 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w1-20020a9d77c1000000b006ade3815527sm2279896otl.22.2023.05.17.03.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 03:52:36 -0700 (PDT)
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
Subject: [PATCH 10/10] RISC-V: KVM: Expose IMSIC registers as attributes of AIA irqchip
Date: Wed, 17 May 2023 16:21:35 +0530
Message-Id: <20230517105135.1871868-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517105135.1871868-1-apatel@ventanamicro.com>
References: <20230517105135.1871868-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_035236_920552_15E6A62D 
X-CRM114-Status: GOOD (  19.15  )
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
---
 arch/riscv/include/asm/kvm_aia.h  |   3 +
 arch/riscv/include/uapi/asm/kvm.h |  12 +++
 arch/riscv/kvm/aia_device.c       |  29 ++++-
 arch/riscv/kvm/aia_imsic.c        | 170 ++++++++++++++++++++++++++++++
 4 files changed, 212 insertions(+), 2 deletions(-)

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
index e80210c2220b..624784bb21dd 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -242,6 +242,18 @@ enum KVM_RISCV_SBI_EXT_ID {
 
 #define KVM_DEV_RISCV_AIA_GRP_APLIC		3
 
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
index 17dba92a90e1..ac7bd98301a3 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -326,7 +326,7 @@ static int aia_set_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
 	u32 nr;
 	u64 addr;
 	int nr_vcpus, r = -ENXIO;
-	unsigned long type = (unsigned long)attr->attr;
+	unsigned long v, type = (unsigned long)attr->attr;
 	void __user *uaddr = (void __user *)(long)attr->addr;
 
 	switch (attr->group) {
@@ -373,6 +373,15 @@ static int aia_set_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
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
 
@@ -385,7 +394,7 @@ static int aia_get_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
 	u64 addr;
 	int nr_vcpus, r = -ENXIO;
 	void __user *uaddr = (void __user *)(long)attr->addr;
-	unsigned long type = (unsigned long)attr->attr;
+	unsigned long v, type = (unsigned long)attr->attr;
 
 	switch (attr->group) {
 	case KVM_DEV_RISCV_AIA_GRP_CONFIG:
@@ -434,6 +443,20 @@ static int aia_get_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
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
 
@@ -472,6 +495,8 @@ static int aia_has_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
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
