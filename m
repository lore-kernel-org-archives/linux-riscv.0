Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47524C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 15:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nMThyVmSTKahHZuCiC8EDV0FMyxi38DicD/yIhlCX78=; b=rx1+ka7IGpXvIJ
	a7lYOX4OUnHMycEyAJMHCPoleEL6r2c1kMn3wMA/pGc+53C/Q7rp81qbSOuRXiY315C7xLhfAo7Y1
	YcG5fRlhqSKQ7zaG2JWfmrYYyvj3uvQTysfPuBLR1dx0e+9oiifWyd+9sjTxcupBluKOgd44yZ310
	EQDHTXIP1CUZ5/eOq0mlRMWCa5SZcmh5H/JKyDeLZnKMMVcJA8tf9pxG5uW7Dxf83Cmye94dRAveN
	cEpvymOeiqhDgoTaXxP8jNzZ4QuNlcIj4roppoZeqO84MjTxRtFrmIn6ah+J1vNtoaECzLoq2aKtl
	Lnag8tRoaFdhU44sMNTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kCJ-0049XX-38;
	Wed, 08 Nov 2023 15:10:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kCH-0049Vt-2T
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 15:10:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 422C7B81CCA;
	Wed,  8 Nov 2023 15:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5DA3C433CA;
	Wed,  8 Nov 2023 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699456223;
	bh=oQac4ytsXxjGUJgHSugPUM3y+/gbEwAWXC3i0KndA3Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=i0ypI6Q1E7YrrQ7YYhPCvTGyri+yjvYbtoKfO5nmptjJ+A/U/+X81+fo1eYp2ZzTq
	 2heMsHsJ6ni62iABJEyUXnnChn3TylqvBpdLFfqCt5UQBGXpjQwvO3tgCz+lgFHm+o
	 FEwJ3USFsl4A0clmiWGQ5zrO/GFaMB3vIU1cEmvJBQziqvCbu0iIHLjYR3pNeE7xuU
	 zuMUOgbM6BvkAIFYu5MRn5SJJGGFyGxrv9CY+L9Jm9Ajoc3eqTInvgbojY72iI5FgN
	 QKsaRMbHIzkdE4Gas/wcO7MMOvraWPOX8X3EEEs4r5dWG8vhNFnvLY9gEvs9YdlZnk
	 ArvJUwDCnS2Yg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C8F0AE00081;
	Wed,  8 Nov 2023 15:10:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169945622381.21527.13453670582776610843.git-patchwork-notify@kernel.org>
Date: Wed, 08 Nov 2023 15:10:23 +0000
References: <20231106232439.3176268-1-evan@rivosinc.com>
In-Reply-To: <20231106232439.3176268-1-evan@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com,
 aou@eecs.berkeley.edu, heiko@sntech.de, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 conor.dooley@microchip.com, palmer@dabbelt.com, bagasdotme@gmail.com,
 paul.walmsley@sifive.com, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_071025_938483_0DE350C6 
X-CRM114-Status: GOOD (  10.99  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon,  6 Nov 2023 15:24:39 -0800 you wrote:
> In /proc/cpuinfo, most of the information we show for each processor is
> specific to that hart: marchid, mvendorid, mimpid, processor, hart,
> compatible, and the mmu size. But the ISA string gets filtered through a
> lowest common denominator mask, so that if one CPU is missing an ISA
> extension, no CPUs will show it.
> 
> Now that we track the ISA extensions for each hart, let's report ISA
> extension info accurately per-hart in /proc/cpuinfo. We cannot change
> the "isa:" line, as usermode may be relying on that line to show only
> the common set of extensions supported across all harts. Add a new "hart
> isa" line instead, which reports the true set of extensions for that
> hart.
> 
> [...]

Here is the summary with links:
  - [v6] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
    https://git.kernel.org/riscv/c/d3d2cf1acab1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
