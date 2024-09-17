Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D68C35FFF
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ynyI3QMLcwzKBX87ssPFORnfovnP5GZn39Kkg2QMzII=; b=dtzzcic5Sf495s
	GqUPANiWRIiLZ9ub6h6KiQFvmvZPGjo8JalZNh80qyyxHX6EcQTIgcnkkrNUwREYTaliXULcf4znQ
	w03V7L2D7uT53Pfsnn/GVDujPmc8XqdkZeStw/rhrEDy5zvg2zZYxg7ahY62QMR08hQ56kuc78b/S
	3Z8VSQcn7mkICrmVQ1ZozjxRETXeY1m35lxEg5cFdx+5HIApNpIbjgzsHtLqyATC2VxGZiPBY60eR
	WDLz5/yEbPO+oQhj09f+m7VnSUuoC+lWtnXQbUwNaFSO2bUi+7jyjiL3foSb12nf4INbnct5C7D3L
	t/fO9xDjnjbpYnQnSXdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXp3-00000006Aw7-1kPY;
	Tue, 17 Sep 2024 13:00:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXoz-00000006Atg-1R62
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:00:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BC833A41485;
	Tue, 17 Sep 2024 13:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DE6C4CED0;
	Tue, 17 Sep 2024 13:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726578044;
	bh=pIppZEbDiVADR7CG3QuxR5cXk1Q5xPxo9bdADzgacR0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=M4IRscx41RmjikmLTvfArV6iuO3WwyTmo84DRb+nmVghVFRO0p9kcwfmJN2hnPGPs
	 3c/U6GRrFRD/IIdt0PI1dMV8wwuQaWQKoaicZHcLgDZy7/hnAAjDFd0dF24Tg1tQ45
	 OjGSRVlZbDJbpg0+9+MyxlzNsroZ5AvAfmDS88Vruoic/d+24USBerU0WHcL+cRyBc
	 Fx/FpWXsQDjjNB6weZ7gc9uc63EV2XvD5qRsgwz6mLXnPtLbhFQnxrhn7hx0W+8ZKc
	 NaCfViG+M55Sqo0tkeHRoQn+h6hmTrgJZSH6i4nkBVll1lHwfEtpsbDDvnrbuYVc2D
	 h8GpD6vz6TjZg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EC3D33809A80;
	Tue, 17 Sep 2024 13:00:46 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Remove redundant restriction on memory size
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172657804552.126252.15064993791243643422.git-patchwork-notify@kernel.org>
Date: Tue, 17 Sep 2024 13:00:45 +0000
References: <20240624121723.2186279-1-stuart.menefy@codasip.com>
In-Reply-To: <20240624121723.2186279-1-stuart.menefy@codasip.com>
To: Stuart Menefy <stuart.menefy@codasip.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_060045_466614_3E95B46A 
X-CRM114-Status: UNSURE (   9.85  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 24 Jun 2024 13:17:23 +0100 you wrote:
> The original reason for reserving the top 4GiB of the direct map
> (space for modules/BPF/kernel) hasn't applied since the address
> map was reworked for KASAN.
> 
> Signed-off-by: Stuart Menefy <stuart.menefy@codasip.com>
> ---
>  arch/riscv/mm/init.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

Here is the summary with links:
  - riscv: Remove redundant restriction on memory size
    https://git.kernel.org/riscv/c/d6a1928134a1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
