Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D48C531E4
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 04:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMXqeN/ialig6S9q5bVSZNpRgsRCTNbnXH6EdahPSdQ=; b=E+aEASsk7neLzi
	w9a3HGINs7uTbTvfwJM+KYpYMAn1V4NorjsKc21xJ1A34/SKPM6LKuihEWi8ALrWK+sSoUO06iuEy
	C1zO24Sm7bzG6cJVW5bby4JTNJ1RJxujuzxYunRZCr1WBXgwy/MxpG8801BaV7zUbTbL7IkJAOcXn
	MUmNFL1do8PUNbx1vkziLgPQN6gIK6ZNo0p9rkqUbsgUYJbye9MDXankaFemApuEDKcZxdJ/e9jAL
	bGvl4Jf08kFNzeA78VdbY9tBrEPNK2mlZq9mrqIC2jTXGafiReqvSmLTs63AAgKaCCXxApf4GnBJi
	CZsG+IxMkdeTr6kNCDvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHr4-0000000DCjy-2eWC;
	Fri, 20 Feb 2026 04:11:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqv-0000000DCX0-3qsC
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 04:10:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 541C861872;
	Fri, 20 Feb 2026 04:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21517C116D0;
	Fri, 20 Feb 2026 04:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560653;
	bh=XFOf5aDi+Dah56RKFi8JABtwBzPV/6dCOoY6VnWTf4s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SUdAya5+Kfp1xY+mMHIa6hI5DL0Rca6wNjp29XpQAiUT78JgbqN08os32jUXBQJij
	 Af4iYH7fKLWgMTLFvLe0UhkhGUg2jGNhQoYh81aIBvKi6jsQFhbWTWVgCPet7JyP3g
	 dySg6H/ll7C7o1OQSnCgbuojUYhajA+M+r+lg8NFGeUxgR6+UIHJLGatemSOiiCZdE
	 HhviGb2T1wgtyFZXl53JwGpQpXqqegkcGns61+lqNMXOZpZKe8uLs+isEQkteuWusg
	 yQSeRkyzLrNat68+RUqlp3BTJc3n1Xp/6VGLx3Fp4Ae/pX7XJrA24whu3Oui6V8O1v
	 ipkaqWZY0MQcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E9E3809A88;
	Fri, 20 Feb 2026 04:11:02 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V updates for v7.0
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156066128.189817.1042347255874728240.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:11:01 +0000
References: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
In-Reply-To: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
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

On Thu, 12 Feb 2026 16:39:48 -0700 (MST) you wrote:
> Linus,
> 
> Please pull these RISC-V updates for v7.0.  The primary new feature
> here is support for CFI in user processes.  This feature has been
> tested by a set of RISC-V community participants, including by CPU
> IP/hardware vendors and by a major Linux distribution.  Other changes
> are described in the signed tag.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V updates for v7.0
    https://git.kernel.org/riscv/c/cee73b1e840c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
