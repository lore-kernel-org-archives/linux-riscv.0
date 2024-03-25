Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8ABC54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 05:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0hCUGUjA/5NWMvdIFvCkz9H4AOx80pya7rcZZu1zWEA=; b=0i744ELBrMJnkm
	b3quPZUWVIGvbLTPj0WKFH0lYNcTMdo0ACsFZEZJflzXf/oBSQeVE9CL6dWQXrv1jx7nUfTbPDYON
	TMHQLRhY+Nkq7KfroSrZKYrnQAQoDE3iwGMuSyYR/bJW4EbkF3Bat2WUBIS0jJif8vpb/6CpPe3n+
	oP5fD8HNStmXOOeZMcRgvjA8nyCNhv6TnM2/cvT0KuTU8zrnb+m0/zWw0l3RPwJ7G4nAd8xeNcUA5
	DEWx8+shx/RgSFp+JlOf7tP7oqU7+wAcyqBmLm/WDw7D5wRvQs0rH5l5AmuW2o2qK0S8ppYCWmHHB
	JK2yMkWHeJ6NxvBQHN9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocRG-0000000FJOD-0wtC;
	Mon, 25 Mar 2024 05:00:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocRC-0000000FJLF-11CT
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 05:00:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 77B39CE0627;
	Mon, 25 Mar 2024 04:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B83C3C43394;
	Mon, 25 Mar 2024 04:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711342795;
	bh=twiWJG016BhE6H2VQrQhrLXAYDefBJMGhfYkdlH/bJE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=u6j1C1/eyAxYa4jflK6bjYjmw02F4pPpmS99/FWyD9u91NqHkAsM4/1wtk5UXpb9N
	 UVzioSos0DdaRyGs9EVyVQfLjXkJuM2qJ1vBX8tBG5olkQCMPj+sNrKE+fjRN6XnGd
	 13fHXtAG2oESQC7TVBum3msoyDth7WJaYf1lRpXmMPUcUNOEdpJTSFwz4jB13vSVt0
	 oFXO6jE4l+QkZXYEs0OGwnypESfejVyDW8bfCiQklzRv+Kse6nNWja87fpw/wgRlh0
	 CHqPA0wHyiP7W8j6Yu2p/pWxwN1p9c0e1W+2aPhIrHWVgxV6odavpMjcVIYTg5tVvH
	 iHW7r9gV648rg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A9825D8BCE3;
	Mon, 25 Mar 2024 04:59:55 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.9 Merge Window
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171134279569.18749.2557475397474494419.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 04:59:55 +0000
References: <mhng-105d6a21-7483-4a20-a9e7-8e72770737d8@palmer-ri-x1c9>
In-Reply-To: <mhng-105d6a21-7483-4a20-a9e7-8e72770737d8@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_215958_477004_BF3039EF 
X-CRM114-Status: UNSURE (   7.29  )
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

On Fri, 22 Mar 2024 07:22:06 -0700 (PDT) you wrote:
> The following changes since commit e0fe5ab4192c171c111976dbe90bbd37d3976be0:
> 
>   riscv: Fix pte_leaf_size() for NAPOT (2024-02-29 10:21:23 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.9-mw2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.9 Merge Window
    https://git.kernel.org/riscv/c/c150b809f7de

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
