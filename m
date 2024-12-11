Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78008E7717D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 23:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tiQQqPTg96Gn6SKKew4bzAv7LAUB7j94bGcWjFRM6co=; b=A87ABr2isNEF52
	Ps9BJdQoHcJZs3/FhTEoMEiDxd4pkqKtr0z+12CsXUo/+1KNjP+KeAK9k+kI0wmzcLLfErsE07i1f
	iILgvShsRFBYLhY/Cw8bqU+Uplaw/DOjV4IjeYe+VJ4TtKoAdjm9rJOxzF/NB2bo/VefMqQVVMZ4J
	mDaD0zXt4Unyu1bnzGPeCRRDZU2jALHK+lESdu7r25+TaUnCAZvp1Xd1W9KhYLvTprElpR3nb9YYa
	JbDpX+UD3T1xcsCxdj42QimFp4tJ8deMP8+i9V6FIBejkWVSuB43poLVKWoHBwfE6vyUxoKeozOW2
	pJxurkoJ7FRVoEa/0M6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWOk-0000000GWwE-1cUj;
	Wed, 11 Dec 2024 23:45:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGS-0000000GKwS-0aFa
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:33:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EA0D9A41797;
	Wed, 11 Dec 2024 22:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66C0C4CED2;
	Wed, 11 Dec 2024 22:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956382;
	bh=+zX0j0yQ/dPDZSP+fxyWSJqlH6s+OGzUjy0SbKMkGbU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Fv6EdEzjB+ClZcT5XXjvvL8R0qv9cVp4ruaqWJxXtGOWOcQoyGEAS8Pb/H+3Jt3Z8
	 KS5bIikbe3isnz/XHY/2K4rXXYGxp0UUgbbWlxBY57leO+Wxb6/a1aYcLXfNj0z8/G
	 K14p1/SKCguldWlMFtdGjjRCJc1I5RMUJxdJ1lEa3XO093kMbPhVJd8KNizgw4DYBS
	 tYQXl5vIBfwrXmJgQh6/OMVKXbTltBhmxwSafjmpNN4wH/0IHTB6/ziLkhvj6ud/Wu
	 /x5zwr5BkQjmS1JGI5sgZViQu4FPRLcunVzHTjM3akGC564AW19Zw9lQihXS/uqVaE
	 o180AvbEFjG3w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C2C380A965;
	Wed, 11 Dec 2024 22:33:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] dma-mapping: Save base/size instead of pointer to shared DMA
 pool
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395639900.1729195.15505065425946747500.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:19 +0000
References: <f8cef6845a6141f0277e31a71fe153612daae776.1731436631.git.geert+renesas@glider.be>
In-Reply-To: <f8cef6845a6141f0277e31a71fe153612daae776.1731436631.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-riscv@lists.infradead.org, quic_obabatun@quicinc.com,
 robh@kernel.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
 iommu@lists.linux.dev, linux-renesas-soc@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143304_241834_938A8517 
X-CRM114-Status: UNSURE (   7.83  )
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
by Christoph Hellwig <hch@lst.de>:

On Tue, 12 Nov 2024 19:39:37 +0100 you wrote:
> On RZ/Five, which is non-coherent, and uses CONFIG_DMA_GLOBAL_POOL=y:
> 
>     Oops - store (or AMO) access fault [#1]
>     CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 6.12.0-rc1-00015-g8a6e02d0c00e #201
>     Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
>     epc : __memset+0x60/0x100
>      ra : __dma_alloc_from_coherent+0x150/0x17a
>     epc : ffffffff8062d2bc ra : ffffffff80053a94 sp : ffffffc60000ba20
>      gp : ffffffff812e9938 tp : ffffffd601920000 t0 : ffffffc6000d0000
>      t1 : 0000000000000000 t2 : ffffffffe9600000 s0 : ffffffc60000baa0
>      s1 : ffffffc6000d0000 a0 : ffffffc6000d0000 a1 : 0000000000000000
>      a2 : 0000000000001000 a3 : ffffffc6000d1000 a4 : 0000000000000000
>      a5 : 0000000000000000 a6 : ffffffd601adacc0 a7 : ffffffd601a841a8
>      s2 : ffffffd6018573c0 s3 : 0000000000001000 s4 : ffffffd6019541e0
>      s5 : 0000000200000022 s6 : ffffffd6018f8410 s7 : ffffffd6018573e8
>      s8 : 0000000000000001 s9 : 0000000000000001 s10: 0000000000000010
>      s11: 0000000000000000 t3 : 0000000000000000 t4 : ffffffffdefe62d1
>      t5 : 000000001cd6a3a9 t6 : ffffffd601b2aad6
>     status: 0000000200000120 badaddr: ffffffc6000d0000 cause: 0000000000000007
>     [<ffffffff8062d2bc>] __memset+0x60/0x100
>     [<ffffffff80053e1a>] dma_alloc_from_global_coherent+0x1c/0x28
>     [<ffffffff80053056>] dma_direct_alloc+0x98/0x112
>     [<ffffffff8005238c>] dma_alloc_attrs+0x78/0x86
>     [<ffffffff8035fdb4>] rz_dmac_probe+0x3f6/0x50a
>     [<ffffffff803a0694>] platform_probe+0x4c/0x8a
> 
> [...]

Here is the summary with links:
  - dma-mapping: Save base/size instead of pointer to shared DMA pool
    https://git.kernel.org/riscv/c/22293c33738c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
