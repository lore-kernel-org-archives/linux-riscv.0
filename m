Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5855E85391
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 18:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Ur7vllZiczYdKV5hjy5kgOJHrJ3WCJK9VtIXeAD174=; b=2CY5ua8tgahDh8
	9oX3Qd8/+b1D1ZU1zV6I3XRS6M0ycRHkEheEsaRsXfMP9NXW14sWxXiPfksv7yRJpv4B9BV2Oaeo2
	e/hpRGO4BNZu4/08G+lYkng3Qy8oHecScBiM5krN8ooKSeR+/g2cqa2Jh3DQZeQ0hUH+P8A/p/rGk
	S609kpoCm54x5Te6F1gjSRFxkb2jj04ZGcFKKtjzu3+aIUWIDdHnDvN1qyywHG+r4C5397F/F+9fN
	vFuhT/UNyn6GKoBLUIZ267I4C2xkrYHmfO53Stilr1IDs8oW/hY6U5JPUEPgOmyYVZyC7GB+vmNsz
	iDyjtF5j0IyVowGaWhaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8jI1-00000002QlL-3zAu;
	Fri, 03 Apr 2026 18:30:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8jHz-00000002Qjj-2qXZ
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 18:30:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 65E1944562;
	Fri,  3 Apr 2026 18:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49493C2BCAF;
	Fri,  3 Apr 2026 18:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775241039;
	bh=4hg0SDmodu9ulUBulI/MHscDJOQwTqQSM78LxLTkV4g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XCMr+YTK/Fd50sGFZCOqkg+Jx9qYKTXISGc1B6SA8eETbSARSWMePg3JKQx9d1lo5
	 drDMrper8pmn2wPyhqYaWUiJKGFBy7HnZKHlKpi9qSgoNre7r0PSlRhjlSAy16t87+
	 0TIcYf58CCnHUcTZ2ho7Stz1mIO1mgEsdrDgsW4HVXevJvKK1uolAYVPzhqyHIybNg
	 HVieWAVMHfMAWvIQj/NqBz/zQzgj4lMOunXDnfF+/soO7jNsEq6v0F0bld1JWkUd06
	 hAIkuuOwKteIfBgEhuvCB+bxvpy0udmt0mmTCbWqgZxErH5GmIcdpwrKNjQsVJCTFh
	 AAmfxYQMdIKWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDB73809A14;
	Fri,  3 Apr 2026 18:30:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] riscv: Cleanup and deduplicate unaligned access speed
 probe
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177524102078.1406513.13713846519162509736.git-patchwork-notify@kernel.org>
Date: Fri, 03 Apr 2026 18:30:20 +0000
References: <cover.1770830596.git.namcao@linutronix.de>
In-Reply-To: <cover.1770830596.git.namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com,
 cleger@rivosinc.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_113039_738278_951ECFA4 
X-CRM114-Status: UNSURE (   9.21  )
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

This series was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Wed, 11 Feb 2026 18:30:30 +0100 you wrote:
> Hi,
> 
> This series does some minor cleanups and deduplication of riscv unaligned
> access speed probe.
> 
>  arch/riscv/kernel/unaligned_access_speed.c | 221 ++++++++-------------
>  1 file changed, 85 insertions(+), 136 deletions(-)
> 
> [...]

Here is the summary with links:
  - [1/5] riscv: Clean up & optimize unaligned scalar access probe
    https://git.kernel.org/riscv/c/c202d70b2244
  - [2/5] riscv: Split out measure_cycles() for reuse
    https://git.kernel.org/riscv/c/83eb6102c71d
  - [3/5] riscv: Reuse measure_cycles() in check_vector_unaligned_access()
    https://git.kernel.org/riscv/c/b2dd256b5783
  - [4/5] riscv: Split out compare_unaligned_access()
    https://git.kernel.org/riscv/c/72f578aa02f5
  - [5/5] riscv: Reuse compare_unaligned_access() in check_vector_unaligned_access()
    https://git.kernel.org/riscv/c/eb88916053bc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
