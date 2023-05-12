Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D0CC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 08:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fx5PcLeC0+h+RRa9833afpv2TQNwIZgF9dHKuZGndAM=; b=bmCvudb2iogJ7m
	lzcE6RiXEqqssZQO5HcCUXPgsDzX/JkB4bxXc+ix5E8HYFJTg01Vb9Ia5ZalOGEupyFbmGAMmvfvk
	wHkxdZzcI+aTz3JbZhfcQSAl9oOV+kV2seuls9MkThQjVTbcyaeBQTdaJ8oeAi2pK5yL7u56gJHqD
	srVkMIw2842aOGHU4+yJuMXWTOg9i9G4o2aaSRLlykk2kg9qK7WiYMwMBGhyIYdU5hsZxDZMFmSyS
	nFXBnTS3uJv31qw5xhNer0K7tnBJGPthSqVLhHrA3HRV48IXndB5MYWWnkIsFZruLJ2rN57xh30Z/
	QDIfRjlUX6WKFAdwumIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOaD-00BOZu-0X;
	Fri, 12 May 2023 08:57:01 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOaA-00BOXB-03
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 08:56:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f315712406so313171515e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 01:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683881816; x=1686473816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbhrF1vaRRoJzYyea1JBFcTA2VAH3WkbBcvliTXkyWM=;
        b=acVr4rEpZzh5BDTE3sCn1nL2V53Rd6FEEhr9YcXuVFfaaqCmyAiwlO95PasYfT0SGj
         kGR1ZV2BHmTa2qKvGMrDop8XWV7YinIqdDnGqQQT74v6MaiI5j7pik4jo+/fqg21x6f0
         YOS1AvpcZbF6yUuI/szDxFNTKKScZXq+a/zfEYSFViTnUDJdJ1o3AV440ACM5WinqbA8
         N/jROH4LvspGZDwgbqPZoypXDcNLEuNf+RYM0lESX4aGNXX0YNItu2rVcEGI8MUL3qDh
         lexX4ho58ebwc2SbO9qrSxysj8oD6C6z3V6mt7Uq7e5Oo7aQxDVJW6zfRgi0o8Kp+MwO
         2M9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683881816; x=1686473816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbhrF1vaRRoJzYyea1JBFcTA2VAH3WkbBcvliTXkyWM=;
        b=PgWhiVU8uEsBFxZ+TRrYDnrr1i96k+70++F5v5MgiPrSOyE4SnQ9Q7YgwHLbbkaN8k
         D5TzIZmUalKCcNqSi/QYmKlDiH4TNi5uIbfox1bbAMLJdQCTmq/+DQkGMyZIRWNA/nmI
         UWsBVSLAAhSc1C66+IBBNwqXM1pvNVtoEmCkHzUksM9Ipw1G4JGoJAhHn5I+f2mmSQ4e
         tGcyvEIeoSS5ZCNq/lL0kAi78gqxzLbZ2akQf9DUyU4HVwkXzcVUIMQl6uMdMfyHHL/s
         0l50GV2vcMBpiINlEh9zJK2uv3Ga+UNcmkcO/pBuzzv1NyCNCZbWAbPKlxJF//KR4vgd
         PCPg==
X-Gm-Message-State: AC+VfDzqtxxy7JlPhd5Y3sfucEaLfwxggvxicnda5vssqKEEGNXjEkcz
	NaYd77moMk8Nd/UwDlP8Lrapyw==
X-Google-Smtp-Source: ACHHUZ5iEPG/+h+duX0vfpwWwpJ/AAziiXGkzegiSPOBvbbch/qAjATyDjuRLujdEH9ME1cg+vOqzw==
X-Received: by 2002:a05:600c:4f45:b0:3f4:2bcf:e19 with SMTP id m5-20020a05600c4f4500b003f42bcf0e19mr8250663wmq.8.1683881816508;
        Fri, 12 May 2023 01:56:56 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id s7-20020a1cf207000000b003e91b9a92c9sm27963429wmc.24.2023.05.12.01.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 01:56:56 -0700 (PDT)
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
Subject: [PATCH v2 03/10] riscv: Make legacy counter enum match the HW numbering
Date: Fri, 12 May 2023 10:53:14 +0200
Message-Id: <20230512085321.13259-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512085321.13259-1-alexghiti@rivosinc.com>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_015658_052245_EE53317A 
X-CRM114-Status: GOOD (  11.42  )
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

RISCV_PMU_LEGACY_INSTRET used to be set to 1 whereas the offset of this
hardware counter from CSR_CYCLE is actually 2: make this offset match the
real hw offset so that we can directly expose those values to userspace.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 drivers/perf/riscv_pmu_legacy.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index ca9e20bfc7ac..0d8c9d8849ee 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -12,8 +12,11 @@
 #include <linux/perf/riscv_pmu.h>
 #include <linux/platform_device.h>
 
-#define RISCV_PMU_LEGACY_CYCLE		0
-#define RISCV_PMU_LEGACY_INSTRET	1
+enum {
+	RISCV_PMU_LEGACY_CYCLE,
+	RISCV_PMU_LEGACY_TIME,
+	RISCV_PMU_LEGACY_INSTRET
+};
 
 static bool pmu_init_done;
 
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
