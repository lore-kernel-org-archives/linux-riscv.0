Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93F7C3ABBF
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 22:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lz/nlejT6PzPAuFEghLzplkeFQxWIkplDivTcTqt1uQ=; b=mCY4PUqQlS/mNd
	x1rXQnlp0e0vmqQEp1LnMIcz/dDTDk+HfvCRpQli02jmCrqoO8wzE2Epj6/fwC3zBVhOhxl83pU+O
	przNCTVnKwfifNNBdnHJxZKTCk5ht5HVvzgSly3ATX1sXnrBTf5lnHTAl6Qny9z2x+aPadOZs8T2r
	3f1R6j1pdXEBy2fvyz0KJRNplA6ErsYrbqyaz9ND3CIs4DwOefDiPqfdj7wPGpUKwDkxhVLY09BSB
	qDG+cLIpewrZeC4+g3cmWJRBQ2w4vERH9XL+6/Lddvp31NSCN0YenKhKTY3L0ivz2KEv57ADSEDcZ
	RqgAHYXdkvG/fg8EYTNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4fH-00000008szG-2aQx;
	Mon, 05 May 2025 22:51:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC49y-00000008isA-3hVQ
	for linux-riscv@bombadil.infradead.org;
	Mon, 05 May 2025 22:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PgKGzXr8JtGvpO7e8agghuz/Lo6OiZK8X8zoA21Oras=; b=g6kR0+LpQ7ZelYEPAWW7RtpI98
	niGRGfCKHEVXgmsFPje3+gp9Ne/jpLD22DPYbg3F2YNNqllUlIf6lltQpRX129VYvF396VeHzutNX
	pkTrwdid0mWwLwQ5prJ2TT5/lU+N+aI6XDQYXymzAgOK54d2fU0H+ukzYfFC3Z3Z5qeq8DxKzSVaY
	bBVhuzzHTC+4mPXQRBU9TeooSOApRpfpL3Cccxp4ixO2DyCvbWso6sWd2OD0oYmmuMBJunGDjFDOf
	ihFl2BxVESwX5LYobYV4i23f5D0Cd2TfBETjyoM8c3Uupr6ioSI8fS8sVRPdBqoiCQ7cVIMXpw7bP
	mM0gh1Ug==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uC49a-0000000FYdT-3hcy
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 22:19:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 711DA44EE6;
	Mon,  5 May 2025 22:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7072C4CEEE;
	Mon,  5 May 2025 22:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483553;
	bh=NWrCB9QKWE9LHJw3TZ6TiMGktRwEOC/Vp74f1sAzblg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uND8PcYlzRMFuED9TY1zophUqD5SUZyWkOk1xva1vuUzNqqguNa8XYOZGKQCAj/rE
	 saYl1m14SDW7oFvSoN34DMQjrZXFdKktDdtc39lYJsnZJHiQYV9l4JjRzmav77X8NB
	 iHKM+ZkaRpWUk/a/+FTf536Yc9F/7pM6Gx7GTUAiBIz0nV3K9tGUQK8pYBDWmcZmF1
	 dhpFMnT9VsCYN/6sP0FnlWEGpTRSBkCLg4PzY9teVlrAQwT3k2bPknEriciQ7Ig1Sk
	 MC5o7fyaw/7MZ9Gh4ZtE6Qlibfkkh1mNRaH+CEB4AZRBkH2CdDXSw+tjgE1R1fvKsZ
	 47sMnUhFreqeA==
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
Subject: [PATCH AUTOSEL 6.14 112/642] clocksource/drivers/timer-riscv: Stop stimecmp when cpu hotplug
Date: Mon,  5 May 2025 18:05:28 -0400
Message-Id: <20250505221419.2672473-112-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_231915_726456_14A7D86E 
X-CRM114-Status: UNSURE (   9.21  )
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
index 48ce50c5f5e68..4d7cf338824a3 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -126,7 +126,13 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
 
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
