Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F091C46CD4
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 21:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cERIr6DD6RCurCyKzrEYjvcuiqBV7B1xy+VBP7TBE94=; b=1Ud4V0Qh8UzC+V
	09UMtjWJ3YtAQ7YxOmcHY8QPeWOoZE2W5vqpXGqxo+BAlkCvQgEdgD/NP51oTASNpKx2qou12RbYy
	zut8OOxQYyVhiefsic1Yx18XRd+izmz942E7VRitJh66HCZmCwC91ba1Q1gROIDf4F/N8JBFM11hK
	khtN9Jhf0GA/52UlfeGQ+0+bPRxxHtI4tP+/dz6eBH3v9BRqcn6pG19Q8v7jdOogofuboN+4YZOIu
	Dnuy4BM81ZSco3y0kyWPSNY/C0Nl5b6afFyM8CXe/Qseq1z71PZOg86g0OD6p5lEGK0+ip2IeHTQE
	vJbv9HQOCIy0ZE/50ktQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKkM-001c19-2j;
	Fri, 29 Dec 2023 21:50:26 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKk9-001bpZ-0G
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 21:50:17 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6dc00dbb560so1875223a34.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Dec 2023 13:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703886612; x=1704491412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AA3LfoTcaEKIOaIwGy1Gus2TyOeYnCrlnRsFi19bGes=;
        b=KEENHFupsbR1MdTpZxoxSest8zgiqIJ95ptR6LW7pqhXrF/TDWofREfqimccuAlJbG
         b6j47DGL7ZZgJhiNlfMvzCZgN49bQz3OHZ8k5HWD0c4yD/R9dwTQTrLfw9Cdw2GOSK5V
         iJ0Xr8JL+yhO6IwsoKTuGBK0zEla9sFPYv1XqfZqcpQehTag1hFnBo4TScVVey6WSBwN
         BUqidPUoiS8Rp49q+APeKnw5MSLLayVwiGtbhc4i4JEOE5HLoRnVuYWYxGk7uiKAOdRP
         E462+WdCrF68Z022xh0f4O2NPyQgtHoGblETaB4azl7H+UCS590JPcMpBiL86p3udePe
         wu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703886612; x=1704491412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AA3LfoTcaEKIOaIwGy1Gus2TyOeYnCrlnRsFi19bGes=;
        b=pQELQcGlQqUqfcT3zhom1sMlnhzH6jDGfw0AmbxheFRniU82phOumHzwO/teCRnFVo
         MgnL54F68gWc1nWgXND/HW+Ou5UBjtuPkmsJ5Xg9ON9VzH7uOfq2hd3yJfIDbFn7MNwj
         4EAEcLkXxUnvjPVBbtlfIuFG6iwBrRUb8ZjjE1Ddlh/Ot5UHUKOWWXf7Xs+teXDN+g0d
         t4Vckwqreh9ATJONo/aZAyXSudgiR5Kxihx2aRSUuaKak8pVK4sBzKzxdyEmoVjM92Eh
         Qja7B1lJOUJoVVLIkbOzNTuENZoYJCxEKcQdC5C/kp2galB/6Uur/uxZweTLhEON2ZOP
         70Bg==
X-Gm-Message-State: AOJu0Yza+pG0d+sb59LT9jPEjeBoAHDxvueMS1XJcX7S7K2IqKGhm0UP
	tvm58ZMfUomXoDLPoli7pXgGV1mtjbr5WQ==
X-Google-Smtp-Source: AGHT+IFy/vE+ahapQ9i4Yp6RFiDfanQkcX4Bv00YzuZS+kZ0jkNip+yrtU948YXFHq6F/3h84USNrw==
X-Received: by 2002:a05:6830:611:b0:6dc:f8:7913 with SMTP id w17-20020a056830061100b006dc00f87913mr5126756oti.20.1703886612261;
        Fri, 29 Dec 2023 13:50:12 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id r126-20020a4a4e84000000b00594e32e4364sm1034751ooa.24.2023.12.29.13.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 13:50:11 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [v2 08/10] RISC-V: KVM: Implement SBI PMU Snapshot feature
Date: Fri, 29 Dec 2023 13:49:48 -0800
Message-Id: <20231229214950.4061381-9-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229214950.4061381-1-atishp@rivosinc.com>
References: <20231229214950.4061381-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_135013_153577_A066B7C0 
X-CRM114-Status: GOOD (  25.89  )
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

PMU Snapshot function allows to minimize the number of traps when the
guest access configures/access the hpmcounters. If the snapshot feature
is enabled, the hypervisor updates the shared memory with counter
data and state of overflown counters. The guest can just read the
shared memory instead of trap & emulate done by the hypervisor.

This patch doesn't implement the counter overflow yet.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h |   9 ++
 arch/riscv/kvm/aia.c                  |   5 ++
 arch/riscv/kvm/vcpu_onereg.c          |   7 +-
 arch/riscv/kvm/vcpu_pmu.c             | 120 +++++++++++++++++++++++++-
 arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
 5 files changed, 140 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index 395518a1664e..d56b901a61fc 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -50,6 +50,12 @@ struct kvm_pmu {
 	bool init_done;
 	/* Bit map of all the virtual counter used */
 	DECLARE_BITMAP(pmc_in_use, RISCV_KVM_MAX_COUNTERS);
+	/* Bit map of all the virtual counter overflown */
+	DECLARE_BITMAP(pmc_overflown, RISCV_KVM_MAX_COUNTERS);
+	/* The address of the counter snapshot area (guest physical address) */
+	gpa_t snapshot_addr;
+	/* The actual data of the snapshot */
+	struct riscv_pmu_snapshot_data *sdata;
 };
 
 #define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu_context)
@@ -85,6 +91,9 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 				struct kvm_vcpu_sbi_return *retdata);
 void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
+int kvm_riscv_vcpu_pmu_setup_snapshot(struct kvm_vcpu *vcpu, unsigned long saddr_low,
+				      unsigned long saddr_high, unsigned long flags,
+				       struct kvm_vcpu_sbi_return *retdata);
 void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
 
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index a944294f6f23..71d161d7430d 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -545,6 +545,9 @@ void kvm_riscv_aia_enable(void)
 	enable_percpu_irq(hgei_parent_irq,
 			  irq_get_trigger_type(hgei_parent_irq));
 	csr_set(CSR_HIE, BIT(IRQ_S_GEXT));
+	/* Enable IRQ filtering for overflow interrupt only if sscofpmf is present */
+	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSCOFPMF))
+		csr_write(CSR_HVIEN, BIT(IRQ_PMU_OVF));
 }
 
 void kvm_riscv_aia_disable(void)
@@ -560,6 +563,8 @@ void kvm_riscv_aia_disable(void)
 
 	/* Disable per-CPU SGEI interrupt */
 	csr_clear(CSR_HIE, BIT(IRQ_S_GEXT));
+	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSCOFPMF))
+		csr_clear(CSR_HVIEN, BIT(IRQ_PMU_OVF));
 	disable_percpu_irq(hgei_parent_irq);
 
 	aia_set_hvictl(false);
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index fc34557f5356..581568847910 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -117,8 +117,13 @@ void kvm_riscv_vcpu_setup_isa(struct kvm_vcpu *vcpu)
 	for (i = 0; i < ARRAY_SIZE(kvm_isa_ext_arr); i++) {
 		host_isa = kvm_isa_ext_arr[i];
 		if (__riscv_isa_extension_available(NULL, host_isa) &&
-		    kvm_riscv_vcpu_isa_enable_allowed(i))
+		    kvm_riscv_vcpu_isa_enable_allowed(i)) {
+			/* Sscofpmf depends on interrupt filtering defined in ssaia */
+			if (host_isa == RISCV_ISA_EXT_SSCOFPMF &&
+			    !__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSAIA))
+				continue;
 			set_bit(host_isa, vcpu->arch.isa);
+		}
 	}
 }
 
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 08f561998611..e980235b8436 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -311,6 +311,81 @@ int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
 	return ret;
 }
 
+static void kvm_pmu_clear_snapshot_area(struct kvm_vcpu *vcpu)
+{
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	int snapshot_area_size = sizeof(struct riscv_pmu_snapshot_data);
+
+	if (kvpmu->sdata) {
+		memset(kvpmu->sdata, 0, snapshot_area_size);
+		if (kvpmu->snapshot_addr != INVALID_GPA)
+			kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr,
+					     kvpmu->sdata, snapshot_area_size);
+		kfree(kvpmu->sdata);
+		kvpmu->sdata = NULL;
+	}
+	kvpmu->snapshot_addr = INVALID_GPA;
+}
+
+int kvm_riscv_vcpu_pmu_setup_snapshot(struct kvm_vcpu *vcpu, unsigned long saddr_low,
+				      unsigned long saddr_high, unsigned long flags,
+				      struct kvm_vcpu_sbi_return *retdata)
+{
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	int snapshot_area_size = sizeof(struct riscv_pmu_snapshot_data);
+	int sbiret = 0;
+	gpa_t saddr;
+	unsigned long hva;
+	bool writable;
+
+	if (!kvpmu) {
+		sbiret = SBI_ERR_INVALID_PARAM;
+		goto out;
+	}
+
+	if (saddr_low == -1 && saddr_high == -1) {
+		kvm_pmu_clear_snapshot_area(vcpu);
+		return 0;
+	}
+
+	saddr = saddr_low;
+
+	if (saddr_high != 0) {
+		if (IS_ENABLED(CONFIG_32BIT))
+			saddr |= ((gpa_t)saddr << 32);
+		else
+			sbiret = SBI_ERR_INVALID_ADDRESS;
+		goto out;
+	}
+
+	if (kvm_is_error_gpa(vcpu->kvm, saddr)) {
+		sbiret = SBI_ERR_INVALID_PARAM;
+		goto out;
+	}
+
+	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, saddr >> PAGE_SHIFT, &writable);
+	if (kvm_is_error_hva(hva) || !writable) {
+		sbiret = SBI_ERR_INVALID_ADDRESS;
+		goto out;
+	}
+
+	kvpmu->snapshot_addr = saddr;
+	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
+	if (!kvpmu->sdata)
+		return -ENOMEM;
+
+	if (kvm_vcpu_write_guest(vcpu, saddr, kvpmu->sdata, snapshot_area_size)) {
+		kfree(kvpmu->sdata);
+		kvpmu->snapshot_addr = INVALID_GPA;
+		sbiret = SBI_ERR_FAILURE;
+	}
+
+out:
+	retdata->err_val = sbiret;
+
+	return 0;
+}
+
 int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu,
 				struct kvm_vcpu_sbi_return *retdata)
 {
@@ -344,20 +419,32 @@ int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 	int i, pmc_index, sbiret = 0;
 	struct kvm_pmc *pmc;
 	int fevent_code;
+	bool snap_flag_set = flags & SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT;
 
-	if (kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0) {
+	if ((kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0)) {
 		sbiret = SBI_ERR_INVALID_PARAM;
 		goto out;
 	}
 
+	if (snap_flag_set && kvpmu->snapshot_addr == INVALID_GPA) {
+		sbiret = SBI_ERR_NO_SHMEM;
+		goto out;
+	}
+
 	/* Start the counters that have been configured and requested by the guest */
 	for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
 		pmc_index = i + ctr_base;
 		if (!test_bit(pmc_index, kvpmu->pmc_in_use))
 			continue;
 		pmc = &kvpmu->pmc[pmc_index];
-		if (flags & SBI_PMU_START_FLAG_SET_INIT_VALUE)
+		if (flags & SBI_PMU_START_FLAG_SET_INIT_VALUE) {
 			pmc->counter_val = ival;
+		} else if (snap_flag_set) {
+			kvm_vcpu_read_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
+					    sizeof(struct riscv_pmu_snapshot_data));
+			pmc->counter_val = kvpmu->sdata->ctr_values[pmc_index];
+		}
+
 		if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
 			fevent_code = get_event_code(pmc->event_idx);
 			if (fevent_code >= SBI_PMU_FW_MAX) {
@@ -401,12 +488,18 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 	u64 enabled, running;
 	struct kvm_pmc *pmc;
 	int fevent_code;
+	bool snap_flag_set = flags & SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT;
 
-	if (kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0) {
+	if ((kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0)) {
 		sbiret = SBI_ERR_INVALID_PARAM;
 		goto out;
 	}
 
+	if (snap_flag_set && kvpmu->snapshot_addr == INVALID_GPA) {
+		sbiret = SBI_ERR_NO_SHMEM;
+		goto out;
+	}
+
 	/* Stop the counters that have been configured and requested by the guest */
 	for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
 		pmc_index = i + ctr_base;
@@ -439,9 +532,28 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 		} else {
 			sbiret = SBI_ERR_INVALID_PARAM;
 		}
+
+		if (snap_flag_set && !sbiret) {
+			if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW)
+				pmc->counter_val = kvpmu->fw_event[fevent_code].value;
+			else if (pmc->perf_event)
+				pmc->counter_val += perf_event_read_value(pmc->perf_event,
+									  &enabled, &running);
+			/* TODO: Add counter overflow support when sscofpmf support is added */
+			kvpmu->sdata->ctr_values[i] = pmc->counter_val;
+			kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
+					     sizeof(struct riscv_pmu_snapshot_data));
+		}
+
 		if (flags & SBI_PMU_STOP_FLAG_RESET) {
 			pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
 			clear_bit(pmc_index, kvpmu->pmc_in_use);
+			if (snap_flag_set) {
+				/* Clear the snapshot area for the upcoming deletion event */
+				kvpmu->sdata->ctr_values[i] = 0;
+				kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
+						     sizeof(struct riscv_pmu_snapshot_data));
+			}
 		}
 	}
 
@@ -567,6 +679,7 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 	kvpmu->num_hw_ctrs = num_hw_ctrs + 1;
 	kvpmu->num_fw_ctrs = SBI_PMU_FW_MAX;
 	memset(&kvpmu->fw_event, 0, SBI_PMU_FW_MAX * sizeof(struct kvm_fw_event));
+	kvpmu->snapshot_addr = INVALID_GPA;
 
 	if (kvpmu->num_hw_ctrs > RISCV_KVM_MAX_HW_CTRS) {
 		pr_warn_once("Limiting the hardware counters to 32 as specified by the ISA");
@@ -626,6 +739,7 @@ void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
 	}
 	bitmap_zero(kvpmu->pmc_in_use, RISCV_MAX_COUNTERS);
 	memset(&kvpmu->fw_event, 0, SBI_PMU_FW_MAX * sizeof(struct kvm_fw_event));
+	kvm_pmu_clear_snapshot_area(vcpu);
 }
 
 void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
index b70179e9e875..9f61136e4bb1 100644
--- a/arch/riscv/kvm/vcpu_sbi_pmu.c
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -64,6 +64,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case SBI_EXT_PMU_COUNTER_FW_READ:
 		ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
 		break;
+	case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
+		ret = kvm_riscv_vcpu_pmu_setup_snapshot(vcpu, cp->a0, cp->a1, cp->a2, retdata);
+		break;
 	default:
 		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
 	}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
