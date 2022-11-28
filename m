Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52541C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 16:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=huQWWlkTETCeDB6AHtG1WNuInAZtx+uG/eCChx7wxic=; b=txLft3MVXSB89g
	TW7n1EDbdsmS/JQDs0KxuubFRSqoaREhkH5yrN4fhN0gkCbuHD/3aOBSQOzD5rQvWgu4loObtoeW8
	5aTjMffJdbJrdgls/yYabcMZBm128PgpDvEZrxOLmZfr1Azh446/9EbJXoLOs9HOpDQBh5GW3iwhd
	ptAnXN3Sg5D5ovD2ZSK68b1VdotTdUBGif02Ahnn1vc5OQMtuS/M7kwN5HfdJJZSulhdreOZ7DlHZ
	ufblF8izF8sqrjNXIaoJRXsItgfCKyS7tns8pQzjotBdgy6tuV2RVCiKkaF9eV7g8uSpTKERNWAqq
	BcWCP8k0SYUjHnDRnjXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgmq-002jQq-JY; Mon, 28 Nov 2022 16:15:16 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgmm-002iyr-Lq
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 16:15:14 +0000
Received: by mail-pf1-x434.google.com with SMTP id q12so6864899pfn.10
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 08:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEa4jrNjhDHgDWleCwUC9jP5Upr+bP5hcFJpr0dDzPM=;
        b=KgsVU6To3PhGBvxzeYihsHEsefYw1Lwjd7RBoWGjZ5b9AKi9T7e5SmxULH1uWbAU+2
         +DltX3HebEAGrFxKCEcSwEFwjpomIoLIGh1CSjQkmh5ZNXecnKXx6tRsQi9tchGzzZ/i
         NbfW0RaPpd31mHEbWLDkecx8UDb26Yfn+/6cKZy6YJEdoVtFYRDOAewiGJrVcIRnN/ep
         JoD+8vKD4rrEcG+EvaTPAwGc/0zLRxMQu9eay46TcU3w78rI2zTWTeKYCYhnhMhhQWmt
         wMVTA7XeviZd9UBeE30eynu1o16eE9q1BYugIW8EDSzAvKBRa8stRWulXtw0K36wfQy9
         ez7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEa4jrNjhDHgDWleCwUC9jP5Upr+bP5hcFJpr0dDzPM=;
        b=Qyz+tP7Ryh4DZSiDMbU7ogA9kTMLMehaBMKGQgbKeK3yJsuoZYsrOT9X97ZZLwWGa7
         9Zy7Wxia377H/QFV/LX9hTITjYjKbFLmnr8kWyDeUnvWlcSMWpsmjEWGU75fVe2sewMd
         O9BruoReTEaINCL7RPOW01eCQ2tF5JZ8NX+3jHZJBR5zMYG/+rpASylZNWIiYAiUkw49
         RtXOEZ7j/O4uiTdMiRzKohIKNoVkY90AMXMEctWMfTTh/ydkpS7Oz/Kib/fU3tE2L5Af
         exyqFn9uDKfsHbTQ7z3//F3SiwqGajdDwCKTydHcPlMx+tAAq3bGqCmdPX1ghIj/F4+q
         zVuw==
X-Gm-Message-State: ANoB5pkk/t6M72pMjDFTZMZ4Hj+wvTvybS35NmOAjveLxq4HJnOLE+Zf
	/fF5odWOenQBbocs3LxPL0iuKg==
X-Google-Smtp-Source: AA0mqf5hExk1Hb6swawuXXAbH77A7FCr/4ac/BnVwsge/pf/Z58s9ZzLfh0A5/6HsuGNgwKPyc0yVA==
X-Received: by 2002:aa7:8054:0:b0:56b:d951:67d2 with SMTP id y20-20020aa78054000000b0056bd95167d2mr54163707pfm.55.1669652112141;
        Mon, 28 Nov 2022 08:15:12 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.0])
        by smtp.gmail.com with ESMTPSA id k145-20020a628497000000b0056246403534sm8210805pfd.88.2022.11.28.08.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 08:15:11 -0800 (PST)
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
Subject: [PATCH 9/9] RISC-V: KVM: Add ONE_REG interface to enable/disable SBI extensions
Date: Mon, 28 Nov 2022 21:44:24 +0530
Message-Id: <20221128161424.608889-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128161424.608889-1-apatel@ventanamicro.com>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_081512_758641_E4711B2A 
X-CRM114-Status: GOOD (  21.14  )
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

We add ONE_REG interface to enable/disable SBI extensions (just
like the ONE_REG interface for ISA extensions). This allows KVM
user-space to decide the set of SBI extension enabled for a Guest
and by default all SBI extensions are enabled.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |   8 +-
 arch/riscv/include/uapi/asm/kvm.h     |  19 ++++
 arch/riscv/kvm/vcpu.c                 |   2 +
 arch/riscv/kvm/vcpu_sbi.c             | 145 +++++++++++++++++++++++---
 arch/riscv/kvm/vcpu_sbi_base.c        |   2 +-
 5 files changed, 158 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index f79478a85d2d..baa342dadf95 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -16,6 +16,7 @@
 
 struct kvm_vcpu_sbi_context {
 	int return_handled;
+	bool extension_disabled[KVM_RISCV_SBI_EXT_MAX];
 };
 
 struct kvm_vcpu_sbi_extension {
@@ -36,7 +37,12 @@ void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
 				     struct kvm_run *run,
 				     u32 type, u64 flags);
 int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
-const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid);
+int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
+				   const struct kvm_one_reg *reg);
+int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
+				   const struct kvm_one_reg *reg);
+const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
+				struct kvm_vcpu *vcpu, unsigned long extid);
 int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 
 #ifdef CONFIG_RISCV_SBI_V01
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 92af6f3f057c..71992ff1f9dd 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -108,6 +108,22 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
+/*
+ * SBI extension IDs specific to KVM. This is not the same as the SBI
+ * extension IDs defined by the RISC-V SBI specification.
+ */
+enum KVM_RISCV_SBI_EXT_ID {
+	KVM_RISCV_SBI_EXT_V01 = 0,
+	KVM_RISCV_SBI_EXT_TIME,
+	KVM_RISCV_SBI_EXT_IPI,
+	KVM_RISCV_SBI_EXT_RFENCE,
+	KVM_RISCV_SBI_EXT_SRST,
+	KVM_RISCV_SBI_EXT_HSM,
+	KVM_RISCV_SBI_EXT_EXPERIMENTAL,
+	KVM_RISCV_SBI_EXT_VENDOR,
+	KVM_RISCV_SBI_EXT_MAX,
+};
+
 /* Possible states for kvm_riscv_timer */
 #define KVM_RISCV_TIMER_STATE_OFF	0
 #define KVM_RISCV_TIMER_STATE_ON	1
@@ -152,6 +168,9 @@ enum KVM_RISCV_ISA_EXT_ID {
 /* ISA Extension registers are mapped as type 7 */
 #define KVM_REG_RISCV_ISA_EXT		(0x07 << KVM_REG_RISCV_TYPE_SHIFT)
 
+/* SBI extension registers are mapped as type 8 */
+#define KVM_REG_RISCV_SBI_EXT		(0x08 << KVM_REG_RISCV_TYPE_SHIFT)
+
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 7c08567097f0..2260adaf2de8 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -594,6 +594,8 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 						 KVM_REG_RISCV_FP_D);
 	case KVM_REG_RISCV_ISA_EXT:
 		return kvm_riscv_vcpu_set_reg_isa_ext(vcpu, reg);
+	case KVM_REG_RISCV_SBI_EXT:
+		return kvm_riscv_vcpu_set_reg_sbi_ext(vcpu, reg);
 	default:
 		break;
 	}
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index f96991d230bf..0abb44f8f4d1 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -40,16 +40,48 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
 };
 #endif
 
-static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
-	&vcpu_sbi_ext_v01,
-	&vcpu_sbi_ext_base,
-	&vcpu_sbi_ext_time,
-	&vcpu_sbi_ext_ipi,
-	&vcpu_sbi_ext_rfence,
-	&vcpu_sbi_ext_srst,
-	&vcpu_sbi_ext_hsm,
-	&vcpu_sbi_ext_experimental,
-	&vcpu_sbi_ext_vendor,
+struct kvm_riscv_sbi_extension_entry {
+	enum KVM_RISCV_SBI_EXT_ID dis_idx;
+	const struct kvm_vcpu_sbi_extension *ext_ptr;
+};
+
+static const struct kvm_riscv_sbi_extension_entry sbi_ext[] = {
+	{
+		.dis_idx = KVM_RISCV_SBI_EXT_V01,
+		.ext_ptr = &vcpu_sbi_ext_v01,
+	},
+	{
+		.dis_idx = KVM_RISCV_SBI_EXT_MAX, /* Can't be disabled */
+		.ext_ptr = &vcpu_sbi_ext_base,
+	},
+	{
+		.dis_idx = KVM_RISCV_SBI_EXT_TIME,
+		.ext_ptr = &vcpu_sbi_ext_time,
+	},
+	{
+		.dis_idx = KVM_RISCV_SBI_EXT_IPI,
+		.ext_ptr = &vcpu_sbi_ext_ipi,
+	},
+	{
+		.dis_idx = KVM_RISCV_SBI_EXT_RFENCE,
+		.ext_ptr = &vcpu_sbi_ext_rfence,
+	},
+	{
+		.dis_idx = KVM_RISCV_SBI_EXT_SRST,
+		.ext_ptr = &vcpu_sbi_ext_srst,
+	},
+	{
+		.dis_idx = KVM_RISCV_SBI_EXT_HSM,
+		.ext_ptr = &vcpu_sbi_ext_hsm,
+	},
+	{
+		.dis_idx = KVM_RISCV_SBI_EXT_EXPERIMENTAL,
+		.ext_ptr = &vcpu_sbi_ext_experimental,
+	},
+	{
+		.dis_idx = KVM_RISCV_SBI_EXT_VENDOR,
+		.ext_ptr = &vcpu_sbi_ext_vendor,
+	},
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
@@ -108,14 +140,95 @@ int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	return 0;
 }
 
-const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid)
+int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
+				   const struct kvm_one_reg *reg)
+{
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_SBI_EXT);
+	unsigned long i, reg_val;
+	const struct kvm_riscv_sbi_extension_entry *sext = NULL;
+	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+
+	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	if (reg_num >= KVM_RISCV_SBI_EXT_MAX ||
+	    (reg_val != 1 && reg_val != 0))
+		return -EINVAL;
+
+	if (vcpu->arch.ran_atleast_once)
+		return -EBUSY;
+
+	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
+		if (sbi_ext[i].dis_idx == reg_num) {
+			sext = &sbi_ext[i];
+			break;
+		}
+	}
+	if (!sext)
+		return -ENOENT;
+
+	scontext->extension_disabled[sext->dis_idx] = !reg_val;
+
+	return 0;
+}
+
+int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
+				   const struct kvm_one_reg *reg)
+{
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_SBI_EXT);
+	unsigned long i, reg_val;
+	const struct kvm_riscv_sbi_extension_entry *sext = NULL;
+	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+
+	if (reg_num >= KVM_RISCV_SBI_EXT_MAX)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
+		if (sbi_ext[i].dis_idx == reg_num) {
+			sext = &sbi_ext[i];
+			break;
+		}
+	}
+	if (!sext)
+		return -ENOENT;
+
+	reg_val = !scontext->extension_disabled[sext->dis_idx];
+	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	return 0;
+}
+
+const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
+				struct kvm_vcpu *vcpu, unsigned long extid)
 {
-	int i = 0;
+	int i;
+	const struct kvm_riscv_sbi_extension_entry *sext;
+	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
 
 	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
-		if (sbi_ext[i]->extid_start <= extid &&
-		    sbi_ext[i]->extid_end >= extid)
-			return sbi_ext[i];
+		sext = &sbi_ext[i];
+		if (sext->ext_ptr->extid_start <= extid &&
+		    sext->ext_ptr->extid_end >= extid) {
+			if (sext->dis_idx < KVM_RISCV_SBI_EXT_MAX &&
+			    scontext->extension_disabled[sext->dis_idx])
+				return NULL;
+			return sbi_ext[i].ext_ptr;
+		}
 	}
 
 	return NULL;
@@ -132,7 +245,7 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	unsigned long out_val = 0;
 	bool ext_is_v01 = false;
 
-	sbi_ext = kvm_vcpu_sbi_find_ext(cp->a7);
+	sbi_ext = kvm_vcpu_sbi_find_ext(vcpu, cp->a7);
 	if (sbi_ext && sbi_ext->handler) {
 #ifdef CONFIG_RISCV_SBI_V01
 		if (cp->a7 >= SBI_EXT_0_1_SET_TIMER &&
diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
index 5d65c634d301..a51ed0c615bf 100644
--- a/arch/riscv/kvm/vcpu_sbi_base.c
+++ b/arch/riscv/kvm/vcpu_sbi_base.c
@@ -44,7 +44,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			kvm_riscv_vcpu_sbi_forward(vcpu, run);
 			*exit = true;
 		} else
-			*out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
+			*out_val = kvm_vcpu_sbi_find_ext(vcpu, cp->a0) ? 1 : 0;
 		break;
 	case SBI_EXT_BASE_GET_MVENDORID:
 		*out_val = vcpu->arch.mvendorid;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
