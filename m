Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016ECC48BEB
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 19:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/P103PCCizsZePcuh1EJ5F9q8tZgwOs/XXB64ZnooSs=; b=3o/VVGR0JAbHa6
	XVxR8YCoT57Mob+F+qXdignNg/FxARWY5xcgy+wfm67JboB5rx2belDkGZkDv8FcciT7la8m9mY2H
	Ps/HRkSVPbMQsJvF68+qgughMmA4rvYySG2Mi0p38J6P8HQjMJW9e3mwdw2HsIbX8GaSWtCamsOHT
	qdCsQxmd8uXvnmOmpe53QkjQunJrsP+1WihLOC0EEH8hwlREs7UZSoDMdr8mX9MuyGD5yrXVZfFkz
	9XFkyFpiFqqpfFvIbMVvRgWYBvMxb62TC693+eVyg8bCFXp9SYvbDZ5qMhhuvSbh1ZX3OZaVLthep
	g1tbU3h4rbeW/moRqhdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcsbx-00000002N0c-2gJ5;
	Wed, 21 Feb 2024 19:50:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcsbu-00000002MzP-337S
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 19:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C65C76163D;
	Wed, 21 Feb 2024 19:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 687C1C43390;
	Wed, 21 Feb 2024 19:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708545029;
	bh=7Fv9UpJfx1rHXGyrBVOIkfBWNUxLkQgV7YhfSLbTmpg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ex9gPT2ScoKVKEavIEmFUPWMfyenO7aNFFNomGzvzBHB7fEfzvJ/R9DWViHY4OxmZ
	 uUIe15khQeUJJ0Gk7T3pr9qBrR+Q+1GRZc0KCagkAsxYE6tF5qrRXrugejqpL+4feU
	 wUXJUMWHBddvINHyJgm9XYJmBBdt6lj6F9VH3nXBzYVEPkzJjl9ztsazFgov3Fwdgr
	 tDaaQZu+WGEd47XiDAOJwhOHM/nSj93ULIyl5Rx5wsOz/LmbH5qjHM/1kH1X27fZmc
	 OOxuTHDE75Aun76PwEAIgCCea1UJoWSZ4wtUIi9k3ClSLn4nyEjhPbfbnAqEFjJMJM
	 LfUhSKq2V72YQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4B563D84BCB;
	Wed, 21 Feb 2024 19:50:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] tty: hvc: Don't enable the RISC-V SBI console by default
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170854502930.2044.11543238578824030795.git-patchwork-notify@kernel.org>
Date: Wed, 21 Feb 2024 19:50:29 +0000
References: <20240214153429.16484-2-palmer@rivosinc.com>
In-Reply-To: <20240214153429.16484-2-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, atishp@rivosinc.com, ajones@ventanamicro.com,
 apatel@ventanamicro.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, kernel@esmil.dk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_115030_832005_85145BCD 
X-CRM114-Status: UNSURE (   8.10  )
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

On Wed, 14 Feb 2024 07:34:30 -0800 you wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> The new SBI console has the same problem as the old one: there's only
> one shared backing hardware and no synchronization, so the two drivers
> end up stepping on each other.  This was the same issue the old SBI-0.1
> console drivers had, but that was disabled by default when SBI-0.1 was.
> 
> [...]

Here is the summary with links:
  - tty: hvc: Don't enable the RISC-V SBI console by default
    https://git.kernel.org/riscv/c/481860974faa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
