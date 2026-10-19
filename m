Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761C1CCF2DB
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 13:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Igu8o+wFZLI5G+LHBl2xAevRelix3Os1mXmxMiThjxU=; b=wo69Yh9AW+IHEC
	3D3MBsHZmiJ4BS5dT7nVF875yDnjf5l8XZSGoZKQ7va/vsQmz7lGSAMRZm/mHAX6LMKHI6h0w+yos
	FjYmXxstssYTBgmdZ145T0UuPDRa7ll+cfDrFJLonR1kEb+T6isH/hCMJwI6HkO6wk9OPCv0SV+ch
	90NsTubWuHAZWC55Mlu891SoHmpxUNH4rchU3ZwfVYODYOpldnZdi1gbw+J/FVmLYKpwbtyNRCG7H
	Mk2LzxckGWs+uqD9vbb4FbZlTEISCE+NK/qojWtX6C4l2zfR1DmFFlhr4eDIELEHVjWtTP9m1pDm9
	O7IplZfUK7IrbMjXmg2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn7P-00000007SuN-3qRb;
	Mon, 19 Oct 2026 13:09:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn7N-00000007StX-45XW
	for linux-riscv@lists.infradead.org;
	Mon, 19 Oct 2026 13:09:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C8586025A;
	Mon, 19 Oct 2026 13:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30841F000C4;
	Mon, 19 Oct 2026 13:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415373;
	bh=YgeuaqRtp5CK1SLmK81XKrsJHhQCxQdrEiseHucAYLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ezjbMz2uVDoG9WVlXEnf3OTSz5PFTTX/ucD/14duckHlDn5mtVv2Cxm5kQtDRDgue
	 cofZxcfSR/CHqq8JZnhxgPnPhjqLcERiEVmvIFaaP0Ae2Y8uVyXCkv3qoLOTm6q+qO
	 F1fvDCyjIrzo8Czkt1zjSy9k/V5HUI6MlLO6mEQYPqKxB0sbQpheRxzDC+zk1haqth
	 N0zNvQiXBy+4YIEcCG1byKAu91XSJzE8Seo0aivOmDMbtuwrk1wI4Qhg+ATGP/7/dB
	 m3z190i75KJ4iI3b+l1iwE+EFcb59NjH1eT5QvmE7IEbRbrKtja5brLARWSSouFjfJ
	 EddHMIHT79m8w==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH 10/49] irqchip/sifive-plic: Move CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:17 +0200
Message-ID: <20261019130856.49711-11-frederic@kernel.org>
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

The callback here simply disables a per-cpu IRQ, which internally locks
the irq desc. Therefore it can run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index f32404821731..661648ada894 100644
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
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
