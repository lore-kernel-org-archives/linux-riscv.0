Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172E6C001DF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 08:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OKkWSWxCyYPz7TlsRx3rP3k3sb1LKlL5v117GjOExZk=; b=upY8Og5NPUwiLA
	WfoJS3ZD1t4RSKj2xs96oh0B0h6q+il+0AeX1aXHN3i/LgTUbw5IysbjSNDn2nde783pXr70di5eL
	XIXk0k5cmtZXsRTsoEDNt0QAiX8oJyuJktTC5Xo9j1jcE8B8FWDdDeU4BChnuIgkFkvtYEJuLQRm2
	GkyVR5lEvDE4s2DLoj21+Jk2JVgZWR7PC+tjCCGmd78minbrvH1kf8gfcyGeElQdTYII+ahOcJkHz
	8btqxUd3zgNyJ/xnFu5koQu+H9Z83ZJ3kRYurINEEedeWZjDEJ5F3kpliwC2+UlH7O2gzKREEBm93
	R98dWhNu8TqJagv3dPsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6ty-004KT2-22;
	Wed, 02 Aug 2023 08:08:14 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6tv-004KRA-08
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 08:08:12 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b9cd6a554cso82561601fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 01:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690963687; x=1691568487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYevbpqWo7vfFaWnhd9GizwhPV+tk9zz00ActpJaBGA=;
        b=C7xv7YytwoR4uq7JIdhqZuJEkUTXlgAK8JHUJmTCCPtBiKU4xgvR7g4saOc5fR/eUi
         9v0d5p/9jcPbnZqTuBT2wl+C1J0cd8A7wqLULFvLvLOoFzh58uKt6CegTBYXnRQMlTJq
         UQVg5kvuetK1K9IEmMvGmkReA+pcjWnjUS2zXkWXT3C2mSMrqvJJS5G8sgGzIdZrfNRm
         f2Zf/sRlkU1+aiyhp7tww9itJbUfT0bciaWjqyZn7C477eevRSxmbICRZdx09GeJX70T
         GGfAvuHm0TI2u9eBd+hP8mafHOqR2C7stZ/pEq72HC7hbBj2xt04rk2Pwh86yl1AAQtI
         tOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690963687; x=1691568487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYevbpqWo7vfFaWnhd9GizwhPV+tk9zz00ActpJaBGA=;
        b=CPg5IU8eDXL0hLJbWw9ZTcaYkRQK8lqPhouSKsK9KdRcu0jvLs5o81OIrAEodwUF90
         TYlzve0F78gZg81jNQFqk2szFI7Owb9n+rl05oPvmSGTdlG5oVDUkh+V+Ammy5xaCkcO
         Y/4KxrFhdZ2YkcyWhKHeP0gP1LdexnXrDQ9GcnPkUSg5IebpgHzBF1+yObWudfegAo0x
         gnEI2YtU+2rmj1Hrfg01dxj0CmXZXVqfr9MoSXJu2Z0Jr3tr89UUA4PLtI/wkOlH1GoS
         HZ+7jMaE5cXkGU32u92X4GAv3a61EG7SLPj6QhBAVmVCw4/H3iqTO4vnaN/AV7b9FAnH
         6PIg==
X-Gm-Message-State: ABy/qLbs1O+73uce+Aw4iFI88r826ZBaYNE67QeNTtCNs2+4ZA3cx7v9
	tpqBcthjYq361detU+5t+gr64Q==
X-Google-Smtp-Source: APBJJlEPQvg2jgzCR48BQ66CmJM6kIoAutXpKdyiFQV/CJqhQCtj7ohJtumlf3uKGjAiRcFtAoyp9g==
X-Received: by 2002:a2e:9ec1:0:b0:2b9:acad:b4b8 with SMTP id h1-20020a2e9ec1000000b002b9acadb4b8mr3835806ljk.52.1690963687046;
        Wed, 02 Aug 2023 01:08:07 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p26-20020a05600c205a00b003fe15c466f3sm3667960wmg.0.2023.08.02.01.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:08:06 -0700 (PDT)
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
	=?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v6 04/10] drivers: perf: Rename riscv pmu sbi driver
Date: Wed,  2 Aug 2023 10:03:22 +0200
Message-Id: <20230802080328.1213905-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802080328.1213905-1-alexghiti@rivosinc.com>
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_010811_078162_001866B7 
X-CRM114-Status: GOOD (  15.51  )
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
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c   | 4 ++--
 include/linux/perf/riscv_pmu.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 4163ff517471..760eb2afcf82 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -907,7 +907,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 static struct platform_driver pmu_sbi_driver = {
 	.probe		= pmu_sbi_device_probe,
 	.driver		= {
-		.name	= RISCV_PMU_PDEV_NAME,
+		.name	= RISCV_PMU_SBI_PDEV_NAME,
 	},
 };
 
@@ -934,7 +934,7 @@ static int __init pmu_sbi_devinit(void)
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
