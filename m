Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318EEC38142
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 07:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xoMdd2FVkzp6A3c4VjksdoBFdthNvYIkZUjI43vCR3g=; b=ldNu7G8JeQboAG
	E/88m0UjM7uT2/iPL8Y/bfkcBdV7ORCDE8qfLDIA7EZ9ekILZ9dbkN5bfL1AAXwsBYAqKGfm5HZac
	8MlwaKvqBgblnnjMgkaE27lEupJdMJqhoj+OP4ehp+JUE5zREdmgQgnS0+3Pz8RHsLrDmgqkgWnUD
	y50IFPr47qnk56kDSYGlw8oEvnn0khlL5bA3kTySCX3IGabZfs4498gvyTdmSok7pGb+qtv753IKA
	CvOlsCAa64V1saML+1sGx61l/28XUFHu0e0flHW5ey/EdyLcndfbSQrdvxbEVfmre2mVlCWhoawPV
	q+3oX86vE3riwpx61mLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLfdH-00HLkr-Ke; Sat, 28 Jan 2023 07:28:15 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLfdD-00HLh1-B5
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 07:28:13 +0000
Received: by mail-pl1-x630.google.com with SMTP id k18so7067787pll.5
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 23:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93CfSKJPDU7PTN/vln3/W3P9lvmTXOG9HS5NigDMRQk=;
        b=VQ94rAJqHEwNhLtzjwoHwlYZ4G0MNBaoJZm6GRDoAcFMi/ylwzulkVN+JnPqAjgkLN
         xUGLRSxvnICSPx90vztQLkUXVo9nPljZOGxQE0tdFmGKXyxx/eMtiq7gK58THloK5wct
         b7+BFwmYU7/VWzXxuZcnX4YUNvnSReQb+O0+GntnR6PtjxlNF8kE9RoMtOOO0u9f5Q5t
         SgYH7L67Vvg9J6m+wl6yz85RhYh6xxdAChpgIQHitnJZFGMpv2IuwFQoojZm0xtvBVIL
         2VxQQ/mstiL/Jc8Cr0Orit+KprAu/CKhxu5toSEIRmhmJ6xB1fJbxz0KIjfAv5pYQi7c
         xusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93CfSKJPDU7PTN/vln3/W3P9lvmTXOG9HS5NigDMRQk=;
        b=l4zef3gx30tI9Of9/NVnYiAH1RvjMXoy/LnUZvO0B5dlacvz+k+wn2anweqydlZ/kj
         RQ7r4W5zb2QCuFO5v80zKHsHMU50GV1HgK5G+Xp5f5xd259vJQjgqBXYfq9p5WqxMkVh
         8KUf9uLr/faDHGUvDZYq1DiAC9E9S1KXY+aTM/ihInqOQfyhB2F6IrWUKWUs1QlR5Eya
         el4eIu0w5T8w1PCzzKQMEOekXapmr16AfgFJXl2LS8zBHyuRUqcG6p+989DhyRirAip4
         gnhZfzY06jGBg3koQYxp/OIO1OMKSGTTyHI1JIaarDVx628jnz+aUQECrFu0fznvjUl2
         yn/g==
X-Gm-Message-State: AO0yUKWpXQfHI9k2kNkR5Vyw4GMXEWIuCicxSAZpJm9kYVqw4xL+ffJ+
	S+gKhuV/YU6ES6MksJzABXKwSQ==
X-Google-Smtp-Source: AK7set/TxIkuvr4YgIUWqHuz8AWpr+/t6NbwTcNOnZQQahX25VGmmcumXiffXT4CqjWY0iwZbWPm4A==
X-Received: by 2002:a17:902:e5cf:b0:196:3b19:fc82 with SMTP id u15-20020a170902e5cf00b001963b19fc82mr1397075plf.32.1674890890678;
        Fri, 27 Jan 2023 23:28:10 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id jh19-20020a170903329300b00194ac38bc86sm753132plb.131.2023.01.27.23.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 23:28:10 -0800 (PST)
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
Subject: [PATCH v2 5/7] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
Date: Sat, 28 Jan 2023 12:57:35 +0530
Message-Id: <20230128072737.2995881-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128072737.2995881-1-apatel@ventanamicro.com>
References: <20230128072737.2995881-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_232811_401341_B02BCB00 
X-CRM114-Status: GOOD (  16.92  )
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

We extend the CSR ONE_REG interface to access both general CSRs and
AIA CSRs. To achieve this, we introduce "subtype" field in the ONE_REG
id which can be used for grouping registers within a particular "type"
of ONE_REG registers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 15 ++++-
 arch/riscv/kvm/vcpu.c             | 96 ++++++++++++++++++++++++-------
 2 files changed, 89 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 71992ff1f9dd..d0704eff0121 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -64,7 +64,7 @@ struct kvm_riscv_core {
 #define KVM_RISCV_MODE_S	1
 #define KVM_RISCV_MODE_U	0
 
-/* CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+/* General CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_csr {
 	unsigned long sstatus;
 	unsigned long sie;
@@ -78,6 +78,10 @@ struct kvm_riscv_csr {
 	unsigned long scounteren;
 };
 
+/* AIA CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_aia_csr {
+};
+
 /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_timer {
 	__u64 frequency;
@@ -105,6 +109,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_SVINVAL,
 	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
 	KVM_RISCV_ISA_EXT_ZICBOM,
+	KVM_RISCV_ISA_EXT_SSAIA,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
@@ -134,6 +139,8 @@ enum KVM_RISCV_SBI_EXT_ID {
 /* If you need to interpret the index values, here is the key: */
 #define KVM_REG_RISCV_TYPE_MASK		0x00000000FF000000
 #define KVM_REG_RISCV_TYPE_SHIFT	24
+#define KVM_REG_RISCV_SUBTYPE_MASK	0x0000000000FF0000
+#define KVM_REG_RISCV_SUBTYPE_SHIFT	16
 
 /* Config registers are mapped as type 1 */
 #define KVM_REG_RISCV_CONFIG		(0x01 << KVM_REG_RISCV_TYPE_SHIFT)
@@ -147,8 +154,12 @@ enum KVM_RISCV_SBI_EXT_ID {
 
 /* Control and status registers are mapped as type 3 */
 #define KVM_REG_RISCV_CSR		(0x03 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_CSR_GENERAL	0x0
+#define KVM_REG_RISCV_CSR_AIA		0x1
 #define KVM_REG_RISCV_CSR_REG(name)	\
-		(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
+	(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
+#define KVM_REG_RISCV_CSR_AIA_REG(name)	\
+	(offsetof(struct kvm_riscv_aia_csr, name) / sizeof(unsigned long))
 
 /* Timer registers are mapped as type 4 */
 #define KVM_REG_RISCV_TIMER		(0x04 << KVM_REG_RISCV_TYPE_SHIFT)
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 3cf50eadc8ce..37933ea20274 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -58,6 +58,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	[KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
 	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
 
+	KVM_ISA_EXT_ARR(SSAIA),
 	KVM_ISA_EXT_ARR(SSTC),
 	KVM_ISA_EXT_ARR(SVINVAL),
 	KVM_ISA_EXT_ARR(SVPBMT),
@@ -96,6 +97,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_C:
 	case KVM_RISCV_ISA_EXT_I:
 	case KVM_RISCV_ISA_EXT_M:
+	case KVM_RISCV_ISA_EXT_SSAIA:
 	case KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
@@ -451,30 +453,79 @@ static int kvm_riscv_vcpu_set_reg_core(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static int kvm_riscv_vcpu_general_get_csr(struct kvm_vcpu *vcpu,
+					  unsigned long reg_num,
+					  unsigned long *out_val)
+{
+	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+
+	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
+		return -EINVAL;
+
+	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
+		kvm_riscv_vcpu_flush_interrupts(vcpu);
+		*out_val = (csr->hvip >> VSIP_TO_HVIP_SHIFT) & VSIP_VALID_MASK;
+	} else
+		*out_val = ((unsigned long *)csr)[reg_num];
+
+	return 0;
+}
+
 static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 				      const struct kvm_one_reg *reg)
 {
-	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+	int rc;
 	unsigned long __user *uaddr =
 			(unsigned long __user *)(unsigned long)reg->addr;
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
 					    KVM_REG_RISCV_CSR);
-	unsigned long reg_val;
+	unsigned long reg_val, reg_subtype;
 
 	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
 		return -EINVAL;
+
+	reg_subtype = (reg_num & KVM_REG_RISCV_SUBTYPE_MASK)
+			>> KVM_REG_RISCV_SUBTYPE_SHIFT;
+	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+	switch (reg_subtype) {
+	case KVM_REG_RISCV_CSR_GENERAL:
+		rc = kvm_riscv_vcpu_general_get_csr(vcpu, reg_num, &reg_val);
+		break;
+	case KVM_REG_RISCV_CSR_AIA:
+		rc = kvm_riscv_vcpu_aia_get_csr(vcpu, reg_num, &reg_val);
+		break;
+	default:
+		rc = -EINVAL;
+		break;
+	}
+	if (rc)
+		return rc;
+
+	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static inline int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
+						 unsigned long reg_num,
+						 unsigned long reg_val)
+{
+	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+
 	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
 		return -EINVAL;
 
 	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
-		kvm_riscv_vcpu_flush_interrupts(vcpu);
-		reg_val = (csr->hvip >> VSIP_TO_HVIP_SHIFT) & VSIP_VALID_MASK;
-	} else
-		reg_val = ((unsigned long *)csr)[reg_num];
+		reg_val &= VSIP_VALID_MASK;
+		reg_val <<= VSIP_TO_HVIP_SHIFT;
+	}
 
-	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
-		return -EFAULT;
+	((unsigned long *)csr)[reg_num] = reg_val;
+
+	if (reg_num == KVM_REG_RISCV_CSR_REG(sip))
+		WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
 
 	return 0;
 }
@@ -482,31 +533,36 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 				      const struct kvm_one_reg *reg)
 {
-	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+	int rc;
 	unsigned long __user *uaddr =
 			(unsigned long __user *)(unsigned long)reg->addr;
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
 					    KVM_REG_RISCV_CSR);
-	unsigned long reg_val;
+	unsigned long reg_val, reg_subtype;
 
 	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
 		return -EINVAL;
-	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
-		return -EINVAL;
 
 	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
 
-	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
-		reg_val &= VSIP_VALID_MASK;
-		reg_val <<= VSIP_TO_HVIP_SHIFT;
+	reg_subtype = (reg_num & KVM_REG_RISCV_SUBTYPE_MASK)
+			>> KVM_REG_RISCV_SUBTYPE_SHIFT;
+	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+	switch (reg_subtype) {
+	case KVM_REG_RISCV_CSR_GENERAL:
+		rc = kvm_riscv_vcpu_general_set_csr(vcpu, reg_num, reg_val);
+		break;
+	case KVM_REG_RISCV_CSR_AIA:
+		rc = kvm_riscv_vcpu_aia_set_csr(vcpu, reg_num, reg_val);
+		break;
+	default:
+		rc = -EINVAL;
+		break;
 	}
-
-	((unsigned long *)csr)[reg_num] = reg_val;
-
-	if (reg_num == KVM_REG_RISCV_CSR_REG(sip))
-		WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
+	if (rc)
+		return rc;
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
