Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AB9C36011
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 04:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khkTtwvOkoWkJZvoPkXc2kxYblmfPSePD3K7n8Q65AM=; b=h4GRyzaQ4mWnzH
	8xpDD2jPW1wLCmYnuwTdOTUHoziN4+z0yjS6iDsU3foLCZGjUZ8LkQBtMhcPk/pD275y3vDMs5Gff
	eCUGsPhP4X3+z1mp6i4P/Uqaze64EfJ1I8dJmXeeffrQEpmRkh9JaWSKLEuAyX1+NlGgtRrePBeGp
	NDuJMxYMVRoFb2Z7MQTno3wpUTbzEhoMhDPi2JaKJKNC0HZ/nH1Yx1FY4hXC/u6GeO+jVIr+32LKN
	YXOZms10DTFIqlXS8VtipCfu4Eik9BGlkcMPcOjgMrTdRGM8p9jUC+wKFjjKMNJSDd08IHamTQGCm
	2I/Olz7AaqEqD+JOQG+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txf14-0000000A9tb-0p5u;
	Thu, 27 Mar 2025 04:38:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqy-0000000A4SB-1Q1X
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D87236115D;
	Thu, 27 Mar 2025 03:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAF9C4CEE4;
	Thu, 27 Mar 2025 03:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045863;
	bh=/iy8FtxzbwhjSmkKM7uy8++9qDW5X6I4m1nuk61UM4c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FhtRDJkjqxNTQn2pUK6o6ZEpsHnx2XWmufhp7tzLh/PA9OslLxfB/Vl6Xch24xU6L
	 BlCCxLsNBMgmvggt4EvTcUnv3zAGKpTuNPD++cfWrsNU3evMlV0+p85VF3g2lsPtzP
	 1YhxJumOoYkVKJdh83Hl6VazisBf+0SM66Svt7QsUSO4L4Wjb9Be0HT6u+SPpHUF6z
	 Ryvq9eqpA5NK4szG/4dnhpuFpB1zSUtsHl/HRI/RtqpnNyWqYPOamYQQx1iWDeL1LS
	 pb/j1tzk9icfcUu1Yh5+nvi1KX5sAT4JrzVVt4TIn66LmGF/O0LIaGyBNVsKhqju8e
	 R3RzPHA+kb66w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB5C9380AAFD;
	Thu, 27 Mar 2025 03:25:00 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: fgraph: Fix stack layout to match __arch_ftrace_regs
 argument of ftrace_return_to_handler
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304589950.1549280.17065579246811314249.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:59 +0000
References: <20250311132243.2178271-1-pulehui@huaweicloud.com>
In-Reply-To: <20250311132243.2178271-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 palmer@dabbelt.com, alex@ghiti.fr, mhiramat@kernel.org, rostedt@goodmis.org,
 naresh.kamboju@linaro.org, pulehui@huawei.com
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

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Tue, 11 Mar 2025 13:22:43 +0000 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> Naresh Kamboju reported a "Bad frame pointer" kernel warning while
> running LTP trace ftrace_stress_test.sh in riscv. We can reproduce the
> same issue with the following command:
> 
> ```
> $ cd /sys/kernel/debug/tracing
> $ echo 'f:myprobe do_nanosleep%return args1=$retval' > dynamic_events
> $ echo 1 > events/fprobes/enable
> $ echo 1 > tracing_on
> $ sleep 1
> ```
> 
> [...]

Here is the summary with links:
  - riscv: fgraph: Fix stack layout to match __arch_ftrace_regs argument of ftrace_return_to_handler
    https://git.kernel.org/riscv/c/67a5ba8f742f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
