Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D57EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 16:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sWxRxXDYqZkUGXK6xnWC/rcNTnv4axTYiX8j13FoqyY=; b=c40njJHBvRq0MR
	0id/RPpV55VhcimPEWRJZxCLVjq0tavWOKvY1E3dvYV8A4qJfww2itTiGxAtz3xvaNq1NUD9o6DnP
	fitebpBgHAz/ukJB4aNkCElDnwSUeCq0cxB12dpsM1fZo8jAV9yWBVGiHitV5JrRy0VrmzEl5jcoW
	LNYcGj5Pr9zUZ0pR91ItStRDJIw9RLSHW8aD0VwEGSvNMX2bGVoGCH4H4RZS355tu4UA0/xoBiZyr
	RIu/tZAj9IiqMjBTxh9FiVYkrUtkwMv0ojSBZwLnP2c80Qh3a8WsGzUc3LIBoTlksAnqOOyluu5YM
	TigTwKQvp8vFWDPZ69Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcGP-000RqM-34;
	Wed, 12 Jul 2023 16:00:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcGM-000Rnu-2p
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 16:00:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6495A61820;
	Wed, 12 Jul 2023 16:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2903C433CA;
	Wed, 12 Jul 2023 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689177621;
	bh=NdMXVOOo+vMWBtkROJHL2faZFyhzZddyI2xLmLOz4YQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aoOsOqQnnaAye7ZDa+X7xi6olX9cqLD/258LDjXjpxi2RzZPBhvRU5uIS6AAy4jRn
	 hdGHYzpIQxACfn2/GBbJXq9z/Kj9mp9QbapiNoswquNYEL1uErennKQJFrYpobYLyi
	 BH2LsAQCxNxO2SX5zF38uzxLLpogWl0xD4bD5OZvW3r/z92vQ0Vbo8kj257B1LSmpx
	 iSP29OAGGsEjw5MDk5vHayccrrZVg5pRmg5wOhl0ewKrH66f0gBB6TmPbOV7mkQzGG
	 knTaUI+r8INBdSXnxS1BU4lyO+AIm73rcxPZ9CwhUD2BnOEKJ9E4uhVsN3RL3+uFEe
	 sXBbzaMo5/P9Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A2B1CC04E32;
	Wed, 12 Jul 2023 16:00:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: mm: fix truncates issue on RV32
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168917762166.26837.18011111020285782236.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jul 2023 16:00:21 +0000
References: <20230709171036.1906-1-jszhang@kernel.org>
In-Reply-To: <20230709171036.1906-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_090022_968118_54DB12BB 
X-CRM114-Status: UNSURE (   8.43  )
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

On Mon, 10 Jul 2023 01:10:36 +0800 you wrote:
> lkp reports below sparse warning when building for RV32:
> arch/riscv/mm/init.c:1204:48: sparse: warning: cast truncates bits from
> constant value (100000000 becomes 0)
> 
> IMO, the reason we didn't see this truncates bug in real world is "0"
> means MEMBLOCK_ALLOC_ACCESSIBLE in memblock and there's no RV32 HW
> with more than 4GB memory.
> 
> [...]

Here is the summary with links:
  - riscv: mm: fix truncates issue on RV32
    https://git.kernel.org/riscv/c/b690e266dae2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
