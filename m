Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74275C001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 14:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHsqS2lJ3cxR5Z5Rf4GoKNaKfbBvzu8D3KgnOb4u0TA=; b=suXDH+nQ69O/S7
	D18MIKm7cInXczT000jbQphL9fpBtXWQlzSXDpS+SpaK936F38U6Cy2QnaX3n57vj589vMCzmeZMD
	fUDRqG87Tv+EXOUxajyMlQU7DLxZH3STNewRcbqEszHWVIFBWeSU4tEbWqOMpUQvMtUcJ5e3xZuth
	/bbIjbqkYFTRltkd9FP7h9Qse6q6GTQWjPtJC1nmu25zF467H9VCmoHz2Yx0/rOaqq/9axVONEM6g
	gaHHEsTJGSI5f7ey287rkO8yGMR5MLKA1hqtnenKiQH1pbfMjzt6Kyt5Ui1K7Ka84SobTDTDErRHZ
	DX2BAM+1MOfLkYhNyyCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwR7-004anv-0B;
	Mon, 24 Jul 2023 14:21:21 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwR3-004alB-1P
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 14:21:18 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bb8e45185bso6558345ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 07:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690208477; x=1690813277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeBit2HNTThkMI6F9leen3WIW5NeA5jHqdoTdMy2SDk=;
        b=INcMG8ZHx0b8yfXTa2Nj1yn9yJzBsKD7W25MzHKKGgHItU7yakStopz7HNm1MSMcTJ
         AtsmHaKRlKVr8GCryip+h5f6EYkGEqmZVziwvppe324DWYDe67Q8sxaWt9fqAVuaI5mc
         k4q07y4+Fqe+pk3oi25OcyYeNOp2AqMZmsmKRA8VA5NZ3QoLZNeqmM07GY7B5+d+ybR0
         ez/vhIhy8dvyUPUasZpRb9ih8g7BTuCvNzVMzqSOn+z7Qyh0OHubG6bcV5K8zPdFZEcv
         lNZQe0+2tB9lShpnD+DZJ1r8dKIqhjmmD6NJaHS7YzUEonqwJwT+ECR7sla0J4k2fIvc
         WldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690208477; x=1690813277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jeBit2HNTThkMI6F9leen3WIW5NeA5jHqdoTdMy2SDk=;
        b=HRuZ3TWLA9cdbvQQ08+9I+INczoqnflLwd5NAPo051/Lqlpl1SvfiYwnSTvmgOuyeo
         doWDdkVAp1AFSo7hMNT4ZPFqpbjmd5fLeaiQLnp50/leQEU5bP1slXBwWLPMG81t5dN8
         fJGR+keI/u4vgxc2GL8e7DpEmKjJZaqwadyZMTf9F2cwBlFc1cYcZHC4ek9SBf686S7U
         RxFDsYVALljVNo4vLO1WbV4yMlqxdWhp6afy35u+azdFK4ZGMnNMO4MlBrKdu5J3KC/z
         A6+gJfShBQzqZtfMFjiQKMAkJMF6+4WaBolJSQd4dy3V/Wq+HWH86Ksy9Pb1I/ixCbJS
         swFA==
X-Gm-Message-State: ABy/qLZ95QImAIx78MoMXtvDVpMg9XALO02Kjnd2DyC8qkOBKKn8xtIn
	IL73l2EdYx24K9JFd/XDQBboHA==
X-Google-Smtp-Source: APBJJlHyb3xgYcT32yxcD6LZM8/JX0OSj9UH9wSW6Xf5zDVZwj+PE3K8EqFFsMz45s2HtuqN8R5IZg==
X-Received: by 2002:a17:902:8693:b0:1b1:753a:49ce with SMTP id g19-20020a170902869300b001b1753a49cemr689867plo.53.1690208476936;
        Mon, 24 Jul 2023 07:21:16 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id s10-20020a170902a50a00b001b8307c81c8sm9009821plq.121.2023.07.24.07.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 07:21:16 -0700 (PDT)
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
Subject: [PATCH v3 6/7] RISCV: KVM: Add sstateen0 context save/restore
Date: Mon, 24 Jul 2023 19:50:32 +0530
Message-Id: <20230724142033.306538-7-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724142033.306538-1-mchitale@ventanamicro.com>
References: <20230724142033.306538-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_072117_477641_181ADEC3 
X-CRM114-Status: GOOD (  12.95  )
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
index b52270278733..5168f37d8e75 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -286,6 +286,7 @@
 #define CSR_STVEC		0x105
 #define CSR_SCOUNTEREN		0x106
 #define CSR_SENVCFG		0x10a
+#define CSR_SSTATEEN0		0x10c
 #define CSR_SSCRATCH		0x140
 #define CSR_SEPC		0x141
 #define CSR_SCAUSE		0x142
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index c3cc0cb39cf8..c9837772b109 100644
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
index 5764d22efa29..1f8e8b5f659b 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -1131,16 +1131,28 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
 
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
