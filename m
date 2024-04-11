Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66B0CD129A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 01:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vfk4Plg61IGuByelNKXxyYyzzWKStH3IJNG6m9bhju8=; b=3O7PSMJ9/kphX5
	KVhAo5NwNp89WlNIwaXI/zMRIGk2husoa5uyugZvyfIuxrmbDN/RXBTzatJZ6RAsjrAzz/n+G07rJ
	Qv+g5qFKLFwOHv2FOl7hN1YGqGKDcW+wXxuDc5iop6BiZ2B3Tr656pu+vLwAYKZFKEHm7ifMlUezO
	9MufBHNrhlUpDVto/FbDkAcy7dgcYBCis7zEbKHgD8u7o4clwcs4Ubla2tQOFry/RBawRx4qJhQ0x
	XTMK88RhLY0WVYc9o+nTiIv74lp6v69/SkCYTZof6LLSe0hmxtwoAzxYMfE53jMooIVrHplwggaMI
	xMD6/GErS3H7Uhsmb7+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruj4O-00000009o2K-3lt3;
	Thu, 11 Apr 2024 01:17:40 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhzh-00000009ZtV-1HSN
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 00:08:52 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1e3ca4fe4cfso32968815ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 17:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712794124; x=1713398924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8DpEacV0uPnn+5KI14uQgxti7nolZwMxNNsoPu5rdA=;
        b=uTTTuty/ixTi2Fb20FHbI59XFHfhNYNRtMGGzY0z8suxMr5gc/ae5zA7wHT1bZTndP
         h+UukaYpQHkJL2fc4sUDFOSdDCGncnr9UGMnAYsyM06azAQugrer2qIYruog5XrVzets
         Pt96e+fovCuwkqmcIaKrwXVR8Cuy4O5i7qVANhOFDd4Ji7XB69Tw7q+QtlCD4ya01lsi
         NntIr64xHDjqNogkMJCYC2aOGqVEQ3ESIBDLx1MUgRQ6MXIlcdvpsr9qRB8J2uihW/VF
         3blDg7SegrjbXeW9kzmTKQss8++SNK8w+pcBgE+9ibrwdk5M3yOdlR9bgW0iVy2k63Oi
         /Qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712794124; x=1713398924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8DpEacV0uPnn+5KI14uQgxti7nolZwMxNNsoPu5rdA=;
        b=SnBpDCWkMvA7DzZtLkwBW1WhLJtIOC2n98XIQ3meV8ZkhUqiV9TSM3iMCRzPVnBkdJ
         daItaBBAgsbSz48R7OjBWpLFzVQ0EQvJLKRIKyKtpFmULe0DmbgIKtGvLAI0fyyZ++ZN
         j/n6TfgxwbggWI1R3CKg5VLtg6oQ4sANr1OCKBzPonDwobNjsDJk2kYdecINj4NzDTNl
         U7WEphvyjk6nSuGf9u8vrcHP+baczX62Pt0AD+gdUSio5mEKmJx7CwoLWjxZ0fszTaXq
         E/D+GoMp63bzXQex5T9Elil9LW2Zv8GAq7xwv3Yi5zWq7fPETkx6PvMwsjusZYR+KuXy
         MWYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7cVNeAdcI6e+W3Mn2nOXjJLcDJwi1SRgqfEz2JtJRRUtBbEFTbjsMhiHoWs4f0lbNCO+EBeP/UYL3uO0WTqhDNh83JrvdbN7c17uEtJE2
X-Gm-Message-State: AOJu0Yw71A2hbEYnbI01R/JY9OS5eKFT5KlZAcK9WUYl6OAynjAFm2qv
	sNa2/kepGN/EyPr18P74RcXXtj+Po1F+gCZg4mATv1iVCufds+S5ZX3pqEBooWc=
X-Google-Smtp-Source: AGHT+IH8FQQSixN4y7KTj6LEQrbZftNaduTuaITpNTx8BaMS7zTtwyzWNrMPfkF/shsgs8MMssCWoQ==
X-Received: by 2002:a17:902:e751:b0:1e0:c37d:cfcb with SMTP id p17-20020a170902e75100b001e0c37dcfcbmr5405681plf.49.1712794124302;
        Wed, 10 Apr 2024 17:08:44 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001e3d8a70780sm130351pln.171.2024.04.10.17.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 17:08:41 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v6 13/24] RISC-V: KVM: Implement SBI PMU Snapshot feature
Date: Wed, 10 Apr 2024 17:07:41 -0700
Message-Id: <20240411000752.955910-14-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411000752.955910-1-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_170846_101043_908B632C 
X-CRM114-Status: GOOD (  25.71  )
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

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h |   7 ++
 arch/riscv/kvm/vcpu_pmu.c             | 121 +++++++++++++++++++++++++-
 arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
 3 files changed, 130 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index 395518a1664e..77a1fc4d203d 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -50,6 +50,10 @@ struct kvm_pmu {
 	bool init_done;
 	/* Bit map of all the virtual counter used */
 	DECLARE_BITMAP(pmc_in_use, RISCV_KVM_MAX_COUNTERS);
+	/* The address of the counter snapshot area (guest physical address) */
+	gpa_t snapshot_addr;
+	/* The actual data of the snapshot */
+	struct riscv_pmu_snapshot_data *sdata;
 };
 
 #define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu_context)
@@ -85,6 +89,9 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 				struct kvm_vcpu_sbi_return *retdata);
 void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
+int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long saddr_low,
+				      unsigned long saddr_high, unsigned long flags,
+				      struct kvm_vcpu_sbi_return *retdata);
 void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
 
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 2d9929bbc2c8..2ebccd73680f 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -14,6 +14,7 @@
 #include <asm/csr.h>
 #include <asm/kvm_vcpu_sbi.h>
 #include <asm/kvm_vcpu_pmu.h>
+#include <asm/sbi.h>
 #include <linux/bitops.h>
 
 #define kvm_pmu_num_counters(pmu) ((pmu)->num_hw_ctrs + (pmu)->num_fw_ctrs)
@@ -311,6 +312,80 @@ int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
 	return ret;
 }
 
+static void kvm_pmu_clear_snapshot_area(struct kvm_vcpu *vcpu)
+{
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	int snapshot_area_size = sizeof(struct riscv_pmu_snapshot_data);
+
+	if (kvpmu->sdata) {
+		if (kvpmu->snapshot_addr != INVALID_GPA) {
+			memset(kvpmu->sdata, 0, snapshot_area_size);
+			kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr,
+					     kvpmu->sdata, snapshot_area_size);
+		} else {
+			pr_warn("snapshot address invalid\n");
+		}
+		kfree(kvpmu->sdata);
+		kvpmu->sdata = NULL;
+	}
+	kvpmu->snapshot_addr = INVALID_GPA;
+}
+
+int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long saddr_low,
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
+	if (!kvpmu || flags) {
+		sbiret = SBI_ERR_INVALID_PARAM;
+		goto out;
+	}
+
+	if (saddr_low == SBI_SHMEM_DISABLE && saddr_high == SBI_SHMEM_DISABLE) {
+		kvm_pmu_clear_snapshot_area(vcpu);
+		return 0;
+	}
+
+	saddr = saddr_low;
+
+	if (saddr_high != 0) {
+		if (IS_ENABLED(CONFIG_32BIT))
+			saddr |= ((gpa_t)saddr_high << 32);
+		else
+			sbiret = SBI_ERR_INVALID_ADDRESS;
+		goto out;
+	}
+
+	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, saddr >> PAGE_SHIFT, &writable);
+	if (kvm_is_error_hva(hva) || !writable) {
+		sbiret = SBI_ERR_INVALID_ADDRESS;
+		goto out;
+	}
+
+	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
+	if (!kvpmu->sdata)
+		return -ENOMEM;
+
+	if (kvm_vcpu_write_guest(vcpu, saddr, kvpmu->sdata, snapshot_area_size)) {
+		kfree(kvpmu->sdata);
+		sbiret = SBI_ERR_FAILURE;
+		goto out;
+	}
+
+	kvpmu->snapshot_addr = saddr;
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
@@ -344,20 +419,38 @@ int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 	int i, pmc_index, sbiret = 0;
 	struct kvm_pmc *pmc;
 	int fevent_code;
+	bool snap_flag_set = flags & SBI_PMU_START_FLAG_INIT_SNAPSHOT;
 
 	if (kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0) {
 		sbiret = SBI_ERR_INVALID_PARAM;
 		goto out;
 	}
 
+	if (snap_flag_set) {
+		if (kvpmu->snapshot_addr == INVALID_GPA) {
+			sbiret = SBI_ERR_NO_SHMEM;
+			goto out;
+		}
+		if (kvm_vcpu_read_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
+					sizeof(struct riscv_pmu_snapshot_data))) {
+			pr_warn("Unable to read snapshot shared memory while starting counters\n");
+			sbiret = SBI_ERR_FAILURE;
+			goto out;
+		}
+	}
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
+			/* The counter index in the snapshot are relative to the counter base */
+			pmc->counter_val = kvpmu->sdata->ctr_values[i];
+		}
+
 		if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
 			fevent_code = get_event_code(pmc->event_idx);
 			if (fevent_code >= SBI_PMU_FW_MAX) {
@@ -398,14 +491,22 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 {
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
 	int i, pmc_index, sbiret = 0;
+	u64 enabled, running;
 	struct kvm_pmc *pmc;
 	int fevent_code;
+	bool snap_flag_set = flags & SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT;
+	bool shmem_needs_update = false;
 
 	if (kvm_pmu_validate_counter_mask(kvpmu, ctr_base, ctr_mask) < 0) {
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
@@ -438,12 +539,28 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
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
+			shmem_needs_update = true;
+		}
+
 		if (flags & SBI_PMU_STOP_FLAG_RESET) {
 			pmc->event_idx = SBI_PMU_EVENT_IDX_INVALID;
 			clear_bit(pmc_index, kvpmu->pmc_in_use);
 		}
 	}
 
+	if (shmem_needs_update)
+		kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
+					     sizeof(struct riscv_pmu_snapshot_data));
+
 out:
 	retdata->err_val = sbiret;
 
@@ -566,6 +683,7 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 	kvpmu->num_hw_ctrs = num_hw_ctrs + 1;
 	kvpmu->num_fw_ctrs = SBI_PMU_FW_MAX;
 	memset(&kvpmu->fw_event, 0, SBI_PMU_FW_MAX * sizeof(struct kvm_fw_event));
+	kvpmu->snapshot_addr = INVALID_GPA;
 
 	if (kvpmu->num_hw_ctrs > RISCV_KVM_MAX_HW_CTRS) {
 		pr_warn_once("Limiting the hardware counters to 32 as specified by the ISA");
@@ -625,6 +743,7 @@ void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
 	}
 	bitmap_zero(kvpmu->pmc_in_use, RISCV_MAX_COUNTERS);
 	memset(&kvpmu->fw_event, 0, SBI_PMU_FW_MAX * sizeof(struct kvm_fw_event));
+	kvm_pmu_clear_snapshot_area(vcpu);
 }
 
 void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
index e1633606c98b..d3e7625fb2d2 100644
--- a/arch/riscv/kvm/vcpu_sbi_pmu.c
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -64,6 +64,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case SBI_EXT_PMU_COUNTER_FW_READ:
 		ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
 		break;
+	case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
+		ret = kvm_riscv_vcpu_pmu_snapshot_set_shmem(vcpu, cp->a0, cp->a1, cp->a2, retdata);
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
