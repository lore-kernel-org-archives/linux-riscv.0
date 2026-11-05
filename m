Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69CC608363E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 16:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4gurDrou;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQMLrVGi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GK5M1RMSEaiUlcsoufzOBFDN0LMPHSq0SqTxsRUq/F0=; b=4gurDroubzz4hH6SQSYV2iMWUe
	/u8d6ykxaqnRpgkQ5jjv+W9JR5ZZ1pM9eDGjSmZHTTZ0DXmSQ5mbk83cWboGmuyBq7lAFixa95u1Y
	y8N0VmcMMlPIRkOYkvQQ3GwRSKHd1nhfu7XlcOJnSqtnXre2qppHDev3nncfLvKqGVKc3onpotMv6
	MCMOOs1PC84C1GJawbxsLNzTMpbfj1Ka44hkitv6vVWiPtOJlr6cWaVbPRbjXFX8j1oALHNwTTf0x
	nwvrlsIaKp8njrFAQTyPe1uwZfZwfCRnUDlcDxJF15Zh4hcXT/43OEfSytTZ9TtQTQOiL0VmtZNNb
	bVVJo0ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0OO-00000009dd6-2PZ9;
	Thu, 05 Nov 2026 16:32:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0OJ-00000009dYV-2U2G
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 16:32:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A9524071F;
	Thu,  5 Nov 2026 16:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B021F00A02;
	Thu,  5 Nov 2026 16:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896363;
	bh=/6b82kuaXepaTz9CSFQJQO5cBsE6n/mAmFqD9IAh1wU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AQMLrVGiVtQdT3qwLRkoB4rp7fh4KL//wmhNTP+/Tk+B2u3N1CQMf5Ov5mbjs5H4e
	 poSJt0QhIyiqwfwjaHU4+H26s4M1hLezmC3Z7zXa85i3rB70wovzTd1HWaAYJuApVK
	 PDL/GBsJyPX75XytLz80kp2FghIUPD41WAtHayL6CjDGo4IbBMopa5SdIQHzp3ojEv
	 WV3JSjGSOJzSFKQx0AAnfat4PFiPR37QJwECY6Zx2ciBmz34zs3m5JVFmvI55KA5d5
	 t5eVw8A57N5Dukm7jlpqh2BDP63yZ6NN+6psGP2k+ah8psl3w1b/3UsumnsldkCZVh
	 vi1Ih4zBSOuJg==
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
	linux-riscv@lists.infradead.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 35/47] clocksource/drivers/timer-riscv: Move CPUHP_AP_RISCV_TIMER_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:33 +0100
Message-ID: <20261105163045.38862-36-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105163045.38862-1-frederic@kernel.org>
References: <20261105163045.38862-1-frederic@kernel.org>
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
index 9b2e5862252e..04692ae09199 100644
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
