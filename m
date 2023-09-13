Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55101EE01E0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 16:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JxL/TaTBE+6qWOLmPV5ddKYdtyzYQVOjmR2wL38uveE=; b=3b36Q3CXGIS6UY
	gkjFebIan8oN9UVWQuKhQoO9mzJGzf6Ee6+zax3F4LtJrWJS4qxs0ixB3yIpBAsF0wHuQSs2hLdqm
	3D8fq3OsYwLogc2oBRGOtMJGFz5WHzjaaqPNuUWkW6jPfoTZ1ZhaGouhtZwpQ0ThjPyJ0Tt6ImO+t
	gTWJb3hUKiOrT5J525nsWEHCo1FRK1Dwf/wxBrdMG40uNr+xwKTe3sE2CgkXUvKFGCJGAh6uPVoFq
	N0gGB85Wg2OoAOFWpDx9XgjNIZmJr1q7DJvpx+sJ7gCYluPx7hx94aenZFhslbDzql9T2NUqdscwF
	VPQR7pq5irQsHFxaGeQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSxL-006PJH-2E;
	Wed, 13 Sep 2023 16:43:12 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSud-006M4q-2L
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 16:40:26 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-68fe2470d81so2335315b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 09:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694623221; x=1695228021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKfsPDBJ+P6p6dpX9yaIv3eC3Lcn8RGZt71DTNDJy4Y=;
        b=NDW1MMdNbSymdpEksu8xKOo8xgE/3LCULJo3JHrCmheB+WRaO/P9/Q2yqiEsAv7vjv
         s27ShNZNAWg+fkbBCK2H/du5AnekgHwSHOdUP1sH8awvlg/WpHnN69jG8omloGvpxCmD
         XxMYwSnVqf5zUBJ7yGGeupi8VP/Q1sMkuadDgad/BAPeBVj6caOhrNV1WR0TdfH9d85k
         B/+qrdBZnmpAooQZqPglhPLyFZOZHbCnqQtpNo2vAosP5ILP/W+UfFaYSJUHHQML8+8V
         SoWFt8DQdcMQbBOjHI5Xmjw2FOmcI7FPgiN5NfKq/DqifB4OaLlGRkm8H6IIq2CJ0nod
         fXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694623221; x=1695228021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKfsPDBJ+P6p6dpX9yaIv3eC3Lcn8RGZt71DTNDJy4Y=;
        b=h0KPOkjky8t2uI7BqZTt82Nj8dykQw148qwlkHnLgOa49HwcG7X0ww8fEKtxgI8Nei
         /0T7s+gqjoEqkydtPXMSODs1ibBvNU/j23yW7tfSyNHm4X30Gg11kYjAGtGphddAn7EW
         ei96ugTZ5kKfR5OFEH2U6JpPP5uZfoFIWu2BoexAC4RMGg5y3AAlUeevn7HCUUbUAkAL
         Rl8RZ+W0jk8avC9+JALDBSCXTfhcdg64SGGsFzf+yVtzW+MmrxA8VE8P9hZlKRKb8NHA
         UeBJIqVdFm5EC2L4R1zk68uRjBQVv3+1S5IquB/k7aLTEzEFIqKdgrKNP6tW0T02dU6U
         ERJw==
X-Gm-Message-State: AOJu0YyPyceEXoD2dZIw+1c/0/MB1pVIb9HS/Gwa5CemjnWTgiEwgfIB
	GSR+J7rC5dfBVx6KRrvudELlLnvaBjM/4nIFxXCUlA==
X-Google-Smtp-Source: AGHT+IFbRLr8FeGoVpOkQd6cH+MTeBdpCgPRQ+afGMzk5aWno4AtTRmGLxs8CgXWZ9XkExaV6rGwbg==
X-Received: by 2002:a05:6a20:734e:b0:14c:d494:77c5 with SMTP id v14-20020a056a20734e00b0014cd49477c5mr3041141pzc.13.1694623220693;
        Wed, 13 Sep 2023 09:40:20 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id je15-20020a170903264f00b001b243a20f26sm10577756plb.273.2023.09.13.09.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 09:40:20 -0700 (PDT)
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
Subject: [PATCH v5 7/7] RISCV: KVM: Add sstateen0 to ONE_REG
Date: Wed, 13 Sep 2023 22:09:05 +0530
Message-Id: <20230913163905.480819-8-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913163905.480819-1-mchitale@ventanamicro.com>
References: <20230913163905.480819-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_094023_771772_C2CCF065 
X-CRM114-Status: GOOD (  12.35  )
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
 arch/riscv/include/uapi/asm/kvm.h |  8 +++++++
 arch/riscv/kvm/vcpu_onereg.c      | 40 +++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index c161791f55cb..b9448f9384b9 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -94,6 +94,11 @@ struct kvm_riscv_aia_csr {
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
@@ -180,10 +185,13 @@ enum KVM_RISCV_SBI_EXT_ID {
 #define KVM_REG_RISCV_CSR		(0x03 << KVM_REG_RISCV_TYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_GENERAL	(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_AIA		(0x1 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_CSR_SMSTATEEN    (0x2 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_REG(name)	\
 		(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
 #define KVM_REG_RISCV_CSR_AIA_REG(name)	\
 	(offsetof(struct kvm_riscv_aia_csr, name) / sizeof(unsigned long))
+#define KVM_REG_RISCV_CSR_SMSTATEEN_REG(name)  \
+	(offsetof(struct kvm_riscv_smstateen_csr, name) / sizeof(unsigned long))
 
 /* Timer registers are mapped as type 4 */
 #define KVM_REG_RISCV_TIMER		(0x04 << KVM_REG_RISCV_TYPE_SHIFT)
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index cfd4890612e1..72bcb5ae2489 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -379,6 +379,34 @@ static int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static inline int kvm_riscv_vcpu_smstateen_set_csr(struct kvm_vcpu *vcpu,
+						   unsigned long reg_num,
+						   unsigned long reg_val)
+{
+	struct kvm_vcpu_smstateen_csr *csr = &vcpu->arch.smstateen_csr;
+
+	if (reg_num >= sizeof(struct kvm_riscv_smstateen_csr) /
+		sizeof(unsigned long))
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
+		sizeof(unsigned long))
+		return -EINVAL;
+
+	*out_val = ((unsigned long *)csr)[reg_num];
+	return 0;
+}
+
 static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 				      const struct kvm_one_reg *reg)
 {
@@ -402,6 +430,12 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
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
 		rc = -ENOENT;
 		break;
@@ -441,6 +475,12 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CSR_AIA:
 		rc = kvm_riscv_vcpu_aia_set_csr(vcpu, reg_num, reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_SMSTATEEN:
+		rc = -EINVAL;
+		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
+			rc = kvm_riscv_vcpu_smstateen_set_csr(vcpu, reg_num,
+							      reg_val);
+break;
 	default:
 		rc = -ENOENT;
 		break;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
