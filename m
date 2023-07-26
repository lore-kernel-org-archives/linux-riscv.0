Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD130C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 08:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GKKmLZnmRxQUDQJO5UHF/0+D++1c7gLM/jmUqrPKW18=; b=FEmOAq3j8gLc6y
	fHvk3ypNFGnHXhrAsOAS8IcO4mzbTC4B8ltrjDA/IdL2vu9WzWombKGfD/wKgaM8JnSsILIDLG2nv
	kDToc+/Dspe9FQ9c1jJjaM9ge2ceS3u5LnvUV5nnvrclPpy4ikJnHqUBN3rNetHUKL4BxujpTlSwq
	/rhxrdXlzcDr3BNlQm1/M4331PFlTPPd1AB8pxAQmKzbhmOnI1pFo980GbLmGwf62uab3oPpwH07M
	eL26NrYiKniAGln2/Z52c8gNuvVtnptwgHd/LhfP4jqh+zIs23zcAXd9eAb7J2EyKLOut69M+WcvK
	Hgibig0saDPdUqzCen2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOa88-009c9Z-1D;
	Wed, 26 Jul 2023 08:44:24 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOa85-009c71-1C
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 08:44:23 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b8ad907ba4so34312915ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jul 2023 01:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690361058; x=1690965858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSl78JKjr1Ozi5FVfVkKZdxT71ozQmSZWCuKqW85yyQ=;
        b=AqEQZOAF8/hH3MUoAOP+XSxHAk++rZYA0dqm8HRoAQkIO7MoM2fbaeAjoZuGALh+QL
         +7SLmLuYen/TMdB5lKolShu2TN8tD0H44Os8gvqPNZSTZ8mD6TtzEk5VSzOpVBIIrc+1
         5Jh9SCPpbuCNttNwWm1zqAli2IbOllrmUIOKP/VBMUXKIyzWv4/gAlmGiENgvB5zOlEr
         htNU3JFuqPa6Np6nIrtR1gQacTe94rJOk+kNZOfW74ryGJeFyed7fGkrbv+H8Haz5z69
         RNZuc9RGhJGKDzg66HwmXT4cFAg/OiOFXLBKIt+5hjVgrOZfL+X6ZRiOwmQiPa/OJ59C
         GozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690361058; x=1690965858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSl78JKjr1Ozi5FVfVkKZdxT71ozQmSZWCuKqW85yyQ=;
        b=By3IOATtusdeOr4FbV3zxjkXZfq68AOrLPwE9fddrvjRks675+bxWOn0XssDoK06BS
         NPeRkKYkymAbgPEuHwDCRZO4IvSVabPnabhbVdUU23EtRPKyzWrEQzhjSdYYTQei7p20
         nPBG4BhBo14+uzTxcZ+NH8SgbZ2i64gKnNS/CAyIE/y/TnKpo7neXB2bw2x219+MVgl0
         UFX/DCZ1kDIqunE55ihKPfiUMb4i95fCBVauLuot90M7WVbpHuARAjfE8c3jXxZ9bXX1
         itbtbVbu70/me+Yensqlr4iiGO5OgNjr5Up3YhlBQcAJ9xmVkCqlCz4HVwmcGC5TjhHK
         U6FQ==
X-Gm-Message-State: ABy/qLayvVLpIuItyC42Lv4M2i8Oja2R5RF9Rv97kvPSYL5KTUdxGcUv
	4jnnrjCtXPJbS4zktvrxiqs2jw==
X-Google-Smtp-Source: APBJJlFsfjAuUtDTwjbGLMPtbitCif0Sa9s+E7FgVEnnWkxQxV371oOJKzePeoRwrOEXAKyOueKiuA==
X-Received: by 2002:a17:902:f815:b0:1b5:49fc:e336 with SMTP id ix21-20020a170902f81500b001b549fce336mr990692plb.42.1690361058349;
        Wed, 26 Jul 2023 01:44:18 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id y19-20020a170902ed5300b001b3bf8001a9sm3978637plb.48.2023.07.26.01.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 01:44:18 -0700 (PDT)
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
Subject: [PATCH v4 3/7] RISC-V: KVM: Add kvm_vcpu_config
Date: Wed, 26 Jul 2023 14:13:48 +0530
Message-Id: <20230726084352.2136377-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726084352.2136377-1-mchitale@ventanamicro.com>
References: <20230726084352.2136377-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_014421_410724_A153A7AA 
X-CRM114-Status: GOOD (  13.73  )
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

Add a placeholder for all registers such as henvcfg, hstateen etc
which have 'static' configurations depending on extensions supported by
the guest. The values are derived once and are then subsequently written
to the corresponding CSRs while switching to the vcpu.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h |  7 +++++++
 arch/riscv/kvm/vcpu.c             | 27 ++++++++++++++-------------
 2 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 55bc7bdbff48..c0fb54d164c7 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -164,6 +164,10 @@ struct kvm_vcpu_csr {
 	unsigned long scounteren;
 };
 
+struct kvm_vcpu_config {
+	u64 henvcfg;
+};
+
 struct kvm_vcpu_arch {
 	/* VCPU ran at least once */
 	bool ran_atleast_once;
@@ -244,6 +248,9 @@ struct kvm_vcpu_arch {
 
 	/* Performance monitoring context */
 	struct kvm_pmu pmu_context;
+
+	/* 'static' configurations which are set only once */
+	struct kvm_vcpu_config cfg;
 };
 
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 452d6548e951..43d955eca286 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -453,31 +453,28 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 	return -EINVAL;
 }
 
-static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
+static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 {
-	u64 henvcfg = 0;
+	const unsigned long *isa = vcpu->arch.isa;
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
 	if (riscv_isa_extension_available(isa, SVPBMT))
-		henvcfg |= ENVCFG_PBMTE;
+		cfg->henvcfg |= ENVCFG_PBMTE;
 
 	if (riscv_isa_extension_available(isa, SSTC))
-		henvcfg |= ENVCFG_STCE;
+		cfg->henvcfg |= ENVCFG_STCE;
 
 	if (riscv_isa_extension_available(isa, ZICBOM))
-		henvcfg |= (ENVCFG_CBIE | ENVCFG_CBCFE);
+		cfg->henvcfg |= (ENVCFG_CBIE | ENVCFG_CBCFE);
 
 	if (riscv_isa_extension_available(isa, ZICBOZ))
-		henvcfg |= ENVCFG_CBZE;
-
-	csr_write(CSR_HENVCFG, henvcfg);
-#ifdef CONFIG_32BIT
-	csr_write(CSR_HENVCFGH, henvcfg >> 32);
-#endif
+		cfg->henvcfg |= ENVCFG_CBZE;
 }
 
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
 	csr_write(CSR_VSSTATUS, csr->vsstatus);
 	csr_write(CSR_VSIE, csr->vsie);
@@ -488,8 +485,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	csr_write(CSR_VSTVAL, csr->vstval);
 	csr_write(CSR_HVIP, csr->hvip);
 	csr_write(CSR_VSATP, csr->vsatp);
-
-	kvm_riscv_vcpu_update_config(vcpu->arch.isa);
+	csr_write(CSR_HENVCFG, cfg->henvcfg);
+	if (IS_ENABLED(CONFIG_32BIT))
+		csr_write(CSR_HENVCFGH, cfg->henvcfg >> 32);
 
 	kvm_riscv_gstage_update_hgatp(vcpu);
 
@@ -609,6 +607,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	struct kvm_cpu_trap trap;
 	struct kvm_run *run = vcpu->run;
 
+	if (!vcpu->arch.ran_atleast_once)
+		kvm_riscv_vcpu_setup_config(vcpu);
+
 	/* Mark this VCPU ran at least once */
 	vcpu->arch.ran_atleast_once = true;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
