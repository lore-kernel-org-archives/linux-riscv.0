Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28BBCCA47B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 17:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hfNwvI//9dLGpmNAJq7aJgk7Es13KD/evmFttVQlu5s=; b=LsMFCzaavredZg
	2Mo+aYBoxMoJIVKQgP/Yq98HkKogPpaTHsjrgWkrjS3yQLd41/JM00vYN79uydZ6pXBEDKr/WM7cs
	i7KM7unezp+jRDdbLcWKhN5oR+qcJDYRO4A+7CNNXh2JOEPW7u0SdkOq91br+EtBSCORSHXT3Gjx0
	OkNE1jYwU6T8FHwaJL71MtUCdvFba1hUBZqTDgJko/LPzBs+9xJpiQRm/4Kroamhjmqipa1PnL97J
	EAxVjUY0E8KoRrU4kll3vtVayLtZ+etkGlczx0u4Aq1BIAYaX9RxHKcS/dTrot3KiNljIwMDHRk6f
	cYdyesZkh54po6//r6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAxUi-003anx-6x; Mon, 11 Jul 2022 17:46:52 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAxUb-003agX-ER
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 17:46:47 +0000
Received: by mail-pl1-x62d.google.com with SMTP id g13so125660plh.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Jul 2022 10:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YDh5YVCvGcySEdAssqtNk1GISfqzMGhm55Nr/hwr5wA=;
        b=VKrPvmFHCte+ybcIGCeHbEr1nkOxUZuXHYKbPyClalUQRnUtRYiQPMbKs7VFU5pv3t
         6B9RbI7HZfr0cExKC2Rr5FauJpdROREDktC8bopXp7TPTlJEwMoeVAFKhN9eoVgdAMwt
         hd/JZRe72ROYBr30l9ePQ+Xfdv2KDIAgo2BnVnbKgqAHmROaj3UtEwLbM3p5BVq96iKh
         H3fhMZyE33b7pcdhLGxXWvb+RDAAlL1P+LqxNHgQaa0Fdi5snAYPZwfF2cTQlzAyAoav
         YhO2ubCffUa8wv6OxVo/TDJCtKxpdsiXTteySTCA2Vtb3tKcq4y8w5ZkeGIgcPiGtsXL
         nIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YDh5YVCvGcySEdAssqtNk1GISfqzMGhm55Nr/hwr5wA=;
        b=Qf0+Q5VxUbUHBP+um4iQoSZ+8TI8sgeYoTz2LCil7EN85Z0gBAGV2iaQe5eb2v6FJG
         6BpuP8boBgeQGvSaLlkw1QWPOjRmWb80VCgxTWB0xwUV2ZaBzZJ32kA0vfRr4mj0YuAu
         X/5ZPK0bBYebKAih/OavTaNXJ0OxGMJnKGUYe11snTqSGu9Ify469wRcDFL+kH1jBhRv
         +5ge6Zw7mM+1zMZ4qXKGyndd8Af7W3P3d7hNTKHC6wIAAHKAkvbhre8XJtoyzB1EmYqY
         dmwu96QGBX/SjmsovRaJwb+ATZ6ED3uwOs1uw4c4O6rp925UWlMOmDRLXRfraOqMQTyd
         OjwA==
X-Gm-Message-State: AJIora+xjtmA0aK5hWtIH3WiwZsRj+Fbnt7MMfvYqD+0uoHi7O8+ijwj
	PbxY913eOPo65cyzQ7bBShouCA==
X-Google-Smtp-Source: AGRyM1uUdg0luGzLmisAjzt01bCPhHy3/uI8TPvejk8VYxoPSmO1DV6ej9sDbjQtr8T/9tuzYcmaIQ==
X-Received: by 2002:a17:903:2683:b0:16b:f38b:16df with SMTP id jf3-20020a170903268300b0016bf38b16dfmr19945118plb.94.1657561604692;
        Mon, 11 Jul 2022 10:46:44 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902780a00b0016be9fa6807sm3236866pll.284.2022.07.11.10.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 10:46:44 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [v3  2/5] RISC-V: Update user page mapping only once during start
Date: Mon, 11 Jul 2022 10:46:29 -0700
Message-Id: <20220711174632.4186047-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711174632.4186047-1-atishp@rivosinc.com>
References: <20220711174632.4186047-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_104645_501476_B4EA5A76 
X-CRM114-Status: GOOD (  11.83  )
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

Currently, riscv_pmu_event_set_period updates the userpage mapping.
However, the caller of riscv_pmu_event_set_period should update
the userpage mapping because the counter can not be updated/started
from set_period function in counter overflow path.

Invoke the perf_event_update_userpage at the caller so that it
doesn't get invoked twice during counter start path.

Fixes: f5bfa23f576f ("RISC-V: Add a perf core library for pmu drivers")

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu.c     | 1 -
 drivers/perf/riscv_pmu_sbi.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index b2b8d2074ed0..130b9f1a40e0 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -170,7 +170,6 @@ int riscv_pmu_event_set_period(struct perf_event *event)
 		left = (max_period >> 1);
 
 	local64_set(&hwc->prev_count, (u64)-left);
-	perf_event_update_userpage(event);
 
 	return overflow;
 }
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 0cb694b794ae..3735337a4cfb 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -532,6 +532,7 @@ static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
 			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
 				  flag, init_val, 0, 0);
 #endif
+			perf_event_update_userpage(event);
 		}
 		ctr_ovf_mask = ctr_ovf_mask >> 1;
 		idx++;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
