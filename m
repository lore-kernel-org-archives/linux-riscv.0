Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F866D6C299
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Nov 2024 20:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P0RZpNCTJcKRUyUEXWJePT9EYLXA+HEgFbvyKgbnpR4=; b=Jy9xjzC97WsaPX
	Gk1G+z7G+yXJYA+jETlKi1GY6ASeY3l53ewSq+/t6ps+ujhjQNXPCDu1iJWwxbG5mrXNnPKaMstfn
	vfRsiJemfCBvMkkRjxvC0ajRt/eCDL0dM4yn73KxyVkrV/Ar6MOI0gk3Z7h62cK4WI5Dv9kA8CeKo
	2qfvKxQxSr2GyAjZglFwFOo4qeBNcINyugkw2QmUM7TcJZFYrtgviMdIPXGxY5q2keOi/kjFrezoP
	h0hx9qR7Hv1uyQxyM+8BmGRxbDSC+/wQB0K/8O5rbAuIhIvRsn0VN+oEnpQzB0fEP0pN8dFaIjft4
	smX5P+o69OxfgSuvsEeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUyk-0000000DjFI-1AEd;
	Tue, 19 Nov 2024 20:37:42 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUsC-0000000Dh3i-0sKp
	for linux-riscv@lists.infradead.org;
	Tue, 19 Nov 2024 20:30:57 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso13508275ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Nov 2024 12:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732048255; x=1732653055; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvI6ELyRBC+Fyndrrci/LAt1a0lV7o2VMX1QjdFEcW8=;
        b=Ne4QXY0VXtv4TZ9rbjGn/mBvUYTmgZ1evn+JjovYJDm1ZHo51n7VzyxAUOyaLc0X2u
         nZ8IGIgXr2QdW28O+kgvyxG/mVcsog+LD+xlgbTjWZ9AHRvD7Wc6K0oRTozlrWMn6/y3
         PpAQH3BrIHRmEirn5DLCW6AFUKCAeoVEXFSH5OtP9XQJIYY1AA6E3rLVtFPBTWGfqkV/
         qRCofIQTScgribUck2/qnbSjikLLWtM50OfC9jM3/T42lipy0+JmbwFAa/A6y+BWJHap
         T4//MVEM5RwN+du0vujb52iFywu+zP1CvWnfcf3CUXD5U+mABP0ODsYL1TNK7e2kpVWk
         9THw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732048255; x=1732653055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvI6ELyRBC+Fyndrrci/LAt1a0lV7o2VMX1QjdFEcW8=;
        b=CRG5b52ndbNUSTwRZL/4dgu42u51l2wrg4zVtQBzNxnXvghR+2euBhmY5iUB5cmYfG
         yybfXZblyFyevDEgff5AHs6gr4i0nknP/F3E0OQQtPrBZjOvhOI817a85bWRWB7z8D2X
         EBRaHQUVxLPGbEbI/fR0A/lId5JuVJuqHbr87ITaXdlYstJlEfDX9umdexJpKQZ3lksM
         BYnb8Nvd78wx0mcKKJdhFxQQMO+GGyhZYkm+Rou85lhIsDYcw/wt7FrSVSgyBKURwa6a
         cyATr4WXbxAAX7nBRYptab7LsI45Qwqg2HG6zs0OPhWzeCt1VEN/KcMVCJK9Gka4WqmS
         HACg==
X-Gm-Message-State: AOJu0YyhuKMUoCdfV3ZLSdDfPr4wzb5JMoYX1s8mIz8BdFtreK+2zzf/
	R4xut8HXh0yEN75pKQevIlVGsGe5ESGDXAJtaj9SnWIIBFcCZkR2iLszaIAWg/Q=
X-Google-Smtp-Source: AGHT+IE8OiqtfXItkGe53z5hjcs0b0CjneyIZkfN6utXnoNwtgLN2RoemxkaTVHNqe744fxPZ0nP9g==
X-Received: by 2002:a17:902:d509:b0:212:40e0:9562 with SMTP id d9443c01a7336-2126a3b4478mr2002835ad.25.1732048255602;
        Tue, 19 Nov 2024 12:30:55 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f34f2fsm79001315ad.159.2024.11.19.12.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 12:30:55 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Nov 2024 12:29:54 -0800
Subject: [PATCH 6/8] drivers/perf: riscv: Export PMU event info function
MIME-Version: 1.0
Message-Id: <20241119-pmu_event_info-v1-6-a4f9691421f8@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241119_123056_266738_C18B393A 
X-CRM114-Status: GOOD (  18.47  )
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

The event mapping function can be used in event info function to find out
the corresponding SBI PMU event encoding during the get_event_info function
as well. Refactor and export it so that it can be invoked from kvm and
internal driver.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c   | 111 ++++++++++++++++++++++-------------------
 include/linux/perf/riscv_pmu.h |   2 +
 2 files changed, 62 insertions(+), 51 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 2a6527cc9d97..8ddd094c82ad 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -414,6 +414,65 @@ static bool pmu_sbi_ctr_is_fw(int cidx)
 	return (info->type == SBI_PMU_CTR_TYPE_FW) ? true : false;
 }
 
+int riscv_pmu_get_event_info(u32 type, u64 config, u64 *econfig)
+{
+	int ret = -ENOENT;
+
+	switch (type) {
+	case PERF_TYPE_HARDWARE:
+		if (config >= PERF_COUNT_HW_MAX)
+			return -EINVAL;
+		ret = pmu_hw_event_map[config].event_idx;
+		break;
+	case PERF_TYPE_HW_CACHE:
+		ret = pmu_event_find_cache(config);
+		break;
+	case PERF_TYPE_RAW:
+		/*
+		 * As per SBI v0.3 specification,
+		 *  -- the upper 16 bits must be unused for a hardware raw event.
+		 * As per SBI v3.0 specification,
+		 *  -- the upper 8 bits must be unused for a hardware raw event.
+		 * Bits 63:62 are used to distinguish between raw events
+		 * 00 - Hardware raw event
+		 * 10 - SBI firmware events
+		 * 11 - Risc-V platform specific firmware event
+		 */
+		switch (config >> 62) {
+		case 0:
+			if (sbi_v3_available) {
+				if (econfig)
+					*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
+				ret = RISCV_PMU_RAW_EVENT_V2_IDX;
+			} else {
+				if (econfig)
+					*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
+				ret = RISCV_PMU_RAW_EVENT_IDX;
+			}
+			break;
+		case 2:
+			ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);
+			break;
+		case 3:
+			/*
+			 * For Risc-V platform specific firmware events
+			 * Event code - 0xFFFF
+			 * Event data - raw event encoding
+			 */
+			ret = SBI_PMU_EVENT_TYPE_FW << 16 | RISCV_PLAT_FW_EVENT;
+			if (econfig)
+				*econfig = config & RISCV_PMU_PLAT_FW_EVENT_MASK;
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(riscv_pmu_get_event_info);
+
 /*
  * Returns the counter width of a programmable counter and number of hardware
  * counters. As we don't support heterogeneous CPUs yet, it is okay to just
@@ -579,7 +638,6 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 {
 	u32 type = event->attr.type;
 	u64 config = event->attr.config;
-	int ret;
 
 	/*
 	 * Ensure we are finished checking standard hardware events for
@@ -587,56 +645,7 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 	 */
 	flush_work(&check_std_events_work);
 
-	switch (type) {
-	case PERF_TYPE_HARDWARE:
-		if (config >= PERF_COUNT_HW_MAX)
-			return -EINVAL;
-		ret = pmu_hw_event_map[event->attr.config].event_idx;
-		break;
-	case PERF_TYPE_HW_CACHE:
-		ret = pmu_event_find_cache(config);
-		break;
-	case PERF_TYPE_RAW:
-		/*
-		 * As per SBI v0.3 specification,
-		 *  -- the upper 16 bits must be unused for a hardware raw event.
-		 * As per SBI v3.0 specification,
-		 *  -- the upper 8 bits must be unused for a hardware raw event.
-		 * Bits 63:62 are used to distinguish between raw events
-		 * 00 - Hardware raw event
-		 * 10 - SBI firmware events
-		 * 11 - Risc-V platform specific firmware event
-		 */
-		switch (config >> 62) {
-		case 0:
-			if (sbi_v3_available) {
-				*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
-				ret = RISCV_PMU_RAW_EVENT_V2_IDX;
-			} else {
-				*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
-				ret = RISCV_PMU_RAW_EVENT_IDX;
-			}
-			break;
-		case 2:
-			ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);
-			break;
-		case 3:
-			/*
-			 * For Risc-V platform specific firmware events
-			 * Event code - 0xFFFF
-			 * Event data - raw event encoding
-			 */
-			ret = SBI_PMU_EVENT_TYPE_FW << 16 | RISCV_PLAT_FW_EVENT;
-			*econfig = config & RISCV_PMU_PLAT_FW_EVENT_MASK;
-			break;
-		}
-		break;
-	default:
-		ret = -ENOENT;
-		break;
-	}
-
-	return ret;
+	return riscv_pmu_get_event_info(type, config, econfig);
 }
 
 static void pmu_sbi_snapshot_free(struct riscv_pmu *pmu)
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 701974639ff2..4a5e3209c473 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -91,6 +91,8 @@ struct riscv_pmu *riscv_pmu_alloc(void);
 int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr);
 #endif
 
+int riscv_pmu_get_event_info(u32 type, u64 config, u64 *econfig);
+
 #endif /* CONFIG_RISCV_PMU */
 
 #endif /* _RISCV_PMU_H */

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
