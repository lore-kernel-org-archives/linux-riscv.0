Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265DCC5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 17:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+v/k5mxU9h92HPgrNXm5mELn8/HlzZd+5yWBh1IZcw=; b=1bbS/zHRXnp2X5
	6wQbsguc9THS3xT2VWtMdA+UkhkKE0cs9SgSaNxeYY3J4LHD1iE5/iEifF94QcijXL31LMF8YIc6U
	KLPpIjK/wDTvosPczjrSEes4QZCHLPuxHo3S6E7B5VUKiDceqd8O2B71/ODFSPZWvQmfEM5zvUjqZ
	4cJA0+SS7l5wPywL7uWTkKNqURoUxAtNvs3mdj0q/jIlJ6WiRaiBYAPZw/d1hv9siWsdmVdY+xunS
	rtOdyI8ua5nT9HWGdtKIxWRTfiFUfSN0jjoAjFkoFsHtiOszIDi62R0vIP/aq3NsGEhFzOVBxdv3k
	8e9NqHkQQmfUog+lVPfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf0pf-000000066xF-48Iz;
	Tue, 27 Feb 2024 17:01:31 +0000
Received: from mta-04.yadro.com ([89.207.88.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf0pR-000000066oY-2Hhe;
	Tue, 27 Feb 2024 17:01:19 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com BA0A9C002E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
	s=mta-04; t=1709053275;
	bh=58gVXq+fU1x+uUoPziMkIzpX3sjFEwU5Vn/YTcTbObo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=YomI9yAFG8F/frgktYSH7jplWkGnY9i/2jh26JfW2wGrqzSCguhuoPSqj1nnB1/zm
	 kbJ6d/TswN+97CFwWKo0BuDceoEzUSrMSR4q1gqzYCRXc/4pY8W3PQvL9PIWlxd4zb
	 Pg+NwfQ4oZMF9A4VOf2fzJecRHDPMDHh886oov221qUBHa9uEoXrr+Zpkdv0mYeMl0
	 rAVVxJlTjBnwaVCFn6Ujd7GALRtqg2rDHdZHI4+GPNSFZk+jzVZWCTw57d7s8hQBIl
	 xoGZdjXn0q3wxbUXW5BTekDwJc2PsW+ligZ+4lZ1nMUpL/po6oDD8rruwFT2+rjkiB
	 J+i+8Qhe1xzeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
	s=mta-03; t=1709053275;
	bh=58gVXq+fU1x+uUoPziMkIzpX3sjFEwU5Vn/YTcTbObo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Sw+v6nCXYfNqRDiz9nMh9YSb7rEs/WY+Qyhfw7oXQn3mTol5l8A2Kq/zZd3tLY8X/
	 5yvyyu5VxMQWDVZjMo5xTG1CkrTT8iBHXdcqK6zdFHOkpC7heLfOSY5rlKjKQy+Cyt
	 bO3GoBUru16lY8itxcjYSvzmhYNyuDn/4easMam88Xcw+aEKlYWL/qv+vARXE7Lyvu
	 mlkkuGOYlQAzokvMiUZG7LnE9BbOqz7X/oLh5RBJ4QkHWVcGiixnqU7u9Bh3RMMjQx
	 WyCXFdNcaugoMQWkaLpKHuW7CedrQ0719Byz6wNWmwv0qruydnf6CCDpPVO8HGRWUi
	 AhpNC0x7Y6K5w==
From: Vadim Shakirov <vadim.shakirov@syntacore.com>
To: <linux-riscv@lists.infradead.org>
CC: Vadim Shakirov <vadim.shakirov@syntacore.com>, Atish Patra
	<atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, Will Deacon
	<will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2,RESEND 2/2] drivers: perf: ctr_get_width function for legacy is not defined
Date: Tue, 27 Feb 2024 20:00:02 +0300
Message-ID: <20240227170002.188671-3-vadim.shakirov@syntacore.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227170002.188671-1-vadim.shakirov@syntacore.com>
References: <20240227170002.188671-1-vadim.shakirov@syntacore.com>
MIME-Version: 1.0
X-ClientProxiedBy: T-Exch-05.corp.yadro.com (172.17.10.109) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_090118_457224_48AB0CFE 
X-CRM114-Status: GOOD (  14.14  )
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

With parameters CONFIG_RISCV_PMU_LEGACY=y and CONFIG_RISCV_PMU_SBI=n
linux kernel crashes when you try perf record:

$ perf record ls
[ 46.749286] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[ 46.750199] Oops [#1]
[ 46.750342] Modules linked in:
[ 46.750608] CPU: 0 PID: 107 Comm: perf-exec Not tainted 6.6.0 #2
[ 46.750906] Hardware name: riscv-virtio,qemu (DT)
[ 46.751184] epc : 0x0
[ 46.751430] ra : arch_perf_update_userpage+0x54/0x13e
[ 46.751680] epc : 0000000000000000 ra : ffffffff8072ee52 sp : ff2000000022b8f0
[ 46.751958] gp : ffffffff81505988 tp : ff6000000290d400 t0 : ff2000000022b9c0
[ 46.752229] t1 : 0000000000000001 t2 : 0000000000000003 s0 : ff2000000022b930
[ 46.752451] s1 : ff600000028fb000 a0 : 0000000000000000 a1 : ff600000028fb000
[ 46.752673] a2 : 0000000ae2751268 a3 : 00000000004fb708 a4 : 0000000000000004
[ 46.752895] a5 : 0000000000000000 a6 : 000000000017ffe3 a7 : 00000000000000d2
[ 46.753117] s2 : ff600000028fb000 s3 : 0000000ae2751268 s4 : 0000000000000000
[ 46.753338] s5 : ffffffff8153e290 s6 : ff600000863b9000 s7 : ff60000002961078
[ 46.753562] s8 : ff60000002961048 s9 : ff60000002961058 s10: 0000000000000001
[ 46.753783] s11: 0000000000000018 t3 : ffffffffffffffff t4 : ffffffffffffffff
[ 46.754005] t5 : ff6000000292270c t6 : ff2000000022bb30
[ 46.754179] status: 0000000200000100 badaddr: 0000000000000000 cause: 000000000000000c
[ 46.754653] Code: Unable to access instruction at 0xffffffffffffffec.
[ 46.754939] ---[ end trace 0000000000000000 ]---
[ 46.755131] note: perf-exec[107] exited with irqs disabled
[ 46.755546] note: perf-exec[107] exited with preempt_count 4

This happens because in the legacy case the ctr_get_width function was not
defined, but it is used in arch_perf_update_userpage.

Also remove extra check in riscv_pmu_ctr_get_width_mask

Signed-off-by: Vadim Shakirov <vadim.shakirov@syntacore.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu.c        | 18 +++++-------------
 drivers/perf/riscv_pmu_legacy.c |  8 +++++++-
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index 0dda70e1ef90..c78a6fd6c57f 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -150,19 +150,11 @@ u64 riscv_pmu_ctr_get_width_mask(struct perf_event *event)
 	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
 
-	if (!rvpmu->ctr_get_width)
-	/**
-	 * If the pmu driver doesn't support counter width, set it to default
-	 * maximum allowed by the specification.
-	 */
-		cwidth = 63;
-	else {
-		if (hwc->idx == -1)
-			/* Handle init case where idx is not initialized yet */
-			cwidth = rvpmu->ctr_get_width(0);
-		else
-			cwidth = rvpmu->ctr_get_width(hwc->idx);
-	}
+	if (hwc->idx == -1)
+		/* Handle init case where idx is not initialized yet */
+		cwidth = rvpmu->ctr_get_width(0);
+	else
+		cwidth = rvpmu->ctr_get_width(hwc->idx);
 
 	return GENMASK_ULL(cwidth, 0);
 }
diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index a85fc9a15f03..fa0bccf4edf2 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -37,6 +37,12 @@ static int pmu_legacy_event_map(struct perf_event *event, u64 *config)
 	return pmu_legacy_ctr_get_idx(event);
 }
 
+/* cycle & instret are always 64 bit, one bit less according to SBI spec */
+static int pmu_legacy_ctr_get_width(int idx)
+{
+	return 63;
+}
+
 static u64 pmu_legacy_read_ctr(struct perf_event *event)
 {
 	struct hw_perf_event *hwc = &event->hw;
@@ -111,7 +117,7 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
 	pmu->ctr_stop = NULL;
 	pmu->event_map = pmu_legacy_event_map;
 	pmu->ctr_get_idx = pmu_legacy_ctr_get_idx;
-	pmu->ctr_get_width = NULL;
+	pmu->ctr_get_width = pmu_legacy_ctr_get_width;
 	pmu->ctr_clear_idx = NULL;
 	pmu->ctr_read = pmu_legacy_read_ctr;
 	pmu->event_mapped = pmu_legacy_event_mapped;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
