Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8090C001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 14:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ucYmdW/+nenvRn7+nmkyS0ajCKpnbIsEG/TVYomNIY=; b=1GWWFi9lZ2/5om
	Ys4yGHTCsV8EaoLLSQDw8DMJqxKTkY/4m2O+xNi9+3BWn7vCywRmOWsTOWmEcJt5vcWtlIQAMG7rb
	AgC/dRIzcGPDq3xB9VryBfqYwa8PJwDLmKXKzCAp7Ga0LO3X5wLQANhj/LnNlup5hMLqGxA4iX3LQ
	aHbuHpVniG10TsAsC5+hv+XZAYWICxQS7ING5IQVkc1SVvZNUUBRMfRACyUcXw6Xy3MfvcuGdW9xf
	IxPuGt9HyS9f+jaMyx3XxqORtCdq15iU8II0FUy/9RXHCf6+j9U+jBPGAoMogE5ewzt8t8nwGsvK7
	DuxBO17+j81xA+uuRBxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwRC-004arV-0e;
	Mon, 24 Jul 2023 14:21:26 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwR9-004apM-1m
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 14:21:25 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b9ecf0cb4cso24315985ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690208482; x=1690813282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDnREYRMUsFKwotu4+OZbUuiYKT956lIR1m4uTAXghk=;
        b=BpMmpgZLigGNyFchrxOPOLlJlgmjs0MiG9pCQaVC5n/bE9lBJToYkJY/T81TALk0ln
         48mdZU0OiESH7WEdkYAV5JUYdP5OsKBtYJtvK0+YK0qrV4rjmtFNnp+JYhO4m8vgUH3e
         Lrcll9X8RLTuVsd2Sw4w1cRoDy9hleJmzkJMdyOt5PxkzvSPSWmSrBi1dKP1ncuPtfJ8
         meOsSZn3jdDqpPM/mV937BTSlbfHElrnLzF0zPxLvGyL/N7AjvDsGGZ08LM4xLf6EF56
         GofdbaIR79gbpbSSY7iHLkCxB2uH3tcOTwJK9hHaHx/EZrM900sLMp+lD779OXM8kIjY
         8HZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690208482; x=1690813282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDnREYRMUsFKwotu4+OZbUuiYKT956lIR1m4uTAXghk=;
        b=QfLwJXnQ8tvWFSykFbzXH+0cf5T7FhOuxBja8csExydha7y0/Tz/Bcvj5PUhRIFfCl
         Xi1D3S/dKsGXlJ6knT7Al+/xzc8jF6Q8kA8EFQvPFMKZso4uVNCt9uhpv/ov+PhzM+Hn
         oAHD3HXJ2HkxhbirzVuX4Q2QGDAHOKxsZyAEq+Dxr0ELiYJhRHger3dqt58XJtCda+m6
         Y8NAd2+7/YtrYPd/8RzDx0HIR2zzKsgBfGIgyxalP9bTyqzMOmBk5SJ8eP2t+p5FqLjv
         K7yac1RAiX2qPG+Fea5VaXFfvKVjtSRfLHx0+s188SY6INSUAg4CX54E2in2HsSNhHOz
         kWwg==
X-Gm-Message-State: ABy/qLaepM8Zif+ERdHvHGYZUoz8kpHEqI/aWD029Qdn/BOuGB7xxkrG
	dAvQg7WrNq/O/T/VNdRYTmqyCKKWYKKbOPrAmTirfw==
X-Google-Smtp-Source: APBJJlFVpOfpewEUKvNfOOSKkZ45Iflti55y5wOh08p3XPPqcFtt1L3xleW+okCDUdPZ11RRLSxMDQ==
X-Received: by 2002:a17:902:d489:b0:1b8:8069:d432 with SMTP id c9-20020a170902d48900b001b88069d432mr9288355plg.16.1690208482323;
        Mon, 24 Jul 2023 07:21:22 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id s10-20020a170902a50a00b001b8307c81c8sm9009821plq.121.2023.07.24.07.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 07:21:22 -0700 (PDT)
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
Subject: [PATCH v3 7/7] RISCV: KVM: Add sstateen0 to ONE_REG
Date: Mon, 24 Jul 2023 19:50:33 +0530
Message-Id: <20230724142033.306538-8-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724142033.306538-1-mchitale@ventanamicro.com>
References: <20230724142033.306538-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_072123_591876_C25BA0A5 
X-CRM114-Status: GOOD (  12.21  )
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
index 1f8e8b5f659b..630669513bd7 100644
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
