Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF7EC25B7E
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 21:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDtkbujOExQG9tv9Ho4hfRnMWkGu0ZaptwuxZLQJ8IY=; b=QVtly2zGruzwtA
	D+eAYzUwtwNHIvaTsXYPmoiIHfXJfy4jrrKyIJG+dFM1C0hIL+kHR+Dwu0NYtRMaUS01rWEmp5Mey
	3wNbV2+JMhANuwI/fFrFhlym+qypzhxqer/o8MYaKnMogfDAek6ZyACu13J6jf/D+0+4No3oBj70c
	NDSVbikg5xEmsnCsa0uu7i3Nv8jDZxX7Ko6bjkNFvkIRa7OcPfOfvoNHHu9qzGDOyOZ8xgklry7Lo
	XgiX54umUCEtNpGwlbOUlgq9s/bsu/3i2ycbUHxPIzNLKqUMgR2JoHJSoBdrD9/6GwoQsAE4IPsLL
	ELxtWiJpNm4TooqqcYeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCn2n-00000008Qy4-0ANc;
	Thu, 30 May 2024 21:10:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCn2g-00000008QuY-3SV0
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 21:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6EFE3CE1B6A;
	Thu, 30 May 2024 21:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFA85C4AF08;
	Thu, 30 May 2024 21:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717103430;
	bh=zk2nrz7k0maanOnHvn/BGhqGZmMiVkfBehn19R9qQiY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=i8QHWn0j+0G4EthV2coDLY8+kcfPVW53rGyw90R+yaHB6rwwskTCQh2rFLVTJrB7W
	 DK3QVX5fbv0MISHiNk9EXx3KT9ewifBgeoLTHbePsV54z+SwlIZAo2jUTN6aTQrUM0
	 0rqd7VhoRzdI1354atb7jMZev1I1cuZwlHNPrzaeUsdylriJSPvSfLLmzfnN2CGeOW
	 u0HwjsAWsGbsNZJJIJM9mOfQUSwOAQAU27bcOnSEtSmuvtfNtKBngA9Ghvg8xYKiqZ
	 nM8zFQ+yC+7ZKtQfvddleRi+V3coxNajWVlAU+w3UG9IPS4/oFQNP3wPnyDJNtQcSk
	 rrelUlzdIOA4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9E5EBD84BCC;
	Thu, 30 May 2024 21:10:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: enable HAVE_ARCH_HUGE_VMAP for XIP kernel
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171710343064.6624.15790778712539042062.git-patchwork-notify@kernel.org>
Date: Thu, 30 May 2024 21:10:30 +0000
References: <20240526110104.470429-1-namcao@linutronix.de>
In-Reply-To: <20240526110104.470429-1-namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, alexghiti@rivosinc.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_141035_072728_0D0B732B 
X-CRM114-Status: UNSURE (   8.84  )
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

On Sun, 26 May 2024 13:01:04 +0200 you wrote:
> HAVE_ARCH_HUGE_VMAP also works on XIP kernel, so remove its dependency on
> !XIP_KERNEL.
> 
> This also fixes a boot problem for XIP kernel introduced by the commit in
> "Fixes:". This commit used huge page mapping for vmemmap, but huge page
> vmap was not enabled for XIP kernel.
> 
> [...]

Here is the summary with links:
  - riscv: enable HAVE_ARCH_HUGE_VMAP for XIP kernel
    https://git.kernel.org/riscv/c/7bed51617401

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
