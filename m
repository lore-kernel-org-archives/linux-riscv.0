Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AB2C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 10:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KkEmOgJVQinzyfEAnVq+zB62xEIqs20Q6DgxS3jvwMA=; b=uTSf+9bfcCOuKa
	/cKSJJFSpqIc+Q/avWsDn3vEJO8G7rqJ1CiDypNJIXm0auUiXJXBAlhWl+3o4bviD1ec1LT3hCMEq
	bCxLQeTU9iBeiv3A4dQV6grJKju8jstGBsIRbAeHHkOFPxENtXYMV/GVvdtNXx8skekI30VwijQAI
	S3OvSIrTADRrRdquDTwUKV2U6q2ULT3SM96RpGeMWsoDN88TJUt/wmmuqRP4aMeTbEF20Yw3bFKCd
	MdL05UjKTVaxUnf+M7qQJZo0Ufq4+FAcJ2rZk8J8wdWfA54Ug3PzBrJ1ncF8EVRtTqyZtu20ecgKD
	uMQ2J2lyLHaeKryFz6Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPaO-00BWst-3A;
	Fri, 12 May 2023 10:01:16 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOb8-00BOoi-2y
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 08:58:00 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-307d20548adso889171f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 01:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683881877; x=1686473877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcoGNF7JhrmxjCUJ31ZWLSLoY1qQtRXBvkDSeKWeoAE=;
        b=j0DLCCtMEV6UXHGMXtA6jElCfmVNii679kPYYZsmKm9aD75PHOebwGkVrc6Gfiboyx
         RvCFvQmdeuzdeOvfXCdQOXwLou3CT6k5zHrydjFCJOM4CfLlm23nYTXhdENsRytg1bw2
         M+WUTSR3utlqD0vuCxQR2w2Ifa3W3yUVTfIhLcL+gs4ADta+RZD/IzA7ThYOKELeV3hw
         /YXVPvWlRyErSS21CkUFyhAfXahfWVYARbMIE9VKbydkHTCJT+v3ZtI+4FtUTpkIkXTZ
         uUkHKb7RdfHC8Q06kUAnddmIThthmriXlIOQgdPdvAX5tb59HXmbwuvIUmyRBi8UL7kz
         2WdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683881877; x=1686473877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mcoGNF7JhrmxjCUJ31ZWLSLoY1qQtRXBvkDSeKWeoAE=;
        b=WNZji97QAfHg1Xfc15+HHNnXYdjV02Rmp986Ac3QXvNTDWBAMtRkE3SVf/7uHHEzQm
         2TdraUA6d5rl55WVr5LtUXiIxrIQ+M9sjnX0U0NixVoAhPu7fya83F66Qa18cYPxINAP
         laLdgE+SddbTcSQn8AAo4USl6algm4zxrLpwFhg95Nu1WkVersjGtqSkzIXXmrr3uI95
         FWtidSGfVebhHCJvtN7zrnKBpd9SZOstMbGiOMAQ65ZHJ5Wa6zJeCerkNt4/HYNY3/fm
         vMfBZpZRZgaNVIpZMkNiQkYLRImhUPiCY8GIQ6n6f3fZRyHvQIlLCX/jBIbdvYLu05Y5
         8sug==
X-Gm-Message-State: AC+VfDxS9k7EbG6Tdv3//rjb8C86Vz2DKGRUAj/x4zTiM1eYB3YG7eYK
	DOtY/qLa31WyimV+I1sdlsVI8g==
X-Google-Smtp-Source: ACHHUZ59QZ/d2h0X4opjouOE+vww3Ww10su+H5NJb68TnAb4iZVlA+QJrLsykQHhtEpQNw67FT9wNQ==
X-Received: by 2002:adf:e941:0:b0:307:a8e8:ca6c with SMTP id m1-20020adfe941000000b00307a8e8ca6cmr8411496wrn.35.1683881877661;
        Fri, 12 May 2023 01:57:57 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id z22-20020a7bc7d6000000b003f42813b315sm12616421wmk.32.2023.05.12.01.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 01:57:57 -0700 (PDT)
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
Subject: [PATCH v2 04/10] drivers: perf: Rename riscv pmu driver
Date: Fri, 12 May 2023 10:53:15 +0200
Message-Id: <20230512085321.13259-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512085321.13259-1-alexghiti@rivosinc.com>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_015758_960107_B37B01DD 
X-CRM114-Status: GOOD (  13.73  )
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

In addition to being more pretty, it will be useful in upcoming commits
to distinguish those pmu drivers from the other pmu drivers.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 drivers/perf/riscv_pmu_legacy.c | 2 +-
 drivers/perf/riscv_pmu_sbi.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index 0d8c9d8849ee..ffe09d857366 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -95,7 +95,7 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
 	pmu->ctr_clear_idx = NULL;
 	pmu->ctr_read = pmu_legacy_read_ctr;
 
-	perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
+	perf_pmu_register(&pmu->pmu, RISCV_PMU_LEGACY_PDEV_NAME, PERF_TYPE_RAW);
 }
 
 static int pmu_legacy_device_probe(struct platform_device *pdev)
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 70cb50fd41c2..3b0ee2148054 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -897,7 +897,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_unregister;
 
-	ret = perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
+	ret = perf_pmu_register(&pmu->pmu, RISCV_PMU_PDEV_NAME, PERF_TYPE_RAW);
 	if (ret)
 		goto out_unregister;
 
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
