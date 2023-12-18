Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC8FC35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 10:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPt8LAZJ4wcZhF5B/l74GcaoUPP8jKJHYUxWztf22CU=; b=a7R8iwVnispc6p
	a44KtoR+NuMIM3B7AfjisS12D00vRkYpd45iSQszjOAN34dWEnnxA81Tlx2ZD/7MH6GBokoy1Heji
	SBNO7F3oqNOVehM2/swLJ2NsGbMS+yxPagDZvbwrWvOvLuN739VmSyQQD5sA0DfnsQf6lrKLtceHu
	Y8pYKncxTBhkFKLXqVIuMbZyQtExzujY3SCbraspPsj6nvDcfby1f6MsoCzwI5aBZLuUnlTJDcP+9
	a6c5q8XY2PuIA5uDmYAO2OxH3X+05aDg9bUVlzBPCajYJuYhkNKs0A9t8W1hzJfOFvPtAV1gpfhPN
	xrBcrc00D0bh4NyQbZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFB45-009rTj-2Y;
	Mon, 18 Dec 2023 10:41:37 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFB3x-009rLA-0a
	for linux-riscv@lists.infradead.org;
	Mon, 18 Dec 2023 10:41:32 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5916c6b2e0fso1847782eaf.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Dec 2023 02:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702896088; x=1703500888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9sAaI5x/m4qa/IsblGkrHPvGq73TiWdoovLssK6KVs=;
        b=2tejSX6SW7HZxiBDO2ISSVQM4VUS4VQRSh74IS0ByOeXb/LlQLPeQzBUsa0vbuRp0H
         rTINBd+uNPIQcRsYK37SBhLYR6L7Xbw5s6PjGaSWK2NiA5erOR2iDC3VSPQbDh6z3lkR
         pTracPjldrhpJV8Z46TVQ+3j2+Rioy1pZviE8tkRl2Qm6LkRPUuf6UpxEZg+ak8wYHb+
         uZbBGV0NG3Oya2i95AU4Lw3H0lcksYKKqcOdUDmItKBuSJ3N8TS7EHKKXNTMgy1YeopT
         1+mylt1VDu4YxnAxzJzAdxs9Dnq4s9jdoZqUlAfrEloUlkBmt29v6sgH83ZI5bYeptCD
         PAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702896088; x=1703500888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9sAaI5x/m4qa/IsblGkrHPvGq73TiWdoovLssK6KVs=;
        b=xO942rJjTpVO1SIe02AtfE90M7JlmsIR/Mg7B3SRIRSVHUmHfZASAWnzo2y9esBzMg
         JOjk7iOz4rcd5J60HAAW8ZqRdW4LlC3UWXrNjx4aD2aUuOI3rBG1U607yUKZXNVpBmuE
         rk96JM4Rktw9v+n0e+FARShkt2SsbcVXaPrnZwb4kmFpBMC7METX24Mbh+GESEVoAU1U
         Osn9WaAuPp12QmRnJQDU4Wi8Jw1Io7eQ2TUjGoGbG8wElSI9Cvi7BZV6JRw0Kco5rpmt
         Blvfs1ito9divRBXSnHg0+GpAz6R/PaFe7F0ufHWBmNW2a4jQs1Mp01n3OFnpzFdGg0H
         5D+Q==
X-Gm-Message-State: AOJu0YzCGwIQsCEEgwx/0bYYbKpSBFvAIgFTvAOTi2S3WSvtgymT7rti
	h3LKpvA4bn4BUdrglbdIYMXamQ==
X-Google-Smtp-Source: AGHT+IE8rqcGYbpX5zfzh086GD+kPOXZmg7tTADIINBhCIkcHBriRp6Yc5OpCWAefeUGFA0vrx+W3g==
X-Received: by 2002:a05:6820:168b:b0:58e:1c47:6321 with SMTP id bc11-20020a056820168b00b0058e1c476321mr10764799oob.15.1702896088517;
        Mon, 18 Dec 2023 02:41:28 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 185-20020a4a1ac2000000b005907ad9f302sm574970oof.37.2023.12.18.02.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 02:41:28 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [v1 07/10] RISC-V: KVM: No need to exit to the user space if perf event failed
Date: Mon, 18 Dec 2023 02:41:04 -0800
Message-Id: <20231218104107.2976925-8-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218104107.2976925-1-atishp@rivosinc.com>
References: <20231218104107.2976925-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_024129_223351_CEADFE5F 
X-CRM114-Status: GOOD (  16.33  )
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

Currently, we return a linux error code if creating a perf event failed
in kvm. That shouldn't be necessary as guest can continue to operate
without perf profiling or profiling with firmware counters.

Return appropriate SBI error code to indicate that PMU configuration
failed. An error message in kvm already describes the reason for failure.

Fixes: 0cb74b65d2e5 ("RISC-V: KVM: Implement perf support without sampling")
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c     | 14 +++++++++-----
 arch/riscv/kvm/vcpu_sbi_pmu.c |  6 +++---
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 8c44f26e754d..08f561998611 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -229,8 +229,9 @@ static int kvm_pmu_validate_counter_mask(struct kvm_pmu *kvpmu, unsigned long ct
 	return 0;
 }
 
-static int kvm_pmu_create_perf_event(struct kvm_pmc *pmc, struct perf_event_attr *attr,
-				     unsigned long flags, unsigned long eidx, unsigned long evtdata)
+static long kvm_pmu_create_perf_event(struct kvm_pmc *pmc, struct perf_event_attr *attr,
+				      unsigned long flags, unsigned long eidx,
+				      unsigned long evtdata)
 {
 	struct perf_event *event;
 
@@ -455,7 +456,8 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 				     unsigned long eidx, u64 evtdata,
 				     struct kvm_vcpu_sbi_return *retdata)
 {
-	int ctr_idx, ret, sbiret = 0;
+	int ctr_idx, sbiret = 0;
+	long ret;
 	bool is_fevent;
 	unsigned long event_code;
 	u32 etype = kvm_pmu_get_perf_event_type(eidx);
@@ -514,8 +516,10 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 			kvpmu->fw_event[event_code].started = true;
 	} else {
 		ret = kvm_pmu_create_perf_event(pmc, &attr, flags, eidx, evtdata);
-		if (ret)
-			return ret;
+		if (ret) {
+			sbiret = SBI_ERR_NOT_SUPPORTED;
+			goto out;
+		}
 	}
 
 	set_bit(ctr_idx, kvpmu->pmc_in_use);
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
index 7eca72df2cbd..b70179e9e875 100644
--- a/arch/riscv/kvm/vcpu_sbi_pmu.c
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -42,9 +42,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 #endif
 		/*
 		 * This can fail if perf core framework fails to create an event.
-		 * Forward the error to userspace because it's an error which
-		 * happened within the host kernel. The other option would be
-		 * to convert to an SBI error and forward to the guest.
+		 * No need to forward the error to userspace and exit the guest
+		 * operation can continue without profiling. Forward the
+		 * appropriate SBI error to the guest.
 		 */
 		ret = kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1,
 						       cp->a2, cp->a3, temp, retdata);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
