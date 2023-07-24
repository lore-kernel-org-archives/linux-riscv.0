Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAAFC001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 14:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SAwuJotNvoZucF4fJsGijdW2WdDGAmhz0x1twCfYWQI=; b=nOyhPDCzRAfG2U
	HUUhtMwfKgEYvBUWfVRS14SLF3Lo1L0910lzoi7gx5SMgUZVXwX7AXXX32YwaQldC+iv01+X7GJsY
	4ADC4US3sS5rO2w6DzngPDy4yytU3gBiPRGeK0Wutwbo71Glorti7sXYMaRDSHxRn4zg7lt+yMJD/
	Ad5zI8RSCadkncA7tVIahWiF5iz5Cw2Ev61lYQWQctheNlQ8IGccz3rG9KBscggexCK1MBitJdfob
	pVxcGo/XUkoLicYCPKtFUPQv5IczbQZBNZcwbdKE0BX8o+l2HPet3WotEpyeNO5GlY89IPFn+Mgek
	vGqhSkllD5CsPAFkFXhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwQu-004agN-2s;
	Mon, 24 Jul 2023 14:21:08 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwQs-004aes-0U
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 14:21:07 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b9e93a538dso22240305ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 07:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690208465; x=1690813265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55wynEDcDz+Q3KKi4FYGJKBhw76WCDMX7ZEgaQ6AiPs=;
        b=XvpHNBgW2Zs9pL5s/H0k4VA6f2+AGdg2vISe6ZgjLfek83l8Pa3WDXuvftHJp0e7Ne
         ea51gqBBQ1USBDoYsARJDuL5o7S9qoghY+FIw94gteCa5Ioru5b/lgdL9jg0hYE7TA7p
         zhZ7bfE4TW2Zb7CQBMTjVnJza9ikE9ejTPlZlN1Jr8P12lUS98YYSNux+8aYw5+Zv9TD
         c33/n9jVvQVnucjdBVRM1xekKifGLnBspZpGfsfmp0ojCqCqwB9YksPZQp1LZpH6RIBB
         pgy4wmw7duNh+vJul5I4eDtwxDyARmEaxOzn+00v/9XqIKxEYkLjsAX1HFrxAKN+mcxx
         FpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690208465; x=1690813265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55wynEDcDz+Q3KKi4FYGJKBhw76WCDMX7ZEgaQ6AiPs=;
        b=WXo+vY8v6fZ3bURnRmuL1DCu44yHaB5aogP+Rdyq8Ma8A98aYv2E/qcwq4I8zopazp
         jJM9iZ5HOBCLAGr4o44Aghuiq4z5GvQO0hsjI0PIHbJyk5sp4yiMrlFbTvHz2QevYy5c
         8AMm963nIuPnnAZG6+Tsjn6JSPZns4Ju4aINV/ZMAIrV/qNw2j9bY8U8gxbmj9Si0MjZ
         StbazyTQ95Gl544V5zFs3heu0sYWqqBorJb9kP0RV18weHCKBiW/SiVc3cVGIfkcUBfQ
         4MDXw1wJbXbQ9ua1k0QR3m0940FJSebm1fH4L1ztsYDo2QJU6VRZ0iezLOCjbpZ6e9MW
         C4DQ==
X-Gm-Message-State: ABy/qLZ7EZyiHODSaQhkp6Ne1GOOZ2oar6jMXeve3tp0BQM2O9JMuuGO
	oPxUy4owAkXmvMx8g2a2W+7hvw==
X-Google-Smtp-Source: APBJJlFqvDZTiOhDlggPQO6QOwhXESMUL3VCGb/cGLcVQWNN18LtUwSKaqWeEKq6ae20r/XbUeYkgQ==
X-Received: by 2002:a17:902:d4d2:b0:1b8:b4d5:4c3d with SMTP id o18-20020a170902d4d200b001b8b4d54c3dmr8515161plg.51.1690208465490;
        Mon, 24 Jul 2023 07:21:05 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id s10-20020a170902a50a00b001b8307c81c8sm9009821plq.121.2023.07.24.07.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 07:21:05 -0700 (PDT)
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
Subject: [PATCH v3 4/7] RISC-V: KVM: Enable Smstateen accesses
Date: Mon, 24 Jul 2023 19:50:30 +0530
Message-Id: <20230724142033.306538-5-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724142033.306538-1-mchitale@ventanamicro.com>
References: <20230724142033.306538-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_072106_188807_052907B7 
X-CRM114-Status: GOOD (  13.07  )
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
