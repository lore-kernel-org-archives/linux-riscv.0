Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3879C77B61
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 11:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sAho9yK7ZR+nQthTLYEQEJpPnOHUbyC+Ge1kchcA8xY=; b=DgHfjNrykoCVEW
	m+b4s1j8LYVj8rRXnnB8TBIr/wtwGv6QVOEJudPJDMxzz0Ylf4e6d1QeEXyAh+33Q69F7xa51jeHq
	q7nH4xz6NHi0IZsDZ451v1QuAeE7kf+MJFthAg7ky5tjAjgO/bG3yitK2VGe7RsuGV/+86JF9DGK1
	iRpqUd+8hcT9QJfHv2zO5mCX70EX2s04OmOU1uZKMZM86soWnJ9wg7oTH9bKTMBIdTGmhusAg9e5V
	HFiDf74ghsFOzcxb3hPk76f3mSWQ61T2R0sFmy5iV3kSEM2H4QQPdsyvvvqnuB6JXAX9eWGNSmMtB
	IN3hUDubXmcHDyQqFr4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psLt2-008zwN-1F;
	Fri, 28 Apr 2023 11:03:36 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psLso-008zo9-2y;
	Fri, 28 Apr 2023 11:03:27 +0000
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
	by mta-01.yadro.com (Proxmox) with ESMTP id 13BE1342206;
	Fri, 28 Apr 2023 14:03:18 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mta-01; bh=2ARaWPcFnQtQOS5X6+
	4cxKxG4soHJDao6hU1X26hpVU=; b=E6MC7JcPQ+Ena6ZEkWHLQWzR01F0TXIBw5
	8AfJxkDKItd90h0SCFbIOiDPd2USvGTL+sbRRDwLOmMJtJbDu0DEzWNDG7piU4WU
	sG9BCq2bBrqK8Zrt4h7RAKxeIL/+30pyERCx+uDzkON/eb+AIWJchW6qghfpFocO
	3BUH1hkkA=
Received: from T-EXCH-07.corp.yadro.com (unknown [172.17.10.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Proxmox) with ESMTPS id 090153421FF;
	Fri, 28 Apr 2023 14:03:18 +0300 (MSK)
Received: from T-Exch-05.corp.yadro.com (172.17.10.109) by
 T-EXCH-07.corp.yadro.com (172.17.11.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.9; Fri, 28 Apr 2023 14:03:17 +0300
Received: from rdma-x86-2.dev.yadro.com (172.17.27.123) by
 T-Exch-05.corp.yadro.com (172.17.10.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.9; Fri, 28 Apr 2023 14:03:17 +0300
From: Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>
To: 
CC: <linux@yadro.com>, Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>,
	"Atish Patra" <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, Will
 Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] perf: RISC-V: Limit the number of counters returned from SBI.
Date: Fri, 28 Apr 2023 11:02:56 +0000
Message-ID: <20230428110256.711352-2-v.v.mitrofanov@yadro.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230428110256.711352-1-v.v.mitrofanov@yadro.com>
References: <20230428110256.711352-1-v.v.mitrofanov@yadro.com>
MIME-Version: 1.0
X-Originating-IP: [172.17.27.123]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-Exch-05.corp.yadro.com (172.17.10.109)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_040323_490160_569356A7 
X-CRM114-Status: GOOD (  12.79  )
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
---
 drivers/perf/riscv_pmu_sbi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 70cb50fd41c2..0183bf911bfb 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -867,6 +867,11 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 		pr_err("SBI PMU extension doesn't provide any counters\n");
 		goto out_free;
 	}
+	/* It is possible to get from SBI more than max number of counters */
+	if (num_counters > RISCV_MAX_COUNTERS) {
+		pr_warn("SBI returned more than maximum number of counters\n");
+		num_counters = RISCV_MAX_COUNTERS;
+	}
 
 	/* cache all the information about counters now */
 	if (pmu_sbi_get_ctrinfo(num_counters, &cmask))
-- 
2.37.2



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
