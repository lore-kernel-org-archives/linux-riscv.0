Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB997C52D7C
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 05:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QtU05x5/EojVyhg81Ug2e8ZY0pojcNh5M38zGgRyQ4Q=; b=A5sItAjcrqOa9N
	wQhKBHn4ORZiirPPzdZJZrNUkKxy037jWFMHO2apJ5uCabCr0vC23I6VQ0vB8gRx9vzp4Nwife+hU
	JUp2jP+IAKVOsZTDvg2aoMwBIg+OcV6hn5w4ybZWKwibUIDJYYb/W+Ya4/kQ0W3DlTdqSDmGc3E4o
	mP/xFZWvvQFTTTdbBJj2OD5mC0N7BH/P56m41ouTtNEBsXC4RKNrRAADXfv0WuzMqjPq/3gNBqccx
	S+md0YiNvos6hJf/Du5iBoWHgSzIsCRSVsWxkWQQUQWDRdR0EeU2hb4dfmAfbvW95ukPNK+3JGgkw
	2wG51OjVHCWZPm1zaxTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdNM1-0000000Gu4V-3nql;
	Mon, 12 Aug 2024 05:12:25 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdNLM-0000000GtxX-10XN
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 05:11:46 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-70d2b921cdfso3583445b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 11 Aug 2024 22:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723439503; x=1724044303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VgKeYygUgO+nfcoZ/vUsH9NRmjrQwo4JtOLQQ/9ThGo=;
        b=ENTc2FGzWxSM/0SizKh10fE0fH/39FfcaDTZ0QhXApVw7j9C3Wxu7NsKZhycoIKJCg
         4TngtyWES1ZQtVRh5lxe2fisr4xfrOhjoNC+HU9Tiu/raEHJX23lG1g+TxoZ4UcRLPNn
         nfn5FWDf17fLWLVVydgRdGoYaih8l6eZptvGujMfKpek7CES8GoTCykPZCNxR1yxP911
         Kcttz0Bwrl7C/8Mv0SmnFOpy8FjpV896t1MS+crT3cGVZwCkpcRRotoD5V7qg3CNBWDh
         ZGVuNR3pTXBWQoWQTEbal+Ds7rtE+2pqnyZBfAZIGlPxtwQXkJf5Yzw2/midBffuNgfl
         Yc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723439503; x=1724044303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VgKeYygUgO+nfcoZ/vUsH9NRmjrQwo4JtOLQQ/9ThGo=;
        b=ED1uwAaSqLTOB4WFHyexBSe/8r5lL4Mx33/H6cJpWv1VT+XQVxb+MXyAEhrMsGz+k7
         D896Whl0XOsPwJ2NWM+QzXqJ3JXQUbALMqGGtB+hs44UJBGry65LZcb4WmLrAXMpmXRA
         qNMgG4PpIv4gnQTaS2wORQj7u/oDTRrAe/u7jviNXXperVLp6H/0NA98zZFaAQ4aGva1
         lCgsxNfLeB1dcpHkvy9PLVpnTvRAQlZrwV30BOgVKYBAEQbwMOeiXM52ohEfDumQKrCG
         0E+eY603uqnymKFkjL9MVgJL8zNSW5UlwBrMCwPk0K6rBB/dkDXgvYkH5bWq7wZQXFzk
         kl7w==
X-Gm-Message-State: AOJu0YxIQaUp/CjBzUkIDUsnCEfqSLB7UmVr7tzCnYt6MKX6hxOc+NiG
	yOiySt0W1l9QFur64CCtc45gEyzKNUiaRqrjQ6b2ZST6mCTpXSOhB/A9o6TbV+MCS31s6E2nFpo
	9
X-Google-Smtp-Source: AGHT+IESKPp/hTzr/MBXd/6K0wYQkvlLvgVXKjg1rKzcuauG6Dbx6ZUswDOJmP77PU+pD08aD6H1nw==
X-Received: by 2002:a05:6a00:855:b0:705:ac9e:1740 with SMTP id d2e1a72fcca58-710dc67fcfamr10279320b3a.10.1723439502489;
        Sun, 11 Aug 2024 22:11:42 -0700 (PDT)
Received: from localhost.localdomain ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-710e5873906sm3257555b3a.19.2024.08.11.22.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 22:11:42 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1] perf/riscv-sbi: Add platform specific firmware event handling
Date: Mon, 12 Aug 2024 05:11:09 +0000
Message-Id: <20240812051109.6496-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_221144_286490_B293DBEC 
X-CRM114-Status: GOOD (  17.34  )
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

The SBI v2.0 specification pointed to by the link below reserves the
event code 0xffff for platform specific firmware events. Update the driver
to be able to parse and program such events. The platform specific
firmware events must now be specified in the perf command as below:
perf stat -e rCxxx ...
where bits[63:62] = 0x3 of the event config indicate a platform specific
firmware event and xxx indicate the actual event code which is passed
as the event data.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Link: https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v2.0/riscv-sbi.pdf
---
 arch/riscv/include/asm/sbi.h |  1 +
 drivers/perf/riscv_pmu_sbi.c | 31 ++++++++++++++++++++++---------
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 7cffd4ffecd0..4ef8c44b15bb 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -158,6 +158,7 @@ struct riscv_pmu_snapshot_data {
 
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
+#define RISCV_PLAT_FW_EVENT	0xFFFF
 
 /** General pmu event codes specified in SBI PMU extension */
 enum sbi_pmu_hw_generic_events_t {
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 31a17a56eb3b..e77cbe299ce7 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -60,7 +60,7 @@ asm volatile(ALTERNATIVE(						\
 #define PERF_EVENT_FLAG_LEGACY		BIT(SYSCTL_LEGACY)
 
 PMU_FORMAT_ATTR(event, "config:0-47");
-PMU_FORMAT_ATTR(firmware, "config:63");
+PMU_FORMAT_ATTR(firmware, "config:62-63");
 
 static bool sbi_v2_available;
 static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
@@ -507,7 +507,6 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 {
 	u32 type = event->attr.type;
 	u64 config = event->attr.config;
-	int bSoftware;
 	u64 raw_config_val;
 	int ret;
 
@@ -528,18 +527,32 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 		break;
 	case PERF_TYPE_RAW:
 		/*
-		 * As per SBI specification, the upper 16 bits must be unused for
-		 * a raw event. Use the MSB (63b) to distinguish between hardware
-		 * raw event and firmware events.
+		 * As per SBI specification, the upper 16 bits must be unused
+		 * for a raw event.
+		 * Bits 63:62 are used to distinguish between raw events
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
