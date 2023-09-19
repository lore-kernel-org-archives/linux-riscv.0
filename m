Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D16CD37B4
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 03:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9oA4xcI8dBGdwCcj7I04v94cFF/RIZXnVuHABWG9wEc=; b=r2cmWiiAVKzZ0x
	psFZMdRx+1qi8683RUd3ToLSBYSS9i/oCav+/WyXEgBvPvH/rZ9A/o15bLV3754tLi55kH9fN54vt
	Y4GyaKTMhkaAFVkcD5OBA1ShMTMN+TMpot7LJHGFId8gTPQWlJqYuJMY5rp3HXQ0sRnEioIwy6ipQ
	rfB5N6c/FxLTvWo02nAN7ewwvBdSLPS2W0N4ovWXRCDc+TkWCp1Jv4a1KPw6lVOVxVYzspMP65cjS
	eYwy/gNiRl/lDOyDtssPTnGDCBqEvhQG3/xN6vQTkbnB1Gw4gawtkSGFrR10MV+oS4Zxwc+LXPdTY
	Lc152c/zFUip25stJz0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRoq-00Gr1h-2l;
	Tue, 19 Sep 2023 03:54:36 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRoo-00Gqyq-2S
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 03:54:36 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-27489f78e52so3013594a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 20:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695095673; x=1695700473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mq3LOReqduF1SDuSYPSNNB82Nem1JwUvHmVZElovfds=;
        b=LMKrFnl+dqUcb7uM6sPTE5dFEUFEgrpaGxR7NIQ36maDpB9AqK6DiN3XTFCzZ2viYy
         E9jQ+TPHtsedV+6I87b1NaYw8fxtHcuRyUi46ZrhOvxpHjvQM3boBL+8BbvUtyDvc00g
         vKv4id/z513uUcGyb55aLXJxu59KwKUW8F5phDQ2iZ6eLQwa8IRB5aH1uGfq1PhBRmmK
         o0Bjwo9OmJV/h9qWk5QLpzrIM+HqHlMD7ylWEa8o0MYzp65rSyrMtk3DU7exOmZvAQ2J
         nxocO4rlqeRajqrrUw0gxJ0FvZ83PrtNtSK7dTuwb0szILdMfA5QzkBEtvXMiS3nl2Wa
         6uiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695095673; x=1695700473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mq3LOReqduF1SDuSYPSNNB82Nem1JwUvHmVZElovfds=;
        b=NnSJAac7fruINoRKM0Y8b5KIw16AWiVKqvAx5MRYElXzSLGE2yzVYdkgG1Kt1S91UE
         Qox3k/25uX+eMFPXwmpD2kneS/fekiu0Vs+P+Zjmv0adIPnEFS4yVH+ZVC/pg/nCEvh0
         uH1DtWqANwaeBHJGiSmpHCWIlUmo7FbQbNlgfG15n9UnLXfMfQ/XJClZMsWHjh4NVENw
         iUy5F+tbU6hO6g3seKSIRaMS62XoMTCLQAXmysS6MvlLZA1CjoY6rPD9lFKX1gADjohi
         LUmQqG9lee352/zukb8scN5QJ/YPc0ftITIicW9PGqdtzTAcBMIQBtwukRf1qqze5Qyl
         6U4g==
X-Gm-Message-State: AOJu0YzgUOiH8QiMDKMlcOKn8JXYuGw4DSe4Ox1mRGaONHUwjCE1vUZ4
	lsmbfktuvWuOLwga7Y0C7MyIbg==
X-Google-Smtp-Source: AGHT+IGn8GgNjnqWNdJgMIfQx0naxl2pKkZTSagr+WObJKilG7NALzfMEtJZtUBpsH6o6ifSqzEiWA==
X-Received: by 2002:a17:90b:4b11:b0:273:ed60:ad52 with SMTP id lx17-20020a17090b4b1100b00273ed60ad52mr8476738pjb.37.1695095672905;
        Mon, 18 Sep 2023 20:54:32 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a034300b00273fc850342sm4000802pjf.20.2023.09.18.20.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 20:54:32 -0700 (PDT)
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
Subject: [PATCH 6/7] KVM: riscv: selftests: Add smstateen registers to get-reg-list test
Date: Tue, 19 Sep 2023 09:23:42 +0530
Message-Id: <20230919035343.1399389-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919035343.1399389-1-apatel@ventanamicro.com>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_205434_803154_005E7E2E 
X-CRM114-Status: GOOD (  13.03  )
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
---
 .../selftests/kvm/riscv/get-reg-list.c        | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 0928c35470ae..9f464c7996c6 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -49,6 +49,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICSR:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SMSTATEEN:
 		return true;
 	/* AIA registers are always available when Ssaia can't be disabled */
 	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
@@ -184,6 +185,8 @@ static const char *core_id_to_str(const char *prefix, __u64 id)
 	"KVM_REG_RISCV_CSR_GENERAL | KVM_REG_RISCV_CSR_REG(" #csr ")"
 #define RISCV_CSR_AIA(csr) \
 	"KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_REG(" #csr ")"
+#define RISCV_CSR_SMSTATEEN(csr) \
+	"KVM_REG_RISCV_CSR_SMSTATEEN | KVM_REG_RISCV_CSR_REG(" #csr ")"
 
 static const char *general_csr_id_to_str(__u64 reg_off)
 {
@@ -241,6 +244,18 @@ static const char *aia_csr_id_to_str(__u64 reg_off)
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
@@ -253,6 +268,8 @@ static const char *csr_id_to_str(const char *prefix, __u64 id)
 		return general_csr_id_to_str(reg_off);
 	case KVM_REG_RISCV_CSR_AIA:
 		return aia_csr_id_to_str(reg_off);
+	case KVM_REG_RISCV_CSR_SMSTATEEN:
+		return smstateen_csr_id_to_str(reg_off);
 	}
 
 	TEST_FAIL("%s: Unknown csr subtype: 0x%llx", prefix, reg_subtype);
@@ -342,6 +359,7 @@ static const char *isa_ext_id_to_str(__u64 id)
 		"KVM_RISCV_ISA_EXT_ZICSR",
 		"KVM_RISCV_ISA_EXT_ZIFENCEI",
 		"KVM_RISCV_ISA_EXT_ZIHPM",
+		"KVM_RISCV_ISA_EXT_SMSTATEEN",
 	};
 
 	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name)) {
@@ -629,6 +647,11 @@ static __u64 aia_regs[] = {
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
@@ -736,6 +759,8 @@ static __u64 fp_d_regs[] = {
 	{"zihpm", .feature = KVM_RISCV_ISA_EXT_ZIHPM, .regs = zihpm_regs, .regs_n = ARRAY_SIZE(zihpm_regs),}
 #define AIA_REGS_SUBLIST \
 	{"aia", .feature = KVM_RISCV_ISA_EXT_SSAIA, .regs = aia_regs, .regs_n = ARRAY_SIZE(aia_regs),}
+#define SMSTATEEN_REGS_SUBLIST \
+	{"smstateen", .feature = KVM_RISCV_ISA_EXT_SMSTATEEN, .regs = smstateen_regs, .regs_n = ARRAY_SIZE(smstateen_regs),}
 #define FP_F_REGS_SUBLIST \
 	{"fp_f", .feature = KVM_RISCV_ISA_EXT_F, .regs = fp_f_regs, \
 		.regs_n = ARRAY_SIZE(fp_f_regs),}
@@ -863,6 +888,14 @@ static struct vcpu_reg_list aia_config = {
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
@@ -895,6 +928,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
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
