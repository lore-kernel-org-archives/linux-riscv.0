Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FF7CD1284
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 15:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sMDTlCiefbQ9G5eCe+sW9dbawbgnW6z+9Gl9BImqXJg=; b=cppR76SfT/nmKT
	eBHtXT/tGWQSZxJ8b2yV/+MlZ7khrGD/Zk4aR9Qy9zmCPzDnjq+g/bnqjiShSszU036pF80NNy4wX
	v6o5Dr+5/37Z2mALmRLEiWipgb09l3AoI/Yy/XYad0iMQahLSBFMCa6WKIPlilWjHa6x+TrgdWasg
	cDIBwX2ywpeFip+pb77I7YtI00CkK5G9cIgBiB4XjOLR55i7Eh5yaFxooNtW59zxpTZ7lOrpdrhF3
	HPDP4sLFMXZYs16gkgTsNCAcX/eu1nyOOE5d5BqTXlp6ehCxCeXMmrjGe8z0HwP2PQzxQ842q8Bu2
	GPqw7NKGfPNX1+Lq5qLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVVo-00000009uCO-15Wy;
	Wed, 27 Mar 2024 15:48:24 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVVl-00000009uAV-2lHT
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 15:48:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 94DAECE272B;
	Wed, 27 Mar 2024 15:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0039C433F1;
	Wed, 27 Mar 2024 15:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711554498;
	bh=go4I6kAm2xNWlWjSFNfYVEqDcGhAdyxTeUu+DcP2luQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Yg8dExgqMQWKS9zGTfLXFKZ44ip7t4QXO9iQH59tWPRZms7ITLpIJsRb1geCP/n4F
	 cR1xEdgmToPdqBB/rg//HuSUJt34947vliqgVJS5YvK7cpK1nhHwV5zk2nhli/p29F
	 fXytaasWJ5e+EHkfcLxtGfXO7ugCUYe8/qUyiU8oNefgH/fNYroPBHDtyiJJunJD/7
	 iM08xMFKfPfFKPVNBqzHTjHI2tOLjtiAQMTAbb3StbkapKBaGwKBMS3YQgmccGZ+KP
	 d/C6Z14x7IEF4b673oMwBn2vcGIBa6DjztuC4DOJ2vRBaMLM5UM0wv3OB64SZNn+yD
	 u9DVh1GR835iQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] clocksouce/timer-clint|riscv: some improvements
Date: Wed, 27 Mar 2024 23:34:59 +0800
Message-ID: <20240327153502.2133-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_084821_894609_51EB2B6C 
X-CRM114-Status: UNSURE (   6.24  )
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

This series is a simple improvement for timer-clint and timer-riscv:

Add set_state_shutdown for timer-clint, this hook is used when
switching clockevent from timer-clint to another timer.

Add set_state_oneshot_stopped for both timer-clint and timer-riscv,
this hook is to avoid spurious timer interrupts when KTIME_MAX is
usd. Check commit 8fff52fd5093 ("clockevents: Introduce
CLOCK_EVT_STATE_ONESHOT_STOPPED state") for more information.

Jisheng Zhang (3):
  clocksource/drivers/timer-riscv: Add set_state_oneshot_stopped
  clocksource/drivers/timer-clint: Add set_state_shutdown
  clocksource/drivers/timer-clint: Add set_state_oneshot_stopped

 drivers/clocksource/timer-clint.c | 19 +++++++++++++++----
 drivers/clocksource/timer-riscv.c | 11 ++++++-----
 2 files changed, 21 insertions(+), 9 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
