Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02836C54E41
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 17:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFhLQzJSh493+MYOPoD0GUJ5lWvVEYho2OkWwm2u5hw=; b=nSKVMvyRagi2kp
	4rynghGei+CAJTucN+/AenSCvLBnM+sJ1aBiY3IsZirWwsqabPpYJGyu2UXtbtyjQyxTmmXQDWaOm
	7NT8lN681MGJxeo6mYECHvqzs2iOqBO2EqwVX+RmUiWYbNzGDF4i52yJsipsowuxrxh+n2XnV1s8h
	wJd2KyLn9xtA8seVdOkcQdtpL8XE+AwAzEA9SUj9NboLcWOX2al+jvWd6kPPhEJWXkDDh2/21BLUf
	PGor39l20InFnKrR69HN086uyyRvbSztyEROgOiqFtIiX2n1Exf31dY5Qteztr7nz7/iDHHJjdujC
	cRzusVoyditRVVnI43Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf0ph-000000066yW-1vMy;
	Tue, 27 Feb 2024 17:01:33 +0000
Received: from mta-04.yadro.com ([89.207.88.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf0pR-000000066oB-1HGh;
	Tue, 27 Feb 2024 17:01:19 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 219C4C002E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
	s=mta-04; t=1709053273;
	bh=mczoY9NKf5IBt5T4Xh9ynOn0nMrRnFZ+wXSkQuHkLYM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ss/rCZVIbpEiLw/81MIs41zgCIYwQ7eO1waUK8E2lC8XV1bPZ/ADFEl5i9RCdVgQn
	 NVgXiB2dxEOFXWIKocoDXNdcQ+2ppyHptremx/GYff26TGVX6GRbvNeIWq329bsEcI
	 XulHE91KC1Oj9t/Wb+cDtuvFR2oD13+CZd7wHbiH5dFfRx797j4UOCCsGy+p+yG4UH
	 Sv7JIk/FNsJzUVcdNGIKyYsXSwav/yKU9qqMTUEyzTYlCrBl4aG6epatfU/yYXgdcx
	 DTmEnXn7rAKjOaIxBvQxaYWh+AXP4XiOx3HHj6wqal3uhghxS37F+2xk4PNEbb+FC6
	 mFvMoAegilq5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
	s=mta-03; t=1709053273;
	bh=mczoY9NKf5IBt5T4Xh9ynOn0nMrRnFZ+wXSkQuHkLYM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Ac+HUnNYE6GR09eK4K4fDoSgzTYJDSzmjFTWbF4DHCLei8ZJ7/ZyhmedErh8tfw/i
	 ouFn25bFeAJZgIzuSuoykv3pDYUCflzkbH6U8QlAqtW91cdxy81wrCSF9EiXM2TfeY
	 C9o+l/5J39JIugvNl1fy+cxk7SYW88+zIyh7Wut7B+P4/c5hDjf4i++9/lRgLOIlES
	 /DEqtjTlehyFThpiclkVrSV4eKqotjf2z0f/8pwTDZ1H5z6ktgfNd0CKiUB3Nlt5PS
	 EG22pwa7H5Ytcv4YEx+XLMI0F6XLVE/XPzEiu+fI8+C8duGJUJ5V1PkM22tR1q1E7F
	 UqQTU2G4Q4SXQ==
From: Vadim Shakirov <vadim.shakirov@syntacore.com>
To: <linux-riscv@lists.infradead.org>
CC: Vadim Shakirov <vadim.shakirov@syntacore.com>, Atish Patra
	<atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, Will Deacon
	<will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2,RESEND 1/2] drivers: perf: added capabilities for legacy PMU
Date: Tue, 27 Feb 2024 20:00:01 +0300
Message-ID: <20240227170002.188671-2-vadim.shakirov@syntacore.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227170002.188671-1-vadim.shakirov@syntacore.com>
References: <20240227170002.188671-1-vadim.shakirov@syntacore.com>
MIME-Version: 1.0
X-ClientProxiedBy: T-Exch-05.corp.yadro.com (172.17.10.109) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_090118_602893_CBC918E6 
X-CRM114-Status: UNSURE (   8.11  )
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

Suggested-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Vadim Shakirov <vadim.shakirov@syntacore.com>
---
 drivers/perf/riscv_pmu_legacy.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index 79fdd667922e..a85fc9a15f03 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -117,6 +117,8 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
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
