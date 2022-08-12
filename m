Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78099C25B08
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 13:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=468vUQhAfbO4n8duvwHpZgKB4k+3PIjuBlinYqDL8Lw=; b=UGtZdaZvlPeTpV
	m6tQ/OipJ/eXtrOjawX375VJfVdjnbe8ljh0ZeYjmMllpOJXsOSvfwm1TEN2MPHPRPfm8Vb0huBe/
	xmXKvViEfiM9OhDoVMUGA0JheChXlEinLEkCuvV/D101eHdLPE2maa/16AKWtkda4MRAGtGx3RHSo
	tq65VROnXs53p0wlbk/+VmiNo8/tQpYYphY41MXPTUXgIOUmvmM+h/B6DT4wdrI/iA+vDaE5I+OG3
	chHK5qDKlCnzpLQQtmmgyQ0d+qS42x+74T9LntZKkZhFSX/bTqgTSTq6Y7AS5c8xesdUqNR0aHtFE
	ugwPIKPCc9H7n3qcN9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMV5R-008JDZ-85; Fri, 12 Aug 2022 13:52:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMV5N-008J6C-Ou; Fri, 12 Aug 2022 13:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660312346; x=1691848346;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HDcTxaIToZQYcdvOhNn0jX4NVqCzNEAbPACHR8cmaC4=;
  b=qdroew0yWNSXSVAp237SmbhRFF2fvb9Vlrt3UVT/30YaqxEHuJRGp9Jx
   zPMjT8EjcGWDd5mngxnJCq9/yZ+BNSszKWrdyZrkMQH+b6F6a2QtY1mED
   nphg8ZS2pXmWRoyn5Kps6TLuNEDedsuyerU1hDc61uFyVKPo/9RnCVJrn
   /h2wWFJIviqjIWWXK102RBp238ezZiSApZ/tUks1Mm87INIuUdmwPRpWV
   kYtIRaq1iTlWCM788ww3h9AVO/AzL9zu0EHMT7do/zzhhZq12+rKqmJJN
   wcMzKfSJgDmsbqwee72YVGsq0oYuDmmXAEG3QV4KfKxrgc4oSwWAuDAON
   w==;
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="176000719"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Aug 2022 06:52:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 12 Aug 2022 06:52:16 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 12 Aug 2022 06:52:14 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
CC: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] perf: riscv: fix broken build due to struct redefinition
Date: Fri, 12 Aug 2022 14:51:20 +0100
Message-ID: <20220812135119.1648940-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_065225_881764_BC76FC3A 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
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

Building riscv/for-next produces following error:
drivers/perf/riscv_pmu_sbi.c:44:7: error: redefinition of 'sbi_pmu_ctr_info'
union sbi_pmu_ctr_info {
      ^
arch/riscv/include/asm/sbi.h:125:7: note: previous definition is here
union sbi_pmu_ctr_info {

This appears to have been caused by a merge conflict resolution between
riscv/for-next & riscv/fixes, causing the struct define not being
properly moved to its header.

Fixes: 9a7ccac63f9c ("perf: riscv_pmu{,_sbi}: Miscallenous improvement & fixes")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/perf/riscv_pmu_sbi.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index e7c6fecbf061..6f6681bbfd36 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -41,20 +41,6 @@ static const struct attribute_group *riscv_pmu_attr_groups[] = {
 	NULL,
 };
 
-union sbi_pmu_ctr_info {
-	unsigned long value;
-	struct {
-		unsigned long csr:12;
-		unsigned long width:6;
-#if __riscv_xlen == 32
-		unsigned long reserved:13;
-#else
-		unsigned long reserved:45;
-#endif
-		unsigned long type:1;
-	};
-};
-
 /*
  * RISC-V doesn't have hetergenous harts yet. This need to be part of
  * per_cpu in case of harts with different pmu counters
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
