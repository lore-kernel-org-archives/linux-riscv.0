Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D550C0218A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 14:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7taMLVAf3LEtFjJPvniG19DCSj4/NY9IVEtr+nAI3K4=; b=ATxJoGhN5w6Tp4
	N2Zd192M0LNpcsI9vNl74oA5ynRzRc3bxeoY1YuWDSmm7rAVAzDLz6c/qm6L2fP0FGx9kHiR2GPVR
	x1LAc4QcGfcq0sukuJ2xz9Jo+RsjMN5B2MrpRSAZJg6ChZ2BpAvuAUFUrGiDb2SDrCfDANtCej8Vu
	t3CG1Bko34AN1FmS0QS1XI10jUCjReDgLjefao9Rge5672pNP9HStkNaddgHCQBC6FeMu2tz6KAHj
	EiFtrsZfD1HApizDeg61ogsGahV61dB7U/nFCJWqxK3SBcpHaOIohrmiF8T48EYJh1EIVm87YdBr3
	iJKQAY511QDGKsyspRPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVFI-00000008wKJ-3yxu;
	Thu, 30 Jan 2025 14:10:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVFG-00000008wIh-1ELI
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jan 2025 14:10:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E441FA41A14;
	Thu, 30 Jan 2025 14:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7377FC4CEE0;
	Thu, 30 Jan 2025 14:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738246213;
	bh=Lq6AaN1sx0ExgejN1JdWMP1HT5rWQfpx9LfTq9nyHz8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SncFVArh7LqCFPk5hx8F/p5CqMK5Z4jitsiqjklDmalRv9GVxQOH/rZ7hqmOVVPWn
	 h4DjVamZ5FugH5faG7FrVCyqxnwv2QgIOfIHQinV+OeFV1E2eI2NKB42IxMiB3Mvoe
	 qrjoQgOf4G4cTG1ZEjnfR7fZFINxAtbZI2YF+N1yeUe/FnBuZ1J8oq07rh4iaPeeN1
	 pB9kQX4EhMC50d8GMoVkrh5A2rSOIekKnJvJJrGKQYKzRb5VSspxwXnc0O49GhF6K+
	 +0tH/5tU9ugEbOohXnQjAtHQiPWZC8sJraarzmLNh/+arskNI15tFptYB/rJiCMl22
	 RtB7VLsiPJK3w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0F5380AA66;
	Thu, 30 Jan 2025 14:10:40 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Mark riscv_v_init() as __init
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173824623950.971083.7573823716430578295.git-patchwork-notify@kernel.org>
Date: Thu, 30 Jan 2025 14:10:39 +0000
References: <20250115180251.31444-1-palmer@rivosinc.com>
In-Reply-To: <20250115180251.31444-1-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, charlie@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_061014_394630_448F0E57 
X-CRM114-Status: GOOD (  10.03  )
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

On Wed, 15 Jan 2025 10:02:51 -0800 you wrote:
> This trips up with Xtheadvector enabled, but as far as I can tell it's
> just been an issue since the original patchset.
> 
> Fixes: 7ca7a7b9b635 ("riscv: Add sysctl to set the default vector rule for new processes")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/kernel/vector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - RISC-V: Mark riscv_v_init() as __init
    https://git.kernel.org/riscv/c/9d87cf525fd2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
