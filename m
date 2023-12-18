Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFF3C46CA2
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 10:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TumnM/kCmXnUhxquOWfgv5mWetZpxxWHj7TtFcPnG2I=; b=JwC1vO0GQl/Kw0
	2wX8c3xiOLdz/fKd9f/M/NzeGOIQdpOGgo0IwVAbRjSjWBodFxr6AYlz5HGid656btbBynlKwjHSe
	1Fkf5XAMCgOXCMN1iVej3kQbiacuQ6ETgUlmmg5WxHVm+zyQ9wZxHYv20hv4iZy/p1pkuz39ZTb+O
	UzD4HvZZY1op9wnJe/xaCkiY5epP8H940UNI/nfpERJpVo+LsG+5j7nUFDPc03rNYY8tPSNqwIjWn
	nkZgOQgLxAD4E93N5ldDOClE9iSvZ8pvGZ+VLpMDHjUi3HJH+X2jVMWZ1EXcT5Wn74QW5YpWRO+fO
	sKV9+/8+KIGzcfkH5JkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFB4B-009raz-1g;
	Mon, 18 Dec 2023 10:41:43 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFB42-009rPt-0y
	for linux-riscv@lists.infradead.org;
	Mon, 18 Dec 2023 10:41:37 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-591341db3a1so1991414eaf.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Dec 2023 02:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702896093; x=1703500893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgKUGLZYGcoLOqmpRwG/psCt/ko1c3dSc+eXyp7wwIo=;
        b=ouQIXDdVJWqpVPPH57Kwfs0MDZ0GJLOiXmsKOhoL8ywBSUg47YcLE9QC3PEV0/Gr3T
         kQ6qnmo97BRLITVBB7PoM3I2fENUqZsZ+700odhShtgQyPmmlmCh+PQcmEkLdR5to87g
         DFqpPtqqGaLWndvhhRvbtWrN95WF/+CF/oTLfvEnd3KpZA+dR9kqpfQZ4yKFagng2zqT
         4GzA2bG4dX4HbWD+AviSlDPhb4jW5PcP+FRiO/NG+FJco4fE781qyV19klJGazG5Qjzs
         hk0XJP7Q7zIZ9cT2McvMuHAD+FiCVVLjYrpn7U1ZYch2OMiBP5flYQPH0bhjibHPV07s
         cx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702896093; x=1703500893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgKUGLZYGcoLOqmpRwG/psCt/ko1c3dSc+eXyp7wwIo=;
        b=jWLVUKSrvpCYih9BXO8KX4u/aoxIpew8YZckv9/yx1TUFy9zGGfu4HPo4/0qQ/FDrh
         w/l7Jw/4T6gOMFrQTMX5xcnWVAZ0L8km5+s/vguNaxQm1MfT+vOPLWZIBUaeWBhbXLzY
         I3skkeThcwKiqmiWl6olmW1pi04Ry4C9f+k8SHutiQL8eHZ2dTimiNEH0a1OiP7YZtk8
         6KjZl5dIXOsrlQKuUCJtPDuRX2eODgmJ/DHGS/EfG+zlShFL8Ce1x349K2mksSL2tecU
         3NMLANFAa7ddgvzD4do3b4lrDQy0TJgvX0q1Ah+SnGYMfkM8/S4seBE6a7IkJ6o6Aggw
         Zjog==
X-Gm-Message-State: AOJu0YyL9XvRTDtom2r96h1PNKvDz5xqzLvPVsn4cerc+lvTt+capZjB
	rL8IHN3KlOFV8Uaakfmb4YeDW+8jEt5+UMsYNYU=
X-Google-Smtp-Source: AGHT+IEBb0RG9MLmiB4GFclqVcg7m58Aqj85ARHZP5CDG+c2IRjV9jKFX8F79mAp266/vcfC4kRB4Q==
X-Received: by 2002:a4a:ab8e:0:b0:591:98d0:c5e0 with SMTP id m14-20020a4aab8e000000b0059198d0c5e0mr2860672oon.11.1702896093564;
        Mon, 18 Dec 2023 02:41:33 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 185-20020a4a1ac2000000b005907ad9f302sm574970oof.37.2023.12.18.02.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 02:41:33 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [v1 10/10] RISC-V: KVM: Support 64 bit firmware counters on RV32
Date: Mon, 18 Dec 2023 02:41:07 -0800
Message-Id: <20231218104107.2976925-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218104107.2976925-1-atishp@rivosinc.com>
References: <20231218104107.2976925-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_024134_361771_F8FB3F25 
X-CRM114-Status: GOOD (  15.67  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The SBI v2.0 introduced a fw_read_hi function to read 64 bit firmware
counters for RV32 based systems.

Add infrastructure to support that.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h |  4 ++-
 arch/riscv/kvm/vcpu_pmu.c             | 37 ++++++++++++++++++++++++++-
 arch/riscv/kvm/vcpu_sbi_pmu.c         |  6 +++++
 3 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index 931887e07a66..5da5df21ec54 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -20,7 +20,7 @@ static_assert(RISCV_KVM_MAX_COUNTERS <= 64);
 
 struct kvm_fw_event {
 	/* Current value of the event */
-	unsigned long value;
+	uint64_t value;
 
 	/* Event monitoring status */
 	bool started;
@@ -91,6 +91,8 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 				     struct kvm_vcpu_sbi_return *retdata);
 int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 				struct kvm_vcpu_sbi_return *retdata);
+int kvm_riscv_vcpu_pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
+				struct kvm_vcpu_sbi_return *retdata);
 void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_pmu_setup_snapshot(struct kvm_vcpu *vcpu, unsigned long saddr_low,
 				       unsigned long saddr_high, unsigned long flags,
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 368c3a8a8d4a..5c21035e284d 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -196,6 +196,29 @@ static int pmu_get_pmc_index(struct kvm_pmu *pmu, unsigned long eidx,
 	return kvm_pmu_get_programmable_pmc_index(pmu, eidx, cbase, cmask);
 }
 
+static int pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
+			      unsigned long *out_val)
+{
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	struct kvm_pmc *pmc;
+	int fevent_code;
+
+	if (!IS_ENABLED(CONFIG_32BIT))
+		return -EINVAL;
+
+	pmc = &kvpmu->pmc[cidx];
+
+	if (pmc->cinfo.type != SBI_PMU_CTR_TYPE_FW)
+		return -EINVAL;
+
+	fevent_code = get_event_code(pmc->event_idx);
+	pmc->counter_val = kvpmu->fw_event[fevent_code].value;
+
+	*out_val = pmc->counter_val >> 32;
+
+	return 0;
+}
+
 static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 			unsigned long *out_val)
 {
@@ -701,6 +724,18 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 	return 0;
 }
 
+int kvm_riscv_vcpu_pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
+				   struct kvm_vcpu_sbi_return *retdata)
+{
+	int ret;
+
+	ret = pmu_fw_ctr_read_hi(vcpu, cidx, &retdata->out_val);
+	if (ret == -EINVAL)
+		retdata->err_val = SBI_ERR_INVALID_PARAM;
+
+	return 0;
+}
+
 int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 				struct kvm_vcpu_sbi_return *retdata)
 {
@@ -774,7 +809,7 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 			pmc->cinfo.csr = CSR_CYCLE + i;
 		} else {
 			pmc->cinfo.type = SBI_PMU_CTR_TYPE_FW;
-			pmc->cinfo.width = BITS_PER_LONG - 1;
+			pmc->cinfo.width = 63;
 		}
 	}
 
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
index 9f61136e4bb1..58a0e5587e2a 100644
--- a/arch/riscv/kvm/vcpu_sbi_pmu.c
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -64,6 +64,12 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case SBI_EXT_PMU_COUNTER_FW_READ:
 		ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
 		break;
+	case SBI_EXT_PMU_COUNTER_FW_READ_HI:
+		if (IS_ENABLED(CONFIG_32BIT))
+			ret = kvm_riscv_vcpu_pmu_fw_ctr_read_hi(vcpu, cp->a0, retdata);
+		else
+			retdata->out_val = 0;
+		break;
 	case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
 		ret = kvm_riscv_vcpu_pmu_setup_snapshot(vcpu, cp->a0, cp->a1, cp->a2, retdata);
 		break;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
