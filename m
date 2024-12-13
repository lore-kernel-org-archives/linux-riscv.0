Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2165CE7717F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 00:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26YB4NGOvzftgBfw+OW5qO1CViL+zo7J19PyhM7Er1Q=; b=kHsWZbB5b7L28T
	Q8J5DnionIcwvqZu52xMKeNTeXTH9DIVhtF+Y14EqTKpxCWPth3Z7JeCQptVje2cr7wuW3IWx8REH
	IAwNDCRVtnw7ieWeTaF9HjHLp1pUPRTal8XJ1AgU9bleG4r7BpkiSIa0ym/MQ6r8CCNXaPKb9gc3V
	v8OwHM2e8lVXc1jCGvAjJ6vRKLtquN92CZPN201GdVj03pvMXgFCd+8h8MzAothd+r6CrD1hEcRp9
	G72rszURKYUTh+mc5hVARScPPR7z37OQz/G57Gt0bG+zMbl2YLmQuQXuqVt8LclDQb0EB8VR2Sqks
	NIpyt0Q1GLh6unJ2MSWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtFb-00000002FmK-0VNK;
	Fri, 13 Dec 2024 00:09:47 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtFY-00000002Fl1-1EFE
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 00:09:45 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-725ee6f56b4so1047787b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Dec 2024 16:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734048583; x=1734653383; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IcoCLi142uVK6LZxiJuwIjRZD/c9pyPS+Cs4D2LMz+8=;
        b=JfO5SpmiS9E1JZopfl7qs2asxicK22XUGqkC5denOM8s0YWUN/wFIQbb3eXF915u7Q
         dEE681twE5y38r3+53mADnvEUxJf323k1ZY6hfNTNv8YQOHAi0+sKb+XclnEcqg2ZkZW
         j0HkiulPrVXd2M4Qf3WE1lFZ29yjoMsw6vLoAOKqzwvBCqfgnjh1vkD5DzFAf2ZNVcGs
         hP68A5LD77nsxOo82RBmRWmAMirWbA06ISPQfg8FZ656GtXSm2BIkIKTd8cgTcvCCBeJ
         4yAdEDjxUsHo75Ii6DnptjZVLQddlS92mqZz94Xbixv738iyOtYFfU4RX2wS44OKpAr8
         U3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734048583; x=1734653383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcoCLi142uVK6LZxiJuwIjRZD/c9pyPS+Cs4D2LMz+8=;
        b=WsYgOrweP+4+8s/drH/gOipHXP2Kc7mAmARyubZEvtc6IKGKXcQ48CztnM2iuRct0n
         GfQO6/Ta4hr8W/UydsB4inlXy/OgsT7UPz7IN1UHoqfMfyb9nwPMxCEOpg1MwYCYwO9w
         uLARvGSdocTAbKzW5fky/wz0VuxiAb78RyuJT+2mhWkSJrXfgJohKnPkpU5Yo96JCH8z
         q80I2vRWXi1qAB8yQQ49DO+dtKpjJUUGxYEysxcjvkRc9VvmxzbMy3dyDTS2jjRb1yTb
         om5ENv8aIn1WF3ycFQObJGlaFBajWrr7ayxcF6/jMrnGZBsUqLw20EpfD9G/0czyNr63
         s3ug==
X-Forwarded-Encrypted: i=1; AJvYcCWT+WQASM2E5uNHqm9nvdSQ1QFpmhsf2SdVc69j4Vcew+TwKkemdpQeiE8i00E7eXp86l2OmpHDkN0k4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwU7UgYBPIr5o6xki4Eo+tUiJnAH2Lz6Xn8aXi4TTvgZWwLD8Ti
	urLXmhKH7YCUlphsyagvtuDf1WTDniYiPBHkxZMriHSb4I+4AOfYBXoO+DpfCHwi3sxuOW+qnOf
	q
X-Gm-Gg: ASbGnctNwb6yVS/6qFYg+tRJn9TItrn6h3Tw0NWladkPrpiDNlv489CBIyfUpVBahpV
	4QXKkYg4fVMXrCaWkg2qpNM0l62hpGwSJlzHG6SMbx6HbjuNin1Bnow9ZoxqhLIHTOAqeG9lT+d
	oHv0cndUfR8L7P8hASOvXgphlh9UBM6rvN8pqKWoUexlHQXSMC+uDoccATFKhThIds9xXG5A0JO
	bQPGhu7mhTkGjhBoOGXa987DE/IP58yuepLvA/OlPrEOZZxe/sWAqKNAh+PilTdOYKhAw==
X-Google-Smtp-Source: AGHT+IHmDZNQeSUmz5Vdrblf9aWol9BUqZ9IhtQeZlQQdYeS+o+qCMgFykBzBG1diP7lnYaJXN5iGQ==
X-Received: by 2002:a05:6a20:2d14:b0:1e0:c89c:1e04 with SMTP id adf61e73a8af0-1e1dfeb9f33mr602266637.43.1734048583637;
        Thu, 12 Dec 2024 16:09:43 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f0a0779dsm7441455b3a.154.2024.12.12.16.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 16:09:43 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 12 Dec 2024 16:09:32 -0800
Subject: [PATCH v2 1/3] drivers/perf: riscv: Fix Platform firmware event
 data
MIME-Version: 1.0
Message-Id: <20241212-pmu_event_fixes_v2-v2-1-813e8a4f5962@rivosinc.com>
References: <20241212-pmu_event_fixes_v2-v2-0-813e8a4f5962@rivosinc.com>
In-Reply-To: <20241212-pmu_event_fixes_v2-v2-0-813e8a4f5962@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241212_160944_333399_5C99256C 
X-CRM114-Status: GOOD (  13.55  )
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
