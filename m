Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15266EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 21:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XduQdTf/tN0wp2Vf30X+a6IHdbm3scSXuFRMU3fjWuA=; b=BkrGCoHpO70N/q
	00SbRK+ti/EnBp4BllpHlRJkSkiHzgpXksg+OnhBCoHhoxWwYuTER2li/Nm9nKXS5c9W12I2fSXFT
	s/z033EbKiRzEMrIWhcGvfDLvtFxMEZmvCm2/PQTnNMnny12L1U7cAmYtGQ6BdoUZ8jkDRd0tymxt
	h1S9jzedDe85ypjX/h12MRC7Mj/2tXL+JABKhskVkcdXIDOx2v+D9Q6haM3aD+vc82Gx93xTW0oBK
	wXTxKHGYxXYwLztEBANY+X+370PJjrmrxdU3bhaDNMe1l91UPg2sP/ChCP0K1brvOCl0trspVOJA4
	jPOIThCroDnrqRsBktFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOPx2-008ZXv-0j;
	Tue, 25 Jul 2023 21:52:16 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOPwz-008ZWn-15
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 21:52:15 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3a3efebcc24so4167579b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 14:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690321931; x=1690926731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2G/e8y/tvnNGTMmNmnaD68PLNtHT6GiMZvoHdRg+aU=;
        b=R3puFFKq+ZSGzNHmxPCpnTeYSaLCatWyIWrrZry4+8MTe4ZYoHOqQyVLOJkTIO6LdI
         XaZlYEeLZHO5anL2SR2yyCgHJFsLbOnlsLOfAevIYDaKTrV3FP9DSGTEk5umBkS6Q2dO
         +oI4fzhIMqls8oEpa2uNjE7O3BuVthvGynrKXA6FpaRE3528ZMBIrmT8HzY2K9bzVHBT
         wsJmUYGsKcB0Mv3agSU3IhgvbUbt+lS4vYybGAHs4dk0slYivmLKTp8T+FuhMpSadz5g
         kNAWtZkrOSD1djGuw4pc+DumKUy0XZZoyGEvFkgvlVfE7JXlLLixSwTFiGx3FTnuQCoA
         6Tbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690321931; x=1690926731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2G/e8y/tvnNGTMmNmnaD68PLNtHT6GiMZvoHdRg+aU=;
        b=KYKtK2DI6RIbZ7EggNqLJiLzpxItSXJdu8yCmxd/UulRF2TkzCOMiQfgGP+RltxGZg
         lAEWORhGqTYeOAKgHKpLO0Vif+GFkWJR41d5fIDMGGP8+Ax7R5CH3HuF0svvaUQv36od
         aw0PENMtsLWaF5orC5MsJffHCkorFpr5k2GKg4tpLXs4m72fqzT2NBTfr7FDBFXiafNL
         0jt4PcnokU8U5RyWMFX+/sj8bZWBdiiWJH8umsuCZ68J4kp5piRVRvvU07s/4jU3kcA+
         xOe1gR6A+KxwN8CZ0zGVfw4PVUzaDNRXYxmJsn8Zf25vk4QZHrsuCMDWkdlp1xMHmUPE
         AonA==
X-Gm-Message-State: ABy/qLaBkaawiBlftp8poKBbq7wf3t1CLRWHgmavkTDfvwkEQVlNEXEI
	+mJtXk3LGy9OhO6BXdodNIw=
X-Google-Smtp-Source: APBJJlG54o8WY98CP+xjRTeR1S+q2Ldy/fPlKKU1BXd7oYHQ/qegEG4jGeoIlI/AUnc8VPS3G6mssQ==
X-Received: by 2002:a05:6808:e87:b0:3a4:225d:82c0 with SMTP id k7-20020a0568080e8700b003a4225d82c0mr179900oil.31.1690321931094;
        Tue, 25 Jul 2023 14:52:11 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:18d])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a005d00b002612150d958sm57830pjb.16.2023.07.25.14.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 14:52:10 -0700 (PDT)
Date: Tue, 25 Jul 2023 11:52:09 -1000
From: Tejun Heo <tj@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	kernel-team@meta.com, Linux PM list <linux-pm@vger.kernel.org>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	linux-rtc@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>,
	netdev <netdev@vger.kernel.org>,
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
	Linux MMC List <linux-mmc@vger.kernel.org>,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH wq/for-6.5-fixes] workqueue: Drop the special locking rule
 for worker->flags and worker_pool->flags
Message-ID: <ZMBECezjAixaMccA@slm.duckdns.org>
References: <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
 <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
 <ZK3MBfPS-3-tJgjO@slm.duckdns.org>
 <ZK30CR196rs-OWLq@slm.duckdns.org>
 <CAMuHMdUCXPi+aS-7bR3qRetKF9T3W9jk_HKjvaXmfHv5SEeuFg@mail.gmail.com>
 <ZLXIvXBvhsnL-ik_@slm.duckdns.org>
 <CAMuHMdU8CGhsU-1PZNdWH1xjbWcWSg2s2RFAegXi+vs=d-0t8Q@mail.gmail.com>
 <ZLcLnoAoJmQ9WTuM@slm.duckdns.org>
 <CAMuHMdUo=17kYsNEYr=qyVceRpJ4D3jMFrMOiqaH--OOhJOM4w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUo=17kYsNEYr=qyVceRpJ4D3jMFrMOiqaH--OOhJOM4w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_145213_396088_B5D5C951 
X-CRM114-Status: GOOD (  26.54  )
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

From aa6fde93f3a49e42c0fe0490d7f3711bac0d162e Mon Sep 17 00:00:00 2001
From: Tejun Heo <tj@kernel.org>
Date: Mon, 17 Jul 2023 12:50:02 -1000
Subject: [PATCH] workqueue: Scale up wq_cpu_intensive_thresh_us if BogoMIPS is
 below 4000

wq_cpu_intensive_thresh_us is used to detect CPU-hogging per-cpu work items.
Once detected, they're excluded from concurrency management to prevent them
from blocking other per-cpu work items. If CONFIG_WQ_CPU_INTENSIVE_REPORT is
enabled, repeat offenders are also reported so that the code can be updated.

The default threshold is 10ms which is long enough to do fair bit of work on
modern CPUs while short enough to be usually not noticeable. This
unfortunately leads to a lot of, arguable spurious, detections on very slow
CPUs. Using the same threshold across CPUs whose performance levels may be
apart by multiple levels of magnitude doesn't make whole lot of sense.

This patch scales up wq_cpu_intensive_thresh_us upto 1 second when BogoMIPS
is below 4000. This is obviously very inaccurate but it doesn't have to be
accurate to be useful. The mechanism is still useful when the threshold is
fully scaled up and the benefits of reports are usually shared with everyone
regardless of who's reporting, so as long as there are sufficient number of
fast machines reporting, we don't lose much.

Some (or is it all?) ARM CPUs systemtically report significantly lower
BogoMIPS. While this doesn't break anything, given how widespread ARM CPUs
are, it's at least a missed opportunity and it probably would be a good idea
to teach workqueue about it.

Signed-off-by: Tejun Heo <tj@kernel.org>
Reported-and-Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Hello,

Geert, applied this to wq/for-6.5-fixes. The local variable `mips` is
renamed to `bogo` to avoid collision.

Thanks for testing!

 kernel/workqueue.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 02a8f402eeb5..800b4208dba9 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -52,6 +52,7 @@
 #include <linux/sched/debug.h>
 #include <linux/nmi.h>
 #include <linux/kvm_para.h>
+#include <linux/delay.h>
 
 #include "workqueue_internal.h"
 
@@ -338,8 +339,10 @@ static cpumask_var_t *wq_numa_possible_cpumask;
  * Per-cpu work items which run for longer than the following threshold are
  * automatically considered CPU intensive and excluded from concurrency
  * management to prevent them from noticeably delaying other per-cpu work items.
+ * ULONG_MAX indicates that the user hasn't overridden it with a boot parameter.
+ * The actual value is initialized in wq_cpu_intensive_thresh_init().
  */
-static unsigned long wq_cpu_intensive_thresh_us = 10000;
+static unsigned long wq_cpu_intensive_thresh_us = ULONG_MAX;
 module_param_named(cpu_intensive_thresh_us, wq_cpu_intensive_thresh_us, ulong, 0644);
 
 static bool wq_disable_numa;
@@ -6513,6 +6516,42 @@ void __init workqueue_init_early(void)
 	       !system_freezable_power_efficient_wq);
 }
 
+static void __init wq_cpu_intensive_thresh_init(void)
+{
+	unsigned long thresh;
+	unsigned long bogo;
+
+	/* if the user set it to a specific value, keep it */
+	if (wq_cpu_intensive_thresh_us != ULONG_MAX)
+		return;
+
+	/*
+	 * The default of 10ms is derived from the fact that most modern (as of
+	 * 2023) processors can do a lot in 10ms and that it's just below what
+	 * most consider human-perceivable. However, the kernel also runs on a
+	 * lot slower CPUs including microcontrollers where the threshold is way
+	 * too low.
+	 *
+	 * Let's scale up the threshold upto 1 second if BogoMips is below 4000.
+	 * This is by no means accurate but it doesn't have to be. The mechanism
+	 * is still useful even when the threshold is fully scaled up. Also, as
+	 * the reports would usually be applicable to everyone, some machines
+	 * operating on longer thresholds won't significantly diminish their
+	 * usefulness.
+	 */
+	thresh = 10 * USEC_PER_MSEC;
+
+	/* see init/calibrate.c for lpj -> BogoMIPS calculation */
+	bogo = max_t(unsigned long, loops_per_jiffy / 500000 * HZ, 1);
+	if (bogo < 4000)
+		thresh = min_t(unsigned long, thresh * 4000 / bogo, USEC_PER_SEC);
+
+	pr_debug("wq_cpu_intensive_thresh: lpj=%lu BogoMIPS=%lu thresh_us=%lu\n",
+		 loops_per_jiffy, bogo, thresh);
+
+	wq_cpu_intensive_thresh_us = thresh;
+}
+
 /**
  * workqueue_init - bring workqueue subsystem fully online
  *
@@ -6528,6 +6567,8 @@ void __init workqueue_init(void)
 	struct worker_pool *pool;
 	int cpu, bkt;
 
+	wq_cpu_intensive_thresh_init();
+
 	/*
 	 * It'd be simpler to initialize NUMA in workqueue_init_early() but
 	 * CPU to node mapping may not be available that early on some
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
