Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36961C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 14:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MjK0A24d4wERGy3q8zmVjcYru3NaSvmTsP2I5Eexd1E=; b=X8M4UN+yJvJo4q
	q53AlF++U/EPb4pq1mfeEPT7/Dk7N3oaz+0AmU6H1hXXqh8c6tPSvJ9zSaFLRE0epRTTVWBlrsl0s
	5Q5ub0xI72hpwfDpFTOrO5b0ZTFYbQZBzLqbRCCfjxLXLP8DItxA5cbsKT69Kh0Mho+g8mcZrvtq9
	uym6fnckWhlardMw88qQX8UNLgmDbd2XzMYdBUbnPRNayxITMYZSW4yrKa1Mt/v+LtVax17MMB7vx
	JoKoQo2D+19YPeMsqjsF9LBbkS1V5ZMTNIYmr2xM/J1k7S57dQFPBUvJRvG2CsIvTYT1lqqREcDdV
	C7bW01ZnaYnpGitPIwhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxq1v-005SvW-1o;
	Tue, 31 Oct 2023 14:47:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxq1s-005Sud-2u
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 14:47:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A3CB1B810DF;
	Tue, 31 Oct 2023 14:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D48C433C7;
	Tue, 31 Oct 2023 14:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698763657;
	bh=mW5ZDD22j9H+AVtH5pCspzyXysA9+yvjc8YTX1Xv92w=;
	h=From:To:Cc:Subject:Date:From;
	b=PeuhqY7y0w9vnRK2vD8hJprbyli44Hf3n3eBqV9kk5f5xyEGuf0RuQLPh8ZsYfPgY
	 ooMfnXHXaPjTcm2MjMrsGnTHmYvzpo9mAh8Y3ggZA6p1utPVIUGtq6aPzpjZho33sn
	 s45EE93VOZQIoUM76w1CgOgmyyGNQYrzDtwQJSaobuX7OnBznru8oNGwUNLyeuUl1I
	 0G52vKOvWBcpN54MidSzWbHMczE58GV6GV7k1NN+O4ebOqM2xc9Ni2IIOlsE6rtNLj
	 phpqB+nnf7F0EqKxryRlIG6Nd8Q78HLNM1jsyH5cYRd3TkLqXK5lrzWsxmEW+IV4gH
	 psAEgq34XlWeQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	tobias.schaffner@siemens.com,
	Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RT v2 0/3] riscv: add PREEMPT_RT support
Date: Tue, 31 Oct 2023 22:35:19 +0800
Message-Id: <20231031143521.441-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_074741_099439_E45C67FD 
X-CRM114-Status: UNSURE (   6.82  )
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

This series is to add PREEMPT_RT support to riscv. Compared with last
year's try[1], there are two major changes:

1. riscv has been converted to Generic Entry. And RT maintainers has
introduced PREEMPT_AUTO, so its support for riscv as well.

2. three preparation patches(patch1/2/3 in [1]) has been merged in
mainline.

Link: https://lore.kernel.org/linux-riscv/20220831175920.2806-1-jszhang@kernel.org/ [1]

Hi @Conor,

IIRC, you reported warnings with LOCKDEP(and DEBUG_ATOMIC_SLEEP?) with
previous version RT patch, but I tried on c906, c910 platforms and
can't reproduce the warnings. And Schaffner also tried them and
didn't reproduce warnings either. So could you please help try
v6.6-RT + this series again?

Thanks

Since v1:
 - rebase on v6.6-rt
 - support the new PREEMPT_AUTO instead of Lazy preempt

Jisheng Zhang (2):
  riscv: add PREEMPT_AUTO support
  riscv: allow to enable RT

 arch/riscv/Kconfig                   | 2 ++
 arch/riscv/include/asm/thread_info.h | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
