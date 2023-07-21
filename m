Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292B4C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 07:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9iZ8CHpXEFwg8OAxE3hfcZuDnCgIMvrwot2RJCQWNxA=; b=kGx58cDvDJFz79
	Liw+bYHgRTXC81FYnrpKE5l/l8MattRkP99i8BfBY+kqORNFhd3/NIzRWUlVmMxyjPHwtYzJSXknx
	P2129epzMhCDLA2Jaw6FmnDjyHjAauVIGyX5oEZFOiqZkAp9ib79cWhQe3yG5DYVbxFJhSwZTBYPJ
	cirY/bf+Ke7YaGx4Vja9j1tChyk26L/vTuChhlfic/76DEmoBCUkB2XO/jMlwy/wIkMfiDCMkJ2To
	bRX9hqwBOsV0TlZSi8ho8gq8AvUZIz7Bw7jeqmHsMbGZWFfhW8OS3yVZolVRBVXiaqLqyB67oTy3a
	DUh1b/8/VxexrbxeoAUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkyj-00DGGp-2R;
	Fri, 21 Jul 2023 07:55:09 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkyf-00DGBq-10
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 07:55:06 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2657d405ad5so976464a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 00:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689926105; x=1690530905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6aeGGP2x/C4YQl5Th+aPcXB0i2yZ1ORWC7FX4YYM9c=;
        b=RxIf5r8Mi5cE3V8zR7uYPMPaKGtoLs5d1q9Jk/xHh56GGVcxVRd/zIkizLfowmbAuk
         Bt8ClVDVyVh2s8ouxDvbIXDchhIp3M8AMSgLcbQOAXdbasUDi9cMBdARODR4WvdWSE/u
         rr00U8GeSrRiKJKihRnIzIKL8fOtsrRZ3HtnS9qQRBNYLlNFmF+WdvsOCbmUCcLRtybq
         nk6tiEe3fvDhD56eL0FwvFGRlp6fy14aMOVAEg/Dzt+j5HX+EtjgVCl61q2QcOjzSahC
         fgdPrphzoaz6740Vv0iryVCrKuaxZmkMzuWGENjw2hmATf13Ldr+X0UpPTPHAWUxkSg1
         8mXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689926105; x=1690530905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6aeGGP2x/C4YQl5Th+aPcXB0i2yZ1ORWC7FX4YYM9c=;
        b=eoWXhdhJOaUfuxsrt4VPQY5tiQcNMIG6w3wiQIbkYxd88QJxjZxTWLwlA3DlfzfH+4
         0Vis/BBkH8xXnSdgNbY2u/kYDR53lR9uAD3v05w373w/UeBvoZlKjwUznvBWvw+fsppa
         RsC5jFEdoQ77DkpQT2iarx3jDDCXxwvJnxWxnMshuM+OMaGV1/+lz71aDWOyPuEvE/DD
         30MqKBY43KBvkb+J759hrq4fk6/xYIJc10az/hEtQBbCPNWdZwG1+Dky2Z4mIxjFWhCt
         Fl9VHwdUUR6szXDsyOgG1xxOBCic01OJxHjbnGfgBcQ/L2IJo43AK96Ztb1er982muUu
         yKVw==
X-Gm-Message-State: ABy/qLbUkHffD9WPkuVMmpPLqzrZ2mqsCXhXSK5U4E+pOxbI4tWjBDpr
	ql9BbVksZRLgw+iLDhsUE2CPBA==
X-Google-Smtp-Source: APBJJlFlaCCjo3ica43J3v2eS9XgiorY1FVzcb095X10s0Ma8S3UGsVrdtP+9HARJosg9BMb2amXpQ==
X-Received: by 2002:a17:90a:db09:b0:25c:1138:d97c with SMTP id g9-20020a17090adb0900b0025c1138d97cmr963165pjv.24.1689926104662;
        Fri, 21 Jul 2023 00:55:04 -0700 (PDT)
Received: from mchitale-vm.. ([117.99.250.48])
        by smtp.googlemail.com with ESMTPSA id gw15-20020a17090b0a4f00b00267bb769652sm2026354pjb.6.2023.07.21.00.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 00:55:04 -0700 (PDT)
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
Subject: [PATCH v2 5/6] RISCV: KVM: Add sstateen0 context save/restore
Date: Fri, 21 Jul 2023 13:24:38 +0530
Message-Id: <20230721075439.454473-6-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721075439.454473-1-mchitale@ventanamicro.com>
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_005505_388188_E326D5A0 
X-CRM114-Status: GOOD (  12.59  )
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
---
 arch/riscv/include/asm/csr.h      |  1 +
 arch/riscv/include/asm/kvm_host.h |  8 ++++++++
 arch/riscv/kvm/vcpu.c             | 10 ++++++++++
 3 files changed, 19 insertions(+)

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
index 37f1ed70d782..ae750decbefe 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -1138,14 +1138,24 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
  */
 static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
 {
+	struct kvm_vcpu_smstateen_csr *smcsr = &vcpu->arch.smstateen_csr;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
 	vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN) &&
+	    (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
+		vcpu->arch.host_sstateen0 = csr_swap(CSR_SSTATEEN0,
+						     smcsr->sstateen0);
 	guest_state_enter_irqoff();
 	__kvm_riscv_switch_to(&vcpu->arch);
 	vcpu->arch.last_exit_cpu = vcpu->cpu;
 	guest_state_exit_irqoff();
 	csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN) &&
+	    (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
+		smcsr->sstateen0 = csr_swap(CSR_SSTATEEN0,
+					    vcpu->arch.host_sstateen0);
 }
 
 int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
