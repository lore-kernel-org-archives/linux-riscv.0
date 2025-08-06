Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9032C87FDA
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 17:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7qpNjhFZ9FoL3TiobCDbVXdNgGD3G2rl+9Tgt/4Pg0=; b=BaEbHVEgm5Uiie
	Gjhm0SstXIGgIeHR8aM0sZgu1ISseT7i5Mx4bJUs5qy9PdXKejxfrM3XCr5vU967UoqKe0Nt8bvcS
	9wGnRSt9cycFaU4XznJYc5GjT4uxN1tr0CJCXJ/qILsj4ADQXS9IeMr6bkR5pRfHXP+y4/ZC4eXmi
	F+go46D0bWR+WgHgXjROlXqiGD3ek+ffztxO5vzIyDZz86tYfLLVoOCrjC+3DXCUzjiuf7i821+CB
	tldjFVzOiioSy8XoISSxovkX9i8ZJUwBTMr4pKpi6HyU0sanzB8ZAjWAIboe4Z93MxR4Bjy87KS6q
	sX58igWps35Hw3/UiPWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhnu-0000000FtL2-0kqb;
	Wed, 06 Aug 2025 17:19:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhji-0000000FsA1-3ig6
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 17:15:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5613261160;
	Wed,  6 Aug 2025 17:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282A9C4CEE7;
	Wed,  6 Aug 2025 17:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754500534;
	bh=IVFK/0+QswRCqr43cqboAMU1vdd5dlKlFrp+LiKHVbY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=t31k0AV6h5azCfKdcMbgVVKopp/He+LRtaAyhqnYYW3uYZGcXWw71ouUeqxNQksBS
	 2e/2+GKtQpA2FoQA3j09St+PvQT2XpUag2nwfJNQcjRmt0N6DU3ajGlirwJn/iF3KK
	 D7UWJfxUBts86WOVRVTnVfdWPPNhkwmOa05UlgCPA5/OIjmFKqQL7lu+W5/OD+EvTh
	 A2Dn4+LffAcrCRmtWqZUWZhuZHPRSL/fVDE3JhAVOUKAYcc9B3gD7k2YwN7qDhtrJG
	 AvyNDh6tvdonGbBTnFh0/cr76gj28vWxn55EwFFpU53zC5di4Fpkv1Ba/a2oG2gfBx
	 3j8Pr9aJi/oOQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C90383BF63;
	Wed,  6 Aug 2025 17:15:49 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] introduce ioremap_wc()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175450054774.2863135.12249630773089785493.git-patchwork-notify@kernel.org>
Date: Wed, 06 Aug 2025 17:15:47 +0000
References: <20250722091504.45974-1-cuiyunhui@bytedance.com>
In-Reply-To: <20250722091504.45974-1-cuiyunhui@bytedance.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 akpm@linux-foundation.org, catalin.marinas@arm.com,
 anshuman.khandual@arm.com, kas@kernel.org, ryan.roberts@arm.com,
 samuel.holland@sifive.com, namcao@linutronix.de, willy@infradead.org,
 abrestic@rivosinc.com, yongxuan.wang@sifive.com, apopple@nvidia.com,
 linux-kernel@vger.kernel.org
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

On Tue, 22 Jul 2025 17:15:03 +0800 you wrote:
> Compared with IO attributes, NC attributes can improve performance,
> specifically in these aspects: Relaxed Order, Gathering, Supports Read
> Speculation, Supports Unaligned Access.
> 
> When I replied to this patch (https://lore.kernel.org/all/CAEEQ3wmVPrZ6s8msM8RgcyZePGhXM1ikYMc5wW2n8q3Bf90EVw@mail.gmail.com/),
> I found the author's email address was invalid. So, based on this patch,
> I made slight modifications and resubmitted it.
> 
> [...]

Here is the summary with links:
  - [1/1] riscv: introduce ioremap_wc()
    https://git.kernel.org/riscv/c/5ec6b493183c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
