Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77475C5B559
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 22:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzqZQ2/1yaVlOTyaHGBPdzUArqfBf3zhQ5anAGXpd1I=; b=3MEBbYRjAtVwxj
	fIALG9y8DXY4BbthlWS7jIKRqtxR2QMLaowlPG90C2DCMsTUONmIIyb5pUwMqZhNc1TE8Pqei7r5J
	G7e1jO8r++QVFO2MfvdSvP+S9kUfX8DU2Aw+fJY8J4HTMti9oYg72A11v9S89X8P2e8Lm5d9LTiIc
	euv76TXwbwHUlmzrTpSqscCaLGmTwdyXfCKdEHNVoG8bBdd681du0RIzoy0RvE3PSqu1Kcj0BcSPb
	HYJbcJ1CTBjW2eG3ElVD4nMYI6H6bWZoy3PwONNF+0l1TfvXIabYLX5DmhH8PQxJozIm4iw/GjnS8
	8LyFB+zdQqFRe5Anb4LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDO6-000000099hy-1jpv;
	Mon, 02 Jun 2025 22:12:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDO3-000000099fb-1tqn
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 22:12:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 06F3342B9E;
	Mon,  2 Jun 2025 22:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85C9C4CEEB;
	Mon,  2 Jun 2025 22:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748902324;
	bh=7ygqIY0hkxuONzbgzQUnvO6isdISsOfjdB10LcXkx2U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=q6oJHWR2HZ9jbQXZh1SXuu8ud1e/g8On/Y0e3YTzF3iYh4P/gIenWRsNRbVHp5KVu
	 tdkPJ2qP7eEt4LTQbm6bL44ABi33nKENR5hFrLnSi0dmHxloK3W/DDSriX15Gm7up4
	 a8vBKICmNAYITyQNEIfQK3PLtHQ7wyXTTze8DS5UvNlFHf6roeBXvbOY+1PSsKgvXm
	 tmH2hjeRkag4lZUL1IMEGxJ1H7X4RIlg3Mvzj84jQ2NoyO0ypizG7FZLLibp2drw+X
	 vEaw/tv+AU9bDQGmobE7xT+Nrwt7XN55LvdB8YygnlaA+200dS+b9XGUi0lSz08h+b
	 mQh7C8I+85l+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADECA380AAD0;
	Mon,  2 Jun 2025 22:12:38 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Make regs_irqs_disabled() more clear
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174890235755.925497.16281060573681784649.git-patchwork-notify@kernel.org>
Date: Mon, 02 Jun 2025 22:12:37 +0000
References: <20250422113156.25742-1-yangtiezhu@loongson.cn>
In-Reply-To: <20250422113156.25742-1-yangtiezhu@loongson.cn>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, chenhuacai@loongson.cn,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_151207_513212_8F8B719C 
X-CRM114-Status: UNSURE (   9.68  )
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
by Palmer Dabbelt <palmer@dabbelt.com>:

On Tue, 22 Apr 2025 19:31:56 +0800 you wrote:
> The return value of regs_irqs_disabled() is true or false, so change
> its type to reflect that and also make it always inline.
> 
> Suggested-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/riscv/include/asm/ptrace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - riscv: Make regs_irqs_disabled() more clear
    https://git.kernel.org/riscv/c/91a072f84c2d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
