Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A32CA0EE9
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Aug 2025 12:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oCajahW0zd6TnR4rn+1exbpDkRvb4k53X/60cNb9kQA=; b=yasi5VXEfNuOzk
	2L10C4Q0n1b/m9L7IJOI82wBaNJXUtMtakqeNt57p65JXvWp1nronydW8me5gq9TyIHL4MzkVw5Eb
	fnOn7Z3o/QRoq7awQnXjG0mb/b32mIBnFa16yIKNBQagdBC/9+No5abepUH1KgULjBC6DRsv5wLh/
	9BJkrJg3uLlTRPUV0gadpAO2eEp5HEVK0jbGeAqSvQP/+Jzsj0dzG9q5iSUOeJ867JbH1kXYWMxwM
	GuLs/ZvZvfe/v4Rs2bJZ3E3tym+vDUjouVMjmqBmoXgq+qsFgTsAlu7fx7j5049sfZ1xImdnvXAKm
	aMqFXltZ8IwwJHdPwbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncaQ-00000005fEX-18YN;
	Sun, 17 Aug 2025 12:34:10 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncaN-00000005fAg-03Rw
	for linux-riscv@lists.infradead.org;
	Sun, 17 Aug 2025 12:34:08 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-76e434a0118so1872529b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 05:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755434046; x=1756038846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1X6mHsVn0Xnkju9YueBNfmXGkOzlQDsEJD2zMFOchw0=;
        b=STCl4fWiWlpvzZXCO+bL4H/b35Ao0NIGQblXPrnun3Xt8Yd3iUEnZdQaXAJgjWf+4J
         EEHf4U9Dhvvzl5FcXNVFGtmnGPbcnsxsp2oA+qw060uHDqO1MB+h4kBorXmzmdP3O2UL
         JPLLFfBJjpokfm/kHG15gGoh2qM7tPj1s480EtXyoiLxi2wfVAes9jYMS6PTbzqUmZeS
         6NbhqjDDq16CqPKazCvkTjG22YI4yUPYlbJDW1jT4FLfTNmD0fBvqryKJPsGFUQcPZyY
         AlOISu04cNzJybPFOJyG2F9hNWJOdigKWxK27qwa0zrJFIT9vXDiJKuru9reepZu9WbS
         o0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755434046; x=1756038846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1X6mHsVn0Xnkju9YueBNfmXGkOzlQDsEJD2zMFOchw0=;
        b=qtpUp8/AwKxtltlyLsx8IHZOF/Io8Y+SihleBoc/IV1pLtBphIiA/n4xQMOUOZUlb5
         iB+d8kzXGs66PdBSdz1EPpPBOa1fCTR6WHQ8VgFwJtfLx0vWcJDRlizh1vVCmAFuWMgn
         wjHJ0U+RcmGf7xcwllNjTSBcQ0Vjkh1LV1/G3cB6E04eXQIaz8I/OggSdTD22WFmzMx9
         BvbyCu3VlkQKSODot9nUqIiAl79ove7+8AwXVQU7PtXfGs4GiCvkopB3aBhzmQbGOwGy
         IktvgJRBnF/gZUyMlTNDYPdB7vzDqQs+XhpLITaDv3zYt0ChrdGRXvg7hsXbxDYGH2j2
         +XQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXwhzZiWrvSDDvzv8ZrntFM8uitCeOMYNwdTiOgni2X8zdnvj1kc17gMalRYCy08CtrWIPlAEtvSTVbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRppM2XAvPUjZCQN2K6G7megPW97cWk7JAik5QpqvPcBwfGW0b
	g7/wUOIor6YmGoCZ7jr42ESuj8Tksd2nvCvluM903lqfKw1ycnDSY24DW4dvFQ2qukEOOY2PsbO
	IFssn
X-Gm-Gg: ASbGncuYmoNjuu8Izs77ObATafhUymgv1oqFm2JD3v6sHI/AteO9xxpL3vBGxOikaBQ
	eQN9Cy6LsuVRUKVl4R0HIu8/7s/qMlpwj+qzjMPBUaxCXUnUKLpZjOseexNoOhVqHcatmOVp7rf
	ukwN+ZzkOT/PuoRs3n7xwgnUdUScgrnPMSGrW7Kf9aIC/GLv1nJS4S5bphuu1JoFS/aXWgS+mYc
	FxdcWOPPcq2i4dOTADrlnG8lpSUy1Bc/rLCJgll+KuPmBGs8TkZASOlydLTu9keH56Wkq+NEVXl
	rIb+YkIIavC8+UdT0cOgG0mDKO0hTevpyt3oEWtzP7uVv277Q+Qvse0m/BZFCxLKIu2EjVIX3SS
	CviUwL2rtz5vFUeAAyIATNBaqMJcY9V+mayCLEMVC/KOhcVbxhM79ULM=
X-Google-Smtp-Source: AGHT+IEtC55e88m1o+TkYXc5HIsqgrGIksroTJA/ryQI57h4rVtpqXgcH5RlB6DdCPCfpIn1BlcsZQ==
X-Received: by 2002:a05:6a20:244b:b0:240:8d5:6271 with SMTP id adf61e73a8af0-240d2f28027mr11452970637.39.1755434046019;
        Sun, 17 Aug 2025 05:34:06 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3232b291449sm4480912a91.0.2025.08.17.05.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 05:34:05 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 5/6] RISC-V: KVM: Implement ONE_REG interface for SBI FWFT state
Date: Sun, 17 Aug 2025 18:03:23 +0530
Message-ID: <20250817123324.239423-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250817123324.239423-1-apatel@ventanamicro.com>
References: <20250817123324.239423-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_053407_063071_06A68067 
X-CRM114-Status: GOOD (  21.27  )
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

The KVM user-space needs a way to save/restore the state of
SBI FWFT features so implement SBI extension ONE_REG callbacks.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  14 +++
 arch/riscv/kvm/vcpu_sbi_fwft.c    | 168 +++++++++++++++++++++++++++---
 2 files changed, 170 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index a5ca0f4ce2d3..fc5624e89c7b 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -215,6 +215,17 @@ struct kvm_riscv_sbi_sta {
 	unsigned long shmem_hi;
 };
 
+struct kvm_riscv_sbi_fwft_feature {
+	unsigned long flags;
+	unsigned long value;
+};
+
+/* SBI FWFT extension registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_sbi_fwft {
+	struct kvm_riscv_sbi_fwft_feature misaligned_deleg;
+	struct kvm_riscv_sbi_fwft_feature pointer_masking;
+};
+
 /* Possible states for kvm_riscv_timer */
 #define KVM_RISCV_TIMER_STATE_OFF	0
 #define KVM_RISCV_TIMER_STATE_ON	1
@@ -298,6 +309,9 @@ struct kvm_riscv_sbi_sta {
 #define KVM_REG_RISCV_SBI_STA		(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_SBI_STA_REG(name)		\
 		(offsetof(struct kvm_riscv_sbi_sta, name) / sizeof(unsigned long))
+#define KVM_REG_RISCV_SBI_FWFT		(0x1 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_SBI_FWFT_REG(name)	\
+		(offsetof(struct kvm_riscv_sbi_fwft, name) / sizeof(unsigned long))
 
 /* Device Control API: RISC-V AIA */
 #define KVM_DEV_RISCV_APLIC_ALIGN		0x1000
diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 5a3bad0f9330..6499a669f9d0 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -22,6 +22,11 @@ struct kvm_sbi_fwft_feature {
 	 */
 	enum sbi_fwft_feature_t id;
 
+	/**
+	 * @flags_reg_num: ONE_REG index of the feature flag
+	 */
+	unsigned long flags_reg_num;
+
 	/**
 	 * @supported: Check if the feature is supported on the vcpu
 	 *
@@ -44,7 +49,8 @@ struct kvm_sbi_fwft_feature {
 	 *
 	 * This callback is mandatory
 	 */
-	long (*set)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf, unsigned long value);
+	long (*set)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf,
+		    bool one_reg_access, unsigned long value);
 
 	/**
 	 * @get: Get the feature current value
@@ -53,7 +59,8 @@ struct kvm_sbi_fwft_feature {
 	 *
 	 * This callback is mandatory
 	 */
-	long (*get)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf, unsigned long *value);
+	long (*get)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf,
+		    bool one_reg_access, unsigned long *value);
 };
 
 static const enum sbi_fwft_feature_t kvm_fwft_defined_features[] = {
@@ -91,16 +98,18 @@ static void kvm_sbi_fwft_reset_misaligned_delegation(struct kvm_vcpu *vcpu)
 
 static long kvm_sbi_fwft_set_misaligned_delegation(struct kvm_vcpu *vcpu,
 					struct kvm_sbi_fwft_config *conf,
-					unsigned long value)
+					bool one_reg_access, unsigned long value)
 {
 	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
 	if (value == 1) {
 		cfg->hedeleg |= MIS_DELEG;
-		csr_set(CSR_HEDELEG, MIS_DELEG);
+		if (!one_reg_access)
+			csr_set(CSR_HEDELEG, MIS_DELEG);
 	} else if (value == 0) {
 		cfg->hedeleg &= ~MIS_DELEG;
-		csr_clear(CSR_HEDELEG, MIS_DELEG);
+		if (!one_reg_access)
+			csr_clear(CSR_HEDELEG, MIS_DELEG);
 	} else {
 		return SBI_ERR_INVALID_PARAM;
 	}
@@ -110,10 +119,11 @@ static long kvm_sbi_fwft_set_misaligned_delegation(struct kvm_vcpu *vcpu,
 
 static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
 					struct kvm_sbi_fwft_config *conf,
-					unsigned long *value)
+					bool one_reg_access, unsigned long *value)
 {
-	*value = (csr_read(CSR_HEDELEG) & MIS_DELEG) == MIS_DELEG;
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
+	*value = (cfg->hedeleg & MIS_DELEG) == MIS_DELEG;
 	return SBI_SUCCESS;
 }
 
@@ -145,7 +155,7 @@ static void kvm_sbi_fwft_reset_pointer_masking_pmlen(struct kvm_vcpu *vcpu)
 
 static long kvm_sbi_fwft_set_pointer_masking_pmlen(struct kvm_vcpu *vcpu,
 						   struct kvm_sbi_fwft_config *conf,
-						   unsigned long value)
+						   bool one_reg_access, unsigned long value)
 {
 	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
 	unsigned long pmm;
@@ -167,14 +177,15 @@ static long kvm_sbi_fwft_set_pointer_masking_pmlen(struct kvm_vcpu *vcpu,
 	 * update here so that VCPU see's pointer masking mode change
 	 * immediately.
 	 */
-	csr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
+	if (!one_reg_access)
+		csr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
 
 	return SBI_SUCCESS;
 }
 
 static long kvm_sbi_fwft_get_pointer_masking_pmlen(struct kvm_vcpu *vcpu,
 						   struct kvm_sbi_fwft_config *conf,
-						   unsigned long *value)
+						   bool one_reg_access, unsigned long *value)
 {
 	switch (vcpu->arch.cfg.henvcfg & ENVCFG_PMM) {
 	case ENVCFG_PMM_PMLEN_0:
@@ -198,6 +209,8 @@ static long kvm_sbi_fwft_get_pointer_masking_pmlen(struct kvm_vcpu *vcpu,
 static const struct kvm_sbi_fwft_feature features[] = {
 	{
 		.id = SBI_FWFT_MISALIGNED_EXC_DELEG,
+		.flags_reg_num = offsetof(struct kvm_riscv_sbi_fwft, misaligned_deleg.flags) /
+				 sizeof(unsigned long),
 		.supported = kvm_sbi_fwft_misaligned_delegation_supported,
 		.reset = kvm_sbi_fwft_reset_misaligned_delegation,
 		.set = kvm_sbi_fwft_set_misaligned_delegation,
@@ -206,6 +219,8 @@ static const struct kvm_sbi_fwft_feature features[] = {
 #ifndef CONFIG_32BIT
 	{
 		.id = SBI_FWFT_POINTER_MASKING_PMLEN,
+		.flags_reg_num = offsetof(struct kvm_riscv_sbi_fwft, pointer_masking.flags) /
+				 sizeof(unsigned long),
 		.supported = kvm_sbi_fwft_pointer_masking_pmlen_supported,
 		.reset = kvm_sbi_fwft_reset_pointer_masking_pmlen,
 		.set = kvm_sbi_fwft_set_pointer_masking_pmlen,
@@ -214,6 +229,21 @@ static const struct kvm_sbi_fwft_feature features[] = {
 #endif
 };
 
+static const struct kvm_sbi_fwft_feature *kvm_sbi_fwft_regnum_to_feature(unsigned long reg_num)
+{
+	const struct kvm_sbi_fwft_feature *feature;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(features); i++) {
+		feature = &features[i];
+		if (feature->flags_reg_num == reg_num ||
+		    (feature->flags_reg_num + 1) == reg_num)
+			return feature;
+	}
+
+	return NULL;
+}
+
 static struct kvm_sbi_fwft_config *
 kvm_sbi_fwft_get_config(struct kvm_vcpu *vcpu, enum sbi_fwft_feature_t feature)
 {
@@ -267,7 +297,7 @@ static int kvm_sbi_fwft_set(struct kvm_vcpu *vcpu, u32 feature,
 
 	conf->flags = flags;
 
-	return conf->feature->set(vcpu, conf, value);
+	return conf->feature->set(vcpu, conf, false, value);
 }
 
 static int kvm_sbi_fwft_get(struct kvm_vcpu *vcpu, unsigned long feature,
@@ -280,7 +310,7 @@ static int kvm_sbi_fwft_get(struct kvm_vcpu *vcpu, unsigned long feature,
 	if (ret)
 		return ret;
 
-	return conf->feature->get(vcpu, conf, value);
+	return conf->feature->get(vcpu, conf, false, value);
 }
 
 static int kvm_sbi_ext_fwft_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
@@ -354,6 +384,115 @@ static void kvm_sbi_ext_fwft_reset(struct kvm_vcpu *vcpu)
 	}
 }
 
+static unsigned long kvm_sbi_ext_fwft_get_reg_count(struct kvm_vcpu *vcpu)
+{
+	unsigned long max_reg_count = sizeof(struct kvm_riscv_sbi_fwft) / sizeof(unsigned long);
+	const struct kvm_sbi_fwft_feature *feature;
+	struct kvm_sbi_fwft_config *conf;
+	unsigned long reg, ret = 0;
+
+	for (reg = 0; reg < max_reg_count; reg++) {
+		feature = kvm_sbi_fwft_regnum_to_feature(reg);
+		if (!feature)
+			continue;
+
+		conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
+		if (!conf || !conf->supported)
+			continue;
+
+		ret++;
+	}
+
+	return ret;
+}
+
+static int kvm_sbi_ext_fwft_get_reg_id(struct kvm_vcpu *vcpu, int index, u64 *reg_id)
+{
+	int reg, max_reg_count = sizeof(struct kvm_riscv_sbi_fwft) / sizeof(unsigned long);
+	const struct kvm_sbi_fwft_feature *feature;
+	struct kvm_sbi_fwft_config *conf;
+	int idx = 0;
+
+	for (reg = 0; reg < max_reg_count; reg++) {
+		feature = kvm_sbi_fwft_regnum_to_feature(reg);
+		if (!feature)
+			continue;
+
+		conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
+		if (!conf || !conf->supported)
+			continue;
+
+		if (index == idx) {
+			*reg_id = KVM_REG_RISCV |
+				  (IS_ENABLED(CONFIG_32BIT) ?
+				   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64) |
+				  KVM_REG_RISCV_SBI_STATE |
+				  KVM_REG_RISCV_SBI_FWFT | reg;
+			return 0;
+		}
+
+		idx++;
+	}
+
+	return -ENOENT;
+}
+
+static int kvm_sbi_ext_fwft_get_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
+				    unsigned long reg_size, void *reg_val)
+{
+	const struct kvm_sbi_fwft_feature *feature;
+	struct kvm_sbi_fwft_config *conf;
+	unsigned long *value;
+	int ret = 0;
+
+	if (reg_size != sizeof(unsigned long))
+		return -EINVAL;
+	value = reg_val;
+
+	feature = kvm_sbi_fwft_regnum_to_feature(reg_num);
+	if (!feature)
+		return -ENOENT;
+
+	conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
+	if (!conf || !conf->supported)
+		return -ENOENT;
+
+	if (feature->flags_reg_num == reg_num)
+		*value = conf->flags;
+	else
+		ret = conf->feature->get(vcpu, conf, true, value);
+
+	return sbi_err_map_linux_errno(ret);
+}
+
+static int kvm_sbi_ext_fwft_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
+				    unsigned long reg_size, const void *reg_val)
+{
+	const struct kvm_sbi_fwft_feature *feature;
+	struct kvm_sbi_fwft_config *conf;
+	unsigned long value;
+	int ret = 0;
+
+	if (reg_size != sizeof(unsigned long))
+		return -EINVAL;
+	value = *(const unsigned long *)reg_val;
+
+	feature = kvm_sbi_fwft_regnum_to_feature(reg_num);
+	if (!feature)
+		return -ENOENT;
+
+	conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
+	if (!conf || !conf->supported)
+		return -ENOENT;
+
+	if (feature->flags_reg_num == reg_num)
+		conf->flags = value & SBI_FWFT_SET_FLAG_LOCK;
+	else
+		ret = conf->feature->set(vcpu, conf, true, value);
+
+	return sbi_err_map_linux_errno(ret);
+}
+
 const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft = {
 	.extid_start = SBI_EXT_FWFT,
 	.extid_end = SBI_EXT_FWFT,
@@ -361,4 +500,9 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft = {
 	.init = kvm_sbi_ext_fwft_init,
 	.deinit = kvm_sbi_ext_fwft_deinit,
 	.reset = kvm_sbi_ext_fwft_reset,
+	.state_reg_subtype = KVM_REG_RISCV_SBI_FWFT,
+	.get_state_reg_count = kvm_sbi_ext_fwft_get_reg_count,
+	.get_state_reg_id = kvm_sbi_ext_fwft_get_reg_id,
+	.get_state_reg = kvm_sbi_ext_fwft_get_reg,
+	.set_state_reg = kvm_sbi_ext_fwft_set_reg,
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
