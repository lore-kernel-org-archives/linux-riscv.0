Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A29C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 17:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fxAbWFPqM0wZhINUJmdIrZt5nuqzq3lncwhyL54Yvjc=; b=j3YxyhXj4qXmz6
	2Xw8qh9STPCF/PRTNVpgtVS0bs/JgzYMlPne+/Fv3B8R9biV38dejTln1AgZPvKQBt/wVQDY5+BhB
	98tIGJu5Hr6aSyhNPMJ4eP7B3CK3JOjE4Mlemg709SKq4u0aT3vxLxTnEwOJUDOJYjhbsLEPzG+IF
	tL8tX6KCXaRn2RPwYSVMFaDM7bVd73QgkoaXBoMmWuB16gXgyVX+jDsGvcPt4vDGaaHrgYAsrNV9g
	ZSmJErL0XgZZpswQMc7aWi33oSGhc7poe628kj4UFv012QtDV2XARF8AtGDugt4UQs/NIcilUkggI
	XUTHum4V8bjsnE4kp38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUC6-00Gzxa-43; Mon, 18 Jul 2022 17:06:06 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUBt-00Gzll-Ks
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 17:05:55 +0000
Received: by mail-pg1-x52f.google.com with SMTP id bf13so11124338pgb.11
        for <linux-riscv@lists.infradead.org>; Mon, 18 Jul 2022 10:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5MMCsELdRAdJh5aLmNFcZOyRr/D0RiLtBOcd/jSRJiU=;
        b=SZ6A4CByNWqPAfqTGaz70lPNVZuptERZ0n0u8v6E97djjISARvexx57xy8GGUdpF+7
         r/wz4gME1iPiN5m7T/2MCqyMwwdb3xeM41QcjwrrZmA5tMKBIkMLySe/imOL/raWFmnG
         xKa2mhJFZi0teVbY57hPs2+Bzzc0QSh8qG7kXumoXK9+hpWi6PD4chu1ayhJkh+miktd
         kXl5bOQIqIO/rE0/ExIZcBvmUHepnI2gs3SEIrxc3DXGAcDopac/yjWfOFX1XQdiPV6v
         0OgNbjia5UFMdtMEtdDpfKRXrszArD3bfhiVSlVxJie93lXnVZuvy7mPDqFJzLTsWe0j
         j/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5MMCsELdRAdJh5aLmNFcZOyRr/D0RiLtBOcd/jSRJiU=;
        b=S9m+5Ixx9+EmjqeBlWJ3S6N95Ca0L7ObYTw9s84BALXrepWxFA0qlNwtqUYxgsdMC/
         R9f29GwU7p2KAFnRyLVhzk+9/+sk27YuUWMrotJjxSX70gL6Su6U8MtC/p/ONNHyakpa
         BvrEH2L9SdrTK3YlN7poSk96Ux1FiX29MvMqocgE3VktHI525bWstFwmBnFZJF2JiBrL
         3b5+ad39MGpJeJr5L2YfMwfAcwx1HaXLiFSk+0kOL/MMSOYuZpl7t0FcyLCamc7Ar6sY
         lKYaWEwI/qglMdW8XLRutZeRPJigqIJJT2b+GJjFY8zFjwEdkj1RrLDEHu+3pmttY2xO
         tUug==
X-Gm-Message-State: AJIora9pMwsxwm/EMfU38+13dcWbVVkKbEj1lqbEK9Ny0t38zbuT1cL/
	apQ5gOh5n0CxJ7Dez6fK4720fg==
X-Google-Smtp-Source: AGRyM1vVmhagOiYrnqGiFf5EZMjik6HESCVupUtRm1lG/F6JRUTWiEEbCeHwm6Al2hYOL7mbJoR4Ng==
X-Received: by 2002:a63:6bc1:0:b0:40d:ffa8:2605 with SMTP id g184-20020a636bc1000000b0040dffa82605mr26252146pgc.299.1658163952186;
        Mon, 18 Jul 2022 10:05:52 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id r10-20020a170902be0a00b0016bc947c5b7sm9733402pls.38.2022.07.18.10.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:05:51 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [RFC  7/9] RISC-V: KVM: Implement trap & emulate for hpmcounters
Date: Mon, 18 Jul 2022 10:02:03 -0700
Message-Id: <20220718170205.2972215-8-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718170205.2972215-1-atishp@rivosinc.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_100553_723331_8AFEBB72 
X-CRM114-Status: GOOD (  15.07  )
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
 arch/riscv/include/asm/kvm_vcpu_pmu.h | 16 +++++++++
 arch/riscv/kvm/vcpu_insn.c            |  1 +
 arch/riscv/kvm/vcpu_pmu.c             | 47 +++++++++++++++++++++++----
 3 files changed, 57 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index bffee052f2ae..5410236b62a8 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -39,6 +39,19 @@ struct kvm_pmu {
 #define pmu_to_vcpu(pmu)  (container_of((pmu), struct kvm_vcpu, arch.pmu))
 #define pmc_to_pmu(pmc)   (&(pmc)->vcpu->arch.pmu)
 
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
 int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, unsigned long *out_val);
 int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
 				unsigned long *ctr_info);
@@ -59,6 +72,9 @@ void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
 #else
 struct kvm_pmu {
 };
+#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
+{ .base = 0,      .count = 0, .func = NULL },
+
 
 static inline int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 {
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 0aa334f853c8..7c2a4b1a69f7 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -215,6 +215,7 @@ struct csr_func {
 };
 
 static const struct csr_func csr_funcs[] = {
+	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
 };
 
 /**
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 3168ed740bdd..5434051f495d 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -14,6 +14,46 @@
 #include <asm/kvm_vcpu_pmu.h>
 #include <linux/kvm_host.h>
 
+int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
+				unsigned long *out_val)
+{
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	struct kvm_pmc *pmc;
+	u64 enabled, running;
+
+	if (!kvpmu)
+		return -EINVAL;
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
+	if (!kvpmu)
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+	//TODO: Should we check if vcpu pmu is initialized or not!
+	if (wr_mask)
+		return KVM_INSN_ILLEGAL_TRAP;
+	cidx = csr_num - CSR_CYCLE;
+
+	if (kvm_riscv_vcpu_pmu_ctr_read(vcpu, cidx, val) < 0)
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+
+	return ret;
+}
+
 int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, unsigned long *out_val)
 {
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
@@ -60,13 +100,6 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 	return 0;
 }
 
-int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
-				unsigned long *out_val)
-{
-	/* TODO */
-	return 0;
-}
-
 int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 {
 	int i = 0, num_hw_ctrs, num_fw_ctrs, hpm_width;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
