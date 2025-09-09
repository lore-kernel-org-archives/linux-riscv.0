Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5AFCAC58C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 08:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4m3hUhVtHUix06qwunLOmEXQF0i45UiYFvqGoCDF6CU=; b=ZwKxwoHj6xhB9k
	JyNl8JJOgMNY+9tzNrY02CC0hdbqFlGEcGKVdkkJaNkkSwhXMmRTXMd7iQ5ZkvE+qPYLWND9Ujld+
	0wHHqrVFQAh0Plcw802DVqD4V/wS5gv6uaTwqHljEBBv6Ti3JX6bRxXcHvk88W4P7Xdj1rexdv+Hf
	RU9JQSiYhgD/eVyNS/il1v3F4j/TBfVV+lRTTd1Jc+jW6e3hjNPJV5UrBVDgKEWO7eA+3xDm1mPwG
	pkLwNRbwS3lAB2Soev5QiCafguVtFT8KdYYGjPrrKIMxyK6qOL6rQcy37JLqBJ2Ksy/vP7ATtO8hY
	z4Uj5ZbFlydQJ0VNcVfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtIi-00000005PLA-06sl;
	Tue, 09 Sep 2025 08:02:04 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsO4-000000051my-2r5S
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 07:03:33 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-32bae4bcd63so2814386a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 00:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757401412; x=1758006212; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1acfgimCOFblXvFIi2ykb4JvdpnCtTT9WTI2WJXrlYg=;
        b=TsncNRksVwC68DNWhCOTJ4u7qN8x48bA/koWKwxGFOboGEd4IDnJrgl/1G/swWQEDN
         EFI7XYl8pOucFtyubP6nTqN5+L1jz+CRLn7B83QrdJWTWbLY763wk8pKFsEJxdyOZOz2
         n5xFTeyGuCM9WHcOozLk+Bd8G3OGaRNu7vcptVLdZ4oypz2muGQjiEBeMCB3+EZnPTxq
         GAZoWCjWqJ7Fv7QN5oYiei73hGPgUnbj33awcw/xLbeYE7iHNKYXNMZps+yOtLUI6Dg8
         E8GhGZHF4HVbgaC9R1Ni6+9uS9NK37pk1hMwcGP2oHkGo/gHjIhRI5yX5J6U4OSgxIkD
         TjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757401412; x=1758006212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1acfgimCOFblXvFIi2ykb4JvdpnCtTT9WTI2WJXrlYg=;
        b=D3CsWEgtu6U7cn35xnry1nAEGFQvMTqi18Y+FylOgLR2RTQRAdRHAxjpVGr3Xey+17
         lw/D4IdbklpBmhhYn3qbgfk4AkkWEuVl8lgJj41SNJKjy3f8TXhFohIf1ReeftHeT1Wq
         vmDxMLsNvYVSLLZY4VSdvaQe22F+OEEUTwSkkp5uhM0p7/1N5M3zhRP/TFQgSWl2n2wB
         On1gEIChtXOzZUPsKoT1lThe0zZhCpHQag0vNHX0ttsn9a6iiNMqGaz/sCrhFyz63+Yp
         bIi+XhI77AoUQYMoq7ApdSqVnKKpvV0+EYsXxl12o2JMxINVwfktTjobuUCIHK489Sim
         gBSw==
X-Gm-Message-State: AOJu0YytreHrUcZ9kXkPtPVMTdnLKe5TnQusW/UO3SZXQnj5Ut3G4Ggx
	AaIB4DnTvRk9O3m3pon/njkjNx9gtlVuAzsnfBJX3b8LJhwAoOUBAn9d5QX9zFFBvAs=
X-Gm-Gg: ASbGnctn22lKhNEqZLs5732Q7wF+nUW2UGuxMcWFAmMnublmUA1WwUwI62H0g8sDgop
	K1TF2lWoxBLhyo8+FD3lZAfx2Gy1YuIPl8k74jpol9iaWrFnYDHHr/GGgdGOfRk2cWaD3UksywB
	3EPQprTmjmy+s/7s4fEDH0kRTj6q5uxtwVSwklQCmxpoHYDrW4L2Y5M8E1dICNw4/aVyPtMjkXZ
	QdgeHQB54gZIVgZJnMx0HlAu7LBLztKTcwEue9Gz+zTwvR8KjBOqLFTKHh/iH7FJhgLjHTq8fWw
	t9NAhwEZ/ntXgQU+kK2AzANxxTNvKWF9Oy3NCDAn3iO7mvx1dRD6Y/n/3I4awf6x3GEgrV9kpbl
	Gm44ugvdjvo/YRn4q78y0KPrO+hODqAss+LE=
X-Google-Smtp-Source: AGHT+IHkDiF/6YwaQUzgE/xNLZqLa3zDoLihcHBPhzjoYmHrHw+d+76R53kpaEg8N/1vJrkgHwEwEw==
X-Received: by 2002:a17:90b:35c6:b0:32c:2c5:e21 with SMTP id 98e67ed59e1d1-32d43f85d9emr12290210a91.32.1757401411327;
        Tue, 09 Sep 2025 00:03:31 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7158sm1025535b3a.72.2025.09.09.00.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:03:30 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 09 Sep 2025 00:03:26 -0700
Subject: [PATCH v6 7/8] RISC-V: KVM: Implement get event info function
MIME-Version: 1.0
Message-Id: <20250909-pmu_event_info-v6-7-d8f80cacb884@rivosinc.com>
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
In-Reply-To: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_000332_718029_705A89C2 
X-CRM114-Status: GOOD (  15.16  )
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

The new get_event_info funciton allows the guest to query the presence
of multiple events with single SBI call. Currently, the perf driver
in linux guest invokes it for all the standard SBI PMU events. Support
the SBI function implementation in KVM as well.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h |  3 ++
 arch/riscv/kvm/vcpu_pmu.c             | 59 +++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_pmu.c         |  3 ++
 3 files changed, 65 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index 1d85b6617508..9a930afc8f57 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -98,6 +98,9 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long saddr_low,
 				      unsigned long saddr_high, unsigned long flags,
 				      struct kvm_vcpu_sbi_return *retdata);
+int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low,
+				  unsigned long saddr_high, unsigned long num_events,
+				  unsigned long flags, struct kvm_vcpu_sbi_return *retdata);
 void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
 
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index f8514086bd6b..a2fae70ee174 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -449,6 +449,65 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	return 0;
 }
 
+int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low,
+				  unsigned long saddr_high, unsigned long num_events,
+				  unsigned long flags, struct kvm_vcpu_sbi_return *retdata)
+{
+	struct riscv_pmu_event_info *einfo = NULL;
+	int shmem_size = num_events * sizeof(*einfo);
+	gpa_t shmem;
+	u32 eidx, etype;
+	u64 econfig;
+	int ret;
+
+	if (flags != 0 || (saddr_low & (SZ_16 - 1) || num_events == 0)) {
+		ret = SBI_ERR_INVALID_PARAM;
+		goto out;
+	}
+
+	shmem = saddr_low;
+	if (saddr_high != 0) {
+		if (IS_ENABLED(CONFIG_32BIT)) {
+			shmem |= ((gpa_t)saddr_high << 32);
+		} else {
+			ret = SBI_ERR_INVALID_ADDRESS;
+			goto out;
+		}
+	}
+
+	einfo = kzalloc(shmem_size, GFP_KERNEL);
+	if (!einfo)
+		return -ENOMEM;
+
+	ret = kvm_vcpu_read_guest(vcpu, shmem, einfo, shmem_size);
+	if (ret) {
+		ret = SBI_ERR_FAILURE;
+		goto free_mem;
+	}
+
+	for (int i = 0; i < num_events; i++) {
+		eidx = einfo[i].event_idx;
+		etype = kvm_pmu_get_perf_event_type(eidx);
+		econfig = kvm_pmu_get_perf_event_config(eidx, einfo[i].event_data);
+		ret = riscv_pmu_get_event_info(etype, econfig, NULL);
+		einfo[i].output = (ret > 0) ? 1 : 0;
+	}
+
+	ret = kvm_vcpu_write_guest(vcpu, shmem, einfo, shmem_size);
+	if (ret) {
+		ret = SBI_ERR_INVALID_ADDRESS;
+		goto free_mem;
+	}
+
+	ret = 0;
+free_mem:
+	kfree(einfo);
+out:
+	retdata->err_val = ret;
+
+	return 0;
+}
+
 int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu,
 				struct kvm_vcpu_sbi_return *retdata)
 {
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
index e4be34e03e83..a020d979d179 100644
--- a/arch/riscv/kvm/vcpu_sbi_pmu.c
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -73,6 +73,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
 		ret = kvm_riscv_vcpu_pmu_snapshot_set_shmem(vcpu, cp->a0, cp->a1, cp->a2, retdata);
 		break;
+	case SBI_EXT_PMU_EVENT_GET_INFO:
+		ret = kvm_riscv_vcpu_pmu_event_info(vcpu, cp->a0, cp->a1, cp->a2, cp->a3, retdata);
+		break;
 	default:
 		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
 	}

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
