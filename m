Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE54BC3DA79
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Dec 2022 20:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfAhbUDcUsBl/+KBlIdZM1rtnZzMdaxMKPA22sTx6eQ=; b=UzKEp6JkXxlm1N
	flpc+AzC5waW7jqLRTSvci6efIel571VAhaHUiFcnxW6tMCKpApuNHAuP9g/5vu4cwqE9y6dVYIk7
	xotnICKKf1Kuk9C9YUSr/jMCYxhDn1E8k+ESYxEP16Xn2MjNGERsliCX/BtMz8C3b4nY+gGvyXEPR
	RoasiIXa3EObQEVk2rGWoS6mVUZLAHP4x/E0zSQbOWufS5V7NTwnZJ5vwB+XyYzie0qQ7gJapGe+v
	5mzzE94jJU0WLc1QMrBj8ENQhvOz8UYcyOstFkyAEFpfC99rPtue7TTiHChCEGJ3zIESHyiNJnUKK
	1GSxSKUSCZnOc+nSlHdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAzER-001eHz-Am; Thu, 29 Dec 2022 20:10:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAzEN-001eEP-GD
	for linux-riscv@lists.infradead.org; Thu, 29 Dec 2022 20:10:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0AFE8B819F4;
	Thu, 29 Dec 2022 20:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1B81C433F1;
	Thu, 29 Dec 2022 20:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672344617;
	bh=ZPi40KCmTeswDPyetoF4YsCJr0P4yyzVSzBvRVbbHSo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QOdECm34JthkCqnkFSKx0+yrlyc5POvk/dbtvjdDonuGD1eQs4ha7AnUDOmiG97sL
	 6cBz/viCGYFeQKtcAqz2OFyLK1+87hZw7ysVK+yAp0cPMHNqnmAFP1SjIX4hWgnf+G
	 NGOPf4MROb91S3f3PIr07+VlBS9X2Hqw+58lwgCf9WAaSrxw83mg1PP7Vh0bDD6dJL
	 DOW35qjT0k9aKliLHNSL8SAutXMXO/oZ1qB0SbsqlRJ1x6dQKqtEqN3pw4KbxqCaNU
	 TwA+ypyWm0opQDg7B3lemf3c+x+5ysY+rGnWEatFXNGMWTSxNIr4nyQFk8Nr9Mf1pU
	 4fz5GCAcGFfjw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A527DE4D029;
	Thu, 29 Dec 2022 20:10:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 00/12] Allow calls in alternatives
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167234461766.21101.16212825923982543494.git-patchwork-notify@kernel.org>
Date: Thu, 29 Dec 2022 20:10:17 +0000
References: <20221223221332.4127602-1-heiko@sntech.de>
In-Reply-To: <20221223221332.4127602-1-heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, conor@kernel.org,
 philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
 emil.renner.berthing@canonical.com, jszhang@kernel.org,
 heiko.stuebner@vrull.eu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_121023_865325_D35CAD7F 
X-CRM114-Status: GOOD (  12.49  )
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

On Fri, 23 Dec 2022 23:13:20 +0100 you wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> This series is split out of my work on optimizing string functions
> and provides the basics to:
> 
> - actually allowing calls in alternatives
>   Function calls use auipc + jalr to reach those 32bit relative
>   addresses but when they're compiled the offset will be wrong
>   as alternatives live in a different section. So when the patch
>   gets applied the address will point to the wrong location.
> 
> [...]

Here is the summary with links:
  - [v5,01/12] RISC-V: fix funct4 definition for c.jalr in parse_asm.h
    https://git.kernel.org/riscv/c/a3775634f6da
  - [v5,02/12] RISC-V: add prefix to all constants/macros in parse_asm.h
    https://git.kernel.org/riscv/c/bf0cc402d7cd
  - [v5,03/12] RISC-V: detach funct-values from their offset
    https://git.kernel.org/riscv/c/33e41480b233
  - [v5,04/12] RISC-V: add ebreak instructions to definitions
    https://git.kernel.org/riscv/c/2621cac76f84
  - [v5,05/12] RISC-V: add auipc elements to parse_asm header
    https://git.kernel.org/riscv/c/cde4a69302a4
  - [v5,06/12] RISC-V: Move riscv_insn_is_* macros into a common header
    https://git.kernel.org/riscv/c/ec5f90877516
  - [v5,07/12] RISC-V: rename parse_asm.h to insn.h
    https://git.kernel.org/riscv/c/c9c1af3f186a
  - [v5,08/12] RISC-V: kprobes: use central defined funct3 constants
    https://git.kernel.org/riscv/c/debe28d0a52e
  - [v5,09/12] RISC-V: add U-type imm parsing to insn.h header
    https://git.kernel.org/riscv/c/8963d6224009
  - [v5,10/12] RISC-V: add rd reg parsing to insn.h header
    https://git.kernel.org/riscv/c/088ec01fce4e
  - [v5,11/12] RISC-V: add helpers for handling immediates in U-type and I-type pairs
    https://git.kernel.org/riscv/c/47f05757d3d8
  - [v5,12/12] RISC-V: fix auipc-jalr addresses in patched alternatives
    https://git.kernel.org/riscv/c/27c653c06505

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
