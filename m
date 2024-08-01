Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595D0C52D6F
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 16:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wY2fuJT48mLz8aQxmJF3FSJiVCCZuCpaC0W79duNQ+I=; b=yKpDBdQGHam3nM
	ExmdVAKquaaVHGAb7uIKpa4P2JulNQpEPxDTvxGq/EIemQAbK93FtMB1xI3ekO+/60kOLYLQw3bpf
	NHE/6m3sjBzl0OypbhlgpXJ49yO2pfjwAHcaLyC5o9KAfWErnnkEMhWG2iYIHj1rrKiqe9wk/KnFR
	wpS47q07VLSoTWBcLZ1GSwPfgsUQ/rXcECsz70MGMeh9g7ycN6T4/iaISJ+CqPWNq3cySQW0fF3ap
	XpGmh8XzWGw+3YgtaCvD3m06PX1ZFcB+GxfmTO3HD/SGl0z6ixiwbNEfGHTyyO8XNvGsdqZIpkQAR
	un5I5gP4lt/es8eLQdFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYs2-000000067Wa-0skC;
	Thu, 01 Aug 2024 16:41:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYr1-000000067AC-0Xsx
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 16:40:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F3D662920;
	Thu,  1 Aug 2024 16:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBE9DC4AF0D;
	Thu,  1 Aug 2024 16:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722530437;
	bh=5dcaZj0wsgnhyNk2Cch87qZnEd9A+HrOMapM6+gaEb0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JEZ07OEejp6dhGn/s46zA9WRN24vkEkaB1Qs34BpdB0QDavtMCebv+o56qQIXuELi
	 oeyog5DZRxJQDJFxkg/pIMmqEL41kG4qCt+ZJRz5ucibSgVsxifn9rHE8/EsnyUxi1
	 1jObVWsd/uHtPBEG4T+Rht/lDlcPZJsHaxVtk2Md/K34aZm6ef0iE7C5B75KDueLRj
	 QX/f/JlQg2Bp5+Qmldasi37SguY17t1DZT4hhvbBgQBRsk9vl5ESXhfNriwBtznK/9
	 L26cbXeiVNiDL8mbj7g33wKtr11hw/dmZBaNmnz56hTe/7XsXqNNUIkNudyy6TTVVI
	 S8BsHrW+AexAA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9D267E8877C;
	Thu,  1 Aug 2024 16:40:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix linear mapping checks for non-contiguous memory
 regions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172253043763.13740.6343182077669512580.git-patchwork-notify@kernel.org>
Date: Thu, 01 Aug 2024 16:40:37 +0000
References: <20240622114217.2158495-1-stuart.menefy@codasip.com>
In-Reply-To: <20240622114217.2158495-1-stuart.menefy@codasip.com>
To: Stuart Menefy <stuart.menefy@codasip.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 david.mckay@codasip.com, palmerdabbelt@google.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_094039_363200_26E0577B 
X-CRM114-Status: GOOD (  10.27  )
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

On Sat, 22 Jun 2024 12:42:16 +0100 you wrote:
> The RISC-V kernel already has checks to ensure that memory which would
> lie outside of the linear mapping is not used. However those checks
> use memory_limit, which is used to implement the mem= kernel command
> line option (to limit the total amount of memory, not its address
> range). When memory is made up of two or more non-contiguous memory
> banks this check is incorrect.
> 
> [...]

Here is the summary with links:
  - riscv: Fix linear mapping checks for non-contiguous memory regions
    https://git.kernel.org/riscv/c/3f4b9eeadb17

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
