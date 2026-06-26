Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7B6CDE012
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t5O4Dwxaafqcg61udP2PheWM1U11RyhYEzvxXA8Y9Pg=; b=De/NZr23Teuenq
	fQcHIPXOXaYfyIlx65hWOTaFN2Da1fxKn6bEKN8AKZhH/zbQRktNmE7GWAzyYHVLuNfAD1WqQrLaK
	aqBzJ93VBStCgvmMPYirBZE9uDnFnQVaMeYlIA9eafggr4AacSaakaVJ2Sgp3lvD6hiKvF9qH1uzO
	vwhCkLeNekhRp8VrTjjCB2H4mILoCc1X83WBw2HUfZPC5iLE5+9+qlDIgwjkym6MEVg3JVtQGfqS+
	bB9suBlaB+6gN2Kjj8PKlnAmyDEySlTM/4MP0F+1rLcYo9gPFy1vE21tzxJCUKUJV1ILYzZ0ElXeM
	k3+Cvc1lloAW5Z//3Odw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oM-0000000An9h-3d6C;
	Fri, 26 Jun 2026 08:21:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oK-0000000An63-3qwq
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 08:21:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F241260128;
	Fri, 26 Jun 2026 08:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75751F000E9;
	Fri, 26 Jun 2026 08:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462075;
	bh=Q2yg6hQ/U5ooIXv4yyQf4Yi76qiwrYkAT5ywoTwEX24=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=eoEGwJ1ecsRSn7WywfpxkZWxT6gIxVIXdMSZwAEI2V1E39AubUWaB2a0uCavsVO/W
	 SKbYzH+XwlQtzMpWB1Tno5JBmSEusBPUDJvMeA38EXP5i35ed7l2XkrqSEHhyF8GoX
	 lPLofBSnMcWecZCRQ2d2m7SgFmx3JVGkN37+USNsLQfqpR1cRLbOzwFLZyAYHrFcus
	 bVB1zdnFi9d/fM6BbFkZaWCJ7MUFlRm8/MJsNrXSfvrm4WXvqlDNnVxy6dbCUspSD8
	 /qyzNnLegZwVjaof5ZVoHs6reVqEf1LfS5nsF3JF4xLfVGf64jz90MtI7syirVBUBS
	 st63LXRVjMvWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id E558039389E8;
	Fri, 26 Jun 2026 08:21:03 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v11 0/8] lib and lib/cmdline enhancements
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246206276.3816447.15355853721771645153.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:02 +0000
References: <20260519172259.908980-1-dmantipov@yandex.ru>
In-Reply-To: <20260519172259.908980-1-dmantipov@yandex.ru>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 andriy.shevchenko@intel.com, thecharlesjenkins@gmail.com, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, ardb@kernel.org,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
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
by Andrew Morton <akpm@linux-foundation.org>:

On Tue, 19 May 2026 20:22:51 +0300 you wrote:
> This series is a merge of the recently posted [1] and [2]. The first
> one is intended to adjust '_parse_integer_limit()' and 'memparse()' to
> not ignore overflows, extend string to 64-bit integer conversion tests,
> add KUnit-based test for 'memparse()' and fix kernel-doc glitches found
> in lib/cmdline.c. The second one was originated from RISCV-specific
> build fixes needed to integrate the former and now aims to provide
> platform-specific double-word shifts and corresponding KUnit test.
> 
> [...]

Here is the summary with links:
  - [v11,1/8] lib: fix _parse_integer_limit() to handle overflow
    https://git.kernel.org/riscv/c/6e30111dbb40
  - [v11,2/8] lib: fix memparse() to handle overflow
    https://git.kernel.org/riscv/c/9a4580db6e9f
  - [v11,3/8] lib: add more string to 64-bit integer conversion overflow tests
    https://git.kernel.org/riscv/c/ab90fc100724
  - [v11,4/8] lib/cmdline_kunit: add test case for memparse()
    (no matching commit)
  - [v11,5/8] lib/cmdline: adjust a few comments to fix kernel-doc -Wreturn warnings
    https://git.kernel.org/riscv/c/117d2bfa0ab1
  - [v11,6/8] riscv: add platform-specific double word shifts for riscv32
    https://git.kernel.org/riscv/c/a354b8de9ad6
  - [v11,7/8] lib: kunit: add tests for __ashldi3(), __ashrdi3(), and __lshrdi3()
    https://git.kernel.org/riscv/c/6bba2ae43e8f
  - [v11,8/8] riscv: fix building compressed EFI image
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
