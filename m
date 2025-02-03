Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF71C02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 21:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCcWNDSSgswA9nLt3TZDHXrFUCkKVwSK4CEA+ZPMw/Y=; b=FEDtWX8sDO3mvP
	9UFmSN8nVruMwL3ULlEJPHf05MT+Q2tCJitWXKlWyyYoFAH3dBrFM6nE3amX6rQMB8qds9K/6KiSB
	1uCApl7Mfe3xITSmq0ZE5Vu8T675cGXkddQAXn1mKcOl96lgKBQZUzI9mMy6hUe2YMyZm4twO9K1h
	IyppvxX/JAF9KQ6Qt+aNXMe6mXP3fp5i+Qpte4gAhF7Q1DsKz6j8gV90xf0/wwct3tXxcwOrUk9yz
	khCYMUvIPGfNNUlui9FJtI+ElmJ707g5xOjLLe0nHrP8gzzAIl/kdJ2RiKSYXkEtD2Qmrj9QMVIY6
	t9w9+luwSeyvPJoZMScg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4GO-0000000GiHE-1AzA;
	Mon, 03 Feb 2025 21:45:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1uv-0000000GQIz-2m21
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:15:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B0C21A41C08;
	Mon,  3 Feb 2025 19:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BAB3C4CEE3;
	Mon,  3 Feb 2025 19:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610132;
	bh=hBLhlVSC1SmOlLRf8RDLAqvCsEbTbnRq4ZQNK7Br7uo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ClnQsAz5OX2tLhHtVD8bfZen/YHh+8vlLKQKg8bPO2nKNkXim973IcVAkQNpjJmTj
	 tTPQagPuP5OxVqYg5xehg/oKrKHDctXRhTI0aQE5I/G3DqmQZELJXgyORI+kBysDrH
	 jyK+GIBjnuJrD11YxtROBOqGr5kioEqfYtCpZIA9tUM/ubI3HX1GeWej1ABHin5PUu
	 dfq0ojMP4yk2SACTHcy7ZI6hRLLa/oQNvhOzd6UyLAjJAi88gzj99e/p1x6MlPCXRF
	 nNY9IGtuq30nHFVZFuTkCevkerlhvG46yrmy9dofKD4BAMxNIBZTOzr2DyA49VFv0L
	 gsiYVvD0O9U2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB7E7380AA67;
	Mon,  3 Feb 2025 19:16:00 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.14 Merge Window, Part 1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861015975.3409359.10153354970429495632.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:59 +0000
References: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
In-Reply-To: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111533_762978_35F2BB08 
X-CRM114-Status: UNSURE (   7.27  )
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

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 31 Jan 2025 12:08:40 -0800 (PST) you wrote:
> The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:
> 
>   Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.14-mw1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.14 Merge Window, Part 1
    https://git.kernel.org/riscv/c/1b5f3c51fbb8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
