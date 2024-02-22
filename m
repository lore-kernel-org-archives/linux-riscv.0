Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DEBC5478C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 20:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gmwEwr2tcvUeAvVwdHBUtaEvBjaHW2nJX2grkzK6uMA=; b=XxO+5u5tWgfGVH
	i8tD8soR3AvlY/Foqq2qVuT/Z5e5PRTFvK6EiW6qKzXYBlSJ62mtwSWxRK1XhHlIefRT5giuofZbx
	okj4mjQsK8UVVG5yizIRydfNks8bRIEIBXVC1Bz0/mlMfOZmI0+22hf2om49gkQTYylJi5Qn5z2jq
	39XXJzz6uGOqvuuMTskzV+smend5jXmH6FuhcBf8XMT20iaixvW9ctqRllOcVNOjZiqGagNw6ZN6n
	kQ/xUMG79jJ4FeK6lvlQjN7DqipKBPkCDQ/htF3v6PtCkf9oFCVvKTobHAYRXSipmqXuIb450fsOT
	Q47PGZL6I8LBe3iCrmCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdFYd-00000006SvI-1m9y;
	Thu, 22 Feb 2024 20:20:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdFYY-00000006Ssx-1INI
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 20:20:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B1ECB632F1;
	Thu, 22 Feb 2024 20:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 549CAC43394;
	Thu, 22 Feb 2024 20:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708633231;
	bh=UtGmhrVXWOQgfINhBlApcwhf/spsw5YMmZhYCI+jEww=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=b5xqPH+jNwgz99/qOuiOdzr5cJrB+12a30C/knYO2wusyXuON2BpRDK6tqpWpsZiv
	 lz/gvdJ1X/Ahd0nZn74UDJUQ+l0VKNZoNUcpHCBWEQ6CI6Qh2cx0O1SZkKpg8/lr2v
	 GQSgsQJMBkgcBBEQjLlxddaSixgzV6ixmBj8CJxpd6/NmChd0eMPALkN+P5k1W7OMo
	 75Qtkm+fRQGxuxgQGIIVbIfpsVoryXrO2WXIUMtyJh4vnkurMYQm1sQ4iWqwDybt6u
	 PwWvesXOqcW+JWSu0VDeqxBUyEc3DG1Wi1eZqLdcPTouAPs188tPH3+fNn69emz1vb
	 Cx92WtX27ptKQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 39A19D84BBF;
	Thu, 22 Feb 2024 20:20:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v8 0/4] RISC-V: Add MMC support for TH1520 boards
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170863323122.27873.17493121539917977053.git-patchwork-notify@kernel.org>
Date: Thu, 22 Feb 2024 20:20:31 +0000
References: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com>
In-Reply-To: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com>
To: Drew Fustini <dfustini@baylibre.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, jszhang@kernel.org,
 guoren@kernel.org, wefu@redhat.com, conor@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_122034_430584_10433CBE 
X-CRM114-Status: GOOD (  10.22  )
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

On Wed, 06 Dec 2023 00:09:20 -0800 you wrote:
> This series enables the MMC controller in the T-Head TH1520 SoC and
> enables the eMMC and microSD on both the BeagleV Ahead and the Sipeed
> LicheePi 4A.
> 
> The drivers/mmc/host patches from v6 were applied by Ulf and are already
> in the linux-next [1][2] as well as the bindings patch [3]. Thus v7 was
> only a defconfig patch and three device tree patches. This v8 is a
> followup to change the dwcmshc node names to match the documentation.
> 
> [...]

Here is the summary with links:
  - [v8,1/4] riscv: defconfig: Enable mmc and dma drivers for T-Head TH1520
    https://git.kernel.org/riscv/c/45e0b0fd6dc5
  - [v8,2/4] riscv: dts: thead: Add TH1520 mmc controllers and sdhci clock
    (no matching commit)
  - [v8,3/4] riscv: dts: thead: Enable BeagleV Ahead eMMC and microSD
    (no matching commit)
  - [v8,4/4] riscv: dts: thead: Enable LicheePi 4A eMMC and microSD
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
