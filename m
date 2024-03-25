Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B3FC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 04:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTaW+cICoNg1W3kUQAL8Us4YjhnM5tfkQBRx6Oo0TlQ=; b=Ad8mMbdwJRGQ5I
	xCDY3CYyKY7YsTCLtm0tDYXDVYpW97qsNZq3Cfs2wY84FIkw4EnKSgRkfCM2i+UhuhYwrzW5eDGQZ
	Rp36Na1G8WU5zndKdKJwD5DEl/tSEc8I0jCyltd47oycVrvmIFl9JoQWSdJ6/v61Wjshgco94MDfq
	MO+/B1We8CdxA/pNyFfHDlC5V/m2G59AOobJHZ6umxMH+xm+uMbHLUxQkhhNxxz4KD1+HzHRh+m8K
	w+XPwLm8kaXArl7fGdfzEP9w379HDfD+B5+ZLtyzUTaiVmmPhniQ7Yv21fYK2xjs/CiINClYUA0ll
	mWyl1jw0bPamvYQ+GT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocAn-0000000FEI1-2fUl;
	Mon, 25 Mar 2024 04:43:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocAO-0000000FE4Y-2fs1
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 04:42:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52D9760DE1;
	Mon, 25 Mar 2024 04:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B04EBC433C7;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711341754;
	bh=P55e0YdHr3EBbeSfVcEWlMRwZEnp0BSXvLy/GhsoFmw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gkhhEapMgJhfVt+4ngHi5hJfu28kyDyu8exX07UCVkjOZS1ijZGamJNq3cK/0ow0q
	 aZ119Ybv/Lqh5GgFaBD0nQ0zAFQNc4GS6uupywX3Sp065WVt9qAve+UTRAMWGodDUL
	 FUrXOkUF2buJtldasEOiHKcXylWilsDPFGxx1ZFtu4o6VXhKJGJMZc4ea4VgWDnRDs
	 q0AoqAXJV5+s0jba/xzBOi5pslR8k96AhQme1LjUKg7c1TnPATglM1Pl6h5t1hIf7Q
	 GzXJOVA175jcv3FrGsF5THwZu/6BAWklYPRH5nP882M1GcjKKcB7OfJgDdHJDkr7Ne
	 C7YvcEVv8dHxw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 97DCED8BCE3;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] cache: ax45mp_cache: Align end size to cache boundary in
 ax45mp_dma_cache_wback()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171134175461.18749.5523574540547752067.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 04:42:34 +0000
References: <20240203212640.129797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240203212640.129797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-riscv@lists.infradead.org, geert+renesas@glider.be,
 conor@kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, pavel@denx.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_214236_906634_86D81284 
X-CRM114-Status: UNSURE (   7.33  )
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
by Conor Dooley <conor.dooley@microchip.com>:

On Sat,  3 Feb 2024 21:26:40 +0000 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Align the end size to cache boundary size in ax45mp_dma_cache_wback()
> callback likewise done in ax45mp_dma_cache_inv() callback.
> 
> Additionally return early in case of start == end.
> 
> [...]

Here is the summary with links:
  - cache: ax45mp_cache: Align end size to cache boundary in ax45mp_dma_cache_wback()
    https://git.kernel.org/riscv/c/9bd405c48b0a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
