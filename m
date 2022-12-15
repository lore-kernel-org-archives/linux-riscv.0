Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641E8C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 17:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3IYpwKlnlyp37/QQidkvajSz9X2ro6zjmeoF0z36CaQ=; b=tRye93DwLyYUJx
	rIdzrzujCswITcnC3UzWCD4/cOYdLWwOw0HshSkkEb5mII0OnCgDhndw2DR7JUf1XkezSXfRfsX7U
	iz1cx/qbwd7cyvaxGmHv6yXK7hYKCNPWswTMZm/t938SlX9hAqGKnNkcvA+XeXuftttQr7xPSyPhW
	G90lHab6Td2TJQ8myqKPsJJfHX0ZYKkYKU9rQ1AYd5BU/DXnBG294h0oIU6tIrJoV0s0zpVIlJqYv
	ZEEelpFXIwyTB/D/yhGRodM4g0VsGNxzs5ajzCmLGISXTf23i1VpGiAwE0hNECO+dHflfx/ep+DWa
	WOPi74fOY/UZ532pc4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rc8-00ARmF-KS; Thu, 15 Dec 2022 17:01:44 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rbm-00ARWb-2X
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 17:01:25 +0000
Received: by mail-pl1-x632.google.com with SMTP id x2so6184531plb.13
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 09:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xd4EliKq7RGLoGsrWDsqLSSvOown03UCv03d22ew7cY=;
        b=7aM70M89maU4rC8RoZOzNOc4Cypbe/3jpfgvF5KGf+DoFhgrk5PWKdM6aFcvLJxs7X
         s/vvFRVZyvRhTUrb7WyKk4LnxL7WJys1tTwX7ijtUucRf9y7H1MeyipCJNmVrfAgfKJA
         L4DjVhF5/krCg3I2U4iF2J9+WFTUoCvWzZZInPrRJIyLwaYEIrgoGdn96LRFitAK8ako
         YZJ0qVFh6Oz6JhZ/oVTgSPKEw3i436Sosoc3z0VFRoWW7KEVf0sRlLAWi3dQHjAdIxbr
         JqDOIyE/oAEgdNNO0m063ifsiJd68kSzJBvMnwnUvCm47tkjENGDTPXqitTVE2JmY4D3
         OErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xd4EliKq7RGLoGsrWDsqLSSvOown03UCv03d22ew7cY=;
        b=eNIWOzSH+SOzMsmj9I4FtGFEK+wmd9GSj1QAtImjWM7BXEgJw6OLQxNT17N/aHO/Hw
         1qR9qwlWqvCOW/lBLaV8n/lJXyKnvhUWSQJqCtpuc++dHsdWMoUUUv6KZ4hZzEwJZtmz
         PMmMx/iFLC/Q0XTy0tforrmXgT9B6E5tES9XN08Tvsre3yYhqfHNe/BF/rb/dtmmg8TX
         fD2Jdk8Z1rRh16s3KpYcoBGxDtttjXiLMNM4v4JFoueeEqfbgI/fWLHSPZHqRxkKRr3m
         vDUGV6lGEdhvS6DWIeBhPFRdc4/T5ClA7PRLNQ2ATIQerlFWKkUQlNPGjJ18B/EzTpKE
         j/fg==
X-Gm-Message-State: AFqh2kplY7BtBaupY5wKGvTzmpneLuMAP0CYvqwquXvxGvvmStV7TLn1
	VloTkCv987P6vF08aiKZi48E3Q==
X-Google-Smtp-Source: AMrXdXvQYU82N+iVubdoY963p+S/kLC/NfFUJryN/aBDIrEtRm2bFUCcxGUDizonKgdpgBRh/bjKew==
X-Received: by 2002:a17:902:b201:b0:189:ea4c:e414 with SMTP id t1-20020a170902b20100b00189ea4ce414mr4445034plr.61.1671123681604;
        Thu, 15 Dec 2022 09:01:21 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902780a00b001897bfc9800sm4067449pll.53.2022.12.15.09.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 09:01:21 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Eric Lin <eric.lin@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 09/11] RISC-V: KVM: Implement trap & emulate for hpmcounters
Date: Thu, 15 Dec 2022 09:00:44 -0800
Message-Id: <20221215170046.2010255-10-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215170046.2010255-1-atishp@rivosinc.com>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_090122_175975_4CB92B05 
X-CRM114-Status: GOOD (  15.72  )
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

As the KVM guests only see the virtual PMU counters, all hpmcounter
access should trap and KVM emulates the read access on behalf of guests.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h | 16 ++++++++++
 arch/riscv/kvm/vcpu_insn.c            |  4 ++-
 arch/riscv/kvm/vcpu_pmu.c             | 44 ++++++++++++++++++++++++++-
 3 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index 6a8c0f7..7a9a8e6 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -43,6 +43,19 @@ struct kvm_pmu {
 #define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu)
 #define pmu_to_vcpu(pmu)  (container_of((pmu), struct kvm_vcpu, arch.pmu))
 
+#if defined(CONFIG_32BIT)
+#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
+{ .base = CSR_CYCLEH,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm }, \
+{ .base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
+#else
+#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
+{ .base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
+#endif
+
+int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
+				unsigned long *val, unsigned long new_val,
+				unsigned long wr_mask);
+
 int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_ext_data *edata);
 int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
 				struct kvm_vcpu_sbi_ext_data *edata);
@@ -65,6 +78,9 @@ void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
 #else
 struct kvm_pmu {
 };
+#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
+{ .base = 0,      .count = 0, .func = NULL },
+
 
 static inline int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 {
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 1ff2649..f689337 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -213,7 +213,9 @@ struct csr_func {
 		    unsigned long wr_mask);
 };
 
-static const struct csr_func csr_funcs[] = {};
+static const struct csr_func csr_funcs[] = {
+	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
+};
 
 /**
  * kvm_riscv_vcpu_csr_return -- Handle CSR read/write after user space
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 0f0748f1..53c4163 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -17,6 +17,43 @@
 
 #define kvm_pmu_num_counters(pmu) ((pmu)->num_hw_ctrs + (pmu)->num_fw_ctrs)
 
+static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
+			unsigned long *out_val)
+{
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	struct kvm_pmc *pmc;
+	u64 enabled, running;
+
+	pmc = &kvpmu->pmc[cidx];
+	if (!pmc->perf_event)
+		return -EINVAL;
+
+	pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
+	*out_val = pmc->counter_val;
+
+	return 0;
+}
+
+int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
+				unsigned long *val, unsigned long new_val,
+				unsigned long wr_mask)
+{
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	int cidx, ret = KVM_INSN_CONTINUE_NEXT_SEPC;
+
+	if (!kvpmu || !kvpmu->init_done)
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+
+	if (wr_mask)
+		return KVM_INSN_ILLEGAL_TRAP;
+	cidx = csr_num - CSR_CYCLE;
+
+	if (pmu_ctr_read(vcpu, cidx, val) < 0)
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+
+	return ret;
+}
+
 int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_ext_data *edata)
 {
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
@@ -69,7 +106,12 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 				struct kvm_vcpu_sbi_ext_data *edata)
 {
-	/* TODO */
+	int ret;
+
+	ret = pmu_ctr_read(vcpu, cidx, &edata->out_val);
+	if (ret == -EINVAL)
+		edata->err_val = SBI_ERR_INVALID_PARAM;
+
 	return 0;
 }
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
