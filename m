Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5229CCF9F8
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 00:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6p6+q/TO6YwsG+cimrwCWrG3mUWcnLm7i6VL2Or4EuM=; b=VewXh7DmxWTKO7
	YqYZC1CNwj/BguxmTkmmBPTwhbe71esgbEK7+LGoYbN6nau40S0iIORXGrFUxYrsmIFG2H3S8ws3D
	sCz3YVZQVsFZSl0pfP5P5dNe55YWUTib8CY2ts8FFNY+rp+5XcZ5cZOh9RV8x+CpstUcSRagAGnxs
	VOkM9Xfr9TEO4fkmj4ujgy+5FoVpoMDMdlF8SLaJN3vYr0A65GzuWs8B3tyh7K7zHgeZQWo0ZwtMJ
	Qp0V7aKbe85RSymnkRzeVFzvu+h0AFqZxAGkhw9ZuCavVjjdGPn8Ykdf5TVILbM8h00+DZ5klkS79
	8Bvnn/c3jp8uUh2mJIlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHXB6-00000001o3s-3ao3;
	Sat, 08 Nov 2025 00:51:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHXB5-00000001o2w-0Icd
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 00:51:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36A4F601D2;
	Sat,  8 Nov 2025 00:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D878DC4CEF5;
	Sat,  8 Nov 2025 00:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762563097;
	bh=ylZKoKAG4M109wkBCe4j3unmFhhDKp05GMEno3nSV0M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rcXHwyrhd+G0Vhs6ZhvFgqm3eTlrt90edylOxtekjv1+H5hBcyrdGoFiCCjl4CB3i
	 JB8mbxQvoudixk8j+X2nlkCrLI00Isb3KFQ5rle+Lw9QiiYf0+iZ7sQGqyUkdyChSK
	 SDbNH1I7FviTOFpLTi2htYYlhlktrcKXikMCvgkrf31w/9nWPd9v0iJn0PzgCF37Ta
	 8KXtFPhuWJwOcNgFjbdVjUkqjyrfT2jXRr05dWHKoDEVJhZtWQw8c7dtWRfb0z0UBG
	 12KJdn3NiawrAo4tVxDBo7UOGQv7GPkf2ZZJi15q2+HFCy6FbcsbHW4wlHkvzfXITR
	 my7ONwKtOtYBg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BB93A40FC8;
	Sat,  8 Nov 2025 00:51:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc5
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176256307001.1206494.4691507602998406323.git-patchwork-notify@kernel.org>
Date: Sat, 08 Nov 2025 00:51:10 +0000
References: <50a5b4a5-18ae-6dda-bdbd-db67e112bc1b@kernel.org>
In-Reply-To: <50a5b4a5-18ae-6dda-bdbd-db67e112bc1b@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
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

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Thu, 6 Nov 2025 15:52:22 -0700 (MST) you wrote:
> Linus,
> 
> The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:
> 
>   Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V updates for v6.18-rc5
    https://git.kernel.org/riscv/c/225a97d6d454

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
