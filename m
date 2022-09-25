Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7575C6FA82
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Sep 2022 18:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uQi5RRdxAxXMp+0mTFk+9zLDZJXq+pHYkQxO/2Q8vjU=; b=454HGmpaHlk1B1
	EMvayLIE+Ud5eLVuJasRFBgAt+0jbsWT3DxEinUkXl/16HaSAyvFR8jo4CTAYIJoXO7G2MaQ+o3gA
	4VKxq4jTAjB5MWwOO8UbTh9o1nSscQOTdxpO88T6GE4sH3G66sBhJGRRyZgQURXzLy154f2+czCqi
	UexiGjlD9lL8mW2uihzHCvV8aclR1G/vzU5IyA2bEEWu0a2W5omzUJcv1M1WdAfHFpDPJXy/J8tn9
	O7PpHVGv4i32xg9GpRLYQWgsqZTah9BPEwYeRKwQ9iMoeoLTd8yacSIdjWlgMdNaUqz6kDW20zdZ/
	ebW52/GrJ0seKycszcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocVyS-00FXiS-I6; Sun, 25 Sep 2022 18:03:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocVyQ-00FXgw-CI
	for linux-riscv@lists.infradead.org; Sun, 25 Sep 2022 18:03:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9984D60E65;
	Sun, 25 Sep 2022 18:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8B5C433D6;
	Sun, 25 Sep 2022 18:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664129004;
	bh=9FET3PaCzmyIcog+YS95QW0L9d7rytIwKw9jtfpwb4U=;
	h=From:To:Cc:Subject:Date:From;
	b=CEU7VzfkgrOaJ8jntLWEZhx3p7CfpfWBnyichsUQeZ+6Iyx44/MGdUnawm3X/oorS
	 HQIOuF2DqdwZl/keRDcd8uJXm+lc9qw26HhD6HJEWmRRvr76v1mjYkqrl4RKeBUNsT
	 vyE+pxJmPKazxajf8teshPpsT/N0QcHTrPbBIshdEGb+wTLYiTGEvIgTgXlL3tSeQ/
	 sLvRq7m1GvbFIGw18b7cKoaBJXnGTzOtges/EucnEbwWVpOzDnFonhM15A86u3+DOO
	 YxwQueNESlDvbKskYuEcDUGjleWf5TmqvojTF73KozxjxpWenhYZR27o5GL4X7UQ7Y
	 pOM1QlSEBe8bw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 0/4] riscv: entry: further clean up and VMAP_STACK fix
Date: Mon, 26 Sep 2022 01:53:52 +0800
Message-Id: <20220925175356.681-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_110326_479783_9522CD27 
X-CRM114-Status: GOOD (  11.83  )
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

I planed to do similar generic entry transaction as Guo Ren did[1], and
I have some commits in local. Since Guo has sent out the series, so I
dropped my version and just provide those in my local repo but missing
in Guo's series. However, this doesn't mean this series depends on
Guo's series, in fact except the first one, the remaining three patches
are independent on generic entry.

NOTE: patch4 can also clean up arch/riscv/kernel/mcount-dyn.S as well
but there's a trivial difference in the context saving, I dunno whether
is it better to clean up mcount-dyn.S too, any suggestions are welcome.

[1]https://lore.kernel.org/linux-riscv/20220918155246.1203293-1-guoren@kernel.org/T/#t

Jisheng Zhang (4):
  riscv: remove extra level wrappers of trace_hardirqs_{on,off}
  riscv: consolidate ret_from_kernel_thread into ret_from_fork
  riscv: fix race when vmap stack overflow and remove shadow_stack
  riscv: entry: consolidate general regs saving into save_gp

 arch/riscv/include/asm/asm-prototypes.h |   1 -
 arch/riscv/include/asm/thread_info.h    |   4 +-
 arch/riscv/kernel/Makefile              |   2 -
 arch/riscv/kernel/asm-offsets.c         |   1 +
 arch/riscv/kernel/entry.S               | 150 +++++++-----------------
 arch/riscv/kernel/process.c             |   5 +-
 arch/riscv/kernel/trace_irq.c           |  27 -----
 arch/riscv/kernel/trace_irq.h           |  11 --
 arch/riscv/kernel/traps.c               |  15 +--
 9 files changed, 47 insertions(+), 169 deletions(-)
 delete mode 100644 arch/riscv/kernel/trace_irq.c
 delete mode 100644 arch/riscv/kernel/trace_irq.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
