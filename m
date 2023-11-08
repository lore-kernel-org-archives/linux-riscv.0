Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386A9C04E83
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 15:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXP5MNR3vDPzrA/OWWeOxePnO1CEDYv0uMMsBnN18Gw=; b=I3Tg2spB27k1ir
	aJnkLOJL1AgTZOlrSicb1XXC+cN5bRE80Ob2lvgxukni0u7IuiNXetZPHeoUEIQ7pNITH9Od7eaoK
	RkXtz+gtf1FZJcREhvrBibA7lXaoAohYVOUFPu2+Uedyg6SzSL9FbAC8vidDREYJkjAf0jvrVe7AX
	uIJr2uLIUd4H2UjBnmZVQIu23yVdQwENFnZn1HkRkr9DZfWSDmMDKAAKXYEQdGxVJrBDk6fTs0L2m
	v23LwuviOnsAdC57GvzfWLx7YfDq4y3De+WAGQ5T4mP2zJCGPfWwEOk+F1cNCMbT2Ft/hz2Q7azlM
	ZCJzHdM+Lfr7t8Gp/Bxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kCR-0049cV-2H;
	Wed, 08 Nov 2023 15:10:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kCM-0049WW-1p
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 15:10:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D48B9CE10F7;
	Wed,  8 Nov 2023 15:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 078E0C433CC;
	Wed,  8 Nov 2023 15:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699456224;
	bh=evxiBy+O5cxOD89fDK5CEJoGw+MeFCCk44XwfwRkwTQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=F4mU6biyCecAkE+rIIX8GzQkpkDlqGf7R1ykSbRk1ZcMObzMqlDdjAT8zTpRqac+K
	 1ZVao9sRRPV0ydDqh4Mh3iAqcR2PDeS8NwXN8HGwUvWL4vx8mAUTXK0QbGAjscTtGn
	 AJ24mjWza04CsGpPaCMWOBzewP6PYgzWWMVU6+l7IUlEhKbumMLUdsqhIR+fG5TGGA
	 f5xWtWGOhMPZ22VwMOohwcS7g+IU9gcpdpfZOxOuFSG90XaJqFGSJyLtCXGh7AaxXb
	 6loiCG09UJ1uivu8QMj2QiLK1MH9a6AxOXERA/5eaNIC1IWWKN50j23/teSZBtXS/4
	 jkk4Xw15HZHWg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E1763E00089;
	Wed,  8 Nov 2023 15:10:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Don't rely on positional structure initialization
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169945622392.21527.8644099759703998280.git-patchwork-notify@kernel.org>
Date: Wed, 08 Nov 2023 15:10:23 +0000
References: <20231107155529.8368-1-palmer@rivosinc.com>
In-Reply-To: <20231107155529.8368-1-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_071030_780021_572AEDD1 
X-CRM114-Status: UNSURE (   9.20  )
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

On Tue,  7 Nov 2023 07:55:29 -0800 you wrote:
> Without this I get a bunch of warnings along the lines of
> 
>     arch/riscv/kernel/module.c:535:26: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
>       535 |         [R_RISCV_32] = { apply_r_riscv_32_rela },
> 
> This just mades the member initializers explicit instead of positional.
> I also aligned some of the table, but mostly just to make the batch
> editing go faster.
> 
> [...]

Here is the summary with links:
  - RISC-V: Don't rely on positional structure initialization
    https://git.kernel.org/riscv/c/28ea54bade76

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
