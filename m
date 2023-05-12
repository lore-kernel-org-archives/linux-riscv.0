Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C18C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 09:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6Bs1T+k8ZFLCq8vcoRv5Gf1SXqtEdvYI+13MY7+xwE=; b=OVCR5c+UFSrvVl
	uCVLOoSjtAwoPlQYFyVXLNuWJ0S4ki5+YamKXifFd2Ttu7+ORAFwSOlPU1sYWutamAh9nxX6AMRPM
	eosIrTDlpxSzT37e4XNLcfUGa27lHruRr25/FMzfnoM4SycTxy/E0Tmj7+MKsoG8aYOJHIALl0l+K
	A/MQ0fiQMCRcohKmJ1N3jQT3DdkSHTpa75eAqT1ShJC/lTOIMyBBKho9aZp2QvCcOXfkHfj0jIi3D
	UVA6pP5T64ucehgOKjQYkKCCvQmkZPQHPyd/gmg1b6hUdXjuf97a5cybF62j5Hj+UwvjR6A5yG0Dt
	89eYE8ubJCFLyifUmDDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPFz-00BTtz-39;
	Fri, 12 May 2023 09:40:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPFy-00BTtN-2x
	for linux-riscv@bombadil.infradead.org;
	Fri, 12 May 2023 09:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=n0tm6iJdFnSKQ00W/5tPio7/nVBToic+wNQP1K4Mncg=; b=WOQDSvx6GHf8UJ7BbXinTVQDYh
	R6UP8AYisIj9cAXcjH6TQpfSlXcWmALR+H8Ulm82jy58AS/KrmwGD7v2ECffkAOouF3EBtoZjOt0k
	U7Ln3wQucoZ1QK0KKKFdI2oUQbgwjU/xlb764TUFvkdndKjGSJYjCH8OrRyLBIe0h91qje6Pqjn/0
	FIgOEnQkGjYbMVv+py0lZQ9VzA9xhD473R8oEzBkfhCf6eEiq8nwP6IauR6n8XOEd28vLtPnDRxou
	nwClm9nedYME14tCc9tf0g0ktlxbr4GTefa8WvzSyf4Oqsw3I8upnI7l9dgyzTM9UsFb7G4AnPrjt
	e2opOp3A==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOd9-0096HC-0Z
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 09:00:05 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f315735514so312731755e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 02:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683882000; x=1686474000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0tm6iJdFnSKQ00W/5tPio7/nVBToic+wNQP1K4Mncg=;
        b=EGtRl3XrbxwPlKsaGMLrPknplRMIUf/2v48QERTJWbAD5fZ6GwtIvHIuGTaOG1VkJx
         kr78QJ1OuWm946zWh0NfAb1XA92r4iYXhlDqOTRD8e5naPGzqvesBFjl8ANthMtqZvyn
         rCW4QZEIHMW6oTNtVjIOzkDkZTY7gjMVsfoSf10DVc344cFbkshpKLK11/lZioz5cA0w
         rGI1kujd9CYkfXoc+o4IfNWBEV1VgQo3P7YkIkELNm8PRjZSW13dPvrOX2qyhMv6rzDy
         c0REunbjflDrF+oa/zPx9fvZWY/Jza2dK2akiNcUCpgBJ6AqW0SVayj0kqJRmerbop3q
         LKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683882000; x=1686474000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0tm6iJdFnSKQ00W/5tPio7/nVBToic+wNQP1K4Mncg=;
        b=JLkyBsaSuzTCE4NSP5A29R15vcmxUpXxP2V+1EMTuGFOUiFT/ItSAdxV5QbNCALPtC
         gSacnmwkq7/7mgAwMjET2HY5G20utVkAPhWUCzNfCA4RreZaEqzdd4sGcHZ9o8m9DZnP
         RNLEJu9g4wBryS3pLSNTNi9aJSVN1/7h013rcW7EvZq8N+wMlXCYUMKVh1DWRivAUNG0
         38J7BT64Dgkkg0p5oXLMeden2vp853+uvHM4tlZJAI81Eh/rxgXcO5Wi78HUpq0X5TJK
         sNI4fYvz2tsqD1WTWW6cLDVr/tJL4IL7CnFrAKINEKP4mCl0LP1zeAJ/PA5zO36qGU9S
         juZg==
X-Gm-Message-State: AC+VfDwS2+aHP9vji2h+H3m2dWtIcXKG63oHc3BojcW4Q/Ed/cU7kUD+
	v1Nh9a3hbpvlvINHJTFiBKMCAw==
X-Google-Smtp-Source: ACHHUZ4c3dRq1nnfDX2koyQfsjybOGXM/NcLT4dCbSX1o/SxrWN5Q1AZ4RiqcUhGigpJb9/i7nqMIg==
X-Received: by 2002:adf:ff8c:0:b0:2f8:33bd:a170 with SMTP id j12-20020adfff8c000000b002f833bda170mr21283755wrr.32.1683882000138;
        Fri, 12 May 2023 02:00:00 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id g8-20020adff3c8000000b003078354f774sm21229104wrp.36.2023.05.12.01.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 01:59:59 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 06/10] drivers: perf: Implement perf event mmap support in the legacy backend
Date: Fri, 12 May 2023 10:53:17 +0200
Message-Id: <20230512085321.13259-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512085321.13259-1-alexghiti@rivosinc.com>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_100003_556204_F0342284 
X-CRM114-Status: GOOD (  13.00  )
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

Implement the needed callbacks in the legacy driver so that we can
directly access the counters through perf in userspace.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 drivers/perf/riscv_pmu_legacy.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index ffe09d857366..f0f5bd856f66 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -74,6 +74,31 @@ static void pmu_legacy_ctr_start(struct perf_event *event, u64 ival)
 	local64_set(&hwc->prev_count, initial_val);
 }
 
+static uint8_t pmu_legacy_csr_index(struct perf_event *event)
+{
+	return event->hw.idx;
+}
+
+static void pmu_legacy_event_mapped(struct perf_event *event, struct mm_struct *mm)
+{
+	/* In legacy mode, the first 3 CSRs are available. */
+	if (event->attr.config != PERF_COUNT_HW_CPU_CYCLES &&
+	    event->attr.config != PERF_COUNT_HW_INSTRUCTIONS)
+		return;
+
+	event->hw.flags |= PERF_EVENT_FLAG_USER_READ_CNT;
+}
+
+static void pmu_legacy_event_unmapped(struct perf_event *event, struct mm_struct *mm)
+{
+	/* In legacy mode, the first 3 CSRs are available. */
+	if (event->attr.config != PERF_COUNT_HW_CPU_CYCLES &&
+	    event->attr.config != PERF_COUNT_HW_INSTRUCTIONS)
+		return;
+
+	event->hw.flags &= ~PERF_EVENT_FLAG_USER_READ_CNT;
+}
+
 /*
  * This is just a simple implementation to allow legacy implementations
  * compatible with new RISC-V PMU driver framework.
@@ -94,6 +119,9 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
 	pmu->ctr_get_width = NULL;
 	pmu->ctr_clear_idx = NULL;
 	pmu->ctr_read = pmu_legacy_read_ctr;
+	pmu->event_mapped = pmu_legacy_event_mapped;
+	pmu->event_unmapped = pmu_legacy_event_unmapped;
+	pmu->csr_index = pmu_legacy_csr_index;
 
 	perf_pmu_register(&pmu->pmu, RISCV_PMU_LEGACY_PDEV_NAME, PERF_TYPE_RAW);
 }
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
