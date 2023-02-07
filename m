Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CECAC636CD
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 11:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hdS1f4D+FjVASaeiHSn5fwiEx+PP6PdD8aOruF8uBOI=; b=v7buauFlyv59xS
	eRuWYU0BE2RNMNpans66qEsBEnOb85IQm/rX/514oLbqj4g/NmGoR0JFRFUk7ALnNhvFrxXXM7+qC
	nT+4EBo+xk0ibRdL43K9mzFOyCkX+dD0vam8JjYIq+csNnSGzKavAMwytjFAuJXmurGvSRT2TEVHi
	d8e033iOKHPEMcy3U+l5Bu3qvKiLvFnCGD/0hcl6EOEvjMV4BSrAVmUg3RxrXC6SppLfHXDFNnV1c
	u8Vdh6/7FTCf6KX+pDoYkfPmTa5sacFU2qrVsM4h9ND7eeyEQTXUO3IYfxyNDB/xWncAiAOk52gcG
	W7VE28isXrGW3IhkvM/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLiG-00BqaC-BV; Tue, 07 Feb 2023 11:00:36 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPKiH-00BbMW-TX
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 09:56:39 +0000
Received: by mail-pj1-x1032.google.com with SMTP id j1so8561725pjd.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Feb 2023 01:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7BAkWfqdBTUxQj0K6lnix41P2O8NAVb+CIBpMCn0RU=;
        b=r/pxSzwFt3rSFhL9SlF2NTmmpfBhXdNppDOyxZKm/BSjdeXPVxIbyKmsDPR/QdNRFl
         +ccPnEwalFo4+cgEyzKywSQX/e5rYh435mp7loDiyetbQdGkP81QSoKxkSt8+VsMjrf/
         6zCVykyzHeChRXwEBMpUzIC1QLUc/da/HpVKPASmCNzsMcTrE1t8UjHD+urL6V29SJik
         zLpOu2s6Va0E5UYdQcn6IIkD+DOTiKmU/gkP9oRN8Uu7rsPevaizXnZ872GK8tJ4P4kx
         pHGWTBTT+Yd9EemxxDYEW+F+11jG2YiWMHI7+DgQmJrejig9JxhSGlR5eYXH4FtVOjzx
         Db8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7BAkWfqdBTUxQj0K6lnix41P2O8NAVb+CIBpMCn0RU=;
        b=s+dl55OKu+Y5sG+ayvD5GRCgP+wFBg/GIRPgUAK9/U5zgPcIIlhzuCmu7G0xj6tpt0
         RPU7WgUuugja72SJ0kIhPmPFb+MZzz5gbjFsk0d2TTAW+lsEKTpJflS/jFzojrrPc/Wf
         kPQQffOw4lkuuX1F4D6mUD+s4zXLzDtJmRv/hbhs5v9wwUTNAUu7fqPQotq13ZWRDCIb
         Io2G1iDglmRi2L4C+szFJSfjH9i+82ZDh3cIT2j62tSbGya5lLFVjwVAd75Hi0PMIzqg
         gpGOwUOGThUjdjtHylgh9JuQKKnzM7ENHBPAPanhrfosMqDSIUGj7gRac+WtdKlNelI8
         3a9w==
X-Gm-Message-State: AO0yUKVNMUmbSjQJzK8v836MzUxbZtYxc+mFr2QXm0Sh/TN31253m1PR
	nLCbtAi68jy4l8jB8rt+U5U7FQ==
X-Google-Smtp-Source: AK7set/KiNwvCDsB2jHSC1iBRbVtSSUeEB+XSFx7WsAj9uN9aXriHH6Laqe053+EYk5hSHnzd57K0A==
X-Received: by 2002:a17:902:e38a:b0:198:fd58:ee43 with SMTP id g10-20020a170902e38a00b00198fd58ee43mr1718482ple.12.1675763792316;
        Tue, 07 Feb 2023 01:56:32 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id w8-20020a1709027b8800b0019602b2c00csm4030598pll.175.2023.02.07.01.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 01:56:32 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v6 5/8] RISC-V: KVM: Implement trap & emulate for hpmcounters
Date: Tue,  7 Feb 2023 01:55:26 -0800
Message-Id: <20230207095529.1787260-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207095529.1787260-1-atishp@rivosinc.com>
References: <20230207095529.1787260-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_015633_978102_EA1782F3 
X-CRM114-Status: GOOD (  18.27  )
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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h | 16 ++++++++
 arch/riscv/kvm/vcpu_insn.c            |  4 +-
 arch/riscv/kvm/vcpu_pmu.c             | 59 ++++++++++++++++++++++++++-
 3 files changed, 77 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index 0b86a47..4bc774c 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -45,6 +45,19 @@ struct kvm_pmu {
 #define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu_context)
 #define pmu_to_vcpu(pmu)  (container_of((pmu), struct kvm_vcpu, arch.pmu_context))
 
+#if defined(CONFIG_32BIT)
+#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
+{.base = CSR_CYCLEH,	.count = 31,	.func = kvm_riscv_vcpu_pmu_read_hpm }, \
+{.base = CSR_CYCLE,	.count = 31,	.func = kvm_riscv_vcpu_pmu_read_hpm },
+#else
+#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
+{.base = CSR_CYCLE,	.count = 31,	.func = kvm_riscv_vcpu_pmu_read_hpm },
+#endif
+
+int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
+				unsigned long *val, unsigned long new_val,
+				unsigned long wr_mask);
+
 int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_return *retdata);
 int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
 				struct kvm_vcpu_sbi_return *retdata);
@@ -68,6 +81,9 @@ void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
 struct kvm_pmu {
 };
 
+#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
+{.base = 0,	.count = 0,	.func = NULL },
+
 static inline void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu) {}
 static inline void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu) {}
 static inline void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu) {}
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 0bb5276..f689337 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -213,7 +213,9 @@ struct csr_func {
 		    unsigned long wr_mask);
 };
 
-static const struct csr_func csr_funcs[] = { };
+static const struct csr_func csr_funcs[] = {
+	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
+};
 
 /**
  * kvm_riscv_vcpu_csr_return -- Handle CSR read/write after user space
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 6c1f073..51a0237 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -17,6 +17,58 @@
 
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
+	if (!kvpmu || !kvpmu->init_done) {
+		/*
+		 * In absence of sscofpmf in the platform, the guest OS may use
+		 * the legacy PMU driver to read cycle/instret. In that case,
+		 * just return 0 to avoid any illegal trap. However, any other
+		 * hpmcounter access should result in illegal trap as they must
+		 * be access through SBI PMU only.
+		 */
+		if (csr_num == CSR_CYCLE || csr_num == CSR_INSTRET) {
+			*val = 0;
+			return ret;
+		} else {
+			return KVM_INSN_ILLEGAL_TRAP;
+		}
+	}
+
+	/* The counter CSR are read only. Thus, any write should result in illegal traps */
+	if (wr_mask)
+		return KVM_INSN_ILLEGAL_TRAP;
+
+	cidx = csr_num - CSR_CYCLE;
+
+	if (pmu_ctr_read(vcpu, cidx, val) < 0)
+		return KVM_INSN_ILLEGAL_TRAP;
+
+	return ret;
+}
+
 int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_return *retdata)
 {
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
@@ -69,7 +121,12 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 				struct kvm_vcpu_sbi_return *retdata)
 {
-	/* TODO */
+	int ret;
+
+	ret = pmu_ctr_read(vcpu, cidx, &retdata->out_val);
+	if (ret == -EINVAL)
+		retdata->err_val = SBI_ERR_INVALID_PARAM;
+
 	return 0;
 }
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
