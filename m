Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CF8C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 18:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iv64qlDoF3LxenEWrYfR7nYV388iShi+RvX1LCoa2L8=; b=vnHIJBp5Z/yQ4G
	A9U5grvv/2ZMOhWotZRXS54RlDxXctx2dO4Qdyq7LIB3cp/gN06iLydcZgccX31svTGsscEOvEwP2
	Nb5zSLU3+mHxuhxgDtoF1Xmh4fm+vNbJRCWCaFjugwT4lMo6BETeQ4O6OHZK2/fjJurarYR+gW0yC
	/b3YlmMoju9FvvQ3nu+rukR5pRSN5AZqQz2UuFVIB8RQ3n1P+qdghIoBLupcF8n9XCBtjMIPA3Cvh
	5+6jgKbdj/nMpH7YZ9fK/yq5VVSY9n9BzisBGnQWg8DvxHsTLYMncqVDAB4qV9N1fGgCaY6xgQGwC
	yE2cGBPG4+KjdudcTFRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqIaK-00D7Ck-C1; Wed, 02 Nov 2022 18:35:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqIZH-00D6QB-Cv
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 18:34:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667414066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vPxNJZ59dAj9Aw/rnn/vqSwo8b8sDM1O6Xi76OwhNZs=;
	b=Fe71/qi6ynieum+6CED0InQm406/v4yXSAzYo77+vPxSWtmHhgXkkS1zsoSVjZmE5xMuLQ
	jDaQRqrZq+bu9wzNN13KxiPVqc/DdQP6o+aNltlP+srcOMw12wtmHGJmB/lXu3GE0D6/Wv
	PaK3mSES+/gU9o2HPY4J6haSkcMA1Lc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-292-Az7CxRktOn-PPYKgXYA_wg-1; Wed, 02 Nov 2022 14:34:25 -0400
X-MC-Unique: Az7CxRktOn-PPYKgXYA_wg-1
Received: by mail-qv1-f72.google.com with SMTP id q16-20020a0ce210000000b004ba8976d3aaso10355289qvl.5
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 11:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPxNJZ59dAj9Aw/rnn/vqSwo8b8sDM1O6Xi76OwhNZs=;
        b=oCFzChLpRs2VndQ/NMEgkNxvzJUD7m6g8+Njg+G3iMltgr9ItUzVyfp+rfnTXq0XkN
         eNXYdszbfpY0xLnC8JPGn6e+XU5251C0EAXQSDEMy6SHk5/q/SQAhO4cRCJuRuWWr1do
         jytwxRNXmuSB0I8Pi4BXRinYMD46mWj1iX5Wy3sYzN/P6htwkZheteMu4ReLCzOOggUw
         j37PiS6g1PwFh4IXt8GW1V4JP5d1x+w+YFxqY7cd4JJgVa72J5ujkLsenbyEOQaul7Qs
         eZTAWcMtAhj9M15TooDp1b2NzDojcTVI5YtFsXqkDlQmxlL0x6sioqUQvoHixhVPJub2
         u/nw==
X-Gm-Message-State: ACrzQf1B0W9iSS2bA55aYWiRCMJU79kUPGB5hGHc7CUwu7g5mn90wCQx
	imzK+kfDGhIe5vumGsJZXLqVH4BFVC64PeUYb6bAqDMxZ9SnB3Uutz5ryiF9YcC03Yy1TDnQcyJ
	0mt80RAUti45jkAv6q82ud72KJAvd
X-Received: by 2002:a37:92c6:0:b0:6fa:28b2:1e2a with SMTP id u189-20020a3792c6000000b006fa28b21e2amr13574209qkd.9.1667414064991;
        Wed, 02 Nov 2022 11:34:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4EXOUjNlIxUYR8PDvF9w7H8/QWuUsvimzUEYEqnOFqRnuqhuZtDCzI4Vu/740apEttSzlakQ==
X-Received: by 2002:a37:92c6:0:b0:6fa:28b2:1e2a with SMTP id u189-20020a3792c6000000b006fa28b21e2amr13574163qkd.9.1667414064758;
        Wed, 02 Nov 2022 11:34:24 -0700 (PDT)
Received: from vschneid.remote.csb ([149.71.65.94])
        by smtp.gmail.com with ESMTPSA id w187-20020a3794c4000000b006eed47a1a1esm8757820qkd.134.2022.11.02.11.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:34:23 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	x86@kernel.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicholas Piggin <npiggin@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: [RFC PATCH v2 5/8] irq_work: Trace self-IPIs sent via arch_irq_work_raise()
Date: Wed,  2 Nov 2022 18:33:33 +0000
Message-Id: <20221102183336.3120536-4-vschneid@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221102182949.3119584-1-vschneid@redhat.com>
References: <20221102182949.3119584-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_113427_550389_8A9E04F2 
X-CRM114-Status: GOOD (  16.15  )
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

IPIs sent to remove CPUs via irq_work_queue_on() are now covered by
trace_ipi_send_cpumask(), add another instance of the tracepoint to cover
self-IPIs.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/irq_work.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/kernel/irq_work.c b/kernel/irq_work.c
index 7afa40fe5cc43..aec38c294ce68 100644
--- a/kernel/irq_work.c
+++ b/kernel/irq_work.c
@@ -22,6 +22,8 @@
 #include <asm/processor.h>
 #include <linux/kasan.h>
 
+#include <trace/events/ipi.h>
+
 static DEFINE_PER_CPU(struct llist_head, raised_list);
 static DEFINE_PER_CPU(struct llist_head, lazy_list);
 static DEFINE_PER_CPU(struct task_struct *, irq_workd);
@@ -74,6 +76,16 @@ void __weak arch_irq_work_raise(void)
 	 */
 }
 
+static inline void irq_work_raise(struct irq_work *work)
+{
+	if (trace_ipi_send_cpumask_enabled() && arch_irq_work_has_interrupt())
+		trace_ipi_send_cpumask(cpumask_of(smp_processor_id()),
+				       _RET_IP_,
+				       work->func);
+
+	arch_irq_work_raise();
+}
+
 /* Enqueue on current CPU, work must already be claimed and preempt disabled */
 static void __irq_work_queue_local(struct irq_work *work)
 {
@@ -99,7 +111,7 @@ static void __irq_work_queue_local(struct irq_work *work)
 
 	/* If the work is "lazy", handle it from next tick if any */
 	if (!lazy_work || tick_nohz_tick_stopped())
-		arch_irq_work_raise();
+		irq_work_raise(work);
 }
 
 /* Enqueue the irq work @work on the current CPU */
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
