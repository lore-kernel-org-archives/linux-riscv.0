Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85193606A32E
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 14:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TGBfRE1d;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RyiJEHB7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=g0VMM0yMuDjxJcEFzOE9hYJWBVujqs1xuC9L+cnfD+4=; b=TGBfRE1d/5dF4OmYS/tPy1kiwV
	df4lTOIjP6lv9hzN42kK7r0HjTRQQQHchh2hDzKRYKpHrqxaTZGPLnlBIeMpG/8EHjropo5wjoLVS
	x4MPSFvlw4JABV0/Rt76NIgXo1osG9FIbm3gcnK/RYHiJP4usIEt/eAjL0CijzLYjjdnxRop5Rln2
	g0Dv5A1OjUBXNEYH0fhi+mgHfrH9TxTp76dg9cKd5neuNet6fGWvW6q3QSgAis/SgD74Iw2DL97x1
	YigaQ51TPOmc36A2NcmxuWXMWcWvunNYxPJ3w5r0egO3aDU7IPXGm4qDG7ZTLcJI8XHXqWxeOge9k
	Y/kqFI9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPh7M-0000000Enb6-2Cfa;
	Sat, 07 Nov 2026 14:10:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPh7M-0000000Enax-0Uqj
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 14:10:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6703540329;
	Sat,  7 Nov 2026 14:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48881F008A1;
	Sat,  7 Nov 2026 14:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794060603;
	bh=5Ry17mQiFCxfToY1zGA6QNTErIMgHFsdYh7nrM2aQsw=;
	h=From:To:Cc:Subject:Date;
	b=RyiJEHB7lS0LiNtkVjtDoPXFxdwk6maa2hAlrDqeoL5j8lCY9sPJVX1AEUaRnGTr4
	 Sz4jFreYzYNLAvcL7XNynl+JUWMXHS6rxFpWbaEhv90lqGJCqe1k0yt00JOXsh82gm
	 UkL7epm4Jbd2FnzZulDgIezcaemh12jukhfjloD83xw+TgL3FGJ6gMSc1M8cu2I1rf
	 l7GndeIStOtzmzSTeHlnW/EwHHq7l2ThTsc2nM92Kkak7GXoE6dFMqNNNgo1rUE642
	 LTvVnbTWRuYgug5VA/WOs4+tIEesNuf0MM2pbRxtRp6/Z2jsWST2IdFWNb9meAD/XU
	 sTOUAUIwfu86A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH RESEND] clocksource/timer-riscv: use riscv_has_extension_likely
Date: Sat,  7 Nov 2026 21:49:52 +0800
Message-ID: <20261107134952.17873-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
