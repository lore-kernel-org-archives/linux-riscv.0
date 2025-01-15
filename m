Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD063C02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0KqIaxNWg4LqiFDRBid1pC0tEeRZuUo2ZcjVpTsOdyI=; b=MvMFOWMa3Rwf1C
	G+upvoBVmAGN5f1LhK43G4unvzcAO0v5LlLPwSgCjAfPEm+OoPygrP7MbsdrEt5yD+9Ixp9se1lwD
	+5h1lHpNtEqPKQgtL8nFFAcrtH9kRH9YcaA583ytTDErg8DCiL9mZW8D4izg+9VXSAy4hbEcngGbh
	d1M2f4bGDSlG4z8Lrx4ea+FC0Dvaez3RtjJKED8+j7qips61GSh+H9JRdGW8oOudk0b02IDjFEyYw
	M2nkeq61dMZkxKCsVTbFyaxxbzj9RXa9bj/uMQp5LBofKeeSrOmEOEG4ww07NU91v6SsSmVh4dj37
	D5B1DDIjlPja9qGPVnUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8EA-0000000CmRh-2MpJ;
	Wed, 15 Jan 2025 18:34:54 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AM-0000000Cl9U-0zIc
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 18:31:00 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2167141dfa1so1961265ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 10:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965858; x=1737570658; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTd9Qo5vidtOLE+cxHwuaQqNzwk6goJIP9mJXkel4TI=;
        b=wzg+C70y9UjY0htO85yiAYz8hzdw7aQUWp0ioyCGBnW5lCzQ9YPMU5X84FeEtMD8PG
         P5GBibOKB5nmkf4qm7TzdoYRyrPcpP1UpzjXXeH4l9ys7mEjpaWXaqEkYDig39qOkB+0
         QBmgdZf6vbWsBspYs+yEntoZGmwou6fAWzbvHex282RE3ni82+Pc9Ep5Xx3XZpMGpZWA
         gCaBvFJaYuR45DeALO6owTMQ0HwCxgVjUcupTekGFYYQUj90rgdsRSQBX4dCQcyIDXMB
         BJBnlXz/VpqLEHe+IHsO84nFdjAieXUy6RlcJ2CWaM/TvLDGLeGBbVlLSPHQpGF4Mnux
         gFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965858; x=1737570658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTd9Qo5vidtOLE+cxHwuaQqNzwk6goJIP9mJXkel4TI=;
        b=GY7zNXFEkVI3+4zn8iqWsHpotTo4z57d6Mr4utQNwaELlktLX4fVYPszfJsyTDReyi
         Gt1ZUisw2yrCzLCCbj+Oc1o+lDjeqgmzs6thDpUo1kT4ssqvAEefwAKhMWZVepPVySJ6
         Ei++CZNLt+PldJcNR2QtMmID9d+4DYnj9qb/d0Jc/DVu7k2dWUrGxDA22ZiSP0Ba0Zvh
         /NRoVxVRXu2yZAy2nDCNawDo4fvG/McP+WlmD9D8s7GLZQaGSvBq9t7rHtoseobWVS80
         y5taNZJ6N59fVm5YRN/a/wrM8dzIbmq9BOWwNq2cxEiKE0PD9xY8Cw/u+JEoDjomKBMn
         gijQ==
X-Gm-Message-State: AOJu0YyNPtbpRWdCz0gfDlrrY8gBq8sfLiosR1RwlNcjQwQLM0XQHEd4
	Ag1LtLc1ONVfegZuWDiH04abIX00ZihYyvmgSRcVQuyRUldtH/pKciIGIas9beU=
X-Gm-Gg: ASbGncu4EhWKqBbbTDQryK+36XAsW0CvHxc02ZwDfbmT7kbn9kWT7EE/EoxchI55JT+
	HIgJrwhBfrpOn8gqyA2e2yC8wvVSkdGxcJQ/LU7w7sn/KWq+FXHlvZtOEvfBCriwnmY4pyMegLy
	zqZaRKz0kaA3TrTslvxq11A+3a8mkA9V/Jkst9Uvc3CIm9znbcFkuMcsdpEiN6Hm1TM1mZepQa8
	RH4hdg6JyThXhLRXTrjwVCmCPXSvXv+3XSg3uwVkOlMLUlI6YAQMGyZNdpbfWI/z6TPGw==
X-Google-Smtp-Source: AGHT+IHHO3B1HJhEuywvwBIX7b7bfSC/4ve6r1ZbOzw3ZYVhbL87vWT2YRpjRvKHUMwV10zBAIgK0g==
X-Received: by 2002:a17:903:2291:b0:215:58be:334e with SMTP id d9443c01a7336-21bf0bb89cemr59154695ad.10.1736965857674;
        Wed, 15 Jan 2025 10:30:57 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:30:57 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 10:30:42 -0800
Subject: [PATCH v2 2/9] drivers/perf: riscv: Add raw event v2 support
MIME-Version: 1.0
Message-Id: <20250115-pmu_event_info-v2-2-84815b70383b@rivosinc.com>
References: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
In-Reply-To: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_103058_279322_ED6B115B 
X-CRM114-Status: GOOD (  15.86  )
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

SBI v3.0 introduced a new raw event type that allows wider
mhpmeventX width to be programmed via CFG_MATCH.

Use the raw event v2 if SBI v3.0 is available.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h |  4 ++++
 drivers/perf/riscv_pmu_sbi.c | 16 ++++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3d250824178b..6ce385a3a7bb 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -160,7 +160,10 @@ struct riscv_pmu_snapshot_data {
 
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
+/* SBI v3.0 allows extended hpmeventX width value */
+#define RISCV_PMU_RAW_EVENT_V2_MASK GENMASK_ULL(55, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
+#define RISCV_PMU_RAW_EVENT_V2_IDX 0x30000
 #define RISCV_PLAT_FW_EVENT	0xFFFF
 
 /** General pmu event codes specified in SBI PMU extension */
@@ -218,6 +221,7 @@ enum sbi_pmu_event_type {
 	SBI_PMU_EVENT_TYPE_HW = 0x0,
 	SBI_PMU_EVENT_TYPE_CACHE = 0x1,
 	SBI_PMU_EVENT_TYPE_RAW = 0x2,
+	SBI_PMU_EVENT_TYPE_RAW_V2 = 0x3,
 	SBI_PMU_EVENT_TYPE_FW = 0xf,
 };
 
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 170aa93106b9..5d5b399b3e77 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -59,7 +59,7 @@ asm volatile(ALTERNATIVE(						\
 #define PERF_EVENT_FLAG_USER_ACCESS	BIT(SYSCTL_USER_ACCESS)
 #define PERF_EVENT_FLAG_LEGACY		BIT(SYSCTL_LEGACY)
 
-PMU_FORMAT_ATTR(event, "config:0-47");
+PMU_FORMAT_ATTR(event, "config:0-55");
 PMU_FORMAT_ATTR(firmware, "config:62-63");
 
 static bool sbi_v2_available;
@@ -527,8 +527,10 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 		break;
 	case PERF_TYPE_RAW:
 		/*
-		 * As per SBI specification, the upper 16 bits must be unused
-		 * for a hardware raw event.
+		 * As per SBI v0.3 specification,
+		 *  -- the upper 16 bits must be unused for a hardware raw event.
+		 * As per SBI v3.0 specification,
+		 *  -- the upper 8 bits must be unused for a hardware raw event.
 		 * Bits 63:62 are used to distinguish between raw events
 		 * 00 - Hardware raw event
 		 * 10 - SBI firmware events
@@ -537,8 +539,14 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 
 		switch (config >> 62) {
 		case 0:
+			if (sbi_v3_available) {
+			/* Return error any bits [56-63] is set  as it is not allowed by the spec */
+				if (!(config & ~RISCV_PMU_RAW_EVENT_V2_MASK)) {
+					*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
+					ret = RISCV_PMU_RAW_EVENT_V2_IDX;
+				}
 			/* Return error any bits [48-63] is set  as it is not allowed by the spec */
-			if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
+			} else if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
 				*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
 				ret = RISCV_PMU_RAW_EVENT_IDX;
 			}

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
