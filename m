Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B39BCCF2DE
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 13:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRkx/UFaEsW++lE6OrBo4KMMeUEAs4wIG91bSVF/1yo=; b=vrVftKC9FYfUrf
	pgLpLzkqoibPM2KtibjBGIilC6vFfl32khWq721VRm8DcuGmEfb/ZkwiHha7JlgkzpylmvvAtg3f/
	eE4//cUH3pdaccNUtJsgf3riH3kKufxtwcIEGAGaNPJie01qkWA9BupenxdfrOIAFNGEp3aSKYAzs
	p3rwFfno+aj/KwnGegWGNkeAJL/pwElXIrQVjJaEPnAKbIRVLHspiy+VcDkoFYJLvPqZ6hUUE9hki
	4icNpSnp8+PFXksQGZ1CFYrlsIUo3nwodvEMU3vZgjutl+9+SCEr7b4/uM5WOOR2dXhM+CU4GKsjj
	/pjz4jAZRwUoy/MjaSOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn8X-00000007TgK-05Yr;
	Mon, 19 Oct 2026 13:10:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn8W-00000007Tfm-2xuA
	for linux-riscv@lists.infradead.org;
	Mon, 19 Oct 2026 13:10:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 27E856021C;
	Mon, 19 Oct 2026 13:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35AB21F000C5;
	Mon, 19 Oct 2026 13:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415443;
	bh=7ODb1dWP8rGg5ULadQFlCk+VziuG97Xhu5lJD6rqNDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h9fuv/jsyFVXpZxEXFm0TlW3vXsCqNJdPKRvhVzvT31yqqVnXN2fkYJYryxnvMZB3
	 Lyf7LALOY/m+B7wBf7Geu2C7oPRFt4q6sUeBU5c8YLlGnykoNre+WaitvqJvt2BzWD
	 OcwK2MLWxIz9XxI8S795kPagAJY8gJg+K0++Lb908JEIWpJTRhM/3S1TAVVKLSguzx
	 FmGL1og0wcieK6NT6XdixEGSg1C3wZ94IsFoJZ8YIrqOI9eOy09uiutVbkLSrr0riA
	 bpSBeFtkNNJ0RA/A8brn+HnxYiXFn3NtxxAoWnV0dxJvBQlNMZbT3IRbppdbxFS2Cx
	 IjCz/DbuipCOA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH 35/49] clocksource/drivers/timer-riscv: Move CPUHP_AP_RISCV_TIMER_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:42 +0200
Message-ID: <20261019130856.49711-36-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019130856.49711-1-frederic@kernel.org>
References: <20261019130856.49711-1-frederic@kernel.org>
MIME-Version: 1.0
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

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while stopping all CPUs in the system. This
doesn't mix-up well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The teardown callback here simply performs timer and IRQ disablement,
both of which can run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 374e7599baae..c2f25b6f72a4 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_REALTEK_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_RISCV_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_REALTEK_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_RISCV_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
