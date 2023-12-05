Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F849C10DC1
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 02:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnPeLf4DWug2VVF9pmZAA9gWpaFJtEZieYKpg+h1pI8=; b=FKAVU7Sj40fJ/i
	yhUrduh7ffAsI4jghJ0J0ARJjg6ZT3+hvBRnO14YZrAwbRwU95gUiRsTGqqzvkf7KIPouQVmthV2V
	ktmrqlB88BU8Rqg270BIYs5XRnptyWAvHd9Xk2W/jvelpOZ+flYIdv3H2mVX2Lv7BL72LD3kSb7sd
	t4B/zZ29ORfyBIBB7xHOxzo7uuiX4Vs2FeYUuBw2BqEuuV/WWNDg0TEFldfxz5sNr2qGJ/mQDywAL
	XiRHogzDbu1hULJ7k4Jw0o4hpL2YIwpDhRmNtvTGNL7P+e0bsyzz4qI3RkGqE2w8zcyGLo2+9c5hR
	5SrzoaQHEeOpFf4P5jCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rALPh-0064Ei-1b;
	Tue, 05 Dec 2023 02:43:57 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rALPY-00645N-1x
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 02:43:52 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6d8d28e4bbeso1502222a34.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 18:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701744228; x=1702349028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7KPiKrm0gOhakxC/Wb7OeJ/9kc5D1cjNr8HphWNKE8=;
        b=DcVXBuSKNmw6IHWTnOahfuQg0mTc+3PCo43B9KqkBlRugJ09Fii70ae3LLoO278+sC
         OrKfXkW3JpXRxtKY5GrXS+xgI/wZ3tZqVjadAt1/BYFkmbaBTwoOtrjUuFpBUuZbLxKz
         JDseG8b5ok2fPPbOBAXs212THWXqSAxLzaZ8qR0eEo986f+GWX/+spSwWncW2S8sDImO
         ZBPeNpe0pdoSXvIOoz2RtPM19fD2Haxbh23cPpyQ4kXZ4G/IqSSsk4UpRObKbjHEO+sr
         4ls2iOD1yupCoQhefoqhy1swUqtq+J4hB5SBWEQrLJgcgwDhqmV5z29MOm0lTnmgVjWF
         SYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701744228; x=1702349028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7KPiKrm0gOhakxC/Wb7OeJ/9kc5D1cjNr8HphWNKE8=;
        b=HBEpUfYEI4z2NK5ZMLFmh0B270WoLS6ImiA/VEQ9nv6JRP3PZ1gjBqQ4tGsxP2CMeQ
         b92xpPMj68cfwOeMS/FBlBkA3awmqCXKiLIfh1SKKy8M4q+naMJBPE1s/rLEnyPhRCVk
         O/j3Uxcpu3bAGYJhwQBVmsWObw+IGc9n5YIZTN87VErlyTUhPxQX/DdS7X1jO+Zf27Xl
         utoHyvsYywcDKAtmYTpzBP00gxUJJA0+ib6adujTJU8rP9o0h1lOSxqiIjSO8CmhrKWl
         bMTAufrDPK4Rct3aoTi6sfHCSzmVQHpmdWxnwrfxiPWIi/gpKZUIPMLzEYPRTdFV1qta
         844g==
X-Gm-Message-State: AOJu0YzgrmmPimOq9MpUWO/TVRJWdEKtnrtXeqbM8aubwIeyHF2YSiIt
	ddGewlndvVGVxwWZ16bt28UC9Q==
X-Google-Smtp-Source: AGHT+IFjpVDyqkSHbaNqwFBeSjOTvhTrHeLCZiADHAwpcAR48Wdh3tXdrlaF62vWprf7yMCdI/PbwA==
X-Received: by 2002:a05:6830:1c8:b0:6d8:322d:e76d with SMTP id r8-20020a05683001c800b006d8322de76dmr5108332ota.38.1701744227938;
        Mon, 04 Dec 2023 18:43:47 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z17-20020a9d62d1000000b006b9848f8aa7sm2157655otk.45.2023.12.04.18.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 18:43:47 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC 9/9] RISC-V: KVM: Support 64 bit firmware counters on RV32
Date: Mon,  4 Dec 2023 18:43:10 -0800
Message-Id: <20231205024310.1593100-10-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205024310.1593100-1-atishp@rivosinc.com>
References: <20231205024310.1593100-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_184348_824994_E6B42E4F 
X-CRM114-Status: GOOD (  15.15  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The SBI v2.0 introduced a fw_read_hi function to read 64 bit firmware
counters for RV32 based systems.

Add infrastructure to support that.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h |  6 ++++-
 arch/riscv/kvm/vcpu_pmu.c             | 38 ++++++++++++++++++++++++++-
 arch/riscv/kvm/vcpu_sbi_pmu.c         |  7 +++++
 3 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index 64c75acad6ba..dd655315e706 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -20,7 +20,7 @@ static_assert(RISCV_KVM_MAX_COUNTERS <= 64);
 
 struct kvm_fw_event {
 	/* Current value of the event */
-	unsigned long value;
+	uint64_t value;
 
 	/* Event monitoring status */
 	bool started;
@@ -91,6 +91,10 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 				     struct kvm_vcpu_sbi_return *retdata);
 int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 				struct kvm_vcpu_sbi_return *retdata);
+#if defined(CONFIG_32BIT)
+int kvm_riscv_vcpu_pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
+				struct kvm_vcpu_sbi_return *retdata);
+#endif
 void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_pmu_setup_snapshot(struct kvm_vcpu *vcpu, unsigned long saddr_low,
 				       unsigned long saddr_high, unsigned long flags,
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 86c8e92f92d3..5b4a93647256 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -195,6 +195,28 @@ static int pmu_get_pmc_index(struct kvm_pmu *pmu, unsigned long eidx,
 
 	return kvm_pmu_get_programmable_pmc_index(pmu, eidx, cbase, cmask);
 }
+#if defined(CONFIG_32BIT)
+static int pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
+			      unsigned long *out_val)
+{
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	struct kvm_pmc *pmc;
+	u64 enabled, running;
+	int fevent_code;
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
+#endif
 
 static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 			unsigned long *out_val)
@@ -696,6 +718,20 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 	return 0;
 }
 
+#if defined(CONFIG_32BIT)
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
+#endif
+
 int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 				struct kvm_vcpu_sbi_return *retdata)
 {
@@ -769,7 +805,7 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 			pmc->cinfo.csr = CSR_CYCLE + i;
 		} else {
 			pmc->cinfo.type = SBI_PMU_CTR_TYPE_FW;
-			pmc->cinfo.width = BITS_PER_LONG - 1;
+			pmc->cinfo.width = 63;
 		}
 	}
 
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
index 77c20a61fd7d..0cd051d5a448 100644
--- a/arch/riscv/kvm/vcpu_sbi_pmu.c
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -64,6 +64,13 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case SBI_EXT_PMU_COUNTER_FW_READ:
 		ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
 		break;
+	case SBI_EXT_PMU_COUNTER_FW_READ_HI:
+#if defined(CONFIG_32BIT)
+		ret = kvm_riscv_vcpu_pmu_fw_ctr_read_hi(vcpu, cp->a0, retdata);
+#else
+		retdata->out_val = 0;
+#endif
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
