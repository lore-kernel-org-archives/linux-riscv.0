Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42661C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 17:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b47HtWqFJJ1a89BrvL0bBSmKYJihMXw2haWpR70AOnc=; b=px0Ra6H3ZTicAY
	WUqIkU+NAB00bEFwAlSqiLVoGxpURlkEQuhXFyVZC1nP6FAASx6RPOZU56HR/07iXed5qvIui89A0
	4KuXRNHh94NtSp7yNMFQHWUWOT4MrYxOHjlBPgF7AsQ2mypeTvhrgqFHvxPmIT6l29e4GtcwoR6gD
	nS8s+5c4M9CLZefe8NgMSC5nUJu7Yu/L0Z+LfK/LrvTSNLbIASAEEhQuBTfuFmOxUmbyYgSCXyaRk
	0lx7XJZXfycsOgD+XP5gfsUmvQ9L2z2CQ1oXDHPs2gpo0hzrvFQbxfJpr4TmwI23TpNIej9+356IM
	cKOXsisrhAE25kQyPrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSKux-00Ha7g-0O;
	Tue, 23 Jan 2024 17:50:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSKut-00Ha5c-0e
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 17:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A9FB861EBB;
	Tue, 23 Jan 2024 17:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18D2DC43330;
	Tue, 23 Jan 2024 17:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706032230;
	bh=x1Ni5BlIAZGl/I/K/Xm762bnUAtUEwlvGnjM0NI6qOY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=prslJmCSrnlLTLgLzDJtl7IO1Ao4Ndrq+/cV/Wx3ja0KU0pL41OdzS3P8PqpwKTG/
	 IKjr3ZVKUNuNDFkglbXEYxgbrTNDTDiBQy6NYIPTywMH474wR1E0oJyi148IeL+CeO
	 6ODf80y5fGgXK9BMVnzT2/qnD4t11a9BuF7a1eQ7uUp0fZ59bWmyvceBeAPzHAERmz
	 6pVzjV86Vs6xrAGAx3Rmj5v0h2F7XpetzOZ0UwjjNwwiBzBJ9zZENJDpf3I7tGgSgN
	 26GakvNB5lm70K2TfF0fGmgOyb2UyuFFW8LEqgwYa4erGZ8w/2GfOxqZw5yinETiG1
	 CxOcSl6Y22nlw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 010D8DFF763;
	Tue, 23 Jan 2024 17:50:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4] RISC-V: build: Allow LTO to be selected
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170603222999.30461.9105047550962692358.git-patchwork-notify@kernel.org>
Date: Tue, 23 Jan 2024 17:50:29 +0000
References: <20231017-riscv-lto-v4-1-e7810b24e805@kernel.org>
In-Reply-To: <20231017-riscv-lto-v4-1-e7810b24e805@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor@kernel.org,
 ndesaulniers@google.com, trix@redhat.com, samitolvanen@google.com,
 twd2.me@gmail.com, llvm@lists.linux.dev, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_095031_280895_1DB5E570 
X-CRM114-Status: UNSURE (   9.73  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 17 Oct 2023 15:21:04 -0700 you wrote:
> From: Wende Tan <twd2.me@gmail.com>
> 
> Allow LTO to be selected for RISC-V, only when LLD >= 14, since there is
> an issue [1] in prior LLD versions that prevents LLD to generate proper
> machine code for RISC-V when writing `nop`s.
> 
> To avoid boot failures in QEMU [2], '-mattr=+c' and '-mattr=+relax'
> need to be passed via '-mllvm' to ld.lld, as there appears to be an
> issue with LLVM's target-features and LTO [3], which can result in
> incorrect relocations to branch targets [4]. Once this is fixed in LLVM,
> it can be made conditional on affected ld.lld versions.
> 
> [...]

Here is the summary with links:
  - [v4] RISC-V: build: Allow LTO to be selected
    https://git.kernel.org/riscv/c/021d23428bdb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
