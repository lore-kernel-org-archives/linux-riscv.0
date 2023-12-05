Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFB6C10DCE
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 18:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wbybrquzxYcK9LNObF08aFpoxW4s7im+Xiim+fhO5Pg=; b=0YiFYE5ITWiHV+
	Kh3SIIpqTFfoGFQBTmKZmrUcN86QUOHiwKFjETA+NKGg8zizXl1/VeNOqFVPYYb+fgHkp2v6rk2Qo
	SdVLtTXTJFXo4HyWvR3vItdYg9ZQ2DIqW6rUzIFTl+ULg7pmurZIux4JI7A8ghJrGcqr7qAXLLbJK
	8oWLT9BsTAfTPAx4nFTUb04pIz6AXOOmDAYQW342tdiqyBrbjEU+Wfe77s/WI+T9jgdJJnIWCCYS0
	FaFTlbb5eTZ0ngOJPmZ3SKps4ZudvuQhQbOSM9B9XpuugTPGubdSKyGij2RjWx8DFwoYe4JyLzTN2
	2gezuILrJO3uysC4XpVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtk-0087GS-1F;
	Tue, 05 Dec 2023 18:11:56 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtY-0086vn-1A
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 18:11:48 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50be58a751cso4406859e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 10:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701799900; x=1702404700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54dOBArJKp7H863L0eXVfYXJABME55rgcZGQ9JXxtZ4=;
        b=JhaWi6sYtpnDCBEi56gwQScaT0Lqq+3mJwzRoCidywS8zsDTGlkyDJXzvdMoUhTDNU
         XHNSGXfsRrWrdMRiqLuvSJEdImFFDGRAKyZ6Lklbsda3NylUzmFwZ8KPOA76G9jCfotz
         Fc06DS2DYglS5jHpsokpmUl3s4CessWY0V6iyq3sPqCF6JipJ0xnXCzximdnKC33X19P
         /Ddgt8cTRrKeRUxXqDjD5pTlJz0MlYd4djWJMElQnQ5O+ZBS1M7+1wM5wrMhXi15NH0p
         bKbjbZIHSR8ggI+PaMtPd2qDn/ChRkev5AzzBqrMDiovTMTiuI6sUC7DmqUla0o9yXhM
         qIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701799900; x=1702404700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54dOBArJKp7H863L0eXVfYXJABME55rgcZGQ9JXxtZ4=;
        b=XiRJwCdg7SpBRiuzrCmUbsL1hvYC/ZQuo/9tInNjnfW6wk9I464nGvOgB82+7TGzOC
         b5T0dK5rqaLJK5wYzaA/bB5Zd0zNl3KDv3YDGC9mEF63WQUc1p1r8+E3EiPDdrM7HwzC
         pbSVcN6W87wiP5HKGP79U/+c3GoNZmXwbcPJf+rMbEu7MVjA8XtotGdYfNPXbuXrzk1Q
         FfP+LgUc2FORwssLEfKr0su8gyvXBioNx0W8ELHpwbkFTS764peom0O2mKFoTCUMjFqd
         Xq6NX2nZ/VNNA0PyVlUWSXHPrgwMySyETyF4UKi2qy9k3gfms4e5iz4DvZTHJo/55DnL
         lPuA==
X-Gm-Message-State: AOJu0YybCBWxuk5MHSCxOKO2F9K+DCnLnuz2c933DKuV1u8WN/zOMqid
	zYaeMHECkXRUKhGbivRLc8qTJg==
X-Google-Smtp-Source: AGHT+IHHKyw8JRV68p6zLrHDCyZCkEw1gGLFrxLBWRgDrQkOZF72iwT//KRa35ZFCGLmWq6Ptg8vvg==
X-Received: by 2002:a05:6512:104e:b0:50b:c9cb:305d with SMTP id c14-20020a056512104e00b0050bc9cb305dmr4842640lfb.35.1701799900380;
        Tue, 05 Dec 2023 10:11:40 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id h16-20020aa7de10000000b0054cc61f0412sm1407362edv.24.2023.12.05.10.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 10:11:39 -0800 (PST)
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
	guoren@kernel.org
Subject: [PATCH v1 14/14] RISC-V: KVM: selftests: Add get-reg-list test for STA registers
Date: Tue,  5 Dec 2023 19:11:34 +0100
Message-ID: <20231205181119.207204-30-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205181119.207204-16-ajones@ventanamicro.com>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_101144_472187_B22EDFE6 
X-CRM114-Status: GOOD (  10.29  )
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

Add SBI STA and its two registers to the get-reg-list test.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index bd21991f5d99..6fc849284573 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -98,6 +98,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_HSM:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_PMU:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_DBCN:
+	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_STA:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR:
 		return true;
@@ -515,6 +516,7 @@ static const char *sbi_ext_single_id_to_str(__u64 reg_off)
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_SRST),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_HSM),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_PMU),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_STA),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_EXPERIMENTAL),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_VENDOR),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_DBCN),
@@ -563,6 +565,32 @@ static const char *sbi_ext_id_to_str(const char *prefix, __u64 id)
 	return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, reg_off);
 }
 
+static const char *sbi_sta_id_to_str(__u64 reg_off)
+{
+	switch (reg_off) {
+	case 0: return "KVM_REG_RISCV_SBI_STA | KVM_REG_RISCV_SBI_STA_REG(shmem_lo)";
+	case 1: return "KVM_REG_RISCV_SBI_STA | KVM_REG_RISCV_SBI_STA_REG(shmem_hi)";
+	}
+	return strdup_printf("KVM_REG_RISCV_SBI_STA | %lld /* UNKNOWN */", reg_off);
+}
+
+static const char *sbi_id_to_str(const char *prefix, __u64 id)
+{
+	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_SBI);
+	__u64 reg_subtype = reg_off & KVM_REG_RISCV_SUBTYPE_MASK;
+
+	assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_SBI);
+
+	reg_off &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+
+	switch (reg_subtype) {
+	case KVM_REG_RISCV_SBI_STA:
+		return sbi_sta_id_to_str(reg_off);
+	}
+
+	return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, reg_off);
+}
+
 void print_reg(const char *prefix, __u64 id)
 {
 	const char *reg_size = NULL;
@@ -618,6 +646,10 @@ void print_reg(const char *prefix, __u64 id)
 		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_SBI_EXT | %s,\n",
 				reg_size, sbi_ext_id_to_str(prefix, id));
 		break;
+	case KVM_REG_RISCV_SBI:
+		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_SBI | %s,\n",
+				reg_size, sbi_id_to_str(prefix, id));
+		break;
 	default:
 		printf("\tKVM_REG_RISCV | %s | 0x%llx /* UNKNOWN */,",
 				reg_size, id & REG_MASK);
@@ -703,6 +735,12 @@ static __u64 sbi_base_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR,
 };
 
+static __u64 sbi_sta_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_STA,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI | KVM_REG_RISCV_SBI_STA | KVM_REG_RISCV_SBI_STA_REG(shmem_lo),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI | KVM_REG_RISCV_SBI_STA | KVM_REG_RISCV_SBI_STA_REG(shmem_hi),
+};
+
 static __u64 zicbom_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbom_block_size),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
@@ -809,6 +847,9 @@ static __u64 fp_d_regs[] = {
 #define SUBLIST_SBI_BASE \
 	{"sbi-base", .feature_type = VCPU_FEATURE_SBI_EXT, .feature = KVM_RISCV_SBI_EXT_V01, \
 	 .regs = sbi_base_regs, .regs_n = ARRAY_SIZE(sbi_base_regs),}
+#define SUBLIST_SBI_STA \
+	{"sbi-sta", .feature_type = VCPU_FEATURE_SBI_EXT, .feature = KVM_RISCV_SBI_EXT_STA, \
+	 .regs = sbi_sta_regs, .regs_n = ARRAY_SIZE(sbi_sta_regs),}
 #define SUBLIST_ZICBOM \
 	{"zicbom", .feature = KVM_RISCV_ISA_EXT_ZICBOM, .regs = zicbom_regs, .regs_n = ARRAY_SIZE(zicbom_regs),}
 #define SUBLIST_ZICBOZ \
@@ -884,6 +925,7 @@ static struct vcpu_reg_list config_sbi_##ext = {		\
 /* Note: The below list is alphabetically sorted. */
 
 KVM_SBI_EXT_SUBLIST_CONFIG(base, BASE);
+KVM_SBI_EXT_SUBLIST_CONFIG(sta, STA);
 KVM_SBI_EXT_SIMPLE_CONFIG(pmu, PMU);
 KVM_SBI_EXT_SIMPLE_CONFIG(dbcn, DBCN);
 
@@ -937,6 +979,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zvkt, ZVKT);
 
 struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_base,
+	&config_sbi_sta,
 	&config_sbi_pmu,
 	&config_sbi_dbcn,
 	&config_aia,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
