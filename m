Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BACEB8FAF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 02:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hg/nWl1eo2Zi2zHA4mNQK4zIfX1otmcs+4LNgg9OB8s=; b=eO9dNh5L90SKjv
	gsqEELAUidDo+RI69vnRXmfneV4HCzpESrGjXpTCj/HtLS781S/30IAI5ODWYsBYx2f7dh2QCommU
	1wHyLo3JE0ds04KmZOf7zHTP4DBdx2kzLR0qdvP1N0YILnw+ImLCX1tGQZY+ipXFYytIrSB3wvE0D
	eIgYmBdzOSR0OQsAXJQ2njxHEG6YFAf5kuFAEONWvGeAls6N1Eq8SY9HxCGjq6iKS565eP3ryJKxF
	geCQuA7C+JL8OE7mMWEjjDLlth9I9DigAK78fzGJ9yNfRxhTEX0h7ylTyHbqC0tovtbBjV6dZjSAL
	yzjIRIqkxIrBj3he7caA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdicp-0076HU-0N;
	Wed, 06 Sep 2023 02:50:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdicj-0076DD-2L
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 02:50:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 7B7ECCE131C;
	Wed,  6 Sep 2023 02:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A95FDC433CC;
	Wed,  6 Sep 2023 02:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693968627;
	bh=ILSvwMruJUXo2rVVy7tXKVYMGbWXBmCSzIYmdJYWvVM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E4kmgfxza+9BtJJ894gdA6dh04H5baGcytpaFT8cftFVz9dSAYkyfh1A2AJ+JXhAe
	 CnrRuDFFHGydGwc5JqeZBmgOlyaNaMTIIlw858GCMC8aaApsgDJQZdE2SL5eSVkile
	 wqCXurAPNs1t/LPXby0pGCUktG0+BQRpCaO81jACJecvVTgrZvDD/gSk92WrL7YTA5
	 cMzHOfZvDx8AY7IYLm9XERIxAeDgV1LJi5Wiw28/zoqGW11W9ENKdpshT74k0tNQXf
	 m8KU5VxmMFL5POkupU4qOnIZcOf9VZdXPqgCNbnBE9oWfL6+7BJKIYP7adz4nihLBL
	 dkVzsKJmqtUFg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8D667C64457;
	Wed,  6 Sep 2023 02:50:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Kconfig: Select DMA_DIRECT_REMAP only if MMU is
 enabled
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169396862757.1987.12974306304797774698.git-patchwork-notify@kernel.org>
Date: Wed, 06 Sep 2023 02:50:27 +0000
References: <20230901105111.311200-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230901105111.311200-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 geert+renesas@glider.be, linux-kernel@vger.kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_195033_942454_5C45D1A6 
X-CRM114-Status: UNSURE (   8.85  )
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

On Fri,  1 Sep 2023 11:51:11 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> kernel/dma/mapping.c has its use of pgprot_dmacoherent() inside
> an #ifdef CONFIG_MMU block. kernel/dma/pool.c has its use of
> pgprot_dmacoherent() inside an #ifdef CONFIG_DMA_DIRECT_REMAP block.
> So select DMA_DIRECT_REMAP only if MMU is enabled for RISCV_DMA_NONCOHERENT
> config.
> 
> [...]

Here is the summary with links:
  - riscv: Kconfig: Select DMA_DIRECT_REMAP only if MMU is enabled
    https://git.kernel.org/riscv/c/5bf68a586ff4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
