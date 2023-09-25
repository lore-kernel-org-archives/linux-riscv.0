Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98933CE7A94
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 13:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u3YE5uLDWCEHnULrJIV2S61Lyll10Ny4W2v/bNXng0k=; b=iUgon9+uMW5Gu1
	Nvwfb8x35trVgWIrQhpzzFflTm7zW5PeXll70ANK8YM2fipTKR4URuEVImy+vlQK7ERZy26cdLfDa
	EOpbxk+UBgfeNM/KZ9gndps3KvPVDxdJgAsdDMc9+Y6z/4CBjKr+EvCJ7jZHqSgphKAQzojBEfSus
	vloM/9g+I+jqPcNcoUI/KgYsBDdddcwhEOJmBMUuoc6upegD0YMTlh361hiqvzs2sWiqKXQbAVBti
	cKF1eiIr4kF8x8saF5gCknS+Sm8fKJBDvpUrENZ0xjyhEpCB3kJ4PdOY6EwZnA7GTlVRzV9EqdkEr
	dzutKnUPYgbIszEXBdXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qklop-00EMbh-0c;
	Mon, 25 Sep 2023 13:40:11 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qklok-00EMXW-37
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 13:40:09 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c1ff5b741cso58118765ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 06:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695649206; x=1696254006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNHkjMM9HHYX8X83JcKOMwoHgKf/W4d95vsynq44CKo=;
        b=j7+8IdDZmujAEWIY6QfirewaIl+yHMUeW58v350NGTP/meUGWCU344ZWz0jSxhzwXl
         g+X26h/2FO8RdwdlR9p5Z6Hc53tpHC+G2Cr1ryPBBta4maEQH+EQ+IOsjhAGsOa9cPLN
         KdERw76fMWraZyqUJBmWIYFBCZ0Gqg5mz2+yV20hIyMkjzXKxRS4tpBTIeOP9z5OBw5G
         r2nsA6nt7pTFQ1+1cPfJWDMHxS/nbJVsRdjhxIPPv9MdbxVSIXtW5JdkZzohmCrELSG9
         NQvcCHZs0eO6NZoqelh2g2czHA0AYDhcQ/zv9OmpvmbdXmhR7Y3qpPatCDD5U/8M9F2s
         lfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695649206; x=1696254006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNHkjMM9HHYX8X83JcKOMwoHgKf/W4d95vsynq44CKo=;
        b=JJwPSgk3w8squtuuXqMJcBsUbj5U3RJfy2oK8zCz1BQtt6ZOR3vBnCyQXANBzO/rOa
         BsRN8QtVPE0qLS1XaRGbF4rOh6BxHZirowoBnufesVlAwCSsPCk/ed9KPjHcdGeTk5AZ
         +n8iwH3Y6wTWEVJfYh94XB4kAFe0lFKZfWnlHC+bViHYYWoOSF8FhJU2CxzSThBK8m5x
         u7afoggZXNP3stvxE/WBTT0ZRo1Dtcju9L3lndoPidsI8lbQyGusIhfW7cqIOTba/jaq
         p9wboLHBM0AKYAc9t7OhZW99uh63H+2YZrdlFHgldHLEM+XzBQjJxwyeGKidF4k7Ckmv
         tT0w==
X-Gm-Message-State: AOJu0YxPJkvO3+KA1rZrZmBuyyk3sNmEaPHIER68elDRGWXhbI9KL1py
	SlVCClYDd/5TEcx4plOoFYxwoQ==
X-Google-Smtp-Source: AGHT+IGU21ACNUey6DzMiWsfg977IabscEjcD4GfNCnNUexJxmWmu1U36ws4l5wFoYxptLxUg/E8xA==
X-Received: by 2002:a17:902:d50e:b0:1c5:74db:dc8b with SMTP id b14-20020a170902d50e00b001c574dbdc8bmr8353875plg.58.1695649206310;
        Mon, 25 Sep 2023 06:40:06 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id p11-20020a170902eacb00b001c625d6ffccsm969433pld.129.2023.09.25.06.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 06:40:05 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 8/9] KVM: riscv: selftests: Add smstateen registers to get-reg-list test
Date: Mon, 25 Sep 2023 19:08:58 +0530
Message-Id: <20230925133859.1735879-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925133859.1735879-1-apatel@ventanamicro.com>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_064007_004663_392418C6 
X-CRM114-Status: GOOD (  11.97  )
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

We have a new smstateen registers as separate sub-type of CSR ONE_REG
interface so let us add these registers to get-reg-list test.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 6cec0ef75cc7..625118d53b74 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -36,6 +36,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_I:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_M:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_V:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SMSTATEEN:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSAIA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVINVAL:
@@ -186,6 +187,8 @@ static const char *core_id_to_str(const char *prefix, __u64 id)
 	"KVM_REG_RISCV_CSR_GENERAL | KVM_REG_RISCV_CSR_REG(" #csr ")"
 #define RISCV_CSR_AIA(csr) \
 	"KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_REG(" #csr ")"
+#define RISCV_CSR_SMSTATEEN(csr) \
+	"KVM_REG_RISCV_CSR_SMSTATEEN | KVM_REG_RISCV_CSR_REG(" #csr ")"
 
 static const char *general_csr_id_to_str(__u64 reg_off)
 {
@@ -243,6 +246,18 @@ static const char *aia_csr_id_to_str(__u64 reg_off)
 	return NULL;
 }
 
+static const char *smstateen_csr_id_to_str(__u64 reg_off)
+{
+	/* reg_off is the offset into struct kvm_riscv_smstateen_csr */
+	switch (reg_off) {
+	case KVM_REG_RISCV_CSR_SMSTATEEN_REG(sstateen0):
+		return RISCV_CSR_SMSTATEEN(sstateen0);
+	}
+
+	TEST_FAIL("Unknown smstateen csr reg: 0x%llx", reg_off);
+	return NULL;
+}
+
 static const char *csr_id_to_str(const char *prefix, __u64 id)
 {
 	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_CSR);
@@ -255,6 +270,8 @@ static const char *csr_id_to_str(const char *prefix, __u64 id)
 		return general_csr_id_to_str(reg_off);
 	case KVM_REG_RISCV_CSR_AIA:
 		return aia_csr_id_to_str(reg_off);
+	case KVM_REG_RISCV_CSR_SMSTATEEN:
+		return smstateen_csr_id_to_str(reg_off);
 	}
 
 	TEST_FAIL("%s: Unknown csr subtype: 0x%llx", prefix, reg_subtype);
@@ -332,6 +349,7 @@ static const char *isa_ext_id_to_str(__u64 id)
 		KVM_ISA_EXT_ARR(I),
 		KVM_ISA_EXT_ARR(M),
 		KVM_ISA_EXT_ARR(V),
+		KVM_ISA_EXT_ARR(SMSTATEEN),
 		KVM_ISA_EXT_ARR(SSAIA),
 		KVM_ISA_EXT_ARR(SSTC),
 		KVM_ISA_EXT_ARR(SVINVAL),
@@ -637,6 +655,11 @@ static __u64 aia_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSAIA,
 };
 
+static __u64 smstateen_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_SMSTATEEN | KVM_REG_RISCV_CSR_SMSTATEEN_REG(sstateen0),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SMSTATEEN,
+};
+
 static __u64 fp_f_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_F | KVM_REG_RISCV_FP_F_REG(f[0]),
 	KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_F | KVM_REG_RISCV_FP_F_REG(f[1]),
@@ -744,6 +767,8 @@ static __u64 fp_d_regs[] = {
 	{"zihpm", .feature = KVM_RISCV_ISA_EXT_ZIHPM, .regs = zihpm_regs, .regs_n = ARRAY_SIZE(zihpm_regs),}
 #define AIA_REGS_SUBLIST \
 	{"aia", .feature = KVM_RISCV_ISA_EXT_SSAIA, .regs = aia_regs, .regs_n = ARRAY_SIZE(aia_regs),}
+#define SMSTATEEN_REGS_SUBLIST \
+	{"smstateen", .feature = KVM_RISCV_ISA_EXT_SMSTATEEN, .regs = smstateen_regs, .regs_n = ARRAY_SIZE(smstateen_regs),}
 #define FP_F_REGS_SUBLIST \
 	{"fp_f", .feature = KVM_RISCV_ISA_EXT_F, .regs = fp_f_regs, \
 		.regs_n = ARRAY_SIZE(fp_f_regs),}
@@ -871,6 +896,14 @@ static struct vcpu_reg_list aia_config = {
 	},
 };
 
+static struct vcpu_reg_list smstateen_config = {
+	.sublists = {
+	BASE_SUBLIST,
+	SMSTATEEN_REGS_SUBLIST,
+	{0},
+	},
+};
+
 static struct vcpu_reg_list fp_f_config = {
 	.sublists = {
 	BASE_SUBLIST,
@@ -903,6 +936,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&zifencei_config,
 	&zihpm_config,
 	&aia_config,
+	&smstateen_config,
 	&fp_f_config,
 	&fp_d_config,
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
