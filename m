Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8219C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 17:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=II/f0WOzGIV+DMmPS1xRqiExw6MRIfa20NU7LcA3KXY=; b=Tt+6jf1nMBA7Dr
	xLEbso74wknUreDJSOhcIHUYeoqyBgb2SCpBk0Xvt36QQvQimZ0iX+RornSZ1Vk8kNK653YH3Ce4F
	Zu6LbwGz+pq1TlN4wt+w7tKEAnfJAw29DBS+yLSto+vXVedm24VAtn4fFhVsZBr4C+MtBGS5qcCC3
	BuFnZsSWpnoh7R3Y+TwG5nzBHnaMmeKFZFlJOSv781Dd0cqUQ3uofs6FTiJ0NCMbTcEcElluR5UP9
	+Fe4NKsXDzPi0Fd8iWo6eDbvqEDF5zC0hbeECCrC2mKwrztZt1oS7F6OkGV7dVp+Qtx4tZm2Ge9Y5
	uSA6EhMC8FV+Sp3M5w9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p59GW-003nVR-7e; Tue, 13 Dec 2022 17:40:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p59GM-003nNv-UK
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 17:40:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A7DC61647;
	Tue, 13 Dec 2022 17:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 928BEC4339B;
	Tue, 13 Dec 2022 17:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670953217;
	bh=q9RLumwClvJY21UJboeUZhhl+VsjmpkYWy4K3glQhE0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AxjBmg5xoZi4y49gMHfH6ToKguX6pbDE5+p0pMJvEcqMul6665HNJS/fQzCxvH9yZ
	 9pcm4H297KAN/KFnLpbpZZ7sFR1QyGGw+oMAQgBO2NqNwSW9Lg8+Z5QzAJ2MWyN/T7
	 2/Fz1HF7IPIFHAJCfcYCy4E6bHZilQHRfCe2t/Ki5Gbiykk+Ixc/SwLDDi6B9xlpAC
	 02GKyZQV8Mo69iEtTrm7rDRXVdoOH8iFF8J3bmmfOYTIJURfZ+4bDJ26h6uC9hFiJh
	 eCqShKKNhWnyJ9vJKDcute/3fyUb26sMA7GkIYqI8zzYj9CR6z/YqqPeQcuGohdoTg
	 2q5jZSTFVHmlw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7131FC00445;
	Tue, 13 Dec 2022 17:40:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/4] Documentation: RISC-V: patch-acceptance changes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167095321746.5951.711585297484375290.git-patchwork-notify@kernel.org>
Date: Tue, 13 Dec 2022 17:40:17 +0000
References: <20221207020815.16214-1-palmer@rivosinc.com>
In-Reply-To: <20221207020815.16214-1-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 conor@kernel.org, anup@brainfault.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_094019_068451_AFA8F994 
X-CRM114-Status: GOOD (  11.68  )
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

On Tue,  6 Dec 2022 18:08:11 -0800 you wrote:
> This has a small textual change since the v2, but any change to the text
> is pretty important so I'm sending out a v3 rather than just silently
> squashing it in.  Folks seemed generally OK with it, so unless there's
> any other feedback I'll target this for the merge window.
> 
> Changes since v2 <https://lore.kernel.org/all/20221013045619.18906-1-palmer@rivosinc.com/>:
> * Remove the published timeline wording, to match the standard Linux
>   policies.
> 
> [...]

Here is the summary with links:
  - [v3,1/4] Documentation: RISC-V: Fix a typo in patch-acceptance
    https://git.kernel.org/riscv/c/37f0ab147799
  - [v3,2/4] Documentation: RISC-V: Allow patches for non-standard behavior
    (no matching commit)
  - [v3,3/4] Documentation: RISC-V: Mention the UEFI Standards
    https://git.kernel.org/riscv/c/68eabc72023f
  - [v3,4/4] Documentation: RISC-V: patch-acceptance: s/implementor/implementer
    https://git.kernel.org/riscv/c/a39c636506cb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
