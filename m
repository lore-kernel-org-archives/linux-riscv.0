Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6246C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 17:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uT2X3J0sqNRWSNtcYf7IWDYxjoVhghuWGOSh/Z7GuO8=; b=w+TqboHsW+YPZ+
	OjSMOl0CjPr0LawOUV59JJn0BI8t+Ak/p2L9gVzUxXqyrrZsIwm3493XN0JOtP6mI1kGgJDe5bQhO
	vBCqgACdI9F3j7r79AVkVmZYztNf6I76p+3P69/KrE/ptaVENlQbqPWLRvk/OSQBulFzGA+mFkRYq
	LSL3+HKmSpYBAdQrzXgh6mzb5xaSslL4EX/q6GPGxND72ivL7BL3sQ8ge6Z/egXrLuWfxna3PXQew
	Hc1xbRQ8+OOdCLclWRMyyx/kRiYieq0oijMemi7blT9vHaewwlMXY9VYk5GhXSh6LW0ySzeyGHIcN
	gq1JsFYEkxTkcL3BRVHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAxUj-003aoy-PS; Mon, 11 Jul 2022 17:46:53 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAxUd-003ah9-2R
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 17:46:48 +0000
Received: by mail-pl1-x62f.google.com with SMTP id z1so5065043plb.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Jul 2022 10:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vOTmDUkpz+mPbUuokk0QP2W08wgjCdIdsM+mPgDGou0=;
        b=V3fp0VSk9gvbvNZrW10f40Ews5n1xiSMtpJLcvEJcjL4jfDI8R2TfjOjLurvL4a4Kq
         asHseIaY3FLyAeWFMiKkq0kSBrv5HX+CVWLg2bcTMK6rqrTNY9ZaT/VnugE9FK6xBpZx
         gQcwByn7AW4Y130Y5S7itIxIX36fnfT0Oc4UMjhaMyVK0ugJ6+vJ2UipWRSj0sjWCUUm
         Z5HiKKnYAQDZ7BDFqjV9T5OOyPNvMNnMg/dA0L+ND0cf8DCb1TuPQgSofpxZG3h543tu
         4Ln4NjBamXgFyUsiOGtTQsVl8lFrvfSHHlVbqN6VXz2N2850DfkpvZqP/QihGroIj8lQ
         clmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vOTmDUkpz+mPbUuokk0QP2W08wgjCdIdsM+mPgDGou0=;
        b=dTUUINB+M/DplaS1dhjfUQNQQa8aU6sFrUvACiVSaVTzH93LoP3y3jg0GbTaK0x1m+
         4A1NFAqaRnOum+9DwlXg/3ny1E0thML1DziQgSt4n5lUEL4BNrTceGXglTZNpc5/J1DD
         F46Qa7jeDca7t2gI0c1QMoxYSM1FShm9oUGA5jcS/pDULanzC3bKpUoNKaEBiLDrKsco
         2+cQ8Mz4UtW7udO474XL7djLVbE+2wlpKhHjoZMk9SyMOwTISI3O6uAbouMDmlLVmRyo
         lB73u7NqEt814fBsM6UKnCwyaAnjzir8f0bChEXo5hNfx/f5vx6T94ScNfOvgyPewWOT
         iXgQ==
X-Gm-Message-State: AJIora9WcJcRHv42clL/+tcR9aOd4T2U19M18w/6bCBlcFvBFMUKT9jR
	elpDBHOewP/j+jp0JBsn8dBqAA==
X-Google-Smtp-Source: AGRyM1sK7JtXLDkoMbF7C0EBnsfOqSTLfT/Hz3fUBzvyeiD8bJ+TTXzlwwJKP5VkY0rN4NQcrJVdZw==
X-Received: by 2002:a17:902:ef4f:b0:16b:8744:6c5f with SMTP id e15-20020a170902ef4f00b0016b87446c5fmr20376864plx.60.1657561605667;
        Mon, 11 Jul 2022 10:46:45 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902780a00b0016be9fa6807sm3236866pll.284.2022.07.11.10.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 10:46:45 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [v3  3/5] RISC-V: Fix SBI PMU calls for RV32
Date: Mon, 11 Jul 2022 10:46:30 -0700
Message-Id: <20220711174632.4186047-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711174632.4186047-1-atishp@rivosinc.com>
References: <20220711174632.4186047-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_104647_139591_183378F1 
X-CRM114-Status: GOOD (  11.20  )
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

Some of the SBI PMU calls does not pass 64bit arguments
correctly and not under RV32 compile time flags. Currently,
this doesn't create any incorrect results as RV64 ignores
any value in the additional register and qemu doesn't support
raw events.

Fix those SBI calls in order to set correct values for RV32.

Fixes: e9991434596f ("RISC-V: Add perf platform driver based on SBI PMU extension")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 3735337a4cfb..bae614c73b14 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -274,8 +274,13 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 		cflags |= SBI_PMU_CFG_FLAG_SET_UINH;
 
 	/* retrieve the available counter index */
+#if defined(CONFIG_32BIT)
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase, cmask,
+			cflags, hwc->event_base, hwc->config, hwc->config >> 32);
+#else
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase, cmask,
 			cflags, hwc->event_base, hwc->config, 0);
+#endif
 	if (ret.error) {
 		pr_debug("Not able to find a counter for event %lx config %llx\n",
 			hwc->event_base, hwc->config);
@@ -417,8 +422,13 @@ static void pmu_sbi_ctr_start(struct perf_event *event, u64 ival)
 	struct hw_perf_event *hwc = &event->hw;
 	unsigned long flag = SBI_PMU_START_FLAG_SET_INIT_VALUE;
 
+#if defined(CONFIG_32BIT)
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, hwc->idx,
 			1, flag, ival, ival >> 32, 0);
+#else
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, hwc->idx,
+			1, flag, ival, 0, 0);
+#endif
 	if (ret.error && (ret.error != SBI_ERR_ALREADY_STARTED))
 		pr_err("Starting counter idx %d failed with error %d\n",
 			hwc->idx, sbi_err_map_linux_errno(ret.error));
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
