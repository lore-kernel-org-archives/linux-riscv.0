Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B077DCD1284
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2024 11:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Z1uDTRhnR5edoJw9dGdykEDKRtyiBcap7IJL4WAqNo=; b=btDeGm/3HWzxur
	Jv5w+Kg0tbkALqUwpX3mPVHVQQY/IKV7zmfpj8Rlx5U2GvGzoUsi5LMOjh0hD7BxTyPugzdMKU3Z7
	pI8IxxOjZTYCtVg5j00eKK5T5gDs373UtCYQkIGWhus4NtierapFFS7b52ZakRgupF57fNSgdlHCn
	ZrhAKrmbtQC5qhr2GSxOX0L5aacK5NPKMsmY872T9KGk4iq+sAIX5RONtvOjf65uH1vW2acMZbsKC
	dhni9bfiyWXJ91MF2hB3TAd9a4uUM2su9pzDttuNxoVolCcYCx8gMJvhTKSw4au78eqC7OpiI0mm1
	EXCz83LCIzgQNmHqDxIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rt4Ge-0000000ACzD-3Fxv;
	Sat, 06 Apr 2024 11:31:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rt4GZ-0000000ACw9-2f5I
	for linux-riscv@lists.infradead.org;
	Sat, 06 Apr 2024 11:31:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AAA3360B2B;
	Sat,  6 Apr 2024 11:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D956BC43141;
	Sat,  6 Apr 2024 11:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712403082;
	bh=66gmc8NYeVWAyoDrDcv4Y+x0uF90S93OHXhD2YCJ+6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ORp0hN7UO4eAFVjTVf+j76i3KDprQYwqJpkNxvDrt+iPdVVS6f0JuqH2XGji5lexO
	 VMgDm9Bm7R1z1XzoynU/F8vM/ab82da/na0x9fdYRATW5wtdBxEgqs2ueta2Wn1r6Y
	 kenWH0Xtfzq4OppuuLViU5DSllzVe1rMeN332aV+AcqgyZ/tyNr0UyN222Nz8VlgGi
	 xCVAAraEpdqZc/56/nku3IRctwH2c9uid1h4GtwLQ+5tSFSsD0/HrGGssaMTeb6LL4
	 hCqSEkaNErssRXqLItMqPpvkhkj/w7jRvglqDVMz818h7r4fNWOH4zZ3RZrUQqmjV1
	 skUKAikVI+gVg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/3] clocksource/drivers/timer-clint: Add set_state_shutdown
Date: Sat,  6 Apr 2024 19:17:56 +0800
Message-ID: <20240406111757.1597-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240406111757.1597-1-jszhang@kernel.org>
References: <20240406111757.1597-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_043123_765871_49238A57 
X-CRM114-Status: UNSURE (   9.59  )
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

Add clocksource detach/shutdown callback to disable RISC-V timer interrupt when
switching out clockevent from clint timer to another timer.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/clocksource/timer-clint.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 09fd292eb83d..1c17eff9861e 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -119,11 +119,21 @@ static int clint_clock_next_event(unsigned long delta,
 	return 0;
 }
 
+static int clint_clock_shutdown(struct clock_event_device *evt)
+{
+	void __iomem *r = clint_timer_cmp +
+			  cpuid_to_hartid_map(smp_processor_id());
+
+	writeq_relaxed(U64_MAX, r);
+	return 0;
+}
+
 static DEFINE_PER_CPU(struct clock_event_device, clint_clock_event) = {
-	.name		= "clint_clockevent",
-	.features	= CLOCK_EVT_FEAT_ONESHOT,
-	.rating		= 100,
-	.set_next_event	= clint_clock_next_event,
+	.name				= "clint_clockevent",
+	.features			= CLOCK_EVT_FEAT_ONESHOT,
+	.rating				= 100,
+	.set_next_event			= clint_clock_next_event,
+	.set_state_shutdown		= clint_clock_shutdown,
 };
 
 static int clint_timer_starting_cpu(unsigned int cpu)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
