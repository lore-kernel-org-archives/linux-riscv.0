Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DE5C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 23:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=avyzJnNT65otNoLifoixLmYh8wmLcE9GUc6Jy5i2n10=; b=onVNjrCdxQNM+k
	1b90n9P9x2tODWvY7Q43foD4opbDZT+sarGGXtcsCExIbVHR6DQCXGXY00vnTSMuwrlOqWbU0jmzG
	BVfzPysfKJZkPt1141+1HtCTOCDfyxMw0AyaTiSn7vwjiM97w7KMvqMomtIIyxKKqw6868x5FOD+O
	LpL2yreqiwHE8A75uhs0WwAlmmgeTWsHRAqfwcyVjq5xxA8bujBrpaNuAWoUJl5b9mIlFf7Ru9X87
	cT9BvfT17Mu/0IOghCTYSuFJew0/Oh+K8KGqdIuLkSmyuO2k5Qxl/S5GuCwp2XkK57sBDr1yzq2MF
	pH+xJOZbfDOmHWiNBkpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0V3g-002ZZG-2U;
	Tue, 07 Nov 2023 23:00:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0V3e-002ZYv-11
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 23:00:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E6026CE0FD4;
	Tue,  7 Nov 2023 23:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE3FEC433C9;
	Tue,  7 Nov 2023 23:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699398025;
	bh=dULFohQIMtMngk6II8kbzDmD1WipBN7DPsTQrS2mvLc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ogucU28KR/GHHn0Ly1k4dMFzdxv1f8EJ3OYVjKOTGD5QkYkcp4e1AB8owzgUYT7aL
	 Ic1N6BDKGpcaHtMz1jOTUwtIiBRxEuCamqbumKl5/mV3hlrHbwR0QDiiICvCOV+arj
	 bhV6s++zmxTqhXrK2GcNs4GLMpJMt9HFTjyJqypXDKvS8CR9p4+N4cage+OkCOq687
	 XUJiy71oshqB143HIKs6n9P9CSGAbqE/bHMQgQijn7idzDE53g51syd+0pA0v7IZQ3
	 I6dA+UhIK53+Xv8pSAsSmLa309/5tGc3s1OPwzNM7GYgmyaX6u6IuecwZi+qYyc4W4
	 /vi/ujHsXa1qQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9C16CE00084;
	Tue,  7 Nov 2023 23:00:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: split cache ops out of dma-noncoherent.c
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169939802563.13989.11221293353672804460.git-patchwork-notify@kernel.org>
Date: Tue, 07 Nov 2023 23:00:25 +0000
References: <20231028155101.1039049-1-hch@lst.de>
In-Reply-To: <20231028155101.1039049-1-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-riscv@lists.infradead.org, geert+renesas@glider.be,
 paul.walmsley@sifive.com, palmer@dabbelt.com, conor.dooley@microchip.com,
 soc@kernel.org, lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_150030_544412_910E4624 
X-CRM114-Status: UNSURE (   9.68  )
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

On Sat, 28 Oct 2023 17:51:01 +0200 you wrote:
> The cache ops are also used by the pmem code which is unconditionally
> built into the kernel.  Move them into a separate file that is built
> based on the correct config option.
> 
> Fixes: fd962781270e ("riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't depend on RISCV_DMA_NONCOHERENT")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> [...]

Here is the summary with links:
  - riscv: split cache ops out of dma-noncoherent.c
    https://git.kernel.org/riscv/c/946bb33d3302

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
