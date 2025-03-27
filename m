Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F3FC36002
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 04:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CtY8GnXEm7O8CQtXRG+TWdNYuCVEPvYIjOJTa7SM8v8=; b=bhhMkaILl0DDzm
	GLGKDMDcjAhk8jU7lZvn9SETE9wNR8DqeTzh94xJJsFnnB74AHR3ykEMOp9H4X4SSSELQkjErectO
	u95TqdjL/FZ7QlnMWxhBiM7NbDd3iCB62v4IU0kzcB2Q0PId1SBhqj86SNI3l3Ag3A4r5lriDPcs4
	YaPuwCC7B6INFz3bQdcG8ZwE3qYMqh4OyWRYQY+KJAmPLCw3zVKlrfhJ8G34gyESrRTB2+A1WT8I6
	9PQnx0vx1tMsENIj4wNnSk1DRiNBDHZ1qCcKKGyBXeV9GMJ7eJwa62bJaa4ZJKGT/k1Glp32qjYC2
	SE9nHC1wUnF9z993r4FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txf1A-0000000A9yw-0Un5;
	Thu, 27 Mar 2025 04:39:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdrU-0000000A4yW-20Fc
	for linux-riscv@bombadil.infradead.org;
	Thu, 27 Mar 2025 03:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BBRZJt+l8XjAeStgcj/Ygwh34+xEJkJOL+vYv+weR7s=; b=bjcrDwuMEPnyO6XsxwFrXfJN5Q
	FvOFwY+gve/nGGlig5N5RPw9a3JiEkvTr+kBfQGR1DFQ/egY0H8yM414iVlbVOFkYnkk0NSnftHSk
	oHZwL0oyH+hSE4Uw323DkfyY/yud4VYvhJWR6ZVzHrZLkVMuwFlxTnH3WxqUk+bDIfTzrNd0sa0mi
	6PHPV2WSSyznPky2u1vKY1fyfEQ0XmZXNAwU0gY3lVKro/C59AsrTJlcbIdA30FMalBhugmAlYvaC
	l44QVBjUZSMW4hoYNw5zhKUzZCcX392KrYRH2mcUFhc7eGc9XkJ4K2xX2E6EVkD5hJ33gNvrgW77q
	RNB4a5zw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdrC-00000005tLD-41VZ
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F37DEA41AB9;
	Thu, 27 Mar 2025 03:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9811EC4CEDD;
	Thu, 27 Mar 2025 03:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045876;
	bh=Bn/Uw0tcOtu+ptdfREC8J1+mUrr776utjD3xLOZbgEY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Rs6vK0Mc05loEiunJGgz7boRG9ds5YasZMOJzdSzQk320i6w+OqwsozSan9FA5j2L
	 HtgH9/J/F6tUCohLlKoZWpGeNYvX7RKXbPweexeJ8567SD840tbPyBBZM4j0UFKX16
	 gcG7tgpQwWbgUE0keg7aZyuVk9074/8cch0CTHJikwnfaEtWxu/he48HrYeFBiVkNO
	 SlpHjp3/5BBMeUdRJbNHeLatctOyR/i5mPJBIvSPgbs0Vb0a3A05V84TK2l8wTb+Xg
	 cr6lzQ72rndBVEyYj5Y6v5mwH3Rse92qBiXbL46syDeYlOKwrli1DQi/mtt9AwyWRx
	 ej7/3MYoeC9Og==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33ADF380AAFD;
	Thu, 27 Mar 2025 03:25:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix a comment typo in set_mm_asid()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304591275.1549280.4529135035725430300.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:25:12 +0000
References: <20241114212725.4172401-1-yikming2222@gmail.com>
In-Reply-To: <20241114212725.4172401-1-yikming2222@gmail.com>
To: Chin Yik Ming <yikming2222@gmail.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
 samuel.holland@sifive.com, parri.andrea@gmail.com, atishp@rivosinc.com,
 charlie@rivosinc.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_032439_214917_1FDC135C 
X-CRM114-Status: UNSURE (   8.43  )
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

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Fri, 15 Nov 2024 05:27:25 +0800 you wrote:
> s/verion/version
> 
> Signed-off-by: Chin Yik Ming <yikming2222@gmail.com>
> ---
>  arch/riscv/mm/context.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - riscv: Fix a comment typo in set_mm_asid()
    https://git.kernel.org/riscv/c/418af0eafb48

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
