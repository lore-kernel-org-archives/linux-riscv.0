Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F477EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 08:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+s68XCbt1J1h6ZnhWiiZTS74NePi1C9CLMyZJFHRXuU=; b=FQEF/ziMmCdm6B
	9xUBnC+JMkoDyAwyDEYSHo/rCf6ftBGWmOAl4zWaTFz0/1PA0IiNDyHCafj2wY4Eq5MeEOR855LqK
	MgpOboCkEy6uGv8kYUZUMyuatAUWdf1VQB2BcXFivNK85/QKKRdfyKIXspYPF2VHbVULSvZKLs3Et
	yxv9hvzXGJP/PraratvZM5kHjrLDXEFdaeEdV7F1Lte2Lhqg9B4PMo20pg6z8fiKyBi1vLS5SBH0M
	qTObcIJnR6KV0+S4Y++KajNVct0ZlCeRofOC1clWP/v5HRpUYSnfIZ6TiplF6snUSy5giwJTgMtzt
	qTnHI/VphC7eAa8rGkYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9da-003CKE-0h;
	Fri, 30 Jun 2023 08:37:54 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9dW-003CIL-2l
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 08:37:52 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-311099fac92so1920370f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 01:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688114268; x=1690706268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvJvx6RMtbDuAT1323RkBbGas4rmn6vZDZsiVVfiSsE=;
        b=lWYkSVEYk5z1FejtVVUA0klldRhytVUq4PVf4APQO/bNNLW/bXq2VaOOZVOHGfJo0O
         BoiDmTkHr4BJGzf9seJQJSJWO4tDokNB9OYnzyZ9xNSeJpd/4l9Cw3LYv2YWRbwKkPer
         cpYZTFs3FNiAgtWi/HbXsX6KJ6ti6gDFyhxO0m+hPO62v2Nzayz78ya/YGGdx3ahDrla
         NaD5ITslJvXdKypZQhW3fQZDMwKaiO2M0Gc7BNqUcEoQXxKdIbAhuUFjt90uq+1HtX6X
         Cw665ivPIqqU5u4yQz+OKSxIg2E766BxHZiRcVrVuGpi5q3pnpJFT/KRyebn+/o6G7Ry
         PRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688114268; x=1690706268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvJvx6RMtbDuAT1323RkBbGas4rmn6vZDZsiVVfiSsE=;
        b=D9DLZnPTCMVey35oRL7lOCxCQZULyKKAm2nm3lYTtxLe9NMowzoC6HSfUXs53qsCOu
         eyQRV6ZyjFGquBtMxhy5xKoQNN69JSrJEIe0Vnkj0FHOJx1u7SWTuRvN9xC2FbN3RP8o
         5JieiQcHH8J5lXydX4lDycgYjvUlunlg7my8abkYuskSD/sF6MS7WTffQWx+dyQx++tm
         643CLPJQoXPMZm6tonUGABhtLG38vOYYxDcL8ZT/YfHWwKBwxUrlgP94gNSIvlCQB4uW
         Mpicoj/S5BL+io0TkLVveFTS2MDruT4E1SmHj6FU+TOuiB1Hbyx9JKJe95F1jnBv1ApW
         fe5w==
X-Gm-Message-State: ABy/qLbeW48IIj6GjfL1iH8CAJr3kk6budNnJgmr8EjUz6WdY7J7hy17
	PMLD7m2x8u86tcg9Gv6I6IR2Aw==
X-Google-Smtp-Source: APBJJlG6zuYcHOK0e1CApmkChpZ6WGYLrjfJBoOIUDquuicfotpS+IYjw6DMOOQWgIsvHOVOFPC1aQ==
X-Received: by 2002:adf:f6c7:0:b0:313:f60d:4958 with SMTP id y7-20020adff6c7000000b00313f60d4958mr1674659wrp.53.1688114268066;
        Fri, 30 Jun 2023 01:37:48 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id i10-20020a5d630a000000b003141f5aff08sm1576732wru.82.2023.06.30.01.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:37:47 -0700 (PDT)
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
Subject: [PATCH v3 06/10] drivers: perf: Implement perf event mmap support in the legacy backend
Date: Fri, 30 Jun 2023 10:30:09 +0200
Message-Id: <20230630083013.102334-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630083013.102334-1-alexghiti@rivosinc.com>
References: <20230630083013.102334-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_013750_892229_9A9B1B19 
X-CRM114-Status: GOOD (  12.46  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/perf/riscv_pmu_legacy.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index 6a000abc28bb..79fdd667922e 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -71,6 +71,29 @@ static void pmu_legacy_ctr_start(struct perf_event *event, u64 ival)
 	local64_set(&hwc->prev_count, initial_val);
 }
 
+static uint8_t pmu_legacy_csr_index(struct perf_event *event)
+{
+	return event->hw.idx;
+}
+
+static void pmu_legacy_event_mapped(struct perf_event *event, struct mm_struct *mm)
+{
+	if (event->attr.config != PERF_COUNT_HW_CPU_CYCLES &&
+	    event->attr.config != PERF_COUNT_HW_INSTRUCTIONS)
+		return;
+
+	event->hw.flags |= PERF_EVENT_FLAG_USER_READ_CNT;
+}
+
+static void pmu_legacy_event_unmapped(struct perf_event *event, struct mm_struct *mm)
+{
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
@@ -91,6 +114,9 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
 	pmu->ctr_get_width = NULL;
 	pmu->ctr_clear_idx = NULL;
 	pmu->ctr_read = pmu_legacy_read_ctr;
+	pmu->event_mapped = pmu_legacy_event_mapped;
+	pmu->event_unmapped = pmu_legacy_event_unmapped;
+	pmu->csr_index = pmu_legacy_csr_index;
 
 	perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
