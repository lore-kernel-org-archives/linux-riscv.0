Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC319C87FD3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 17:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qb/dMmai2NrTz1r9MaszLt2D4tRue4RXmXpE9rYUQKA=; b=Ilm3zU4P89I3ex
	Tawr9uevToHbBmLdyQq5jjhFKUIyVXClxqu5LqqjD6AcdPX5M38zsE+gO8puif+NOVXrz/TtUF6yp
	Hd6cSfKSd9X0WdQafqKo9qHbD7Fw8ZbtOBMxWSf9vFTp/Fo7AkUqsYs7SEsWhWOihSu87zU92aLya
	VUzlf/GzVHhNkUXOwRQjejiqmR8yL1J3gNz5uujYCwcB3CYRlBE8QPZdA6MrTxpiwiCtiKm+sKu/3
	eupldrQ0YLIzpe+jemSze/WjVp7OCWDSpdEPEJRVoDN0R1BLs6Fx8Ub8ST79HWx/6DVU4P2UqB9o3
	yznoi7aBuMOr8rVKZA/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujho0-0000000FtS9-1AZR;
	Wed, 06 Aug 2025 17:20:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhju-0000000FsGq-1z5a
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 17:15:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E50326111F;
	Wed,  6 Aug 2025 17:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6AFC4CEE7;
	Wed,  6 Aug 2025 17:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754500545;
	bh=1GNA7X5R51sdOSWNQYdwDRll9kG3ZCYqu+jXPiVoLSY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CmPurJYdTk0V5U8cnRscexA8IsFBsd672nd+Olltt4YaJmn+vtcYCmE0w9X0sFEDQ
	 3rQ0eCpnqTrRfcpperyxWZQWuCFDUaFyjtcKOeSwDoEH0GaqrZ79wkKaM1v6O0ZDat
	 ZN8sqAKOzRcOWaeweI+TXdTr3V+48gyKJcWtKovIqKePUC0CHmAdBjAKPkx5ZeDo7l
	 oDMoyz1fEw/V/4byhzjO3ACNDTW84HSG+BnnQ1fVXKI29ztCA43qFWtSwBRIUpCG2P
	 zvGBtD/8EfisLduG/Pu8Z57A8aRIdVBvk5NGhI+eJoECYwc6kModtovTbYMKhV0anG
	 58ERYBMLv/PcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE227383BF63;
	Wed,  6 Aug 2025 17:16:00 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -next] riscv: Enable ARCH_HAVE_NMI_SAFE_CMPXCHG
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175450055949.2863135.12380729156820044095.git-patchwork-notify@kernel.org>
Date: Wed, 06 Aug 2025 17:15:59 +0000
References: <20250711090443.1688404-1-pulehui@huaweicloud.com>
In-Reply-To: <20250711090443.1688404-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 palmer@dabbelt.com, alex@ghiti.fr, pulehui@huawei.com
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

On Fri, 11 Jul 2025 09:04:43 +0000 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> The implement of cmpxchg() in riscv is based on atomic primitives and
> has NMI-safe features, so it can be used safely in the in_nmi context.
> ftrace's ringbuffer relies on NMI-safe cmpxchg() in the NMI context.
> Currently, in_nmi() is true when riscv kprobe is in trap-based mode, so
> this config needs to be selected, otherwise kprobetrace will not be
> available.
> 
> [...]

Here is the summary with links:
  - [-next] riscv: Enable ARCH_HAVE_NMI_SAFE_CMPXCHG
    https://git.kernel.org/riscv/c/9ad032ba418c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
