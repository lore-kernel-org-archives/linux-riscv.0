Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40147C677C4
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AvvgJeW8nyAjSBr1t2gXkWcxJz4mRRTM2CVZUDVdL/0=; b=e730tmp9PVvNq3
	ET/JX5A5YlH1rKvBT3cOdxUEkY70mIQhhrokc4ajaS0jexbdbp1ci5TTotpwrf+8HgQuShxi2s4g6
	TVxzZkzd8PVBK3G+zELSERs05IYQ+VJoM80yOZIlumZT5dE33Oj1je7e62TZzdqUfCdduKsIACY1Z
	IH125s0Kck6Aeq+nE1vLo8K2i1H//P1JYWUI2+nyJF1e58eLnxD6o0Jcf7B6rQCu0dXpNuweISooh
	AyLKSeolaT79tP4/92yGSnhuHgh60X5zfRtyqMO2DRp9MCJZKf21LW87Yh3bsD73jXO7uhXRPuUba
	WMjn85VljkLKvRHWRb/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7l1-00000008EVc-2R2Y;
	Tue, 10 Jun 2025 22:47:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2LU-00000007Yeq-3mSn
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 17:01:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5757C6112E;
	Tue, 10 Jun 2025 17:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEB6C4CEED;
	Tue, 10 Jun 2025 17:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749574868;
	bh=VcwkG10DIbI6kkDkL+J3LXlxZ/SbAbKgJ57aHNYrxEI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Wj98uEIEbv4r7fj1hdU9f4ppCFiONs294lGx0NdBHCTzIbtq+P6QkFVNLfh/2vKv0
	 GTmKjf/gs98QlApZANcIn/Xl+z+g02Zz2IHLQBkuE4CUHYSmGTxk6MOtdqH+7JWa9y
	 g1Rzso4jMrDwIqy0GRwF+JA5Tjb8UyHQEvrZfLHNBEsDRQa1z2X2AEUnMmFRJrPwlE
	 zYtSvEiX+QVDLcc8Rdcqbq4SQ5iBdg4U9BBErqdBV7OZrY+Q5ihgCZLsFxXdSIMwyk
	 dY9RVdxfneeg+mQycPeiLcGS7xt+XQaU3pK+NQVzM8Jz+553XjFZ3FC5U/ZNXi2RXP
	 XTGkD0y1iek7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD7E39D6540;
	Tue, 10 Jun 2025 17:01:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.16 Merge Window, Part 1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174957489850.2454024.4281078458759806074.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 17:01:38 +0000
References: <mhng-5795BA9A-41BA-4268-96C1-57114649A99B@palmerdabbelt-mac>
In-Reply-To: <mhng-5795BA9A-41BA-4268-96C1-57114649A99B@palmerdabbelt-mac>
To: Palmer Dabbelt <palmer@dabbelt.com>
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

On Fri, 06 Jun 2025 11:10:37 -0700 (PDT) you wrote:
> The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:
> 
>   Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.16-mw1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.16 Merge Window, Part 1
    https://git.kernel.org/riscv/c/119b1e61a769

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
