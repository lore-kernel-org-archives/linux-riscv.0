Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68B2C7EE24
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 09:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6Mn1iM8a77Dpp/iM4+Tggr/vFCwSJ8YMF3yOf91Ow18=; b=Q+1HIQnN9XDRLl
	cdenhBSqZpw4DEa/8GuKERYFlQBhdFrWdrsQjRLiAsKuSTNEWGsbYgh5BavTMka5Uol/wHrMKO4We
	TXMukyD1Q2wzo6tqzp68pwlA2zViUZ+om64YRrDxARNf7fPSidiuWJ8mqlLFoHbDsjnfeJDWQ+Jjj
	UoLTKr6P4NF3IoSq1m/RUikFOA9PjQEsuk4Wuccs65LXR6Cz4DL/SLwZIb3OqGn6FMtIW+mYR8ivu
	lsAKwK+wpLXt9qmiYNqEqpEosQRqJIXFZjA4PYgvQnqvyVpLfR7kXv20BBlU2/gd71NkGu0cTgHPG
	TOdzGz6cejJYB/tEAg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q51PV-006R0n-23;
	Fri, 02 Jun 2023 09:49:29 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q51PS-006Qzy-3B
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 09:49:28 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-64d44b198baso1492731b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jun 2023 02:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685699364; x=1688291364;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCKGULZsoKICMV26CUTZdo7HdnVdRStnPhClKySdS9k=;
        b=PQqRUow9lA2xKadq+K+lIoRt1U2nCSlME0lf1zaBlemjzSpNhpQWCJ7rj2a0bGzZg7
         5x3J33cl7mGEm+vAeNo2WvGwHqGAoPCq2nFq5ATEhgBzsQxFQO+AkoenBzMJoMFnqE1/
         mfU0fNhztK9vSYyT4DJuzLoHaSYg2r9S+4zJFPeyRqex1Q54qeQnc3LBZaassJHrE1/0
         WGa2BCpSsqUZBTk7R8nFbBjT5+gUF6QH4QlN15X7RLqMy6TH7wifvsVof6mcGDsDz7oV
         +kUn8AZ7GhKwLEJ7NxXduAQQNevhCZw3FB77Roz9F1wEnESTVcnqZKEX1xdmX0kYMwAx
         EipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685699364; x=1688291364;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCKGULZsoKICMV26CUTZdo7HdnVdRStnPhClKySdS9k=;
        b=d98+aWFnsw1+SoxkXkLS+71C7WTrIsACPg32e1YaPKH1wnXjPKtEU36eAOuaAuJfFq
         UqVMzL64kkeqOO6l98TYi6F+jjIGSwFLB8ARA8X34I7Sx4wHHxu+gf/PRXDupQNAzmK/
         QrEZ8f/ujosbcrMtz6lbdzNT34kF3m14JUdJ3iN6wXh9mNnQ2dnaEn/hE5pAEDFu1urM
         sGO5CI59ZOQOEYN5RCZDVDDTYOBOUDENcLYnrx+9GB3LfEC17j4VPk5yo06UfyKhTr3G
         08CjtReQ7l0M65pfuoRkFETTcI0W0hWS7AiJl8Fd4qTMAEqpfjSpHuYfhvclVoEZbSg7
         Ee3A==
X-Gm-Message-State: AC+VfDwz3FDpiM6TRKbWyzJojqrXea0ZYzwhQCiDqzLVCFLnB9Yjqw53
	5FRigMmt0GHGkOaH8ENFqWTJEA==
X-Google-Smtp-Source: ACHHUZ6TUgpY9ey2wwkjQh+C1naTGHK3wVPXR9QPdK7UAtPFF/POMWycZivijRGjtCxnFamXqgdpXQ==
X-Received: by 2002:a05:6a20:4284:b0:10c:322:72d5 with SMTP id o4-20020a056a20428400b0010c032272d5mr4866687pzj.23.1685699364448;
        Fri, 02 Jun 2023 02:49:24 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x7-20020aa793a7000000b006475f831838sm690174pff.30.2023.06.02.02.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 02:49:24 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	namhyung@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Eric Lin <eric.lin@sifive.com>
Subject: [PATCH] perf/core: Add pmu stop before unthrottling to prevent WARNING
Date: Fri,  2 Jun 2023 09:48:41 +0000
Message-Id: <20230602094841.1225-1-eric.lin@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_024927_060317_F8734C4E 
X-CRM114-Status: GOOD (  11.02  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, during the perf sampling, if the perf interrupt takes too long,
perf framework will lower the perf_event_max_sample_rate. This will limit
the number of samples per timer tick (max_samples_per_tick) and set hwc->interrupts
to MAX_INTERRUPTS within the __perf_event_account_interrupt() function.

Afterward, the perf framework will unthrottle the event in the timer interrupt
handler, which triggers the driver's *_pmu_start() function. Most of the driver's
*_pmu_start() functions will check the event->hw.state to determine whether this
event has stopped. If the event has not stopped, a WARN_ON_ONCE() warning
will be triggered as shown below:

[ 2110.224723] ------------[ cut here ]------------
[ 2110.224851] WARNING: CPU: 0 PID: 240 at drivers/perf/riscv_pmu.c:184 riscv_pmu_start+0x7c/0x8e
[ 2110.225242] Modules linked in:
[ 2110.225380] CPU: 0 PID: 240 Comm: ls Not tainted 6.4-rc4-g19d0788e9ef2 #1
[ 2110.225574] Hardware name: SiFive (DT)
[ 2110.225657] epc : riscv_pmu_start+0x7c/0x8e
[ 2110.225834]  ra : riscv_pmu_start+0x28/0x8e
[ 2110.225998] epc : ffffffff80aef864 ra : ffffffff80aef810 sp : ffff8f80004db6f0
[ 2110.226135]  gp : ffffffff81c83750 tp : ffffaf80069f9bc0 t0 : ffff8f80004db6c0
[ 2110.226245]  t1 : 0000000000000000 t2 : 000000000000001f s0 : ffff8f80004db720
[ 2110.226367]  s1 : ffffaf8008ca1068 a0 : 0000ffffffffffff a1 : 0000000000000000
[ 2110.226488]  a2 : 0000000000000001 a3 : 0000000000000870 a4 : 0000000000000000
[ 2110.226605]  a5 : 0000000000000000 a6 : 0000000000000840 a7 : 0000000000000030
[ 2110.226721]  s2 : 0000000000000000 s3 : ffffaf8005165800 s4 : ffffaf800424da00
[ 2110.226838]  s5 : ffffffffffffffff s6 : ffffffff81cc7590 s7 : 0000000000000000
[ 2110.226955]  s8 : 0000000000000006 s9 : 0000000000000001 s10: ffffaf807efbc340
[ 2110.227064]  s11: ffffaf807efbbf00 t3 : ffffaf8006a16028 t4 : 00000000dbfbb796
[ 2110.227180]  t5 : 0000000700000000 t6 : ffffaf8005269870
[ 2110.227277] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
[ 2110.227407] [<ffffffff80aef864>] riscv_pmu_start+0x7c/0x8e
[ 2110.227622] [<ffffffff80185b56>] perf_adjust_freq_unthr_context+0x15e/0x174
[ 2110.227961] [<ffffffff80188642>] perf_event_task_tick+0x88/0x9c
[ 2110.228235] [<ffffffff800626a8>] scheduler_tick+0xfe/0x27c
[ 2110.228463] [<ffffffff800b5640>] update_process_times+0x9a/0xba
[ 2110.228690] [<ffffffff800c5bd4>] tick_sched_handle+0x32/0x66
[ 2110.229007] [<ffffffff800c5e0c>] tick_sched_timer+0x64/0xb0
[ 2110.229253] [<ffffffff800b5e50>] __hrtimer_run_queues+0x156/0x2f4
[ 2110.229446] [<ffffffff800b6bdc>] hrtimer_interrupt+0xe2/0x1fe
[ 2110.229637] [<ffffffff80acc9e8>] riscv_timer_interrupt+0x38/0x42
[ 2110.229984] [<ffffffff80090a16>] handle_percpu_devid_irq+0x90/0x1d2
[ 2110.230162] [<ffffffff8008a9f4>] generic_handle_domain_irq+0x28/0x36

To prevent this warning, we should call the driver's *_pmu_stop() function before unthrottling

Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 kernel/events/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index db016e418931..098c875abe88 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -4128,6 +4128,7 @@ perf_adjust_freq_unthr_context(struct perf_event_context *ctx, bool unthrottle)
 
 		if (hwc->interrupts == MAX_INTERRUPTS) {
 			hwc->interrupts = 0;
+			event->pmu->stop(event, 0);
 			perf_log_throttle(event, 1);
 			event->pmu->start(event, 0);
 		}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
