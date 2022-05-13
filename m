Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D8BC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 13 May 2022 01:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iQvlH/Os7hhiB15CFnESAv4lhzwIILNVTbnlzeTRnC4=; b=x8CP43htY65WiF
	OF4nh9/TuGSWiZCI+gFpDooK9u/RiHN+yrGY7cDcG9AT2/RdMHNrYWzxGLnPmJN+AOgmAK8KsalOx
	MgvebgX7WjPvfCeLycb2fF6qXIgC/ybHm0YnsQkwdaoO7OkXgHEklGNeSy9zmny386TgK15Hvz3u3
	BWKYhCGUEdVReVFcdVOsMATKdSNIwFQs85n7/a7fdx3cs80p7aWmdNrbVlhSEKDsqEVJKulVRK2QU
	jYx+XvtqwwjUDZSFTUwJeiaBXVpPmZkaxBWhwvsINxagD4Fganw3imYV9vtJfG5yHDJR6DVm3zhwo
	U2HMASE8x7P9zQRCRdBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npKWw-00E8M1-Bn; Fri, 13 May 2022 01:55:46 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npKWq-00E8JM-TW
 for linux-riscv@lists.infradead.org; Fri, 13 May 2022 01:55:42 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so7166029pjb.0
 for <linux-riscv@lists.infradead.org>; Thu, 12 May 2022 18:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pPoRCiwoBINJx2a5XFW6qeMxXLBrBULI+jQkr1qktFo=;
 b=yeI2vNN+2d/X/8BAKhk7NJTErNc0t3Ri4UeoW4oeDLfEfpOVAFzJbZEdJd4OL5zlBt
 16CUDGhYrbnSYKwz5l4yd+yJBt2LGu1GYKKuQlU0JXxCrFhc0y0nLHz5FdBG0Cs/EC9Q
 2PipFMEIgbgErRSSzo9pc90GpReM2RdMLVJ4wjj5s3T1kCqIHw4Gtn8LQHJ6hBclILTU
 eJ7PTZ7bi5WndFmDlxxf7NSTRrTcclZvJ/IHeF4p/XPtcyM4vfikQtmi6VqmJqgBGTXK
 Hr0r7MsGu0t773x6K2OfWDTIoChx6ZbNlZ+vb2Xj4VxnpND6eIUNLaTpZDztoDBFnqlZ
 MrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pPoRCiwoBINJx2a5XFW6qeMxXLBrBULI+jQkr1qktFo=;
 b=ymmCJlnCU10K2hCeTbuikGpVjbleAqvMb04YUhwYNIxFN5ApASUT9bfsZhBp9LJB/s
 E4efxT1rXgspQSXf06IyTkFZuW2BwxRG85M2CY22CHEeB7c6ObF6lj70ZEk5rr8rBMvW
 whPAbBT/asmCBEsUnw/KOPxQQ0y7uIU7UA6aEvS6wf5uXjES3mN/8hauqNR2uW0vRem4
 68jzaHTo21vTGhEOeZ6xwvMWkuf0iI8vABTU2Lyu6ttqfHpdSuh5/7fpejhco6qSXs1l
 EgF5ytKdBB8cpdNO46iBqgAmql2UJkP4j9cZdsCUsCGtQbMG5a/KrwJ3OSnDq9acKUZy
 8FuQ==
X-Gm-Message-State: AOAM530CCzFU+qhp9Jgv2iRlLaDquab1e1qM/63/+dscvIgVKBZNpiHa
 PwINdtsmE1XfIKjFsq8v/7gVZQ==
X-Google-Smtp-Source: ABdhPJwufGXGbLuIccz3+zyq2wHIQcgZXVxMmyj1l/g/wWcffrG37DEvEdIXB93ZMBkLn+2Hl79Afw==
X-Received: by 2002:a17:902:850b:b0:15f:2a59:1c02 with SMTP id
 bj11-20020a170902850b00b0015f2a591c02mr2595813plb.27.1652406939289; 
 Thu, 12 May 2022 18:55:39 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a6561a1000000b003c14af5063fsm365883pgv.87.2022.05.12.18.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 18:55:38 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2  3/3] RISC-V: Fix SBI PMU calls for RV32
Date: Thu, 12 May 2022 18:55:22 -0700
Message-Id: <20220513015522.910856-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220513015522.910856-1-atishp@rivosinc.com>
References: <20220513015522.910856-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_185540_988344_B5B51271 
X-CRM114-Status: GOOD (  11.08  )
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
index 7ad92039a718..fab0dd497393 100644
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
