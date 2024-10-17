Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D632D3C522
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 16:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V6vBNuSrhuxNqrFygmL2t20YlMaNGZenqt/igWb9ynY=; b=JvjRQjJc009IzF
	6uMXhKOuqTYmJqYk/nd1dAdC9neyK+LGEOsViSSMVftWqQ1gAOgvIt+rsVVjEJt5PKlZ+dCuD597/
	SbFZuBOxoGg78n8VFIvgUAS585s2ZuKHWXAqETNI2veOWAcMnAt/ldv68E7m4gLS0DKDMJ3yr4IqS
	qr4vOVjTivcm++rgI4JLtSle+ueyvrhN/EwXcYAj/Ot/6CbpKogfzgITjSJiYXtOoftVIaM8YUgBf
	r13x6FW5FGywbiI0oaTQmtTwskQi4qUWWvjjuYEhe79UOdmGfQEiQl5Z0/Phs3R0LE0EAQTNYVQ4Z
	y6tJLclQZ/Iy5/bNCXMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1TOm-0000000FUzr-0DLH;
	Thu, 17 Oct 2024 16:30:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1TOP-0000000FUrg-0Prr
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 16:30:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 55A66A441A3;
	Thu, 17 Oct 2024 16:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0196FC4CECD;
	Thu, 17 Oct 2024 16:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729182628;
	bh=aVA2QxSCVNkbqcq/em21m98qo2fV/FVrPCoqpZFeCX0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=D5bcYVI4iz5awwcJLIZXc55uINJNgXz6l2CrClolPGsE5BVdZ0e4RqRRb1/W2Noiy
	 FsO/fQRWV7g7Dx8K0p5sBmED+nNLZEpSZ6FKHGy6LJgZMJRoFrrmoEWcvXNpNWPije
	 h0N/zRZn7/iFOkNNCk3VMY64Ss6RWYYGTlpRV1lEWZscy2xwR4+7F4eU9P7cM/bPuw
	 JxjCX1EFD1d7FPFErP6kDMmhrY49k8MrY5IfXvFw0h68FtvTyX//fo4j/4JJm8/raf
	 LSIjxnGJwEOPFK9DUNL/KynOga6RqQqU5bhIwdGOtvSalivmS08HLWXHuwspSA4QUH
	 hcsLybHss/Pqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADB9C3809A8A;
	Thu, 17 Oct 2024 16:30:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/2] Prevent dynamic relocations in vDSO
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172918263324.2528145.12860614136206368233.git-patchwork-notify@kernel.org>
Date: Thu, 17 Oct 2024 16:30:33 +0000
References: <20241016083625.136311-1-alexghiti@rivosinc.com>
In-Reply-To: <20241016083625.136311-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, vladimir.isaev@syntacore.com,
 roman.artemev@syntacore.com, guoren@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_093029_288417_A6A8EC77 
X-CRM114-Status: UNSURE (   7.40  )
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 16 Oct 2024 10:36:23 +0200 you wrote:
> Patch 2 uses a generic function to make sure the vDSO object does not
> contain any dynamic relocations.
> 
> Patch 1 removes a dynamic relocation from vDSO in rv32 found with patch
> 2.
> 
> v2: https://lore.kernel.org/linux-riscv/20240705060902.113294-1-alexghiti@rivosinc.com/
> v1: https://lore.kernel.org/linux-riscv/20240326113831.283025-1-alexghiti@rivosinc.com/
> 
> [...]

Here is the summary with links:
  - [v3,1/2] riscv: vdso: Prevent the compiler from inserting calls to memset()
    https://git.kernel.org/riscv/c/f431f67ff6c2
  - [v3,2/2] riscv: Check that vdso does not contain any dynamic relocations
    https://git.kernel.org/riscv/c/fcb5dcb789a2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
