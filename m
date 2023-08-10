Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5334C001E0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 19:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AsMcBnPgZJ6Y0nzuGdHCvP0nDyH/2ifzXtbVKPFG8Zk=; b=UhUgYjhF4eTB6x
	PCPPw5HSkkpwFsUKge+t32h3tgSYN1hFqL+0Rm6cUrvu+vU+7tAbZqyWq600DJqpbWnAzVntAf4Su
	1yIoFj+PLhL4Y3iLwAhUNJPVfi52vmH5AlQ48JjztzVeQ/hKr9M1/FJ+WMnJuKDdWP2bnDSG0792E
	COrsk6DPVkz8PytGYpiviYvQ8m0nIKfLUVi+BNYdTdXGenQ5Sj/97LBapyPkdw6UlBOCNKkMCDxf1
	vkcs85WNBH3U+j+loRPaVKm0nP7NHPNPOIJysKMmUpxCak7Jzxxijg2KFGlorKvxUPIJhkyjFZMIk
	1srdF0B4VaHUlDZ9KEHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBfu-008amx-1W;
	Thu, 10 Aug 2023 19:50:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBfs-008ali-07
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 19:50:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CF1276311B;
	Thu, 10 Aug 2023 19:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D3DCC433C9;
	Thu, 10 Aug 2023 19:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691697022;
	bh=lZaL7F4p8juWuK24qniHzORDsGN+Q0e7boON0KwAsk4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qTKSWcipncLtZiwmk68OVLAVvo8tcnY+faD7r+SCkDW78hTVeG7Bv+4ZHYGYyY5zA
	 uLzffvV5fj7NNsZ9lzg6v1sNR2ZZCAor+aFqulU3+4Eveze0X9X8GDz6BGCInFk2TL
	 sXUtH0y4p6OwG9Sq4MK4Y0nL5g6sEvXr1kcRs6dkrUPXDQ3LY/S3cdop34EJ4FOhcr
	 Hk8sX5hWJL7NrgDScxRf8eulYh6VIxU5lsZT5TbMQ0iqRyo7yz5eYltWOgjfmog2cd
	 EIFsSZb5uKO7fn/mfw9dNQ7Jvl99nIporVKJqnB8sACnBbpN3baHD2TF77o56QnZCU
	 O6VDuwhOIdB4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2204CC595C2;
	Thu, 10 Aug 2023 19:50:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Implement flush_cache_vmap()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169169702213.10459.2982861934492504882.git-patchwork-notify@kernel.org>
Date: Thu, 10 Aug 2023 19:50:22 +0000
References: <20230725132246.817726-1-alexghiti@rivosinc.com>
In-Reply-To: <20230725132246.817726-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, bjorn@rivosinc.com,
 guoren@kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_125024_136440_58C66086 
X-CRM114-Status: GOOD (  10.75  )
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

On Tue, 25 Jul 2023 15:22:46 +0200 you wrote:
> The RISC-V kernel needs a sfence.vma after a page table modification: we
> used to rely on the vmalloc fault handling to emit an sfence.vma, but
> commit 7d3332be011e ("riscv: mm: Pre-allocate PGD entries for
> vmalloc/modules area") got rid of this path for 64-bit kernels, so now we
> need to explicitly emit a sfence.vma in flush_cache_vmap().
> 
> Note that we don't need to implement flush_cache_vunmap() as the generic
> code should emit a flush tlb after unmapping a vmalloc region.
> 
> [...]

Here is the summary with links:
  - [-fixes] riscv: Implement flush_cache_vmap()
    https://git.kernel.org/riscv/c/7e3811521dc3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
