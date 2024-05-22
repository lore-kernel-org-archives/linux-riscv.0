Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D5DC25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 23:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40zNpX6jDeWMI08PgPs5hItTMrCtr/9IejdfcMS5yv4=; b=eERW6nC2dap6rn
	1iV0zWAOCOhlOp3wlm0SrHlsLe250ekbx0N4F/aAx+XiJ2lV8gOvbEOX4BTJ+3Q/ujpUqNTu5UqfM
	xbyWjpvtnQVyYLmgPBb7axloc5FnZj5mdEx3h4mgrWdumRgNhb6n5hisd994AtAzxkPAViGLa3R8e
	FfYt+gl5rfoqomAYxkv9QHdc1K8BLi5dpzw9OPmDAEYRHz9w7EbNi2ehcofdSq8SaBFlWWTKrMAYL
	qVGDePtRXCKk/JRnCwSRmwW5IveFarjYZubq4jgv4fIA9wWWahOrBUlGqAFhrHabhtXPLyRh2Rwxm
	Ldoaf9M8C5+IVXSQ4M8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vRu-00000004RcK-13Le;
	Wed, 22 May 2024 23:32:46 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vRa-00000004RRp-1Qoy
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 23:32:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 90ADDCE1378;
	Wed, 22 May 2024 23:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 912A8C32781;
	Wed, 22 May 2024 23:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716420743;
	bh=dk9pVUnyAXEkAZ3CS3QWH3/LfWwm2NEOko5OfoNSiqA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gX2P1k1Pt7ouqmvIokRlYaaKhrLTzlp5byzhP8JFki7MIS/WW6fAeKLc6Kte/q5Ur
	 EBvlEIEqRyZmCj8USgKhZBF/G/RcUkNVumFTp2KFzao2Vr79mjCNbcTugUhOMpzvuj
	 gujUZv17sahQDPdcOOxx4nw/VsLaU8VgRPcRIynyffaMgrt+KnB6yjA0DIMx/KPFBo
	 ChFViNFrLRsHpmFn2zo32YEVBa9JbeMKS06Xlf/5ku7aQCUgHnM02/WNxicJx/OOVg
	 G892RztcXP3LYCInz+DMGWOAhPCG/H2FvKWnhXh5HsSIitkjwmlkAAzieGZFm741dK
	 5Gs9XwpVJT6Ww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 84E9EC43618;
	Wed, 22 May 2024 23:32:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.10 Merge Window, Part 1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171642074353.9409.8682770780548365463.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:32:23 +0000
References: <mhng-e73e59bf-92fc-4122-9f9e-a329d20eba55@palmer-ri-x1c9>
In-Reply-To: <mhng-e73e59bf-92fc-4122-9f9e-a329d20eba55@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_163226_730083_50621100 
X-CRM114-Status: UNSURE (   7.03  )
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

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Wed, 22 May 2024 09:13:28 -0700 (PDT) you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-mw1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.10 Merge Window, Part 1
    https://git.kernel.org/riscv/c/0bfbc914d943

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
