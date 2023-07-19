Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9A5C001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9iZ8CHpXEFwg8OAxE3hfcZuDnCgIMvrwot2RJCQWNxA=; b=0tX+NsGHMhubMO
	5R8ftbNFHehUvUhT4Ns+oMMQPDVc7zKjmWsXIRxSEn3SS58MqC1+4/pVmAaT8ljWVtMy4r0brQkR1
	Lv1tMl22hGp/Pr86S1GBjApVXPZ91fx1D8IHNwQPmBJ5Gim69n3EKJl/5oc8PCMniwY49bAaRoQsS
	pyX4Mvl2BmM8d2z20k7sTa7VZpB7tZWLYOFHzuuL0Hc/uNUApKJzuH0+DP1x71Hn4FdTvFzVj9M/Y
	+ALCkAwKYJTww9Sp7I/JmExNj/F/f310qX+mcNNnKT5iIzoTQoS0pu5dgq+j9VOpSosOm1v7xyIWC
	scX75UmBiz7KVfCavQCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9f5-0083Xp-25;
	Wed, 19 Jul 2023 16:04:23 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9f1-0083Tl-2T
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:04:21 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6687466137bso4725546b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 09:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689782658; x=1692374658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6aeGGP2x/C4YQl5Th+aPcXB0i2yZ1ORWC7FX4YYM9c=;
        b=Rskr8b3Jj/h+BUOq4w3ToxRLKk7MxA8Ep+frR+L2NJAsls/WVN6r6p5a8xY0AHu47w
         gCt3vMPlkvNDLxa45z+3mgLuM16JTmDV9+YJ8hoOvOSyjM6ZGoK+99ff6sqS5ru6inwA
         gwo6ltt0B0z1JwgXz7PC2Xy6gunmVv/KvTHYUvdqiEyhAS+ejyeD5JJybZxi+hrjyqQQ
         dsgodBU/BKgCjbRHAVu6nSTM3CUlLI3bemExyQBz8TUavJkIj5Gew+sFSfNc05XBOeGk
         JyTZh9WVAxsSfFb7Jsl4NIlmO3EmxOp6I8X7HwQeoBiZPfTAEps7ShYMTxWym/0wJX86
         ZYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689782658; x=1692374658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6aeGGP2x/C4YQl5Th+aPcXB0i2yZ1ORWC7FX4YYM9c=;
        b=W0+lMsEgx1GH1gcLnGJtX2sGD6iV7LWKDDvW1E9ddMuXTSAyLJpYG/VEbxn5p0zEEA
         i/SLN6EYqdOCcUW0itTFbCJPhZrQrL2qyCNq3tackVhXYHcgPDufzNkChhmJQh9KaXko
         a3XT/TZLXj3zWkwkMe271aGotwM7loyaCOlLwIg8IY5qa6jlT2cJG+zXSSxiQEM2XNX+
         b4A+wpD78oYDw/lPakbksPLcuaFcXUKswXMW/IMS9IcH1BTjc90zYwgl4texr++zRhCW
         bnQ7LdwcF7oVu7KSAxh1aVtSlLtFPlrRAmygAHbKHQN3/Ct6BeG9QoWjAgpT9dVpGdUF
         guIg==
X-Gm-Message-State: ABy/qLZfrR4t0dgr+QFxECEk3jHUFmEUDtX+USOowANeJ+QE4zAcGUay
	BOqTqQbUO1JeltQbxr+B9LouUQ==
X-Google-Smtp-Source: APBJJlEUcIUO7kRsy1LHKaCSQ4U7+tVcPW3oRs2z+gsln3i0jaq66fN1ZIwaFRJuomxMrJ0F53WLsA==
X-Received: by 2002:a05:6a00:182a:b0:666:b254:1c9c with SMTP id y42-20020a056a00182a00b00666b2541c9cmr3206751pfa.27.1689782658190;
        Wed, 19 Jul 2023 09:04:18 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id i22-20020aa79096000000b00682936d04ccsm3447023pfa.180.2023.07.19.09.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 09:04:17 -0700 (PDT)
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
Subject: [PATCH v1 5/6] RISCV: KVM: Add sstateen0 context save/restore
Date: Wed, 19 Jul 2023 21:33:15 +0530
Message-Id: <20230719160316.4048022-6-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719160316.4048022-1-mchitale@ventanamicro.com>
References: <20230719160316.4048022-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_090419_969299_24C35B33 
X-CRM114-Status: GOOD (  12.92  )
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
