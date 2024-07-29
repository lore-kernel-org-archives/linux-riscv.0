Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD591C3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 13:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WnE9RJoJ/LAp7K7PhhEFTPgtPpKOPyNEly/X3zW3xM4=; b=uX7U/Zqr/SauOg
	s3fxhSH35Rp4/iwvle6s7ztVNfdH4LUz1YRvT9gr0NvRer4la5DLCR0sj/w9YZUOqKzlww2KEYfTV
	WEGUAPhJMCucWemra/AZsCjcbb5S/DeuqSgrTZcdBx3FA17x8ew4l6OICS188gLcDCflrZkcWV7Bg
	h4cdh5u62FFKFmpv94Jb5kW17GnwhXfUMNHhjCa1aTUme+rnjzvKICAnqE8352gSlOZJlLf/erhSA
	9UdgmBLzjeYsldOqvufBq3l+49UwedW70pIQooAuOHwbByX6nsrffkGwkzy7JBcX8FW16Jf4iltzs
	QRiC5N0VUfxD/QdjfwTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYPyw-0000000BK0N-3pMv;
	Mon, 29 Jul 2024 13:00:06 +0000
Received: from mta-04.yadro.com ([89.207.88.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYPyV-0000000BJyO-2tJ5;
	Mon, 29 Jul 2024 12:59:41 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 5D8D8C0003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
	s=mta-04; t=1722257972;
	bh=VJQhFLrYSDYECpfTBcXJ8qZ5pAXAxGKKGJucnT6K7zY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=t/VjHoDOvm1N+WG2LVVTiKJloNIUqfWXW3bxqLbXACr/TcSBI7Fb8Tfe3W81plJ1F
	 /XilYDISaaLOEmPW678m/qC0WBjnUaXY28+CPJOtWXb0cLUYn4VED1/9sEXYntFw/z
	 j5exWNy5B6hdtQRrrsAJ5YsrjT1yGXvAtMqqjPt4Xd82ge19yk9cfGPwCP0y1ydyJl
	 LqMS84edKdhf69D71OaEzecg+GP4ubmXyD0DDDfyGtpeKqRDRngQ9ttqH6zeGOM30M
	 OuGDE9U6u6saiSUCWcmqYY8HELKznPwuGgJIaFjUi1lrHs0iFwg233h5FGeU+dk8Qf
	 ylH99A1r6LvQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
	s=mta-03; t=1722257972;
	bh=VJQhFLrYSDYECpfTBcXJ8qZ5pAXAxGKKGJucnT6K7zY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=XPkyrht1ONvfbUbxvVjN+v+cDFYJCGY0PMqfBl6oBv68sxewEXSt2C/T0tu70LhtB
	 0NPzjMtaTscKfZnxEn42ZmxIpEYK2W18qBmRmkS55a6Mer+iEU+w4nZ9paI1iWPgAV
	 Ma2kjtqxeBWMEDx31q1pbABjsRKHIW047SSGKz05pxETEAb5nb9xLSDQnycvkE7z8D
	 WQhrtQLLcPcD+Hec4Q0XANyx3SK7d0iWV3useFrz7H7e6vmGYZUu5lDdyohfoU41FR
	 LuwKvDF1vhSe5I9En483bQkU/Wt9/So9rwJMDK+kX+IMi/loTxz1pBB64hRv00PKY6
	 jwil6En9O+/ag==
From: Shifrin Dmitry <dmitry.shifrin@syntacore.com>
To: <linux-riscv@lists.infradead.org>
CC: <atishp@atishpatra.org>, <anup@brainfault.org>, <will@kernel.org>,
	<mark.rutland@arm.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <alexghiti@rivosinc.com>, Shifrin Dmitry
	<dmitry.shifrin@syntacore.com>
Subject: [PATCH] perf: riscv: Fix selecting counters in legacy mode
Date: Mon, 29 Jul 2024 15:58:58 +0300
Message-ID: <20240729125858.630653-1-dmitry.shifrin@syntacore.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-ClientProxiedBy: T-EXCH-09.corp.yadro.com (172.17.11.59) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_055939_935231_EEFA07A4 
X-CRM114-Status: GOOD (  12.05  )
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

It is required to check event type before checking event config.
Events with the different types can have the same config.
This check is missed for legacy mode code

For such perf usage:
    sysctl -w kernel.perf_user_access=2
    perf stat -e cycles,L1-dcache-loads --
driver will try to force both events to CYCLE counter.

This commit implements event type check before forcing
events on the special counters.

Signed-off-by: Shifrin Dmitry <dmitry.shifrin@syntacore.com>
---
 drivers/perf/riscv_pmu_sbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 36d128ff166f..bf14ab282e11 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -416,7 +416,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 	 * but not in the user access mode as we want to use the other counters
 	 * that support sampling/filtering.
 	 */
-	if (hwc->flags & PERF_EVENT_FLAG_LEGACY) {
+	if ((hwc->flags & PERF_EVENT_FLAG_LEGACY) && (event->attr.type == PERF_TYPE_HARDWARE)) {
 		if (event->attr.config == PERF_COUNT_HW_CPU_CYCLES) {
 			cflags |= SBI_PMU_CFG_FLAG_SKIP_MATCH;
 			cmask = 1;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
