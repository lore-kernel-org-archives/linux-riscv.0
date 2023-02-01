Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B023C636D3
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 00:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FPvjQd+NlIieOOGuiAwq4AgHSG9eqhbI/nBbhBZiAMA=; b=izqTDjn9/J8Jci
	5HUayKrmrb+cnlW8qRa44CwsVjEicDwIIimEymSFgha8JMvJUsH33Xog/yC9AjZaI6GOkSacjMej5
	rM1bjS7yM/FDBwWepfI2KugFJE4N2h2VR7zCUGpPs7aQ/bVoxK3rUj2EuXRMqIZfl0MKL/8/PKgDD
	UI+Myj7XaYGMszBbMiEi3sDJwCoYxsF07aqn3aaYURzaLD8EF6GCXQrOMpcPRuRXXmk3DqIYJg4y2
	ItYVZ1oA5S8BBk/YtW8z8Csq5TZpcLpp1kop+m9u1T5vjJE+4WeWJ2lo9JJToaASDf4+Pw3DsUYjX
	70xaEec6oHTYCfyusntA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNN3v-00Dv0x-Aa; Thu, 02 Feb 2023 00:02:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNN3t-00Dv0C-6q
	for linux-riscv@bombadil.infradead.org; Thu, 02 Feb 2023 00:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=caynWJva1dOdOq57JXJiWjuHhrwg++AWRdrPSfdbeeE=; b=CosJVBv4xUV9U7lSV9XW9CVlY7
	3GSpK66M/+HyeBKx1DPd6b9tQ31eTRbBApXDBnQfOGna+AUIXE/wY/ehXcnEv7Gjo4UkjpV5ZlHdk
	M2iUxlaLtNVrEb3kDnNRcWeEVk0WOj3uakc71YOtONv7K9U/6K67Kmyji6Mi0qcRp5CCcOErWxMnZ
	JSDf3J69pEffOHxreLxX2hjdC/2fHpRQPDyX7+fXQTTPzbokbfLpC/UGDbc+pNuG9P2CwN8glQziJ
	gH1eiD6kmVbG7hpmyMsQq/eE/FKiFMgvXygLBVVwEUkrheqxsvmGJewvNYer3tPCZdBt1V+ZzJnZu
	lA3EhPMg==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pNMHL-004wip-28
	for linux-riscv@lists.infradead.org;
	Wed, 01 Feb 2023 23:12:46 +0000
Received: by mail-pl1-x631.google.com with SMTP id n13so65018plf.11
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 15:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caynWJva1dOdOq57JXJiWjuHhrwg++AWRdrPSfdbeeE=;
        b=xIjIgO2h+i3GtNolEUJCCx5HjIfOoh9rZvsUz7IhhfFTBguPawX2wzl0pDyTBe2hC5
         6HJIE1SOl4Fh5uRkRXmGb9tYtUL5xa63if+dNcjEwnzJ/GKUO/kumGJK9ZC2UGmfhkSP
         iLAmCsDZKo51n+nRPztNwLG++oKtoN3tzJLaoiIgZvDqLujl0VQVKHUpk1OTfoCtvafD
         W1xcnPkjd8FdQvTVRKOvlMEJhg9MLtE71z5GlMUiFSCO43ttvGw6LnuSH6LnUYyGfCg2
         cVo2zmoJQRkN2C2AxFH8IgJgbrvhOuRrWEfIjvEptpTwO9Reqkv97qgZV7PSjmini0bz
         ZrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=caynWJva1dOdOq57JXJiWjuHhrwg++AWRdrPSfdbeeE=;
        b=XZEPNsHPguRyMpZyWEuLSF3t5SmP4MSKrg/znkoywALX13K6QJx25t2r1lDe1lfdPY
         ZgSLWHSH+0nLxOzsq+BTtldNUSPpXa7SIbu4pS0Vk14aJQkzhg7wAElN1VqYlJ179Y+q
         hKAIIgrqw6dlE2bw/ZY1l20A5BWe5xx7B+NdI9Bt3YkrTCld7OrHLJVl/wvJnR2szP/K
         NSjEgHBV8KR9f6TvogVKHMmPQ5l94nGfLqnAVQsX04msIaRwFcrCxdbODx7mRuli+Ia9
         zbb8TYvZqs2Y1hS9ZyEqY8fQg8xQ5NLhD9Gsyn6IJ2HosoAkHqH1y7AEYhEiVfL8XtRA
         FZHQ==
X-Gm-Message-State: AO0yUKXZGtzqghiVtR6KxRREGNucDIN9+8YbHYBBQA5WTXEmudWUZDdz
	d/n7nQVRyMnBVOoJqhWGvQyRqA==
X-Google-Smtp-Source: AK7set/iDvV2Y4F+iCpVv2ZbyTZxPj69EH8//I2k74hhXsGU2YtcJtn1QcA1a1fZIQty+wGMYRchjg==
X-Received: by 2002:a17:90a:53:b0:22b:f834:3fac with SMTP id 19-20020a17090a005300b0022bf8343facmr4297815pjb.11.1675293182978;
        Wed, 01 Feb 2023 15:13:02 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090a510300b0022bf0b0e1b7sm1861774pjh.10.2023.02.01.15.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 15:13:02 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 11/14] RISC-V: KVM: Implement trap & emulate for hpmcounters
Date: Wed,  1 Feb 2023 15:12:47 -0800
Message-Id: <20230201231250.3806412-12-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201231250.3806412-1-atishp@rivosinc.com>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_231236_023721_96DFB52C 
X-CRM114-Status: GOOD (  18.99  )
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
 arch/riscv/include/asm/kvm_vcpu_pmu.h | 15 +++++++
 arch/riscv/kvm/vcpu_insn.c            |  4 +-
 arch/riscv/kvm/vcpu_pmu.c             | 59 ++++++++++++++++++++++++++-
 3 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index e2b4038..2afaaf5 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -48,6 +48,19 @@ struct kvm_pmu {
 #define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu_context)
 #define pmu_to_vcpu(pmu)  (container_of((pmu), struct kvm_vcpu, arch.pmu_context))
 
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
 int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_return *retdata);
 int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
 				struct kvm_vcpu_sbi_return *retdata);
@@ -70,6 +83,8 @@ void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
 #else
 struct kvm_pmu {
 };
+#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
+{ .base = 0,      .count = 0, .func = NULL },
 
 static inline void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu) {}
 static inline void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu) {}
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
index 9a531fe..6fa0065 100644
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
