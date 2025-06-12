Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDA8C71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 22:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jIqQVMCeFmiv1SprBK9RIA/hf1UcYXLzsSqlStY+l1s=; b=JR4x6nVcshXFvF
	0KHtUk2kw3cxA1COWyTLRWBgAWzkt68+swzDBzfD5BbiuJgB6/AW6F40QcUWIZ77xqectWIvjhSJu
	Tfsmreth3peYfpBsrRkRimGF72LzsHpDliJJfXjr1tWN5g2yeNL6+26ijZAK5Rl+caA2oOm3UTcM3
	I1XdeQo9BbpwRvXKDHR5jS5kIft+7gY3jE/crrPas5CjCQVihibuWIlnGmHeLoApJVFdSZzkJCPnr
	xzH3bfwyGEnC5JzPaCRxFnAXDMo63lbuNxIiTHYkQHJ8CK29HcSZInKMmr/F0BEEFYnKCtuTS+/et
	WyXFM92J+P2YyVElBueg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPqLT-0000000ElzQ-19bU;
	Thu, 12 Jun 2025 22:24:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoFO-0000000ESb8-0Xjp
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 20:10:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 29B9B629D6;
	Thu, 12 Jun 2025 20:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22C8C4CEED;
	Thu, 12 Jun 2025 20:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749759000;
	bh=cEauEdHSRITY1mKHYGeJdO5iErmfMhAiBOYbwM3zuwQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TmY0fj8d2Xz+8jSW0dJjlaRQK6Cm/F9NWb/XrfvUwSJmdoXiMklAhpNPlXb/2tiRs
	 XsJkfDwsqk1y6fzKKTx1llR1MfUdUvdn8rkU/y+4DWjASdb6Stuyp3Agk3/sd+Zvwi
	 dNs6J7ia8SnUKfwSgUGE+ZQ9fCSvT5LP1eGuRd4tJTK3PapmRkKW/eZKVKYc0c4+hi
	 MsIp5v46SoRArmDFEwIwtfV6csvTzP+raMKawyyVTQ8aHm/sIvizTobFHBBvUV/PsN
	 tVfgrS7dub6PLyZUTtPmO7KMfWMqVW6XpjFo1e3aZk86g1zbiIgNdhKdOkG/6W6h+4
	 G+d3gbPTRcMpw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC573822D43;
	Thu, 12 Jun 2025 20:10:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: vector: Fix context save/restore with
 xtheadvector
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174975903074.88969.14775699303771599132.git-patchwork-notify@kernel.org>
Date: Thu, 12 Jun 2025 20:10:30 +0000
References: <9b9eb2337f3d5336ce813721f8ebea51e0b2b553.1747994822.git.rabenda.cn@gmail.com>
In-Reply-To: <9b9eb2337f3d5336ce813721f8ebea51e0b2b553.1747994822.git.rabenda.cn@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 charlie@rivosinc.com, andybnac@gmail.com, jesse@rivosinc.com,
 conor.dooley@microchip.com, tanxiongchuan@isrc.iscas.ac.cn,
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Fri, 23 May 2025 18:25:56 +0800 you wrote:
> Previously only v0-v7 were correctly saved/restored,
> and the context of v8-v31 are damanged.
> Correctly save/restore v8-v31 to avoid breaking userspace.
> 
> Fixes: d863910eabaf ("riscv: vector: Support xtheadvector save/restore")
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> Tested-by: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: vector: Fix context save/restore with xtheadvector
    https://git.kernel.org/riscv/c/4262bd0d9cc7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
