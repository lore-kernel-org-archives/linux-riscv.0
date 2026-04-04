Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCDBE88D78
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 01:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sg3H3YyJdGb0OtcMvvvQY3SWcMfEz39DMq3Q/fG44No=; b=dG8BrfgPEb00kx
	9jGQgI3xRpQr7YIAz8M1QNA1d8RMUub6Hn+5WHMJBsQFrw9dQb0LPouwJhaOTRQlF57xTmqQB7xhr
	V3b6LK94XfifAHxmsL2WLf32j8CjFUT6yAT65PMG5HiAjY6D3DWEhtsdlLUZj+UZUYPjkAWiXLqGj
	DYKsTtkok/LVluNMHj3G+GXwmMF/EdVbviwzxB2em3eMT3jnMa5oz+ZDfT9HdI9ciRMva1hVIIoNH
	EgSkU7g3HBTPgUKkQ/zNC3x7PgZ8LpybTDEHwBPUv5jNkh98kC+W1+vQUkqW9NtJw2t738fecxDLX
	4fTV/WQTZMA4rVhc3GKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8q9g-00000002t7X-3FdK;
	Sat, 04 Apr 2026 01:50:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8q9e-00000002t5h-0F7x
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 01:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48E6543764;
	Sat,  4 Apr 2026 01:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21104C4CEF7;
	Sat,  4 Apr 2026 01:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775267429;
	bh=phx3qs8dMYY6rAwt1SmlW4YNc10KK+Pf0xVolC+iDwU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Fun/c63xB4fDCsPjuLzX+xurZNy9azUsOWa3UXB9MstCl2m+ZwdNc9HLELTvgsLrs
	 vIf8JFNNC9uFBL1OePH1SMLaYROkTOiY2BYgrxfzXCQ053zhHxiR6T6SUCHUzN5VDx
	 c4Gg+50Ul7FLDjsoZfAUYT5bufgpd8RkA2qMOmLn/7Z6lKnSrKtE6XmtBIN+FRYyFX
	 iGP75PZBaHfCkRrGSozXxEhcC0CBzf9aszQNMxPowamGllSMVZTIwCA6zMdMah12vG
	 oe943vk1KvyBgdwYNuGrMTiCxmtkLuw1Ss4x1xAORbKuyewPhbwP3xvSXIWoO0Xef/
	 maSdauAyu6wGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E643809A18;
	Sat,  4 Apr 2026 01:50:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] Restructure per-task CFI prctl() and ptrace
 interfaces
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177526741054.1520684.8289044721186928310.git-patchwork-notify@kernel.org>
Date: Sat, 04 Apr 2026 01:50:10 +0000
References: <177526680875.878386.16551569883089050686.stgit@seppa>
In-Reply-To: <177526680875.878386.16551569883089050686.stgit@seppa>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, tglx@linutronix.de, peterz@infradead.org,
 broonie@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_185030_146455_DFC584DB 
X-CRM114-Status: UNSURE (   8.56  )
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

This series was applied to riscv/linux.git (for-next)
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
    (no matching commit)
  - [2/6] riscv: cfi: clear CFI lock status in start_thread()
    (no matching commit)
  - [3/6] riscv: ptrace: expand "LP" references to "branch landing pads" in uapi headers
    (no matching commit)
  - [4/6] prctl: rename branch landing pad implementation functions to be more explicit
    https://git.kernel.org/riscv/c/987bd38dee75
  - [5/6] riscv: ptrace: cfi: expand "SS" references to "shadow stack" in uapi headers
    https://git.kernel.org/riscv/c/c8acc707f48c
  - [6/6] prctl: cfi: change the branch landing pad prctl()s to be more descriptive
    https://git.kernel.org/riscv/c/e0d96d3c63f5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
