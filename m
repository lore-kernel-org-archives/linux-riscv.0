Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A1EC00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 14:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IaKk4EIEun12Pg9/l7jvo/5z870BJAuHENk+wiBeYhc=; b=AoNt0hs/vRwPy5
	R/Xwh7uJvvRW3Ce3ijapnICkRN91hi7KF0a8+vTh3MD5gLGaBbal9V1EffpbQlpsJRNO1VPx1eZAY
	PhaNYVBEqJA2ZVFQLfOQVeofwZKp7LV3yfy32pFNQVCAyBrzL1o8LJInoATLKCvxkGnWeGB18TxIO
	96ir3WR8LftpTUCZ4+vnlGpgAw5zkurCZ3uoZLO5b2jhBGr6+3SqcfmU+dT0UpFPGxxXa8h7GRCi7
	32aEg9treFiLB+CMzzcEffUKB8DJwgdug9rH/SQDPD2TAPBz1dK16l+MSlXn+nyuL0sgNF/om5V+k
	WFmb8ORUREwjAhoubjNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMVlt-008zkr-0f; Fri, 12 Aug 2022 14:36:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMVlp-008ziq-WC; Fri, 12 Aug 2022 14:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660314978; x=1691850978;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NZdNw4yzR3JOq1ErSTGBTEqLp6LfEi9WXswBRDEzWOM=;
  b=yX9CYZhHSfR9XZkj5NUzjqqFJoTImtJFwPXsvmqoLLJo24qzJ/oNphIt
   Xq97fKZ09vQGbfgpOeB2ycA9FMZ3N0Lt5BozlV9TIW6JlFUEiFeQfRv8V
   a+hBGnJ0JZ/IMoIe4iMBQmdO+KEa+3ZZUCjlcqDqIesTZ0yCiDEWmta/0
   OZSjGL1TjOdeCbMKF1iLrhSyqP+e7TjtZGC58v7Yx9ve7ggdMFtrFnEqC
   xnHFJUnABNTtevl8fdZA0vl1B+6wds3PJ+8aJlBTN3mHirdY5Bn8K5MGL
   2OF9G5EEb0g4AX6K8/lWk32pylJnGYr1ZF4E6uMufx3aPp1mV42j1aaea
   A==;
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="176006453"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Aug 2022 07:36:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 12 Aug 2022 07:35:51 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 12 Aug 2022 07:35:49 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
CC: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] perf: riscv legacy: fix kerneldoc comment warning
Date: Fri, 12 Aug 2022 15:35:32 +0100
Message-ID: <20220812143532.1962623-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_073618_058600_6B132E76 
X-CRM114-Status: GOOD (  10.68  )
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

Fix the warning:
drivers/perf/riscv_pmu_legacy.c:76: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Fixes: 9b3e150e310e ("RISC-V: Add a simple platform driver for RISC-V legacy perf")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/perf/riscv_pmu_legacy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index 342778782359..2c20b0de8cb0 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -72,7 +72,7 @@ static void pmu_legacy_ctr_start(struct perf_event *event, u64 ival)
 	local64_set(&hwc->prev_count, initial_val);
 }
 
-/**
+/*
  * This is just a simple implementation to allow legacy implementations
  * compatible with new RISC-V PMU driver framework.
  * This driver only allows reading two counters i.e CYCLE & INSTRET.
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
