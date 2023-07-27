Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A584C001E0
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 14:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OKkWSWxCyYPz7TlsRx3rP3k3sb1LKlL5v117GjOExZk=; b=MLCi/ASDOydkky
	CxdftxXZqt2HIfkaXxe229gcTETinxxfjjSzxvpRQPD90pINV8CMY66v4nzLfvtD1YgGfkrkh6fPJ
	Kdan5V8ALtGkxNZN+BeHvjP9zYsYH1fzMLqlz2kQlWwwlcyn6q7W1fMLHuQNnuN70jnFVqhadDxfI
	8/meTN5+hemAQ/pJSAPKQPFsfSuf+mVUFqGq3OFEBjCY4EWeTzn0N9LvmBAm6r8OepAVCLiC+a771
	MGQ9Q28s5gxZ9F7++k7qMo+QCY46HSp0iMR9Hy2WNNvtQv561s3hERZSVPNBEjf34zyHg/dQ3SFvN
	2k2mG1gnGlUkXMuv+X7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP1rk-00F75F-1x;
	Thu, 27 Jul 2023 14:21:20 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP1ri-00F6ww-0J
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 14:21:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbc244d307so11165555e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690467670; x=1691072470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYevbpqWo7vfFaWnhd9GizwhPV+tk9zz00ActpJaBGA=;
        b=XWBMwjubkbO9vRaYOttwxDrSJTFEVBcrDICeQ59Pnc2dizZSzISVvVnioCqBI9LHqk
         dSXp+lmchysMdo/CLXQNWFlU4x1fyaUOozpWCtj+BMDBSfANSJiaMC1ifdnBXVjkn5uy
         RP/IW5W9+fNnBGKhdEWsr7ZZaHu59UYaG/EtIeuJizX7SBt/5v/uOt3Zt276jODobK9G
         cjd22ta/DvBKRT0ijiP1TiIl15V/KrYvCFlwkXhyyILWNJw23His5BFY+b2ixsHGe4/Z
         SIiMHM9+I9+LvknjiN9jO04a5oxKABtl79j3TAJh83YQDzwfgecDzcpLyo3gRY0HKxp8
         2ByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690467670; x=1691072470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYevbpqWo7vfFaWnhd9GizwhPV+tk9zz00ActpJaBGA=;
        b=Td5FLpFhlPdDXp6Zt53DbaljOjoHyrsS4tSWWTlzgiOqLR8S2I3HvnjCVvD+KrWGJa
         dbIqACBNBdVsbztMIZ7QjpJC+9cYtQxDe6y6rJ7uaA5HwK+c/TH6n7i1swYVMoFImTtq
         JwMnAh07bs4o8jMQwEhiGAhHxsmxhaqIxxixzohgETm856ilp+tirtZV7VKHNcNETANT
         IM2rzS2/EeFGwe6uCrCmksisP0ebpx0VHrH9+ByPCiw05AlqH4PJlAKQniZPObCiddKZ
         jAP/me1hUlAbuxS41zlInYhXExoBViqiKnMRCP2lfbYUOwpPjOHJOkgXuwVUsZ3PKGV3
         jf7A==
X-Gm-Message-State: ABy/qLZiabk0zseWK5eIb0a4BpJ+3S3PkD0bTtZiJvs1zSNe6+Ryzo0e
	gLdwP4ogrOQKRRLy55au/fE0xg==
X-Google-Smtp-Source: APBJJlGmPLnUag1VuaLuFW1FloTx0dXXNsWXltLK5jWWs0VWnV0fBJBZoh1TvuLbzK7XCwbSsH9Hew==
X-Received: by 2002:a1c:f704:0:b0:3fa:934c:8356 with SMTP id v4-20020a1cf704000000b003fa934c8356mr1717042wmh.10.1690467669652;
        Thu, 27 Jul 2023 07:21:09 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p12-20020a7bcc8c000000b003fc00702f65sm4698720wma.46.2023.07.27.07.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:21:09 -0700 (PDT)
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
Subject: [PATCH v4 04/10] drivers: perf: Rename riscv pmu sbi driver
Date: Thu, 27 Jul 2023 16:14:22 +0200
Message-Id: <20230727141428.962286-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727141428.962286-1-alexghiti@rivosinc.com>
References: <20230727141428.962286-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_072118_152764_A78401DF 
X-CRM114-Status: GOOD (  15.25  )
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
