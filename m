Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8D6C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Apr 2024 22:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EeErCKSuM1LeJs8o2C2x3s6PYFmP+CUyfqVTXjmNC7w=; b=Q5pDHtPQDGpxxg
	eu1kH5HMIOc/djxdPZshE4MUvSClIXzjA0pe5C1aJYTHUWOj3dI2Hbn5cWDMlGDomn7GLlYklM/JV
	i6RclMZ3WEJImU3xXElLNrdp6jvxWDC17e6fFRHAthKjybnAf/4ufEZ9z8NHMWBF9mtItAuOUmb87
	tTVurbcumBuIFfAi9cbQrKOIuhvsxiA1b4cScnAkAXYcNA7BbzDYLp6dyMwW96OGKOjASrcgVddlA
	1ZptJflyvdTAT89kPOdhEw9KoE+GZkQZ2zbjMPIJIbFNZJ9qBlj47bJ5yIyDO66+d+siZM6P0AjXn
	933cGhCcdL+j9qTZt0eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1CZk-00000000npd-3rrk;
	Sun, 28 Apr 2024 22:00:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1CZZ-00000000niv-09Ti
	for linux-riscv@lists.infradead.org;
	Sun, 28 Apr 2024 22:00:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E072560BB8;
	Sun, 28 Apr 2024 22:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0068BC4AF48;
	Sun, 28 Apr 2024 22:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714341635;
	bh=1qKdoG5YY3wg6nGACjGnyUqKx/CBlKjdroaK1d6lOZE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HFeghbzql4bMYzZIZzMwrY/cJxzzroAHUTYm8CZrt629PrXpzWfsQFdoaiF8c0PpR
	 6/RdkuKiAXl1ef0bLNgzstq9S74gLksVVtkwPo33McWWm0G9Bbc7Y94RRXRlAiwrqn
	 uQsLRe2guNwISkkorZQxrVDj+fvfzS4dchrRTiO9dE+aB0AWACZXtSP56A/lxxa/Py
	 V42r4wUV0X0pKboZ676asOQrXEJ2AWnCdqesyMTkYuLxB0gT7HbG4B00607la6dAyX
	 gGrTgErXblfTh5BCiu169CpnY09FRGI5ZDgPagZC0l3i1Jeg/B/ldBdzbo46GaHAor
	 2cgJ0FCRa5ylA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E8913C4361B;
	Sun, 28 Apr 2024 22:00:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 RESEND 0/2] riscv: enable lockless lockref implementation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171434163494.22130.17509097464954916168.git-patchwork-notify@kernel.org>
Date: Sun, 28 Apr 2024 22:00:34 +0000
References: <20240325111038.1700-1-jszhang@kernel.org>
In-Reply-To: <20240325111038.1700-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_150037_148095_13214536 
X-CRM114-Status: UNSURE (   6.41  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 25 Mar 2024 19:10:36 +0800 you wrote:
> This series selects ARCH_USE_CMPXCHG_LOCKREF to enable the
> cmpxchg-based lockless lockref implementation for riscv. Then,
> implement arch_cmpxchg64_{relaxed|acquire|release}.
> 
> After patch1:
> Using Linus' test case[1] on TH1520 platform, I see a 11.2% improvement.
> On JH7110 platform, I see 12.0% improvement.
> 
> [...]

Here is the summary with links:
  - [v3,RESEND,1/2] riscv: select ARCH_USE_CMPXCHG_LOCKREF
    https://git.kernel.org/riscv/c/eb1e50372946
  - [v3,RESEND,2/2] riscv: cmpxchg: implement arch_cmpxchg64_{relaxed|acquire|release}
    https://git.kernel.org/riscv/c/79d6e4eae966

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
