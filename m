Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8DBC54E65
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 19:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F9ZO9L/PLD48+h4nwzHgKxm4EPVleLPqV83wnwVC2Y0=; b=3QH+XkTVZ3WZPb
	K9b46FXQmXr0fIz4vkiE2IcUdkYok+ahSMf3zniZkIVK4+oXwi+BnueM+3QkxBveCYw3qX9vS8sX1
	iaUGsF1f3mnPygIsaTdhGxUJCljLctVtx1y149kHe7+tMJjf2sBx/O0pJvSDTxc2CZDLXLM/obKIh
	Qh9cNEQ6xvDIAQkqm+uiGNqVWUgFhLCZzr/ySeAfb4zBgWxJqmhaI7ByL7nf42WDjwj10T1srNHJU
	ULUIDc2mlwasULHJzpXk95cDwqlSx7Sv3XR3h+Unz9Y1gijceRu+BJaov2+ey/m+6oeRuYV9MRA8M
	z2sJScr4Atm+FFNlgq9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBGs-00000001xqb-15ZG;
	Thu, 22 May 2025 19:08:02 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCl-00000001wLJ-0i2w
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 19:03:49 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-232054aa4ebso46272485ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 12:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940627; x=1748545427; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LdMt+/71IZVg41NURvd5gzpotrZUIy+pYhJIn00Ob54=;
        b=vrXAaMc+Gqpmm4vO+eEwg7hihLuRA02xTnuSSJvf5EEXT1h/Co2RGVtP2zopU3NR2T
         JQ6XaqqWOsvsVlhlCccFLjR6hFpnG+L7PJsaHtlhuZO0b8WEL4s40anzBuWV+bS+jZ/N
         Uiv8d2hhlKpA+FDqbZfsEWrAHCxURvtq75vv7ZHNTz3gJqKCVZh2tngUj3Gy6CmmUpKf
         LkJjN8CNvmKLVJ1+iiBX+CftIFraiQfU/nbQVsVeD4nXTO8xNU9dF3yXmlQWP8lhW3+d
         ACkCFe26D3dLHgIb5mP7tb/5ns2sqa83L5z9cX3LABI6aSd76QyX8YFUVOfweuJRf4Cx
         B8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940627; x=1748545427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdMt+/71IZVg41NURvd5gzpotrZUIy+pYhJIn00Ob54=;
        b=Gg09fk6rbsUwJQLFaQjiVb7C4B5CJDgvwGXsKx1jhYj4naVQ0hBhKzI85QdAPJknIq
         a/IrlVnI/SiNnMSIFM7kSbwE+m1WRRECHOmedr4dld+MLmyjA4JzDhOWwZb5WBw2/KEB
         XWamkXmqfwZHBJsEnaE07PuFank1gshxLTCqngIYcnotPgN21fWEXYjg/7kn5uaOYyJ6
         OxiQ8oiYbQWmVr+C6m1pFMUxfgejM5FaP2/w1/JBfhYbKSgoxTRrPRXAONIR0qFVgN58
         IOj75feR/w7pwWLl2rOo1FGzWdu+ZEg6NthXTnlUMxt4l/iBQfwv9dl5o2o1i6+BF2y1
         0lFg==
X-Gm-Message-State: AOJu0YzpL9o0SYnZ41oHlS1FIez1HfgJVju5LEYBCFJ9tIvpYOa8bGiv
	EGP0XZDCEDbYt/KlzdSoy4REMPm7R1uMLBZXqjDSSLdSd8D+y4iSisuYEaz6IzcnLI2NeQ6GPvn
	ddVir
X-Gm-Gg: ASbGncsTIB5eFq2Zh7bUJpfQsW+jC8nRb9MED8qyFztxKI6BDg4Xw+KZO1N44O1OTVq
	2krW0dc+93uTeiBYEQ2C3+7QdKAmcdNIuO3YsTKHvr+3yMV01pfo9dklNHeplYlHQUDj0Y/vhjQ
	MHf96L6XCSV0mGkJSL/5n5gn2mo249mooDuOw72+r8XaYJu7gY/vnuXOut93GWiGd2etCx2eOMS
	uPYRx3quo8IwPo6W4PVOctavv1Ut52OdcY0sYRArnW3moAD0aq/G3r4adJxz37R3qixnC/WifQW
	xbqTXRCaFrHmusCi65JPMsS8ckn80jFvYbBt3xVb9swhghucRhtspSyQl9oDs8gW
X-Google-Smtp-Source: AGHT+IFfCV//qxOe2okhTwLGpNoq8DsTJkacWkNUL4qxPXo2ylZ1GEBeSAkJ2y8sxhW9UlvW9cu03w==
X-Received: by 2002:a17:903:124b:b0:231:fc6a:9639 with SMTP id d9443c01a7336-233f23cbf73mr1605975ad.27.1747940626613;
        Thu, 22 May 2025 12:03:46 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:46 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:36 -0700
Subject: [PATCH v3 2/9] drivers/perf: riscv: Add raw event v2 support
MIME-Version: 1.0
Message-Id: <20250522-pmu_event_info-v3-2-f7bba7fd9cfe@rivosinc.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_120347_210274_58B8F6A5 
X-CRM114-Status: GOOD (  15.69  )
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
index cfd6946fca42..273ed70098a3 100644
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
