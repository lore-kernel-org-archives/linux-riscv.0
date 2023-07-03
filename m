Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAECAEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 12:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20FuT/psqh3xi93+PVX5Gz/lFmFDy9mcMK1hXRiTBfA=; b=l0M0GD0gY0tiQH
	98zRDanzCZuE9JRE+QvlR35nLpa0oAUO8odbfc4+7bwb/k9pI1eISLdv70RoHvDOYgkpr3PU1gNtZ
	87jrepjntaxaFB+lOMt5AJW935CYABGnS365/du14DPJ8stwX46GDqJFaLl9UWgI+8Qb5PniQfcnK
	PzbAGwnaBRc6K2Bew94pk2tLNustbQElnfachxmksasAw5oh0WFkmfjzrkmnFPyUuhV7HLaoyAMoQ
	XebWuMOT+yhSzmn+BxETiV6GY2UavbkiLXP5Bdl433ditWyzhtV2h4IHZfUWB5j1sSVWZJb1/5PBU
	HAEywOGaijLx8q4He81g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJ1A-00AXOu-0j;
	Mon, 03 Jul 2023 12:51:00 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJ18-00AXMc-0D
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 12:50:59 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbca8935bfso28593675e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 05:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688388654; x=1690980654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ourpCES+L8D+Sf3DlwDnrKMPgPuj2Rb0Ie1m7RKO9o=;
        b=R2mmycKhbCyBcolm5337go0SS5yH7iKYlFTh6vaXqDAT2thZh7dS4t9EB+dJWDtLzc
         oWybcyPhuJ95UPdczXfLx72iJy0OYIZx9KkWN2hkFjzTrvlHnbolmOlStyFSgGcRIjOT
         MGxUJEI/Bp63Snk+jy/fDQUHTUGk+V4sQqTJ5D7WxT16CNXYHi5/IbRNkr7xQqTPQp82
         u2IGDpKnncM3esjHkd+KkORsr9U5ommVCQrACrcM1rq0hTyVqHo7BZsH2/0z/IJAh+DK
         iV+HPPbfvnjf90vemg2bcsGOyo4nX7umFqfnGcDfcdTz5pZ6KOBpMEGK0wFUmJQ0j+WA
         eMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688388654; x=1690980654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ourpCES+L8D+Sf3DlwDnrKMPgPuj2Rb0Ie1m7RKO9o=;
        b=QNcgYZwSSEQoktJjOCawsZCII5GXKUyYnih/AMryhiYcXX6LAJmhksnhnFqA4B6Wnx
         39/iDiLNWNLH/zEhVPo2hLGdKwqj2aJgVYNEBSgwhXP4zCp2+4VcaqNsa0a69b3F1LGw
         NuyvpXdfOT+Sdd0MgkIML2iK7Rp7mqF2K+Shtw75X79VZ0Y4/UZ5lwY+D3gUB/jt8Kf9
         aPCfWk3791kpReTWaHD6o03fDF8oL7714DT7DcurK5MHDLOoMmnVkU55IooG4+R37tTw
         DaxUuz+uQwZ6cHNeBI7Jfug6u6AEzkqSsnySZu2Dgl5BqQs7TTzl9jMZAxkGD5n5sEPM
         VkSQ==
X-Gm-Message-State: AC+VfDyqMsuR21nVmAPK+/UH3GJW96wz3fj5sJPhCznUxQiIKHRF/uA1
	B0VNedzoeBQ0UYrn7JhriQAAqw==
X-Google-Smtp-Source: ACHHUZ72K+0MoLXDbC0yNCWkxDT9b84sSKqy9wgEkUDqJtCshD9xmcD8/7T8ejldgsm5oOBMR3qFnA==
X-Received: by 2002:a05:600c:220c:b0:3f5:1728:bde9 with SMTP id z12-20020a05600c220c00b003f51728bde9mr7765354wml.2.1688388654013;
        Mon, 03 Jul 2023 05:50:54 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id f13-20020a5d50cd000000b003143b7449ffsm786576wrt.25.2023.07.03.05.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 05:50:53 -0700 (PDT)
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
Subject: [PATCH v4 04/10] drivers: perf: Rename riscv pmu sbi driver
Date: Mon,  3 Jul 2023 14:46:41 +0200
Message-Id: <20230703124647.215952-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703124647.215952-1-alexghiti@rivosinc.com>
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_055058_106918_E415F058 
X-CRM114-Status: GOOD (  15.31  )
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

That's just cosmetic, no functional changes.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/perf/riscv_pmu_sbi.c   | 4 ++--
 include/linux/perf/riscv_pmu.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 4f3ac296b3e2..83c3f1c4d2f1 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -914,7 +914,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 static struct platform_driver pmu_sbi_driver = {
 	.probe		= pmu_sbi_device_probe,
 	.driver		= {
-		.name	= RISCV_PMU_PDEV_NAME,
+		.name	= RISCV_PMU_SBI_PDEV_NAME,
 	},
 };
 
@@ -941,7 +941,7 @@ static int __init pmu_sbi_devinit(void)
 	if (ret)
 		return ret;
 
-	pdev = platform_device_register_simple(RISCV_PMU_PDEV_NAME, -1, NULL, 0);
+	pdev = platform_device_register_simple(RISCV_PMU_SBI_PDEV_NAME, -1, NULL, 0);
 	if (IS_ERR(pdev)) {
 		platform_driver_unregister(&pmu_sbi_driver);
 		return PTR_ERR(pdev);
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 9f70d94942e0..5deeea0be7cb 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -21,7 +21,7 @@
 
 #define RISCV_MAX_COUNTERS	64
 #define RISCV_OP_UNSUPP		(-EOPNOTSUPP)
-#define RISCV_PMU_PDEV_NAME	"riscv-pmu"
+#define RISCV_PMU_SBI_PDEV_NAME	"riscv-pmu-sbi"
 #define RISCV_PMU_LEGACY_PDEV_NAME	"riscv-pmu-legacy"
 
 #define RISCV_PMU_STOP_FLAG_RESET 1
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
