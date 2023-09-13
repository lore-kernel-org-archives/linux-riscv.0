Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1784EE01EA
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 16:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5cEhhY6GCF02yyQdVUvgtJeMX1iXiY4lmwWrf0+Fsg=; b=TTPAiyHiq/8Y2x
	JzvrzZ+8lEqCTLDMCqdPIkiiK1NHBDaSKlhRrCuuwtNM+M08dmfjtKWTA2QcAWyktFNEaKAXXO+Pz
	uCAbublj+ds//Wv1rtT6xgoVjQJ2itMD3+F22SUFqspxaOey+0LBrL0iOyF6dW/axwBi0PginDiZw
	QPMQ3O8j2ySVrWdHVlFZx08br9uXNjFQagdxZiGgM3hlqy6r711slU7aJqnv3/4sS+jrlk6k1g0Mc
	+S/DJGsttEkH/ZRgTILcaOAimruNCBfdQlNrGbTlPgqMJiVM3/J9tpEnLTebxwRUHPx78O52Fukc4
	2yeXNwbFgGnmZWsLhwVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSwH-006NvS-0p;
	Wed, 13 Sep 2023 16:42:05 +0000
Received: from mail-pl1-f174.google.com ([209.85.214.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSuE-006Lbk-1a
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 16:40:03 +0000
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1c328b53aeaso61669105ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 09:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694623188; x=1695227988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYz4k24zMtr5gZHYtO5bST36P8q1h/WD//KNtxxmAkA=;
        b=RATtxyQ3xYJTs3lRz6EOAg0V2VKk2fM8QmLstZzaJop+TjiekwjmiS8Yq5PSaBQV5g
         uQWvjfZ53WLt3VVwpQfio/1GVHqCPstd85uNVsQvG9WjLEr8CCxOeSDvayh3mUtC6QWR
         buRT+FCEdCXR9G6NYwgbBEpFZMZ9EBU/l7FxyfPFQo2214ItaIwMOg7rs8LXVF7Y6T80
         qEVzB1izFMXNADJJIZqBUFf6eL2KZxx7ej9R89OCqwrzGUlnXD40m7ndAgw+Jn5EiaJI
         fg1CPz71VzULv0etApXHvubM/xG0yWNdYxtVIDK7zQj2nkXSZcgZ7ptOUoH6c6lZU9BM
         qFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694623188; x=1695227988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYz4k24zMtr5gZHYtO5bST36P8q1h/WD//KNtxxmAkA=;
        b=rkm6WkQ2Phn2O6Z5jLQEZOsGIvGJcNjlS1VUnv+cFVFyzd9CBA8UoBkAPPCPL/6YXI
         JXBiVRHk5spj8E2kiWXKDoJYg0p6FeZKKXfc2jw6OO0vyViA7baXpRyn+PHYJQPGVL11
         9LbBjDr1edKpX4E1istXrWoCXcfJ71lgau3qEEXrEZbplczcfOh+AMAXIqmu3faK2FUP
         A+UVIpycwipxZZ93bO6EAAqMx9Q/GcUYlRp5fq6OjY6QEE5K4RwtKJlu/pJnG+M57z8k
         RYUiFlZ9/AIgrGhhRoK/+g1Swe8nveYc2vMZqjhNpj2HDu1EItB/rGRlgGbI/FqrHJVj
         JS4g==
X-Gm-Message-State: AOJu0YzoXfHDuVBgFQhSoXCYyyw38yPKrSEIfQdfV+jT9D6h2DsQtvpu
	Rrdv0ieBcWAwNhNYgS/bq8Rh4w==
X-Google-Smtp-Source: AGHT+IG7+5qgQG54ROhrCCs5+OFiCPAzMpczcW5IDb/EpJaOo7GcfTxE44eHLM2dS4XQR8xhcSUkmw==
X-Received: by 2002:a17:903:26c3:b0:1c0:afdb:1e6c with SMTP id jg3-20020a17090326c300b001c0afdb1e6cmr3124382plb.8.1694623187952;
        Wed, 13 Sep 2023 09:39:47 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id je15-20020a170903264f00b001b243a20f26sm10577756plb.273.2023.09.13.09.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 09:39:47 -0700 (PDT)
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
Subject: [PATCH v5 3/7] RISC-V: KVM: Add kvm_vcpu_config
Date: Wed, 13 Sep 2023 22:09:01 +0530
Message-Id: <20230913163905.480819-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913163905.480819-1-mchitale@ventanamicro.com>
References: <20230913163905.480819-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_093958_748129_908B8F15 
X-CRM114-Status: GOOD (  13.40  )
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
index 1ebf20dfbaa6..4f787dce4da1 100644
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
index 82229db1ce73..c5eccc798e70 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -471,31 +471,28 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
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
@@ -506,8 +503,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	csr_write(CSR_VSTVAL, csr->vstval);
 	csr_write(CSR_HVIP, csr->hvip);
 	csr_write(CSR_VSATP, csr->vsatp);
-
-	kvm_riscv_vcpu_update_config(vcpu->arch.isa);
+	csr_write(CSR_HENVCFG, cfg->henvcfg);
+	if (IS_ENABLED(CONFIG_32BIT))
+		csr_write(CSR_HENVCFGH, cfg->henvcfg >> 32);
 
 	kvm_riscv_gstage_update_hgatp(vcpu);
 
@@ -627,6 +625,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
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
