Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D5EC10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 11:06:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC4EA21904
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 11:06:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QumIzmT2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC4EA21904
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Subject:To:From
	:Date:Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=MBK/u3uzT5fxRLqUJIbZtAySnW3tOi/n2P6zDNRghK8=; b=QumIzmT2+1uOBx
	kMVsyX9/eJMWMsEVViTQc/zICioduyzOmc3d1PBk99C6qz0SdDGvHzE+OLB8MsQPeEoO4QsBrIAjn
	5JYjEfZ6NY7U4Hq2Ff8Ua04GbNHYHLSuOPnOCqvk4l6rtHg/AEOQKkcKTf+QcQAbrpOOw87NeTwRI
	+w7VN6IsxEUsPb+V3Li2qyKgNWP1W/5j/GCw6FabfmVwabeFmHijIqNjexzzuf2ZQ7ktwaAMmMoDN
	wDoP/WD8wDpH4w4z3nJn7Z4Bj5ezEEuKd1AHaL1CrvdIGWCmmTyZny8TwyWnyuy/v8QSkPIzF8foo
	V70JmEOG+szBIsWTaDzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEB3N-000353-N0; Wed, 10 Apr 2019 11:06:05 +0000
Received: from galois.linutronix.de ([2a01:7a0:2:106d:700::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEB35-0002fZ-Td
 for linux-riscv@lists.infradead.org; Wed, 10 Apr 2019 11:05:50 +0000
Received: from localhost ([127.0.0.1] helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtp (Exim 4.80)
 (envelope-from <tglx@linutronix.de>)
 id 1hEB2r-00052G-OH; Wed, 10 Apr 2019 13:05:33 +0200
Message-Id: <20190410103644.131061192@linutronix.de>
User-Agent: quilt/0.65
Date: Wed, 10 Apr 2019 12:28:00 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [RFC patch 06/41] riscv/stacktrace: Remove the pointless ULONG_MAX
 marker
References: <20190410102754.387743324@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_040548_269510_8B764A61 
X-CRM114-Status: UNSURE (   6.94  )
X-CRM114-Notice: Please train this message.
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
Cc: Palmer Dabbelt <palmer@sifive.com>, x86@kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Potapenko <glider@google.com>, Andy Lutomirski <luto@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Terminating the last trace entry with ULONG_MAX is a completely pointless
exercise and none of the consumers can rely on it because it's
inconsistently implemented across architectures. In fact quite some of the
callers remove the entry and adjust stack_trace.nr_entries afterwards.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
---
 arch/riscv/kernel/stacktrace.c |    2 --
 1 file changed, 2 deletions(-)

--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -169,8 +169,6 @@ static bool save_trace(unsigned long pc,
 void save_stack_trace_tsk(struct task_struct *tsk, struct stack_trace *trace)
 {
 	walk_stackframe(tsk, NULL, save_trace, trace);
-	if (trace->nr_entries < trace->max_entries)
-		trace->entries[trace->nr_entries++] = ULONG_MAX;
 }
 EXPORT_SYMBOL_GPL(save_stack_trace_tsk);
 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
