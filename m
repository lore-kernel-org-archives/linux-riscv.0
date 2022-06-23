Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDD7C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 11:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k29QHETu8j3sb/x4Tc2IQGfALHh9XKJvUYkiNucbF7M=; b=OEifCbkkZlwTZP
	Q+KTz9W/IXChDoYxcSIG3YTG8NN+lYAbYv6/9Iq5Xi2WVypv4fkLtxvY+PW5vKGWpoYjQcJlMuRVU
	jTVLBKcor7Wt38IKHDnoh9LaXyY5FW61ztPSDslyg103Y4iCpMK7pIlrtihy+D1f8dMeWy543OY+4
	sgztzpH+XCNphswx66/nq9pHFdiPpZUw93dGi65SFmICohPUjmxO8VGGKJ/73Ac2dSBDsnStt+fGp
	RV/vdiigZsfASLChUfxUNikVhmDCTGFin4IjgIMh13uPrGIC2FADSS6UcJLBjh1hEnwVIJ+6CxuQ2
	b9366rCjPakU8wTg5Mug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4L06-00EiWf-J8; Thu, 23 Jun 2022 11:27:54 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Kzv-00EiSP-NG
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 11:27:47 +0000
Received: by mail-lf1-x12f.google.com with SMTP id g4so20411445lfv.9
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 04:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AiwvhOJxJPUU6uNwIzTnv5rn9MVYoYH9MrUzssnnru4=;
        b=J0sYu/ZBmk9mM2kM3mgXhBLLU2JnLjk5SfkirGSwl83CBXWcbdjD7uCNySiyugwXK7
         yMLRnpAgpjUFHxRHtgylNs5tpX6YFUVELCKLnv7vLEJXepRJ01fG2rny5E5ZI3qXmFD1
         E+KdUN8RpHkegWe5cyhBDFpseM5uswQcGaJf61mUOmziUcAY1zRoVVbMr/i46FXH8hSZ
         hGTO723QSStkui0ATk7FeZ24VNrmfgbKzZOn1Km8yChh22iibq4MwLbqj6u9g5YTnKke
         WnzP8QQffmOOCUG7xSAsvLwJRh56z+otaVop9i8wt7DuKwxfEOQTXj4meqQKQrz+sP9F
         2Eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AiwvhOJxJPUU6uNwIzTnv5rn9MVYoYH9MrUzssnnru4=;
        b=wRVfm3+GPNUPnXis2YfEav1+in97je+7OzN4/bIWEynf45hYfQ030qdlAUn+tB19/m
         Acb1ZfnZ+L8KtjKNnXJtJANp1wdxhIGSR8yqx5joBzj4UreH6yR1aTpKU7OR94YT/8EV
         wE2tJ/JMTDKuhabTAy85bqoLoDtAx/hHiRZSyTzCP7HWWhDcNmRwAVyH/1qmQ/0gkpo2
         Vjucg10hxMTf4L8Rc7Plwcnw0n2wSMtxXkCW/VOkTt4LR1UMyq1fuCESM6927vVL96Qh
         fygztmplSwnLtu7TdMGCPag0EK4pifzLwme61c8KVaRQ/gSubeaI9LmfkF0D35UYfyNA
         0deA==
X-Gm-Message-State: AJIora+CjhDVUKJ8ms3HV57Z6G+ezX47IH0XeqCV+AH1VRJHIkUGPaLO
	Y89G+gh92Iyq3vVQdyGOXUsma5WyO7o=
X-Google-Smtp-Source: AGRyM1tuGWwVhZz27XiXTlqPEUYTvOnZ2tEWeunEi2w/yeWWrmtrW55nWHijKdOrvvLejnfrpbIk8Q==
X-Received: by 2002:a05:6512:318a:b0:47f:9fdc:fdb with SMTP id i10-20020a056512318a00b0047f9fdc0fdbmr2792952lfe.584.1655983659882;
        Thu, 23 Jun 2022 04:27:39 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id p4-20020a2e93c4000000b00255bd6e1923sm2752124ljh.45.2022.06.23.04.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 04:27:39 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: [PATCH 2/3] perf: RISC-V: allow to use the highest available counter
Date: Thu, 23 Jun 2022 14:27:34 +0300
Message-Id: <20220623112735.357093-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623112735.357093-1-geomatsi@gmail.com>
References: <20220623112735.357093-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_042743_824430_EE7BBF73 
X-CRM114-Status: GOOD (  13.33  )
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

From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

Both OpenSBI and Linux explicitly assume that there is no hardware counter
with index 1: hardware uses that bit for TM control. So OpenSBI filters
out that index in sanity checks. However its range sanity checks do not
treat that index in a special way. As a result, OpenSBI does not allow
to use the firmware counter with the highest index. Linux perf RISC-V
SBI driver is adapted for the current OpenSBI behavior: it excludes the
highest valid index from the counter mask passed to OpenSBI.

This patch fixes ranges to re-enable the highest available counter.

Accompanying OpenSBI fix to accept full mask:
- https://github.com/riscv-software-src/opensbi/pull/260

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
---
 drivers/perf/riscv_pmu_sbi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 3e0ea564b9b8..294d4bded59e 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -265,7 +265,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 	struct sbiret ret;
 	int idx;
 	uint64_t cbase = 0;
-	uint64_t cmask = GENMASK_ULL(rvpmu->num_counters - 1, 0);
+	uint64_t cmask = GENMASK_ULL(rvpmu->num_counters, 0);
 	unsigned long cflags = 0;
 
 	if (event->attr.exclude_kernel)
@@ -283,7 +283,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 	}
 
 	idx = ret.value;
-	if (idx >= rvpmu->num_counters || !pmu_ctr_list[idx].value)
+	if (idx > rvpmu->num_counters || !pmu_ctr_list[idx].value)
 		return -ENOENT;
 
 	/* Additional sanity check for the counter id */
@@ -482,7 +482,7 @@ static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
 	 * which may include counters that are not enabled yet.
 	 */
 	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
-		  0, GENMASK_ULL(pmu->num_counters - 1, 0), 0, 0, 0, 0);
+		  0, GENMASK_ULL(pmu->num_counters, 0), 0, 0, 0, 0);
 }
 
 static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
