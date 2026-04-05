Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98D5E63FE6
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 00:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rA2n/CO36lIdAwl81KiRwGhthe0vCvfagIWnaia61rQ=; b=rw3NZoXrxWG2OS
	dtF8800qzL8nrPs2ShgfXT49r6iUBF8BUBuIMUFQr6s9c7+5jNlg+G/0N6nb1a1cV7RqPAt6D5qi+
	3TurkinA13evbA0nmAr5oNzlT2VC3bPafz+2dNClICnrSp3Ye96Un6YMqT20eTXxGs5AapYoggwD+
	NpPPboDaXnwxAbKBs4qWdmCf04JHdLrLqYevw0fWPJKtYeCfi4fIZHQvqyrrAA3d55+4wf2D6u4Bw
	XLAko8A+c3EsxYQ6avg6Oidttk1lE5L6BVvmC3Q7Wl5eGtj6aIGRz9Z1MrqkwCr5bxk7UINMWUXHt
	K05XhBNtSmugMEjpO7gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9Bh9-00000003rHe-19ou;
	Sun, 05 Apr 2026 00:50:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9Bh8-00000003rHT-1Ilu
	for linux-riscv@lists.infradead.org;
	Sun, 05 Apr 2026 00:50:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DABC260121;
	Sun,  5 Apr 2026 00:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B7CEC19421;
	Sun,  5 Apr 2026 00:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775350228;
	bh=Y1CXJ7f+au3Zjz4W6Dd5ph3A520Nxdxgjuk367KbPuM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lDBL2BrL7NURr671xgWhfeipvESZ0a7hjZDB9clKkuXbn6pS3+YHLmH70LZbdWcvq
	 Ugl2fnIckFkBMKPQTmY9L1CkQHuh2kRWxJ/86JGM4BvRNtw829MSiv022iPEhyHigy
	 xBRSu7NaUXqzKXWbQrfW6PB861vR4EeXbf8z1rBdw5YpqQI1rc9qTdxaw/GrjXHr35
	 oCvkLswhev2xeoJVcR0g7290zZ6q9ZaY5ntnKjy+hC9VTA+JB99fWqVQxNtcfIFDam
	 O42Yrfu/ZuJD0EYzn65O7AuKmQao6d39saayrLKJsooDtUxII/EiNpyHpDhpBsL0dX
	 sjTAJunIDN+Fg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FC6E3809A1B;
	Sun,  5 Apr 2026 00:50:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] Restructure per-task CFI prctl() and ptrace
 interfaces
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177535020904.1815399.7322753771351511383.git-patchwork-notify@kernel.org>
Date: Sun, 05 Apr 2026 00:50:09 +0000
References: <177526680875.878386.16551569883089050686.stgit@seppa>
In-Reply-To: <177526680875.878386.16551569883089050686.stgit@seppa>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, tglx@linutronix.de, peterz@infradead.org,
 broonie@kernel.org
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
by Paul Walmsley <pjw@kernel.org>:

On Fri,  3 Apr 2026 19:40:56 -0600 you wrote:
> Restructure the per-task CFI indirect branch landing pad prctl()
> interface, as suggested by Linus [1].  In place of the current
> approach, which follows the style of shadow stack control prctl()s
> (PR_{GET,SET,LOCK}_SHADOW_STACK_STATUS), adopt the style of the
> speculation control prctl() constants (PR_{GET,SET}_SPECULATION_CTRL).
> 
> Then, to improve readability, expand "indir_br_lp", "lpad", and
> related abbreviations in the interfaces, also as requested by Linus.
> While here, expand "ss" in the shadow stack ptrace macros to "shadow
> stack".
> 
> [...]

Here is the summary with links:
  - [1/6] riscv: ptrace: cfi: fix "PRACE" typo in uapi header
    https://git.kernel.org/riscv/c/a621d9cdc8d0
  - [2/6] riscv: cfi: clear CFI lock status in start_thread()
    https://git.kernel.org/riscv/c/a6ede084c4b7
  - [3/6] riscv: ptrace: expand "LP" references to "branch landing pads" in uapi headers
    https://git.kernel.org/riscv/c/ac4e61c730d7
  - [4/6] prctl: rename branch landing pad implementation functions to be more explicit
    (no matching commit)
  - [5/6] riscv: ptrace: cfi: expand "SS" references to "shadow stack" in uapi headers
    (no matching commit)
  - [6/6] prctl: cfi: change the branch landing pad prctl()s to be more descriptive
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
