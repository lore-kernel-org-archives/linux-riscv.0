Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B5CC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 18:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asTMb+AnBwYdKQcmm2km1XhciFHBYp5NSiRtTLgQD74=; b=ABDACBMq2NpuuX
	iT6Qt10bG2RmrcIcfHWUARI5q9i/HYYtLns5bP0uHxExnEYih6NY0gIrf7v0z41LqS8pxIKu+T0kr
	Q8vHQM4HAOymrtEkYW9OnC+k4oJhzV8fl9n0zGaz3/+/R4kfCCquVFIGC3+FKBWGX7LxN1nYPSlxg
	yCzMHWde3CL8LzW/iLo/XfOzo6FVHq0TFDOynNFsMwohrRP8eOqIY3kslu9b+e0D4qoQcyFhUZ2LN
	t8nX/qFtPZrfwNLMMl6tMCcb/3e0BKwdxN62lrHb5MFImRbAkJMpk9JvHqJYUbLxfmkmdAqF/HDhm
	Ms5yH93hEyofi53WNIpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfl1M-0000000EgT1-1qys;
	Thu, 29 Feb 2024 18:20:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfl1J-0000000EgQ7-0Oj5
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 18:20:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CBBA9CE13DF;
	Thu, 29 Feb 2024 18:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07614C43394;
	Thu, 29 Feb 2024 18:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709230832;
	bh=xM3JMCH1s+ja4ELiHjz4kIVpPXrV8y6OXtjRrWaxqsA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KE4v+x8KjkYvHJUWW8sg6hjIQy9xhIF+qbWmcNMHd12ey7LI9jObE7Ipcjj0ANf4M
	 yz1uBhVzVQvkJqFjBu9mC5jStx8Ty9bu0LEt83DYXEXL+K8+q2mDLY9NYXerB22XPM
	 Wkbf7och/bGhe7G7+TFtRKwV/0yenDGE9wrMxPX+GtM5tXfAl92K+pNs4LDflfijkY
	 DIjSWEonf5r7KLpxHekkh65OKddjPAOhBXcpqeNFbwzL8suZKiLeDXfhoQMUsPkG7x
	 FZw1bDuZYl/X0WODj30/ay/l8NEkUX4BQIZovI9+Jg2Pf4m8g2AVRnacRj4PghJtFd
	 1yZMO1JjRXcKQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D7697C3274B;
	Thu, 29 Feb 2024 18:20:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] MAINTAINERS: Update SiFive driver maintainers
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170923083187.760.6327659014794043857.git-patchwork-notify@kernel.org>
Date: Thu, 29 Feb 2024 18:20:31 +0000
References: <20240215234941.1663791-1-samuel.holland@sifive.com>
In-Reply-To: <20240215234941.1663791-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, greentime.hu@sifive.com, green.wan@sifive.com,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_102037_329622_1C3B83C6 
X-CRM114-Status: GOOD (  10.81  )
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

On Thu, 15 Feb 2024 15:49:11 -0800 you wrote:
> Add myself as a maintainer for the various SiFive drivers, since I have
> been performing cleanup activity on these drivers and reviewing patches
> to them for a while now. Remove Palmer as a maintainer, as he is focused
> on overall RISC-V architecture support.
> 
> Collapse some duplicate entries into the main SiFive drivers entry:
>  - Conor is already maintainer of standalone cache drivers as a whole,
>    and these files are also covered by the "sifive" file name regex.
>  - Paul's git tree has not been updated since 2018, and all file names
>    matching the "fu540" pattern also match the "sifive" pattern.
>  - Green has not been active on the LKML for a couple of years.
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: Update SiFive driver maintainers
    https://git.kernel.org/riscv/c/680945f0aa50

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
