Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AC4C001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 04:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uqV57sycKpm9BTf7/WIdrY395MNgPheOVP/MaCCSSTI=; b=a70ZTJO7Utb3TP
	IbgnySzBCncjmwpdqOKYaxmxiAppO8B4EN58urLps4FY+QmX0K5AQLneI2CuNR/vuu9FKNkwiiTn0
	fyvT9wxtxR5zMKLRCmY+9M/1+T5plRXMod3WL0O3ZRidbFGliUxLPThAui/5YBbYvvdFk/g6QSzzD
	wyarDJNrAHFt0Bex87wAPwFPt8nu0pFGH/t9Ac9c03Crrf3dUUV24zIDMZ92v9rNuiAAiJxPFPqso
	y22fKwE2f8tbMG5Zd5O9vIbRqVoDCdT/gpRrFg7BNrNnNddZbUv84UjYAgKW8RI3T4CSEuHpQRdCE
	lnhbItEbAgKJ9qT7lvPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVPFQ-00G83L-1j;
	Mon, 14 Aug 2023 04:32:08 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVPFN-00G82e-2J
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 04:32:07 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so3070352a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 13 Aug 2023 21:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691987518; x=1692592318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W8ntFLsLRwQvKdzGIzZs1kQ64wHXgpANSIBQ3fXGhcw=;
        b=T9YxEw44X2JSt7zcRIHXtNIAfkFEP0UbOs3Ah2wC1bZnPgshJPomPGafl6dbaKjPqp
         ZkwZl1rS/JtSj4qDd/pYsqxLT3rkawSiAzXsVE3MKdUogN//FwZdbVjM5GfbjC65kmOd
         fKIJXV7PUF8ik5DcC8GyPV83PNBpvotv8v9lLEvS8US+eGVjgpnUfbiKWVd5j+GD4T/c
         Nd9iQmmdikbPVsETeKg3AZ6yxNSncVe0BVGaHTsgvsIOxjEtL3ihPv3t3XJFNMhxnbLg
         j5ByOsVydF7UcZC6noq2LtlS+5XrUQqgmNLtBfjeoC6FYipvI/WoZEBFo3i8P/CM8nM1
         /c5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691987518; x=1692592318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W8ntFLsLRwQvKdzGIzZs1kQ64wHXgpANSIBQ3fXGhcw=;
        b=Ur9TAGQsz/lXALmn3mSPDUCXEpLpxgyyp8KojNE6FFgeDHFfRRynIQR7pqvsmY03rD
         yGLm5d9CPqvhi3R+hdKuqL0TX0qNAsNkmCKRnDloveTUGZPngKnrmkjdfRRz0Iowo5Xg
         HRlWhSVnFty+68t0rDb45eYRZKHK3ds+l5fjwawhOWt7QrIXv4j1XIcyKJOYj2esyE94
         hiQNQlragwqIeiOPqlUT6YecjgCXW1KKM4tEG9boBzNQH760ZOAwTEYIQAAxzE0oKskr
         CxHq1r2nDchbQ3RbY1JiJdB2ZGNH9U208gbvLRGpW3C3J1UcsESn8fOZhzZFognb5Vx8
         0hag==
X-Gm-Message-State: AOJu0YwAhFw5Dy516265V5BlozEdZpjnVP7QcZvOlVEPVM4wskfUlFLs
	6aO0Vlu/uPN88D4KTL5X4B7UYw==
X-Google-Smtp-Source: AGHT+IEdxEkslMlscCtMDRkFQ2vIVePxO5dlKemzDsp3BpvAOonru2xa63owwT1f3gUvZ7G2+ofIIg==
X-Received: by 2002:a17:90a:fe17:b0:268:2f2:cc89 with SMTP id ck23-20020a17090afe1700b0026802f2cc89mr7969583pjb.4.1691987517879;
        Sun, 13 Aug 2023 21:31:57 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id 8-20020a17090a198800b00262fc3d911esm9607417pji.28.2023.08.13.21.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 21:31:57 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] drivers/perf: Risc-V: Update platform specific firmware event handling
Date: Mon, 14 Aug 2023 10:01:34 +0530
Message-Id: <20230814043134.367280-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_213205_779949_A7D93FFC 
X-CRM114-Status: GOOD (  15.93  )
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

SBI specification [1] reserves an event code for platform specific
firmware events. Update the driver to use the new reserved event code
for platform specific firmware events. Also update the raw event parsing
to use bits 63:62 instead of only bit 63 to distinguish between the raw
event types. The platform specific firmware events must be specified in
the perf command as in the below example:
perf stat  -e rc000000000000001 <command>
where [63:62] = 0x3 indicates a platform specific firmware event

Link: https://github.com/riscv-non-isa/riscv-sbi-doc/commit/c4bfdf9 [1]
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h |  1 +
 drivers/perf/riscv_pmu_sbi.c | 29 +++++++++++++++++++++--------
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 5b4a1bf5f439..001387354c2e 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -138,6 +138,7 @@ union sbi_pmu_ctr_info {
 
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
+#define RISCV_PLAT_FW_EVENT	0xFFFF
 
 /** General pmu event codes specified in SBI PMU extension */
 enum sbi_pmu_hw_generic_events_t {
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 4163ff517471..f94a3f0a469b 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -414,7 +414,6 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 {
 	u32 type = event->attr.type;
 	u64 config = event->attr.config;
-	int bSoftware;
 	u64 raw_config_val;
 	int ret;
 
@@ -429,18 +428,32 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 		break;
 	case PERF_TYPE_RAW:
 		/*
-		 * As per SBI specification, the upper 16 bits must be unused for
-		 * a raw event. Use the MSB (63b) to distinguish between hardware
-		 * raw event and firmware events.
+		 * As per SBI specification, the upper 16 bits must be unused
+		 * for a raw event. Hence bits 63:62 are used to distinguish
+		 * between raw events:
+		 * 00 - Hardware raw event
+		 * 10 - SBI firmware events
+		 * 11 - Risc-V platform specific firmware event
 		 */
-		bSoftware = config >> 63;
 		raw_config_val = config & RISCV_PMU_RAW_EVENT_MASK;
-		if (bSoftware) {
+		switch (config >> 62) {
+		case 0:
+			ret = RISCV_PMU_RAW_EVENT_IDX;
+			*econfig = raw_config_val;
+			break;
+		case 2:
 			ret = (raw_config_val & 0xFFFF) |
 				(SBI_PMU_EVENT_TYPE_FW << 16);
-		} else {
-			ret = RISCV_PMU_RAW_EVENT_IDX;
+			break;
+		case 3:
+			/*
+			 * For Risc-V platform specific firmware events
+			 * Event code - 0xFFFF
+			 * Event data - raw event encoding
+			 */
+			ret = SBI_PMU_EVENT_TYPE_FW << 16 | RISCV_PLAT_FW_EVENT;
 			*econfig = raw_config_val;
+			break;
 		}
 		break;
 	default:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
