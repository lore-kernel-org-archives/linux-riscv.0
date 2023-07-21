Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E024FEB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 07:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAJkGayy8dnvCHgAT0Ks0VviUxsrCMUlsiosD9FrgSE=; b=SSfVZVp+iCjm4d
	mQp9mTixogovjtVQAfpV/cqNyoRcVimucxxrK1R6U2pUUomXPwQu4xOXSQKowhMH59iBeY8oA3CBJ
	42VoJPxwHGTptZcaIkqWjhvdl+5NaZJMpuXXgZUTEXjRCCDr/sujmDWVH3uEIVveDqcPe96ijArW/
	VoOaM+dt70rUg9980fA0PFJYCdPjGO6M7L6qTvknsSBvggdfRb+U7jSe0eHb0z5rdqm830ZVf9jtg
	IPl9vn5YVS+gZlX4y2cwSLl6Fi1DnOfvYT1dUYw4t5O1BlzxcZwnNHsp3e0/juG7I1hWpGZDAXNK4
	PFfm4PBqj79Fj3DrhvTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkya-00DG8F-1u;
	Fri, 21 Jul 2023 07:55:00 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkyY-00DG4x-02
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 07:54:59 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3a3c77e0154so1175361b6e.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 00:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689926094; x=1690530894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlB+T7yzO9OziPQ1iUKQmwo9q1VQUiAhA5RgkQ17Yds=;
        b=BymmVUgtZ4M1uDHMF6FPUgtQUO4JSKtkMw3EOCivaFnfR+JyN3PuAVGURTy7ZgegSo
         cmJ1RTrN6wbtYjPEzCcRXyqqN8c7g5+yWq4VIFclECe773m4qZZ9vUPcbrwdZu5I3hCM
         aIFfBqtAeyfyujmMYpg51suGIVfohN0y3oRO/nBn6NEBT+JmVuBOoTb1YS8ZJ4/B1gsN
         2JJ/IigAjenh+5cw7/tLnQOZD/DCYRZDQHwOK80C4hJjRgEmRe0qXpVUmUol4yKj/GiS
         KtLFg1qi9Mq+G9xC55n5pT71rhBise4+so4Q47RA6/F1K7DERJL/vMmscyksjwtsnQJH
         TcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689926094; x=1690530894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlB+T7yzO9OziPQ1iUKQmwo9q1VQUiAhA5RgkQ17Yds=;
        b=B9eljI8CjMaRbfyZrKl9ZNoCKifGmeA1p4HvxFVtUDanZ1/rNCjHOuYZrsTv/u5pKk
         EqbqtODXjoL37PHheLZpFjhcQG3eCcuZ8jmwVdtHmBL9nGF9zG8fJ364lIo9ss98Bn6t
         Bca13GIHpto/xZDkEQGxRLxF1EbI7i7dRUyRkvMGSLOUnTWL6E4Q1LZ0bkK0oO1QHAMQ
         pi2Kdw2cj9LxokmiBAzxB8GdYTVezgpKboox9lphVllF/yG0T2MZIWvdeDMrUtxcipMJ
         P6ggrrVgIbfVJsG2wdLkKyEW7gwYw1jbhb82mvkTz8MYAPXlMlQo/AaK6mIrrUIv6RB2
         f7Sg==
X-Gm-Message-State: ABy/qLaJq0GAEZdFs/No1nHMZe4fot6lRXXioNJriKV9Ajzjs9HAB2gh
	Gg2HV2GeGggHkBrrOIM7xxCqqg==
X-Google-Smtp-Source: APBJJlGYTpJtaWwlhs8n0NzK55RLP7Drr3jY9wVN3NIGLZPTFNkmJWbEwzWdzLxR7VmTtiI5wBJMGA==
X-Received: by 2002:a54:4784:0:b0:3a3:7b77:bb2d with SMTP id o4-20020a544784000000b003a37b77bb2dmr1293180oic.13.1689926094109;
        Fri, 21 Jul 2023 00:54:54 -0700 (PDT)
Received: from mchitale-vm.. ([117.99.250.48])
        by smtp.googlemail.com with ESMTPSA id gw15-20020a17090b0a4f00b00267bb769652sm2026354pjb.6.2023.07.21.00.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 00:54:53 -0700 (PDT)
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
Subject: [PATCH v2 2/6] RISC-V: KVM: Add kvm_vcpu_config
Date: Fri, 21 Jul 2023 13:24:35 +0530
Message-Id: <20230721075439.454473-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721075439.454473-1-mchitale@ventanamicro.com>
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_005458_049292_D4AED0A9 
X-CRM114-Status: GOOD (  13.30  )
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
