Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444E9C67861
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2024 11:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uf0mZ0qYdAR6eHk3JXpi3vSb5mkClM3h3NIvAXoN+Sg=; b=h02MEsnbrsKodr
	UoH27SbVqqcWLkbkPSkmcw7BsmPjrralCljUJhI5/0R+zMZS7I6ipOFk9aujhk89J/hYn7FYENTAC
	pNJ+cQMiHlPDVNOYCuUgB549jDdOPFNFR8keuDcDFud/ryoT7Cqq233jtxtve/wp77zG9KxAykq5X
	n1X9udpq4kV0Ze9JgFZgBD6eLqXd7tBYAMizno4SzKHIR8xkiF/swVRqnYmk7R6Eg8/x42rwuMgvv
	X5abkqCirIO4Hlo8/adxi2bEEibtVZHqQugfEHLVMrtU2xlq1gS4PIkPoKMmncRKOZTfn1CdlXVXj
	NZkKQ8SoqPIDGtDgXVpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rt4Gc-0000000ACxw-0Sj0;
	Sat, 06 Apr 2024 11:31:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rt4GY-0000000ACvz-319T
	for linux-riscv@lists.infradead.org;
	Sat, 06 Apr 2024 11:31:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 237C0CE19B3;
	Sat,  6 Apr 2024 11:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5397C433F1;
	Sat,  6 Apr 2024 11:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712403078;
	bh=wDFzllJt1FJE4FDnlfzRpGVgIYeyXYPkTcLYBaCpQUs=;
	h=From:To:Cc:Subject:Date:From;
	b=lpfwm09N/5GYWxiWujDnkZ6d5Y73y17ztqEJ5hXW5+qBrE3LU62E8KzTsu0zrY1/h
	 YjmZAIKyezHMC1RxE7nvnmneX2NPHWQNh9PvlwR2+Jm64I/mMBZ8q/TNSiDXi8MdKG
	 /0nrrcKujf6n6LDftB9eB4i8nBVe87hI5z/qFb5Ajf7HxEHgaJgILj/DP86Bx5B3aH
	 1DbEkGAszFspl4aCiQ1RgP1P/4dyHB8iH/zsh6YtZ7TCxC67lXQDUxofGfpgIWEDEE
	 t4oMaq7zMwHnA2nNlVMPmCnE1ktm7IaUvmxim+Ko88FyqVj0pXIXaPDLsOQpu0ko2D
	 qwWUeErgcvfow==
From: Jisheng Zhang <jszhang@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] clocksouce/timer-clint|riscv: some improvements
Date: Sat,  6 Apr 2024 19:17:54 +0800
Message-ID: <20240406111757.1597-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_043123_297646_833F35C7 
X-CRM114-Status: UNSURE (   6.61  )
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

Since v1:
  - use U64_MAX instead of ULONG_MAX in clint_clock_shutdown, this is
    to  "produce a 64-bit value on riscv32" as pointed out by Samuel

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
