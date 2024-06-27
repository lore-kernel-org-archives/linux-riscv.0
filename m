Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55FEC2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 17:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L7Y7VrfGHy3u475MNpljHKtA24OZVLMjQhorwpXVhc0=; b=rGGTfFx76YLXdX
	NIo0h8c6I32IGKlM9qLDXcCjxr8tL7uUx0Emo2OiGm/5Ft5fDAMzqzst8O5HuudF2GobdtXx76rsT
	IS+hoAuFb6O6WkgI8GY5J5Y4TmFfMQ8LeDFW0DXrVWKNG9xXaHEmIQBAYQ40RtRAe5CrkgmwgvxY3
	YhTHgTaDUZlQbV833T3dFPBB52l7sMVScfuxSxARMFymGol2os0ikEiPlI78LV4gBminoAfqzB13O
	VSmHCjEq9zUizJxlzqUGMNe3vYQ9JXrOx2l7fHiJ770W/e6gkWtSGOqCwqWnjSJlO0h5wEnIoYRcI
	DcNWrxuVkeRTUjeP4UgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtGl-0000000BIGE-3fxU;
	Thu, 27 Jun 2024 17:50:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtGi-0000000BIFN-2rrN
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 17:50:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3979761F64;
	Thu, 27 Jun 2024 17:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9C73C2BD10;
	Thu, 27 Jun 2024 17:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719510644;
	bh=jobjg9OesfGn+Q6aCcAWa0Gq/nbPQMb6sNYVq2ittnQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hdJ64EEnw+ocdIPgMBxcSO0LRAqr3vLx2l2KCjZ/B2DT3wUoG2gUMypr0XRKZ498Z
	 ozdCKPuHPsG4WZxp271//HfptbaNG6sZeOSfthkltOYB6cZ8VOSS5sW4KHFxUEOfUs
	 HWpo8zwgK3YGwaMwQVVinVXFUE0aTG90dUgpaR16LAFXjSFV0FgaNI7UJJTAWP+6US
	 0oPFyIm6WzdMTzww8Z3IYDreBK+N73/6yfjb/ziPxcaMRtZKIFvBZRuELaDKRmHw8U
	 tCkK4JWLFIaUBjXqVM3jLjIkaNrmE+7CZ0WgOtitDuYYovApX074XBVIgDSePuuc2x
	 hJWL3H9VhXwwQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8ED99C433A2;
	Thu, 27 Jun 2024 17:50:44 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: patch: Flush the icache right after patching to
 avoid illegal insns
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171951064458.6762.1867426653510240080.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 17:50:44 +0000
References: <20240624082141.153871-1-alexghiti@rivosinc.com>
In-Reply-To: <20240624082141.153871-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, rostedt@goodmis.org, mhiramat@kernel.org,
 mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, bjorn@rivosinc.com, andy.chiu@sifive.com,
 puranjay12@gmail.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_105048_806696_2D40E2B7 
X-CRM114-Status: UNSURE (   8.09  )
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

On Mon, 24 Jun 2024 10:21:41 +0200 you wrote:
> We cannot delay the icache flush after patching some functions as we may
> have patched a function that will get called before the icache flush.
> 
> The only way to completely avoid such scenario is by flushing the icache
> as soon as we patch a function. This will probably be costly as we don't
> batch the icache maintenance anymore.
> 
> [...]

Here is the summary with links:
  - [-fixes] riscv: patch: Flush the icache right after patching to avoid illegal insns
    https://git.kernel.org/riscv/c/edf2d546bfd6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
