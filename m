Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FFBC54EE9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 10:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Us8UDNsjYD9tNImp9wonXEnDYYcpANUdY1qMzUwdbaU=; b=miQW0upO8OxuLN
	CMYKrcGj25x8NeD0PlduLIXwYqKYSaDO9S+b2egyudI0NBU4qmsmg1XPGTxqldK1Gw/Xc3z5sNXcv
	dTLhs7EbL7BFjkja55/qid5lrVor/8XkB3TQmHCm1/+z/7dzkyvT+r/CTg+9dE4Xpi3q95qvm/TIK
	ZxRNKbvmKiy0tLqa50r0Wj8drml4wVuAZkdsr2r4j0dLPaF36qLP+b29iSj9g1GzOp05IIHBDdfwC
	l9j1sOMAQ3pGsWFHAUo7CxFeBVZABbZFVXPIrYudTsTcjd3oyWWuiPvX9+2PLMomELS624e4slYQN
	wOaIAI4VvYFCJBjjy8+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ8kl-00CGW4-8w; Fri, 16 Sep 2022 10:39:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ8k2-00CG9l-FK
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 10:38:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B3238B825E8;
	Fri, 16 Sep 2022 10:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB30C433C1;
	Fri, 16 Sep 2022 10:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663324715;
	bh=uKhEvPsni5Ky+cHQE5EHan1X0SKecPDG4FXWXWTdBBE=;
	h=From:To:Cc:Subject:Date:From;
	b=gpiOzyBuh8KhM0CVNudfj9p1EEHI3cNSyca2dVEyTMbW98j4sO5qsXxVywqs0x7C9
	 FC2zGpKe1anuOY/3Tf6f1c4DLw3B/qrg+jeVSUVZZjYrpko1HIo77Up6IlM3VhyrNh
	 Y1+3m7/cM1mODHsUK0G3WJSSViFGv28XbVsIFvROnhGUEyc9z6V7Y4axLJ4vD77qXW
	 D7CVcbLNlWeVfq0AxZx4lAb1x17JbHoWTROSc2Z3jTE5C1vyV+fHr8HaU79bAcqndF
	 CB6mJmyEvKs+xLc+kfcw2xWlHqNciT6WYhWcDx8bHbqtZmn+m85B6mW6he17IK7nLK
	 Nv3FOx7DklCFQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	rostedt@goodmis.org,
	andy.chiu@sifive.com,
	greentime.hu@sifive.com,
	zong.li@sifive.com,
	jrtc27@jrtc27.com,
	mingo@redhat.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 0/3] riscv: ftrace: Fixup ftrace detour code
Date: Fri, 16 Sep 2022 06:38:14 -0400
Message-Id: <20220916103817.9490-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_033838_758084_0D63FE12 
X-CRM114-Status: UNSURE (   8.94  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The previous ftrace detour implementation fc76b8b8011 ("riscv: Using
PATCHABLE_FUNCTION_ENTRY instead of MCOUNT") contain three problems. The
most horrible bug is preemption panic which found by Andy [1]. I think we
could disable preemption for ftrace first, and Andy could continue the
ftrace preemption work.

@Andy, as Steven said, improving stop_machine mechinism also could prevent
preemption problem, but it would reduce the speed of ftrace_modify. How
do you think about the stop_machine solution, would you give out the
patch for this?

[1]: https://lpc.events/event/16/contributions/1171/

Andy Chiu (1):
  riscv: ftrace: Fixup panic by disabling preemption

Guo Ren (2):
  riscv: ftrace: Remove wasted nops for !RISCV_ISA_C
  riscv: ftrace: Reduce the detour code size to half

 arch/riscv/Kconfig              |  2 +-
 arch/riscv/Makefile             |  6 ++-
 arch/riscv/include/asm/ftrace.h | 46 ++++++++++++++++++-----
 arch/riscv/kernel/ftrace.c      | 65 ++++++++++-----------------------
 arch/riscv/kernel/mcount-dyn.S  | 43 +++++++++-------------
 5 files changed, 78 insertions(+), 84 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
