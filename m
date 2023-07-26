Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E56CC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 08:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1f74u6/NfAnIiAT8p6dySwNbsbqdbCh77uhEcXOumQ=; b=OTi2ba2b6KUHTI
	vjEB4a1ydu7uW29BJ0mx0YgCJ0L/DvGNmKCS96PxV0tBZXu9hyNJBMZFVryGjM3B9JX7Do3R0f1RK
	5KDGtEYi8Vo20IigxiFpBz4hD/qcYIqJWCQe650fqVD/Mx1Th++sOT53T4qbvSqNpdY1X9WzYj8IA
	MSywu4RRT5GEnUO8s7ctTU9cadLu02aZfegNS9cnXeTwKb5z72by0ggmmhV2R/in1y+4UDnlVR+03
	4qYynoM2LzE870DWkUirsW6oeULsjmtRExWV6lqrfiT7QB71zTe3sxMv9M3uoHz+cymrWQt1AZ4B7
	758TOeTfQQdWdX0SIaVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOa8S-009cNm-14;
	Wed, 26 Jul 2023 08:44:44 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOa8O-009cKO-2i
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 08:44:42 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b8ad8383faso49193375ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jul 2023 01:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690361079; x=1690965879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jq7CatpLvEuamo8s3Q0+Xj2eL2B+J8eMtzZwBU9xifI=;
        b=CDJ5Frer1O2G8FhQCsxljDvfHgI9sNZeIBtVCrG0/I8KI2DfKVMIXtK1f3WPBe183c
         6AWp5YaRzM0WQWqzJJXfxFTgPjw2/MANBEfvTz4hK9cLmcVp7hHJte3tHgUJHxz1AdAV
         liQ8mMsLBq6Q0KDHYaJP8C11hC4n5dZSXmoQI067n6TCkGfz0Ov7ulE2XYnXUZqmSxLK
         9kCaMGfRFBxEOrtoh9h+xc2yTnKxUKU22XkHPpZP9zgWYirxod2BPBz4Elk5UuUfPhX+
         v9ss9A1s/iTgE8O8UPD+XVNuPHlSSVCCUuwfhw62KxbdbabnvNwuXQokX3rdxvD5h5Of
         xAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690361079; x=1690965879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jq7CatpLvEuamo8s3Q0+Xj2eL2B+J8eMtzZwBU9xifI=;
        b=cZBV1V9GxBtV1nCkjxH4FxQ0dyQ3MSRVXxqnw5b3TWcdpaijGx8wS5cp35zMyCzaAw
         46AC0Y1/a8sFpLd+aJUkUBnZJ/Pncer4vj2KJsF0ZBvCkCgK1lwo8ASTbzRrtBM38DeP
         Y7BdTU50jnEILQL+2Vzo2o1+PhGMuGG5xRX33gEeH1/W/NlA7cNO9NLyIH+5gf0G5S/r
         U00jqDPTmLuGX/42L+PBya8wqZbR/JCBVFDmcs2EpEE9acw1t4XeQA1R/1szgdbEpFoe
         6g4rblDRJjSc7rh9JPmGMYnsY1gHRyX08nGSEcqAbEG4oohcqLrh45u7OJiQ4p9kyWcI
         zUSg==
X-Gm-Message-State: ABy/qLZMDGttv7tuD/F3MuH93BL9ccr0HbUrrKL7X+QZYBysDqRrjaOU
	kdygsoJMP9hMj6rzbnhstCDhZA==
X-Google-Smtp-Source: APBJJlHz6r3/3jHGuEGLyXcyY2FTESfSup8IkUNWJtj0Ni8hH5kEK3u0sqlFMldEiX74b/dZ7oFlFg==
X-Received: by 2002:a17:902:e88a:b0:1bb:1e69:28c0 with SMTP id w10-20020a170902e88a00b001bb1e6928c0mr1885397plg.30.1690361078782;
        Wed, 26 Jul 2023 01:44:38 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id y19-20020a170902ed5300b001b3bf8001a9sm3978637plb.48.2023.07.26.01.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 01:44:38 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v4 7/7] RISCV: KVM: Add sstateen0 to ONE_REG
Date: Wed, 26 Jul 2023 14:13:52 +0530
Message-Id: <20230726084352.2136377-8-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726084352.2136377-1-mchitale@ventanamicro.com>
References: <20230726084352.2136377-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_014440_897732_7D6BD967 
X-CRM114-Status: GOOD (  13.22  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  9 +++++++
 arch/riscv/kvm/vcpu_onereg.c      | 41 +++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 7a43d08c3eed..fd3866cc08a2 100644
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
@@ -179,10 +184,14 @@ enum KVM_RISCV_SBI_EXT_ID {
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
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 0dc2c2cecb45..2d1ea5bb2a1d 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -49,6 +49,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZIFENCEI),
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 	KVM_ISA_EXT_ARR(ZIHPM),
+	KVM_ISA_EXT_ARR(SMSTATEEN),
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -350,6 +351,34 @@ static int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
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
 static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 				      const struct kvm_one_reg *reg)
 {
@@ -373,6 +402,12 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
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
@@ -412,6 +447,12 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
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
