Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D84CD11DD
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 10:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LqKaisoWM25Q+PKdcA/LRTLjjY/0Sz0bBPv8JGCEEU0=; b=BV2giuFCBoHYWn
	tuOTji6Y5KSuTYTPigPlxOOWgrD1ReCH8tJ+3Qss8xJ/JgcZVmP1tXyHaaAygZ/jLqiCrbNJMchpC
	hgaIjRBYEx3Jj9BvlWwNzjfS88ht4DT/XX6TMgq8yuQF8a8uTPpH6MFnHIL8vInMwDMAlj6MZDU4A
	OXO8KPGQYKeKEnX0MgL01Ui82OENFLWDXVDrHFTFPAQ0/HgAcQOzGfO6UPQdMuurGlc/G8g1q863w
	tKkMLiU1miYE1lq6/xD+hkWkgJHTDFY/etA0QV10Z7pz+MCzRwxjhb8JuAaK4DdQ6nRtp6gKPqfxe
	HZyAaOXMyrme4pm/NJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq9Yr-000000003c0-2klq;
	Fri, 29 Mar 2024 10:34:13 +0000
Received: from mail-pj1-f43.google.com ([209.85.216.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8X9-0000000HUkm-1mab
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 09:28:25 +0000
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2a07b092c4fso1447340a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 02:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711704500; x=1712309300; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDqUNVfVcL5Rx2dx6lOA54ZEoR9Eohs4e4oftX2EMwM=;
        b=bCrBpY/Q/sWGe7OIQpp8D/jII1xyN+2nKuHYkFpbWcbnCoGuOdlgRId48zHf6Dns8h
         ijQ3FcGClZDjir1J/bSdiqV5vWYHJc5R7gB0Oe9PxfxAuzn6NpppYDiGg9imLSHrf4nd
         x2ljUe9uG5jLxAw/Jz7OQIcqi+a9Kx2808w7zov9OqiyEDQ92/SuknjhQsD3608FJmLM
         FsYefQWSDn4O8K9wrPL6fxnYiMfSCWCePW0rlhL5149aac68hNp9s1ulnK6Lu+jqo6GK
         VP1B0euGqp+MS5RU1l8VIbFOFSqgMja/s0yspnom39pvg0Bo4i7Pbq6lk2iAn/mikmtl
         QO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711704500; x=1712309300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDqUNVfVcL5Rx2dx6lOA54ZEoR9Eohs4e4oftX2EMwM=;
        b=Yx84uVh8clPusPV4khMzSbE0ipgoZP4XLMoHDRnuLXmhoFyErKucMoEMLo3M0ywTMB
         0IT9yx6gY25d8UdhCSsDhRAkjYicnDL6k6WLWYOBZdzBDFpN6FG7GZBQTh92rOvV5JIX
         NNSM30rwu8kPb9D3EjQ66NaC2EOdtHyoA726LNnTtAr8GvgQUtYPzRXkH1Zf0tZTZokS
         tfTmY0W09SXm9pXu1MOS1n6QPgY4CiXDgChFpT8ACb7u7eZKlIdrJwnZIwJunCP36cgx
         +Tbg2cQ0bijnaKeblURkeaRLHJy2lf4ToPRyF1qfr/yX4ML2sr2MRWjSzWXAhBb42ti0
         k5hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSaUZiKn3wfCfSTRf1Eexcu020uLcVHzX6Y5jbWcjCRCxsuwNhVsj7WFWLvpp7In7MlTQpjkICV0bLZhZ/9nv5AT7wWoQh+707mWy3IQGs
X-Gm-Message-State: AOJu0YwdVqBTW7IoWBpa7Tfk4flkms/OPhjax10Md6wL1+Qharp85h4F
	W7wPgDbpyOBKtLWGPczUCYezDWrLMRFAjurzAoAs2VDelFya2q40Igbgxn56a3ThTzai5GR//Kv
	12ccCxDZZcKKR6bPKq54fn0XDUlnoz+xi9iMEPtlOJ4FZYskr0qWyCoSs/vu5CN9mbimcIea1PW
	faCBo9cUCIrZSyNGpXsP6ed9gAODo7EDsIFAvl+0+3yCmca603og==
X-Google-Smtp-Source: AGHT+IEFn6lnpp94KNj8bwQ5NgWC2ILdPrLL6jG7Xd8BF08mkXal/x6HNlt14p0P0bkYq09hEnt/mA==
X-Received: by 2002:a17:90a:ea06:b0:2a0:310b:2cac with SMTP id w6-20020a17090aea0600b002a0310b2cacmr1663501pjy.25.1711704499969;
        Fri, 29 Mar 2024 02:28:19 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id cv17-20020a17090afd1100b002a02f8d350fsm2628830pjb.53.2024.03.29.02.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 02:28:19 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 29 Mar 2024 17:26:27 +0800
Subject: [PATCH RFC 11/11] KVM: riscv: selftests: Add Sdtrig Extension to
 get-reg-list test
MIME-Version: 1.0
Message-Id: <20240329-dev-maxh-lin-452-6-9-v1-11-1534f93b94a7@sifive.com>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 Max Hsu <max.hsu@sifive.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_022823_942886_A07030BB 
X-CRM114-Status: GOOD (  11.19  )
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

From: Yong-Xuan Wang <yongxuan.wang@sifive.com>

Update the get-reg-list test to test the Sdtrig Extension is available
for guest OS.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Co-developed-by: Max Hsu <max.hsu@sifive.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index b882b7b9b785..f2696e308509 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -41,6 +41,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_I:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_M:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_V:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SDTRIG:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SMSTATEEN:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSAIA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSTC:
@@ -247,6 +248,8 @@ static const char *core_id_to_str(const char *prefix, __u64 id)
 	"KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_REG(" #csr ")"
 #define RISCV_CSR_SMSTATEEN(csr) \
 	"KVM_REG_RISCV_CSR_SMSTATEEN | KVM_REG_RISCV_CSR_REG(" #csr ")"
+#define RISCV_CSR_SDTRIG(csr) \
+	"KVM_REG_RISCV_CSR_SDTRIG | KVM_REG_RISCV_CSR_REG(" #csr ")"
 
 static const char *general_csr_id_to_str(__u64 reg_off)
 {
@@ -314,6 +317,18 @@ static const char *smstateen_csr_id_to_str(__u64 reg_off)
 	return NULL;
 }
 
+static const char *sdtrig_csr_id_to_str(__u64 reg_off)
+{
+	/* reg_off is the offset into struct kvm_riscv_smstateen_csr */
+	switch (reg_off) {
+	case KVM_REG_RISCV_CSR_SDTRIG_REG(scontext):
+		return RISCV_CSR_SDTRIG(scontext);
+	}
+
+	TEST_FAIL("Unknown sdtrig csr reg: 0x%llx", reg_off);
+	return NULL;
+}
+
 static const char *csr_id_to_str(const char *prefix, __u64 id)
 {
 	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_CSR);
@@ -330,6 +345,8 @@ static const char *csr_id_to_str(const char *prefix, __u64 id)
 		return aia_csr_id_to_str(reg_off);
 	case KVM_REG_RISCV_CSR_SMSTATEEN:
 		return smstateen_csr_id_to_str(reg_off);
+	case KVM_REG_RISCV_CSR_SDTRIG:
+		return sdtrig_csr_id_to_str(reg_off);
 	}
 
 	return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, reg_off);
@@ -406,6 +423,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(I),
 		KVM_ISA_EXT_ARR(M),
 		KVM_ISA_EXT_ARR(V),
+		KVM_ISA_EXT_ARR(SDTRIG),
 		KVM_ISA_EXT_ARR(SMSTATEEN),
 		KVM_ISA_EXT_ARR(SSAIA),
 		KVM_ISA_EXT_ARR(SSTC),
@@ -764,6 +782,11 @@ static __u64 smstateen_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SMSTATEEN,
 };
 
+static __u64 sdtrig_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_SDTRIG | KVM_REG_RISCV_CSR_SDTRIG_REG(scontext),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SDTRIG,
+};
+
 static __u64 fp_f_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_F | KVM_REG_RISCV_FP_F_REG(f[0]),
 	KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_F | KVM_REG_RISCV_FP_F_REG(f[1]),
@@ -853,6 +876,8 @@ static __u64 fp_d_regs[] = {
 	{"zicboz", .feature = KVM_RISCV_ISA_EXT_ZICBOZ, .regs = zicboz_regs, .regs_n = ARRAY_SIZE(zicboz_regs),}
 #define SUBLIST_AIA \
 	{"aia", .feature = KVM_RISCV_ISA_EXT_SSAIA, .regs = aia_regs, .regs_n = ARRAY_SIZE(aia_regs),}
+#define SUBLIST_SDTRIG \
+	{"sdtrig", .feature = KVM_RISCV_ISA_EXT_SDTRIG, .regs = sdtrig_regs, .regs_n = ARRAY_SIZE(sdtrig_regs),}
 #define SUBLIST_SMSTATEEN \
 	{"smstateen", .feature = KVM_RISCV_ISA_EXT_SMSTATEEN, .regs = smstateen_regs, .regs_n = ARRAY_SIZE(smstateen_regs),}
 #define SUBLIST_FP_F \
@@ -930,6 +955,7 @@ KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
 KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
+KVM_ISA_EXT_SUBLIST_CONFIG(sdtrig, SDTRIG);
 KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
 KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
 KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
@@ -985,6 +1011,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_fp_f,
 	&config_fp_d,
 	&config_h,
+	&config_sdtrig,
 	&config_smstateen,
 	&config_sstc,
 	&config_svinval,

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
