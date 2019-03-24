Return-Path: <SRS0=PVrh=R3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C725C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 20:33:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 351842133D
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 20:33:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sWxGI2oI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hi2UXSH8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 351842133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:From:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uyXL9cU16FbIwa8AX0dTd/XVeSqh9LsBqja4UAvqt98=; b=sWxGI2oIq2Q2h8
	FZMd89WSzHTVxarSMGo1RzCXkl0g9WkUPZMImdhhWVJ2KQrxy84Z1LnB9aIU1tQ+gC0V32n7Vfbf0
	Su6vdyNgKV9qpaEvoQzlIjVWKL58biGXX/lTV3kni05KJIpElnf98cYC3gUrzaRTbndsvFHm4GvTC
	TEovjfdojA/zdgRy3orla53lyyEqXyK7CZ2XTEmPg7zCDC/2qKj3la7MFEer6HhHMhAFsy2DZZG0Z
	gSTt5PAr4Mr0O6aZSnxL+pYvGzmVUVPZ1JaFWnuN7Sd22D2XVHmfGh6bJR+SVHYpMARHGfFiAatST
	bj7D1rQ5VSo+snWjit+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h89oS-0002uM-Bo; Sun, 24 Mar 2019 20:33:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h89oQ-0002ty-2m
 for linux-riscv@lists.infradead.org; Sun, 24 Mar 2019 20:33:47 +0000
Received: from localhost (unknown [88.128.80.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 148C320989;
 Sun, 24 Mar 2019 20:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1553459625;
 bh=BYACoyOb9OyYmFOQfkoynKM4m3iuh99beFwJ8sK4TUo=;
 h=Subject:To:Cc:From:Date:From;
 b=hi2UXSH8ytRVmf5snrkB/t1kVrEj/e7XxsJxnOpdHOG78N6GcJo/KHbAAvmLxNoNt
 PIGRgfoorWAJGFrVXGphiaBKiG8u4Yea+oZ0p7rTNpvYqGINTUXs+3WSG07ASFw4i5
 TSwWcvOjJyf56SiA651p4c61Cg7UU2O+BUgADjWk=
Subject: Patch "clocksource/drivers/riscv: Fix clocksource mask" has been
 added to the 5.0-stable tree
To: 20190322215411.19362-1-atish.patra@wdc.com, Anup.Patel@wdc.com,
 Damien.LeMoal@wdc.com, anup@brainfault.org, aou@eecs.berkeley.edu,
 atish.patra@wdc.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org,
 linux-riscv@lists.infradead.org, palmer@sifive.com, tglx@linutronix.de
From: <gregkh@linuxfoundation.org>
Date: Sun, 24 Mar 2019 21:15:39 +0100
Message-ID: <1553458539102@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_133346_142910_FE4DDF3B 
X-CRM114-Status: GOOD (  10.71  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


This is a note to let you know that I've just added the patch titled

    clocksource/drivers/riscv: Fix clocksource mask

to the 5.0-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     clocksource-drivers-riscv-fix-clocksource-mask.patch
and it can be found in the queue-5.0 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 32d0be018f6f5ee2d5d19c4795304613560814cf Mon Sep 17 00:00:00 2001
From: Atish Patra <atish.patra@wdc.com>
Date: Fri, 22 Mar 2019 14:54:11 -0700
Subject: clocksource/drivers/riscv: Fix clocksource mask

From: Atish Patra <atish.patra@wdc.com>

commit 32d0be018f6f5ee2d5d19c4795304613560814cf upstream.

For all riscv architectures (RV32, RV64 and RV128), the clocksource
is a 64 bit incrementing counter.

Fix the clock source mask accordingly.

Tested on both 64bit and 32 bit virt machine in QEMU.

Fixes: 62b019436814 ("clocksource: new RISC-V SBI timer driver")
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Anup Patel <anup@brainfault.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Anup Patel <Anup.Patel@wdc.com>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Cc: stable@vger.kernel.org
Link: https://lkml.kernel.org/r/20190322215411.19362-1-atish.patra@wdc.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/clocksource/timer-riscv.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -58,7 +58,7 @@ static u64 riscv_sched_clock(void)
 static DEFINE_PER_CPU(struct clocksource, riscv_clocksource) = {
 	.name		= "riscv_clocksource",
 	.rating		= 300,
-	.mask		= CLOCKSOURCE_MASK(BITS_PER_LONG),
+	.mask		= CLOCKSOURCE_MASK(64),
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	.read		= riscv_clocksource_rdtime,
 };
@@ -103,8 +103,7 @@ static int __init riscv_timer_init_dt(st
 	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
 	clocksource_register_hz(cs, riscv_timebase);
 
-	sched_clock_register(riscv_sched_clock,
-			BITS_PER_LONG, riscv_timebase);
+	sched_clock_register(riscv_sched_clock, 64, riscv_timebase);
 
 	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
 			 "clockevents/riscv/timer:starting",


Patches currently in stable-queue which might be from atish.patra@wdc.com are

queue-5.0/clocksource-drivers-riscv-fix-clocksource-mask.patch

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
