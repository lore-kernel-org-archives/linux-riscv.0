Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995C0EE57D4
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Dec 2025 03:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVRtJdyzFI2PF2gabrOGagBbOuRkCc0J4Rhhw6t+xAw=; b=erSwUJZmC9dD6i
	w/sXHyzHIt9Y6rZlHnQKffKJ8dDtMQbM/SFZQ+deN+MFzhsxaiQ4bQX9+hJh2nG4mWZkci7mjfsAp
	SRYR0ypY5GYHjaGQxr1Wipkzze5sh3cAh6L21+jL5B2g+Cc/Q8jwcIVJH6iI45oeAvoNQzZjeM+n2
	Nq5XsmKUPoo2kg58X06GphraUqDkXxT4CSgiXSBzTMsolYXmv6+gZqABvpXZu/xUjLlzwcgKSd5kU
	EBsw/jTs2kdMF7JBWKqGt8lMrJFdTBkzT3FMODOJopCt8aiblSULzWz868Z0ZHHvsAuwci46pwo3b
	XZCLBcqHoANaiKZK4RPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamzI-00000005e6n-0S1Y;
	Wed, 31 Dec 2025 03:35:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamzD-00000005e58-2hRq
	for linux-riscv@lists.infradead.org;
	Wed, 31 Dec 2025 03:34:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A82C6001D;
	Wed, 31 Dec 2025 03:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A1AC19424;
	Wed, 31 Dec 2025 03:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767152098;
	bh=wMapKXQxs3IuueqfkTSrLzDMHhmsN1W0FcyCdy9SBSU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cgYukuRaoC1zpC2ya1upwuEzI2oYNI2hpRPh6GfLJF0M8c8ZFmDY/Pg7tY+Pb2ufL
	 VeFXt0b4o6Tb0fB5jvlIz2nCQSAZHRVkR2lPwbfjzxtyUrpntWZqhtgwdKO7C+mI1v
	 mqzj51zfKZM7GqTeVrcAtlBI2iVRg5id/Hlb/hk/iGaRhVPONn531q6yx32p8cPzgk
	 +nXXdcAR4OuBCEkeh7Ub2wyNUWxsPl5DyFqZp66fEyQtUycM4k9yvydD1JbYjR8rBp
	 b5atk6vBwsT89AxCKpqFxplO4J0GEDKno78mL0fefm2fLMjwp9uX0xwmHHMNElxX3c
	 fGYhBOtc2pzKg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B596A3809A19;
	Wed, 31 Dec 2025 03:31:41 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] spi: mpfs: Fix an error handling path in mpfs_spi_probe()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176715190027.3416240.12168423155631763881.git-patchwork-notify@kernel.org>
Date: Wed, 31 Dec 2025 03:31:40 +0000
References: <eb35f168517cc402ef7e78f26da02863e2f45c03.1765612110.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <eb35f168517cc402ef7e78f26da02863e2f45c03.1765612110.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 daire.mcnamara@microchip.com, broonie@kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-spi@vger.kernel.org
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
by Mark Brown <broonie@kernel.org>:

On Sat, 13 Dec 2025 08:48:51 +0100 you wrote:
> mpfs_spi_init() calls mpfs_spi_enable_ints(), so mpfs_spi_disable_ints()
> should be called if an error occurs after calling mpfs_spi_init(), as
> already done in the remove function.
> 
> Fixes: 9ac8d17694b6 ("spi: add support for microchip fpga spi controllers")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> [...]

Here is the summary with links:
  - spi: mpfs: Fix an error handling path in mpfs_spi_probe()
    https://git.kernel.org/riscv/c/a8a313612af7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
