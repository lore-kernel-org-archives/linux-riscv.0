Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB43C3ABAC
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 04:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0q7G2mh5xkkSG9wY6x7F+06w0gjTR/NTs0F8s2vljws=; b=KlRph1r6Tz/sIG
	OH/i5+uC6EAqL/6YnsMYj5iuv5IhYO7inGV+oQUWmT6u3y1OBD1j61YTF82KdxuJLZ2E2zBWhFohh
	CknbZ9ylAEdhr+ZfPyK2zOwDAWszIfc1Nkh2DzBzx2RKVCLm8HCgT4XY9w7sFy1TaZOhLE+k9Wiw8
	/H+Mo4V7EAm1vpHF8hMzPJxzSw4b3TM0pbp85id9pxjvgiDYIPjqWLcJDmaY3dbqo6I+DBpYbgUp4
	kHSAJzA9y7g+Kg+jieWoT00wNCW3m2kfgpzIzMAgzn/SF4Wufb+hBuo8BKSGSSZdulGwi5xUGiiiC
	Y/K9Bj7u/pvE6Hd3kRAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCA2p-0000000AFTp-17C1;
	Tue, 06 May 2025 04:36:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC55Q-000000090qr-47wu
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 23:19:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 07FC74345A;
	Mon,  5 May 2025 23:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F8FC4CEE4;
	Mon,  5 May 2025 23:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487140;
	bh=B4/AFmH4EzCm+/gzXspUOA/ZQOae4G4h8zpgvZNFaUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VKDb4bVNN79c0miYr+Zo1oQkCjTrVqi7m17qNVzpm0HuYrYtb9RRc8vnB3bet7r6E
	 IO3g8l2nOqXdSU7fnD7Eu9AcdBGcA6KAkKVt1z4ZvaZjFciwmsfwlxhtAEtFQTWHpC
	 iT2MDvJ/zV8lIIwJEtLc87LZw3CdoyOnr/HV1ch45O1r8KaCtTewMcNW98+V8oIlNt
	 hr+bzUV6bxhAyHnFhf+IcI5TU60NPnvUftUZxy30OgYkw1jllXBViMy9YO2RIV+EuS
	 cQNBeMugC/ZjcU6FDidiRG3xTHkHYLF8FPFnqQqePcU0FbJzQ3kMv3ja4NihWCyVxQ
	 sd7dWhdD5dRiQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nick Hu <nick.hu@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	tglx@linutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 021/114] clocksource/drivers/timer-riscv: Stop stimecmp when cpu hotplug
Date: Mon,  5 May 2025 19:16:44 -0400
Message-Id: <20250505231817.2697367-21-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231817.2697367-1-sashal@kernel.org>
References: <20250505231817.2697367-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_161901_035641_CB0B37E0 
X-CRM114-Status: UNSURE (   9.26  )
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

From: Nick Hu <nick.hu@sifive.com>

[ Upstream commit 70c93b026ed07078e933583591aa9ca6701cd9da ]

Stop the timer when the cpu is going to be offline otherwise the
timer interrupt may be pending while performing power-down.

Suggested-by: Anup Patel <anup@brainfault.org>
Link: https://lore.kernel.org/lkml/20240829033904.477200-3-nick.hu@sifive.com/T/#u
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Link: https://lore.kernel.org/r/20250219114135.27764-3-nick.hu@sifive.com
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clocksource/timer-riscv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index c51c5ed15aa75..427c92dd048c4 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -75,7 +75,13 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
 
 static int riscv_timer_dying_cpu(unsigned int cpu)
 {
+	/*
+	 * Stop the timer when the cpu is going to be offline otherwise
+	 * the timer interrupt may be pending while performing power-down.
+	 */
+	riscv_clock_event_stop();
 	disable_percpu_irq(riscv_clock_event_irq);
+
 	return 0;
 }
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
