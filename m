Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B0FC77B75
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 07:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7YN5bhzLcQKhIp79TORDskrQL4zz4qAQRp0F51rktuk=; b=gyzoBgKD7fkzbQ
	h+BjmeRVj79wXC6U/PxpDHe09xilcvQzY2jRlB/OWaOYtQlhu5Z7kRZX3JWp+JAHeKE4SwIYDE28s
	3F6S8c1tGxn4kfQrpe//CDAZvf03c021VxGm2OgbegS0pZqXPSXTFHJJUzIVDecrui7+Az/NflIEk
	rEFQgI1KoCH3PV8H/DYHHxnKVN+m8Dx7uIPL8UkUA+ia/GB0bRKK3aTtYTMM3Hxju/6nrgdqbsEuA
	lWAeRd8YivOQf3cUlUpyTeFRqBBHV8h72sC+FmVDOG40xRT3Y8flks1LZj9g+Ynpdr8LdA5CDPZUm
	pu+yrcpt163U3gHSSzOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puplT-009v3G-1l;
	Fri, 05 May 2023 07:22:03 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puplP-009v1o-26;
	Fri, 05 May 2023 07:22:01 +0000
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
	by mta-01.yadro.com (Proxmox) with ESMTP id 9EF1634220B;
	Fri,  5 May 2023 10:21:52 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mta-01; bh=CxiB1kjw5kU527NG2fqzlCiDKoGw1uQzH5E0sL5Rt2M=; b=
	OYz6hOQjtkQz6iZFWA6d4HFQpo01RJjB/VF6Vil5bwUYf2amSg9a7bNO/kd/j8Bx
	DvjPF+RgJ1Ve9EqXHH+i/57Ybrn0aJ5V5mUZMiaX0WLQWG5PtifyIo3HLc2dYcZJ
	cBdXxOuqIRA9xIqjAQJiEYK6ihVvlxff8eJCsrJcvQY=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Proxmox) with ESMTPS id 94D7A341E6B;
	Fri,  5 May 2023 10:21:52 +0300 (MSK)
Received: from T-Exch-05.corp.yadro.com (172.17.10.109) by
 T-EXCH-08.corp.yadro.com (172.17.11.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Fri, 5 May 2023 10:21:52 +0300
Received: from rdma-x86-2.dev.yadro.com (172.17.27.123) by
 T-Exch-05.corp.yadro.com (172.17.10.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.9; Fri, 5 May 2023 10:21:51 +0300
From: Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>
To: 
CC: <linux@yadro.com>, Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>,
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, "Will
 Deacon" <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/1] perf: RISC-V: Limit the number of counters returned from SBI
Date: Fri, 5 May 2023 07:20:57 +0000
Message-ID: <20230505072058.1049732-1-v.v.mitrofanov@yadro.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Originating-IP: [172.17.27.123]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-Exch-05.corp.yadro.com (172.17.10.109)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_002200_199729_E003011A 
X-CRM114-Status: GOOD (  13.60  )
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
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
Chnages in v3:
- Detail the output

Changes in v2:
- Add new line
- Substitute pr_warn for pr_info

 drivers/perf/riscv_pmu_sbi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 70cb50fd41c2..7bf494930e92 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -868,6 +868,12 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 		goto out_free;
 	}
 
+	/* It is possible to get from SBI more than max number of counters */
+	if (num_counters > RISCV_MAX_COUNTERS) {
+		num_counters = RISCV_MAX_COUNTERS;
+		pr_info("SBI returned more than maximum number of counters. Limiting the number of counters to %d\n", num_counters);
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
