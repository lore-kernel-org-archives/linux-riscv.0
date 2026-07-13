Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B450EC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 01:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9UFzqNnhNhyF3pTNdtRANjO2bnrl9/C1c6T9UcK6rg=; b=b8XWOfwBIfXDh+
	czFgYheQih/JSWkGgk8xgDhhv7HFxib1Te0fi9oobcmeU6iL/ftYWDrpLFqa04iHUYn/fsSNZ3rAY
	fC88dlN8avlHxWSCDaE1AsIqAP26TxyQcVgHECNXp1eBqGq9EkM6M01gRCvdKUreQ/GZNH3MWntG5
	AsR3X10rEtVb/WK8k6Z04gh8pGuPuhd1nAo+gFxvoih55QEhFyoZ5PNWu3sN05zlmGGwb19slvFUU
	aVFvMdTPjbwWf69PSm1s3WA/PrDbQx4Jb2V4eFVfzvARLRd8Lw8yi0QgXnGDs5miIQh64ut4UEbLo
	fMr0WE/1N2nzpwK8zrFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55h-00000007tqv-0c83;
	Mon, 13 Jul 2026 01:04:13 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55f-00000007tnX-1DPm
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 01:04:12 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2caea3f742bso28564085ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 18:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904651; x=1784509451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92dcEhsni7PI6PnlxnEYjFlf9/2MK5LuINXM60q6u5M=;
        b=RvbGUAmKBqRAQ1WYHfs1MznaoOMfJA0cWqHIMHECLP1VeNyuzESDiPYxyLSHzvGpIB
         4PKiti9xkcAPoBY1aKaiFujc/znwEfXepD8QTkbU++Cg/YwpLskvL0wpGeuPrYjKgDTg
         PW0BLOP0t724V0x975G8WspPSpQtW/rsck0GK4rCy5SJfONypTyzd8dydy5gxY1MAtBw
         B4lksSd6o5mOFAlZsp6EpRUFtrYTEyNYDypCTvbcQn9jiTyDowsB5jCrqqX/0LpHxhpR
         7qYx4nYH4Oql0zWvPS2yJGsjnQI+33Yzbt/rb5uk8GXttPDoAj5WuI78yUSAKV4g3FeI
         E5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904651; x=1784509451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=92dcEhsni7PI6PnlxnEYjFlf9/2MK5LuINXM60q6u5M=;
        b=maFeXkuCjOiwFHGlY3kmQeAONdXAT04EaOwu3pDsXKvxq/mgelSpmA+AdjbkKGdWTc
         OpM/BmbPizp1viwlY2UKIACzch2lODgheUPSAXcV/yKqO6j8O4qTr4NxmaJt0AQzFQ7f
         bSj6rxrE9z6CimRut6USwJCWiRQZ1x6Ar42H/tHhTgs2gAz3q/LhDLnfjk4jLiMSW9SO
         BKhG7/p57FwBiZsk+Cm+fWxOBAe+ZqO2q2aBjCTO4xpd4pEgcyoJ/7O2HuBPM1E+K+LZ
         Ae1gIziue92ETswLkNp+VF5WsaxtUYpv0NQ/LKP2TVlvT+R3FcCDMtCMs94GE46R635K
         nymA==
X-Gm-Message-State: AOJu0YyBRLy8K4hPcjVdvYfa2r5ITx1re+87STDVc7XjwE2sLoozO7PD
	hNbZ0SShE4Vu1X/PZroH2WaNlA8M7+1sT26pS5LDevd4TX2AyIwcR5JR
X-Gm-Gg: AfdE7ckDUDiMN97uLPs9Lt2ci+9nKVqDShGQrYPYT/c+IP/HanqRJ+aROWw/Ow9wGVL
	P9c5Ojmwcr8suaymkBejsCnkFrL3pl49XQzEYsCciPQBy3lwKybOls6Vs+Ob6at5Lm6ysDiopFS
	LeOWGc72tdMy1WqddULguCjWdmjOKQ99J59tTVrD+0NiXyKHFUaUHsqhiiLYMkYgF4xEyCLMSOA
	OFkgNJULa54m75jqLLCSIGyd6T61qJAzUFRM8anmPmQ5mBSdEIFP5WTbcOFyeq6/+H27x5zutn0
	9hIjdIhrqLmfE62Je9QWTqq9HT/J9LAwnaGB5kk5XY5aVt/XBLHY/Akf+7HXBxXCrjeW8BBMdih
	Fw57EnhzZ8d8pIdysbw3d05zQ+MGEer4RBNULsv9hZwHuOkOL2aeQyDcFWsiCCr22HptB/DvPVP
	vZjQEs9olB+MM=
X-Received: by 2002:a17:903:1b23:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2ce9e7ac551mr73292325ad.2.1783904650561;
        Sun, 12 Jul 2026 18:04:10 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e284sm90725625ad.40.2026.07.12.18.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 18:04:10 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v6 8/8] KVM: riscv: selftests: add Zicfiss/Zicfilp extension to get-reg-list test
Date: Mon, 13 Jul 2026 09:03:01 +0800
Message-ID: <20260713010302.303278-9-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713010302.303278-1-inochiama@gmail.com>
References: <20260713010302.303278-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_180411_336053_873211C0 
X-CRM114-Status: GOOD (  11.65  )
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

The KVM RISC-V allows Zicfiss/Zicfilp extensions for Guest/VM so
add these extensions to get-reg-list test.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 94e33b2ee796..bf3980e9db12 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -90,6 +90,8 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOP:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCRSE:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFILP:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFISS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICNTR:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICOND:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICSR:
@@ -358,6 +360,8 @@ static const char *core_id_to_str(const char *prefix, __u64 id)
 	"KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_REG(" #csr ")"
 #define RISCV_CSR_SMSTATEEN(csr) \
 	"KVM_REG_RISCV_CSR_SMSTATEEN | KVM_REG_RISCV_CSR_REG(" #csr ")"
+#define RISCV_CSR_ZICFISS(csr) \
+	"KVM_REG_RISCV_CSR_ZICFISS | KVM_REG_RISCV_CSR_ZICFISS_REG(" #csr ")"
 
 static const char *general_csr_id_to_str(__u64 reg_off)
 {
@@ -425,6 +429,18 @@ static const char *smstateen_csr_id_to_str(__u64 reg_off)
 	return NULL;
 }
 
+static const char *zicfiss_csr_id_to_str(__u64 reg_off)
+{
+	/* reg_off is the offset into struct kvm_riscv_zicfiss_csr */
+	switch (reg_off) {
+	case KVM_REG_RISCV_CSR_ZICFISS_REG(ssp):
+		return RISCV_CSR_ZICFISS(ssp);
+	}
+
+	TEST_FAIL("Unknown zicfiss csr reg: 0x%llx", reg_off);
+	return NULL;
+}
+
 static const char *csr_id_to_str(const char *prefix, __u64 id)
 {
 	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_CSR);
@@ -441,6 +457,8 @@ static const char *csr_id_to_str(const char *prefix, __u64 id)
 		return aia_csr_id_to_str(reg_off);
 	case KVM_REG_RISCV_CSR_SMSTATEEN:
 		return smstateen_csr_id_to_str(reg_off);
+	case KVM_REG_RISCV_CSR_ZICFISS:
+		return zicfiss_csr_id_to_str(reg_off);
 	}
 
 	return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, reg_off);
@@ -585,6 +603,8 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZICBOP),
 		KVM_ISA_EXT_ARR(ZICBOZ),
 		KVM_ISA_EXT_ARR(ZICCRSE),
+		KVM_ISA_EXT_ARR(ZICFILP),
+		KVM_ISA_EXT_ARR(ZICFISS),
 		KVM_ISA_EXT_ARR(ZICNTR),
 		KVM_ISA_EXT_ARR(ZICOND),
 		KVM_ISA_EXT_ARR(ZICSR),
@@ -748,6 +768,12 @@ static const char *sbi_fwft_id_to_str(__u64 reg_off)
 	case 6: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable)";
 	case 7: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags)";
 	case 8: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value)";
+	case 9: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.enable)";
+	case 10: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.flags)";
+	case 11: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.value)";
+	case 12: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.enable)";
+	case 13: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.flags)";
+	case 14: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.value)";
 	}
 	return strdup_printf("KVM_REG_RISCV_SBI_FWFT | %lld /* UNKNOWN */", reg_off);
 }
@@ -954,6 +980,20 @@ static __u64 sbi_fwft_pte_ad_hw_updating_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value),
 };
 
+static __u64 sbi_fwft_landing_pad_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.enable),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.value),
+};
+
+static __u64 sbi_fwft_shadow_stack_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.enable),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.value),
+};
+
 static __u64 zicbom_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbom_block_size),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
@@ -969,6 +1009,11 @@ static __u64 zicboz_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ,
 };
 
+static __u64 zicfiss_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_ZICFISS | KVM_REG_RISCV_CSR_ZICFISS_REG(ssp),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFISS,
+};
+
 static __u64 aia_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1),
@@ -1220,6 +1265,8 @@ KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicbop, ZICBOP);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
 KVM_ISA_EXT_SIMPLE_CONFIG(ziccrse, ZICCRSE);
+KVM_ISA_EXT_SIMPLE_CONFIG(zicfilp, ZICFILP);
+KVM_ISA_EXT_SUBLIST_CONFIG(zicfiss, ZICFISS);
 KVM_ISA_EXT_SIMPLE_CONFIG(zicntr, ZICNTR);
 KVM_ISA_EXT_SIMPLE_CONFIG(zicond, ZICOND);
 KVM_ISA_EXT_SIMPLE_CONFIG(zicsr, ZICSR);
@@ -1279,6 +1326,24 @@ static struct vcpu_reg_list config_sbi_fwft_pte_ad_hw_updating = {
 	},
 };
 
+static struct vcpu_reg_list config_sbi_fwft_landing_pad = {
+	.sublists = {
+		SUBLIST_BASE,
+		SUBLIST_ISA(zicfilp, ZICFILP),
+		SUBLIST_SBI(fwft_landing_pad, FWFT),
+		{0},
+	},
+};
+
+static struct vcpu_reg_list config_sbi_fwft_shadow_stack = {
+	.sublists = {
+		SUBLIST_BASE,
+		SUBLIST_ISA(zicfiss, ZICFISS),
+		SUBLIST_SBI(fwft_shadow_stack, FWFT),
+		{0},
+	},
+};
+
 struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_base,
 	&config_sbi_sta,
@@ -1289,6 +1354,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_fwft_misaligned_deleg,
 	&config_sbi_fwft_pointer_masking,
 	&config_sbi_fwft_pte_ad_hw_updating,
+	&config_sbi_fwft_landing_pad,
+	&config_sbi_fwft_shadow_stack,
 	&config_aia,
 	&config_fp_f,
 	&config_fp_d,
@@ -1332,6 +1399,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zicbop,
 	&config_zicboz,
 	&config_ziccrse,
+	&config_zicfilp,
+	&config_zicfiss,
 	&config_zicntr,
 	&config_zicond,
 	&config_zicsr,
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
