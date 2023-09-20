Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC72CE79DD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eG+Uuwi+sLaXJEKIFpsB/b3Gy4d7LNY2lLKFQJZzopg=; b=UNG8bMotxIl+rl
	zRxtnQmizj08c22jl1c3vcfFEX5TINzyl65i2svXtf0iV4vIT+usIpkDFK/UhN+zDrP3Kp9Mc+aFS
	wFarX1n3fPRZVUcx/Gj4sBELCGUoiwzwYsQnvoMQlL3nPOlAirIO9NFB5Ti6Fo9dJ33O49ndVSUdx
	mB/x828sHFZyxGXm94nkxOAbhIkmHgW05Am5zUYw6II0ZHdAoBZzJB0sLYR65Kyy6DADXLkA6CosI
	CPu3yf6PqsTcKrVEJmcHYEIBccyuvIqFvesa2HOyC7outCDTm+yy0fT/Us70bbXpwBtA3wY/UDO1l
	mZ5JJbkw0Rhd2chKJ5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiyM0-003Nvd-2g;
	Wed, 20 Sep 2023 14:39:00 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiyKQ-003MKM-2w
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 14:37:34 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-530ab2d9e89so6115534a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 07:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695220640; x=1695825440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EWfUganqtrkK8ax8sTyL5YMxYTdjqyyAygLZhG1RaN0=;
        b=NGHHSK69auOkg73ZJ8XJHgGX/eAmFPmcr/JVlfw+s+sQp6tgQkRx3tbM2XOP0dJdhs
         Mh0uj3c94q3BLtMenca8HQ0oac2ERz/1IAWc/SoI4LsN6KHV3nyg7f1C0dBnkukdu0Wt
         M8ELXSt7c1TR4x+uYnWgDVR25zXJCRjEJOzA0QEPCoumdWgy1dCBVSAwntX0xQj2Lr1G
         vhsNya6B9mHd6Fql91ghWKStR8GQJz1pQQZzuO2XDvDX2FwMySIjSkPYUmEUuLKGKD1F
         qLW57FLeb0uSxMv/ZGOm3a0LBGEGhE+uUa4jAxN+/FLg22NC1GxSQ2pjGWxBqqWsyuME
         I7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695220640; x=1695825440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWfUganqtrkK8ax8sTyL5YMxYTdjqyyAygLZhG1RaN0=;
        b=dcHrJ4OUn4f0gHgkvVgaQxhoMPWFTGjJ4Si6Mm4bQBQn9QO6oCtv7taBiL+GtkLTYK
         CWiHWn2GMQJnKROyzd5BcLjn0J68Zr32NeOzlJYvx3ekG2xIY0MdB17FBmNFD6JagqeU
         Mkr2XyXrULpT6X2velAYgRhKH5CJfxkERC8BVYBrcNU4Fjr7vOlQGDthSMX68h9bD0hI
         C+Onww/KbySCD7psvRD7i3FlaEpfyY1fPr+MVC0+qTnYYb6UvRF+vYOupcn/+IaF2siy
         WfXSbts9z475rI7WKiWeo3tEbwcI2/1t3h8NxFW5N9xqgzMfFuNkarrd3k+1ahdRQZyD
         I4cA==
X-Gm-Message-State: AOJu0YxGMXp9kNhHa8v50C5PfDztQOcvuMJsavrf2yzVkc/J3ZSfZOsA
	39HzfnTCp4Nj/FLPVYO9USDbgQ==
X-Google-Smtp-Source: AGHT+IFswGFmXajb396IAHhbBFdWaIY5cbIg21A658/UtEjEQGnfKM938RjownwLMHkXzZcYuIyq3Q==
X-Received: by 2002:a05:6402:1652:b0:522:1e24:afb6 with SMTP id s18-20020a056402165200b005221e24afb6mr2512930edx.0.1695220639957;
        Wed, 20 Sep 2023 07:37:19 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id s10-20020a056402036a00b00530c81ad54asm6234902edw.41.2023.09.20.07.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 07:37:19 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	haibo1.xu@intel.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [PATCH] KVM: riscv: selftests: get-reg-list print_reg should never fail
Date: Wed, 20 Sep 2023 16:37:14 +0200
Message-ID: <20230920143713.6896-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_073723_190692_8EF05BD4 
X-CRM114-Status: GOOD (  12.77  )
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

When outputting the "new" register list we want to print all of the
new registers, decoding as much as possible of each of them. Also, we
don't want to assert while listing registers with '--list'. We output
"/* UNKNOWN */" after each new register (which we were already doing
for some), which should be enough.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 93 +++++++++----------
 1 file changed, 42 insertions(+), 51 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 85907c86b835..054706538b9e 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -112,11 +112,13 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 	}
 }
 
-static const char *config_id_to_str(__u64 id)
+static const char *config_id_to_str(const char *prefix, __u64 id)
 {
 	/* reg_off is the offset into struct kvm_riscv_config */
 	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_CONFIG);
 
+	assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CONFIG);
+
 	switch (reg_off) {
 	case KVM_REG_RISCV_CONFIG_REG(isa):
 		return "KVM_REG_RISCV_CONFIG_REG(isa)";
@@ -134,11 +136,7 @@ static const char *config_id_to_str(__u64 id)
 		return "KVM_REG_RISCV_CONFIG_REG(satp_mode)";
 	}
 
-	/*
-	 * Config regs would grow regularly with new pseudo reg added, so
-	 * just show raw id to indicate a new pseudo config reg.
-	 */
-	return strdup_printf("KVM_REG_RISCV_CONFIG_REG(%lld) /* UNKNOWN */", reg_off);
+	return strdup_printf("%lld /* UNKNOWN */", reg_off);
 }
 
 static const char *core_id_to_str(const char *prefix, __u64 id)
@@ -146,6 +144,8 @@ static const char *core_id_to_str(const char *prefix, __u64 id)
 	/* reg_off is the offset into struct kvm_riscv_core */
 	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_CORE);
 
+	assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CORE);
+
 	switch (reg_off) {
 	case KVM_REG_RISCV_CORE_REG(regs.pc):
 		return "KVM_REG_RISCV_CORE_REG(regs.pc)";
@@ -176,8 +176,7 @@ static const char *core_id_to_str(const char *prefix, __u64 id)
 		return "KVM_REG_RISCV_CORE_REG(mode)";
 	}
 
-	TEST_FAIL("%s: Unknown core reg id: 0x%llx", prefix, id);
-	return NULL;
+	return strdup_printf("%lld /* UNKNOWN */", reg_off);
 }
 
 #define RISCV_CSR_GENERAL(csr) \
@@ -211,8 +210,7 @@ static const char *general_csr_id_to_str(__u64 reg_off)
 		return RISCV_CSR_GENERAL(scounteren);
 	}
 
-	TEST_FAIL("Unknown general csr reg: 0x%llx", reg_off);
-	return NULL;
+	return strdup_printf("KVM_REG_RISCV_CSR_GENERAL | %lld /* UNKNOWN */", reg_off);
 }
 
 static const char *aia_csr_id_to_str(__u64 reg_off)
@@ -235,8 +233,7 @@ static const char *aia_csr_id_to_str(__u64 reg_off)
 		return RISCV_CSR_AIA(iprio2h);
 	}
 
-	TEST_FAIL("Unknown aia csr reg: 0x%llx", reg_off);
-	return NULL;
+	return strdup_printf("KVM_REG_RISCV_CSR_AIA | %lld /* UNKNOWN */", reg_off);
 }
 
 static const char *csr_id_to_str(const char *prefix, __u64 id)
@@ -244,6 +241,8 @@ static const char *csr_id_to_str(const char *prefix, __u64 id)
 	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_CSR);
 	__u64 reg_subtype = reg_off & KVM_REG_RISCV_SUBTYPE_MASK;
 
+	assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CSR);
+
 	reg_off &= ~KVM_REG_RISCV_SUBTYPE_MASK;
 
 	switch (reg_subtype) {
@@ -253,8 +252,7 @@ static const char *csr_id_to_str(const char *prefix, __u64 id)
 		return aia_csr_id_to_str(reg_off);
 	}
 
-	TEST_FAIL("%s: Unknown csr subtype: 0x%llx", prefix, reg_subtype);
-	return NULL;
+	return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, reg_off);
 }
 
 static const char *timer_id_to_str(const char *prefix, __u64 id)
@@ -262,6 +260,8 @@ static const char *timer_id_to_str(const char *prefix, __u64 id)
 	/* reg_off is the offset into struct kvm_riscv_timer */
 	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_TIMER);
 
+	assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_TIMER);
+
 	switch (reg_off) {
 	case KVM_REG_RISCV_TIMER_REG(frequency):
 		return "KVM_REG_RISCV_TIMER_REG(frequency)";
@@ -273,8 +273,7 @@ static const char *timer_id_to_str(const char *prefix, __u64 id)
 		return "KVM_REG_RISCV_TIMER_REG(state)";
 	}
 
-	TEST_FAIL("%s: Unknown timer reg id: 0x%llx", prefix, id);
-	return NULL;
+	return strdup_printf("%lld /* UNKNOWN */", reg_off);
 }
 
 static const char *fp_f_id_to_str(const char *prefix, __u64 id)
@@ -282,6 +281,8 @@ static const char *fp_f_id_to_str(const char *prefix, __u64 id)
 	/* reg_off is the offset into struct __riscv_f_ext_state */
 	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_FP_F);
 
+	assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_F);
+
 	switch (reg_off) {
 	case KVM_REG_RISCV_FP_F_REG(f[0]) ...
 	     KVM_REG_RISCV_FP_F_REG(f[31]):
@@ -290,8 +291,7 @@ static const char *fp_f_id_to_str(const char *prefix, __u64 id)
 		return "KVM_REG_RISCV_FP_F_REG(fcsr)";
 	}
 
-	TEST_FAIL("%s: Unknown fp_f reg id: 0x%llx", prefix, id);
-	return NULL;
+	return strdup_printf("%lld /* UNKNOWN */", reg_off);
 }
 
 static const char *fp_d_id_to_str(const char *prefix, __u64 id)
@@ -299,6 +299,8 @@ static const char *fp_d_id_to_str(const char *prefix, __u64 id)
 	/* reg_off is the offset into struct __riscv_d_ext_state */
 	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_FP_D);
 
+	assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D);
+
 	switch (reg_off) {
 	case KVM_REG_RISCV_FP_D_REG(f[0]) ...
 	     KVM_REG_RISCV_FP_D_REG(f[31]):
@@ -307,15 +309,16 @@ static const char *fp_d_id_to_str(const char *prefix, __u64 id)
 		return "KVM_REG_RISCV_FP_D_REG(fcsr)";
 	}
 
-	TEST_FAIL("%s: Unknown fp_d reg id: 0x%llx", prefix, id);
-	return NULL;
+	return strdup_printf("%lld /* UNKNOWN */", reg_off);
 }
 
-static const char *isa_ext_id_to_str(__u64 id)
+static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
 {
 	/* reg_off is the offset into unsigned long kvm_isa_ext_arr[] */
 	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_ISA_EXT);
 
+	assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT);
+
 	static const char * const kvm_isa_ext_reg_name[] = {
 		"KVM_RISCV_ISA_EXT_A",
 		"KVM_RISCV_ISA_EXT_C",
@@ -342,13 +345,8 @@ static const char *isa_ext_id_to_str(__u64 id)
 		"KVM_RISCV_ISA_EXT_ZIHPM",
 	};
 
-	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name)) {
-		/*
-		 * isa_ext regs would grow regularly with new isa extension added, so
-		 * just show "reg" to indicate a new extension.
-		 */
+	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name))
 		return strdup_printf("%lld /* UNKNOWN */", reg_off);
-	}
 
 	return kvm_isa_ext_reg_name[reg_off];
 }
@@ -368,35 +366,27 @@ static const char *sbi_ext_single_id_to_str(__u64 reg_off)
 		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR",
 	};
 
-	if (reg_off >= ARRAY_SIZE(kvm_sbi_ext_reg_name)) {
-		/*
-		 * sbi_ext regs would grow regularly with new sbi extension added, so
-		 * just show "reg" to indicate a new extension.
-		 */
+	if (reg_off >= ARRAY_SIZE(kvm_sbi_ext_reg_name))
 		return strdup_printf("KVM_REG_RISCV_SBI_SINGLE | %lld /* UNKNOWN */", reg_off);
-	}
 
 	return kvm_sbi_ext_reg_name[reg_off];
 }
 
 static const char *sbi_ext_multi_id_to_str(__u64 reg_subtype, __u64 reg_off)
 {
-	if (reg_off > KVM_REG_RISCV_SBI_MULTI_REG_LAST) {
-		/*
-		 * sbi_ext regs would grow regularly with new sbi extension added, so
-		 * just show "reg" to indicate a new extension.
-		 */
-		return strdup_printf("%lld /* UNKNOWN */", reg_off);
-	}
+	const char *unknown = "";
+
+	if (reg_off > KVM_REG_RISCV_SBI_MULTI_REG_LAST)
+		unknown = " /* UNKNOWN */";
 
 	switch (reg_subtype) {
 	case KVM_REG_RISCV_SBI_MULTI_EN:
-		return strdup_printf("KVM_REG_RISCV_SBI_MULTI_EN | %lld", reg_off);
+		return strdup_printf("KVM_REG_RISCV_SBI_MULTI_EN | %lld%s", reg_off, unknown);
 	case KVM_REG_RISCV_SBI_MULTI_DIS:
-		return strdup_printf("KVM_REG_RISCV_SBI_MULTI_DIS | %lld", reg_off);
+		return strdup_printf("KVM_REG_RISCV_SBI_MULTI_DIS | %lld%s", reg_off, unknown);
 	}
 
-	return NULL;
+	return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, reg_off);
 }
 
 static const char *sbi_ext_id_to_str(const char *prefix, __u64 id)
@@ -404,6 +394,8 @@ static const char *sbi_ext_id_to_str(const char *prefix, __u64 id)
 	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_SBI_EXT);
 	__u64 reg_subtype = reg_off & KVM_REG_RISCV_SUBTYPE_MASK;
 
+	assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_SBI_EXT);
+
 	reg_off &= ~KVM_REG_RISCV_SUBTYPE_MASK;
 
 	switch (reg_subtype) {
@@ -414,8 +406,7 @@ static const char *sbi_ext_id_to_str(const char *prefix, __u64 id)
 		return sbi_ext_multi_id_to_str(reg_subtype, reg_off);
 	}
 
-	TEST_FAIL("%s: Unknown sbi ext subtype: 0x%llx", prefix, reg_subtype);
-	return NULL;
+	return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, reg_off);
 }
 
 void print_reg(const char *prefix, __u64 id)
@@ -436,14 +427,14 @@ void print_reg(const char *prefix, __u64 id)
 		reg_size = "KVM_REG_SIZE_U128";
 		break;
 	default:
-		TEST_FAIL("%s: Unexpected reg size: 0x%llx in reg id: 0x%llx",
-			  prefix, (id & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT, id);
+		printf("\tKVM_REG_RISCV | (%lld << KVM_REG_SIZE_SHIFT) | 0x%llx /* UNKNOWN */,",
+		       (id & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT, id & REG_MASK);
 	}
 
 	switch (id & KVM_REG_RISCV_TYPE_MASK) {
 	case KVM_REG_RISCV_CONFIG:
 		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_CONFIG | %s,\n",
-				reg_size, config_id_to_str(id));
+				reg_size, config_id_to_str(prefix, id));
 		break;
 	case KVM_REG_RISCV_CORE:
 		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_CORE | %s,\n",
@@ -467,15 +458,15 @@ void print_reg(const char *prefix, __u64 id)
 		break;
 	case KVM_REG_RISCV_ISA_EXT:
 		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_ISA_EXT | %s,\n",
-				reg_size, isa_ext_id_to_str(id));
+				reg_size, isa_ext_id_to_str(prefix, id));
 		break;
 	case KVM_REG_RISCV_SBI_EXT:
 		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_SBI_EXT | %s,\n",
 				reg_size, sbi_ext_id_to_str(prefix, id));
 		break;
 	default:
-		TEST_FAIL("%s: Unexpected reg type: 0x%llx in reg id: 0x%llx", prefix,
-				(id & KVM_REG_RISCV_TYPE_MASK) >> KVM_REG_RISCV_TYPE_SHIFT, id);
+		printf("\tKVM_REG_RISCV | %s | 0x%llx /* UNKNOWN */,",
+				reg_size, id & REG_MASK);
 	}
 }
 
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
