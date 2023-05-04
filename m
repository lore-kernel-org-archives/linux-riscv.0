Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E561C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 14:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HJZnBKlkwOq86lQK2wv8RaIY1HucmMXHAF6iRK4e1nM=; b=NipvxhL9f0YVt7
	3rRMvjVKRnXP3qBseuObpx6ee9aEM+XsUSMcK5bR2A2AeuXzSHZWNodyII4yYhOVRT0y40f9yAj8F
	AswDqyjxv8ZWPNvYHf0v39z+O3prxoa9/yvUk2g9DYebkMGhei15VnDdZ07lU4BEfpZGp8Oj4WfJB
	Z4+nnbpMfygWS6+GlpHnTYpPthwjyLaCw6CaVJg6WyT9adFdDdw5MsRwaqUuaVC7KJBCBhAETomZ1
	oMa+Rp/SG1oQmE17tBhgHyTKdSXeYNpxAzN7MYUTofaYPBG4stVbw9caaHaAnGidIPWrSuWcq9I/M
	6gMlkZV95+ITUIGHuw+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puaMe-0089YK-27;
	Thu, 04 May 2023 14:55:24 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puaMZ-0089Wb-2Q;
	Thu, 04 May 2023 14:55:21 +0000
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
	by mta-01.yadro.com (Proxmox) with ESMTP id 973BE3423BE;
	Thu,  4 May 2023 17:55:11 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mta-01; bh=68wUneiVNcXZoNX1Bc3JXuJySdZb7HLrPTxieBFi0IQ=; b=
	GbJ5qoCUqBrhvdPQq+pRMf6+pC/nOfnxIlCVStXN1GkCze8aKUhntDM2kcwodem/
	to1EtAp3YkNVDq/ismn27PBPn8wwQstBiIKsEDoGBvfF50q/7uX2pkr53g44S61t
	ltu8izKyujcLcwkgcvySA5VtmTFy3LZnQ18rLu6C4uU=
Received: from T-EXCH-07.corp.yadro.com (unknown [172.17.10.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Proxmox) with ESMTPS id 8D99E342192;
	Thu,  4 May 2023 17:55:11 +0300 (MSK)
Received: from T-Exch-05.corp.yadro.com (172.17.10.109) by
 T-EXCH-07.corp.yadro.com (172.17.11.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.9; Thu, 4 May 2023 17:55:11 +0300
Received: from rdma-x86-2.dev.yadro.com (172.17.27.123) by
 T-Exch-05.corp.yadro.com (172.17.10.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.9; Thu, 4 May 2023 17:55:10 +0300
From: Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>
To: 
CC: <linux@yadro.com>, Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>,
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/1] perf: RISC-V: Limit the number of counters returned from SBI
Date: Thu, 4 May 2023 14:54:52 +0000
Message-ID: <20230504145453.981767-1-v.v.mitrofanov@yadro.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Originating-IP: [172.17.27.123]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-Exch-05.corp.yadro.com (172.17.10.109)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_075520_317524_FBB27A46 
X-CRM114-Status: GOOD (  12.63  )
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

Perf gets the number of supported counters from SBI. If it happens that
the number of returned counters more than RISCV_MAX_COUNTERS the code
trusts it. It does not lead to an immediate problem but can potentially
lead to it. Prevent getting more than RISCV_MAX_COUNTERS from SBI.

Signed-off-by: Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
Changes in v2:
- Add new line
- Substitute pr_warn for pr_info

 drivers/perf/riscv_pmu_sbi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 70cb50fd41c2..9d07af2b6be0 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -868,6 +868,12 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 		goto out_free;
 	}
 
+	/* It is possible to get from SBI more than max number of counters */
+	if (num_counters > RISCV_MAX_COUNTERS) {
+		pr_info("SBI returned more than maximum number of counters\n");
+		num_counters = RISCV_MAX_COUNTERS;
+	}
+
 	/* cache all the information about counters now */
 	if (pmu_sbi_get_ctrinfo(num_counters, &cmask))
 		goto out_free;
-- 
2.37.2



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
