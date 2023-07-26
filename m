Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2823BC001E0
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 08:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+BXQMyi7YW41Vk8f+DaUBZjfQ52KXyYP8nz3gPXIz0=; b=XrB2Ryfw0/lu6u
	4uQZZtCC/egCV/SmAk3qF11y3vUFzRP80TYOTVkbPGYDUtKgCs6LDXxA/dUC4JnbsIrTovesx9lg6
	6tYJho9w1mZJXhsRKNhYczP8Fa59ofMCZtzdq6C6Em7N9tfTnAcEVh+z22HI6KbFT06Vrfu27yDQZ
	whqULucIIr2C/o8en4rKMK8Pvmt4SYB85ggWuxBoeXVnfN35FG3NXJNVR8lLYwp/dyX4seYviemx7
	EdaiWFmtmDIHJmWgGvttABvxGFyJ1qtT/1mxVZ50JBZ4wOowAOwOZvm51783ayU9LORUQhlB/XA6A
	Z140UIi1ttcZIJ50iwXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOa8B-009cBJ-15;
	Wed, 26 Jul 2023 08:44:27 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOa88-009c98-01
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 08:44:25 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bba54f7eefso4760915ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jul 2023 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690361063; x=1690965863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAcARu5ZxkxhhYJPR5lGRGBeKU4C8+q0CB3P21eo9N8=;
        b=h6hKidnpgoyRETT2Q9vc6177CPzk/5C4u8luo1sZ0zBBUL3KfdQpXp/gzLdSPX0i30
         Q3Fd+D+tQKNhrwlFdsZ9cW4pGhVzcKfCwOC+lPRvRQIrqrDKKUuy0RtgNsU/1BORaaqA
         TfHXGUd2l8jSqy31lXaARQuQCLnnf58u5R2XjQdxBfkqZhNr2e8yP6NhoQHd5GglA2Oc
         Pd5eLbTDqiRGRLf/1pgSg+5U3YXRI79WPkZBf0ri5PVowfyvDc15j0fXzjJzemFPTdro
         3+Jxi22JFE3yTmgD/G8STggugsDEgxa6LZmITOtH/OlTbOJfJF74jivniwDyNibN/ic5
         LoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690361063; x=1690965863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAcARu5ZxkxhhYJPR5lGRGBeKU4C8+q0CB3P21eo9N8=;
        b=J0kClUW+L6Ws3miGHbxWWURPxNtUF++0/cDaeaGfBnycVbSAM/0dnOv2PUcVMgDIr0
         EZ3qbddxVGf0Xj6gnePtratcB1fq42ethCYFrYx+LeK68z6OStPpM/6dBDWrWi/tQF/t
         WRRRuq+r9WHqF+sxQgHQEI8QyCGdQR3J/h6MbogycX277p/F47z9oSjd91SX5efK01MG
         T8nP9prn3LUqxm6BKWPPN2fEIATIhGCzGiOjRj9foGM1qB15DGE6kFziKLLSQ53vSx5D
         3XU2HcGoi8iRsTdtlPdznQfyyxLOodukbJdFBJ957mojNFkuhoCT6bODrpP1tA0uRRSx
         h9Gg==
X-Gm-Message-State: ABy/qLbfuATRKtTOeDAal+CfNrK+IgN89i2KjsZz48BMjJ8sqnxyCfXJ
	j6vE0hBQRxia9KW6p8yTxedqmg==
X-Google-Smtp-Source: APBJJlH8xEYPZjQkD6d1UqCJhsvl91pSiac5LQdtMZXzva2mUldIcZ24xpJLXh+FPkqq95yNXnIiFA==
X-Received: by 2002:a17:902:c950:b0:1ae:6947:e63b with SMTP id i16-20020a170902c95000b001ae6947e63bmr1988736pla.16.1690361063331;
        Wed, 26 Jul 2023 01:44:23 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id y19-20020a170902ed5300b001b3bf8001a9sm3978637plb.48.2023.07.26.01.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 01:44:23 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v4 4/7] RISC-V: KVM: Enable Smstateen accesses
Date: Wed, 26 Jul 2023 14:13:49 +0530
Message-Id: <20230726084352.2136377-5-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726084352.2136377-1-mchitale@ventanamicro.com>
References: <20230726084352.2136377-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_014424_047745_2D815438 
X-CRM114-Status: GOOD (  12.58  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/csr.h      | 16 ++++++++++++++++
 arch/riscv/include/asm/kvm_host.h |  1 +
 arch/riscv/include/uapi/asm/kvm.h |  1 +
 arch/riscv/kvm/vcpu.c             | 15 +++++++++++++++
 4 files changed, 33 insertions(+)

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
index c0fb54d164c7..d00b61620f54 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -166,6 +166,7 @@ struct kvm_vcpu_csr {
 
 struct kvm_vcpu_config {
 	u64 henvcfg;
+	u64 hstateen0;
 };
 
 struct kvm_vcpu_arch {
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 9c35e1427f73..dc185e7875ce 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -130,6 +130,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZICSR,
 	KVM_RISCV_ISA_EXT_ZIFENCEI,
 	KVM_RISCV_ISA_EXT_ZIHPM,
+	KVM_RISCV_ISA_EXT_SMSTATEEN,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 43d955eca286..7ce250087aed 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -469,6 +469,16 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 
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
@@ -488,6 +498,11 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
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
