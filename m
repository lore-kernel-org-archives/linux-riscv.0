Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15CCD6C299
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Nov 2024 20:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBD1kvtMDpSyhlZdsRno4nqYc1AZOUKMDWEVnaDqUJw=; b=PBHflp+5HcFfK9
	s197lZBCOsNBeECBdEcxMinua8NIhEDx2bKfPYkzaCsCVyxIRB6bDti2GV6R2AHwu929HTk5Gppsw
	9gy99CAwycRB0R+iXjS6cZMdEZg3g/BTSIamY6Wey3UsqfP/0vwiYEpM0VknzkENLZn8H31D3V16s
	dXwFkM8z1iSm3j+HESxTqdvPFVfluKE3wMx5CSfGF30rbseHobQsEMtohouw5hNX0282m8BBVSXy3
	r787ReOmoDGioIv7e0hWCuqUN9ZYA9/VMbEALKQuevnut50EzU/XUPFV5XPIy3l0oghtwYA/2Oiu8
	mmkEbaVbAc/KptQK45Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUxq-0000000Dj0q-0BLL;
	Tue, 19 Nov 2024 20:36:46 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUsB-0000000Dh2P-1qBt
	for linux-riscv@lists.infradead.org;
	Tue, 19 Nov 2024 20:30:57 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2118dfe6042so45392035ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Nov 2024 12:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732048254; x=1732653054; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40lt9LB/BTg/O24BZtpczZbDrdTkukX/GA7UpRzp0pg=;
        b=bTxY8WLOxV07o6wdrJno2VU+okqKEOnwSZ18yehN4H7R12lP/6pNwxNwt1SnIFBazy
         +NqJko5qxVc5dX/kddWHLcAKH7Szi5JjOi4sd2+6heFJQ9zTvhR5Rb6hwCLC19BIcneu
         1v9A8x/n7pNiwasYv5CEGfKD9isaPw+Lq9FwaT2WvgWrI21cx8K5KBtaDPZyYltU7sYr
         yvPokikQBnPTmSyv6nK4Gwtj9llv5UnJGAQ8L+lE6hAL1Sa4tsMGdIGn6ni34XuFnFPl
         dgM7lO9IYRcQdmTMHdCoa3VwdR2i4I7PDOqc6W1lhHZVhbPwbo0wntrm7XUtMxGMPpxL
         f3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732048254; x=1732653054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=40lt9LB/BTg/O24BZtpczZbDrdTkukX/GA7UpRzp0pg=;
        b=tOjxAPk8BAj4nxFONjOjTn1Hl/eilHKzD+hfbZusiywvoqbvlzsONQ9rvLtUVmeVCp
         7ivKZf5xO4Lalk+tsZGehUD2fpbUbQCF7tlMcsM5xNz/ntEcd6xVSxiNTBOg8+c6D2bU
         JbBJh6n5rhftwc0c/SlDQzx9FVjLZ3c1rbnMHpjaXmWBDKDmadt2k9/etoC6aU8J+oN6
         3Kssp+K+Q+Ewcx9PM8L/5l8b1klhnh6EoUIphTBJ1cgge6c+FYqTvA5CyRenyeUSg3+k
         c0C8QiE2Hw3mIOyCYhPyuD5OB2og5zES7+ZPif/+/mMyB4ycWY2+lUK0iZ+YWCmH9LLN
         3DUQ==
X-Gm-Message-State: AOJu0YzimHozktji6ep/pBSf/crGLTNqdMOUZ+12v4N6w5yCgtQPaTLi
	vlZCvxTMo8Ge5JiCELa+ym1rlvXRxImVqEeZMARhSJq/9b6+gqT7DZRAhTlyiIQ=
X-Google-Smtp-Source: AGHT+IHsJO0hcJESjwh6eQu7qwaEvcwUlwaSmtArcLLxZHqVuVRuaI9OsGKiZZ86BxWZYDPkCaGZqQ==
X-Received: by 2002:a17:902:d2d2:b0:20c:5533:36da with SMTP id d9443c01a7336-2126b381b65mr257415ad.42.1732048254555;
        Tue, 19 Nov 2024 12:30:54 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f34f2fsm79001315ad.159.2024.11.19.12.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 12:30:54 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Nov 2024 12:29:53 -0800
Subject: [PATCH 5/8] drivers/perf: riscv: Implement PMU event info function
MIME-Version: 1.0
Message-Id: <20241119-pmu_event_info-v1-5-a4f9691421f8@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241119_123055_485835_54BCC05B 
X-CRM114-Status: GOOD (  17.81  )
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
 arch/riscv/include/asm/sbi.h |  7 +++++
 drivers/perf/riscv_pmu_sbi.c | 71 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3ee9bfa5e77c..c04f64fbc01d 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -134,6 +134,7 @@ enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_COUNTER_FW_READ,
 	SBI_EXT_PMU_COUNTER_FW_READ_HI,
 	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
+	SBI_EXT_PMU_EVENT_GET_INFO,
 };
 
 union sbi_pmu_ctr_info {
@@ -157,6 +158,12 @@ struct riscv_pmu_snapshot_data {
 	u64 reserved[447];
 };
 
+struct riscv_pmu_event_info {
+	u32 event_idx;
+	u32 output;
+	u64 event_data;
+};
+
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
 /* SBI v3.0 allows extended hpmeventX width value */
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index f0e845ff6b79..2a6527cc9d97 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -100,6 +100,7 @@ static unsigned int riscv_pmu_irq;
 /* Cache the available counters in a bitmask */
 static unsigned long cmask;
 
+static int pmu_event_find_cache(u64 config);
 struct sbi_pmu_event_data {
 	union {
 		union {
@@ -299,6 +300,68 @@ static struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
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
+	event_info_shmem = (struct riscv_pmu_event_info *)
+			   kcalloc(num_events, sizeof(*event_info_shmem), GFP_KERNEL);
+	if (!event_info_shmem) {
+		pr_err("Can not allocate memory for event info query\n");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
+		event_info_shmem[count++].event_idx = pmu_hw_event_map[i].event_idx;
+
+	for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
+		for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
+			for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++)
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
+	/* Do we need some barriers here or priv mode transition will ensure that */
+	for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++) {
+		if (!(event_info_shmem[i].output & 0x01))
+			pmu_hw_event_map[i].event_idx = -ENOENT;
+	}
+
+	count = ARRAY_SIZE(pmu_hw_event_map);
+
+	for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
+		for (j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
+			for (k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++) {
+				if (!(event_info_shmem[count].output & 0x01))
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
@@ -316,6 +379,14 @@ static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
