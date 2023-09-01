Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501EACA0FE4
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 16:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6Ls0aK+zoabprf1jHdhINpeBn7unm69B8A6lpUlPIc=; b=uxQb3bGwl/6BCp
	kF5eaNRPbC6Wp103pKP0tODO4GZss70TEOQdu1H7ocCoUhbr17NS8ev3PmWvkUAhkEhjRph7QCP4R
	6TlmlmmYNY+EvccAkAV5KSVU3fehBFn9Hdkqfvncl0hBebL34CtzE1JR49X++BLnxFroy1FPiKRm5
	VYOjBCMi+q60ukritUSPRbZXY18knfDXNUxHBzmry7APuR6VB+kBuiQS5AHzF5w6KNJSMb0W9Lbmv
	tvphsFTkj6IdltP/qzzvoJ6hljcms9ZRLbUYYWPRSsFELGzbuTQZltWXJ2POjbrDMQBsEXaxNt6Om
	cyyCEUCbhXPIpbtGq2Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc6xd-000A8p-0S;
	Fri, 01 Sep 2023 16:25:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc6xY-000A1R-3D
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 16:25:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4DE6BB825C1;
	Fri,  1 Sep 2023 16:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B26F9C433CD;
	Fri,  1 Sep 2023 16:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693585515;
	bh=xFHHICU0oX7e9xcoLMZr0SP3idCLvPufOEnHfkrVwLI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nnN8Pm8CqO1rSwNEp4GVKpQXmbBdVNwgrpUE4BD7il58RtdAqAsCYBd9W5+3nwU58
	 oQRI2UNv2AXxzhJiyyFjFtBGnTANHXyZhkx1MmucPa5B1W76HRS6hvQNFGQEcjRPgc
	 ld0aBTSQ6I6Kuze9qH4KnS50uzxcJLEgIHrm5UjUaF+85H0z6Vs2OeQM5jmViXNgRT
	 FmGemGGavIQdqWQGn4+CxujbaEzV2AD0RSvdh30WZ/TLEeuc0yqb6tL7gs7YgOwmQs
	 xEDFohIXEURXICq2qtzJaUYxNclIVLqdUb//DWDPYjhclvC/vzQGa+gNGpAxOxQItN
	 SeGcK3+iH/1FA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 999D8C64457;
	Fri,  1 Sep 2023 16:25:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.6 Merge Window, Part 1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169358551562.8276.3620661978678741860.git-patchwork-notify@kernel.org>
Date: Fri, 01 Sep 2023 16:25:15 +0000
References: <mhng-d12081f2-1ff7-4f68-b320-f3aa5c458365@palmer-ri-x1c9>
In-Reply-To: <mhng-d12081f2-1ff7-4f68-b320-f3aa5c458365@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_092525_187102_3F1999E7 
X-CRM114-Status: UNSURE (   8.74  )
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

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 01 Sep 2023 07:41:21 -0700 (PDT) you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.6-mw1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.6 Merge Window, Part 1
    https://git.kernel.org/riscv/c/e0152e7481c6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
