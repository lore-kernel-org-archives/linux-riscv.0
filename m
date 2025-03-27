Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE43C36010
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 03:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWR4rpft3wVIE5lrGtrnVkMxyadUdCbPK0itR8M2g1A=; b=NnMfxsEUgKzOPH
	KuEgFFXasV8JLkI69iQ5S9uIHi4CRjkYBdz3K+34FdbaSfPeYKAupmwnLrHEdwX96FwiMrZalLKzq
	FdKJJy1RV8TplmCGb6nEvSgf6a0oESN6KpqJC6Jxrfq/OCi9VIq+riK9vSJeyzTgoan8TyHVPFvrg
	wwHNT+T+HZX3x/nd6zghKa343TJGQTvTsOgN/OeAQWKOFySSXgv80lrNje+uETycmPFrtsOfZvN+/
	00rV8kbAkwLgUrpgRNjKCT26JQ6frCDkSiVBxP7WvCXdPbvBzwTxU5GQ39j0bB9icn4ucTvBSt+H/
	Y42w/GmIy13KmlKKC+hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqm-0000000A4BU-2yKt;
	Thu, 27 Mar 2025 03:24:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqj-0000000A474-1aZ2
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDB675C6B40;
	Thu, 27 Mar 2025 03:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99087C4CEEA;
	Thu, 27 Mar 2025 03:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045848;
	bh=P+Q3zsfmXB80OoR9rHZt4cwuULIBvbesypAsNo2uZuQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s5HyGyp47OKbQcm8FBidJYBbgqyw2hHr0lExJ3RP6ltpgOK5fiZXw3sRCjV7HUzJc
	 V8rliQy+psaD2iKjRqdlbCZNlYjqy8ItvFxO1qDaR1jzZC15wAjLeRhhzjxfakPwW2
	 tOjtUQvzuIhTwliNmSgSJj2Te1iX6RSbFsI+vHoV9oVrAKD0mD0WxEFjgGs9TI1tX5
	 UXTznAznMdSJ0WmzSe67iSZ8HsdS1B8Jj77N3r3HDwvvo8Aoqa6hWMDClZzTebEc++
	 K5NAkUH7FKE2D8wgHl7v++lExKCWfyjQgVj3Jy24RCh2SISuaj7kBAnDXI6YcyzljC
	 a2Fwy/AKS17Dg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BAE380AAFD;
	Thu, 27 Mar 2025 03:24:46 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: Fix the __riscv_copy_vec_words_unaligned
 implementation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304588473.1549280.17956945666756829574.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:44 +0000
References: <20250228090801.8334-1-tingbo.liao@starfivetech.com>
In-Reply-To: <20250228090801.8334-1-tingbo.liao@starfivetech.com>
To: Tingbo Liao <tingbo.liao@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, alex@ghiti.fr, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_202409_463430_B9320BF3 
X-CRM114-Status: UNSURE (   7.39  )
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

On Fri, 28 Feb 2025 01:08:01 -0800 you wrote:
> Correct the VEC_S macro definition to fix the implementation
> of vector words copy in the case of unalignment in RISC-V.
> 
> Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Signed-off-by: Tingbo Liao <tingbo.liao@starfivetech.com>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: Fix the __riscv_copy_vec_words_unaligned implementation
    https://git.kernel.org/riscv/c/475afa39b123

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
