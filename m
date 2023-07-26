Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1ABC001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 08:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hwqBolMThaqGn5bGlqMNQGoMrLspiVIRq3JvoHlRCtw=; b=jntk+Hs+KSP+fm
	qPkUV5AlQztM3AgnUHJNchfrW8knBsgxQEHqzZuwxXmdoSGQkmOG7KjDUXMadDzVktME8jRwThNzy
	UBvaKb5LPERMIlJ5onf12QhO1cmkpgI1UJoiMDFcsTh73R72i4yhfWIzEY+CVz3xvfYjJYuawDN1G
	Ri5II02dZMz0HkSkTM25146mvbyufE1VyojAMV7MGPt6W/zWnDQyMTU3576pcOechqi8WrF8/pRtC
	o9e0lM99KF76qsVnfHuKxu1vQJjr2/VZuMR1K8ebPBFAJQ6vQw1ASuKOMDytoWfGEXBn0yqQ6LzrQ
	TK8O1YT+YWKjiRZ73V+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOa8M-009cK8-37;
	Wed, 26 Jul 2023 08:44:38 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOa8K-009cFW-0p
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 08:44:37 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bb7b8390e8so21056885ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jul 2023 01:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690361074; x=1690965874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S83lKR12v2b2CNGJrryAuoUc3tc0JGwPpbCg6Cfe0sw=;
        b=l2nOi3hjUjFYAo6UFU2jZf5p8Gl38Itq2YMWjZ7bvNI/X/4dFCvWvAAlE82lz9yoXA
         dL2dwlNoAg9jlrI/9cgJJAiwIO4XTwJnaX2mObAPSRDfZRhojD1wMi5WO4e8od/UC/mS
         PuZUeJqr/yc2wiryM5ymzvv6HzsSqmWQ/qwRwatuAjQcazaxdp7XiXwy3IiYZgrZx4EF
         HaUXM4Ly2TuAd1FuhcC5ZrmTCbEKlNucs5nik9N/rvOMtMomqgO6gVZovtQW/QKnAXaU
         6UE7YPwM2WSX7htDvElxOBO6VAsibhSp3CwXluVDCofEQ4AZKOhonc0tRKA4dpNmVlhM
         7JxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690361074; x=1690965874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S83lKR12v2b2CNGJrryAuoUc3tc0JGwPpbCg6Cfe0sw=;
        b=W5k/H9yLejLCy5QHAynqqrj88j0zw59nS+gSFhaaDgVVslI8T10/uX2lAfV49AK3SX
         DHxs27lupHISkGExcAgVx+8lG3q65yqmbeTWCIlX1nJgGd4d+1POTaC3Xs65jWBzxQWf
         JPt6Q6kITUKcgKQmaGhx8/fvTVZ9kMrkTPvQAeYclR1ncn/cDqEtLW6xAGg3mgrfHmVS
         pSGCgODoJTo7S6VX49ehWbwU2guQw/T9tgmTCr02bv/2nJaME8QcmwlT4GvpQrQD5WCu
         bvyJLt5VuG5TjXB7nxXC5N+8w/rfwYHGTXp0y65mEL337Dg/AkPAPiJTRo5TwpW0RFXf
         j7AQ==
X-Gm-Message-State: ABy/qLYfPvjYJMChdIn6sg6HjvsSB1u7yjo/ROWqdpOBFL4DXxQWk1jp
	1jo/oJBGtGLLQX8OrpMyxLTk0g==
X-Google-Smtp-Source: APBJJlFV12aMDrfin7w7RiKN4BpdcTNkkbIpQhNmJ8MHeh9fkEHIdAwkqwkq5bxoypKSwltyMqTZ+Q==
X-Received: by 2002:a17:902:e80f:b0:1bb:3406:a612 with SMTP id u15-20020a170902e80f00b001bb3406a612mr1358952plg.57.1690361073815;
        Wed, 26 Jul 2023 01:44:33 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id y19-20020a170902ed5300b001b3bf8001a9sm3978637plb.48.2023.07.26.01.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 01:44:33 -0700 (PDT)
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
Subject: [PATCH v4 6/7] RISCV: KVM: Add sstateen0 context save/restore
Date: Wed, 26 Jul 2023 14:13:51 +0530
Message-Id: <20230726084352.2136377-7-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726084352.2136377-1-mchitale@ventanamicro.com>
References: <20230726084352.2136377-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_014436_321255_F415CA20 
X-CRM114-Status: GOOD (  13.16  )
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
index 53d1c7e1eea4..6d614022bf3e 100644
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
index 0f4f0d6032cc..30dd9e3261dd 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -603,16 +603,28 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
 
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
