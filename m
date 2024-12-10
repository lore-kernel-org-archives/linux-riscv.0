Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7151EE77180
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 00:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26YB4NGOvzftgBfw+OW5qO1CViL+zo7J19PyhM7Er1Q=; b=4MItt9+SXRGwq/
	PT6B1E4RjwZZMAV7nFBgkt9ulQtrUh7adEajzfkOU6Dj1O6rAmtTPL9V7CzIM51GERzi9iCUNUsU0
	MlQiEibP4t4bJppZvLiwaRw+aLTGsMoX+1/iLHZbA4ftrB4BR+ESjm1AZUgBiQKozgRJ0Dx/4crqZ
	CJiKeQXKImB7URmK1IPYigzlue7ni6CPf24LZ+B7sNVpiyPiYJaMH1g+nPyOkj+OT8QI4oM7snyZY
	gW6att5OqIZ9MYc8NnbvzwIBV85R5vdd5g56VqGUj/glbbaGdmTDPEYHnXvgO6Gd6IArF4gXR3PwJ
	SWdprntVMdvVga2ObbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnkH-00000009e2k-10b3;
	Tue, 10 Dec 2024 00:04:57 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnkD-00000009e0u-1Lwh
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 00:04:54 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-725e71a11f7so1299002b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2024 16:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733789092; x=1734393892; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IcoCLi142uVK6LZxiJuwIjRZD/c9pyPS+Cs4D2LMz+8=;
        b=3AW089JhehpQk01GScaigLqlHywh3UGqHe0s5u7rAwMbrDoM/fkUNlQfgpk69Z0bkO
         Gpmhyc/jMAbplQwcAS2NTF5KJWfMoRjwCRbaj2lA/3aIUTPVDb2+DT/jOZY27Wx3n4V2
         IxZCEMJj7gxFojCvnjv4Bf677d8Wn2kQtOMRTXBcscjT/4Oiyn5OHUvBFdp6s/tyA2Nj
         sU4edgr5zqhDYfH+2jv8LD2SQEvHRl8gCHeU03h1jpdicidb67iG0/YX8A3SFCEdh5vr
         c8xj74gXgrmtxbn9Ed+bwxbplsArUEsHTiL83n3of0Jg7Vb4vODVvnfMgGGn7Xf8czA+
         hWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733789092; x=1734393892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcoCLi142uVK6LZxiJuwIjRZD/c9pyPS+Cs4D2LMz+8=;
        b=mk+iSQSS5rh0Rlfm2y0izMDLWZoD1aeQXW5Eg1wgeorQ1qI2nclDw6iCRlUVSnr/t1
         QbQsi/kr7G+9wbYbk9Uh9Vb0pjiT+k1xSeY5B/jK242BZdefPaA6/teU3DMfs+u7lmvX
         mH1e3Cpm30pGaRqTThfFnP/nezfHkB5TrrZtpt4t+gNCzx6SIarYIviADVezd6uRtqOO
         ntd7Rwpvb3DzGTeK7bxlx601edjOaKM/JOcUIhUqCbKnano7qzyOdzogcsCJMqCEB0+c
         zXR+QF1wEpDyLAyu9SpzP0XP4V/lP8N0SEo/jJGeOe8QMC/0eQ+Ormk4/92lZP6cz+DI
         bLuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQxI4EUjrJxSS0MR1Bmcpeik9yUSMhJxETtwQBX9hm/flh4p2klQRHRf6zWBalUAyR86MjIjUVIpklRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHnRXCpbtKzenBIjQ9RBTi2uyy048QVIbMurenCKLbbiETHpJG
	dFDYjrelin6xeV/JltzlmWpDZwJudKIk2jrEgN1vo9tlqOZ/pXx5qMsbGCB+5/U=
X-Gm-Gg: ASbGncv4AixndauEkd7KdwN687PMYYPFD2wRUmUmwLVA5WnnoEKANDfeSAQsTAkY27/
	5ZIQeIiIKwm2HKI8nyH4DcUp1mWAQVzmyLQT6WODdFZ+W63Ck0ovNZOBI01sCEejVpiKUwTsG/D
	9aoKGFA2TyVg8gH47XLqn+P6CkX8dacIY+i6iX0fH5Ai470/rNg0OqzsD6hYgf0WxnVeS66mWdh
	Kb5tQZPgEruI5ZVjRFWMp2o586wJXdsyOdamoYNjfT5fQO4TVqIvgX5lzQjPw2RbQM=
X-Google-Smtp-Source: AGHT+IHtQv72nuw+PgMFj/lyteqN8ZPPPaSuF1PYTBDxNzcw7rsi++0gLI3vMd4O/SEk4kaL5+EgJA==
X-Received: by 2002:aa7:91d8:0:b0:725:ce39:4516 with SMTP id d2e1a72fcca58-72888ca9b12mr1728764b3a.7.1733789092221;
        Mon, 09 Dec 2024 16:04:52 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e3ca46f0sm3477249b3a.15.2024.12.09.16.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 16:04:51 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 09 Dec 2024 16:04:45 -0800
Subject: [PATCH 1/2] drivers/perf: riscv: Fix Platform firmware event data
MIME-Version: 1.0
Message-Id: <20241209-pmu_event_fixes-v1-1-d9525e90072c@rivosinc.com>
References: <20241209-pmu_event_fixes-v1-0-d9525e90072c@rivosinc.com>
In-Reply-To: <20241209-pmu_event_fixes-v1-0-d9525e90072c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_160453_365043_19C6BA20 
X-CRM114-Status: GOOD (  13.27  )
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

Platform firmware event data field is allowed to be 62 bits for
Linux as uppper most two bits are reserved to indicate SBI fw or
platform specific firmware events.
However, the event data field is masked as per the hardware raw
event mask which is not correct.

Fix the platform firmware event data field with proper mask.

Fixes: f0c9363db2dd ("perf/riscv-sbi: Add platform specific firmware event handling")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h |  1 +
 drivers/perf/riscv_pmu_sbi.c | 12 +++++-------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 6c82318065cf..3d250824178b 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -159,6 +159,7 @@ struct riscv_pmu_snapshot_data {
 };
 
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
+#define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
 #define RISCV_PLAT_FW_EVENT	0xFFFF
 
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 1aa303f76cc7..3473ba02abf3 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -507,7 +507,6 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 {
 	u32 type = event->attr.type;
 	u64 config = event->attr.config;
-	u64 raw_config_val;
 	int ret;
 
 	/*
@@ -528,21 +527,20 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 	case PERF_TYPE_RAW:
 		/*
 		 * As per SBI specification, the upper 16 bits must be unused
-		 * for a raw event.
+		 * for a hardware raw event.
 		 * Bits 63:62 are used to distinguish between raw events
 		 * 00 - Hardware raw event
 		 * 10 - SBI firmware events
 		 * 11 - Risc-V platform specific firmware event
 		 */
-		raw_config_val = config & RISCV_PMU_RAW_EVENT_MASK;
+
 		switch (config >> 62) {
 		case 0:
 			ret = RISCV_PMU_RAW_EVENT_IDX;
-			*econfig = raw_config_val;
+			*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
 			break;
 		case 2:
-			ret = (raw_config_val & 0xFFFF) |
-				(SBI_PMU_EVENT_TYPE_FW << 16);
+			ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);
 			break;
 		case 3:
 			/*
@@ -551,7 +549,7 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 			 * Event data - raw event encoding
 			 */
 			ret = SBI_PMU_EVENT_TYPE_FW << 16 | RISCV_PLAT_FW_EVENT;
-			*econfig = raw_config_val;
+			*econfig = config & RISCV_PMU_PLAT_FW_EVENT_MASK;
 			break;
 		}
 		break;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
