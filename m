Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBF2CF64B2
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 04:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ORNhCDVRrzfapMr8/Qe/gH8FjJwxwgHqKJKdclhi4Oo=; b=HujknOPfK9ejWy
	BePmlA5uD4tKGgVatUaYUUyoJIpkXrGJ8qbJDVQlLDmIB3AB+XQJsjkPL7TsreNcTqKnhxKf1T/KC
	boUHSQl+nNNfjtmT4S4cG/qR18efxiy6MmUCwgmxCLkPSKlLhyoMESGKabP3MButnZ8gQpvEy1lS0
	NdxaiHzEEBfIsbknI524ayd7BAIOL/IwBlFCYX71ahZ0ou1FyHb0NHA+lW150SR5rZcYQda+S1Zvp
	lkIMwKaEw3bDGmZv01N53wlGyNUIKUTuj4rl+RzZ853kj4/oeyxEowSDfLUFnqlPSDwZlAcxQzEef
	4oeGBjx/pIBH3m+GHJrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLwJq-000000068x7-2pZB;
	Thu, 20 Nov 2025 04:30:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLwJn-000000068wk-34CJ
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 04:30:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA851402B8
	for <linux-riscv@lists.infradead.org>; Thu, 20 Nov 2025 04:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB9B3C4CEF1;
	Thu, 20 Nov 2025 04:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763613050;
	bh=ivsZEoqzvW0+xayQY7x678NnWwOxJ49fdmrEq9OYE+8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cAXb/aaDIwLDBjzD0uSHbwW4+iCsuerFkeMEyswTz1pncamE/o+ltmKsNYy2tnFgm
	 VGJXSZrEo9y7Aiiur056D3HjbxCGjKwCg2+p/MA342mM1jZrPfpNcpVBSd2jIeatc6
	 qZ/p4NYQ7UJm1yNGkamoRORLY1dWtP0VKqkMUF3S/o/qCDuhoNiUCSWkgIvImVeffp
	 Kdj+ZyjX9TDfMAtq5XrL28AXExa0j9xKk8tDu+ctvx5oChgRUFI69RFXTbF/BAPoVF
	 80AQTquBaCvmacDBRQswmEzYXny5uHwVo455sRIzhRwtvZTta1qhKEj1VkGNlQDJzU
	 1GSlg1buF7V0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F7539EF974;
	Thu, 20 Nov 2025 04:30:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] riscv: mm: clean up and optimize some page table
 get-and-clear functions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176361301624.1077848.16912993760479044888.git-patchwork-notify@kernel.org>
Date: Thu, 20 Nov 2025 04:30:16 +0000
References: <20251120042001.1766011-1-pjw@kernel.org>
In-Reply-To: <20251120042001.1766011-1-pjw@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_203051_812045_2892AEDC 
X-CRM114-Status: UNSURE (   8.48  )
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

On Wed, 19 Nov 2025 21:18:27 -0700 you wrote:
> This series implements some minor cleanups on the RISC-V page table
> get-and-clear functions.  We continue the work from commit
> 546e42c8c6d94 ("riscv: Use an atomic xchg in
> pudp_huge_get_and_clear()").  The two themes are:
> 
> - avoid atomic operations on non-SMP kernels
> 
> [...]

Here is the summary with links:
  - [1/3] riscv: mm: pmdp_huge_get_and_clear(): avoid atomic ops when !CONFIG_SMP
    https://git.kernel.org/riscv/c/44d98d7575d0
  - [2/3] riscv: mm: ptep_get_and_clear(): avoid atomic ops when !CONFIG_SMP
    https://git.kernel.org/riscv/c/ad6a7d4bcee7
  - [3/3] riscv: mm: use xchg() on non-atomic_long_t variables, not atomic_long_xchg()
    https://git.kernel.org/riscv/c/36313cea1273

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
