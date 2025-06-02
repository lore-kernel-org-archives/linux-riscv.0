Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8A5C5B549
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 22:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IaXCXSpL3p6nm4j8j3WuOk2n2BAsUIpFbcAXf9ZeS4k=; b=c9gAOL9kdBzfcY
	HFvrt72aLM3TjuYd57g9a4Cy44lsiS+3io94Oz45HyQ3VFQwtgVlZcqOk88y041gtTSx6hjLRuX7C
	ZwaU4YGpjmhyLgR5Bei/F1iYF6h2+v2U4Yv/obLnkV2FKzE+xXoOlD2SNUmqAqKN76gMohIP737Zh
	2EPoM2zGPmhSWDbOonWDEVUUxB8dtH8GOHxle5wQaDsmy7k2nRWMGHAhwSaORaKzvrH7S6tlnrsbu
	wHMXH1ve4KZwZ4C2N6+ro62NmIXMGd4gNPVmOEZmnBleHE3bxCs+p0EIDHd2D1h/kDtWuRW4aVpxW
	rXDZdsCwy6EF8sPYp87A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDOB-000000099kS-11Fh;
	Mon, 02 Jun 2025 22:12:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDO8-000000099iR-1yOU
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 22:12:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C4B04AA35;
	Mon,  2 Jun 2025 22:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD64C4CEEE;
	Mon,  2 Jun 2025 22:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748902332;
	bh=fobi94zmGuQc5VYvtD/ExMAHS0MIf1GVrXM+gp8BGIM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=inAg8U8hoMODBa8xaqP2Hv8I4iWY1NZrJ4yqe9piJz7bCZci9Ttig3+/l0rioGZDx
	 XXw9+caLIBhDY0a/T0YujSQAV3YnVhIoKl+Lpc4FRoylqDEXnNPGziYPM3zaKbj3Yh
	 hyiX9wP3hSDaUoR6oGSWHULjLOuYQ4y6iWy/RLsScLp0pZ+7R3mzYgwMeoBPn4hR+e
	 Uz+w2HnKyULL69rhipmtkbf1qHV+q03EwBg9+srDL2jZb12meCTFe06PZndfXGRhp/
	 1YL4mCLJe+793kYK7FU1AJdvkLvROstiUskahRW4oASGga6k2A8yyLGBeknjaQbwTp
	 fjohTdjBLQihg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD15380AAD0;
	Mon,  2 Jun 2025 22:12:45 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "RISC-V: vDSO: Wire up getrandom() vDSO
 implementation"
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174890236450.925497.9155987852356367743.git-patchwork-notify@kernel.org>
Date: Mon, 02 Jun 2025 22:12:44 +0000
References: <20250602173315.20228-1-palmer@dabbelt.com>
In-Reply-To: <20250602173315.20228-1-palmer@dabbelt.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_151212_661627_5CC6C1FE 
X-CRM114-Status: UNSURE (   8.40  )
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
by Palmer Dabbelt <palmer@dabbelt.com>:

On Mon,  2 Jun 2025 10:33:15 -0700 you wrote:
> This has been on -next for a bit, but it's broken and there's already a
> v2.  So I'm reverting it to avoid more rebasing.
> 
> This reverts commit 89079520cef65d6da1e864eab4464effe5396e23.
> 
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> 
> [...]

Here is the summary with links:
  - Revert "RISC-V: vDSO: Wire up getrandom() vDSO implementation"
    https://git.kernel.org/riscv/c/2f956db8b3b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
