Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FABAC25B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 23:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DHzeRhsQcOBK+MgLOZZIeWtU/1l4VlgRcQ7o2CUNTvo=; b=KORh9a9Xua8PuU
	T+kHZp5cw2KzSG+e2A/M+3xsVJUk7s6MpCxx8n45iPMOoUtUukWo/zK8bb6Mn3O48PPih+zQmYkNi
	hk5IICeDsVjhM27Ne5gITxKvL6ka5u+AhaZQnraOzwGjXXMXSvcfW5ckoDPlBYLRg0pCeZ2CzqWzx
	qZlVtQ+OXTGG8gbm7q+HcepGq5rz5cmj50JvxUWQbSh06E2khbXO1kk91Ez9486Gk+rzSuceo+geR
	dXACUSLqDc7jMIlzmATvXQDWGNL1h1S+ehWS3UH3qKu60qmnqbZcgV6OQ9KC4Oj95EVgwrfwXOtGH
	iE4COjYEqUFlZfCG4Odw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vkO-00000004VPs-0Peq;
	Wed, 22 May 2024 23:51:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vkK-00000004VMb-3DvV
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 23:51:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E322362BF9;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AF56C3277B;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716421907;
	bh=Wz6FwdvgNhDesiVH6dQghRM42TWv9+GR59lUb5hn/E4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Gdnzibckaz5cwwTCArZbF5NHieAhZNuBW55C4Js2e7xiejIwL1qDzPUSCJRA4neAJ
	 R08Kl7qzp/aMwumDYHWADsnV8sFbMKL2utt/IIN9SvaZBQUDDzAuJZJifx1iMAa7lb
	 OTyv2Mq5oKDHRbPaEru6GeIswqmkq+AY/hSGT260paQ6aCExrNfGryanLlU6WpMXRm
	 pEiU5H76wmMz/sSi2UBS6xN0g/vNjklDR8ZLGCNfniWGvLWVnHUOrfbkY0bxQQSB3b
	 W7IAGQzqvYTYLyZ6fnCfqo0rx3QvB4ROYjNYfvIZF31Pzf7bAfou3CRVq98rsM9p2d
	 ced3spMHDRqmg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 837C7C43618;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.10 Merge Window, Part 1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171642190753.9409.11050201174881713187.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:51:47 +0000
References: <mhng-e73e59bf-92fc-4122-9f9e-a329d20eba55@palmer-ri-x1c9>
In-Reply-To: <mhng-e73e59bf-92fc-4122-9f9e-a329d20eba55@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_165148_962728_9C5C25D3 
X-CRM114-Status: UNSURE (   6.94  )
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

This pull request was applied to riscv/linux.git (for-next)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Wed, 22 May 2024 09:13:28 -0700 (PDT) you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-mw1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.10 Merge Window, Part 1
    https://git.kernel.org/riscv/c/0bfbc914d943

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
