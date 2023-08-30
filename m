Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0CAC83F01
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 20:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8V2iwWqD2p3xPTarOXMBg6VaBIfg94+gntKLLo3KqB0=; b=WrocOsWim08Yd7
	sDy8nRnnBbvojB6oPhs9HRnTOua/9uc8L9C0t9EkjSc6iGRYkEGtxeMtTVV6RA5OIkM/72ery7Mm9
	oTtKO4GxLyJ+v1QO2QOg7G/1dY+VWN7osmFkOw1A/y2QsSYHPXnAlFYkcQi/86dKO3V7UhWwUjy13
	jSTrlK4GPLnj+I8KvZgcRnlcVEqhnhjhCsVTvjDeD98zDTTPqizjgONrgkeamKnTY3+HpQtDO9kzK
	P282dU10jrRKY+BTgzCk7tEmecim/WiuMlmE6XzpZP/PxPzD7FZmtURAobvVM7oqr6wNT9HRwswvh
	a9L+YYt0gXY211yJk6jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbRps-00E8hg-38;
	Wed, 30 Aug 2023 20:30:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbRpj-00E8c7-3A
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 20:30:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 5220CCE1F14;
	Wed, 30 Aug 2023 20:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D765C433CA;
	Wed, 30 Aug 2023 20:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693427428;
	bh=naBzhvIky8R5V5XX3mGlkvV2k61SZTHNrCvojqQlDeU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=otw5gKsqhj7UlV+5SrWtGY4wxTV4EN0qiJQNgtrYTLUtrVL6FT+2KE0l9FBygwE3d
	 pXd9euQ9iheFeLxPUKAy0JMLBqm94Rfha6YW6pwGXTXCoX22Q6PqzIfUdD9oIBT0go
	 St2lEdowpUMBLc+yx2FsHho7GB2AaBdywuEJwg2eyeGcviOFPgmSFOzYYnhW8r/tmY
	 MlPJEZ+zg4O89EzFIeZwqt5iKkHCOK2U2ugEzoEYg9t+eZ0/XGPCrXl6fvetrNKvjh
	 C3GCPbZmekJtm/AbTaB+xUHCFhaoW/kxu2twdBu/qisRAr6fP5J6zwZQQeD20CiMgG
	 L3GZbLgKTpmNg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 76D63E4509F;
	Wed, 30 Aug 2023 20:30:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/3] riscv: dma-mapping: unify support for cache flushes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169342742848.1913.1099836362504771690.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 20:30:28 +0000
References: <20230816232336.164413-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230816232336.164413-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-riscv@lists.infradead.org, arnd@arndb.de, hch@lst.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 conor.dooley@microchip.com, apatel@ventanamicro.com, ajones@ventanamicro.com,
 jszhang@kernel.org, linux-kernel@vger.kernel.org, geert+renesas@glider.be,
 samuel@sholland.org, linux-renesas-soc@vger.kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_133036_216766_4666AD91 
X-CRM114-Status: UNSURE (   9.97  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 17 Aug 2023 00:23:33 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> This patch series is a subset from Arnd's original series [0]. Ive just
> picked up the bits required for RISC-V unification of cache flushing.
> Remaining patches from the series [0] will be taken care by Arnd soon.
> 
> Cheers,
> Prabhakar
> 
> [...]

Here is the summary with links:
  - [v3,1/3] riscv: dma-mapping: only invalidate after DMA, not flush
    https://git.kernel.org/riscv/c/fbfc740ced8f
  - [v3,2/3] riscv: dma-mapping: skip invalidation before bidirectional DMA
    https://git.kernel.org/riscv/c/14be7c16d420
  - [v3,3/3] riscv: dma-mapping: switch over to generic implementation
    https://git.kernel.org/riscv/c/eb76e5111881

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
