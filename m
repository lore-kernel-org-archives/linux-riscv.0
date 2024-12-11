Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E12EE77185
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+QQc44PrROcbT01gPyhZhCAZS2rR9Rl31ZL2s8ipcRA=; b=Z1pcmBhIz1mwUR
	lXdZdqvqhZFfywpmrRi+JrJxlQKvcfr2wFdZkBJrFpflj2CuK3VHgVPAKVGo9oqJKa15THeLY33HD
	heNHmT3REBqYrfCwHFYw4csQG04nM3FYG8fUjuxOCREbSYJjLFIcUMihX55FPT2gth0H72tAo0NMD
	q1Q5WYyOQgr7vqkeNJWReauRGTJdU+xKoYdMEjLnZemOHVwwMjU70aEJaf6kTKyFXCxPaNwpR9LtX
	j+rMZ9WkhuHNsCdqo1yX99zxl5Qa5TsC1JljNAF97xqOmErPmAYYzyR+u/1q9orXaLvtcgmj4E4rB
	JhrdT0xidxiifu4W2KLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGs-0000000GLFM-47QH;
	Wed, 11 Dec 2024 22:33:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVFn-0000000GKQO-3Nkn
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:32:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C47AFA41D78;
	Wed, 11 Dec 2024 22:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E240FC4CED2;
	Wed, 11 Dec 2024 22:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956342;
	bh=ZHc33Xj1xn1ChAMYLEESG0l2ZDeoWzJJwfaFTxgV2l8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=c/aQI+38D2hza9d6Ks1OqGLKc9KbpNAUef6OEYU/62ulv2kHC5BSTZeklBMEWjOTw
	 nblyMMYmiGazoSWclR7yURKnOC/TM7ck4sMmgnE7L1gyW+sfTN2VHy6GL6FPxXVOnx
	 ZdlWPXMFMEREGrioiEW1D9/GbRqvhcSfH3r7nbDRxSa+qE++UrVUIB6jPycRQeOxR3
	 q8vFTa3Bo0Av+rTj74Fhkuv+QwosaGpaFUbit2UsMuQbmXp55TEQxlmPdhIkIp7Z4s
	 w0fi37WNzROYx11OqcwM1sa6VHrBd6jtFn6430wR6kbMEoD7NpFgATGH3mR2wL3K2g
	 JN/oZu0Ij/aqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CE4380A965;
	Wed, 11 Dec 2024 22:32:40 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/3] riscv: add PREEMPT_LAZY support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395635900.1729195.10810340550765834430.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:39 +0000
References: <20241021151257.102296-4-bigeasy@linutronix.de>
In-Reply-To: <20241021151257.102296-4-bigeasy@linutronix.de>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org, peterz@infradead.org, tglx@linutronix.de,
 mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, ankur.a.arora@oracle.com,
 efault@gmx.de, mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 jszhang@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143223_898609_A65979AE 
X-CRM114-Status: UNSURE (   8.01  )
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

Hello:

This patch was applied to riscv/linux.git (fixes)
by Peter Zijlstra <peterz@infradead.org>:

On Mon, 21 Oct 2024 17:08:42 +0200 you wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> riscv has switched to GENERIC_ENTRY, so adding PREEMPT_LAZY is as simple
> as adding TIF_NEED_RESCHED_LAZY related definitions and enabling
> ARCH_HAS_PREEMPT_LAZY.
> 
> [bigeasy: Replace old PREEMPT_AUTO bits with new PREEMPT_LAZY ]
> 
> [...]

Here is the summary with links:
  - [v2,3/3] riscv: add PREEMPT_LAZY support
    https://git.kernel.org/riscv/c/22aaec357c1f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
