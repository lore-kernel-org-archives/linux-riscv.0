Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E626C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 10:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4NrWAR7zINmH/r9r439c4+1VXKFyOFGbSR6I0ngUSo=; b=v9uE1b8zkogXqX
	O6CSdBZWtPxbv+S20F6z/tpcbD43TzaVIoSKv1MJo24+YlrbXPaQlwTinaWmIidGJNTwPa4SfAlq2
	cZnTk2S3JueGJB7WRTR1jpvvaa5mRdYxtlKkWpWeb5WjZQhZ8w0LOI9rqigClJzt+7iPhYHpX8Wco
	KxqtX3TzC/hM075mxfHRyzBOek9Uk3w0R3z1y6E1LgdF/k+POJ05xXgZ2pqcbRrRtt7toXO9E+bhh
	oOeDg4K3ZYzeFPG8BtTsbBDDg6ZZSBP8V+L4gHiBG7lN0e8aOYSfR+SAyALXlXX68/y3pFIY0UPPL
	7eIz6c8fyRChvGSN8q1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDilP-00HRbi-1V;
	Thu, 14 Dec 2023 10:16:19 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDilB-00HRLh-2a
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 10:16:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40c2d50bfbfso2390505e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 02:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702548964; x=1703153764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYS8fA2u8jdiTOaLOE6JjNR40Nvi3zTmLhn6Y0kb13Y=;
        b=P5QhYt92Uz891UkskYJYLMI+to7GaPcR7ULrb4skJzz4f8pwC4vjMgd1OtUR04cQ3p
         ZZcpMsEkTcmsSHuPsRGzyqISRZITizxCh90prf3QA4/TOuX00y0hXdoyeIjfONIKUpHu
         PNTvpjSgZRt6mDB1pKTpDu2lpiIJQ1bJ+sLpyhdC3EeSHfvinQk+C765QB1FPGrTBzL9
         1LUKpMADx+wW0emFh2/K+gCrOa3+EhUmgNfdIJeFP7cwY7o/wxRPoOCRnIKi8XwIWZM2
         QIaNspzkFWANmoxbMBqAtNI5zIIK7WRyeT/mfJ6MSZ6FR+k9IiTQUiEY49GhOC6ZGgac
         y5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702548964; x=1703153764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYS8fA2u8jdiTOaLOE6JjNR40Nvi3zTmLhn6Y0kb13Y=;
        b=FW4EaJLtoz+2X5i7YF0Kt6KkfaknQ1vgmEWFhhMNzqYxroNv2wtPmrYFcoKI5g6hHr
         6IPsVND9pX/SvlHkJ8naPA8rYrHnb8zv+tdH/2aS1cRgQuvwMEuFRkx5dfMj1Sv0EfvG
         K9ZrhTXWrspmZmpZj8mbrR+R5EsQOaFQ5YdiGyJ+toCY6XIdN9BzouRaK4jeqDkDhTyU
         oqL8T1fBuNolvRB+/F1cumZP1HyOwQaBx10vvinHCbMS4C78kNh4H5WcPZLcB2tm3Up0
         2FtHLaFHeYfC3oF0mre9WYKnN6s2PaRWg/niC9H0yUXp6yof87jX1nHuhX5Myf4YHqxg
         +alw==
X-Gm-Message-State: AOJu0YzduT4j/ggo/L+zD9Y+fE79AwdQmgb+Xcq0RU7oUe9gsL/YEWAR
	5V4p6uaUpdbU/WMMaNourrUB+Q==
X-Google-Smtp-Source: AGHT+IHWi/Q17hyThAxoAYyLpX+AXOSBI7CDCNwmTuPfERhY3kp+7EJ0IOm1AmAiBWjQC/oaucGzkA==
X-Received: by 2002:a05:600c:2a41:b0:40b:5e56:7b67 with SMTP id x1-20020a05600c2a4100b0040b5e567b67mr4940265wme.176.1702548963873;
        Thu, 14 Dec 2023 02:16:03 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c468800b0040c488e4fb5sm14092326wmo.40.2023.12.14.02.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:16:03 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org,
	conor.dooley@microchip.com
Subject: [PATCH v2 07/13] RISC-V: KVM: Add support for SBI extension registers
Date: Thu, 14 Dec 2023 11:15:59 +0100
Message-ID: <20231214101552.100721-22-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214101552.100721-15-ajones@ventanamicro.com>
References: <20231214101552.100721-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_021605_845322_E0857837 
X-CRM114-Status: GOOD (  15.08  )
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

Some SBI extensions have state that needs to be saved / restored
when migrating the VM. Provide a get/set-one-reg register type
for SBI extension registers. Each SBI extension that uses this type
will have its own subtype. There are currently no subtypes defined.
The next patch introduces the first one.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 ++
 arch/riscv/include/uapi/asm/kvm.h     |  3 ++
 arch/riscv/kvm/vcpu_onereg.c          | 42 +++++++++++++++++--
 arch/riscv/kvm/vcpu_sbi.c             | 58 +++++++++++++++++++++++++++
 4 files changed, 103 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 99c23bb37a37..dd60f73b5c36 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -60,6 +60,10 @@ int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
 				   const struct kvm_one_reg *reg);
 int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
 				   const struct kvm_one_reg *reg);
+int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu,
+			       const struct kvm_one_reg *reg);
+int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu,
+			       const struct kvm_one_reg *reg);
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 				struct kvm_vcpu *vcpu, unsigned long extid);
 bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index e961d79622fb..30f89a0e855f 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -242,6 +242,9 @@ enum KVM_RISCV_SBI_EXT_ID {
 #define KVM_REG_RISCV_VECTOR_REG(n)	\
 		((n) + sizeof(struct __riscv_v_ext_state) / sizeof(unsigned long))
 
+/* Registers for specific SBI extensions are mapped as type 10 */
+#define KVM_REG_RISCV_SBI		(0x0a << KVM_REG_RISCV_TYPE_SHIFT)
+
 /* Device Control API: RISC-V AIA */
 #define KVM_DEV_RISCV_APLIC_ALIGN		0x1000
 #define KVM_DEV_RISCV_APLIC_SIZE		0x4000
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 11cdbf844291..901480e73817 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -961,6 +961,29 @@ static unsigned long num_sbi_ext_regs(struct kvm_vcpu *vcpu)
 	return copy_sbi_ext_reg_indices(vcpu, NULL);
 }
 
+static inline unsigned long num_sbi_regs(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
+
+static int copy_sbi_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
+{
+	int n = num_sbi_regs(vcpu);
+
+	for (int i = 0; i < n; i++) {
+		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 |
+			  KVM_REG_RISCV_SBI | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+	}
+
+	return n;
+}
+
 static inline unsigned long num_vector_regs(const struct kvm_vcpu *vcpu)
 {
 	if (!riscv_isa_extension_available(vcpu->arch.isa, v))
@@ -1028,6 +1051,7 @@ unsigned long kvm_riscv_vcpu_num_regs(struct kvm_vcpu *vcpu)
 	res += num_vector_regs(vcpu);
 	res += num_isa_ext_regs(vcpu);
 	res += num_sbi_ext_regs(vcpu);
+	res += num_sbi_regs(vcpu);
 
 	return res;
 }
@@ -1083,6 +1107,12 @@ int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
 	ret = copy_sbi_ext_reg_indices(vcpu, uindices);
 	if (ret < 0)
 		return ret;
+	uindices += ret;
+
+	ret = copy_sbi_reg_indices(vcpu, uindices);
+	if (ret < 0)
+		return ret;
+	uindices += ret;
 
 	return 0;
 }
@@ -1105,12 +1135,14 @@ int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_FP_D:
 		return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
 						 KVM_REG_RISCV_FP_D);
+	case KVM_REG_RISCV_VECTOR:
+		return kvm_riscv_vcpu_set_reg_vector(vcpu, reg);
 	case KVM_REG_RISCV_ISA_EXT:
 		return kvm_riscv_vcpu_set_reg_isa_ext(vcpu, reg);
 	case KVM_REG_RISCV_SBI_EXT:
 		return kvm_riscv_vcpu_set_reg_sbi_ext(vcpu, reg);
-	case KVM_REG_RISCV_VECTOR:
-		return kvm_riscv_vcpu_set_reg_vector(vcpu, reg);
+	case KVM_REG_RISCV_SBI:
+		return kvm_riscv_vcpu_set_reg_sbi(vcpu, reg);
 	default:
 		break;
 	}
@@ -1136,12 +1168,14 @@ int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_FP_D:
 		return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
 						 KVM_REG_RISCV_FP_D);
+	case KVM_REG_RISCV_VECTOR:
+		return kvm_riscv_vcpu_get_reg_vector(vcpu, reg);
 	case KVM_REG_RISCV_ISA_EXT:
 		return kvm_riscv_vcpu_get_reg_isa_ext(vcpu, reg);
 	case KVM_REG_RISCV_SBI_EXT:
 		return kvm_riscv_vcpu_get_reg_sbi_ext(vcpu, reg);
-	case KVM_REG_RISCV_VECTOR:
-		return kvm_riscv_vcpu_get_reg_vector(vcpu, reg);
+	case KVM_REG_RISCV_SBI:
+		return kvm_riscv_vcpu_get_reg_sbi(vcpu, reg);
 	default:
 		break;
 	}
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 088daaa23dd8..834176242ddf 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -325,6 +325,64 @@ int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu,
+			       const struct kvm_one_reg *reg)
+{
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_SBI);
+	unsigned long reg_subtype, reg_val;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+
+	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
+	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+
+	switch (reg_subtype) {
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu,
+			       const struct kvm_one_reg *reg)
+{
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_SBI);
+	unsigned long reg_subtype, reg_val;
+	int ret;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+
+	reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
+	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+
+	switch (reg_subtype) {
+	default:
+		return -EINVAL;
+	}
+
+	if (ret)
+		return ret;
+
+	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	return 0;
+}
+
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 				struct kvm_vcpu *vcpu, unsigned long extid)
 {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
