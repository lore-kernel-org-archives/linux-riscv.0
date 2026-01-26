Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AB2C88E42
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 04:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lrQQj7RmkRXXBnXyr73owI0tL2j0l6dedALLFLiFb3Q=; b=1VRdYJgR5Bzrzv
	1YPpaPe71Y9vuPSIlswmhZxnVIp8Ok2peoEGtpHSiOqXoP2W4QhdKgLDUUCjEjRhZ/2JX++kkjFuy
	H3T+iVzXZac/bVBr8pVFXprDasDTeGBWR2JRmXFDDdyCySx9gix1WenIQGzKI4w9Bk1KOJD1hue5y
	73EgGgK5LvvZq+N8bshI9/Sy38wPMWALRSPZfQX/GciQCknwLVUyrenNR1gZBJFFx0Ib+S8wVvn7b
	E5c5Xm6xPZRcrX1hVh/yf+FdIZlOLK3NE15cl7Dk/D/P8Z5zqe3HNVleJvWYyHozF8uIrX6KvKrH1
	N4AxLpqGypaCQqShGvsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE9j-0000000BtMB-0ECJ;
	Mon, 26 Jan 2026 04:24:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE9h-0000000BtLy-07ZG
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 04:24:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 25B09600C3;
	Mon, 26 Jan 2026 04:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27EAC116C6;
	Mon, 26 Jan 2026 04:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769401487;
	bh=JSejbYgtiqeN+MKAs0kx7DLRclH8e3koxThdNwQ0AYo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=n/R2ykchlnfACcKLv1Dg0VYPM5FR7BG4Z8BBKi1+gZU9W4OkFkLdMp5kmMVUyUBzP
	 03EyW20SwRiXBdf9YLvNcozzSBdx6dqhvwhTvMfdra8/vosRWylxGjY0rCNWd74fW9
	 DkYHRDfuVyRYoBXCK1Y7/5FZqEfjWHLY27DiIiPg5lo9qNfUsoIaLEkHalRuOUeeeO
	 YcB+PTuTIouCiNkJJu02GMf6GhOACcNzUncweLAmhjcoxV6nqR+FDWxwsTnDj02w6j
	 cQpVxCfoNYTo7/NjraVtZ4yrFyeTzh0CjeIe750SmVqfgZSyw37P8mlhOw0Krl1TyE
	 obrcutFFIlUOQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8D633809A22;
	Mon, 26 Jan 2026 04:24:43 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V updates for v6.19-rc7
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176940148235.4057692.2736512531319710578.git-patchwork-notify@kernel.org>
Date: Mon, 26 Jan 2026 04:24:42 +0000
References: <081aefd5-d47d-8397-693a-3e0a3c73783e@kernel.org>
In-Reply-To: <081aefd5-d47d-8397-693a-3e0a3c73783e@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
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

This pull request was applied to riscv/linux.git (for-next)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Sat, 24 Jan 2026 16:21:29 -0700 (MST) you wrote:
> Linus,
> 
> Please pull these RISC-V fixes for v6.19-rc7.
> 
> The notable changes here are the three RISC-V timer compare register
> update sequence patches.  These only apply to RV32 systems and are related
> to the 64-bit timer compare value being split across two separate 32-bit
> registers.  We weren't using the appropriate three-write sequence,
> documented in the RISC-V ISA specifications, to avoid spurious timer
> interrupts during the update sequence; so, these patches now use the
> recommended sequence.  This doesn't affect 64-bit RISC-V systems, since
> the timer compare value fits inside a single register and can be updated
> with a single write.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V updates for v6.19-rc7
    https://git.kernel.org/riscv/c/d91a46d6805a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
