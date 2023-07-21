Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A12EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 07:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IxUEKDGv15KznNPLo7ZTmUz1cwFEBWL0mFa9aefySUk=; b=khVt/m2uPFzyLx
	3yqtSPOcPzyRw2eLwiB4klmvN5HP/60O8vm7SORun35LoRZ/NwSrHdrDI47clq4atdg+Q0mi9K6Qn
	t2xLY+uCDqVu6I41C2U51W7lFi7hm7FnkoSkeJIYNtPwGAYzsPxxFvjQo7nJ72dfxBdlPTbESNtTk
	4OuhwOQwnFO/b61cb/0A6DnHqXn7fT9jpj9grIaPd6yAiJBimVSDG9Gg5Qadd4ND64jVg1OlSMxAv
	j1WmRDTw8liDFGC/67DrHVL2eyjBL6eSSH0xWqOG9Y5zMf5EROXSLYOJ+XcEwT9pr1d86E0IxTDWz
	LSJRXc6idftaBTQUgDHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkye-00DGB5-0z;
	Fri, 21 Jul 2023 07:55:04 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkyZ-00DG78-24
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 07:55:01 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-263374f2f17so788053a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 00:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689926098; x=1690530898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6URFlWvIburf3cR9HtAr9E2Sh/GiXynH5eeSEzuJxs=;
        b=g6eVzbur7N5OQwGKWU4xOXSsBuUHVlOZBiazQBvBqS8ljMjDSNpMuZBnSXnxMOpVbI
         JKXg9cOdca11E3NxcHEWV9J0GK9MCMoi6/74aQI2hiAUgI8ona9ICMXmQd3pQ2XiBnN6
         1D4nADPGiA181lgkMr5nOulQnOfZiqfb3mgqItN6HDwAZJFfu3wgWU1RoIej+rs5UKaY
         wjYABZYEoKpRLzhRHQXcNd67Exvpr4H1umlh7iRPgZdujcLIocCs/Chcv7uFbjWrwnOw
         zV1pxPpsrFMcp49Y5A/Q71O57EgOzRbhbgRzaa3jOhstGDXhKYc/7DJx4vQE5cY6KA4g
         Rjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689926098; x=1690530898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6URFlWvIburf3cR9HtAr9E2Sh/GiXynH5eeSEzuJxs=;
        b=CBCcsHavqKLtYAMyLbM5pd/O7yP0CKNTT47dWhTC+pWtsrfoRvuqhFhjW0VKbm1uAe
         h4dLAhtcOkVn7YjwshktFXEeuct2zPRzkaPYr4RRdjAPl+7IvuMe9j89ml322pNN3Ri+
         J6p426D3BG6RNe8XDP71Ra4vqsQKsy8sFJQhFj7wxj8VTZ0capmF4K73ZrVbECBvbUML
         gAWyHbmAkowaFqMuRWy8ko/hP7Y901ybjqai02+wGti0hnVWhJir/zOGRipSfEbxgyyB
         tiob5yxo+VZSBsWKUlkJ3eUVN18g4iZTSvJ5EiuNyd1NAmGGNxXegZbFBVx/3i1g2C7r
         efDw==
X-Gm-Message-State: ABy/qLYZ+KxFSvlv+0CmgC2STJgLGa0M5LCRBu3INy2DXVsWTH0swQDA
	vCGNUA7sKDe0wNBhFiqFxYnzWg==
X-Google-Smtp-Source: APBJJlEBmHCRgnhAHXvit81djKdQy7LdYCIoiEcGc1skML726y8vbCjMQEz/JM3FugmIqtTXS8NLZA==
X-Received: by 2002:a17:90b:a55:b0:265:7719:b83e with SMTP id gw21-20020a17090b0a5500b002657719b83emr744753pjb.43.1689926097563;
        Fri, 21 Jul 2023 00:54:57 -0700 (PDT)
Received: from mchitale-vm.. ([117.99.250.48])
        by smtp.googlemail.com with ESMTPSA id gw15-20020a17090b0a4f00b00267bb769652sm2026354pjb.6.2023.07.21.00.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 00:54:57 -0700 (PDT)
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
Subject: [PATCH v2 3/6] RISC-V: KVM: Enable Smstateen accesses
Date: Fri, 21 Jul 2023 13:24:36 +0530
Message-Id: <20230721075439.454473-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721075439.454473-1-mchitale@ventanamicro.com>
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_005459_704105_F83100AE 
X-CRM114-Status: GOOD (  12.38  )
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
