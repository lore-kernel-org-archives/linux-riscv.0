Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A5AC54E5D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 10:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4cpAq2JfN6osjN3uHfso/qe+crZ2wMg9olCoMz2v4+Q=; b=FMNHWffbQWNXFi
	2a58+TcSLQ33XLK0q7cdm0O0KOwTq6v1MJbEssdnktRHugrQQeMJjN5Ifyc3U6SF57aiBTpqn2LCf
	yFJY3wnU5eyUuG190l3fQujZzfACHZqAqiNeCLpjIXj3jy4URP/vaAhmTOB8uFNwgNp2OvI2/Im3P
	o75CJF0zAdGCT37I1BuTXCA5vHEWWiznogS7NQ24Z86WTN+ixFcW7/LuAHBpo4hSz0YOcfnxJpDEk
	f0/i3ReEKUOOEGHEsA9Zo0rx03SRmoNqmfcmM4hWLWLFK7uRB3feLduSo1V8xrWIJckEEJ0/CroUy
	TexFVhL/UbVY+5edvRTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm9pa-000000083AT-2v19;
	Mon, 18 Mar 2024 10:02:58 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm9pX-0000000838r-3neq;
	Mon, 18 Mar 2024 10:02:57 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-29c7512e3b8so3229467a91.1;
        Mon, 18 Mar 2024 03:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710756173; x=1711360973; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gV1l9rmzBCzJNW3ECkvyrqDRGHWu7/CWeWMayLYT9Qk=;
        b=jRFebnmbxSu5ZkDwn4XIB51dhNW48c9fGy0FSpVNhZBCRay8PkfYk5eRZxiTtHGprz
         9aTegy9w4wEMl+G05Eort2655nil9q5aco6kpoyRi1S9Ut+AEfd0LGREqLc4rPd2y/4g
         ld/n+VOwxgMywV/tU01kSBLhV+qB9N3PfBCsmeHjBQFRpfecT0UNl7nc1Gp7fx4PaIe1
         5RjJb5ZUEBANTovUSCq60EFSwEzWp7EwWkZnlyCItl4OO6dodpl+YiABJUGMC+hsl2fy
         6/7IyvxTa+NqzXSQ0gU2fipoz8gQR3WCzsMBzg2+teYxEkQhy39k0WFX23z+x6OICFI9
         oahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710756173; x=1711360973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gV1l9rmzBCzJNW3ECkvyrqDRGHWu7/CWeWMayLYT9Qk=;
        b=ZCeBJd22FwlEwQwcqfO//4K/wbBxi4szwDHoc6eMQAOAv9+/WkYO451Sj9hum8eMQn
         UlVAeurR0x6ny5oHURAgNOZQ8stmNb51aMZQzbgLeZMBQPmoGk1fwmNHl3wiV4T+sMm0
         Pb1WZwEEz0QyL8fXJCvKa3OoC+moqd0F1dL+E8UawpOVibd7LbkaUOtPvuMVmyUiN61L
         qTp488En5yWQlTdIX6lBJuTN3XyqKxfLwb4zs0z+LpZqYt0h6FPI/j4Ok1Lq2k3SiT/r
         EtrUcuZ0/gIZoKB3lSm1539DTxMZI3CKVduQybs+YbxDSLCtUI8SQXcTmaP79h1i1E8M
         8AIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvM1VbVUwftwoaxV8dtHWxrg+tUoKJHz2Sy0HuromBfOrnGfbbnI3irHHTcYvuFFg4XrFC3thmiR8AAXgSFxjaYT0OET1t4lHmD8DUbSe1rYV+oUqX/sMJ1VyMEq9qQ2h65ZbkfcPv9YmrQE7joNrRQ3oR84Y=
X-Gm-Message-State: AOJu0YzF/PH9u370uXWcpONleFZgVEOeS9fa3sPqB1pmmlkOxXXbHa3g
	YEcdql1yluq4L2TwwdQ8SL/LsRo0SO7zvvc/rbADYhYhSSZqeggI
X-Google-Smtp-Source: AGHT+IEcvsWQUyJLQ8qV7FkXWB79q4QhcFWpWDYu78GsX363yZUh1ev5rOsRAXQM6lfbTC9LQZr5sA==
X-Received: by 2002:a17:90b:440b:b0:29c:7845:cba with SMTP id hx11-20020a17090b440b00b0029c78450cbamr10647032pjb.36.1710756172888;
        Mon, 18 Mar 2024 03:02:52 -0700 (PDT)
Received: from DESKTOP-4R0U3NR.siflower.com ([2a09:bac5:6249:183c::26a:36])
        by smtp.gmail.com with ESMTPSA id rr7-20020a17090b2b4700b0029bcf877eabsm7360608pjb.10.2024.03.18.03.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:02:52 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Qingfang Deng <qingfang.deng@siflower.com.cn>
Subject: [PATCH v2] perf: RISC-V: fix IRQ detection on T-Head C908
Date: Mon, 18 Mar 2024 18:02:40 +0800
Message-Id: <20240318100241.267857-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_030255_971736_B7B58FA1 
X-CRM114-Status: GOOD (  12.43  )
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

From: Qingfang Deng <qingfang.deng@siflower.com.cn>

T-Head C908 has the same IRQ num and CSR as previous C9xx cores, but
reports non-zero marchid and mimpid. Add the check for C908 ID.

Fixes: 65e9fb081877 ("drivers/perf: riscv_pmu_sbi: add support for PMU variant on T-Head C9xx cores")
Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
---
v2: add C908 ID check

 arch/riscv/errata/thead/errata.c       | 5 +++--
 arch/riscv/include/asm/vendorid_list.h | 2 ++
 drivers/perf/riscv_pmu_sbi.c           | 6 ++++--
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index b1c410bbc1ae..da3b34866d8f 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -125,8 +125,9 @@ static bool errata_probe_pmu(unsigned int stage,
 	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_PMU))
 		return false;
 
-	/* target-c9xx cores report arch_id and impid as 0 */
-	if (arch_id != 0 || impid != 0)
+	/* Early c9xx cores report arch_id and impid as 0 */
+	if (!((arch_id == 0 && impid == 0) ||
+	      (arch_id == THEAD_C908_ARCH_ID && impid == THEAD_C908_IMP_ID)))
 		return false;
 
 	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index 2f2bb0c84f9a..57b3de510d38 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -8,5 +8,7 @@
 #define ANDES_VENDOR_ID		0x31e
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
+#define  THEAD_C908_ARCH_ID	0x8000000009140d00
+#define  THEAD_C908_IMP_ID	0x8a000
 
 #endif
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index bbd6fe021b3a..34d8689982de 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -833,8 +833,10 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 		riscv_pmu_use_irq = true;
 	} else if (IS_ENABLED(CONFIG_ERRATA_THEAD_PMU) &&
 		   riscv_cached_mvendorid(0) == THEAD_VENDOR_ID &&
-		   riscv_cached_marchid(0) == 0 &&
-		   riscv_cached_mimpid(0) == 0) {
+		   ((riscv_cached_marchid(0) == 0 &&
+		     riscv_cached_mimpid(0) == 0) ||
+		    (riscv_cached_marchid(0) == THEAD_C908_ARCH_ID &&
+		     riscv_cached_mimpid(0) == THEAD_C908_IMP_ID))) {
 		riscv_pmu_irq_num = THEAD_C9XX_RV_IRQ_PMU;
 		riscv_pmu_use_irq = true;
 	} else if (riscv_isa_extension_available(NULL, XANDESPMU) &&
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
