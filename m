Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAAEC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 16:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=og7jELpbfC0SH2p3J0EY9UN7VFQmw3SGJV2cu3h1fP0=; b=2JFnxh83A0lYK/
	VHWhWt9LCzY+Qq9uKK4xiCH+EHkvB8kCTVvPTbQVT5APMdwPnOveppbhgzHiyaVM+Py2xUYdrr7wG
	o173/NXNTznJkZoWMY4y07jlwQtrfSG2gaZbJpAjyBZXWc3q65fO+B4ad37ahFwqeWJ4QANKyjSoN
	gUZ6UMG2trYjuXaDVBgQbyF8r4K5XQOIxSn/7BEm2QyFGEKr/TV1XGUrOkXe3y8TTSy7TJu52QrDq
	3iLssbMTVoUXid0PNqVMsvoOYJiySV2EyAusqa75Jdvr6KsomwN16fbPN6DJZxmvoBYgNTIEFjpSb
	8gpxSaVKOGOMinKRSzUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYs1-000000067WI-0unQ;
	Thu, 01 Aug 2024 16:41:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYr1-000000067AF-0gM7;
	Thu, 01 Aug 2024 16:40:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 91A3F6285D;
	Thu,  1 Aug 2024 16:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8548C4AF14;
	Thu,  1 Aug 2024 16:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722530437;
	bh=c2FO/XwZs3Khz94ER4bhUWQv+QFkKk0f7Rg9kF93AO4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cG0R6guXz6WO3xwIFGUTP5Fj3oWN7D9oJnkbelpgpsjJBCblesZe4Cf/swTrJ3w1o
	 1i0uZ48Mw6+5GpCoF1gtF3Hnd0baiP0IrmrOvrBcDor7kIYG45vA7K/bUUA/P7v/GU
	 aUGzzClFr0Y2Ifq0P/sFaH5W6+2va7KQICSuJoZqT6wlrW5KtVmBksBBlv3Btioy/c
	 XNdW9oYS2h4nAjj85X3CT8Z9GNfX5PPJmN23rYZLBA5LT15PgPnNFwG2HaBFg361S6
	 lnhbr/c8huwb+A6Kb7E1877NBNCaFvBTtKVaqio68HBkl0QqeKnkDOAGE+heLL9M7D
	 4BUJyB/0Sdb5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B30CEE8877D;
	Thu,  1 Aug 2024 16:40:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] perf: riscv: Fix selecting counters in legacy mode
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172253043772.13740.4519514649255072983.git-patchwork-notify@kernel.org>
Date: Thu, 01 Aug 2024 16:40:37 +0000
References: <20240729125858.630653-1-dmitry.shifrin@syntacore.com>
In-Reply-To: <20240729125858.630653-1-dmitry.shifrin@syntacore.com>
To: Dmitry Shifrin <dmitry.shifrin@syntacore.com>
Cc: linux-riscv@lists.infradead.org, atishp@atishpatra.org,
 anup@brainfault.org, will@kernel.org, mark.rutland@arm.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alexghiti@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_094039_316814_CBEEEFA1 
X-CRM114-Status: GOOD (  10.01  )
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

On Mon, 29 Jul 2024 15:58:58 +0300 you wrote:
> It is required to check event type before checking event config.
> Events with the different types can have the same config.
> This check is missed for legacy mode code
> 
> For such perf usage:
>     sysctl -w kernel.perf_user_access=2
>     perf stat -e cycles,L1-dcache-loads --
> driver will try to force both events to CYCLE counter.
> 
> [...]

Here is the summary with links:
  - perf: riscv: Fix selecting counters in legacy mode
    https://git.kernel.org/riscv/c/941a8e9b7a86

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
