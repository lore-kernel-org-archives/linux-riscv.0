Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7A1606A326
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 22:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0vGLrcW7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gnbuh7Cd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JvW4QVS4liHHPGnoyxPfiTrekNjHGCfoR0ens5A6WZY=; b=0vGLrcW7uO0sX483k1wtuKfO5a
	jPO2VpYZ+dibiGmuXpSizkL1mRObn/Vy/FSiKDlvgqthPr3q4ybQBeHpgP2tCmK03nRZdW3DXvVfO
	Q7kAGoQ3ph0t/uqFxqgErb23gI0O7YyeFmHOGgnVdzskHPE3ZWoHKa6IxhbDpJpd80sx2/KaMXZ9c
	yJ8zllYIJb5GervHs5XSq2amXvUIaNw2gdbW836U7+qovd1AvvtjHRb8vg+87yjxlRl5yDS7EsP+o
	tpJP7t5/8kXZ3cnHX3QZhGALNYLVTRwngqqqUMkdsuhlGEeaw1EUdN/17NwC6p5oOKUMXgn8egLvs
	pBfD/vlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLOh-0000000BRwy-1tih;
	Wed, 25 Nov 2026 22:23:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLOT-0000000BRu0-0jVo
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 22:23:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F37862997;
	Wed, 25 Nov 2026 22:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460C41F000E0;
	Wed, 25 Nov 2026 22:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645392;
	bh=r+yku0q496XunaZnTUPYz/QmShp5m4bAN5X9cIEAz8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gnbuh7Cd2sA0thcjD6Rwzvav5NE6OZHviJxpMAXa20yD/5o53RAPRueiqdM2gDMy5
	 bo8P8fOtyqjsFNAyfr0RpMH69wkvt4/n2B9hUH6GvcEAczlXbs0OoO8jeUlAddtHkS
	 AWQw0JUY/A9ZW9kIo4bwHiczk5NNR/RoPOHWXlJaHQINwaGZgJhvWd3qqpmaOsIRQA
	 Pz/ZE3oF6z5SUUEDGZuaFW3WSLrGz7DTkluv81/ED/APUufOiB7K7niX8LouNM7COr
	 BUa5SDUIhZLGmkEA+6B4XFkIV/3ttbI6jkMyf15hEcAtxxxCy5Kof+YhtCM0zGKsYd
	 z7p5Gqzn/ScYQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-riscv@lists.infradead.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 10/47] irqchip/sifive-plic: Move CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:21:53 +0100
Message-ID: <20261125222230.22508-11-frederic@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125222230.22508-1-frederic@kernel.org>
References: <20261125222230.22508-1-frederic@kernel.org>
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
all the teardown callbacks while temporarily stopping/pausing all CPUs
in the system. This doesn't mix well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The callback here simply disables a per-cpu IRQ, which internally locks
the irq desc. Therefore it can run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 2200c6691ac1..c7794716bca6 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_AVECINTC_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_AVECINTC_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
