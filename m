Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CFEEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IxUEKDGv15KznNPLo7ZTmUz1cwFEBWL0mFa9aefySUk=; b=Ue3jsSfUplc5sT
	oHTmrW9m0uSAKajwZaxgOSrvgQ5vq2H/Vjy2lBJXghIsLV+Q9bEYvGTm3nZNCiRTtMs/eoL3C/5EL
	CMNsN5bLyABwLWalEusLjHpMCKvp1f9e2EDp0f0t82xiwVvJzhxsaL9Q0yj/Z4EK/YT4yvSyOpUGo
	wO/2rHqeGhP+e5g7cWrdhpUi1L8LIf1D11OSNMi3oI+r45Bts/FlzSz8f7bNgZDILSAi9vku3/9jv
	rZDnTrblqcweGdRykSNQ1eTvtNO5M15WSe618yx+UE2DB7UlZj2tuNEAdFPQkn4uIeaCD5KtXHGzM
	ZVPUYadOryphDWZxsKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9ep-0083MB-22;
	Wed, 19 Jul 2023 16:04:07 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9el-0083J0-1l
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:04:05 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-666eec46206so7054075b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 09:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689782642; x=1692374642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6URFlWvIburf3cR9HtAr9E2Sh/GiXynH5eeSEzuJxs=;
        b=WaohftT1ANT+NDmf2wm1ZON/IXAyT8mpFOeySgMAdPrwqoCXRP8ZoiowCo3Rc+3LKJ
         CNYKM5JbgFv+zmr8wIhrXuXvoWCxsUCSCr81d9iLTFhUuAcY/SuU5YbAN6rJHWjzbsfL
         cthkWJD3uQC2+a4EIlD+5u7HdcYJQni7U93iYlGs6kX2sNmgZVztAybKc3nAQ7eIrYfZ
         E7utoUcevLj3fcYR6LnFaU4NzId7M7wd3XLuZLKvqDdVBz2XBmjGYjAlHMYBQ8U+a3Ph
         5H+FTHI8QORCLaJFrE6bRQ2fBWNN2LR4AOfM0J20JyvgeWUEg4D68BcYLfQIHCBXg7xy
         tmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689782642; x=1692374642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6URFlWvIburf3cR9HtAr9E2Sh/GiXynH5eeSEzuJxs=;
        b=XpTtsn6QeCxHxBIVyzOPmEzn1W6E7QyHw03fjY84mRPxwCE4l9KKr2Xk9uSn2I+D+W
         iJiAVI1aTRc5kOcG305iRR4TTH1gi6zwJ8WUETqGVnnt5kyu8pIV1PH1vPrr42t6xdYz
         GSPAdvjl2TvTNjF+3pY+tt2A7OTZLw6WyCv2/vdR5Dt1wn2VK4E/9Cb+u2WIOgMeFuux
         Y68JATbIVAtuMfJDKAX4BNByG+JHCTMTcRNAY3xsA8Iws/Rv/6TxQ0OkuHm6umB3yze2
         DHCinm3UKeBUosO5XSwMn/me5WhRAShzM0tb23d3mlkgef4/SxhMn9sTrzQvz1nltQJR
         hj9A==
X-Gm-Message-State: ABy/qLZ8SRlMfHZPyevs6H90vJTGaKsLVQGY9oXDocT1sOUOzHcihsOS
	JhOgjugV+M1NoORI2mgtg3iJbg==
X-Google-Smtp-Source: APBJJlHKOTC7MHrXK6/AOoOrJNpMIprXE7WFAiLOdLON0jkiWzRozcPDerjd4PIvIn/x5wSHDCon9w==
X-Received: by 2002:a05:6a00:2312:b0:67a:b045:e290 with SMTP id h18-20020a056a00231200b0067ab045e290mr3513433pfh.4.1689782642275;
        Wed, 19 Jul 2023 09:04:02 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id i22-20020aa79096000000b00682936d04ccsm3447023pfa.180.2023.07.19.09.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 09:04:02 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v1 3/6] RISC-V: KVM: Enable Smstateen accesses
Date: Wed, 19 Jul 2023 21:33:13 +0530
Message-Id: <20230719160316.4048022-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719160316.4048022-1-mchitale@ventanamicro.com>
References: <20230719160316.4048022-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_090403_583299_8A77DA44 
X-CRM114-Status: GOOD (  12.60  )
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

Configure hstateen0 register so that the AIA state and envcfg are
accessible to the vcpus. This includes registers such as siselect,
sireg, siph, sieh and all the IMISC registers.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 arch/riscv/include/asm/csr.h      | 16 ++++++++++++++++
 arch/riscv/include/asm/kvm_host.h |  1 +
 arch/riscv/include/uapi/asm/kvm.h |  1 +
 arch/riscv/kvm/vcpu.c             | 16 ++++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 7bac43a3176e..38730677dcd5 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -201,6 +201,18 @@
 #define ENVCFG_CBIE_INV			_AC(0x3, UL)
 #define ENVCFG_FIOM			_AC(0x1, UL)
 
+/* Smstateen bits */
+#define SMSTATEEN0_AIA_IMSIC_SHIFT	58
+#define SMSTATEEN0_AIA_IMSIC		(_ULL(1) << SMSTATEEN0_AIA_IMSIC_SHIFT)
+#define SMSTATEEN0_AIA_SHIFT		59
+#define SMSTATEEN0_AIA			(_ULL(1) << SMSTATEEN0_AIA_SHIFT)
+#define SMSTATEEN0_AIA_ISEL_SHIFT	60
+#define SMSTATEEN0_AIA_ISEL		(_ULL(1) << SMSTATEEN0_AIA_ISEL_SHIFT)
+#define SMSTATEEN0_HSENVCFG_SHIFT	62
+#define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
+#define SMSTATEEN0_SSTATEEN0_SHIFT	63
+#define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
+
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01
@@ -347,6 +359,10 @@
 #define CSR_VSIEH		0x214
 #define CSR_VSIPH		0x254
 
+/* Hypervisor stateen CSRs */
+#define CSR_HSTATEEN0		0x60c
+#define CSR_HSTATEEN0H		0x61c
+
 #define CSR_MSTATUS		0x300
 #define CSR_MISA		0x301
 #define CSR_MIDELEG		0x303
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index c0c50b4b3394..ee55e5fc8b84 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -166,6 +166,7 @@ struct kvm_vcpu_csr {
 
 struct kvm_vcpu_config {
 	u64 henvcfg;
+	u64 hstateen0;
 };
 
 struct kvm_vcpu_arch {
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 930fdc4101cd..7bc1634b0a89 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -124,6 +124,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_SSAIA,
 	KVM_RISCV_ISA_EXT_V,
 	KVM_RISCV_ISA_EXT_SVNAPOT,
+	KVM_RISCV_ISA_EXT_SMSTATEEN,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e01f47bb636f..d3166b676430 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -70,6 +70,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 	KVM_ISA_EXT_ARR(ZICBOM),
 	KVM_ISA_EXT_ARR(ZICBOZ),
+	KVM_ISA_EXT_ARR(SMSTATEEN),
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -996,6 +997,16 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 
 	if (riscv_isa_extension_available(isa, ZICBOZ))
 		cfg->henvcfg |= ENVCFG_CBZE;
+
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
+		cfg->hstateen0 |= SMSTATEEN0_HSENVCFG;
+		if (riscv_isa_extension_available(isa, SSAIA))
+			cfg->hstateen0 |= SMSTATEEN0_AIA_IMSIC |
+					  SMSTATEEN0_AIA |
+					  SMSTATEEN0_AIA_ISEL;
+		if (riscv_isa_extension_available(isa, SMSTATEEN))
+			cfg->hstateen0 |= SMSTATEEN0_SSTATEEN0;
+	}
 }
 
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
@@ -1015,6 +1026,11 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	csr_write(CSR_HENVCFG, cfg->henvcfg);
 	if (IS_ENABLED(CONFIG_32BIT))
 		csr_write(CSR_HENVCFGH, cfg->henvcfg >> 32);
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
+		csr_write(CSR_HSTATEEN0, cfg->hstateen0);
+		if (IS_ENABLED(CONFIG_32BIT))
+			csr_write(CSR_HSTATEEN0H, cfg->hstateen0 >> 32);
+	}
 
 	kvm_riscv_gstage_update_hgatp(vcpu);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
