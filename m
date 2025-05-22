Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342ACC54E65
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 19:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gAA4oH82xLj1IN9ry/r7Od0e7Are+xL7L072UUciOPg=; b=x0hYvSynN0RU54
	wmeDsNSQVxOAxuCr2DEDyPix/TcxsgAIcyvAp2bAcxdDS++7odJ6OubRWbEvCldJxbdqwp1ptIecW
	lOzKlNyxSJ+fxZ/H97K7bXNoasqdOzhyZda8i/eT6r4LAHPKDTpKTWEq6Aeim/AdsLrZco4uCZ+Fv
	0TzCzXVbO8byKB07WtbymD1s1dABoPIfvpfzdd+Y7AZSiJiLxqzyl5+WQwZanPQSs6awmpfbNF5c+
	0AHf1E3q2j5Ar5epFNCqAKFaP7XnB/x2AGiuvTZa09unV3oymN57XuROWAg4GprxMKsMCi67b9279
	WJZa4eP5tBZuQ4ZjKtbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBMt-00000001zC1-3lYe;
	Thu, 22 May 2025 19:14:15 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCn-00000001wNP-3DW1
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 19:03:51 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-879d2e419b9so7072278a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 12:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940629; x=1748545429; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDxMnssaauwljQxlk9zc0qXTf5HAsn9k6GC49F2uSIA=;
        b=15cOhUxtgr6JT1fOi2aSAGwU5Bs776F72MbszXfPb/MIbDbBP9eOsy6H6hs8qqEhNK
         j8Z7yKt/rTMXThIdTLRwQhhUwWlyULliYzkxTymS+v+5LRw8pyvBjoOz4kOxJttGHUvp
         zWZVGwVI+1ITCSzt9bahA0gPefPmid6hgEw/Mr+Sdd96yo8IbNhfojV5BjT1Gn8H/feE
         VxZv5eq+5pK92fxVIMxcfGAfqD0TBwdOdEPh3SDuyjjMoC/QYNNltrpdJ7tcgJMPQAdR
         7p3Wijstp6imAQ81H34y5rLaCpXHy105Q3A44Iq2VS91IqSI7MydvQ8I4E6JRySEGre3
         MnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940629; x=1748545429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDxMnssaauwljQxlk9zc0qXTf5HAsn9k6GC49F2uSIA=;
        b=phxepIxxjzY2O55EPwMbalEpTWK0ftazqNZHawpcQy4tNLpSWWE545XaWEZiR8qmWS
         XRxFjxbQGFqKP4MYEiD4Q6WAGzto8njsXr2qZsI18kIO9HG0jSku7UFUWVA4g/vvQ2bb
         KVwHHyZqoOi5YdprM5N+eNn4hBaJnH3LFvv1jKmnpL854ezajUOZZe1iBRXtIxgmr3eE
         HNk0d7FUVKGIHleQNLwFrmAHkWIloHOajCpPuUMjNCW4v7NniFcChhZDjCdv0oTED8mp
         F3Rl7EMqZ9XtnORgKgOda8UrcqGztbPfxEVgzP8253osAFx8tMMM7PgXv9I0YTxeKEry
         Pn/g==
X-Gm-Message-State: AOJu0Yx/O8T6eF9OBxDSKvSAREIt6xkVrwMhIYEb0eCferYJtMhlJJ8z
	cZZ+XGD9deyC6Fvd1Zyxr/CVBUT4lZ3px8KKhcpCfRJ/4DvwGB7RFzNahFJK5HS5LY8=
X-Gm-Gg: ASbGncv/wQBUISlL49Y5DGYtSfnkUfNv5iVf5z2mcHPQ95T7YcOdUOuPK2gwKUeEdd+
	3/ozUdVCTiDOghFCDqOzdbBaTYL+6iUAh0IUML8rhM1qcsITNkgLzkkcqmQ9WQdE6256mP5sZYr
	17JwJHZQNKwFT18D5Yk5++mWrkBJPcqZfWQ4eP7rcRM82wyAWbOAXg36stbMyQWK0NRFg8vTvsU
	lUeypQC0DoNpHSq0uJBgBhU5R0SCMUZcAxCMgzIFjiwEJWAHS2MKzg2Yj5OtpErlItk0i5pq7ES
	hhSXfA0IMbc+eExe9oIVsnnC7R49a8Ibdi73ahTBogMPovx+wRIjC+X0agMke7FX
X-Google-Smtp-Source: AGHT+IG3oxLFDfbSNt6EH0ZdTZ5dYeLSDKnP9JAmNGN1V7oKcB4sbiLpNV8c6lgFnjfD3N9PA0Fqjg==
X-Received: by 2002:a17:902:cf09:b0:22d:b240:34fe with SMTP id d9443c01a7336-231d451b294mr410839265ad.25.1747940628742;
        Thu, 22 May 2025 12:03:48 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:48 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:38 -0700
Subject: [PATCH v3 4/9] drivers/perf: riscv: Implement PMU event info
 function
MIME-Version: 1.0
Message-Id: <20250522-pmu_event_info-v3-4-f7bba7fd9cfe@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250522_120349_841419_9DA8979D 
X-CRM114-Status: GOOD (  15.85  )
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

With the new SBI PMU event info function, we can query the availability
of the all standard SBI PMU events at boot time with a single ecall.
This improves the bootime by avoiding making an SBI call for each
standard PMU event. Since this function is defined only in SBI v3.0,
invoke this only if the underlying SBI implementation is v3.0 or higher.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h |  9 ++++++
 drivers/perf/riscv_pmu_sbi.c | 68 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 6ce385a3a7bb..77b6997eb6c5 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -135,6 +135,7 @@ enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_COUNTER_FW_READ,
 	SBI_EXT_PMU_COUNTER_FW_READ_HI,
 	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
+	SBI_EXT_PMU_EVENT_GET_INFO,
 };
 
 union sbi_pmu_ctr_info {
@@ -158,6 +159,14 @@ struct riscv_pmu_snapshot_data {
 	u64 reserved[447];
 };
 
+struct riscv_pmu_event_info {
+	u32 event_idx;
+	u32 output;
+	u64 event_data;
+};
+
+#define RISCV_PMU_EVENT_INFO_OUTPUT_MASK 0x01
+
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
 /* SBI v3.0 allows extended hpmeventX width value */
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 273ed70098a3..33d8348bf68a 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -299,6 +299,66 @@ static struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
 	},
 };
 
+static int pmu_sbi_check_event_info(void)
+{
+	int num_events = ARRAY_SIZE(pmu_hw_event_map) + PERF_COUNT_HW_CACHE_MAX *
+			 PERF_COUNT_HW_CACHE_OP_MAX * PERF_COUNT_HW_CACHE_RESULT_MAX;
+	struct riscv_pmu_event_info *event_info_shmem;
+	phys_addr_t base_addr;
+	int i, j, k, result = 0, count = 0;
+	struct sbiret ret;
+
+	event_info_shmem = kcalloc(num_events, sizeof(*event_info_shmem), GFP_KERNEL);
+	if (!event_info_shmem)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
+		event_info_shmem[count++].event_idx = pmu_hw_event_map[i].event_idx;
+
+	for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
+		for (j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
+			for (k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++)
+				event_info_shmem[count++].event_idx =
+							pmu_cache_event_map[i][j][k].event_idx;
+		}
+	}
+
+	base_addr = __pa(event_info_shmem);
+	if (IS_ENABLED(CONFIG_32BIT))
+		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO, lower_32_bits(base_addr),
+				upper_32_bits(base_addr), count, 0, 0, 0);
+	else
+		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO, base_addr, 0,
+				count, 0, 0, 0);
+	if (ret.error) {
+		result = -EOPNOTSUPP;
+		goto free_mem;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++) {
+		if (!(event_info_shmem[i].output & RISCV_PMU_EVENT_INFO_OUTPUT_MASK))
+			pmu_hw_event_map[i].event_idx = -ENOENT;
+	}
+
+	count = ARRAY_SIZE(pmu_hw_event_map);
+
+	for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
+		for (j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
+			for (k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++) {
+				if (!(event_info_shmem[count].output &
+				      RISCV_PMU_EVENT_INFO_OUTPUT_MASK))
+					pmu_cache_event_map[i][j][k].event_idx = -ENOENT;
+				count++;
+			}
+		}
+	}
+
+free_mem:
+	kfree(event_info_shmem);
+
+	return result;
+}
+
 static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 {
 	struct sbiret ret;
@@ -316,6 +376,14 @@ static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 
 static void pmu_sbi_check_std_events(struct work_struct *work)
 {
+	int ret;
+
+	if (sbi_v3_available) {
+		ret = pmu_sbi_check_event_info();
+		if (!ret)
+			return;
+	}
+
 	for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
 		pmu_sbi_check_event(&pmu_hw_event_map[i]);
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
