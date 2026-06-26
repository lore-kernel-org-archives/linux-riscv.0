Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45D0CDE015
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y14Jj8BLKjKerRtbuDXfi10RJ6+Czs9BAJaOHGIV+rE=; b=nqen78Bv4PtG+s
	Z9qffs9MNrEZJ7LtamiruFjG8TTwlNxZSj1tcf9l1BZKB21/K/XPD6S8ey5vpY4Q0CRONPREDbuXn
	6iRs/To6Zef/dMaRpxe41PGPkGlMJUYbPg7OaRbcf93IDKUApjaox8ozV7MygZ9ARvNp8Udz4fXBk
	cdY2nJghHiGYN8k6XDLNP3kS9YYJzZswAIJEYfCy3lO8ywF7FIC8iT4iOig6t3vP+DtJE3oKJzG6A
	M7kFaJOgoqD9ZcBSJ9fyVdzRVlHisK18rNa7mLvsLm5PNQ2eoGr38QiNQ/4xNLkvw/awZHxJBEkOT
	11EkQ/BGY4MTVsBaiJSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oD-0000000Amyt-3vzl;
	Fri, 26 Jun 2026 08:21:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oC-0000000Amxi-14uj
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 08:21:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A34B60141;
	Fri, 26 Jun 2026 08:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4D91F000E9;
	Fri, 26 Jun 2026 08:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462067;
	bh=SXTJhhnYDtJcOg85zn5GupW5/0aizb+m1OcvfM0R+A0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=I1oZ5QOxY+g20S4Yu36z51IzJ7shOeblG7iY93YcqQHu9Fua8r3/JI0KBxagid9Et
	 R3xuHPhHE/xDxwdt8dvmCFGikmWLu6pB91YVQadFds1qoEcePA9k30fy5EJtgZ1GLC
	 tZDO24JzalmLwoz02KlLXOADOETzlai1kZQklOrpLHROu01alHzYskoLb/ZKFOYkvc
	 3VmZ3ye6SCmQ8BBKtodt9pWqt/a/RkpwgyOOpTIInGTAylbLJ2r2dT2i4AIVaVWYd8
	 MkfWWxutSp8me/PVjgWbGDpHdNz50PQ6tR5p8Wosacy69D7/O2ge6SXtuJXr39uNMZ
	 6klqQRKcF/qbg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5688A39389E8;
	Fri, 26 Jun 2026 08:20:55 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/5] arch: select HAVE_ARCH_BITREVERSE conditionally on
 BITREVERSE
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246205401.3816447.633082126458104033.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:20:54 +0000
References: <20260506175207.110893-2-ynorov@nvidia.com>
In-Reply-To: <20260506175207.110893-2-ynorov@nvidia.com>
To: Yury Norov <ynorov@nvidia.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, yury.norov@gmail.com,
 linux@rasmusvillemoes.dk, arnd@arndb.de, ebiggers@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, akpm@linux-foundation.org,
 ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com, sdf@fomichev.me, ruanjinjie@huawei.com,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org
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

This series was applied to riscv/linux.git (fixes)
by Yury Norov <ynorov@nvidia.com>:

On Wed,  6 May 2026 13:52:02 -0400 you wrote:
> Architectures may have bit reversal instructions, but if the API not
> needed, the corresponding option should not be selected because it may
> lead to generating the unneeded code.
> 
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---
>  arch/arm/Kconfig       | 2 +-
>  arch/arm64/Kconfig     | 2 +-
>  arch/loongarch/Kconfig | 2 +-
>  arch/mips/Kconfig      | 2 +-
>  lib/Kconfig            | 1 +
>  5 files changed, 5 insertions(+), 4 deletions(-)

Here is the summary with links:
  - [v2,1/5] arch: select HAVE_ARCH_BITREVERSE conditionally on BITREVERSE
    https://git.kernel.org/riscv/c/42d9c75e8b9c
  - [v2,2/5] lib/bitrev: Introduce GENERIC_BITREVERSE
    https://git.kernel.org/riscv/c/00751d655ece
  - [v2,3/5] bitops: Define generic___bitrev8/16/32 for reuse
    https://git.kernel.org/riscv/c/83aede8131af
  - [v2,4/5] arch/riscv: Add bitrev.h file to support rev8 and brev8
    https://git.kernel.org/riscv/c/e8620bd7e5e0
  - [v2,5/5] MAINTAINERS: BITOPS: include bitrev.[ch]
    https://git.kernel.org/riscv/c/7b2c5b4e43aa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
