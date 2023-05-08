Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B340C77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 14:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PzGZfBUN6zCUwBohEfv7Td6KCzmvZ8tCUkgRHKX/sKU=; b=JsZUy1d++S/y34
	tLifDdewxeUILKDxcKx2oxpgO3VS58opxymaN/DFCU+k3F0ujB5RgbWmI1xqJychCHnMr0HowtxRU
	c3Wlbw/cBd1OsPNdzPxWubQv0EOmB/feRAt0T2KXhn4dOI4h3IBImMeIsUVnVTpe7KAcuhY5mX2hv
	1VK297eFz5sPuBxPeXmsRs0agrIqRELX74P7hziZDGBirSKjpJ0341IppZMMeqarvXdQTszMMDFqC
	Ylkx3oz10n5eGrA7KQGgRLfpUby4Hxc6zpGNVf55JfvDS2KQD9uTKopIn55GOedrLnVOzFTx8J9F1
	mFb8Wg21R7zdP2yuYFSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw23w-000mZ1-2h;
	Mon, 08 May 2023 14:42:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw23q-000mV0-2B
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 14:42:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 97651640DC;
	Mon,  8 May 2023 14:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69FA2C4331D;
	Mon,  8 May 2023 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683556916;
	bh=MrdCpjU5cKRZ+iOA16YP4qYRYpFPsfYgs180muKVh7I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=k4QlnF2U2dcoBqTj74KrZ25LExHhiKev2gieWJ+s7h2X/LrnG2/xSkOrpXosRsZlr
	 JJaPbd63AE4Y2S4RWT5gHOcrMNopQUgzA6AtCyUYMD61FgfNYWMN8fvM2MPcBN8upb
	 cMKuA3fiUopDvKwJReqNyqCIRLPEqNr7AKsEv6/2uvtVXx00V9g4oJPUZp1vrBgqob
	 X8+VRIlpXktuamOlqb5e3MewEZGH3nqfdQvmWorhuq3DIgHKZHQRZJhisbhmlqY4TI
	 V+XNzRVZ3xe8O87ji12B0SVm7EPl8FqtTduH7pfOUlnlE0VZAFqQtmm4idepEzmcP/
	 O1bUK/fH/qYGw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 44A7BE4F0A0;
	Mon,  8 May 2023 14:41:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v18 0/7] RISC-V IPI Improvements
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168355691627.25692.3962222758677102007.git-patchwork-notify@kernel.org>
Date: Mon, 08 May 2023 14:41:56 +0000
References: <20230328035223.1480939-1-apatel@ventanamicro.com>
In-Reply-To: <20230328035223.1480939-1-apatel@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, tglx@linutronix.de, maz@kernel.org,
 daniel.lezcano@linaro.org, atishp@atishpatra.org, Alistair.Francis@wdc.com,
 anup@brainfault.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_074158_756113_F3E03E2A 
X-CRM114-Status: GOOD (  10.52  )
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

This series was applied to riscv/linux.git (fixes)
by Marc Zyngier <maz@kernel.org>:

On Tue, 28 Mar 2023 09:22:16 +0530 you wrote:
> This series aims to improve IPI support in Linux RISC-V in following ways:
>  1) Treat IPIs as normal per-CPU interrupts instead of having custom RISC-V
>     specific hooks. This also makes Linux RISC-V IPI support aligned with
>     other architectures.
>  2) Remote TLB flushes and icache flushes should prefer local IPIs instead
>     of SBI calls whenever we have specialized hardware (such as RISC-V AIA
>     IMSIC and RISC-V SWI) which allows S-mode software to directly inject
>     IPIs without any assistance from M-mode runtime firmware.
> 
> [...]

Here is the summary with links:
  - [v18,1/7] RISC-V: Clear SIP bit only when using SBI IPI operations
    https://git.kernel.org/riscv/c/3ee92565b83e
  - [v18,2/7] irqchip/riscv-intc: Allow drivers to directly discover INTC hwnode
    https://git.kernel.org/riscv/c/0c60a31ce62c
  - [v18,3/7] RISC-V: Treat IPIs as normal Linux IRQs
    https://git.kernel.org/riscv/c/832f15f42646
  - [v18,4/7] RISC-V: Allow marking IPIs as suitable for remote FENCEs
    https://git.kernel.org/riscv/c/fb0f3d281b7f
  - [v18,5/7] RISC-V: Use IPIs for remote TLB flush when possible
    https://git.kernel.org/riscv/c/18d2199d8105
  - [v18,6/7] RISC-V: Use IPIs for remote icache flush when possible
    https://git.kernel.org/riscv/c/627922843235
  - [v18,7/7] irqchip/riscv-intc: Add empty irq_eoi() for chained irq handlers
    https://git.kernel.org/riscv/c/f8415f2def18

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
