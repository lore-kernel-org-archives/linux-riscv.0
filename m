Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBEFC83F15
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4tJUVe7H4I+HqfFht1S2CGLEk4F+5sbAO7j/dy/l+Q=; b=Tyx4t/s+zFoW3X
	4bn8Edhj9rzaHzEm94cIus/8C1XgCb9mseQMPXDNtEBfzRnN8dhfj5HDVRvs8soVh9nsKQvLr+A0i
	jvFp2j9zU6n05TpJ2nJiHsJzmU7mXpz5U07beYdb0c1Hz15gu1Reaxpb+9qTLoThIIvUn8y6FcqBV
	4oZ6oRqweiJ3jt8+xuUGS8PNJ02rLzsi4cVkbnCbkRBzF9YH9zlSHc1tH2p3dt22CKUhSXXRWSmYW
	TqgfqMkWKzzQI66d84jTROEI+IWPOoZ7qCbOA7N+rz4NzUmWLWIUaM6aTqn+nap+C7C6CJPmeoDaj
	tKp3GZszeO/bLWEJElQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7e-00DXXD-36;
	Wed, 30 Aug 2023 13:20:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7c-00DXUU-0R
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:20:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2005F6152D;
	Wed, 30 Aug 2023 13:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86FDAC433CB;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693401634;
	bh=mI4H49OCWKGQOotvEaAIfhMsmRpR+4hUEBUlcGXvv+I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PaQ8Vtmr9xFNm6nKLd/vOFTD1/MeECYKjeULxAN4hsy5cnRBGn7f/TQnLhmXiIW6h
	 +2gRyPGlXUJl9cwKIC19MknG8CogVJRIxD/UWU+De5x1b/OEcGkOiW1hCrpdLndnZO
	 eZDwDY2TW0GCcSM//EroqS21aDggtt9LCyFscH7vEC5VbhiYwSMeLfBSOgRXPfHk5A
	 RNC3GVfmd9U1d/7pKNdUH/5X2l5tTcnQxVAQkd2EFCBPaNUFygmYgVvc+bAJWI5vqH
	 fmBVc+TpKMugK37VSivIA32tEENg1nuFNvVePiU0klc5mBIneGN6lS7QhaNzfaJ45q
	 nkMVb1L6oEhrw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6C4C2E29F3B;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] riscv: kprobes: simulate some instructions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169340163444.19859.10873904583580797287.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 13:20:34 +0000
References: <cover.1690704360.git.namcaov@gmail.com>
In-Reply-To: <cover.1690704360.git.namcaov@gmail.com>
To: Nam Cao <namcaov@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062036_242130_F00F7B0D 
X-CRM114-Status: UNSURE (   7.63  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun, 30 Jul 2023 10:27:06 +0200 you wrote:
> Simulate some currently rejected instructions. Still to be simulated are:
>     - c.jal
>     - c.ebreak
> 
> Nam Cao (3):
>   riscv: kprobes: simulate c.j instruction
>   riscv: kprobes: simulate c.jr and c.jalr instructions
>   riscv: kprobes: simulate c.beqz and c.bnez
> 
> [...]

Here is the summary with links:
  - [1/3] riscv: kprobes: simulate c.j instruction
    https://git.kernel.org/riscv/c/a93892974f2e
  - [2/3] riscv: kprobes: simulate c.jr and c.jalr instructions
    https://git.kernel.org/riscv/c/b18256d9b744
  - [3/3] riscv: kprobes: simulate c.beqz and c.bnez
    https://git.kernel.org/riscv/c/d943705fba3a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
