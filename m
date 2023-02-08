Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C8BC05027
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 07:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zGLmgUJQA2q3UslBvt1whavzySFcXr5UtCk+QYAai3o=; b=VGuc5kIZ/qQovb
	DnjApsDiuj9oxQyETpVVGMilwBDu2zDQKgDdtA+h53MIc8+zloeIiwALh8+4jZGDLFOQ3+OWVop7M
	ICPp+IQxVwh16SMjYFpIN7P7jJSg3eWE7N0OQiQMpHbfKscUbwUPEifWwWpWdvjQndBWBaHa1gIMB
	afnHo7BCgl6KSuGTwXMX7ZKJco+W3jKqM+T5sRhFhjEdjlre3aN1gAKv0CbY6XOB4B1oG3Bdj/icL
	zl5580Q7nD5RKbsNPKWrSV07qTAoBXmof0KUTVetuKyMyy92LuP8aMyJXIJz3qxlHtn7VzyDtm03d
	G6v8gkHyq7wfakdSLTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPf7D-00ETWh-0I; Wed, 08 Feb 2023 07:43:39 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPf7A-00ETVN-KK
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 07:43:37 +0000
Received: by mail-pl1-x630.google.com with SMTP id r8so18378112pls.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Feb 2023 23:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=viqNUY8exVy1tGGB/uxyQRSj087ViDgE5b+6mvoYpvk=;
        b=V76QkDr/wBCm8OXTbbLNtXsrh+mxtAptt60Fh2HrmyjgXwE12SiR67n62FGQPau/OR
         5ASnCxkH8LCiwfHu8oFGRV0Fl4We7UaboBEvlW/pzCkK+5BboYg+agI+r5zCjFcckifm
         51ywXozlsTe9QbKFBfZHmIrjGdXZUqJUiCTppJB+k+4wd3aC+eYztQerXclXisBV4d+7
         6jFoBOBLCCvvg2jE0XUlEB3sJcwmAzJv38GbVCPlxrWKmeFCTdzy/WSFzNEzghbo/6K/
         KEem4zkBGZfuF+4Yw63JV376CUvaMFWgAbwohml7VrGiNSa12T6BBt0rbbIIL7TXZsEu
         tmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=viqNUY8exVy1tGGB/uxyQRSj087ViDgE5b+6mvoYpvk=;
        b=xCYEcQuLdKETIjIWLfOBB3YkJ9yOnEVyi7WSqjchWOqEJPtcsoQTVmB6rVg2CaxTBt
         gXNd936hFU6nrC7ZACoMo5o3XYtGAFsLZKQlSySdam6y/pgPJYm+BXjFNGWzsWrgWRsB
         enEkuyLVwBalwhJudip/L5SsUf/Fxhcba0F3KlyVZFUL/vzd7pOE2J4r7gg6diw0TZPA
         oGIgZr/qAwUQmHVsoUU/4nwZLCszbhzZ7H/qC3lWwLl26GZR1B7IZ/KrEh7SJ/ErLzss
         RFmfyxusN+8begRTczN1xPYW22008un2NbgrKjdYWvU+HCvgJp3eaLTLqvE9RwUV2BPQ
         CP7g==
X-Gm-Message-State: AO0yUKXSwZRE6Csx0JDYoRhNBuc/ixWIl65Hw4tAP9pjfaZp23eyFZNb
	omOrg1jV/ZHZsoAuTsboWk2D4g==
X-Google-Smtp-Source: AK7set9n+808JQOzRIzANfQgiu+NK1ka3bGc+N388dK8vhBP+WgSM64s0pifo7J6eLTnOw3932cR+Q==
X-Received: by 2002:a17:902:e2d1:b0:199:1996:71e1 with SMTP id l17-20020a170902e2d100b00199199671e1mr1117715plc.14.1675842213468;
        Tue, 07 Feb 2023 23:43:33 -0800 (PST)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id q16-20020a170902edd000b001966308ca0dsm10293539plk.167.2023.02.07.23.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:43:33 -0800 (PST)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2] drivers/perf: RISC-V: Allow programming custom firmware events
Date: Wed,  8 Feb 2023 13:13:14 +0530
Message-Id: <20230208074314.3661406-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_234336_693601_BCB26AFB 
X-CRM114-Status: GOOD (  10.36  )
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

Applications need to be able to program the SBI implementation specific
or custom firmware events in addition to the standard firmware events.
Remove a check in the driver that prohibits the programming of the custom
firmware events.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/perf/riscv_pmu_sbi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index f6507efe2a58..7ffdd2d143d9 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -385,11 +385,8 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 		bSoftware = config >> 63;
 		raw_config_val = config & RISCV_PMU_RAW_EVENT_MASK;
 		if (bSoftware) {
-			if (raw_config_val < SBI_PMU_FW_MAX)
-				ret = (raw_config_val & 0xFFFF) |
-				      (SBI_PMU_EVENT_TYPE_FW << 16);
-			else
-				return -EINVAL;
+			ret = (raw_config_val & 0xFFFF) |
+				(SBI_PMU_EVENT_TYPE_FW << 16);
 		} else {
 			ret = RISCV_PMU_RAW_EVENT_IDX;
 			*econfig = raw_config_val;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
