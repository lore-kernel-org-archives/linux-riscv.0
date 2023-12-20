Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806A4C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 16:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mxU3SRy9vx6y9SNwv1D4CSBhakyF4kvkD0cZiX/trhI=; b=EnU1SNpPEqiSy3
	MXJc0GYeANg2nD9zgyQvsvC+td/5FdyUe9BxCXy1TKXAS/F6ksRPx42MreTP+9qagcovPXwVJrA1e
	YtwfxQkQs2GquiQMvoD2Bba8ycRB7PpkxkI0+E+rekOAq2qKBe3efLJDxhcNhsuPgAv+5x5lucuaA
	Uj9RANWwFrob9GrF3/kNSrTpByisFCPfuZBWwhN5Tztmy8qZiuebTzSIxRUN5tay1AwLQBeO49D/P
	J9islZ+PHNsHOtlw8+OREldr0eHu9/u6Sv/Qo4itsQAgcMf0hZrzdhz5CpAGm0A82TXuhLljgEos5
	2B6Go/wwtdvfXWyHDvRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFz0D-000MLp-0H;
	Wed, 20 Dec 2023 16:00:57 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyzv-000M2e-1a
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 16:00:41 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40d3a2703c9so3270535e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 08:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703088038; x=1703692838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpURfIIPcWjXkfktChCkrPfs/5M7Hj157zHrpDPFlwA=;
        b=XTI8FcQsbkXP3s+004CZabRpHOandtlI4Vo11oAmkZVYh0ml77PaBN4tz0f9QzBC/x
         eiRaE4lqvhLiyL/nI2dX/QpEDCSLDCAdVEnam5xlw8kB/hiHsa29uG6gsVlUjRF4yJAF
         sd9scn73aXEGTLrqZusX4FT3VdF8TdlPMYva4Dhf9HFPOrvL+fN7ZC2konlKbB/pGd0M
         jiv1//9wjb7u1nrkZYFmVDBhP+9Srdym8bBs6MYbCVULd/ErOrYhGGfvbSfXGkPm3Ova
         z9/QjW/2ley/HOM85ld9s3gIUlP4vpYuQAXFY7gYwrkh5369Cjg+L1aShn0JAsgDu+xf
         HHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703088038; x=1703692838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpURfIIPcWjXkfktChCkrPfs/5M7Hj157zHrpDPFlwA=;
        b=WnZnKFkOxg36ah21GN8jVK4cIqCjDXpma/oCR5LOVQjnnBRHz7mv3VmhsM2i7JAJmD
         O4kkBWtIx3Nr+ILiyodq3qsemWiVNSsIn4jjXza/2HgpcSE0yJVmVyMnbNhNg1jatu5W
         PaJ8ZB29ZYViTx+mTiz8dY+DfYb74Tif7MkgLpmg4ARc96yW50DURvn59PHr6XAxWNO2
         BgZQbKwN27MnLW+rlhYscqxbZzUmGrjq2tAplPu98MTOvCgZphRwkxtGsk606H7sXiEX
         +yTjgGQB9aXSn2vj9PjmM+HtM3gAkGucvNFyhNGIsekGNVbUgQZmzhFZ1dtrxmtzfrFY
         QoYA==
X-Gm-Message-State: AOJu0YwgZxQbnaMSo4/DI/3wzETLKdmCbILKPup/h7z4nH9buqoXkCUo
	HbuLXsroQnAJDY0oRe9LmL3olQ==
X-Google-Smtp-Source: AGHT+IGL7oUGx3f83Bo5k9llp34bKGp7jr5O5YoDBmVfFbYVE8j7jG1k5cMM6Pj230qSoSaurUzjsg==
X-Received: by 2002:a05:600c:1688:b0:40c:1db4:3a53 with SMTP id k8-20020a05600c168800b0040c1db43a53mr10192900wmn.157.1703088038040;
        Wed, 20 Dec 2023 08:00:38 -0800 (PST)
Received: from localhost (cst-prg-16-115.cust.vodafone.cz. [46.135.16.115])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c459400b0040c3dcc36e6sm54372wmo.47.2023.12.20.08.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 08:00:37 -0800 (PST)
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
Subject: [PATCH v4 08/13] RISC-V: KVM: Add support for SBI STA registers
Date: Wed, 20 Dec 2023 17:00:21 +0100
Message-ID: <20231220160012.40184-23-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220160012.40184-15-ajones@ventanamicro.com>
References: <20231220160012.40184-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_080039_553071_99C7AF57 
X-CRM114-Status: GOOD (  19.54  )
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

KVM userspace needs to be able to save and restore the steal-time
shared memory address. Provide the address through the get/set-one-reg
interface with two ulong-sized SBI STA extension registers (lo and hi).
64-bit KVM userspace must not set the hi register to anything other
than zero and is allowed to completely neglect saving/restoring it.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  5 +++
 arch/riscv/include/uapi/asm/kvm.h     |  9 +++++
 arch/riscv/kvm/vcpu_onereg.c          | 37 +++++++++++-------
 arch/riscv/kvm/vcpu_sbi.c             |  5 +++
 arch/riscv/kvm/vcpu_sbi_sta.c         | 55 +++++++++++++++++++++++++++
 5 files changed, 97 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index dd60f73b5c36..b96705258cf9 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -70,6 +70,11 @@ bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
 int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
 
+int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long reg_num,
+				   unsigned long *reg_val);
+int kvm_riscv_vcpu_set_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long reg_num,
+				   unsigned long reg_val);
+
 #ifdef CONFIG_RISCV_SBI_V01
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
 #endif
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 3471b1e48d18..d6b7a5b95874 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -161,6 +161,12 @@ enum KVM_RISCV_SBI_EXT_ID {
 	KVM_RISCV_SBI_EXT_MAX,
 };
 
+/* SBI STA extension registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_sbi_sta {
+	unsigned long shmem_lo;
+	unsigned long shmem_hi;
+};
+
 /* Possible states for kvm_riscv_timer */
 #define KVM_RISCV_TIMER_STATE_OFF	0
 #define KVM_RISCV_TIMER_STATE_ON	1
@@ -244,6 +250,9 @@ enum KVM_RISCV_SBI_EXT_ID {
 
 /* Registers for specific SBI extensions are mapped as type 10 */
 #define KVM_REG_RISCV_SBI_STATE		(0x0a << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_SBI_STA		(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_SBI_STA_REG(name)		\
+		(offsetof(struct kvm_riscv_sbi_sta, name) / sizeof(unsigned long))
 
 /* Device Control API: RISC-V AIA */
 #define KVM_DEV_RISCV_APLIC_ALIGN		0x1000
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index c7f82a3b8fba..c95ea55c29a7 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -961,27 +961,36 @@ static unsigned long num_sbi_ext_regs(struct kvm_vcpu *vcpu)
 	return copy_sbi_ext_reg_indices(vcpu, NULL);
 }
 
-static inline unsigned long num_sbi_regs(struct kvm_vcpu *vcpu)
-{
-	return 0;
-}
-
 static int copy_sbi_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
 {
-	int n = num_sbi_regs(vcpu);
+	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+	int total = 0;
 
-	for (int i = 0; i < n; i++) {
-		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 |
-			  KVM_REG_RISCV_SBI_STATE | i;
+	if (scontext->ext_status[KVM_RISCV_SBI_EXT_STA] == KVM_RISCV_SBI_EXT_STATUS_ENABLED) {
+		u64 size = IS_ENABLED(CONFIG_32BIT) ? KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
+		int n = sizeof(struct kvm_riscv_sbi_sta) / sizeof(unsigned long);
 
-		if (uindices) {
-			if (put_user(reg, uindices))
-				return -EFAULT;
-			uindices++;
+		for (int i = 0; i < n; i++) {
+			u64 reg = KVM_REG_RISCV | size |
+				  KVM_REG_RISCV_SBI_STATE |
+				  KVM_REG_RISCV_SBI_STA | i;
+
+			if (uindices) {
+				if (put_user(reg, uindices))
+					return -EFAULT;
+				uindices++;
+			}
 		}
+
+		total += n;
 	}
 
-	return n;
+	return total;
+}
+
+static inline unsigned long num_sbi_regs(struct kvm_vcpu *vcpu)
+{
+	return copy_sbi_reg_indices(vcpu, NULL);
 }
 
 static inline unsigned long num_vector_regs(const struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index a1997c39dfde..72a2ffb8dcd1 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -345,6 +345,8 @@ int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu,
 	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
 
 	switch (reg_subtype) {
+	case KVM_REG_RISCV_SBI_STA:
+		return kvm_riscv_vcpu_set_reg_sbi_sta(vcpu, reg_num, reg_val);
 	default:
 		return -EINVAL;
 	}
@@ -370,6 +372,9 @@ int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu,
 	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
 
 	switch (reg_subtype) {
+	case KVM_REG_RISCV_SBI_STA:
+		ret = kvm_riscv_vcpu_get_reg_sbi_sta(vcpu, reg_num, &reg_val);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index 6592d287fc4e..87bf1a5f05ce 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2023 Ventana Micro Systems Inc.
  */
 
+#include <linux/kconfig.h>
+#include <linux/kernel.h>
 #include <linux/kvm_host.h>
 
 #include <asm/kvm_vcpu_sbi.h>
@@ -59,3 +61,56 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta = {
 	.handler = kvm_sbi_ext_sta_handler,
 	.probe = kvm_sbi_ext_sta_probe,
 };
+
+int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu,
+				   unsigned long reg_num,
+				   unsigned long *reg_val)
+{
+	switch (reg_num) {
+	case KVM_REG_RISCV_SBI_STA_REG(shmem_lo):
+		*reg_val = (unsigned long)vcpu->arch.sta.shmem;
+		break;
+	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
+		if (IS_ENABLED(CONFIG_32BIT))
+			*reg_val = upper_32_bits(vcpu->arch.sta.shmem);
+		else
+			*reg_val = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int kvm_riscv_vcpu_set_reg_sbi_sta(struct kvm_vcpu *vcpu,
+				   unsigned long reg_num,
+				   unsigned long reg_val)
+{
+	switch (reg_num) {
+	case KVM_REG_RISCV_SBI_STA_REG(shmem_lo):
+		if (IS_ENABLED(CONFIG_32BIT)) {
+			gpa_t hi = upper_32_bits(vcpu->arch.sta.shmem);
+
+			vcpu->arch.sta.shmem = reg_val;
+			vcpu->arch.sta.shmem |= hi << 32;
+		} else {
+			vcpu->arch.sta.shmem = reg_val;
+		}
+		break;
+	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
+		if (IS_ENABLED(CONFIG_32BIT)) {
+			gpa_t lo = lower_32_bits(vcpu->arch.sta.shmem);
+
+			vcpu->arch.sta.shmem = ((gpa_t)reg_val << 32);
+			vcpu->arch.sta.shmem |= lo;
+		} else if (reg_val != 0) {
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
