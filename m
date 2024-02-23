Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8761DC5478C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 05:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhod2i8iYZEDzdLXMyBzeNTULKDzmHR9Xlh/jjN9mDU=; b=usIm8o4groB5iE
	JUpyshomzVXpevi7cPKSWu4KfP7NKGNqbIdd4Ys/GBn6SvIkTaXKfQwZyLtcQbZTnSe0b4sAixZtr
	ciFWxF2slXu/YapFoZoX6/MHNh//jWfPt65wA4xB5btNUUGxzwbRtuBqvOF+rHHt1EULanpd2aN4w
	xVSytYVqoBMbOkOLvVetLPOnB6QbQ5FqgzsrYmU4F/U70nsRyyBMguZha3TExC8CjrNoLtYXkJEJ8
	nR2cveJIKA6wy9lLB3WqV7p/mIlEKTD+E8FpDgJMErnh4ccIKez1T7Xu4WFaAjtHxL8Fu00XIr/s1
	XW/OKEk8XO/doCZVJrBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdOC1-00000008122-2UOn;
	Fri, 23 Feb 2024 05:34:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdNCm-00000007qvL-2YfJ
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 04:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E8909CE2AB3;
	Fri, 23 Feb 2024 04:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DF53C43399;
	Fri, 23 Feb 2024 04:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708662631;
	bh=a+Qn10BEQCsB42uL0fA+2chMWeK3dzruYaHmn+6Xb4Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=O9jKyKrNBYPQMl/i3z6bIP1hYXB1f2lLEVjJoSgE6gMedZwMZagumZRL6KNUNDpHR
	 RG2e5z95RquAT4GoN6qMZSFtCXDAgLPtLDg+Vq6QGov1H6dSuoXJ8NkP7mpV6ZTvX6
	 RFpgnDSScGu3zGtFpMIAiEUuVdOUGxvLkSRogWolVEohQ+JLM1cUgTJ3htnk/BjVJ1
	 m8bdX4lgR6OqweHy8/l6xuFqEh0HKYMWaKMRocgWHXgmOch1iKtFiq2rrIbS5e8394
	 NwGQbo+hgdRo93sBZSXNvJLdPGHm5lBvfu27nAg5eH+LiPvzmXPVmo+For3I7jQNga
	 Q5YsXuB5AxzBA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 124C5D84BB9;
	Fri, 23 Feb 2024 04:30:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: add CALLER_ADDRx support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170866263006.22939.204004953353760152.git-patchwork-notify@kernel.org>
Date: Fri, 23 Feb 2024 04:30:30 +0000
References: <20240202015102.26251-1-zong.li@sifive.com>
In-Reply-To: <20240202015102.26251-1-zong.li@sifive.com>
To: Zong Li <zong.li@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, alex@ghiti.fr, conor.dooley@microchip.com,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_203036_958192_E28BA21B 
X-CRM114-Status: UNSURE (   7.95  )
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

On Fri,  2 Feb 2024 01:51:02 +0000 you wrote:
> CALLER_ADDRx returns caller's address at specified level, they are used
> for several tracers. These macros eventually use
> __builtin_return_address(n) to get the caller's address if arch doesn't
> define their own implementation.
> 
> In RISC-V, __builtin_return_address(n) only works when n == 0, we need
> to walk the stack frame to get the caller's address at specified level.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: add CALLER_ADDRx support
    https://git.kernel.org/riscv/c/680341382da5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
