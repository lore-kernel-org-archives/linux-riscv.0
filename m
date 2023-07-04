Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F59BEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 15:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcifoM6+Kvbz5cUW3Cf307tVyzQ2nrAdoFitjuScQtI=; b=3QH0vruRggwz+p
	Dh9jBlqyCAmtbAoVSo5jBMy565Dr9/JedKh/KdPn1GgNro9x+xKYEmeAJH66xs+bTLZaD5raUzHGo
	fce4I/B7KcEAfCz0OlMXY+KBSX9HNH60TcDz2jbzIQTOuSMPsJdN3wnpju9i/EmH4JnFJNsMNHTIZ
	t/XaJOIxfe3WyikHu8dk8BDCE4bHeZpxw1jMUZfslDvcJbEeM0CKJe0TB98sRdWNYsqF8C1mFQjWT
	VS/rVX6f/xZ1IzpHaZEAPdhoBOhTmsMK0E7VGjzAlg+N5JIjtw4cyV0UNJhuN/CvduRi+Y59FTvXV
	Sg5KJHCGtwxBd0oDPdfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhYC-00DabR-3A;
	Tue, 04 Jul 2023 15:02:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhY9-00DaZ7-0c
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 15:02:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8CF346129B;
	Tue,  4 Jul 2023 15:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80CF5C433CB;
	Tue,  4 Jul 2023 15:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688482952;
	bh=pZQIos3lE3BbLDkJewoGyNyno+Bgimt5viqLRWMWZ2c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UnuUUPH1dYq/UayKHWQa1a9MrPqvIy9REuvyKOX+VbcbNZS9Cbkz+O6Y17sbtQ2FD
	 JsAbPqG6flBZk5XcGKJo3LpsnoZao4MmobQ4v/uJOEaa54XnMifBaz7g2maTr44G7R
	 5nO1ObOzWn2jbeKc5/AgcJ/PgDIHyYij62lk5a2qyM+c9Og0MeKyHyLGiq7SWHSjI9
	 xpFA5W50YRChGrom8Y/Ya7aiDamaSwQ0mYD7HvOcBtIDKrv4QMneu+1dPKacIIo+rE
	 e8YoYO9LXImIyczVSTSKnHj2mpb2kvopQxQ3CpTgLV65/cjbXq/BwSkV2f6iagKi9K
	 u79xpiiLvapKw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 64A71C691EF;
	Tue,  4 Jul 2023 15:02:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: vector: only enable interrupts in the first-use trap
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168848295240.29521.6669967392814389702.git-patchwork-notify@kernel.org>
Date: Tue, 04 Jul 2023 15:02:32 +0000
References: <20230625155416.18629-1-andy.chiu@sifive.com>
In-Reply-To: <20230625155416.18629-1-andy.chiu@sifive.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 conor.dooley@microchip.com, jszhang@kernel.org, bjorn@rivosinc.com,
 xianting.tian@linux.alibaba.com, mnissler@rivosinc.com,
 richard.henderson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_080241_287920_D31E11CF 
X-CRM114-Status: UNSURE (   9.42  )
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

On Sun, 25 Jun 2023 15:54:15 +0000 you wrote:
> The function irqentry_exit_to_user_mode() must be called with interrupt
> disabled. The caller of do_trap_insn_illegal() also assumes running
> without interrupts. So, we should turn off interrupts after
> riscv_v_first_use_handler() returns.
> 
> Fixes: cd054837243b ("riscv: Allocate user's vector context in the first-use trap")
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> 
> [...]

Here is the summary with links:
  - riscv: vector: only enable interrupts in the first-use trap
    https://git.kernel.org/riscv/c/26c38cd802c9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
