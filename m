Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A61D6C295
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Nov 2024 20:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTqpU2GE9PGVTNmtM5woCOhgCoWZsNHumlZK8rkilsc=; b=uMBLPTPpNDWNW4
	klm6+M2gsI6WIDPfpkEhYSW3DsuzYWdqclDwxrID9pyUHM9n4ME4Z2akq1BAaj3uli7y9xjZqtK9m
	mMAROOYtjoEiGqVUzCr2jCyGy0zrRwgULA88MIaR4rfpo6jolgGlvYNsbqGy/JbS+pwa+pMM3uzzt
	ArLolUo9XQu9Yc8lbbBJS5nPo6bAq3vs88sgDj8EUj1ifCRA+9ZVxIIiHIIIUMY8tRuto3Qfg0oSI
	wV7lGINqudiYwJ76cdDHudHbVfOYkf0/JAWbb+GCeVvZ2Z34NqaHj2k/8BpABUtwri+SNLo5V32bz
	kGZMBnXiQMaAyouHrb7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUux-0000000Di8t-1EKg;
	Tue, 19 Nov 2024 20:33:47 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUs9-0000000Dgzc-2NCw
	for linux-riscv@lists.infradead.org;
	Tue, 19 Nov 2024 20:30:55 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ea39638194so2817648a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Nov 2024 12:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732048252; x=1732653052; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRmKVkktJnfpekqs0vaEt2UdODXxii8BcnwHInLLVOw=;
        b=tdQuQK3VfHvpeeO5xWbrQBgnx+0ho7qsB1FNIgIAUk5N6uB7zQea8DVi2i5fRConZo
         8AvZK6UWi/aFIoqoQnuAdS6GmbWYHek/8qMRZxHgjGs7QtoFS6NnUgJNdHPtm45SDd0K
         iKOyYQIDbOCXKxYTpw9SzBK8H3FNAjYZ6+0MfaRg99vHPbkGsfbseIyixdTS8BZ0wZcq
         d8YD4ct8jPcU5GnSTDeU0vo2s1UvIPikWUkySVI8pfvlX8ZUnedhP7yMA92opbiCD9OP
         T7zfQwmKuuRg+MqMZT+fJbYWT8Ev0g0dF3nSMR8rSCiAfoPMWixaAp/qADVZR6Vf4as8
         9kDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732048252; x=1732653052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRmKVkktJnfpekqs0vaEt2UdODXxii8BcnwHInLLVOw=;
        b=GHrl/PComlrf04Q3Zh31ObnRtOUqb7osODJJHcsOIL0EWp5CFukSFqjGdyZVhq3Q0P
         fv5GpY8i38n7E9szvnslN90RL0m5sW/mesp6gA1Z3grI1sVhi2hTB5yxD1iYW1BgW+g/
         CeaF/DIfwHmvfGFVagcNyfh/8qthLKJokuLa/zJUAsd2ljaaRbsvIlJW85hvZzl5EkfG
         pyReOK21rAdz4gSbhLZEblLh1JRP6x2g0LgE21Wcj+O3y9tLWtBOFuVOd+zr/wnYhqDO
         wNM2mP6JGel5D3WtwUOOA7aM9VofhYmx41d68328MNE9wspVr8ycqZ0TCOyoWSB2JJG9
         qwrg==
X-Gm-Message-State: AOJu0Yzl9CP2t6bLaEQmAMnngBP8j5LwwZxBOPgTm6QuBi3oK29KyPW+
	hvoJadOM90bTnK9C4qbYuHdel28Zamlyk5EAF2IF/xNxKmfxN0MGDItN2AqAJWs=
X-Google-Smtp-Source: AGHT+IH6B0MvWBP/cFrV+iSzChrNQ92fntZ29A1EV2WF6+w0INOIuuldt7jmoJ2f0P0WCEdUpH78Ag==
X-Received: by 2002:a17:90b:3c8e:b0:2ea:61de:38ed with SMTP id 98e67ed59e1d1-2eaca7c9f36mr107313a91.26.1732048252407;
        Tue, 19 Nov 2024 12:30:52 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f34f2fsm79001315ad.159.2024.11.19.12.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 12:30:52 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Nov 2024 12:29:51 -0800
Subject: [PATCH 3/8] drivers/perf: riscv: Add raw event v2 support
MIME-Version: 1.0
Message-Id: <20241119-pmu_event_info-v1-3-a4f9691421f8@rivosinc.com>
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
In-Reply-To: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241119_123053_673019_CAFB1C5A 
X-CRM114-Status: GOOD (  13.96  )
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
 drivers/perf/riscv_pmu_sbi.c | 18 ++++++++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 9be38b05f4ad..3ee9bfa5e77c 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -159,7 +159,10 @@ struct riscv_pmu_snapshot_data {
 
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
+/* SBI v3.0 allows extended hpmeventX width value */
+#define RISCV_PMU_RAW_EVENT_V2_MASK GENMASK_ULL(55, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
+#define RISCV_PMU_RAW_EVENT_V2_IDX 0x30000
 #define RISCV_PLAT_FW_EVENT	0xFFFF
 
 /** General pmu event codes specified in SBI PMU extension */
@@ -217,6 +220,7 @@ enum sbi_pmu_event_type {
 	SBI_PMU_EVENT_TYPE_HW = 0x0,
 	SBI_PMU_EVENT_TYPE_CACHE = 0x1,
 	SBI_PMU_EVENT_TYPE_RAW = 0x2,
+	SBI_PMU_EVENT_TYPE_RAW_V2 = 0x3,
 	SBI_PMU_EVENT_TYPE_FW = 0xf,
 };
 
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 50cbdbf66bb7..f0e845ff6b79 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -59,7 +59,7 @@ asm volatile(ALTERNATIVE(						\
 #define PERF_EVENT_FLAG_USER_ACCESS	BIT(SYSCTL_USER_ACCESS)
 #define PERF_EVENT_FLAG_LEGACY		BIT(SYSCTL_LEGACY)
 
-PMU_FORMAT_ATTR(event, "config:0-47");
+PMU_FORMAT_ATTR(event, "config:0-55");
 PMU_FORMAT_ATTR(firmware, "config:62-63");
 
 static bool sbi_v2_available;
@@ -527,18 +527,24 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
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
 		 * 11 - Risc-V platform specific firmware event
 		 */
-
 		switch (config >> 62) {
 		case 0:
-			ret = RISCV_PMU_RAW_EVENT_IDX;
-			*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
+			if (sbi_v3_available) {
+				*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
+				ret = RISCV_PMU_RAW_EVENT_V2_IDX;
+			} else {
+				*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
+				ret = RISCV_PMU_RAW_EVENT_IDX;
+			}
 			break;
 		case 2:
 			ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
