Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1803BC0018A
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 15:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zr9ZCXkmIVg7GPt0OIyJDoMlA2n/OUJrqQkrRRuY2o4=; b=XXron0PswAfMSw
	vUcyb09aLfBQr0gLdx/VPJfaPHgkBB+GPcomx/dDkh+WKCs84LkO1ndrS9lgrgCwbmX+V3pMTrp5T
	+pQhsRMuHcsS1eAFx7B9wwipqYCR0Qo2WQXrmN1LJBCeTqhdbE/qbUeO0WyML0CxsgYY9TMqOM4c7
	ktt60y8zG4R6876A/MdGBni3dt0wrBcdMcPBrriQMDxe+Eh5bUL3zp99w7PPi1twLJObSR0OaO2Se
	NoMBP6GN5uKiaF/8hUmkxlXHdJbAfDhGxOi66kSKfW/SPN2LiZGlGri0LX02TSOMdLCRCRNcw8gmT
	TNXVmdmXVMyXyWOyihJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r015h-00GvfN-1O;
	Mon, 06 Nov 2023 15:00:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r015c-00Gvbt-15
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 15:00:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F20B60FA4;
	Mon,  6 Nov 2023 15:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 527F7C43397;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699282829;
	bh=YFVybbzYNtADnD7EN41/e4YtU6Oeh/3FbWJwT1GX5OM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MSulK/ZnMKO8w5IDzRsJ4GAkqFH8+9Z1yTj35fU9fQv+DO2RbO0BakiRQcOY1ET+i
	 8TlZsU3ACLLt5ICONLUMQINAN+/U5fkHJykYL0Gr9GHa0V7ptKDeUCLwgEehP3hFfB
	 iy/M0dSQWUQ3XRwt4q404PNVn/OBfoN9/QucdK0+3YY6tlnWQGziuei9USrbQBwflg
	 1PuNgnR1DhAF/gyw5Bt/RZbVYttN72GtkYnH6CUwHXlHbsCsSsgWzkEsVP8kZ9gIGa
	 hsn9LWFuNlj0IhzljyPCoP3DsfnQn1QGQgfxt8MZuFebUr3o/1klL8Cd8CX+CDcZo8
	 syoP3l3d0xcvQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2B44BC00446;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: signal: handle syscall restart before get_signal
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169928282917.16503.10982051973529578442.git-patchwork-notify@kernel.org>
Date: Mon, 06 Nov 2023 15:00:29 +0000
References: <20230803224458.4156006-1-ancientmodern4@gmail.com>
In-Reply-To: <20230803224458.4156006-1-ancientmodern4@gmail.com>
To: Haorong Lu <ancientmodern4@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 andy.chiu@sifive.com, heiko@sntech.de, guoren@kernel.org,
 viro@zeniv.linux.org.uk, mathis.salmen@matsal.de, abrestic@rivosinc.com,
 greentime.hu@sifive.com, vincent.chen@sifive.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_070032_419565_F2F85E44 
X-CRM114-Status: UNSURE (   9.76  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu,  3 Aug 2023 15:44:54 -0700 you wrote:
> In the current riscv implementation, blocking syscalls like read() may
> not correctly restart after being interrupted by ptrace. This problem
> arises when the syscall restart process in arch_do_signal_or_restart()
> is bypassed due to changes to the regs->cause register, such as an
> ebreak instruction.
> 
> Steps to reproduce:
> 1. Interrupt the tracee process with PTRACE_SEIZE & PTRACE_INTERRUPT.
> 2. Backup original registers and instruction at new_pc.
> 3. Change pc to new_pc, and inject an instruction (like ebreak) to this
>    address.
> 4. Resume with PTRACE_CONT and wait for the process to stop again after
>    executing ebreak.
> 5. Restore original registers and instructions, and detach from the
>    tracee process.
> 6. Now the read() syscall in tracee will return -1 with errno set to
>    ERESTARTSYS.
> 
> [...]

Here is the summary with links:
  - riscv: signal: handle syscall restart before get_signal
    https://git.kernel.org/riscv/c/ce4f78f1b53d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
