Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEDDC3271E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 12:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WjHXBLtUzTcrDbM8N8gqYkTJaSF8BPCN78OeADCv/as=; b=fubrLE03laCxmf
	7xF67edoEauesi55060ATc9uvn3Y10AInL0M1On2rc6GAcQ92tE1QCJMHs546dAfmW1yz9lrcTh0y
	DB1OQZzSZYIu4xKIZ7uA2XVJr+hjPiRxdss31ycGRZTm8H1p02CGZ7ePyQAP99Rtxo9Lj325YF1vA
	wtPhHGoYz+QrisFghyYjSsNrxdb/ULaYTGE102t7yBCyUXdSBHlP5cKWtgO4OYoFgC8Jt3vcNXk1q
	YjTdfKO7wJypS09JBEz3l+fTnL6d9j7SiyBLaZLwdXfyYh6lQItU/Q5Yb9QA6BF7YzRaHIso155Jq
	+lNuRkGHAYJfDBwfz96Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQn69-00000003gxM-1VMS;
	Mon, 08 Jul 2024 12:04:01 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQn66-00000003gwE-3HzS
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 12:04:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720440238; x=1751976238;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DzHQZuuhc4rbXcFPPwG2NkNbtLfqLVHjk1sLEJXrM2M=;
  b=fQomGTbz/x0iE+s5XcbQVN1/AuVWPLHLdicLP5Dk5wXHLElzBr62+5ja
   Zmm6ud+HjMclp56jQoTq97O8Hwr80KvJo3jwGcJVumoUQJ+Slnh6flSHH
   2Kwfym40a6N5jZHPeDiqowsTf1ZQ//LBGIWbv3R1gY1joHNTOIfaqeZtH
   gzDXaEBbao7OVHlrkjmWeVn+94zE/0cCc2c8U+mjWoJ144aNZIpn8iIA+
   GWyHIKPhbMYNZiOV/gqcB9bYNKdA/d0n7uzyjlvsvUbAOfXKpwdadxvOu
   UHCZGOpcq9vZErKIKchPdD5wS9ej+WvpMyHAif8S0kbtw4pmzQEIG2CLJ
   w==;
X-CSE-ConnectionGUID: yWSMLGqtS1qlXJBTne14GQ==
X-CSE-MsgGUID: hPiF1mGpTDKpmL4+p1m+5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17842461"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="17842461"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 05:03:57 -0700
X-CSE-ConnectionGUID: UB7G25qvSoWG4bPE4Ifmqg==
X-CSE-MsgGUID: xjv/NurHSLi0I06QFYnJZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="85034005"
Received: from unknown (HELO xiao-desktop.sh.intel.com) ([10.239.159.85])
  by orviesa001.jf.intel.com with ESMTP; 08 Jul 2024 05:03:55 -0700
From: Xiao Wang <xiao.w.wang@intel.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	atishp@atishpatra.org
Cc: anup@brainfault.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH] drivers/perf: riscv: Remove redundant macro check
Date: Mon,  8 Jul 2024 20:12:24 +0800
Message-Id: <20240708121224.1148154-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_050358_868668_81FA90F5 
X-CRM114-Status: UNSURE (   8.41  )
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

The macro CONFIG_RISCV_PMU must have been defined when riscv_pmu.c gets
compiled, so this patch removes the redundant check.

Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
---
 drivers/perf/riscv_pmu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index 0a02e85a8951..7644147d50b4 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -39,7 +39,6 @@ void arch_perf_update_userpage(struct perf_event *event,
 	userpg->cap_user_time_short = 0;
 	userpg->cap_user_rdpmc = riscv_perf_user_access(event);
 
-#ifdef CONFIG_RISCV_PMU
 	/*
 	 * The counters are 64-bit but the priv spec doesn't mandate all the
 	 * bits to be implemented: that's why, counter width can vary based on
@@ -47,7 +46,6 @@ void arch_perf_update_userpage(struct perf_event *event,
 	 */
 	if (userpg->cap_user_rdpmc)
 		userpg->pmc_width = to_riscv_pmu(event->pmu)->ctr_get_width(event->hw.idx) + 1;
-#endif
 
 	do {
 		rd = sched_clock_read_begin(&seq);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
