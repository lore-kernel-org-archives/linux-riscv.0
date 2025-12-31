Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143FFEE57D3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Dec 2025 03:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6cp+NPLki2AaMcsoJzG+p0ViSJreXOPlBnjintpUak=; b=JD5+wZD2rsVj3D
	5yOw7OUpUAL0wKjh/i78tcpScUYW9oaZwDqBgkXBXF+7F+6W+RbHerSXMAa4z3OQFXWRPCZi/om2k
	i+Q2JJdJdoHsip5gG1Ui/fDaCc3uPS0Qova8Mp0VJEkBAmUCk55kaN57ouCYME8+lEwGOIb3ezorO
	4C3UoOabNkJs3WgS78WbBoFCkpM52XOJkB/lgyXyKlzEqe8S590IEuVsvu0PXvxP9lGsAqGFQPueG
	g/I7Ib/7chyAo32ZV0lwknSX9Rd0lD1tTLkmO29NQDGt28vbgKnuG/1W1BMARlwlvL8bPwYOsyI79
	9xmaUA9adx5/GJKbVpFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamzC-00000005e4z-0bni;
	Wed, 31 Dec 2025 03:34:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamzA-00000005e4T-47Ma
	for linux-riscv@lists.infradead.org;
	Wed, 31 Dec 2025 03:34:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 21D1760008;
	Wed, 31 Dec 2025 03:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3DEC116B1;
	Wed, 31 Dec 2025 03:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767152095;
	bh=eEV+BYVsuwLalAqlkiRONaACRt+zlDbvjbq/Sm/p+Ec=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ouXx29PImiPloHd4J98lkiXKSgMYAttKpGOEwS0lex9aC2dpJmXk3s57Zy3AkqdOm
	 32VG1wDjIgK1vjkGP0Rr6zif9mv35u2JKsHqDm7Vs7NJqi6F1gTMhyQ+lbmDKmH0ZM
	 K+sGoa7UZNmjVhzYp2dyglWXuaENfYrkKPNadypA0b9lA0RhknVckp5XNSVFeQh8oA
	 eKK6woXwMpShaU+H9bTLQkMpsYx3d0bzTAniNGz9HF8Qxl8sjjsQ5/P20BZQiPnMEk
	 hPYrJjfsYGCIWpbvVKl6Qk7C7gn7Un7QIZriYdkWkK4rs3jrdSxKP1qx5wMlWzxgDM
	 dF8qdh5YURmBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5A7C3809A19;
	Wed, 31 Dec 2025 03:31:38 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V updates for v6.19-rc3
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176715189753.3416240.13725683049999454282.git-patchwork-notify@kernel.org>
Date: Wed, 31 Dec 2025 03:31:37 +0000
References: <fc36548c-baa4-821d-24cd-2f645f7d9cec@kernel.org>
In-Reply-To: <fc36548c-baa4-821d-24cd-2f645f7d9cec@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
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

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Sun, 28 Dec 2025 01:18:38 -0700 (MST) you wrote:
> Linus,
> 
> Please pull these RISC-V updates for v6.20-rc3.  Nothing exotic here;
> these are the cleanup and new ISA extension probing patches (not
> including CFI) that were originally part of the second pull request in
> the last merge window.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V updates for v6.19-rc3
    https://git.kernel.org/riscv/c/03de3e44a706

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
