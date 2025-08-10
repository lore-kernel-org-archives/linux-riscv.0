Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3940C87FCF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Aug 2025 21:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0ZttAGzyNx2de3m5bWyL9hJ65HpPo4DQQ+f1jUzhgo=; b=fyoGHIHNBZepzT
	QPFV9N9afzrE1LsuDPBpfaqre+iDv4Vo5h8lepF8arvGH0VdNA+oBw1enI9mcwX80ppIjgH2EfTBt
	/FzS+47+Fqr2xtbmZ5HxdsFaxrGxbLgF/u4tpHrfwma7qVdhpVOIeK3vDmblTpp0wXhAM9ntiigKj
	t+ZAs+NbBBgmP2CnyDqycLbhxX3zGVOOMkkhdYpElae/a0zTaINzVLiMBwWI9ee6gOR/etHczIMYm
	I0hWCAGo+3fTAUtNZGHYxzBbb7Yj6/z0d7TYcX9s01FnNK91CSzeLMwHx1SSI0Vk87BaPjQ85lVnA
	Bu9kosSHccoVBxMmBClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDKq-00000005zXI-3JUm;
	Sun, 10 Aug 2025 21:12:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDKn-00000005zVf-1IcV
	for linux-riscv@lists.infradead.org;
	Sun, 10 Aug 2025 21:12:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38C9F45967;
	Sun, 10 Aug 2025 21:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE1BC4CEEB;
	Sun, 10 Aug 2025 21:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860324;
	bh=BQP2wrXvpvE0OkhTHqKiJnJxJCBhEsJDRIlvbTbLikQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NeloW0E7hGjIA3yR9ZXXKj3hjEdgWXGZL4XVmFahhuMH0lydRU7ex9OqRoMjCiHbc
	 aJcrXN5NB5fmsrBCIWi0Z+KAaLfgEkClOzZmOB0QHPYfuVBPRomoVmCCy0NKhOEoYc
	 c5enY2K9iKuvCrzMZuXdriDKlA0aCjfUYWZhO3em1hSW/rwlVOeZS0cJ5XzCkpKG2W
	 ekmXLR6pjY4W0r8NA82tvLDW/sfFudo7L47lmiUD8Olk5cXPwhIrj0PtHoE12Bi9LU
	 DnlAgHP3yelTJ4e+R4kvJ8MO41fIA1C4oo0NPHgEx9TMl0fTetvPX7O6voVbgLWfTb
	 IoZ3UveYGt/4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADC439D0C2B;
	Sun, 10 Aug 2025 21:12:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4] irqchip/riscv-imsic: Add kernel parameter to disable
 IPIs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486033674.1221929.9986171280702761593.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:16 +0000
References: <20250716123745.557585-1-apatel@ventanamicro.com>
In-Reply-To: <20250716123745.557585-1-apatel@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, tglx@linutronix.de,
 anup@brainfault.org, atish.patra@linux.dev, palmer@dabbelt.com,
 paul.walmsley@sifive.com, alex@ghiti.fr, ajones@ventanamicro.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_141205_373323_C7437625 
X-CRM114-Status: GOOD (  12.43  )
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
by Thomas Gleixner <tglx@linutronix.de>:

On Wed, 16 Jul 2025 18:07:45 +0530 you wrote:
> When injecting IPIs to a set of harts, the IMSIC IPI support will do
> a separate MMIO write to the SETIPNUM_LE register of each target hart.
> This means on a platform where IMSIC is trap-n-emulated, there will be
> N MMIO traps when injecting IPI to N target harts hence IMSIC IPIs will
> be slow on such platform compared to the SBI IPI extension.
> 
> Unfortunately, there is no DT, ACPI, or any other way of discovering
> whether the underlying IMSIC is trap-n-emulated. Using MMIO write to
> the SETIPNUM_LE register for injecting IPI is purely a software choice
> in the IMSIC driver hence add a kernel parameter to allow users disable
> IMSIC IPIs on platforms with trap-n-emulated IMSIC.
> 
> [...]

Here is the summary with links:
  - [v4] irqchip/riscv-imsic: Add kernel parameter to disable IPIs
    https://git.kernel.org/riscv/c/ea92b6046d35

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
