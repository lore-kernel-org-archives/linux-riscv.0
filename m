Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3ABC624D0
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 04:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g0VMM0yMuDjxJcEFzOE9hYJWBVujqs1xuC9L+cnfD+4=; b=nLV4kBPoy5Ib2V
	kEtgMxNllTM6UahifqSpnrlX0/jWbhoL5Lwb+aZJzihBne8PwfmJBxFDOszddobsULpej+jTlxQ7u
	clgRynDfot0+hTYvaqiy2i5V6aQqabOUchi/kXKmHy3zNbmh36kfTKm03JBkHSCH4XQdFVR9Y8j0y
	2PwLTz0I+Bl95otPrhqeKWczlZpZoNJ1fJIWRCS5sZNpB4f/B7lT6Dv5pjmLQv7QEsajCQI86nOW3
	/eC6lv3Qqw64I3I2Z4s1Dlo4RZBCiOnYYZNSrWqWCyuXIg1yXVBEyJC6/9fvzc+VMalGs0XyHTM+l
	Pc4ZXUbqhR+vpGrUMXyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1cWe-0000000DlKA-1gpw;
	Wed, 02 Sep 2026 04:24:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1cWc-0000000DlK2-1u22
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 04:24:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7307D402E2;
	Wed,  2 Sep 2026 04:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C653B1F000E9;
	Wed,  2 Sep 2026 04:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788323077;
	bh=5Ry17mQiFCxfToY1zGA6QNTErIMgHFsdYh7nrM2aQsw=;
	h=From:To:Cc:Subject:Date;
	b=odoGSNp1MbqDpEuyeK62ClueJJ0rMyOhPlRTh+dS+S2rvVKPqqwaS8FtxlE85CY4G
	 W9QWeoXn94wXug7Ag/OwK2sEVmtxD5PrdGMCBNa+HcU+wP7yG75zIjs0fCpSqxfnI6
	 Nft3XV57xdoYMCozRMq1MOmw2CU1V9KfDGDmJh/sK4ofUIQoouw9khrv6eAKfMntrE
	 V52poEDnj5f5M3qzE8kQUHyNEIsykRBbJbsk0b6FJfOiNkVWsh9CScht12rFJan6JO
	 fS1MyEtwxymSNMHr/1/A8fFkrftEsTDsFG7ngAoZ4+zrmh2IuXxYBrwMGrwnm/34C6
	 g1rGjDr0HTwxQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] clocksource/timer-riscv: use riscv_has_extension_likely
Date: Wed,  2 Sep 2026 12:04:53 +0800
Message-ID: <20260902040453.6258-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
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

Instead of static branch, use riscv_has_extension_likely() to check
whether SSTC is supported or not. For one thing, this is straight
forward, no need to add and enable/disable a static branch during
probe; For another, riscv_has_extension_likely() is based on
alternative mechanism, it avoid some downsides of static branch, for
example static branch's metadata in the __jump_table section, which is
not discarded after ISA extensions are finalized, wastes some space.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/clocksource/timer-riscv.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index b310e6721fac..151f4f0cfd6c 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -29,12 +29,11 @@
 #include <asm/sbi.h>
 #include <asm/timex.h>
 
-static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
 static bool riscv_timer_cannot_wake_cpu;
 
 static void riscv_clock_event_stop(void)
 {
-	if (static_branch_likely(&riscv_sstc_available)) {
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_SSTC)) {
 		csr_write(CSR_STIMECMP, ULONG_MAX);
 		if (IS_ENABLED(CONFIG_32BIT))
 			csr_write(CSR_STIMECMPH, ULONG_MAX);
@@ -48,7 +47,7 @@ static int riscv_clock_next_event(unsigned long delta,
 {
 	u64 next_tval = get_cycles64() + delta;
 
-	if (static_branch_likely(&riscv_sstc_available)) {
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_SSTC)) {
 #if defined(CONFIG_32BIT)
 		csr_write(CSR_STIMECMP, ULONG_MAX);
 		csr_write(CSR_STIMECMPH, next_tval >> 32);
@@ -112,7 +111,7 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
 	ce->irq = riscv_clock_event_irq;
 	if (riscv_timer_cannot_wake_cpu)
 		ce->features |= CLOCK_EVT_FEAT_C3STOP;
-	if (static_branch_likely(&riscv_sstc_available))
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_SSTC))
 		ce->rating = 450;
 	clockevents_config_and_register(ce, riscv_timebase, 100, ULONG_MAX);
 
@@ -186,10 +185,8 @@ static int __init riscv_timer_init_common(void)
 		return error;
 	}
 
-	if (riscv_isa_extension_available(NULL, SSTC)) {
+	if (riscv_isa_extension_available(NULL, SSTC))
 		pr_info("Timer interrupt in S-mode is available via sstc extension\n");
-		static_branch_enable(&riscv_sstc_available);
-	}
 
 	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
 			 "clockevents/riscv/timer:starting",
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
