Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5353CC36002
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 03:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bL4vJaRGZTxcvX3XIqOXVihi18hng3q6TM8MyBod0k=; b=V9t7M+gvIVjyZ0
	P0XKqFEm576yYQMB8Yhfj6ZN/q9SyUGIChQcqoD+OPyXK240L5/2pYdoRKNZFkVyim5VU7or/tFvu
	SD1dtRWYBqBsP3D8LGdciIyzLfJ/D/WCucBHO9J9hD2QsSmZmCnrsaX1exdNXTe2Fv0Km6NdgWtMW
	kCMZ9lsrhDR+8D5b8IausV232ZWl6l86c4vYTvYHhPjUNjjvARgwUU1GiqCcmjmTXUmKyu0U0aAzO
	32jawxa0I+440UB5L9SMu+YKM6Ll0z6zgI63OoJ6IX5fxA+oPjpc7qlq2gElEL0V5BYpm5htsY2QF
	8CeAoI31/Q4R34UJcaaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqe-0000000A43S-2rtr;
	Thu, 27 Mar 2025 03:24:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqb-0000000A40H-0gRp
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E8D6843B0F;
	Thu, 27 Mar 2025 03:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF71C4CEDD;
	Thu, 27 Mar 2025 03:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045840;
	bh=jrul/zfoaRb2jAszBqreuW/8Vk1muV+ExaZ73kAeld4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=r9vD7TI51f0yo6lrT2GZXj2imJaYm/ctmNYRLlUY6ls0GYzGYCYzX8PhWFYSFYLwZ
	 TlJtf9dMJ+gwxH68kFCX1v8X4HHz/9o3PbJGBYnMXShnhVdA95lrK5+2/xWDj4VAqq
	 YLtzKmul08yYKlx/znerxolsj2d+X4HAhrEG4yCrhWU+dHbtkHgrcNzLFArNlUPNsM
	 4dYr0LnMoniGdVGDVeILxBzbdBBVY168V3mmlHozy9VlVJEfDjg7PDVZODBtZruyPX
	 XBwIxmNsEGUNeSPtY+/o2xzc8pSmTlOc537RmT8lrLlRaiUvGacEEh9NfnRRjS3vom
	 mZ3FUe3ezyv9A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD25380AAFD;
	Thu, 27 Mar 2025 03:24:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Support huge pfnmaps
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304587625.1549280.10388900723759268076.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:36 +0000
References: <20250108135700.2614848-1-abrestic@rivosinc.com>
In-Reply-To: <20250108135700.2614848-1-abrestic@rivosinc.com>
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 linux-kernel@vger.kernel.org, alexghiti@rivosinc.com, peterx@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_202401_240793_C4F8899C 
X-CRM114-Status: UNSURE (   8.92  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed,  8 Jan 2025 05:57:00 -0800 you wrote:
> Use RSW0 as the special bit for pmds and puds, just like for ptes.
> Also define the {pte,pmd,pud}_pgprot helpers which were previously
> missing and are needed for the follow_pfnmap APIs.
> 
> Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
> ---
>  arch/riscv/Kconfig               |  1 +
>  arch/riscv/include/asm/pgtable.h | 49 ++++++++++++++++++++++++++++++++
>  2 files changed, 50 insertions(+)

Here is the summary with links:
  - riscv: Support huge pfnmaps
    https://git.kernel.org/riscv/c/03dc00a2b678

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
