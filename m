Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91415EE01E3
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 16:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ljL1AAYwPyo4sEVKPKtholTg8W+RtkwdtKUQwgRR74=; b=G9qjitd1hAcwB8
	lPaC8/staLxg6DSzbdu2prziqiXxpnAEQmrQmb/NpzXn1O8yDiLDLL04pAGI3iEx2x090hct7Wk/E
	HL+6dt2xE8nsy/L4T/PGGyspnWDpsAmlC63qcK8RHbiCM7T2aqs6Yl4njhzOtI26Fv5CV7meoiNwG
	S86Q6w+iaYy0iY0inCWp6RYMnqafhOpMRRS0vNDEnufKFC26DaeespX2nNIvqI2Ri7YyCw/ligrjw
	gGfNHHE/L7kOIt3WeU9Ay0xZlRdFN/jrk01OfUZ3aIgqFTK0RkZ2Dgdv/s527AQcbVaoCch9GoMM+
	jQWwyT/vX3AgLTSyeoVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSvz-006NYC-0J;
	Wed, 13 Sep 2023 16:41:47 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSuE-006Lg4-0R
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 16:40:01 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c397ed8681so36977955ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 09:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694623196; x=1695227996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYDRJiuBD3RAcqDx73Ux/nLyrwlnx8ueFau/sA3uZYI=;
        b=TJ5uAkW+H9iSpuu0shk7EzQpuOxiiKOPZdaNLSuDNRkCiIpn9Ml7LI7tZ+MORzYCd6
         NBORwkrjwcVFdbNfczpkATGBmOQunI3pDd6J/fl0MzicFAdh0v9uNEYGUN2TDYcXPjLI
         LMBVBCbD9z62orfUaWcGXyoI3g/ES0Rl/G7zmw31fyB8UisEgGnYt4FLrfU7yPOla9eE
         PgyfxmHY/UaYeGYEtI02E5PD1MPFvBQ0U8uBp1l4dML+4Jw+mKC2hKsKI6GUqoRXMgtz
         MtBGVAFSqvvS4MG7vXplEKQJkQATPARknIrNHYP8tqia9m9yopEdajwaHemYpTpfcniR
         iTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694623196; x=1695227996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYDRJiuBD3RAcqDx73Ux/nLyrwlnx8ueFau/sA3uZYI=;
        b=wqciNFoBC+VV8Y0zR+m9uM/4vFvk76sM0RXeO75aWaJQRIp6nwQM3laVcihlr3sbL1
         Ad1qzzMUpD7479fUivbQBLws3PzLkgiWvpVEhU+PdgPki8Ogbv8+SMiLdGe6JKpdm1Fv
         k5Ip8TrANyugif7lCL7ktBL6CG679PvKx3mrnVCbszqrAI4j4XihHRu8bDm9H+YwV6y8
         pjFknW9qOpTygCeAlNVPeUkWfXLY0K5lqaPzJHyme5CVGplLiGAfZ1ydgyq+Qs0TPgBN
         fGr3jF3ACbJYls7DHJzz39SMtyeATXZPW5JBE32lNkDOX03ePCriWqAX/Psq3ke8DLM+
         4gEA==
X-Gm-Message-State: AOJu0YwtcOAzw/h8B3Zv5zIa45oRCX7uuGHF0RAON1UAxfzmj+vyZ3b4
	yGdxmND8SXgvwxP/A+v6oQBmQw==
X-Google-Smtp-Source: AGHT+IHvHkg0K9fUNHGZsY0kRevo6XMN3D+oDkhaUNqRzR3v0oIYVFFlM4+7qJ3EmyjyW+dVWjO+5g==
X-Received: by 2002:a17:902:7084:b0:1c0:d17a:bfe9 with SMTP id z4-20020a170902708400b001c0d17abfe9mr2334282plk.46.1694623196030;
        Wed, 13 Sep 2023 09:39:56 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id je15-20020a170903264f00b001b243a20f26sm10577756plb.273.2023.09.13.09.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 09:39:55 -0700 (PDT)
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
Subject: [PATCH v5 4/7] RISC-V: KVM: Enable Smstateen accesses
Date: Wed, 13 Sep 2023 22:09:02 +0530
Message-Id: <20230913163905.480819-5-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913163905.480819-1-mchitale@ventanamicro.com>
References: <20230913163905.480819-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_093958_202615_1BBB7480 
X-CRM114-Status: GOOD (  12.88  )
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
 arch/riscv/kvm/vcpu_onereg.c      |  1 +
 5 files changed, 34 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 777cb8299551..5717004d80fb 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -203,6 +203,18 @@
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
@@ -349,6 +361,10 @@
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
index 4f787dce4da1..50f3d6393d50 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -166,6 +166,7 @@ struct kvm_vcpu_csr {
 
 struct kvm_vcpu_config {
 	u64 henvcfg;
+	u64 hstateen0;
 };
 
 struct kvm_vcpu_arch {
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 992c5e407104..12c17656c156 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -131,6 +131,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZICSR,
 	KVM_RISCV_ISA_EXT_ZIFENCEI,
 	KVM_RISCV_ISA_EXT_ZIHPM,
+	KVM_RISCV_ISA_EXT_SMSTATEEN,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index c5eccc798e70..417e257e05e1 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -487,6 +487,16 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 
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
@@ -506,6 +516,11 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	csr_write(CSR_HENVCFG, cfg->henvcfg);
 	if (IS_ENABLED(CONFIG_32BIT))
 		csr_write(CSR_HENVCFGH, cfg->henvcfg >> 32);
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
+		csr_write(CSR_HSTATEEN0, cfg->hstateen0);
+		if (IS_ENABLED(CONFIG_32BIT))
+			csr_write(CSR_HSTATEEN0H, cfg->hstateen0 >> 32);
+	}
 
 	kvm_riscv_gstage_update_hgatp(vcpu);
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 1b7e9fa265cb..cfd4890612e1 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -49,6 +49,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZIFENCEI),
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 	KVM_ISA_EXT_ARR(ZIHPM),
+	KVM_ISA_EXT_ARR(SMSTATEEN),
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
