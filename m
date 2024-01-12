Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13795C47DA2
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 06:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfayqoKHzORTd8BFnXOcKkJ/m9mnIO5fOnS1GX0vGPo=; b=op1zF54tDeG8jO
	zRaatG2U8XA3eUv+XOpvfr7l1VG0LxE3mz9ne0zOnfRIIxZFK4FycenQGbmMcBVPwkow/1rrx/mzZ
	quMLEZn0dWvM+HX2k+Lkv8xN5WBM6HrnDcWjBdy2vSj5W0g7t/twHzuCOm8328IKEc6T6mgFS568o
	RtRpKT9YoU9QwfcUEH7/x+iDwPI69vm77WTV8es2zIqf7A6mzygUeaKPyCdwlBLYujh3M//YFb+lJ
	o6tCo/N47YrJrd6obBt9UY2QLLcNsUeFKGXDD3ra0PIIZfW6nguCtJ4kmJNgjV3y5TcPfS815vJCI
	oWt161+qx587SFTZW71g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOB3u-0020uv-29;
	Fri, 12 Jan 2024 06:30:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOB3q-0020sh-2Z
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 06:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D669ACE2339;
	Fri, 12 Jan 2024 06:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03F5CC433A6;
	Fri, 12 Jan 2024 06:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705041031;
	bh=FVagVAk5TngLIrDGYy7HtZKzmrE0BZg0s0H39wCDl8Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hjp5IuwgOjWll0g+JFA7E3RCQ9fxjxrJlNMOWYFGDHjt4q+TUgkz82/mhCmQdLy+H
	 epiqlJ6tfolqvlKKB020lsM317NTebnGFkWx1W+d1VlgnjlMzoDr1ROICe6Nnu6zZk
	 fa8FdA067kw4UzrDfc8BcUey3uDSsCva25PnFnMOXB4hRauEzGKEPx2gkkQ83iMIzK
	 uD2LAmh8JM8Oe+EW/J7sGSy1RzdU9aV7eTDqphGvuNsyU2Ssow+ySoXwAc/H4EpqbQ
	 lTQRN09sp2q/w37GJXyQcfHfeSfDfpfDkPeYdzRsgF89IjVFIfGs0NIVzV/iHCP9g4
	 rjDzfWowt+UHg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DFFC3D8C9A1;
	Fri, 12 Jan 2024 06:30:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Use hugepage mappings for vmemmap
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170504103091.17535.12850336367037808522.git-patchwork-notify@kernel.org>
Date: Fri, 12 Jan 2024 06:30:30 +0000
References: <20231214132935.212864-1-alexghiti@rivosinc.com>
In-Reply-To: <20231214132935.212864-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_223035_009917_03CF178F 
X-CRM114-Status: UNSURE (   6.21  )
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

On Thu, 14 Dec 2023 14:29:35 +0100 you wrote:
> This will allow better TLB utilization and then should be more performant.
> 
> Before:
> 
> ---[ vmemmap start ]---
> 0xffff8d8002000000-0xffff8d8012000000    0x000000046ec00000       256M PTE .   ..     ..   D A G . . W R V
> 
> [...]

Here is the summary with links:
  - riscv: Use hugepage mappings for vmemmap
    https://git.kernel.org/riscv/c/ff172d4818ad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
