Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFA3C27C65
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 15:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4U70rM+C+l0rzwehr15EmqGi/04pEJjegErAPfZ/xU=; b=yY58BFE7+lTrBR
	r9uCtzZf/OyyLfabK+XwIqTLePRezy8+PpIxDIMXsyvuo1IbPDqER9sBIw/8KveNIdbEB8641YIvz
	VYvihlyXd+uSJcPQscKxEUHD6L5Ez+2ttgL/BvK3Pn1N2UjH4diQ9YxkTK+/CLword6h9A7KjHzCg
	Iont+tj+xjy8ZHvhMFKDX7L6tlMmcYoOpATnyvPqRc+ArXTwgMGFaG/xUbBU9O81BjnTLnyfPYqYQ
	9kBfjCQh+NU7aYw3jY7655m3GlEV6k5EvXTyPb46TC3DXblTKADUQoRpZnzH7qqn3QPzYNZ7mrA8l
	/6qZPSYHQQ4p2zwWGfvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGgpY-00000005bXc-3EnJ;
	Mon, 10 Jun 2024 15:21:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGgpV-00000005bW9-0rvG
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 15:21:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C4880CE157F;
	Mon, 10 Jun 2024 15:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0ACC2C32786;
	Mon, 10 Jun 2024 15:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718032862;
	bh=wrEyc/XOccK5lcvUAFHZMzKW2b4TGOK8NRquUO/ZqfQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YF4agIZLqnty+hVCpPe+arb55voccu/wz5PLFlNZmY+GFV+SflhWRnHCJG2ZXHxzr
	 2RPTZekLP0XqSVRu5Abbl9bPPzZLlSBtQm1sOAQttObYjIvHe4mFilJcxk/srfyuLW
	 MTqX4YgK36BXSb5HawiX9+23BAF65cX5Ta4e3grtys+Oj9bY9E4pH3ffMFo/wsOCeD
	 CCbJZFd9A91k1eGN08MtSCWbJTZAd6quINEi48uEGpB1kDVJyPJ3oAMwKdI1dM9XFQ
	 niMlJEn4vZHY5l0+m2/p40JmciPmyb1HDmYHyWVqBJ2PBoeypPJ3NlrpVQ+xv6jYay
	 U8iASVN5VEm0Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F18CBE7C76F;
	Mon, 10 Jun 2024 15:21:01 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Fixes for 6.10-rc3
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171803286198.3082.7486991860696715697.git-patchwork-notify@kernel.org>
Date: Mon, 10 Jun 2024 15:21:01 +0000
References: <mhng-1afb5c2b-25de-4eb4-a911-523495ad3939@palmer-ri-x1c9>
In-Reply-To: <mhng-1afb5c2b-25de-4eb4-a911-523495ad3939@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_082105_434747_690616DD 
X-CRM114-Status: UNSURE (   7.09  )
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

On Fri, 07 Jun 2024 07:25:49 -0700 (PDT) you wrote:
> The following changes since commit c3f38fa61af77b49866b006939479069cd451173:
> 
>   Linux 6.10-rc2 (2024-06-02 15:44:56 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-rc3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Fixes for 6.10-rc3
    https://git.kernel.org/riscv/c/0a02756d9145

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
