Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474B3C636D3
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 19:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBFBmdVwmOcZkmuproqt19NGZrBdmHUKf+I9O9c3ILw=; b=4cSk6Eilk7T5De
	Nj36KreDaT7d1KXjZKhCuhga0JgxEbKLHLo+93Bc4hsoQw/aBs1146cQ3dtC9EVdaWFBHNTlHFLfv
	oWVB9HVSkiq7Fa6KSR8KYxhWAW0bAubGtsiX6jbzFAzGKB1xvvEDnCkh6vbCH1vJHcMQJ51Jyuwqv
	fLOJO9Kz17Zeh2P74iq/1gqsfoNSwDjGWkf0LXs1Ze6yYr7ZXXWS75WD1lgFHNTfYggLzDGxLwSWg
	HqZOEeAH0F7/g7KWdUyfCUVrwF+T3yDBIOKmfnXUB7oCY0hmG6u+62acFlTchnERsTlL7FqW7G7tL
	06/jZ7C1h1ZN8t291DHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCmR-0031rk-2G; Thu, 09 Feb 2023 19:40:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCmN-0031pf-Fd
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 19:40:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 13A06B822D6;
	Thu,  9 Feb 2023 19:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6F7CC4339E;
	Thu,  9 Feb 2023 19:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675971618;
	bh=e2EyPhdvf/lHTouQke9Dg21W0re6lmXqTwcqEMtRKNg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WCgJbzUY060gUIqsHU3de+cLtwWP/7+Dq5Guct04deiMqbc5hx3GtvfGli79Dxmrz
	 N47dpjdyJutM4SlsBYYPJ8U6iO3PPcKahLSPzJA7KWkBMWMUhYKAxUUfOJmTURQgtc
	 8vhPz3LI7ntUEbrLEOwgPC17URjvdgwH9h208BBUKiqEI2Ftus2Yrf6nQEOBsBh8CV
	 hz6SWfR2PDkk3IYSCVnNoOuL8Ilid6+oVo0oeH8iSq2pflhmVy85dBTic1tR6R3CMS
	 Lv31z7Soh7h3p2LNKU0E9/Mlt3cG3cg97Qc13qeT4RZ97omo5UClPHZwhX7rN0xCOZ
	 Ur92k0/JXAuTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8ED3EE49FB3;
	Thu,  9 Feb 2023 19:40:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: mm: Implement pmdp_collapse_flush for THP
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167597161858.28032.13566046162388404824.git-patchwork-notify@kernel.org>
Date: Thu, 09 Feb 2023 19:40:18 +0000
References: <20230130074815.1694055-1-mchitale@ventanamicro.com>
In-Reply-To: <20230130074815.1694055-1-mchitale@ventanamicro.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, sunnanyong@huawei.com,
 apatel@ventanamicro.com, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_114023_698863_9A35A0C9 
X-CRM114-Status: UNSURE (   9.04  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 30 Jan 2023 13:18:15 +0530 you wrote:
> When THP is enabled, 4K pages are collapsed into a single huge
> page using the generic pmdp_collapse_flush() which will further
> use flush_tlb_range() to shoot-down stale TLB entries. Unfortunately,
> the generic pmdp_collapse_flush() only invalidates cached leaf PTEs
> using address specific SFENCEs which results in repetitive (or
> unpredictable) page faults on RISC-V implementations which cache
> non-leaf PTEs.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: mm: Implement pmdp_collapse_flush for THP
    https://git.kernel.org/riscv/c/f0293cd1f4fc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
