Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADE0C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 23:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2bIaQZ6vI6SUtH8/EdvV8hJltv77SY87gE3hk/swYKU=; b=1ANDNZdWaETo74
	7V7vgW/0ipeirXR3UJGFUMwIbJJ+7r+aqdnM/Lq0rjihmgpIU8YrDzlh9DGMIwMHZGIpN/RsxDOZg
	MVdSsIgLDO/XYudx1mBEQxhpc0bMfQf6D2ut09qO8O+WmD/rppgfzvciDOsOl3GEZ/7BCl7aSvysD
	ppGLFEPVRq0OQgheGM0KLnAUPLZhzGDmMnv/kaOPKNr9W9WyaSRe01W4YCFNPtoA2deVpqgg78ydY
	H9xy4x3yi1JXiuxEb87fDaxWWWgWJ2laZ2cMGZfPEfSDun58hUuTpKn5KtjJOU1/h2yScJRhmpDcF
	l9pDhQWcKC+hAyCb8nPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vkP-00000004VQp-3VWx;
	Wed, 22 May 2024 23:51:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vkL-00000004VMu-34vu
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 23:51:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B722962C01;
	Wed, 22 May 2024 23:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9E76C4AF0A;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716421907;
	bh=WxJ6YXhCfPuZ517v7LggLzpx3WamKrtIwMEXRH1SkOs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=urSOuSENx+V2tYjtyhElDa8RGuy6Yw2ejpx3a5Jpk2tG1Is1oN+9fpqbUqBszAYLI
	 highrSAdxr5LyMCPvlFNIzGXb+Hce93cFZCuKLDhnLQQFKD5Y2h7h3cErqWqNfXLHc
	 PPrtRCjOZEhRCk6mgWUcgUvdxMqhB/GtUDsOyVAmiZJoYf5PVynhnbOLyOduA1u6kt
	 mfKiJGmD4ixh2Wj+kaFbeA56QwAjLCfuFIpeOCD8JIsZLfBNVUxabigZfyTcvMLSJB
	 RZeLZzsH0pHAsyE4dGd/nYRxwvPMtjoJUe8W8IH7eLBqfsMKtyjUzsNh6OZ9stqfBO
	 cYPt0Me+dG28g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ADCCFC54BB1;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: typo in comment for get_f64_reg
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171642190770.9409.8853343046568203839.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:51:47 +0000
References: <20240317055556.9449-1-rockrush@rockwork.org>
In-Reply-To: <20240317055556.9449-1-rockrush@rockwork.org>
To: Xingyou Chen <rockrush@rockwork.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 ajones@ventanamicro.com, cleger@rivosinc.com, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_165149_839855_E4F9FDDC 
X-CRM114-Status: UNSURE (   7.64  )
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

On Sun, 17 Mar 2024 13:55:56 +0800 you wrote:
> Signed-off-by: Xingyou Chen <rockrush@rockwork.org>
> ---
>  arch/riscv/kernel/fpu.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - riscv: typo in comment for get_f64_reg
    https://git.kernel.org/riscv/c/fca93def4e41

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
