Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98F6E77180
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D12hKIOFOum/XVI/YAK3PsVPPwHF3y3oEYj+LlAZOnM=; b=lcaRFo1BOmXl69
	jxISOGNJt3LoDstDT2LvhlArex1eo2blYsEjWkc+40Jmr+qrWeyg7l96XJ/0l04jiFQF9sKNjp00V
	TU69mEeKkBjMEcjsE2waNDXIdBlT9ndCRew3R2wiby8Q0C/vgLjHffWX+tcNa2I2SPKy+FQ93yN4D
	7cJLykSg0tlibx3KWeIaOtn8gm7Kgydz7ar0JdOlzMIFY1Q77PXbbF+KCiuNjpgESVcaey7nai94a
	Vh7bLqWR3/V7Z7wqju9jEPnuBvLLS/01KZHpzD9XWkaxNdUgb3lDV/UnNL6kTIsQEjBvfCjcpSuq7
	LxvGLX9OQ6UhHx0fkgpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGu-0000000GLHC-1wMW;
	Wed, 11 Dec 2024 22:33:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVFq-0000000GKT0-2hw0
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:32:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7C95CA41D98;
	Wed, 11 Dec 2024 22:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5B7C4CEDD;
	Wed, 11 Dec 2024 22:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956345;
	bh=5vmuvjk6RoBwup6k71p7vUifjXpsm4ye3iQ3ZPNS1h8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ukw4RNgGUAE64Vy8haez74NtEENstVoiZz1flviLBxKzhRlBl2kuOB7APXGu/A33C
	 vir40lDc+ClGeNwoNXK0pk/wbGAzsrXjTDC3Qq/PoOCf4zdCrsFX20ZNZK7ft7MeaX
	 ww2MiiRkM+1i1mZDuLVyvnXmoAFbUQLtZ7S18oR0YZvc9IqRxiCwH92b8sopDQBhWj
	 bT4UYfWguF5pPx6D115kdCN0f1HvcH1cQ8461TWb96e2OT7m4shrtT6k1nNnoma396
	 qnKr515hAbUDQ9sqAasxTQ2V069viPoGiT7QVutdwPI6tigI5XmCYZcmNdClwgP9xa
	 07JHF1fDQrLmQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD59380A965;
	Wed, 11 Dec 2024 22:32:42 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] pinctrl: k210: Modify the wrong "#undef"
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395636174.1729195.16129052745847104611.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:41 +0000
References: <20241113012029.3204-1-zhangjiao2@cmss.chinamobile.com>
In-Reply-To: <20241113012029.3204-1-zhangjiao2@cmss.chinamobile.com>
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: linux-riscv@lists.infradead.org, dlemoal@kernel.org,
 linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143226_751053_200D9A12 
X-CRM114-Status: UNSURE (   8.75  )
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
by Linus Walleij <linus.walleij@linaro.org>:

On Wed, 13 Nov 2024 09:20:29 +0800 you wrote:
> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> Here shuld be undef "K210_PC_DEFAULT", not "DEFAULT".
> 
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> ---
>  drivers/pinctrl/pinctrl-k210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - pinctrl: k210: Modify the wrong "#undef"
    https://git.kernel.org/riscv/c/7e86490c5dee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
