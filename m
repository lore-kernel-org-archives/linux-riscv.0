Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD6D606A323
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 22:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G3zo31Dh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SusJhJ4Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Wd66V2QYnzaPEW2os5brtk3+qs93zEZOGl1bzYBVKS8=; b=G3zo31DhxEP71MTX15JevSdC6N
	xOUXBGUT2VarFqCAOGkWztiwG3ZgZQjVMqYoR0IhvAVPB9P/sBmbOIAgBSJrp9CDe8fOtcrBUv+6k
	uYjt8ZoU0nVoG3Cg1P6g6xfkYYV5d2X4P/n0DpiEXa345bwsT0vOQxrGTT+Ov2XKPn1ifT4J6OruZ
	/ZPrEKhzOcr7R9Zc3Dsd8B5NMM3S5xxIKN+Vx8BBU/HO1ZqLO7UGLXHNVVt5hjZLQmDZmRz2wLDyw
	ahhrZiNSR6aEgWNw0DKufrfLJ1eVXjA9ZGuRXlCqT5LR5Jv34egh13BMBJji/+9lPQRmLAjgA96oL
	Uy7oYgfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLOq-0000000BRyh-3bkP;
	Wed, 25 Nov 2026 22:23:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLOa-0000000BRvf-16Rv
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 22:23:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B3E4E62C65;
	Wed, 25 Nov 2026 22:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9781F000D0;
	Wed, 25 Nov 2026 22:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645399;
	bh=xlrHs1u0xgwmdUaOqayYWtHmLy/yRrVcwjuoyJTzS9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SusJhJ4QshLmipAmQqRnTo7JnjL/ywAqneEszrCWz9cPzMbhZVTxv4s3KkoPNw6Jr
	 T5GKnUprMkiegxIOmzfrhOlpy8mICVxCzn2pB5Mn0xm1DhjVb/T6mo8+7jim2WKhLR
	 Y7X3sKfnZVrh34NO0nlAnLBte1StQRco9Ep7RYnsiAOntlPjU46hBOnq1T7uKc1j0h
	 IxRloQHEaJgkzOhn8fNEbaP4gXBxgL24UXseOktkiz5HQFBuE0iROEnJdK/s4TggbK
	 ldEQADieg3qc+1zis6Ro0g6EYiAExyEUF5eahdmRr4wSbwHGv5Kl+AVJIgS+fVkkPx
	 07Vb7oEOGvrRw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Radu Rendec <radu@rendec.net>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-riscv@lists.infradead.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 12/47] irqchip/irq-riscv-imsic-early: Move CPUHP_AP_IRQ_RISCV_IMSIC_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:21:55 +0100
Message-ID: <20261125222230.22508-13-frederic@kernel.org>
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

The callback here disables the current CPU IPI, which nobody should
touch concurrently since it is seen offline by other CPUs.

The sync protects internal datas with &lpriv->lock and the IRQ matrix
offline is protected by &imsic->matrix_lock. Therfore it can run
concurrently with other CPUs.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index c86570b13fed..151e4d9673b9 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_ACLINT_SSWI_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_RISCV_IMSIC_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_ACLINT_SSWI_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_RISCV_IMSIC_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
