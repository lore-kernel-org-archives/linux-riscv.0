Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A59C83038
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 19:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FRasLwySG12ojcgiBWKhbo3uon151EEPocSbJu9u1k=; b=YALBLRaju5LAvm
	h98x6U7wFDA+Rc6YqgwUjXakFPp9VfAQjm5bDSj3J+MPuLkAQCsLtZxHFlPoToIW4GkOp6UFgcS63
	7zkKyDzHcoxSE0fX32BczVCcYuFlnf6KY8I+AiWun/lD1xLVTmWQTQh0z2bPo9nQjBVlCmDVvXM23
	kNTRstyYF2LY+PpYTIRUOyHW6Np69dm0OtAz6K0A0i0wMhxD3wCdZK8SdG9Hl+Mqsp0vCc0aWa5xv
	ZNvzfqB3qhvftQmoYZSbU0tzr8nEJZC07ZU3rNOPp3FoR2SGOpo/QtX0j0HdcoLw8XdEvIJMig0Ls
	EXN/x51KnBh1g1KxN+LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2uw-00000009NSD-3RHy;
	Wed, 02 Jul 2025 19:14:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2Yu-00000009KIj-2QnB
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 18:52:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BBB3F6111F;
	Wed,  2 Jul 2025 18:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729CFC4CEE7;
	Wed,  2 Jul 2025 18:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751482323;
	bh=An5eZLxeHN2VPzfu1AgAXV1orrEO9TkqlxOeOGf0JUI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LTnlMhIi5PBxhkf7c6QGmLVj+n3EWVMy6XtrDXf1BYVJjOPGI8w+2GJ2xP2gwYenN
	 f8eUot2C843hDc3Qv7NT2RUuBrwUdxvf6J+TTgxJCHIPpUNIRZjXXOW2+5z1FbMcqs
	 kebnDUm2/E5lxmdGzCKcbub6zzzJLWqDSahxk+TcpYvrvrSJiIx0FiuyCDyscplBkq
	 GkTQQSyWkMRpGIP75gV8jW0gp5ewh0CrlCR1ykxKURHKCe5VffRDMsfFZ2ZoKT2PZu
	 SlTcr8452jxtAnPqPB9WcCVH+WD5ltdFSa3KXKKXpPoQYyCSSIaKk699mEsLfY1JZd
	 VtutKos1d+1JQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33A30383B273;
	Wed,  2 Jul 2025 18:52:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Fixes for 5.16-rc4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175148234801.828808.9478212728527237912.git-patchwork-notify@kernel.org>
Date: Wed, 02 Jul 2025 18:52:28 +0000
References: <mhng-BFF0FF2C-E730-45D5-8E5F-48D03E841EB2@palmerdabbelt-mac>
In-Reply-To: <mhng-BFF0FF2C-E730-45D5-8E5F-48D03E841EB2@palmerdabbelt-mac>
To: Palmer Dabbelt <palmer@dabbelt.com>
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

On Fri, 27 Jun 2025 12:56:49 -0700 (PDT) you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.16-rc4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Fixes for 5.16-rc4
    https://git.kernel.org/riscv/c/867b9987a30b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
