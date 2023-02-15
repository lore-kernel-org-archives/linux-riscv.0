Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E07C636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 18:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFSjMgbkP2PW2UO1u4wZhYjQCrT+63r8ZRbojaqvd4Y=; b=h22umIPe4wg0cM
	NqbVsLH+fE/BFTdDCVAgoa6ZJpgB9lQdaRqNTREIcZXfU5RujpnGP7SEmEsqslSpUxYocaIDrRHFK
	xQ8bdrZF8wndi6R3omluKgSaXmw596Yrizwkw8/mPraI+h14DreRR906wt+ehT1UQv5StvLUDYnP1
	SgtsBLrnV5AHfJJh5JFcfNhxnCT3942W+8pEnzfXGv+Myuvws+yg38k7IqUjjx4nzTd5jCR3WO8P0
	g6FMMuUfVLRfET5kFaq65z67+SV4FLbBbuRMKI2R/cu9YSmuUcLHcv4aBvlrhJQt67haI7UJtl9Hp
	BpOXl8OIRm2qvntn6BLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSMhc-006t7t-7u; Wed, 15 Feb 2023 18:40:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSMhZ-006t7B-97
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 18:40:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EA253B82357;
	Wed, 15 Feb 2023 18:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 931D9C433D2;
	Wed, 15 Feb 2023 18:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676486417;
	bh=dPK19CgIB81ZCZEd2/taVIPB2X5OIwHHIcrbwbtu1sA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DIkJD995mSAYn5t0gDqp+AAtHZJqqKIeunn2IuXMglkb+eTZ7rStBaBchbnOX/pzk
	 hthikYxUa7SoHZJrq4kjbwrUgHZU6fDAsYzXhUpPJ61j3SE9bryBd/H5XoeqLKVsJG
	 8XWnAm+YPrAq1QDCoaDx4KkvqhKKxDFkEvX4SpIzvlQtgU7ameGUgVNs04YI9GU+qY
	 K8hddIwh9+dfPThBWdzYbadxg1GyljsqXJ8kInnRT9eK+X5d7D2gs8owk7bldT/XYi
	 +VBNpWZwtsFLgGHUu0m8CM/tFq9UMZlQT7cne+iJc92N5KCfAIGogCMKu+dh6UbzWp
	 Ap0hDk1Owxo7A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6D375C41676;
	Wed, 15 Feb 2023 18:40:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1 0/3] Remove toolchain dependencies for Zicbom
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167648641743.2129.4018218851754248725.git-patchwork-notify@kernel.org>
Date: Wed, 15 Feb 2023 18:40:17 +0000
References: <20230108163356.3063839-1-conor@kernel.org>
In-Reply-To: <20230108163356.3063839-1-conor@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 conor.dooley@microchip.com, arnd@arndb.de, geert+renesas@glider.be,
 heiko@sntech.de, guoren@kernel.org, ajones@ventanamicro.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_104021_477772_1C8EC09E 
X-CRM114-Status: GOOD (  11.70  )
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

On Sun,  8 Jan 2023 16:33:53 +0000 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey all,
> 
> I've yoinked patch 1 from Drew's series adding support for Zicboz &
> attached two more patches here that remove the need for, and then drop
> the toolchain support checks for Zicbom. The goal is to remove the need
> for checking the presence of toolchain Zicbom support in the work being
> done to support non instruction based CMOs [1].
> 
> [...]

Here is the summary with links:
  - [v1,1/3] RISC-V: insn-def: Add I-type insn-def
    https://git.kernel.org/riscv/c/6067c3aae52f
  - [v1,2/3] RISC-V: replace cbom instructions with an insn-def
    https://git.kernel.org/riscv/c/dd23e9535889
  - [v1,3/3] RISC-V: remove toolchain version checks for Zicbom
    https://git.kernel.org/riscv/c/75c53905f873

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
