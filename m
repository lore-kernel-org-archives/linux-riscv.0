Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA252C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 03:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6l3D0kCGR8+n8ttt1ojBxhHaILsTeYsbBmaIrSQ6Yuc=; b=ljMAJQLT96Ajw+
	8w3Yl25cXnoZvBwdTbhdZzLqssOLDenVzqVmmQPDAvJaZf8dH6cljgaH2oolwZRRjSRbsO9jE9s1O
	0e1iESp1RjZDgKm+xeppFR2sikxNLVYGxFX2kKf+l8zdOUgI2MO5S8AXmta8rgMST9HaY5tXMiBGQ
	1p6Fc5mK5P7Ojm7PrPjWqiF0QMgeD0zBx3vKOHl1ZVzB6tIk1UjqaHdbqYykDMrysTSeOPio3Qh1M
	ooqvyFUWZ3Ct0Pb1GlRa5qKN6QK644anEb/s9PGak2FH/Daxhel82K86bPsZvBC4qMFMCT9qDQ73l
	O4yZICubUClBfITp/Wiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKWnw-005xCj-K0; Wed, 25 Jan 2023 03:50:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKWnm-005x3w-01
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 03:50:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 55A27B81890;
	Wed, 25 Jan 2023 03:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FAF9C433A1;
	Wed, 25 Jan 2023 03:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674618619;
	bh=i/bkpKvy3q/K0aAj4KE7PoBs2FWi3yn02zTHdnufl7o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZLRPUPO89lmcaEjuIUerqALNXH2dUcmRj3dhUw0se3xloZK3sUrsCsWbAPw/h8fz1
	 ZzbzDOvtDIqe97ZLOpLDLmK5hT2p2OUmatJRRY375LjDMbju354wcEvXgPYfsclfBY
	 w3bbHebH/TogBWEaewO2FGWL/kLtdajwBk7R/jCYugoxyKckhGQSTLvP+Jm4JHGb+a
	 /dFOF95L0q7CrNiBb0DSUVS4U/42KCVaFnQK0EfrRznujDOwtSs40HjKRnLT3pnr9o
	 585lrbs/fajJ/gKYnHG6FlOPLr1hsITR11P0xx2X5+yo0HIExnRWMd2MDJssIgtB9I
	 KJJAKAQHy2raw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E4551F83ED6;
	Wed, 25 Jan 2023 03:50:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Kconfig: Remove trailing whitespace
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167461861893.411.18196774626130709655.git-patchwork-notify@kernel.org>
Date: Wed, 25 Jan 2023 03:50:18 +0000
References: <080aa959266ad842a8e7efca7111f1350c6a065a.1673424858.git.geert+renesas@glider.be>
In-Reply-To: <080aa959266ad842a8e7efca7111f1350c6a065a.1673424858.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_195022_236557_4D6434C4 
X-CRM114-Status: UNSURE (   9.19  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 11 Jan 2023 09:15:33 +0100 you wrote:
> Remove trailing whitespace that hurts my eyes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> FWIW
> Fixes: 444c3dbdabd46819 ("RISC-V: introduce ARCH_FOO kconfig aliases for SOC_FOO symbols")
> 
> [...]

Here is the summary with links:
  - RISC-V: Kconfig: Remove trailing whitespace
    https://git.kernel.org/riscv/c/451fb217cdca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
