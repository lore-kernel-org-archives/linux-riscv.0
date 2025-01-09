Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5890E77197
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 16:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9FdreQed3pq9rqv8CNdefgNEiAp+3rTvxHkBw1h3Cg=; b=3Tn89imyQMMfQB
	SdBLo/CjnJ5l2sYpt5NNv7rw2kunnUh+ZxdYzGg2DVscz6o0nJgO6+HMFIAOrIRgrX611ZboYKdoM
	lQLzLKIUr2gKSyJ3qxIyV6FDNVoDwlZLHzroktXZ5FS1H76c/sMthzryJ7CTQW778yOKaQWOThFaO
	AfKdtwpFcg/zTzdLKJmyMTpP7x5FlRC8nqKa6tFrS+9b2wQb7f7OYmgvJgZy4puJndCjAktJvBk7e
	+ZjsGRZiE/JqMXncTy0eNiT0UvPm1buP/UyEqQdPyqZFDRbNkTAW69pSOe2UdYJTwBI3TJyAH0r7j
	s4o2fKrjw0bLjK9nIShw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvCr-0000000Cdiv-1Vz4;
	Thu, 09 Jan 2025 16:16:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvCo-0000000Cdi1-2x6n
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 16:16:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4E22CA41F2C;
	Thu,  9 Jan 2025 16:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F633C4CED3;
	Thu,  9 Jan 2025 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736439381;
	bh=JbWDKBRIac68JZfYCDScQslJZun2nbBr1DkEqLzKpJg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YhesjzDLLGGN+NIcaSK+Ufh5ObnT5njRu4WalUn+Cb0hxWW6gQJZ2V4Vu5nMoKK2r
	 Avu9vOG73Tp0tW7/FdWGAQGeYd9vXomL8ZDF7KyplnitpqBBYigydMHKror6zblh5H
	 upUJoVkJcg+fgD57F9gJJF6X9SvPfCKmNTgQBK9jU1cE0MHd00bcaQQuIn1Ma9jRoy
	 IpyMAXssL7ZfZIhrBPt8yW6H+GHzC5MozGSSJkEUstULPBsHAr5V8cs220WrJ+hgW6
	 9T6RXoNf2rO9Yo0S4jyqMfM6Hx0kdoo4w01Zie17qIR2F+8uULIxhf6UQM5u87vvUo
	 9GBr5sRRcJuow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71433380A97D;
	Thu,  9 Jan 2025 16:16:44 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix sleeping in invalid context in die()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173643940326.1375203.17540794932675045582.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 16:16:43 +0000
References: <20241118091333.1185288-1-namcao@linutronix.de>
In-Reply-To: <20241118091333.1185288-1-namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, bjorn@rivosinc.com,
 schwab@suse.de, songshuaishuai@tinylab.org, coelacanthushex@gmail.com,
 bigeasy@linutronix.de, linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_081622_807057_92A1F254 
X-CRM114-Status: UNSURE (   8.31  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 18 Nov 2024 10:13:33 +0100 you wrote:
> die() can be called in exception handler, and therefore cannot sleep.
> However, die() takes spinlock_t which can sleep with PREEMPT_RT enabled.
> That causes the following warning:
> 
> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
> in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 285, name: mutex
> preempt_count: 110001, expected: 0
> RCU nest depth: 0, expected: 0
> CPU: 0 UID: 0 PID: 285 Comm: mutex Not tainted 6.12.0-rc7-00022-ge19049cf7d56-dirty #234
> Hardware name: riscv-virtio,qemu (DT)
> Call Trace:
>     dump_backtrace+0x1c/0x24
>     show_stack+0x2c/0x38
>     dump_stack_lvl+0x5a/0x72
>     dump_stack+0x14/0x1c
>     __might_resched+0x130/0x13a
>     rt_spin_lock+0x2a/0x5c
>     die+0x24/0x112
>     do_trap_insn_illegal+0xa0/0xea
>     _new_vmalloc_restore_context_a0+0xcc/0xd8
> Oops - illegal instruction [#1]
> 
> [...]

Here is the summary with links:
  - riscv: Fix sleeping in invalid context in die()
    https://git.kernel.org/riscv/c/6a97f4118ac0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
