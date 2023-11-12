Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C59C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 02:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MC37GBybRI1fIPHVa94O5egK8cgfvwReFhbmznybDGI=; b=Q3WRkuxTOs+nCN
	wW3S3KPJQVmA4Orrtaf8VskZFMZDZ93ClbAJPmuahxP4JVS3lcTUDe1qjiF0gNBJfsA32Tqxv8OvQ
	LwgSIoXjPNjd8KrhthCMTtpzSPuvB865HUJRA1u046MAtA/Wri1ib0LegfO8Y+4I245dlmmqDgCMG
	sHBt/P6ebGRJ6xBcMns410N/c9LSBRqDIXWJPDPN3qesieLfksKSXkY5RbU6XKcANX9BWxIFweqoX
	/1BrO+mtBQLGeHxFTvYQLF3ohcBbNVOLvQNPo7nqq/OrvP/Bdlq3MC7y5kdiUxuwQcbmYSz8BdZTG
	j+WRpbxDBb4MgXeH5lvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1zq5-00BZyD-1y;
	Sun, 12 Nov 2023 02:04:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1zq1-00BZxd-0s
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 02:04:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9B435B8077B;
	Sun, 12 Nov 2023 02:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC9DDC433C8;
	Sun, 12 Nov 2023 02:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699754674;
	bh=Mz/bSUszBMFNsgidYlUGKn1UUOg5blW3D8i2xRKGyyY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WwUt4oXeQgBAxP3eX1lE1x4D9ATKIFb9ly4V6MQU/ARhn4TtA1Eu/ZDWme6iGhV7J
	 9pLFGSpmr4tQTQMJgRYuJ+kouycMpHDz04x21Kz7HybeVDpMQ+Jxdi3eL8F9BHJCU2
	 4fr1HQu0pIyWRb3x9kWtuUzLscfKQy7Br4UHjEzptBt3IEXnGxDU42TDWK5PGKd9Nz
	 76DdRYHdGp9U4N2Rr6ltIXpSaWhFdVc5bgqI+vT5OggFReO6Y0XPHZxR6a0g6gJ1Le
	 JuvG6VFkK6SXwKdTD3iTkErtNnyMWeDkWG5uHTcU55r7XsHoBVcyTjkuWN1H4pOhqe
	 EflwNF7p8lLDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D4555C3274D;
	Sun, 12 Nov 2023 02:04:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.7 Merge Window, Part 2
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169975467386.11360.9937982680855615222.git-patchwork-notify@kernel.org>
Date: Sun, 12 Nov 2023 02:04:33 +0000
References: <mhng-9011bd86-9f72-4223-b78a-b4c69c1c927f@palmer-ri-x1c9>
In-Reply-To: <mhng-9011bd86-9f72-4223-b78a-b4c69c1c927f@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_180437_472861_1BE0D8B9 
X-CRM114-Status: UNSURE (   6.52  )
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

This pull request was applied to riscv/linux.git (for-next)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 10 Nov 2023 07:48:39 -0800 (PST) you wrote:
> The following changes since commit e1c05b3bf80f829ced464bdca90f1dfa96e8d251:
> 
>   RISC-V: hwprobe: Fix vDSO SIGSEGV (2023-11-02 14:05:30 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.7-mw2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.7 Merge Window, Part 2
    https://git.kernel.org/riscv/c/56d428ae1c4e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
