Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7001C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 17:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3c0ggcE8v9uoJoyStsMGALfIfhjNyMmsNbRlnn9PUEk=; b=SLIf9O/yTWnl41
	+h5pbc/+tnZVmKs4sHrRYSZofuj6jQj/oB5uLTMttoXIyEDGv7eSRSYRtuag19OJ3RrPR2FlJDD0n
	CXL8kR/CfB7t+A8AkvLy5LHpixc5jcq/mheQ68PnsTjDtVfqhhItZm8t6ZQW3YWxLKpXMqLTu73WK
	jBYaxTgzJLGoV57x1xKPiOIajl+INxsfYQTYaX/UnMaM8rrPjUgYNGjrQat7s7E0ZgC8+X1/Noghm
	JZFf/+LXtVGKhNcHkDDL5gN26NkJgTNp8ivOWdt4syeDCDbjYyadMt9cctpSrJw7q+ysoPXbjJwLP
	gqTb0vW4jvZf3Fp06NXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSkJ-00FY4z-3D;
	Wed, 13 Dec 2023 17:10:08 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSkD-00FXzz-2z
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 17:10:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c38e292c8so29092715e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 09:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702487400; x=1703092200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yUUV1jdLY0Batut1BWgbepYtw40we8rUFUUPlZvZjc=;
        b=l8syD0lYwymV06iQeXeCLYT7HKromA1Otr+AbYq+UBkGtDE0PaSZLE/+uvJOfif8NR
         2Hy/XPv9DwSfctiq0I07Bps3YZ7kGrdvhkK2XTV99+L7iNw2teyXn55j2Upx8Z3EtW4o
         VSyIalB0+SAw7HCs1yhjkxar+Dm/Gl1WWQAm0hmVZDJpsYQjRnXxkfmmE3Pn2SorHuDa
         1M9GkJpFnBLx7ufvdc+YblHgM7B2EDTKSQBGHnxsCNzATRFzEGJmIIbT9bFTKpx3xpqN
         rGRAUVCo47yLjM65MjEzJH6wsEY1mXgbaQ+26E9OFOmQFbogWxBUNQBI93ZdjoDZ4k4I
         h3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702487400; x=1703092200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yUUV1jdLY0Batut1BWgbepYtw40we8rUFUUPlZvZjc=;
        b=O55MiQ1fdyngneMrGw8NOso9ZpoNeneqU18VmJCwcH+XEihbFQhmxoCN5Tpfyhg7SO
         VjnlDsHGtCX/ZTgyHf0B5Wi565w+0sDdJbhUGdUtNy8xIjlBN9Fe/JZ6R42aWIfaNYzl
         OkeHjSu7mdQh/sQVGtfuuJEeCbYP43e0t8VGiB3b4syCwJ3k0cTOwTGu1xlJTPyXRGyP
         Xr2C6KlTnGOCi335wRpG/jDkw83eHY1rLMUIkBvGh8KoAoDMHiDWEKdcFzpKrvAVd4r0
         TVBWM4Y85Cz4zRVm64bOR9JtQL0E7Phb0hTLPS57EJs5vRcGXQBrIffjb2b0xCrK4c5X
         wEVQ==
X-Gm-Message-State: AOJu0YxXhrl9nFfcmVy2+TL+ddrlSVBgiTHDTBpag3F6qquxevoleGhS
	OU0d9XQ2hrLSbpQdXfQvP6LWvw==
X-Google-Smtp-Source: AGHT+IFj4WIdA6G/YOm4WFPaXOhGJbtAdFeClB0dtaeTcnCX+xjEvIS8OEoAijtl9BqPm1c0zxoNIQ==
X-Received: by 2002:a1c:4c04:0:b0:40c:250a:8a4c with SMTP id z4-20020a1c4c04000000b0040c250a8a4cmr4375636wmf.114.1702487400615;
        Wed, 13 Dec 2023 09:10:00 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id bi11-20020a05600c3d8b00b0040c2963e5f3sm20995545wmb.38.2023.12.13.09.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 09:10:00 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	haibo1.xu@intel.com
Subject: [PATCH v2 6/6] RISC-V: KVM: selftests: Treat SBI ext regs like ISA ext regs
Date: Wed, 13 Dec 2023 18:09:58 +0100
Message-ID: <20231213170951.93453-14-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213170951.93453-8-ajones@ventanamicro.com>
References: <20231213170951.93453-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_091001_999403_BA019E5C 
X-CRM114-Status: GOOD (  17.84  )
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
index 4bcc597d34b9..b8da2e86bf9c 100644
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
@@ -53,6 +58,21 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIFENCEI:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIHPM:
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
@@ -75,12 +95,12 @@ bool check_reject_set(int err)
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
 
@@ -88,6 +108,7 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 {
 	unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
 	struct vcpu_reg_sublist *s;
+	uint64_t feature;
 	int rc;
 
 	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
@@ -103,15 +124,31 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
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
@@ -593,16 +630,6 @@ static __u64 base_regs[] = {
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
@@ -613,6 +640,17 @@ static __u64 base_skips_set[] = {
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
@@ -716,6 +754,9 @@ static __u64 fp_d_regs[] = {
 #define SUBLIST_BASE \
 	{"base", .regs = base_regs, .regs_n = ARRAY_SIZE(base_regs), \
 	 .skips_set = base_skips_set, .skips_set_n = ARRAY_SIZE(base_skips_set),}
+#define SUBLIST_SBI_BASE \
+	{"sbi-base", .feature_type = VCPU_FEATURE_SBI_EXT, .feature = KVM_RISCV_SBI_EXT_V01, \
+	 .regs = sbi_base_regs, .regs_n = ARRAY_SIZE(sbi_base_regs),}
 #define SUBLIST_ZICBOM \
 	{"zicbom", .feature = KVM_RISCV_ISA_EXT_ZICBOM, .regs = zicbom_regs, .regs_n = ARRAY_SIZE(zicbom_regs),}
 #define SUBLIST_ZICBOZ \
@@ -750,6 +791,26 @@ static struct vcpu_reg_list config_##ext = {			\
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
@@ -759,8 +820,21 @@ static struct vcpu_reg_list config_##ext = {			\
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
@@ -783,6 +857,9 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zihintpause, ZIHINTPAUSE);
 KVM_ISA_EXT_SIMPLE_CONFIG(zihpm, ZIHPM);
 
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
