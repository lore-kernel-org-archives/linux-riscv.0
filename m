Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C278EC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 19:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PrcYJ7dQqBjzng7ZLJ8GoZeznPbRFb6h/0cSAsxVGs4=; b=yiNbKzQkFotIAK
	TTSjPpkm7KkjRokER4gv8vg/dppEdHQfN8FIuonPShTfnMKQH+zdoq24cFH6ANWPupSEPnSf03AKm
	3sJEY97UX9/ekdMT5ku4EM127E7CPfSfBC66VkzldUQlswMaTHtMfHzsNm3dHnA6L+85OjNvphX/Y
	Wf6Hl5yWttcS2FZ+9H6cecSdGniTWv0I0608eK8eQFMFFpXwowcuXK7cOOO1ZWpOYVBlgGjsm0uMI
	oRQocQsA7nyPKyIab3MRR56IwB3rG0hFz+KTnged6FZ5eevrZgbMbbSgL8yjMQkRcuhi0b5T5JHUC
	SzacvQpL35D/TTqUu74g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8mPr-00Bh5y-0O;
	Thu, 30 Nov 2023 19:09:39 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8mPo-00Bh5P-05
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 19:09:37 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c9caf896b7so12498981fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 11:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701371373; x=1701976173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FM+TflH9URAGy6HxbinWPM4sDEMk+11imBXW/4djsN0=;
        b=ErFeIUlnxODcxEBWz5EeTp41L8WzBPaapPqAj4HmiU129eQ59cuNwjVrnlXVT93AnN
         52zU95YhewzBqYvkhVIkjfwhpWbNkb7YVtyF9aM3oPiUdjhcqnBm9mMNK53rCJrJsjK+
         b/9oHqY0rLK24pzx3klwjtJA2kfOvs8d0LCDq9u6clksgy9gDP3VPI7FCrSw8/wXAjft
         THLf1Yk5LQtVDP9k9f7qdyFINJGSMua8/kJPTENMjnG8UvTXMQzpkI2NaPCCyWN/3bDT
         yTcEBepNzdbZeRAhrq37o0i8prHwPcsClzrB5yLl+6EGVMsQvRfW3OqitAwj6CbE5ZI4
         5qFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701371373; x=1701976173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FM+TflH9URAGy6HxbinWPM4sDEMk+11imBXW/4djsN0=;
        b=bJTmRHMdBumLGfVqPRsMX/4OqwG2M4d6oVdzQC5Ocdgzp3iYDA4tp623ArcXcPa0ud
         qU8JlHWtChlv31eDFqxhF3/rnOFPrk+4dtqSF+KdZwZrQxMUpiqJm2yRu2p0VhiQUwWd
         xgGqUHt8yjOXfi/ct44GmqBXjOQCXY1M418ruxMrcmq4pZ2yMiU4x9w/hGbJkpmHRQ4C
         Jv+G4+QUYfm631nQbkFhHZ20r+mzmT/RI1c0vofIcJ2GYj+Q0gFp+JLlLkPfaTyeumv9
         r9DNU44zfB9O6hFcNGsLQNDgJEciqZ10AeylH+dC2lHqJ1hg2bbxAUTvbt5QYUNFgQ9E
         KxFQ==
X-Gm-Message-State: AOJu0Yx+6N08eoIIdFC3ixFRriOlN1XI2KIXOwJ6vZSBM40geVoVlVPt
	cQkcAFN2GzL1RCkXW0DI1Nk2zOzXpt7YjrSWq7c=
X-Google-Smtp-Source: AGHT+IHgecMV2yMa5UZLwcEQCskDoKFlHXfpUDZV/6Qtlumd1158/JsiW8YwXqejwGQbMR9LSLGMDw==
X-Received: by 2002:a05:6512:4025:b0:50b:d764:76c0 with SMTP id br37-20020a056512402500b0050bd76476c0mr24062lfb.79.1701369557240;
        Thu, 30 Nov 2023 10:39:17 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id jz22-20020a17090775f600b009fdcc65d720sm964489ejc.72.2023.11.30.10.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 10:39:16 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	haibo1.xu@intel.com
Subject: [PATCH 6/6] RISC-V: KVM: selftests: Treat SBI ext regs like ISA ext regs
Date: Thu, 30 Nov 2023 19:39:17 +0100
Message-ID: <20231130183916.55891-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130183537.55203-8-ajones@ventanamicro.com>
References: <20231130183537.55203-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_110936_069997_C2AF2491 
X-CRM114-Status: GOOD (  18.46  )
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

SBI extension registers may not be present and indeed when
running on a platform without sscofpmf the PMU SBI extension
is not. Move the SBI extension registers from the base set of
registers to the filter list. Individual configs should test
for any that may or may not be present separately. Since
the PMU extension may disappear and the DBCN extension is only
present in later kernels, separate them from the rest into
their own configs. The rest are lumped together into the same
config.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/include/kvm_util_base.h     |   1 +
 .../selftests/kvm/riscv/get-reg-list.c        | 105 +++++++++++++++---
 2 files changed, 92 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index a18db6a7b3cf..e112ee30867f 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -129,6 +129,7 @@ struct vcpu_reg_sublist {
 	const char *name;
 	long capability;
 	int feature;
+	int feature_type;
 	bool finalize;
 	__u64 *regs;
 	__u64 regs_n;
diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index c3aebde0708a..bd21991f5d99 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -12,6 +12,11 @@
 
 #define REG_MASK (KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK)
 
+enum {
+	VCPU_FEATURE_ISA_EXT = 0,
+	VCPU_FEATURE_SBI_EXT,
+};
+
 static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
 
 bool filter_reg(__u64 reg)
@@ -80,6 +85,21 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVKSED:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVKSH:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVKT:
+	/*
+	 * Like ISA_EXT registers, SBI_EXT registers are only visible when the
+	 * host supports them and disabling them does not affect the visibility
+	 * of the SBI_EXT register itself.
+	 */
+	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_V01:
+	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_TIME:
+	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_IPI:
+	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_RFENCE:
+	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_SRST:
+	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_HSM:
+	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_PMU:
+	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_DBCN:
+	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL:
+	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR:
 		return true;
 	/* AIA registers are always available when Ssaia can't be disabled */
 	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
@@ -102,12 +122,12 @@ bool check_reject_set(int err)
 	return err == EINVAL;
 }
 
-static inline bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
+static bool vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext_id)
 {
 	int ret;
 	unsigned long value;
 
-	ret = __vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(ext), &value);
+	ret = __vcpu_get_reg(vcpu, ext_id, &value);
 	return (ret) ? false : !!value;
 }
 
@@ -115,6 +135,7 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 {
 	unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
 	struct vcpu_reg_sublist *s;
+	uint64_t feature;
 	int rc;
 
 	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
@@ -130,15 +151,31 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 			isa_ext_cant_disable[i] = true;
 	}
 
+	for (int i = 0; i < KVM_RISCV_SBI_EXT_MAX; i++) {
+		rc = __vcpu_set_reg(vcpu, RISCV_SBI_EXT_REG(i), 0);
+		TEST_ASSERT(!rc || (rc == -1 && errno == ENOENT), "Unexpected error");
+	}
+
 	for_each_sublist(c, s) {
 		if (!s->feature)
 			continue;
 
+		switch (s->feature_type) {
+		case VCPU_FEATURE_ISA_EXT:
+			feature = RISCV_ISA_EXT_REG(s->feature);
+			break;
+		case VCPU_FEATURE_SBI_EXT:
+			feature = RISCV_SBI_EXT_REG(s->feature);
+			break;
+		default:
+			TEST_FAIL("Unknown feature type");
+		}
+
 		/* Try to enable the desired extension */
-		__vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(s->feature), 1);
+		__vcpu_set_reg(vcpu, feature, 1);
 
 		/* Double check whether the desired extension was enabled */
-		__TEST_REQUIRE(vcpu_has_ext(vcpu, s->feature),
+		__TEST_REQUIRE(vcpu_has_ext(vcpu, feature),
 			       "%s not available, skipping tests\n", s->name);
 	}
 }
@@ -645,16 +682,6 @@ static __u64 base_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(time),
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(compare),
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(state),
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_V01,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_TIME,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_IPI,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_RFENCE,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_SRST,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_HSM,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_PMU,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_DBCN,
 };
 
 /*
@@ -665,6 +692,17 @@ static __u64 base_skips_set[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(state),
 };
 
+static __u64 sbi_base_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_V01,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_TIME,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_IPI,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_RFENCE,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_SRST,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_HSM,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR,
+};
+
 static __u64 zicbom_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbom_block_size),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
@@ -768,6 +806,9 @@ static __u64 fp_d_regs[] = {
 #define SUBLIST_BASE \
 	{"base", .regs = base_regs, .regs_n = ARRAY_SIZE(base_regs), \
 	 .skips_set = base_skips_set, .skips_set_n = ARRAY_SIZE(base_skips_set),}
+#define SUBLIST_SBI_BASE \
+	{"sbi-base", .feature_type = VCPU_FEATURE_SBI_EXT, .feature = KVM_RISCV_SBI_EXT_V01, \
+	 .regs = sbi_base_regs, .regs_n = ARRAY_SIZE(sbi_base_regs),}
 #define SUBLIST_ZICBOM \
 	{"zicbom", .feature = KVM_RISCV_ISA_EXT_ZICBOM, .regs = zicbom_regs, .regs_n = ARRAY_SIZE(zicbom_regs),}
 #define SUBLIST_ZICBOZ \
@@ -802,6 +843,26 @@ static struct vcpu_reg_list config_##ext = {			\
 	},							\
 }								\
 
+#define KVM_SBI_EXT_SIMPLE_CONFIG(ext, extu)			\
+static __u64 regs_sbi_##ext[] = {				\
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG |			\
+	KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE |	\
+	KVM_RISCV_SBI_EXT_##extu,				\
+};								\
+static struct vcpu_reg_list config_sbi_##ext = {		\
+	.sublists = {						\
+		SUBLIST_BASE,					\
+		{						\
+			.name = "sbi-"#ext,			\
+			.feature_type = VCPU_FEATURE_SBI_EXT,	\
+			.feature = KVM_RISCV_SBI_EXT_##extu,	\
+			.regs = regs_sbi_##ext,			\
+			.regs_n = ARRAY_SIZE(regs_sbi_##ext),	\
+		},						\
+		{0},						\
+	},							\
+}								\
+
 #define KVM_ISA_EXT_SUBLIST_CONFIG(ext, extu)			\
 static struct vcpu_reg_list config_##ext = {			\
 	.sublists = {						\
@@ -811,8 +872,21 @@ static struct vcpu_reg_list config_##ext = {			\
 	},							\
 }								\
 
+#define KVM_SBI_EXT_SUBLIST_CONFIG(ext, extu)			\
+static struct vcpu_reg_list config_sbi_##ext = {		\
+	.sublists = {						\
+		SUBLIST_BASE,					\
+		SUBLIST_SBI_##extu,				\
+		{0},						\
+	},							\
+}								\
+
 /* Note: The below list is alphabetically sorted. */
 
+KVM_SBI_EXT_SUBLIST_CONFIG(base, BASE);
+KVM_SBI_EXT_SIMPLE_CONFIG(pmu, PMU);
+KVM_SBI_EXT_SIMPLE_CONFIG(dbcn, DBCN);
+
 KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
@@ -862,6 +936,9 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zvksh, ZVKSH);
 KVM_ISA_EXT_SIMPLE_CONFIG(zvkt, ZVKT);
 
 struct vcpu_reg_list *vcpu_configs[] = {
+	&config_sbi_base,
+	&config_sbi_pmu,
+	&config_sbi_dbcn,
 	&config_aia,
 	&config_fp_f,
 	&config_fp_d,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
