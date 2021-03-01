Return-Path: <SRS0=HRg9=H7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB60C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Mar 2021 14:30:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70EF864DA3
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Mar 2021 14:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70EF864DA3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vtb6Hmx+ImZt+Br1TuA3E3NrnmqM+A/OAEcWRs9Vbr4=; b=H+wxWtVyOGWqogRWaLx5r9csS0
	5jg9mKv6zHmE/2XWlKuOixdk3JPxZwN94sokjPcwgs3ZkCKwqy+eczbTENJZrH2pq8IvV6bhiq84c
	xUJ3XksdJyOz9RCUedEm8+cifM/tRPskOvfsEmR/5qX2d92uGAP5oCaEDok/P41VQ9MCpRvuWrql5
	wBygQqGZdnVeDX8bgX7PpiEd182GtC4WwLw5fPjbBkLAVTOBT8Ok9sSU4p9K//RNdWw/uuSmbwLks
	cuGC7j5m18RfmDu/sSPGWKHTfc5l9bsz+hlM76geMxYL+t0uYixyFiJwDvluy4fI3AcMqojw7a7nA
	CDK+SURA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGjYt-0000fe-9t; Mon, 01 Mar 2021 14:30:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGjYp-0000eD-TI
 for linux-riscv@lists.infradead.org; Mon, 01 Mar 2021 14:30:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D90D64DBA;
 Mon,  1 Mar 2021 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614609011;
 bh=MucoJTNiFHCFYNwN2fx6G+sQ2VpQS44c0zeeuezrTos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rbx8gdTS4v7hg0KO2eaeQK1DKUK2N5PyUae0bKPtj1xcqfwK9GuL3iA5dRfa87Md5
 yqhDHWsH0V28RXC65G0kbq5pd2YTh0WydUc44+d8gFB7N+Y0SvVXNK3oiy73qAlNA3
 I1wVEcFmeulFH7Ya+U/4kgKkzP0vvDBbQmESCSa2vii3yNwTAvOEJOPxDBjA0KHZFE
 NLfGwF45GTKehISWdoCSRBJWI0pCPAKXxgMs1xedQcSUKAEv+RvP9qI8YuLeTmoJkJ
 UE4rElruxCD9TKEF2DkIfI8qDzIzvPZSPk4fFBl8A9kLBpaFJsMczC8rD+kXiLoB+b
 h9vPdPtctGERA==
From: guoren@kernel.org
To: guoren@kernel.org
Subject: [PATCH 4/4] perf: csky: Using CPUHP_AP_ONLINE_DYN
Date: Mon,  1 Mar 2021 14:28:22 +0000
Message-Id: <1614608902-85038-4-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614608902-85038-1-git-send-email-guoren@kernel.org>
References: <1614608902-85038-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_093012_079117_65439526 
X-CRM114-Status: GOOD (  12.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Remove C-SKY perf custom definitions in hotplug.h:
 - CPUHP_AP_PERF_CSKY_ONLINE

For coding convention.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Tested-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Link: https://lore.kernel.org/lkml/CAHk-=wjM+kCsKqNdb=c0hKsv=J7-3Q1zmM15vp6_=8S5XfGMtA@mail.gmail.com/
---
 arch/csky/kernel/perf_event.c | 4 ++--
 include/linux/cpuhotplug.h    | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/csky/kernel/perf_event.c b/arch/csky/kernel/perf_event.c
index e5f1842..ccc27c3 100644
--- a/arch/csky/kernel/perf_event.c
+++ b/arch/csky/kernel/perf_event.c
@@ -1319,10 +1319,10 @@ int csky_pmu_device_probe(struct platform_device *pdev,
 		pr_notice("[perf] PMU request irq fail!\n");
 	}
 
-	ret = cpuhp_setup_state(CPUHP_AP_PERF_CSKY_ONLINE, "AP_PERF_ONLINE",
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "arch/csky/perf_event:starting",
 				csky_pmu_starting_cpu,
 				csky_pmu_dying_cpu);
-	if (ret) {
+	if (ret < 0) {
 		csky_pmu_free_irq();
 		free_percpu(csky_pmu.hw_events);
 		return ret;
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 7f25b44..3a76019 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -182,7 +182,6 @@ enum cpuhp_state {
 	CPUHP_AP_PERF_POWERPC_TRACE_IMC_ONLINE,
 	CPUHP_AP_PERF_POWERPC_HV_24x7_ONLINE,
 	CPUHP_AP_PERF_POWERPC_HV_GPCI_ONLINE,
-	CPUHP_AP_PERF_CSKY_ONLINE,
 	CPUHP_AP_WATCHDOG_ONLINE,
 	CPUHP_AP_WORKQUEUE_ONLINE,
 	CPUHP_AP_RCUTREE_ONLINE,
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
