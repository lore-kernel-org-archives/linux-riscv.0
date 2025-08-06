Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028CBC87FDA
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 17:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F3cPxRMBrHuXKzvZTONUnpR4HpBqu+7XjiQ3oYgpmGw=; b=jppzCpUJGHi0po
	i2UMJVlGyAyOg9fs1M5IuLbZsGX32cNZ2QGPIspxioqK3OANlO9O+Lulbpd8RaVi9I7DLzT+gknpW
	72jqfmiyh9/EkL3LPENGR0XFJZb2JwyVz+HtK/NPvarLic3xph/h2BtXgCu2qaDWmg+kCNTswvCF5
	Ui5crTxFqNuaQP7T/+qTqVB/rxmmIyyVCIJhmkll3a+hBHY2zRiv3r/fAopoaHuqOwStyScXMWyjP
	rRwoau1tCyoaeIWk4nWHytMQaPiKi80ru0fHySSp9DW/guCQFj/dKjisNaziIMTIEBwWYSyidxcha
	YGFezsi6yZ1wuQg6H9Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhnz-0000000FtQe-1Jbd;
	Wed, 06 Aug 2025 17:19:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhjt-0000000FsGR-0z8p
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 17:15:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA24F6111F;
	Wed,  6 Aug 2025 17:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62678C4CEED;
	Wed,  6 Aug 2025 17:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754500544;
	bh=0y/Nm6OPi0T0mjCjHKEi+zNnjN7+zHKI3+/zxOa4BNQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ck2OCxI6BjI9uTatbmETmredUXJrzeLGhnJINfc4ya0VvzRJJjQUflcV5e7y63D8w
	 g2lh8LsP0haKJ1ySItsFihxcczBH5MPZcSsbstTLS4qhArfeVI+sxPgoRaggDSLZla
	 zCc4FD0o5RtRwBYC/V/gBC9pvEVQFHZ+Gs/RKvNPJaY1lzNEEWWdSA9r+IVPDi/i2e
	 cOwf/ymkzEO0HT4tOQKwfAS5/KLNRSctkeyzOVgH6hErzbw4ScOnlhyznOPgIy1PFT
	 zyDofaaBckeaHRXzT9JkMuH4d6wTKE11wfp87Wi49rjyIgmhlfgwfM+m8qfLKm8Kcu
	 nC4MDRjA8R7fA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BA1383BF63;
	Wed,  6 Aug 2025 17:15:59 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: pi: use 'targets' instead of extra-y in Makefile
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175450055825.2863135.14397675555943058251.git-patchwork-notify@kernel.org>
Date: Wed, 06 Aug 2025 17:15:58 +0000
References: <20250602181023.528550-1-masahiroy@kernel.org>
In-Reply-To: <20250602181023.528550-1-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
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

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Tue,  3 Jun 2025 03:10:18 +0900 you wrote:
> %.pi.o files are built as prerequisites of other objects.
> There is no need to use extra-y, which is planned for deprecation.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/riscv/kernel/pi/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - riscv: pi: use 'targets' instead of extra-y in Makefile
    https://git.kernel.org/riscv/c/cc750fa93b5a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
