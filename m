Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5D4CDB479
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 13:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TIqI0VU3MnmM0qwYj4FpND743Mv7dSgi+9XYTuxwnMA=; b=QwKvajyoymxJP3
	I9dayKC9L6rFvwiO1hP/PQNtiLStAjhLZZLDnYrJv3vPGd5/tqUy+4OjBjWMF1GWiKFmLH39ThdC3
	GWoSRJkc2mxUbhgJZt8u1IvQAP3IN1hVNzeykiExZnj6mIzE5fCLEe8LVOkcyiiKZHssbzzVI+PgK
	5otqOfPUI5rcXKzzF7xsfC3vN7w+To33T2fW51mNqZvPG74oUnj0RXWc2A000+pVy4hbCOnBU43j5
	C06/4eDEc/PnljA10qh3tVCn4Bg7TF5dLgczWqRloKo3Ycb74TsrzCB3kWKEgpBJxhS3S5TxxvAMQ
	1rJI3CjIJnmULG5jY7dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wckR9-00000009G4r-47Vd;
	Thu, 25 Jun 2026 13:48:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wckR7-00000009G3t-0itk
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 13:48:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782395286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gC5zr5yw5wsDg+aceJ8pufnQOHytYxuE6r2DcXf4+O0=;
	b=KIUdcohJfBEXuWlnB7gkrH88r7jaCO1Sp57ccGqWFhZpDZIcLfEhW3hTwL1NXH22mo3LNw
	2zXIbilxtSN5R3a4lkxl+5FT/xJuoqtSh8Vzi6Uoto8DpQt0rfH4G3IbenWj97JTEyMy/4
	zWLSmpItIzCGfwxZYzkzmtJB8ZVADiE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-637-E0USlrsLO-6eRMgtHYIA6w-1; Thu,
 25 Jun 2026 09:48:03 -0400
X-MC-Unique: E0USlrsLO-6eRMgtHYIA6w-1
X-Mimecast-MFC-AGG-ID: E0USlrsLO-6eRMgtHYIA6w_1782395281
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A60C719775A5;
	Thu, 25 Jun 2026 13:48:00 +0000 (UTC)
Received: from jtaubepe-thinkpadx1carbongen12.ibmlowe.csb (unknown [10.22.81.64])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 36C743652A;
	Thu, 25 Jun 2026 13:47:57 +0000 (UTC)
From: Jesse Taube <jtaubepe@redhat.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v8 2/2] clocksource/drivers/timer-clint: Add T-Head C9xx clint
Date: Thu, 25 Jun 2026 09:47:52 -0400
Message-ID: <20260625134752.3107959-2-jtaubepe@redhat.com>
In-Reply-To: <20260625134752.3107959-1-jtaubepe@redhat.com>
References: <20260625134752.3107959-1-jtaubepe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: TIdilQ_bsFPDMorsuY3GFjxZm5ssLfDXh_sJJVY26hk_1782395281
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_064809_285052_03ADA9B2 
X-CRM114-Status: GOOD (  16.75  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jtaubepe@redhat.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <Mr.Bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jisheng Zhang <jszhang@kernel.org>

To use the T-HEAD C9xx clint in RISCV-M NOMMU env, we need to take
care two points:

1.The mtimecmp in T-Head C9xx clint only supports 32bit read/write,
implement such support.

2. As pointed out by commit ca7810aecdba ("lib: utils/timer: mtimer:
add a quirk for lacking mtime register") of opensbi:

"T-Head developers surely have a different understanding of time CSR and
CLINT's mtime register with SiFive ones, that they did not implement
the mtime register at all -- as shown in openC906 source code, their
time CSR value is just exposed at the top of their processor IP block
and expects an external continuous counter, which makes it not
overrideable, and thus mtime register is not implemented, even not for
reading. However, if CLINTEE is not enabled in T-Head's MXSTATUS
extended CSR, these systems still rely on the mtimecmp registers to
generate timer interrupts. This makes it necessary to implement T-Head
C9xx CLINT support in OpenSBI MTIMER driver, which skips implementing
reading mtime register and falls back to default code that reads time
CSR."

So, we need to fall back to read time CSR instead of mtime register
using RISCV_ISA_EXT_ZICNTR.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Jesse Taube <jtaubepe@redhat.com>
---
Treat this as a completely new patch, as it is mostly rewritten.
Original:
https://lore.kernel.org/all/20240410142347.964-3-jszhang@kernel.org/
V6 -> V7:
 - New commit
 - Split csr and c900 parts into different commits
 - c900_clint_clock_next_event use csr_get_cycles64
    over accedental use of clint_get_cycles64
---
 drivers/clocksource/timer-clint.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 18f7bf7d26c6..62fe28df73fb 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -39,6 +39,7 @@ static u64 __iomem *clint_timer_cmp;
 static u64 __iomem *clint_timer_val;
 static unsigned long clint_timer_freq;
 static unsigned int clint_timer_irq;
+static bool is_c900_clint;
 
 #ifdef CONFIG_RISCV_M_MODE
 u64 __iomem *clint_time_val;
@@ -154,6 +155,19 @@ static int clint_clock_next_event(unsigned long delta,
 	return 0;
 }
 
+static int c900_clint_clock_next_event(unsigned long delta,
+				       struct clock_event_device *ce)
+{
+	void __iomem *r = clint_timer_cmp +
+			  cpuid_to_hartid_map(smp_processor_id());
+	u64 val = csr_get_cycles64() + delta;
+
+	csr_set(CSR_IE, IE_TIE);
+	writel_relaxed(val, r);
+	writel_relaxed(val >> 32, r + 4);
+	return 0;
+}
+
 static DEFINE_PER_CPU(struct clock_event_device, clint_clock_event) = {
 	.name		= "clint_clockevent",
 	.features	= CLOCK_EVT_FEAT_ONESHOT,
@@ -168,6 +182,9 @@ static int clint_timer_starting_cpu(unsigned int cpu)
 	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZICNTR))
 		ce->set_next_event = clint_clock_next_event;
 
+	if (is_c900_clint)
+		ce->set_next_event = c900_clint_clock_next_event;
+
 	ce->cpumask = cpumask_of(cpu);
 	clockevents_config_and_register(ce, clint_timer_freq, 100, ULONG_MAX);
 
@@ -319,8 +336,16 @@ static int __init clint_timer_init(struct device_node *np)
 
 static int __init clint_timer_init_dt(struct device_node *np)
 {
+	is_c900_clint = false;
+	return clint_timer_init(np);
+}
+
+static int __init c900_clint_timer_init_dt(struct device_node *np)
+{
+	is_c900_clint = true;
 	return clint_timer_init(np);
 }
 
 TIMER_OF_DECLARE(clint_timer, "riscv,clint0", clint_timer_init_dt);
 TIMER_OF_DECLARE(clint_timer1, "sifive,clint0", clint_timer_init_dt);
+TIMER_OF_DECLARE(clint_timer2, "thead,c900-clint", c900_clint_timer_init_dt);
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
