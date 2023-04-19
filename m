Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E854EC77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 14:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOT71AWBp/5XF8NPAW5ZhCJdH2rnQRLBK3/CK2AzpvY=; b=Ro+WJc7eqB7AYR
	6B6FMJW+9hrU0QrluI6ps3txWnI3jKWXGsgtJTLs3nJUIHb2oB0dYZG5vTJeGVUbnBQBdbpdX5l+p
	9vBVIutrhVjX6eUWQfVyU5/cwsjpvqQPdV8X1v/PJ416Nt92eRhXSquTRL+u+DKwRx89QQFw2Tw3r
	ichaMm6jvK3E6a03r9AS9V23ppIRrWwyUwG6AQpvLHVDGPdmCuieOOEeueRoqHBUxCnZRQ3FWEPd4
	0OV70YzSJ6i4xhPpOoIPVAEOzZVARP3AreksxxRVfysz0LASKyL0dO70yDurR8GJrdEtWUcOTHXd+
	wYO7OIu4MYo7SS/RK+LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8pI-005fwE-0l;
	Wed, 19 Apr 2023 14:30:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8pD-005ftM-2p
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 14:30:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7980260B90;
	Wed, 19 Apr 2023 14:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74AB7C433A0;
	Wed, 19 Apr 2023 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681914622;
	bh=gIxW+MEugk1r2bu7B+v6wT9H95oTjY8qtJvWNnzi1/0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=F3PkFBxK1TgJnn0moVqKOXPdGtkj4PYdLrTSSdncNbvSuZNi/nS2227FUZjwWh9yh
	 8u9MAk+8MRBEK52p7z2AH64IT01BMKkcXeDaOnMeztwA4cuCDqWa9doZJtKENDRQl7
	 XcF2FTAouaia+N4ykD15CQcbIyv4x3ItItxeM9ltsQtvDJTY8rJJVG1Q59Ek5f2COJ
	 esOYsElJIiDE2cLPxRobloDrcVcRDTJE0jqSFzHEngaJm4OgvuQUyDZggqnHNp98NQ
	 0iiKnfVtl3I8zgOiVz4h01VCkkDGhrxtCpujsvTgz2UNLC0v1cjzjZN5z1m5kfFIOF
	 MqhopSnLOW2VQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5D2D4E52469;
	Wed, 19 Apr 2023 14:30:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] RISC-V: align ISA extension Kconfig help text with each
 other
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168191462237.22791.10991310571560333121.git-patchwork-notify@kernel.org>
Date: Wed, 19 Apr 2023 14:30:22 +0000
References: <20230405-pucker-cogwheel-3a999a94a2f2@wendy>
In-Reply-To: <20230405-pucker-cogwheel-3a999a94a2f2@wendy>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, conor@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_073023_950249_7279FC42 
X-CRM114-Status: GOOD (  11.59  )
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

On Wed, 5 Apr 2023 11:21:10 +0100 you wrote:
> Other extensions only capitalise the first letter in the text visible
> in Kconfig menus, and provide a short comment about the extension's
> meaning. Do the same for Svnapot & Svpbmt.
> 
> The precedent for capitalisation in the Kconfig text was set by Zicbom
> & sorta followed for Zicboz. The RVI styling used for multi-letter
> extensions only capitalises the first letter, so do the same here.
> If nothing else, my OCD likes it when the extensions follow a consistent
> pattern.
> 
> [...]

Here is the summary with links:
  - [v2] RISC-V: align ISA extension Kconfig help text with each other
    https://git.kernel.org/riscv/c/5464912cfae7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
