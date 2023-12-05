Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F96C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 09:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wpG5WvpOeZ28Avyg2ploAv7vO5+xYljbnbYNI5O2Si4=; b=IAU6bmj7mNZ2Bh
	9qAy1+07cYwQzi+CKazQlb7qtmakyVE4HA/dErWKBrmZiB+HTMMBBYij/7mwXI2I1DpdYXetrDzy9
	j2ok8tVMeOaAWVDiXunCK+zpymBn10d6spSyrGdu3WBgNkYDj21f/+k7dbiZ3SYWmXV7gS21YxwxT
	jnPEmKSMzXuQmCcmx1qZql1zOV1sTQq8QphHI8JKvQSCoqDfE9qmd5TAP2yNV9+gN9c7oOG1R8glr
	UiNLf/5FHIyg9YASnva3WnLRis+GeiocyUfNVXUeW0QuXSgnu5JzFbYp0GSPf7fPhSOnTId/dTXei
	m04tGAtkG/HAFuBd9NAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rARhe-006nJX-1E;
	Tue, 05 Dec 2023 09:26:54 +0000
Received: from mta-04.yadro.com ([89.207.88.248])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rARha-006nIS-2q
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 09:26:52 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com F310FC0012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
	s=mta-04; t=1701768407;
	bh=KfrrOaxwH0SW4+l9ufl40h36vnN/7a6MQbhAMTM4iK0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Nzyn95L01DWqMe66VD4dfGJiBUbIvWFv7soLnpcOVJfOYV0OASs5taow3dJ+QbY8T
	 hAWKRDA1uKueBZt59xqREHO9ejuaeU5JKMvbB8Xub2dyCaiL7ZCkRHuVPfeKcKZiz3
	 MSTkvZFuH/6g/fnH/X92FfQDQcVlPcK94c4JJwqbtFSmUSWJ/TejYwdk5lYepj4x/l
	 Xq1NZnTkFjB1w4uIR7xuOzDNE4q81yVY7S3WvTUpsnS7BRQ9q8u8+pzMIn7Hs5j0TX
	 s+1eY4MDnAxgjQ2blv7KCBBdH15fkPSIhnq8ZKdju31KncokSCFcwmCoC1MCcHJnlQ
	 Ey5tiESAnu8NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
	s=mta-03; t=1701768407;
	bh=KfrrOaxwH0SW4+l9ufl40h36vnN/7a6MQbhAMTM4iK0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=PJfYgTgfmnYJvj9cmQlFOQkV/k5cGatNDFRqynyCqu6Cq+BzbGiKVUe+Npbsxkp6a
	 zEauUV7gsIOZZgQAlLkRr2X+eMfO4bgaukqbNVfkSeRK/NslMgjCU5mWOvJ+oqBPhJ
	 qn9J1A8YIrGs2ndCOG7Hlrz1dA1t7oFqizsGEbLyN5UZUCp5oRm1jnCh6rX4lO81Bl
	 7kCqzh+copb+ggT96UxKVOxcYbegEHYn8K3Z9rfft54zaCQwH835SUOiTMrDoPmnaT
	 JRPnn4fzr6Jw0AnBgVcwxLRy0QzSlSY1jeDz1hQSxcBMaZKaaPKLUHqLVxu0Wqrsi9
	 GNxAwFkQjL+Jg==
From: Vadim Shakirov <vadim.shakirov@syntacore.com>
To: Atish Patra <atishp@atishpatra.org>
CC: Vadim Shakirov <vadim.shakirov@syntacore.com>, Anup Patel
	<anup@brainfault.org>, Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alexghiti@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] drivers: perf: added capabilities for legacy PMU
Date: Tue, 5 Dec 2023 12:25:55 +0300
Message-ID: <20231205092555.35617-2-vadim.shakirov@syntacore.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205092555.35617-1-vadim.shakirov@syntacore.com>
References: <20231205092555.35617-1-vadim.shakirov@syntacore.com>
MIME-Version: 1.0
X-ClientProxiedBy: T-EXCH-07.corp.yadro.com (172.17.11.57) To
 S-Exch-02.corp.yadro.com (10.78.5.239)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_012651_108430_2E80580A 
X-CRM114-Status: UNSURE (   7.66  )
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

Added the PERF_PMU_CAP_NO_INTERRUPT flag because the legacy pmu driver
does not provide sampling capabilities

Added the PERF_PMU_CAP_NO_EXCLUDE flag because the legacy pmu driver
does not provide the ability to disable counter incrementation in
different privilege modes

Suggested-by: Atish Patra <atishp@atishpatra.org>
Signed-off-by: Vadim Shakirov <vadim.shakirov@syntacore.com>
---
 drivers/perf/riscv_pmu_legacy.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index a179ed6ac980..fa0bccf4edf2 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -123,6 +123,8 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
 	pmu->event_mapped = pmu_legacy_event_mapped;
 	pmu->event_unmapped = pmu_legacy_event_unmapped;
 	pmu->csr_index = pmu_legacy_csr_index;
+	pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
+	pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
 
 	perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
