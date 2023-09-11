Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7CEEE57DF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1/47EuvHbkxH7IievWkl+FbrTbjf3H/zdburyH05mYE=; b=A4tt5DjRb+DvqB
	ypJKM3ci9yH38P9IuIQF5TGKX+nLLHlw0qMx2jFzodeYtwZ/KwvxbdrdSN9MQ5TbofVEXAnZB7LFZ
	gn64uJ3JpFBgtkNjm4TmIEy2WTA0Qpd37+gDYWWgs1w8cPVu/F0O6MNhPYD8hw22auNM5xp0qO/mH
	LY4EPtfRht0+mqUxk7t7fjrlMffwoLfz3/E4c8z9AgiH30pZ/NIxwneLFV+Ajxqp+lojLmHjq03D3
	TxPFq5f1bPcUIzeBuGbNYwFZrjIfM4YXgallv78z4FTlKEwPLlwAkRJVHdQibh8/jYRDR94k/ziNW
	XYpMX1+swp2SSyaHeB1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjRV-000yP3-2u;
	Mon, 11 Sep 2023 16:07:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjRT-000yOd-2M
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 16:07:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C25CC611E4;
	Mon, 11 Sep 2023 16:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FD8FC433CA;
	Mon, 11 Sep 2023 16:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694448433;
	bh=tmX2pVfVNI/+1kYGhGjNbTdmCPLP9KsEEtgDj6OGzTc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cYEKcVUcXtLchc89h1zMTm7bx/jEQFjR8mRaNRm3NOWZbYbdiY3DpRQQatuYATHH7
	 v/6XeGAcgmBUfUcpmFBu50EaUsZ5BVfpBSwxnUAeQ5dOSl6swrfWBGXWz4hpuBKSBy
	 7PnKyAREgRRaqw8ajGa9+jwmoror6gIw7H35YFT/+/JzGAjbQAJ3kWVQWMrnWi9Jdj
	 T5Nzj4baIXtTGCNMy+nQfy5pOoFGYIJXvHgbs1K4fjX2s4/DhjCt6a/vOayaRO8dRi
	 y3wimlY6tdJm9dOsSfz5W9Y8RhuBLoK7b7NL6YoXv+qvldLaVwu5L9NluAOoqLPlMl
	 WPq06TYjLOB/A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1A516E1C281;
	Mon, 11 Sep 2023 16:07:13 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.6 Merge Window, Part 2 (try 2)
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169444843310.24126.17288767595067619083.git-patchwork-notify@kernel.org>
Date: Mon, 11 Sep 2023 16:07:13 +0000
References: <mhng-2cae48f5-f42a-4432-b0e2-bc1ee3e01ce5@palmer-ri-x1c9>
In-Reply-To: <mhng-2cae48f5-f42a-4432-b0e2-bc1ee3e01ce5@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_090715_833806_4BC5BC7A 
X-CRM114-Status: UNSURE (   7.96  )
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

On Sat, 09 Sep 2023 07:25:43 -0700 (PDT) you wrote:
> merged tag 'riscv-for-linus-6.6-mw1'
> The following changes since commit e0152e7481c6c63764d6ea8ee41af5cf9dfac5e9:
> 
>   Merge tag 'riscv-for-linus-6.6-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2023-09-01 08:09:48 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.6 Merge Window, Part 2 (try 2)
    https://git.kernel.org/riscv/c/1b37a0a2d46f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
