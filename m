Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3541E8B397
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 03:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWQifbYPiWSZ3Kuu52QAToFguxBCCKUuUaVgCRj/geE=; b=DZimNaAFeTA9t2
	MJhmpGfJY553pYM1MBM3Q/lu53gTQ79zXtd7SwjHcCwnRRC+/WOxx53vkUb9wcjrl5zBaFkTHdwRB
	DetwPrRhvZhbkvxn721CfDvVXJCcUaXB3b4NkujBxyCueWd2GUv6v3/wHppHkrzwZiaSIxNPaR+H0
	RucPbLgppyHnhvEkEhwF7D6orLYCbhKKsaXsFro997HLBtbC6rc5DB1qnZiB3WEsd0TJtXVExlxgC
	lppBwEx7sFqM20q7KS+6uhtI6kboH/d4Kh9zhgAvFU9i3HK6vGLWVeORKwYuEl6t3Z0oSB++P+Ndy
	ZtG8VhIrW7jN+TLluyzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnTSX-00000007oge-3bpR;
	Wed, 04 Feb 2026 03:21:41 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnTSV-00000007ofu-2Owj
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 03:21:40 +0000
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowAAnDOMeu4Jpv9KlBw--.63664S3;
	Wed, 04 Feb 2026 11:21:03 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Wed, 04 Feb 2026 11:20:33 +0800
Subject: [PATCH 1/2] riscv: smp: Remove outdated comment about disabling
 preemption
MIME-Version: 1.0
Message-Id: <20260204-riscv-smp-comment-update-2026-01-v1-1-8b77aa181530@iscas.ac.cn>
References: <20260204-riscv-smp-comment-update-2026-01-v1-0-8b77aa181530@iscas.ac.cn>
In-Reply-To: <20260204-riscv-smp-comment-update-2026-01-v1-0-8b77aa181530@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Ingo Molnar <mingo@kernel.org>, Valentin Schneider <vschneid@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID: rQCowAAnDOMeu4Jpv9KlBw--.63664S3
X-Coremail-Antispam: 1UD129KBjvdXoWrtFWxArykZFyxXr18Ar4xZwb_yoWDJFc_G3
	Wxtws3W3yrKan29F9rXw4SqrW5JwnIqFWjyrn7ArWUAFyUKw4DtF4vyF4rZrW5ArsYgFZ3
	A3W29r4kAw4qgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUblkFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
	0Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCF54CY
	xVCY1x0262kKe7AKxVWUtVW8ZwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pR_wIkUUU
	UU=
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_192139_980118_B2522EA1 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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

Commit f1a0a376ca0c ("sched/core: Initialize the idle task with
preemption disabled") removed a call to preempt_disable(), but not the
associated comment. Remove the outdated comment.

Fixes: f1a0a376ca0c ("sched/core: Initialize the idle task with preemption disabled")
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/kernel/smpboot.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index d85916a3660c..0e6fe20c69a2 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -259,10 +259,6 @@ asmlinkage __visible void smp_callin(void)
 #ifndef CONFIG_HOTPLUG_PARALLEL
 	complete(&cpu_running);
 #endif
-	/*
-	 * Disable preemption before enabling interrupts, so we don't try to
-	 * schedule a CPU that hasn't actually started yet.
-	 */
 	local_irq_enable();
 	cpu_startup_entry(CPUHP_AP_ONLINE_IDLE);
 }

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
