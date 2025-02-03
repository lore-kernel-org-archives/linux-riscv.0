Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78776C02193
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 20:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ojg3Zzgn2Pd4O5gGTpz2HbjZ61BA1SVGItQTH2hQO9A=; b=xnOOPMeOCrV4Sr
	Nc5to4/hpxf/mR7SWZ2RkkSAbSrK28OsJfKP1TnttL8N3fFC/yje4sL1DrwGdC9WgcAYhc7bsOIkK
	FSq5a7JmkA4R3s1cKh29jisZv5SABHajO1vqg+Gv1g/snqDKVk6mVIoON2SfIBSviuUL/XiqNAQpr
	e28BWKzvSLBNczeLvC/SUaRYgknGqziT9KXTisjNXEowovKlol7icfD4anoGlPTkaU3Hz+CkmTdgK
	ql5+yiyc1H8BKuUZ/+YUTDekQ7mu3z2pBqOD1Y5mYEHmmnah2mq2xL7y4BwEOcf/rKBb+xkcc0ytW
	2fUzJuyJ325ONXyT93MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3KK-0000000GZoS-0J1Z;
	Mon, 03 Feb 2025 20:45:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf2Ci-0000000GTPJ-4BM0
	for linux-riscv@bombadil.infradead.org;
	Mon, 03 Feb 2025 19:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ew2k/ZhTDtVW41vJG0VJaLEiqfzoD8Ka58sJz+OE9gk=; b=f9622wM3cFoO9PJDqfBQZlF4cG
	Jnj1B4UZ2yetZYwPPiMtE0ALorm/BMsj9lQdjCam+A+iT19QdTzH5zNabNZmdGdr0Vr46Jb5Um4WW
	c9wkkj2a6bQEK46xbEgHpdUvhUU2CYG6kRrY6ETg/aN/naqcxnMa94dSrUEBXO9TjZUZ/G5FQmoqY
	HvnG/LCNrEq5rXOvkbFpZYpMGORU9mUyQHxtO5puTCnc82wA9yFADzf44vwyynMK7JClFjP6q2xnu
	qzfoljj3ENW4fny9l5q4JuKIsaU/LjE9mQe/1PhqMfjgUxGWSv+yGxZQHs0GW99JcgDN38V+0RpNQ
	5jJc4nVw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf2Cf-0000000G93x-3Prh
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:33:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B3815C6842;
	Mon,  3 Feb 2025 19:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFB2C4CED2;
	Mon,  3 Feb 2025 19:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738611230;
	bh=NQUkMOvDYQPNJU3MenIgeAJYgYVRljraAHPj3tLWhbI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=H31fWr7AF+rT0mgHZMeU4eP8PFCSBwRzMXKdclcXlyEGMQo1/JSpAnvaSoHUnPGu4
	 7Rzkfi/dPtGlh9oFPdg5yPGJ486U+fIy7E44wB29atLrgW4eKzmwFHGWm6yneJf0n/
	 j+k9iTzaXYePMh3z/c/bhjAFyMpxGdi8znJ+2e9tdP6S59xr68fW5uuA7Ln83klOaA
	 QOUk18X9D3yEDy4WUXhIMYSI5Zl7cMBPpFB+H+r8V8ERk85MTkxnaF7GWK8kH9hkO0
	 uaKCbDe0+fPAlYVylKm51k7dfZy2RcrB5BDjcpgpCKs+9rBu3n2yQd3MAMRogGZRxk
	 VFt9tDjnJjj+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7197B380AA67;
	Mon,  3 Feb 2025 19:34:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.14 Merge Window, Part 1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861125728.3409359.18186944228561015512.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:34:17 +0000
References: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
In-Reply-To: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_193354_139889_0EACB1BE 
X-CRM114-Status: UNSURE (   7.11  )
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

On Fri, 31 Jan 2025 12:08:40 -0800 (PST) you wrote:
> The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:
> 
>   Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.14-mw1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.14 Merge Window, Part 1
    https://git.kernel.org/riscv/c/1b5f3c51fbb8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
