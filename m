Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B3BC001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 19:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2eW76PdpzUJZ6nScAYwQPYkRaqIqvS3RPpyLnkGc57s=; b=wa/vHYgNnkjU2s
	EGjSRikyuq88qdWa6pPG/GsVtTg7nqV5cAoXmaW3qEy2F2j3an9Xn/VT91sDVx4zjlTy9maxikOEO
	7MSLKeJ0RHGT5KvqeprOW/gNJ38gzU5ZMnnMzSmXpLvnKmilYREABYkPx32qDRVIVHDQ1XOgEACqn
	o7G0bw0GAVJv39N42Mglf4125vH2MJ1RmTHlPuJJD5iF0AP1eTvWZ/0mouuviIbPiVjeyx81WZo+A
	E0osNikO5WZzRBXFVZEB5+3AD0FXB8PUerycvyGGrCa1pc3vWi9WK8EZasSDhkTrspYllJP/GXgfn
	wQzgtqnnE0FgKdOpJhhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBft-008amp-36;
	Thu, 10 Aug 2023 19:50:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBfr-008alk-2o
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 19:50:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DA5A56322B;
	Thu, 10 Aug 2023 19:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BBA0C433C7;
	Thu, 10 Aug 2023 19:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691697022;
	bh=UHSK7sHWgdPvk4SUg9SCRlEo0k3DQS+f65ypDdcUiB8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ecFPGxpvw5VBd6ljqYdAWZl91LycZCnhaz/VRT0VaAZef2xwFL/eaqHWymREqRgJo
	 +/ABD8PGOLst53forLvl9d2vC5+TagRcmhibi4eRRcGC5rErr+yjRKGCFsjDnB1lxo
	 vR8sI/WhU0M+rXGGsyEUhf6+nwOuWoWoKFpYyzNhkUhGRiCh0fFzGP3TSWHhEm/uSF
	 8ZKrdQtqgSqdoYRASpeRLkec1G5jt5RySfkuq00xWwH2fnoLXaIh08n4ELicxCfqhp
	 AG5LRi9el5qZt69rXHmNY+8/8oxTg7qH97fyshzQx4g0HnmAkt24VTmTlNLVF5vAFf
	 sVsMTV+19OvCQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2CB71E1CF31;
	Thu, 10 Aug 2023 19:50:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Do not allow vmap pud mappings for 3-level page
 table
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169169702217.10459.13892718151102132616.git-patchwork-notify@kernel.org>
Date: Thu, 10 Aug 2023 19:50:22 +0000
References: <20230808130709.1502614-1-alexghiti@rivosinc.com>
In-Reply-To: <20230808130709.1502614-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, bjorn@rivosinc.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_125023_977167_937D4F29 
X-CRM114-Status: GOOD (  10.57  )
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

On Tue,  8 Aug 2023 15:07:09 +0200 you wrote:
> The vmalloc_fault() path was removed and to avoid syncing the vmalloc PGD
> mappings, they are now preallocated. But if the kernel can use a PUD
> mapping (which in sv39 is actually a PGD mapping) for large vmalloc
> allocation, it will free the current unused preallocated PGD mapping and
> install a new leaf one. Since there is no sync anymore, some page tables
> lack this new mapping and that triggers a panic.
> 
> [...]

Here is the summary with links:
  - [-fixes] riscv: Do not allow vmap pud mappings for 3-level page table
    https://git.kernel.org/riscv/c/d566bea4a638

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
