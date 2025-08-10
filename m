Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F24C87FDA
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Aug 2025 21:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ucVl3kQdu7VbLKLBIzOaP7ZwsxUM6/Z3aZoBDHRacdQ=; b=SjAEgShYnDSyTQ
	WSv5S1J9BzYqDChUqf3Ygx3B6zrwlO0xQSxYLb8Bv/MUVo1MgWPsEm00iEEe62QT4+Gzh8H/+q0Xj
	DgwecKdUc1N/UOwYJjW8PtiKNefCPQWGLutNyPCSdgXCIMfJJexMoa68OVAjK1hVlyKhnZtFHmv+N
	nSjspuJ9rZCZT/rs3xP7OILj9WfaKP5M101qU9w8FMewZQ1CacbnmcyzT+ErqX0tb/rcsmVxK0gyh
	QLmAjugapRE8JK5kbOucDBegxR/14dW6VHcep1WgNZMMoY1fSq+VA7XTsVMoNjNOrfw0WeEJ+FA8z
	DnE+lnkBoBD70gDGKVJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDkM-0000000638k-1eKp;
	Sun, 10 Aug 2025 21:38:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDL9-00000005zkB-2Qgm
	for linux-riscv@lists.infradead.org;
	Sun, 10 Aug 2025 21:12:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0719361425;
	Sun, 10 Aug 2025 21:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE972C4CEEB;
	Sun, 10 Aug 2025 21:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860346;
	bh=O1kZXURGOmtyyxsHhriJ95yieEZ3eBnv/EWQAjiQF7o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DrGbRrf95ZFILwdpK6hYgQB5HzXOiWAkxA1NmLyY52qfyUbgDHEoxjwKc5aAnmGJB
	 Zagnu+OlyksR3JHcQS3OrpJk32sFdAPnAWAh3o6dPC11iUrqW4RCphhzNl3pfvjc+l
	 n5URwaI5RxQPNILn/UInUssIvoUafeNM1X3kA41DRdFK2f6Z0NpudpwSs9dC/hdXNo
	 aEy2qRw8hVZDfb7Tz1xHS1PEvb1QwWCTvEZ/MiJZfiKkkutTYxWOp+yTTqNJHO36r7
	 tAgpl1yZ7CPqXfuwnqRxYW9iKlZwOtIfrkGXOZwUyCoCrPQ1kDQixq1NcH9z6X/MAp
	 MW158JLNioO9g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADBE639D0C2B;
	Sun, 10 Aug 2025 21:12:40 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v11 00/21] RV: Linear temporal logic monitors for RT
 application
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486035924.1221929.13550140016096885653.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:39 +0000
References: <cover.1751634289.git.namcao@linutronix.de>
In-Reply-To: <cover.1751634289.git.namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, rostedt@goodmis.org, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org, gmonaco@redhat.com, john.ogness@linutronix.de,
 pmladek@suse.com, senozhatsky@chromium.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
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
by Steven Rostedt (Google) <rostedt@goodmis.org>:

On Fri,  4 Jul 2025 15:19:52 +0200 you wrote:
> Real-time applications may have design flaws causing them to have
> unexpected latency. For example, the applications may raise page faults, or
> may be blocked trying to take a mutex without priority inheritance.
> 
> However, while attempting to implement DA monitors for these real-time
> rules, deterministic automaton is found to be inappropriate as the
> specification language. The automaton is complicated, hard to understand,
> and error-prone.
> 
> [...]

Here is the summary with links:
  - [v11,17/21] riscv: mm: Add page fault trace points
    https://git.kernel.org/riscv/c/a37c71ca412d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
