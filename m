Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A97FEE01E3
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjd+m7/ZesAhkN930iMwe7KOuO2LoDddtWiXzmZkSpE=; b=YKmmzg/EDVnBFk
	QFps1DBzAAs1pi9NdQpHXtrniNesS614layfo+dQPv0MYl9u56oJHp6624A9lBhzdhpFQCCDomTaQ
	/treVU9tJK4oA1FqW2CxRGEjV647qMBrNgMI8b7ktSE7SUYWPEEJkftJ7clcXyo3J6i/N+81KmMUn
	GCF5+x6CponJPTC7TMlR2BPNB41LbrW1QmHZ/RQXgamsL4Nn32CJBVbRxW+La1DQJKfngxnckTVGm
	LVPI85bcC2PuU5j23GhzwvUI3njWxjzdQaLpFieZzuIe4eBRLlp1kx4dc5mWUJrZYtLiHea0oK8xU
	pjP1+ZyzRJTbdfZPtT6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSx2-006P28-18;
	Wed, 13 Sep 2023 16:42:52 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSuU-006Lx2-38
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 16:40:19 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-68fb5bd8f02so3499068b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 09:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694623212; x=1695228012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qenuytjXSLiGJ5kC+qcQ9TcZYC4A59ZzfaqAy8GW1hM=;
        b=LfzuEBwFHi9xNDoqcFrWfUmj4rn7UuDXJHQtyVVLpsc6eMi9OR9VH0jcNzCR7E366P
         4jx0XhlVg5Wp0X2jV0aupMNyjERqJnoCfyD9+lmVv3pOD1rAMxl7zMbC1JYJ+8QU7JxK
         NxxdXjiH4uo6jGLovhrxg4eWkBjDEYRFGFmqHt+h9DwaAHBLoqLe7rxM2YFCWN4DStSN
         IhinxJRdPRKdZcLsIPQ+KoT0OzCvPz4e5xx33+xdHjy6mZPaOXbCMb6kuMR3jJ+Fl9Q5
         0QjiJKcNZzrtgb6WOxAvcUBfF2qsgeZeQuX2ci/ol/Yd59nJmEA/L4QHUJbjbx1+fiur
         vzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694623212; x=1695228012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qenuytjXSLiGJ5kC+qcQ9TcZYC4A59ZzfaqAy8GW1hM=;
        b=ATVUpVGPlurgFcypyVMzT9K7fhIb2Etgudme7nsZBwvLoLyrmflvIjjiaJmTsQh7Th
         8f1fdXOgYUe8BD+vA/gobQhg78ZWVVI6Er1NdzewkASNgPWbGqMwbJUs6oIfpuoWhogn
         v/CDqjtFqG3itPrjewPExR4e9sk8vhtl0Nbb8Z+V+X94c7QvGbuR7eG93I8OJdrY3ZWW
         ai8vwXYUeN79JoWmCsKretah5HDdJsRDcyiVsr7renXHTxcxat6FZqMmdSuIBEKmFp7u
         GvSj0tNSMjkQC9qhQVBCbAAozcBqvJn8MTCFaD4dYxOFkxpOPJ3qlQMRjArghz/iCFyV
         la3w==
X-Gm-Message-State: AOJu0YxdBxsdUTE/N2wz2PFuW/K/GsKCXlSqfD4ha2dEKtcAI0loEgxl
	fCfotLoCZqkDgPcBGMDC1JA7Iw==
X-Google-Smtp-Source: AGHT+IEdFy3Ow6J8ZnhgA5RICyAg1M67g+2y3qpcX9JXSprca6USli5lcOy8CCm03zHegv6l3xiriQ==
X-Received: by 2002:a05:6a20:d426:b0:14c:6cd9:bf9d with SMTP id il38-20020a056a20d42600b0014c6cd9bf9dmr2589416pzb.35.1694623212048;
        Wed, 13 Sep 2023 09:40:12 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id je15-20020a170903264f00b001b243a20f26sm10577756plb.273.2023.09.13.09.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 09:40:11 -0700 (PDT)
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
Subject: [PATCH v5 6/7] RISCV: KVM: Add sstateen0 context save/restore
Date: Wed, 13 Sep 2023 22:09:04 +0530
Message-Id: <20230913163905.480819-7-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913163905.480819-1-mchitale@ventanamicro.com>
References: <20230913163905.480819-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_094015_243714_43CEB18A 
X-CRM114-Status: GOOD (  12.73  )
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

Define sstateen0 and add sstateen0 save/restore for guest VCPUs.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/csr.h      |  1 +
 arch/riscv/include/asm/kvm_host.h |  8 ++++++++
 arch/riscv/kvm/vcpu.c             | 12 ++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 65b871dbf7e8..306a19a5509c 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -288,6 +288,7 @@
 #define CSR_STVEC		0x105
 #define CSR_SCOUNTEREN		0x106
 #define CSR_SENVCFG		0x10a
+#define CSR_SSTATEEN0		0x10c
 #define CSR_SSCRATCH		0x140
 #define CSR_SEPC		0x141
 #define CSR_SCAUSE		0x142
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 1980be6a3e79..0eefd9c991ae 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -170,6 +170,10 @@ struct kvm_vcpu_config {
 	u64 hstateen0;
 };
 
+struct kvm_vcpu_smstateen_csr {
+	unsigned long sstateen0;
+};
+
 struct kvm_vcpu_arch {
 	/* VCPU ran at least once */
 	bool ran_atleast_once;
@@ -190,6 +194,7 @@ struct kvm_vcpu_arch {
 	unsigned long host_stvec;
 	unsigned long host_scounteren;
 	unsigned long host_senvcfg;
+	unsigned long host_sstateen0;
 
 	/* CPU context of Host */
 	struct kvm_cpu_context host_context;
@@ -200,6 +205,9 @@ struct kvm_vcpu_arch {
 	/* CPU CSR context of Guest VCPU */
 	struct kvm_vcpu_csr guest_csr;
 
+	/* CPU Smstateen CSR context of Guest VCPU */
+	struct kvm_vcpu_smstateen_csr smstateen_csr;
+
 	/* CPU context upon Guest VCPU reset */
 	struct kvm_cpu_context guest_reset_context;
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 3013ae30c3af..c061a1c5fe98 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -621,16 +621,28 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
 
 static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *vcpu)
 {
+	struct kvm_vcpu_smstateen_csr *smcsr = &vcpu->arch.smstateen_csr;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
 	vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN) &&
+	    (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
+		vcpu->arch.host_sstateen0 = csr_swap(CSR_SSTATEEN0,
+						     smcsr->sstateen0);
 }
 
 static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *vcpu)
 {
+	struct kvm_vcpu_smstateen_csr *smcsr = &vcpu->arch.smstateen_csr;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
 	csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN) &&
+	    (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
+		smcsr->sstateen0 = csr_swap(CSR_SSTATEEN0,
+					    vcpu->arch.host_sstateen0);
 }
 
 /*
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
