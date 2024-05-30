Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28215C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 21:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDVTvgjKC/bCLLijgT20U19s67GYOIKwSJ6f1vcSnz4=; b=w4FuJXn1JzRcmc
	SwcjGMOrw28YL4CXU4t9Jo80AhG+vbcyuk7fpz0wnuIT5r0XrtBj991a4TmWlQ9WBRwU2PpC+s7aD
	qjCp2ustugm5ttUDB7uaoizPp7hlXA7E0MX6qmHmLpqbbgAB1SpEvIzXq0tlPXVWyjHyQJNCIl5DJ
	sLxi7pgsxd1Bnk5dbME6e34CPkq4bzUykcBuyM1oSfxfwdNfbauE+FbH/sHSVPDDVFEwvc6/h24Qy
	WrO0AAZEvpupw79XXeCBj7E9icBVudAa+iFbtjwsR1v8HZL1QfbSEde4wlD6eALUM+wufrA13LS6z
	3rQoJgtKhhBdAjuSNJCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCn2m-00000008Qxl-1BsT;
	Thu, 30 May 2024 21:10:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCn2g-00000008QvU-0l5x
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 21:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7527ECE1B6B;
	Thu, 30 May 2024 21:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6457C4AF07;
	Thu, 30 May 2024 21:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717103430;
	bh=4HJqKtgGK39M+z3ADW4pz+yh2a4Pysk28/17uInmge4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AfLL8MoLRhhgfMujWXaqTYfcWLJwJGZTGMInrmH58Ws/D5ODITYVwKOpJcGlsLdF6
	 w0nbAi/VIZvb1rYa+cviSGpGmVDw8D0lfyrfI89aZ1km0g+8S2vNhfT5QcC7dptSY5
	 /Pp+JSxvqVG/8sHdHao7zgZCwilspIrTn/I7daQUsDAWT7tglf0PJUSbjruv9s+Y6A
	 zQO69omm7TdYgTsji/VX5CJFmnmWrZwVu3MDpfu1tv0NBA9AWJsppW72QZTNUEaqJk
	 OINbk8GQNBeCKF9vz2PTGf6B4tI1D7pDY03B5s3nWITFoePytiG9PlwxBNqUaHlidb
	 rJpJxdsxOnrOw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A7E06D84BD0;
	Thu, 30 May 2024 21:10:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes v2] riscv: Fix fully ordered LR/SC xchg[8|16]()
 implementations
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171710343068.6624.13466290859953012929.git-patchwork-notify@kernel.org>
Date: Thu, 30 May 2024 21:10:30 +0000
References: <20240530145546.394248-1-alexghiti@rivosinc.com>
In-Reply-To: <20240530145546.394248-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, leobras@redhat.com,
 linux-kernel@vger.kernel.org, parri.andrea@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_141034_428742_5EC982BD 
X-CRM114-Status: UNSURE (   9.18  )
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

On Thu, 30 May 2024 16:55:46 +0200 you wrote:
> The fully ordered versions of xchg[8|16]() using LR/SC lack the
> necessary memory barriers to guarantee the order.
> 
> Fix this by matching what is already implemented in the fully ordered
> versions of cmpxchg() using LR/SC.
> 
> Suggested-by: Andrea Parri <parri.andrea@gmail.com>
> Reported-by: Andrea Parri <parri.andrea@gmail.com>
> Closes: https://lore.kernel.org/linux-riscv/ZlYbupL5XgzgA0MX@andrea/T/#u
> Fixes: a8ed2b7a2c13 ("riscv/cmpxchg: Implement xchg for variables of size 1 and 2")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [-fixes,v2] riscv: Fix fully ordered LR/SC xchg[8|16]() implementations
    https://git.kernel.org/riscv/c/1d84afaf0252

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
