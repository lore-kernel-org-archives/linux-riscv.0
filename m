Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7791C43219
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 22:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfV8QWZjRd+ppFPr8LuspNtvvDn+BcEpLSNfkFM2n4w=; b=MP0zlNbtCSkasq
	1clT9fOLNp677YxUndNMv8nH/1WzLRefIbK9+Ey5x56xl9f46oD7tQxazeFMbh3cCYrRX62oWzMl5
	jwG7XosqU/Pqys/RtUo0vSxNreud2wTQyZvTPER4WtXHt2+r3vwfOf1E9q8tOzU3NNwJaR/AWvJAZ
	LiU972biZjiMb3Acr1Zw3YHxD23Uu2saHANDXsZrojgCkT7PPgERFyRppg8+XJO/SOcg2XSkZp4pO
	M8Bsp4a6LYWH0yRkOOH+2oJU1Nie5PRu3Ap5lWrCXPnLAv1rz3/QvHRTI6l6rwpPyt2Ju75uzrB+K
	vHgdWg4CdRTkRUL1fBXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otGNL-00Ao3w-JA; Thu, 10 Nov 2022 22:50:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otGNH-00Ao21-Au
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 22:50:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B0938B823D3;
	Thu, 10 Nov 2022 22:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54F7DC433C1;
	Thu, 10 Nov 2022 22:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668120616;
	bh=84QsudrNH/f0EHhVDmxqZ8qDJLJ+1IYEmL5AKFvoKtk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pCPWkmqNcfsMJl4O1gkVQ8F6luJk89T2Lbc7uJoT2r6rTUQRwP7asUngfqx+ISBdJ
	 0IP5feNKDjjBgFoOjNBiUfQGEUFGzdJFaTePr00xfMU7h03EZem/GaviLLmnO+Pcwb
	 5L0aavwxh6+MriXMoH9n8nKK1yv/z2A5cUvdxS6M7d4eZ04AGYdAqGfXUqH3nOEDKQ
	 GPK0S3SGy1o56N3aoO+N6IXo7v723pluqZYzUPPyDlCd1fGtxQOKJON2hHSYUQqHIc
	 RkOKbzjPsCqW3h5heV/sxXTOKg7HFd3WQPSxqthsdLnXvVawyhH/ezEQ6aW3yog126
	 KW0LXDKmeyZAw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2D33CC395FD;
	Thu, 10 Nov 2022 22:50:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: process: fix kernel info leakage
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <166812061618.32242.11997902319930265840.git-patchwork-notify@kernel.org>
Date: Thu, 10 Nov 2022 22:50:16 +0000
References: <20221029113450.4027-1-jszhang@kernel.org>
In-Reply-To: <20221029113450.4027-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_145019_535657_71FC584C 
X-CRM114-Status: UNSURE (   9.87  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sat, 29 Oct 2022 19:34:50 +0800 you wrote:
> thread_struct's s[12] may contain random kernel memory content, which
> may be finally leaked to userspace. This is a security hole. Fix it
> by clearing the s[12] array in thread_struct when fork.
> 
> As for kthread case, it's better to clear the s[12] array as well.
> 
> Fixes: 7db91e57a0ac ("RISC-V: Task implementation")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> [...]

Here is the summary with links:
  - riscv: process: fix kernel info leakage
    https://git.kernel.org/riscv/c/6510c78490c4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
