Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EB3C54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 19:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L9OisSvqZEpQft0aZ3VH3TP6Okeo0f8u1I3BfauYRNM=; b=XYUIj16QKxb/OQ
	NIsPBy9rsxejvmPHkAAeG9NJz2AsIezCIZGN6i42BWNMq1tN54UXl9MpWZ3MrPL0C+AMCN9aVnl/U
	Z0Nh8WNM0TqIaxK7v7fBB7dQcfbs56cPHpm93pAiHQCmUlipxKtHv8IjAGVvCTfv5ZP7UDTqzLWV4
	Tf+UjQMb0mD2h2MHVb9rphIttHbr4voq3BbAEA9Mv/v+OfioyxvcYrD11dU5zGTJQBrtbPgsKJYO9
	Pgxoqu0uUnvQ3ZnO72YzEHJPvUVsZ9T5ImGmn+JbOYk9YnZRiVGBJh2FUxi/NOzGK3UmJIC75O0T4
	qsFlzKRcxAa56dSXoRLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLTza-00G5e0-W7; Fri, 27 Jan 2023 19:02:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLTzZ-00G5dY-Rb
	for linux-riscv@bombadil.infradead.org; Fri, 27 Jan 2023 19:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2eB56PlxVYYG9BW+idfsAIH60JlcBASeIP8IcBFqjbQ=; b=m+TvxzAE0wim7yWMUU2ab4AAo9
	JLQ3vUKlZX0X16GYZ/oI+rCM8ucgeitAP2PxTzlriXYkdmxFqEqW7uCxCb/5dsLgjcHyXQXmQenFs
	wEd2aYBUS5uqZQ8AkyuDgoZ9D+KtjDU7OCoAhVHqIxApxFXn/EKUML3OAZD1Gg64LqeoureSVbyFH
	IwfY5ife+Z/bpmugew3t8x0/Znh5qFsVboAASfIczHis3Kh/tQE0bk0ut8lC+9EizREQZwpCv6Nqz
	EIxtvcf/9EzG5WWAWoJs8Zvnr8pvZYtkIAeq5wSXltODKcnQ4uFTN9tZCza1Pbe1itxCirufTMmF4
	QWKx2Adg==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pLTQE-002veh-1m
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jan 2023 18:26:30 +0000
Received: by mail-pj1-x1029.google.com with SMTP id x2-20020a17090a46c200b002295ca9855aso9436998pjg.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 10:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eB56PlxVYYG9BW+idfsAIH60JlcBASeIP8IcBFqjbQ=;
        b=6tHALczfMbO8hse+3nrl1EO2mLFyq7flzJfTD3DpnSn2HXfxrnmud2b1bJLig7zxsC
         nbMCPzVzxWzfujxyIf3eM9MR3OpgNMIjwoO8ZOmLNNhMHi3n91saw1z16D3JdgLOR/4Z
         hl4TwdItUXrD6ixIe9gzHpd+70KjkqhLApicV8ke19vKhGbW7RtqcaqBgU4vRhojWRBH
         tfPbkA/cS2eonmVQKajbTs9Y40yZ5rJgSiq7h9X3lF7eKKpYieg0se7+8xtyI7UQk59Q
         9KQWR7a3SMnndznUFFGX8jqJDkQS3sqrVaKWKImVrHp7RCW3k6MjZBqg/+bPCaHemItz
         NiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eB56PlxVYYG9BW+idfsAIH60JlcBASeIP8IcBFqjbQ=;
        b=BL6Lgldb3vYcew4OC4Kr4D+E1qNdJQ/75AF/5GSlom55qnzTWPMT16YQQoG+jXn2BC
         tH2F5hlzM/QjooD75okKaDtLAKEEJ+y0271dIVQy8ndDUNmz1lDgvcRRY5Ez7RTGJChp
         7D51SwiR0FiMk9apTTA2Ao8RRpVOI1MJUZd60Da3G3DlkTUcZriBu+uV4jziX3EKRWp7
         gyoug29Pa8JLOYvDbyKZIVC6muRjjFkBtnpKSOp8ODq8drZdH1M1NkhsetDc2uO2yP4g
         plMr5a2mGhN8OzJPOimI7cK+5cflTKIteiDNGjSuR4Zs1cB9QCHBT9gqL6VpG0KhVKZn
         +MxA==
X-Gm-Message-State: AO0yUKUclJRaYS39o6qcyRVSvgCPC6EJUyeSyQstSCHbMbdodoRaIGjZ
	feBsP/TVFxA+yKyBuo+Mpm5JNw==
X-Google-Smtp-Source: AK7set+oYbUUwtd4EAD6XiA8CIBGPbEJJpjDsAhrh7noLsI76uIOCbGORCnptpGlJUW1uUZsqmEGgA==
X-Received: by 2002:a17:902:d4c8:b0:196:357f:9398 with SMTP id o8-20020a170902d4c800b00196357f9398mr10667341plg.34.1674843983718;
        Fri, 27 Jan 2023 10:26:23 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jc5-20020a17090325c500b00189d4c666c8sm3195219plb.153.2023.01.27.10.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:26:23 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 11/14] RISC-V: KVM: Implement trap & emulate for hpmcounters
Date: Fri, 27 Jan 2023 10:25:55 -0800
Message-Id: <20230127182558.2416400-12-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127182558.2416400-1-atishp@rivosinc.com>
References: <20230127182558.2416400-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_182559_981896_9C0E1270 
X-CRM114-Status: GOOD (  15.95  )
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
 arch/riscv/include/asm/kvm_vcpu_pmu.h | 16 ++++++++++
 arch/riscv/kvm/vcpu_insn.c            |  4 ++-
 arch/riscv/kvm/vcpu_pmu.c             | 45 ++++++++++++++++++++++++++-
 3 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index 3f43a43..022d45d 100644
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
index 7713927..894053a 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -17,6 +17,44 @@
 
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
+
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
@@ -69,7 +107,12 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
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
