Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A948C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 16:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WonABSUphmACIWI1uJ8uY9CgUUwGBtTetCPfnynBq/o=; b=JsiC07q3O3TP6T
	QWcinzATInEvH7qV1/Hpy+LyJsWtEdkKGYxjDY06lyqdRyL1DLAoESa71IwH5yKx6IcwevohqmtfL
	gMd08yxeqZz/fMXLw3yKmVsKxl34vn+mfIAzTfzLiFxifdlA/mxjUOHh7ElsTsx482c3v3Pz5ooHG
	Odd3a9Qv5fYsrlaqIHar69eMj04dqXg34h0gxr8Tuk8Dy1cIN+VfJT8wbHInQhiu713e5mDlEvmzg
	Apyz1gxTRED9JJYa3kWQmHADeeWJkyxoaGn55JfzaNXhO9SXpUcBszR43XdzOTvx62J+k6XoOCBFr
	Jw++GmwGxjh3nzOmEV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcQy-000Tf2-30;
	Wed, 12 Jul 2023 16:11:20 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcQq-000TXS-01
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 16:11:17 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-55b66ca1c80so3789522a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 09:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689178270; x=1691770270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTUMIEDhcKf2bFBb/5BSCfijz7GR+v5Ad2nUk3NUi0Q=;
        b=DBy3wZ8TzbwTSWBfOP++4PzWuBd8ru08ph1IXO4TsE4JEf37vUxH5co7qmup01LJnE
         JjxKmSVHVo+OdfN0ySGY2IBsAcrhOjPcsFWFwb5Uziv0VCQdR0eTYOyOVbfWzYjQW6xR
         /qdUKimBRDNqNK4s+XVWZISSWwCH0zjyV9Y62uucjJWEXWSivplUYPxgFUuKcDZbh8pL
         szastF2RGm3WNn6FpPC4WQGlrPsPp1BKqh1Y9hYc0SKFW0UhLBpK2EY1RqtYT1/jowT2
         RwNwUY3kHwz0qR6pualkBr7Pp2NQCW40CmPbAbqyzoe1rFkgTEMiTlKLL+99A58kqZS8
         Km3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689178270; x=1691770270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTUMIEDhcKf2bFBb/5BSCfijz7GR+v5Ad2nUk3NUi0Q=;
        b=X1rBwwtjxBswd+ffDwirP2BFYewMNBf2exJ87fqnKBpVJoWGmZygb2a2+3HGCMmdpr
         sGJXh3SBJ+2KWniujhA/xB4ryqqPYqqs/49sBpsN5bIJIkXtKyLsgY+dN/O1vJjxPi2x
         l6DkbnITLfmtV6kQd3tmPskHuBH/e57CsFdIQj3FDeXHV4/FCtK0JjQ+Yw0h1bM/DTmt
         7sala9/iMAD/xGcrDXgdpy0P6fwTeTzUWOnEkLeFAUq9Jyg1Pnkl8CwMy+9IjMaB1F/u
         ZIlZY6FULzTBzMNPlAFp21CNeguUu2QuGZut/UByees61DI3V7dlotwSA0fkn+IpGwDu
         Dybg==
X-Gm-Message-State: ABy/qLb51U0Kv0a71EEjjYXR3P/APvkDRT0RAlF+xp4mh9zYHhrkHj+6
	+r6/4PyA2PpuJd/B9zgy8LbcBQ==
X-Google-Smtp-Source: APBJJlGsx/YmWFy6gTZ9WN+HYb6lFatRjBmtvz+ASObwDYHyCHP87qgrdXgdVoI9bb0IcE5detKGIw==
X-Received: by 2002:a17:902:ab98:b0:1b8:3cb8:7926 with SMTP id f24-20020a170902ab9800b001b83cb87926mr14382566plr.23.1689178269799;
        Wed, 12 Jul 2023 09:11:09 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.82.173])
        by smtp.gmail.com with ESMTPSA id bc2-20020a170902930200b001b9f032bb3dsm3811650plb.3.2023.07.12.09.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 09:11:09 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Samuel Ortiz <sameo@rivosinc.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/7] RISC-V: KVM: Extend ONE_REG to enable/disable multiple ISA extensions
Date: Wed, 12 Jul 2023 21:40:42 +0530
Message-Id: <20230712161047.1764756-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712161047.1764756-1-apatel@ventanamicro.com>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_091112_042630_CF1C5BC8 
X-CRM114-Status: GOOD (  15.31  )
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

Currently, the ISA extension ONE_REG interface only allows enabling or
disabling one extension at a time. To improve this, we extend the ISA
extension ONE_REG interface (similar to SBI extension ONE_REG interface)
so that KVM user space can enable/disable multiple extensions in one
ioctl.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h |   9 ++
 arch/riscv/kvm/vcpu_onereg.c      | 153 ++++++++++++++++++++++++------
 2 files changed, 133 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 930fdc4101cd..6c2285f86545 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -193,6 +193,15 @@ enum KVM_RISCV_SBI_EXT_ID {
 
 /* ISA Extension registers are mapped as type 7 */
 #define KVM_REG_RISCV_ISA_EXT		(0x07 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_ISA_SINGLE	(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_ISA_MULTI_EN	(0x1 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_ISA_MULTI_DIS	(0x2 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_ISA_MULTI_REG(__ext_id)	\
+		((__ext_id) / __BITS_PER_LONG)
+#define KVM_REG_RISCV_ISA_MULTI_MASK(__ext_id)	\
+		(1UL << ((__ext_id) % __BITS_PER_LONG))
+#define KVM_REG_RISCV_ISA_MULTI_REG_LAST	\
+		KVM_REG_RISCV_ISA_MULTI_REG(KVM_RISCV_ISA_EXT_MAX - 1)
 
 /* SBI extension registers are mapped as type 8 */
 #define KVM_REG_RISCV_SBI_EXT		(0x08 << KVM_REG_RISCV_TYPE_SHIFT)
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 836ffe79311a..236359722364 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -408,55 +408,34 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
-static int kvm_riscv_vcpu_get_reg_isa_ext(struct kvm_vcpu *vcpu,
-					  const struct kvm_one_reg *reg)
+static int riscv_vcpu_get_isa_ext_single(struct kvm_vcpu *vcpu,
+					 unsigned long reg_num,
+					 unsigned long *reg_val)
 {
-	unsigned long __user *uaddr =
-			(unsigned long __user *)(unsigned long)reg->addr;
-	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
-					    KVM_REG_SIZE_MASK |
-					    KVM_REG_RISCV_ISA_EXT);
-	unsigned long reg_val = 0;
 	unsigned long host_isa_ext;
 
-	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
-		return -EINVAL;
-
 	if (reg_num >= KVM_RISCV_ISA_EXT_MAX ||
 	    reg_num >= ARRAY_SIZE(kvm_isa_ext_arr))
 		return -EINVAL;
 
+	*reg_val = 0;
 	host_isa_ext = kvm_isa_ext_arr[reg_num];
 	if (__riscv_isa_extension_available(vcpu->arch.isa, host_isa_ext))
-		reg_val = 1; /* Mark the given extension as available */
-
-	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
-		return -EFAULT;
+		*reg_val = 1; /* Mark the given extension as available */
 
 	return 0;
 }
 
-static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
-					  const struct kvm_one_reg *reg)
+static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
+					 unsigned long reg_num,
+					 unsigned long reg_val)
 {
-	unsigned long __user *uaddr =
-			(unsigned long __user *)(unsigned long)reg->addr;
-	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
-					    KVM_REG_SIZE_MASK |
-					    KVM_REG_RISCV_ISA_EXT);
-	unsigned long reg_val;
 	unsigned long host_isa_ext;
 
-	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
-		return -EINVAL;
-
 	if (reg_num >= KVM_RISCV_ISA_EXT_MAX ||
 	    reg_num >= ARRAY_SIZE(kvm_isa_ext_arr))
 		return -EINVAL;
 
-	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
-		return -EFAULT;
-
 	host_isa_ext = kvm_isa_ext_arr[reg_num];
 	if (!__riscv_isa_extension_available(NULL, host_isa_ext))
 		return	-EOPNOTSUPP;
@@ -482,6 +461,122 @@ static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static int riscv_vcpu_get_isa_ext_multi(struct kvm_vcpu *vcpu,
+					unsigned long reg_num,
+					unsigned long *reg_val)
+{
+	unsigned long i, ext_id, ext_val;
+
+	if (reg_num > KVM_REG_RISCV_ISA_MULTI_REG_LAST)
+		return -EINVAL;
+
+	for (i = 0; i < BITS_PER_LONG; i++) {
+		ext_id = i + reg_num * BITS_PER_LONG;
+		if (ext_id >= KVM_RISCV_ISA_EXT_MAX)
+			break;
+
+		ext_val = 0;
+		riscv_vcpu_get_isa_ext_single(vcpu, ext_id, &ext_val);
+		if (ext_val)
+			*reg_val |= KVM_REG_RISCV_ISA_MULTI_MASK(ext_id);
+	}
+
+	return 0;
+}
+
+static int riscv_vcpu_set_isa_ext_multi(struct kvm_vcpu *vcpu,
+					unsigned long reg_num,
+					unsigned long reg_val, bool enable)
+{
+	unsigned long i, ext_id;
+
+	if (reg_num > KVM_REG_RISCV_ISA_MULTI_REG_LAST)
+		return -EINVAL;
+
+	for_each_set_bit(i, &reg_val, BITS_PER_LONG) {
+		ext_id = i + reg_num * BITS_PER_LONG;
+		if (ext_id >= KVM_RISCV_ISA_EXT_MAX)
+			break;
+
+		riscv_vcpu_set_isa_ext_single(vcpu, ext_id, enable);
+	}
+
+	return 0;
+}
+
+static int kvm_riscv_vcpu_get_reg_isa_ext(struct kvm_vcpu *vcpu,
+					  const struct kvm_one_reg *reg)
+{
+	int rc;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_ISA_EXT);
+	unsigned long reg_val, reg_subtype;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+
+	reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
+	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+
+	reg_val = 0;
+	switch (reg_subtype) {
+	case KVM_REG_RISCV_ISA_SINGLE:
+		rc = riscv_vcpu_get_isa_ext_single(vcpu, reg_num, &reg_val);
+		break;
+	case KVM_REG_RISCV_ISA_MULTI_EN:
+	case KVM_REG_RISCV_ISA_MULTI_DIS:
+		rc = riscv_vcpu_get_isa_ext_multi(vcpu, reg_num, &reg_val);
+		if (!rc && reg_subtype == KVM_REG_RISCV_ISA_MULTI_DIS)
+			reg_val = ~reg_val;
+		break;
+	default:
+		rc = -EINVAL;
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
+static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
+					  const struct kvm_one_reg *reg)
+{
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_ISA_EXT);
+	unsigned long reg_val, reg_subtype;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+
+	reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
+	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+
+	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	switch (reg_subtype) {
+	case KVM_REG_RISCV_ISA_SINGLE:
+		return riscv_vcpu_set_isa_ext_single(vcpu, reg_num, reg_val);
+	case KVM_REG_RISCV_SBI_MULTI_EN:
+		return riscv_vcpu_set_isa_ext_multi(vcpu, reg_num, reg_val, true);
+	case KVM_REG_RISCV_SBI_MULTI_DIS:
+		return riscv_vcpu_set_isa_ext_multi(vcpu, reg_num, reg_val, false);
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 			   const struct kvm_one_reg *reg)
 {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
