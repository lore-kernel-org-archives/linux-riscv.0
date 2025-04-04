Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E67AC36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 21:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lcm56SFpEmadPiGRleB2P3SEXIe5mcLRUWuMBt2jUww=; b=d+alibeY8Qwbg8
	5yxoUj5snswbb4ZjqLL0f+T/XL3oaz3r1BkwLSjlqxHNJ/JIapa4H3gOpvP7rCdQx4/FtTeqPtNRf
	NpNtyEAC6T+SIdgU/9a+LFQ8viGd4yxhaZh5HNrtRXaDkoTxn3pPlv5J5ivqj+DiQShfEH/Fv+eQK
	VAYLlzDu0AbL53vhyMrU85UBZxdrC4YYLk/btBYcLdup/H1iBaHiyhTxwfqot5tc/+Aob/gWcdATb
	Q91tXczfm7js1cP3oK9fEwCyP8V0nvyEt0BpbcjSRrUumhO5yqAY5KeilQIa5HqcMvwStfh8n0QuF
	myT/7Ir/1F2Vf2HMlo5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0oB5-0000000CqXi-3I0X;
	Fri, 04 Apr 2025 21:02:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0oB4-0000000CqXW-0a3O
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 21:02:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E2C6861135;
	Fri,  4 Apr 2025 21:02:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1220BC4CEDD;
	Fri,  4 Apr 2025 21:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743800533;
	bh=HkI0tKqftWEPpSzZIvp4k9Zi41oCVbenMG+H41i5Gdc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BRQOgfos0teQ2hjjb3/BO9dBrpC/0pLkQhaTAXCazJGqtVKDSM0v6DPVzmLnDX0Ip
	 oDpVQG+wNgS89Z7fMR4WTektBEcMZH7IPjxtcARf+qFqWcpzMCtj//OiA1lbiH+SvR
	 c0cMuKIzQoGT85B4JeAraHm9gG6nLOWBfVxuwa0Iwrpjre46Fh8jFdr2XGwb8DNfF3
	 ez+P5HWHNmWZZEYwEoQrgGGfJW4p1pmGemSxoxUooyAaDioFZQapZ783YCf+mTgS4w
	 td2o2mw6xPXzigZdkkco3InYw7Mq0h7lnVE8C9xLOWn865rHuJBprx0My7OXsgUmcL
	 5Gess9uLgTw1A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5AD033822D19;
	Fri,  4 Apr 2025 21:02:51 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.15 Merge Window, Part 1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174380056995.3383526.5100779460663452844.git-patchwork-notify@kernel.org>
Date: Fri, 04 Apr 2025 21:02:49 +0000
References: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
In-Reply-To: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
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

This pull request was applied to riscv/linux.git (for-next)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 04 Apr 2025 08:58:06 -0700 (PDT) you wrote:
> The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1ae1:
> 
>   Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-mw1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.15 Merge Window, Part 1
    https://git.kernel.org/riscv/c/4a1d8ababde6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
