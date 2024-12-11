Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089CFE77182
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 23:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nOYQehJYst1VY+YWISN9BjNPtTGlUHT0hFg7XpD0h0M=; b=LOv4lcoeEzRcJS
	65N/dcx7zXkna9skEDlIrJHu6KEKlp0D+W70XEn0YtAo2wsX4p1x/9zm0PxEoR+LL+ZEZ8am6CSHX
	WwTd6N0YKL6pumIpjDOE2eVtw3GyMWIWoh/+qYWwRIBNc1JjTMl71kLi+TsiUA8qjcNCPaUWaU30g
	bO4GOoGY027z4C67oldyPgZRd44KbyuuIiEmsTBvFHLP09ZEr9rzKl5vK5d5rdDSK1lU6ypvqtdon
	xapHlz46jmz6jDF0fXc0LWpZkjNiFCZFJ6GQrZcR4qi1PsuvrmNmFOHZfRQ68t4pyZaSNm1RJCX5h
	DXi5J2bHBO++ETIhasEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWOh-0000000GWqa-0ODO;
	Wed, 11 Dec 2024 23:45:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGP-0000000GKu7-0s9D
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:33:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4885B5C67EA;
	Wed, 11 Dec 2024 22:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690E8C4CED2;
	Wed, 11 Dec 2024 22:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956380;
	bh=+r7obNnqA7SvuvQvjFDZpPRvtSWlHovJxu+KW41vPZM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sX1m5oM/pt2uCA/7BkmXCnUscvWJ5y3EA8oKefUedT6RK15/amkrFVM8gBfk/6KLf
	 mnqMHyVprwVj7gR68d4volCH41ZxgqcNkznOxs9MYOuUALZ6zsCUvE4G/Nh+Mo2xjJ
	 H4NqjsDwBrECVZK2pOtU0XccNhUZ97KkO83HSNXtOKoE2K98HiFw1yxDU5JisZgblD
	 1IntGnIiiN/GchHIRfSlOSwsDvz2tAzi/4ydENFBvuKKDAHKjjNT1kIEIsLnZenexS
	 O/cnCqNLQYZAbx+jK9gB9IIctJmPYdYjfxIm0eA6B9cgH+HH8LomsFIEVXrJTNjapc
	 /xVwRBhDnzu7g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE39380A965;
	Wed, 11 Dec 2024 22:33:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: pinctrl: correct typo of description for cv1800
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395639623.1729195.12285623767079173929.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:16 +0000
References: <20241029012312.3448287-1-unicornxw@gmail.com>
In-Reply-To: <20241029012312.3448287-1-unicornxw@gmail.com>
To: Chen Wang <unicornxw@gmail.com>
Cc: linux-riscv@lists.infradead.org, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 inochiama@outlook.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 unicorn_wang@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143301_287096_8A4FCC41 
X-CRM114-Status: UNSURE (   7.92  )
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

On Tue, 29 Oct 2024 09:23:12 +0800 you wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> It should be PINMUX/PINMUX2, not GPIOMUX/GPIOMUX2, see
> <dt-bindings/pinctrl/pinctrl-cv1800b.h>.
> 
> Fixes: 64aa494de6fa ("dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800 series SoC.")
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> 
> [...]

Here is the summary with links:
  - dt-bindings: pinctrl: correct typo of description for cv1800
    https://git.kernel.org/riscv/c/4905aa25d31f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
