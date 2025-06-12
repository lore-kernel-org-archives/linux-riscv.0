Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB685C61CE8
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 20:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gHijc1v48PtsvTLjFhKZ3D6CDyJm492/ZPWgnDiwgS4=; b=nRtf34C0LsFmon
	32KDomVAnRYJhLqckf1ZhMNmzCFUt7ls2b9DIkqDIfTykAAzfi1vALLfjf36rltBvVsCSYtTdRgiB
	p/OT37hEGzObobNiqvZpM/6agFTXIYWHbgiA9rOPOxiRN5VIDOtyA4o5PLSNfxnllFRd4zs2tuLge
	3iCze1syFIRrPMGQLHgQvGRKCp37XJyD/Zd9ZJqbRjHdR813rlPOx2ayT/2gqJPCK+7wHS1h4sNvX
	58ZLirn1p+KLBTt1Wb1jFuA5oGw2CzENnzqFm3uUia44Cl9Y1E71uqpSv4AIF4DrFW34fR3PPLkPc
	SlhPhEZB5tu53seGRGBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoFS-0000000ESct-10NL;
	Thu, 12 Jun 2025 20:10:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoFQ-0000000ESc5-2ZtB
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 20:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1231262A10;
	Thu, 12 Jun 2025 20:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCDA3C4CEED;
	Thu, 12 Jun 2025 20:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749759003;
	bh=gDmI1cm1UeJF7jH2D2QrNgyl09J8B2qKOnKgzQywqgQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RpJQkRtLfhWA2uG1vtFgZxvQIUsw31iQlNq7nCuzYv3g/RTEimDCAChcndTb0/8Zu
	 IiAoGpRYFJzd6UM5KT6IGyz/YF6qrtdcgjzyBpZ43fpdc3B/Cm0C96nEg7KKOnD2GC
	 kb9vPf5Wt/DeYAWGlB4JT+meU0R5QGjgRBxOQLXC/cKEIsbW4keUoUL1XUHG9EJ03H
	 H7zegKl8lSwcEdbefokLSfBdvEsoCXnTZSNAR1f20t2I3asGfIQS4LgPzTG2U2+W4S
	 wNOag9vOOGE6x3bkaxcyBDNIfaDZkFnTaC9xiLTvFxLg6H6EnrkPhxuniOtftSPL9P
	 oORWEc0Bv77QQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EABBE3822D43;
	Thu, 12 Jun 2025 20:10:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: uaccess: Wrap the get_user_8 uaccess macro
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174975903349.88969.3262884542771574514.git-patchwork-notify@kernel.org>
Date: Thu, 12 Jun 2025 20:10:33 +0000
References: <20250610213058.24852-1-palmer@dabbelt.com>
In-Reply-To: <20250610213058.24852-1-palmer@dabbelt.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, cyrilbur@tenstorrent.com,
 jszhang@kernel.org, cleger@rivosinc.com, samuel.holland@sifive.com,
 linux-kernel@vger.kernel.org
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
by Palmer Dabbelt <palmer@dabbelt.com>:

On Tue, 10 Jun 2025 14:30:58 -0700 you wrote:
> From: Palmer Dabbelt <palmer@dabbelt.com>
> 
> I must have lost this rebasing things during the merge window, I know I
> got it at some point but it's not here now.  Without this I get warnings
> along the lines of
> 
>     include/linux/fs.h:3975:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
>      3975 |         if (unlikely(get_user(c, path)))
>           |                      ^
>     arch/riscv/include/asm/uaccess.h:274:3: note: expanded from macro 'get_user'
>       274 |                 __get_user((x), __p) :                          \
>           |                 ^
>     arch/riscv/include/asm/uaccess.h:244:2: note: expanded from macro '__get_user'
>       244 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
>           |         ^
>     arch/riscv/include/asm/uaccess.h:207:2: note: expanded from macro '__get_user_error'
>       207 |         __ge  LD [M]  net/802/psnap.ko
>     t_user_nocheck(x, ptr, __gu_failed);                        \
>           |         ^
>     arch/riscv/include/asm/uaccess.h:196:3: note: expanded from macro '__get_user_nocheck'
>       196 |                 __get_user_8((x), __gu_ptr, label);             \
>           |                 ^
>     arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
>       130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
>           |         ^
> 
> [...]

Here is the summary with links:
  - RISC-V: uaccess: Wrap the get_user_8 uaccess macro
    https://git.kernel.org/riscv/c/2aa5801ada29

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
