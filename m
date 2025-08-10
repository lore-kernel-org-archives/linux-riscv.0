Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65606CA0EC0
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Aug 2025 21:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6wpC8A9UtdO9GgKBlmV7XZmXt+NG1gizDZaEfqrOJ6I=; b=gJ0SmMYsxeE0hF
	Cidfu0kXD/5lXQqmi3X4YgBUPS5WZtYlKz7/rUe1yMFyvo7VQfbxQNZuZjvKNdKA90sLtno+vf85c
	Qye04QMwFvWUxSe6vAnaD39+bHuRCReioP1Am0iE0wyI2trJIqqFRcPWscBPiy5JdZdHLFhNuu+si
	qDPRp61HwQhvjSbYVEsCy+G4H0R2094jc7GaKbfFXVH1+/jXJpZIdWVLjWY/fvo3rgftAiVTY1Ghq
	uTpnoc+TIrQiqhV3UoyyQh445cQeM0tsn9bquCHr01OpWAGI3GZhQRJ+cdAqIZJpZ9KGfEhheeruM
	zyg53oEpMjx1BnYpLuQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDmw-000000063Rb-01VU;
	Sun, 10 Aug 2025 21:41:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDLC-00000005zld-1RlH
	for linux-riscv@lists.infradead.org;
	Sun, 10 Aug 2025 21:12:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A613D5C598E;
	Sun, 10 Aug 2025 21:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E76C4AF09;
	Sun, 10 Aug 2025 21:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860348;
	bh=/9zHP8ZRwUfoUYob9oFo9xt+P+QecvgYDAFnr1bk4hE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HwPDZj2+Ia99T8kRgPWLoW5qVwonv3sSQzk/I8QIggOPL0L2UI1c9GrrWUys96Fpe
	 Ef3COe4fMnaNZkaDF667XWU1um5Sia/fdA00XHW5gQspbvt2QEQhCDyfElRXMPaTlD
	 eYxCSfa2oCTjGg9cSw+1831aRTeDpgW71PSRO8VjUG9zdYyw3I1vyQjmRgPycSofdu
	 /Noh/hN1K0hzCTQ8eQEiV8VJtzF10t+IOI2hfcXgKLM8tGqLtohL46ikeWVSW0Xr7E
	 YVLU7l5GU7y6B30/6BxnVvSVHET1VNB2LighyWk0hWcw+UOWMcar/7QoWfqm0KuWbU
	 715PBI7JsfYew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33AD039D0C2B;
	Sun, 10 Aug 2025 21:12:42 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v12 00/12] RV: Linear temporal logic monitors for RT
 application
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486036073.1221929.15867064164483505773.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:40 +0000
References: <cover.1752082806.git.namcao@linutronix.de>
In-Reply-To: <cover.1752082806.git.namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, rostedt@goodmis.org,
 john.ogness@linutronix.de, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, gmonaco@redhat.com,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 pmladek@suse.com, senozhatsky@chromium.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_141230_429030_4D410E97 
X-CRM114-Status: UNSURE (   8.81  )
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
by Steven Rostedt (Google) <rostedt@goodmis.org>:

On Wed,  9 Jul 2025 19:56:17 +0200 you wrote:
> Real-time applications may have design flaws causing them to have
> unexpected latency. For example, the applications may raise page faults, or
> may be blocked trying to take a mutex without priority inheritance.
> 
> However, while attempting to implement DA monitors for these real-time
> rules, deterministic automaton is found to be inappropriate as the
> specification language. The automaton is complicated, hard to understand,
> and error-prone.
> 
> [...]

Here is the summary with links:
  - [v12,08/12] riscv: mm: Add page fault trace points
    https://git.kernel.org/riscv/c/a37c71ca412d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
