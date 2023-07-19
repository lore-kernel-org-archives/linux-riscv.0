Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8864C001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aN5FdEvnD9Dn5INZiOZdvWvETXwSLEmZWGYZeSODJGM=; b=AyxAiCIiOcVFv8
	IfVjAh7WboKAdOUB/gh154I9bROOpUN5tThjYRdHQmmRwTKWDcEyNVnOcKGmgE+pllM42DYM8pBRn
	hZOY47tSocrjOwZFRSy0FRQPBasbAaEnu1bA3T/I75PWMAgrN1PE2q0jj4N+MLJ4pzvu4fsgYK5i8
	KJA7rrcw0If0l43MmUKhf4Gu45GtOWt16zl5cKNvKfvH5TqpAsgMFRTsjbEvAll99pE6AY83M5kLo
	g1RIoUbMODcAWi1b4cmVXAzqqWyOjObepf44dgKjKy28zHlGpcX8my4HXMYxSukovw4OeJsRVRDa7
	cuZkk7ZsIohCwUSj1oKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9f8-0083Zx-2t;
	Wed, 19 Jul 2023 16:04:27 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9f6-0083XA-0j
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:04:26 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-666e64e97e2so4815897b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 09:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689782663; x=1692374663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6Ksr06UW7Dx/X9GfjFaRawS2ArEeJDwaLwbdE4Z+oI=;
        b=gbMcj59LZy5J2yd0G4ECck4eeK6B0alAQuPhASsWvrQy+rj257JzKKhSiYhAk3dVrK
         LoOjrTr1VbKlW/iEmXcHuloWGSUrtJxVKFUJonl+23lcetNYYAdR0NhsUA9bYuwIvIt2
         MxaXfI8jtJQDi6Q1ih4Xf/gELf+qL8GxHfO4xZ0kz0GO3dS8VlWz2fKoAR2+yLP0VuCJ
         gefEP0xL8X2Po38BWSC0v4OtGzNNnfAC/hog1Ms0Gji10lm+rIMODP61kWIKEjxNardW
         gmlXQyIq1curOIQdpyqQ/BuHzbGByJCw5sV0UF+tol4ZodypU+9aETbBRxXsfRMoD+56
         lveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689782663; x=1692374663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6Ksr06UW7Dx/X9GfjFaRawS2ArEeJDwaLwbdE4Z+oI=;
        b=UUoQPoDWn16rAdzGTNDc+nHYOZeIhTQ550I/b4+w9dxkknu0fxr6d7Bph+5JXyNHnk
         FkYkvbMg3NFWWca+VxtfF2OvOFiOLzTdFtyoZ68hdf24kU8otCzSBrl7H4c4WIkNo9f3
         Wmou2ksH2eevygCNEuR9O9OZQLMGkPwGBh1aWNJZ1VYTbULGrsAbUjVTlMQO0btH5ARn
         ed6rNXY/+g1zEa9Q5N+p/3Sp7v/ZqEvrzADHB4mfEYFwkTOxnzZavrdNDEjZv3l8B1x3
         aUKIqetNo1XqPCBDwl5WZpoSp6N+32ToefXW3SPJyAJR/YA+r0Hc9KAMSB72CxUvmO2D
         BglA==
X-Gm-Message-State: ABy/qLYDP8sdIz82s3nxht3doErUyI4tLGONKlF6fh3pXImrhLM1kwJQ
	yHOLLY3s9KtVuRbYb1ju7lSCig==
X-Google-Smtp-Source: APBJJlElvOn4pA2ZpispydueJaKesDdcNrP8G0wq+FM1nCFEGE10XWG/v1rALVyw7TzIFAvBMm977A==
X-Received: by 2002:a05:6a20:8e0d:b0:129:b68b:92db with SMTP id y13-20020a056a208e0d00b00129b68b92dbmr19415879pzj.42.1689782662504;
        Wed, 19 Jul 2023 09:04:22 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id i22-20020aa79096000000b00682936d04ccsm3447023pfa.180.2023.07.19.09.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 09:04:22 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v1 6/6] RISCV: KVM: Add sstateen0 to ONE_REG
Date: Wed, 19 Jul 2023 21:33:16 +0530
Message-Id: <20230719160316.4048022-7-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719160316.4048022-1-mchitale@ventanamicro.com>
References: <20230719160316.4048022-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_090424_298469_421063C9 
X-CRM114-Status: GOOD (  12.38  )
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

Add support for sstateen0 CSR to the ONE_REG interface to allow its
access from user space.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  9 +++++++
 arch/riscv/kvm/vcpu.c             | 40 +++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 74c7f42de29d..bdddfb20299a 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -93,6 +93,11 @@ struct kvm_riscv_aia_csr {
 	unsigned long iprio2h;
 };
 
+/* Smstateen CSR for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_smstateen_csr {
+	unsigned long sstateen0;
+};
+
 /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_timer {
 	__u64 frequency;
@@ -173,10 +178,14 @@ enum KVM_RISCV_SBI_EXT_ID {
 #define KVM_REG_RISCV_CSR		(0x03 << KVM_REG_RISCV_TYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_GENERAL	(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_AIA		(0x1 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_CSR_SMSTATEEN	(0x2 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+
 #define KVM_REG_RISCV_CSR_REG(name)	\
 		(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
 #define KVM_REG_RISCV_CSR_AIA_REG(name)	\
 	(offsetof(struct kvm_riscv_aia_csr, name) / sizeof(unsigned long))
+#define KVM_REG_RISCV_CSR_SMSTATEEN_REG(name)	\
+	(offsetof(struct kvm_riscv_smstateen_csr, name) / sizeof(unsigned long))
 
 /* Timer registers are mapped as type 4 */
 #define KVM_REG_RISCV_TIMER		(0x04 << KVM_REG_RISCV_TYPE_SHIFT)
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index ae750decbefe..af7549374c4b 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -507,6 +507,34 @@ static int kvm_riscv_vcpu_general_get_csr(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static inline int kvm_riscv_vcpu_smstateen_set_csr(struct kvm_vcpu *vcpu,
+						   unsigned long reg_num,
+						   unsigned long reg_val)
+{
+	struct kvm_vcpu_smstateen_csr *csr = &vcpu->arch.smstateen_csr;
+
+	if (reg_num >= sizeof(struct kvm_riscv_smstateen_csr) /
+	    sizeof(unsigned long))
+		return -EINVAL;
+
+	((unsigned long *)csr)[reg_num] = reg_val;
+	return 0;
+}
+
+static int kvm_riscv_vcpu_smstateen_get_csr(struct kvm_vcpu *vcpu,
+					    unsigned long reg_num,
+					    unsigned long *out_val)
+{
+	struct kvm_vcpu_smstateen_csr *csr = &vcpu->arch.smstateen_csr;
+
+	if (reg_num >= sizeof(struct kvm_riscv_smstateen_csr) /
+	    sizeof(unsigned long))
+		return -EINVAL;
+
+	*out_val = ((unsigned long *)csr)[reg_num];
+	return 0;
+}
+
 static inline int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
 						 unsigned long reg_num,
 						 unsigned long reg_val)
@@ -552,6 +580,12 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CSR_AIA:
 		rc = kvm_riscv_vcpu_aia_get_csr(vcpu, reg_num, &reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_SMSTATEEN:
+		rc = -EINVAL;
+		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
+			rc = kvm_riscv_vcpu_smstateen_get_csr(vcpu, reg_num,
+							      &reg_val);
+		break;
 	default:
 		rc = -EINVAL;
 		break;
@@ -591,6 +625,12 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CSR_AIA:
 		rc = kvm_riscv_vcpu_aia_set_csr(vcpu, reg_num, reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_SMSTATEEN:
+		rc = -EINVAL;
+		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
+			rc = kvm_riscv_vcpu_smstateen_set_csr(vcpu, reg_num,
+							      reg_val);
+		break;
 	default:
 		rc = -EINVAL;
 		break;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
