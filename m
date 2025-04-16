Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D59DC369C5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 18:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaAWHbw1bQTScsg3eleoc920Qp8yUSfS0JuEi68C+pM=; b=gOO/TFXQdlCn0p
	LYx1TS6LRANV4HaZ25BgC2NHwMHBS3bNembv964+loRKihSi8LgnYfrpg4b80XFlyLgv7W1OFWv1x
	w47QaubhFB+O4qH2L/F5ZPH0ZuJmxhwmcjcrnHcxjEMFPxUhPd2By94KnHRuwXToVhvGgAIrUtu+g
	8gNm2StyftQwAk0o+bFYiCNPUPX+BKhJkxSoqOnWkgEJgrYSQidBXq16/OVc8OJQJZu8gp70eehgR
	/k4X3JPlGR6sXx0rcrkrpLXc5URHemE0OJAmEUK4a7Fk1sKnkxlH2YQE7JXxxuxhlDVPUuMuRrgr0
	BeSBoen9z0Rk169pXsgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57iV-0000000Ab1z-2fDj;
	Wed, 16 Apr 2025 18:42:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57hv-0000000Aasb-3AXT
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 18:41:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D80476842A;
	Wed, 16 Apr 2025 18:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D66C4CEE4;
	Wed, 16 Apr 2025 18:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744828918;
	bh=FxlsQdF/tRWe6WvKosJu3QY6wulI3m6lFJkvkMeuo1g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EI/F5TvpkwUo8nFCWGEi1iyM6SWUV8+4dzQSQCM8roO57ONkJnzkNSZkU3uT9oj4M
	 ofPPmwgxDsbpPmts+Ty+dV12kfBi3frHHv1gfUhEf1AE9z/hh2WoxuGtdhJe8wKl+0
	 v3FYeg2xFUdCe/ickF6LvRn+dFRlIoMLNo8BJ7KL8Idjc2aiRPSHJQIoya31pm2K+O
	 2qiXhXeSfVYIwjzQtK9FQr0odyH2KsfEegD8lZybHbnqvvN3mMi6zcT88cxaqwIguz
	 w5hTnkqnHzVok/EdXAEGlqrLheTXQCm9jxc8gwHi5IL46wbZWerq4/5+Wa+96WLluA
	 feJdqMjpTk66g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE153822D59;
	Wed, 16 Apr 2025 18:42:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix unaligned access info messages
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174482895651.3460781.10451440487742168881.git-patchwork-notify@kernel.org>
Date: Wed, 16 Apr 2025 18:42:36 +0000
References: <20250409153650.84433-2-ajones@ventanamicro.com>
In-Reply-To: <20250409153650.84433-2-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, cleger@rivosinc.com,
 alexghiti@rivosinc.com, geert@linux-m68k.org
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed,  9 Apr 2025 17:36:51 +0200 you wrote:
> Ensure we only print messages about command line parameters when
> the parameters are actually in use. Also complain about the use
> of the vector parameter when vector support isn't available.
> 
> Fixes: aecb09e091dc ("riscv: Add parameter for skipping access speed tests")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdVEp2_ho51gkpLLJG2HimqZ1gZ0fa=JA4uNNZjFFqaPMg@mail.gmail.com/
> Closes: https://lore.kernel.org/all/CAMuHMdWVMP0MYCLFq+b7H_uz-2omdFiDDUZq0t_gw0L9rrJtkQ@mail.gmail.com/
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> 
> [...]

Here is the summary with links:
  - riscv: Fix unaligned access info messages
    https://git.kernel.org/riscv/c/441016056010

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
