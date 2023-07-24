Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CB4C001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 14:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osZxPmoC3j/L8tROuBhhkgJH+JS/3nidhXO4brVsdMI=; b=BO9yLI8htacyXp
	502xs3wkRHDQ42wANbjUjKY+fsu/0zba0wJNQqlEjL1c+dUDfaf+mucrVGmJ28PGnptmGcuGxOIDc
	jRqqv39Fu38D+fi1vrzUOEPJd04huRvrICLhirmcM5irkBnXU+VE5KZ4hxtNY9EjxW+ZM5cINHRR/
	oisSe1tptpW3QfuebhOTpXa5ipxfPchuqrWqdsjLh72mni55bEeJE7BTo6hDNAK/10iybcQ1xXQRL
	ng8gQGWCuguMLFcDqh1vOEf6r4Y3DWAZaOyNIPYTDjhzLIVbPtDCvSI/rjD6KRQnqJxJzeNJebBjn
	niG/AG6dLphl02EFtawA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwQp-004add-30;
	Mon, 24 Jul 2023 14:21:03 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwQn-004abj-1L
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 14:21:03 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bb7b8390e8so8423715ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690208460; x=1690813260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/Xdg8XbbVT22KHgRAU3cUFwRbEnJ1pB0f6Hw3GSNwE=;
        b=cFC6P1d99IQ3kPlBukdOvwlmm747gDcxwx4/NNdg8egywEvP50l5bYdxGqDfcoBcG3
         4vzs6S675+i3g0a3+zZdXizye0oWtLY0WSsIg03tw2PKQ+k3LRu+/v7LKEcHZfI01OMk
         TZxZ5AdAlYc4UCFA2XDhdlObnzF9idf5OdGoC6JEOQwdi4EpN7NT2zM6jSO1OriRQ272
         oOxKeFFyOQSuutCQfduOZv6YvtLv3YV+Vq37ESXE6MV9klNXges3FrR8JJAvM3vpNtKS
         g1X5UKLipEqxetUE/RhFtw+4zarAhl/oWimDKvNgukvs9x8hlrVguNS1xCfhoy7xlCDZ
         L8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690208460; x=1690813260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/Xdg8XbbVT22KHgRAU3cUFwRbEnJ1pB0f6Hw3GSNwE=;
        b=KFR16rmbirQt3uRycGqb5Wl813qhVnGc1mk2srqghQ/uVj4HxaGUxnvk40hyZbs54W
         gvrzr0Bn59tsPexoW7Ew8wNc/iQBTnZKsp7ddnSzHyYV07MCCHTiB42k6KjYfI3czVB4
         nZERi58dPjPqiwF0EF9pQvL7bskinaP4EQjYaPe10i2nNOIFmeatbfWuZOolRjUeTGwY
         di0uUNnHAGfcWnOiwkVifhggwdm+ZbnhgsT16C8XVx0VrDtZRxrMQyuny5af/bz+/lNW
         SeRm/PUPsOH4Xi0+/HMxcLz71XN+XD+BT6bH3qHEv7roslluvWErvJCWRrn7NdCnpP2B
         NINA==
X-Gm-Message-State: ABy/qLaBivq3/dm5HISeTOzDPIwrQmqYfQqbE0s2aC7NeVy6WaHVnp5B
	EAOQmucUG/aqbfWiqQDwYCD3qg==
X-Google-Smtp-Source: APBJJlGtuSUXWx8QiCNhM0KKMAFADs7SoqRSqjxQ03zVOl9UAeikqFuj7I16Fv2eRG+VZ39xprJCiQ==
X-Received: by 2002:a17:902:8547:b0:1bb:7b6c:9837 with SMTP id d7-20020a170902854700b001bb7b6c9837mr4455102plo.49.1690208459919;
        Mon, 24 Jul 2023 07:20:59 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id s10-20020a170902a50a00b001b8307c81c8sm9009821plq.121.2023.07.24.07.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 07:20:59 -0700 (PDT)
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
Subject: [PATCH v3 3/7] RISC-V: KVM: Add kvm_vcpu_config
Date: Mon, 24 Jul 2023 19:50:29 +0530
Message-Id: <20230724142033.306538-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724142033.306538-1-mchitale@ventanamicro.com>
References: <20230724142033.306538-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_072101_457015_640C9290 
X-CRM114-Status: GOOD (  13.62  )
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
index 2d8ee53b66c7..c0c50b4b3394 100644
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
index d12ef99901fc..e01f47bb636f 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -980,31 +980,28 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
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
@@ -1015,8 +1012,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	csr_write(CSR_VSTVAL, csr->vstval);
 	csr_write(CSR_HVIP, csr->hvip);
 	csr_write(CSR_VSATP, csr->vsatp);
-
-	kvm_riscv_vcpu_update_config(vcpu->arch.isa);
+	csr_write(CSR_HENVCFG, cfg->henvcfg);
+	if (IS_ENABLED(CONFIG_32BIT))
+		csr_write(CSR_HENVCFGH, cfg->henvcfg >> 32);
 
 	kvm_riscv_gstage_update_hgatp(vcpu);
 
@@ -1136,6 +1134,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
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
