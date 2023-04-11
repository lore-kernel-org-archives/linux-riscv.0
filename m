Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB444C77B72
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 20:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mOzhO272x9MXjkndJLeLEL/EfsvcH4Eo4f9Bk2CLfpM=; b=Hjv3AzDd0SXSoK
	tqBRojPct0v9mDdTL7YSk5ckjZaV6tthjQjQoowttGGKnnEeL2Zur9yljVPEgAUX7lj528QtCFiZJ
	pI0mo9bA6ujNlkX4XdoIAaMCzOU8/5CazuWknRygc102OKOzOqgykTqIRMh3bbpwhVhnLU5Nl7YW4
	7XwbjlvlvUipe5XM4OEPhISEpeFfLy8WIuBwO9YXGoPkobUAW6uWZvcc0xODaTlmJd1QRXneHMlx8
	SAvf2IMkKY4vBXNJC0a93zSE22KQ/QJaf0svOo0umBAXTSh+CrETr4DHnHhX75FrBB5tlwGKzgLSY
	4qKlUwnTGZRmj8ODB3qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmKA9-0010Yw-2K;
	Tue, 11 Apr 2023 20:00:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmKA6-0010YU-2j
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 20:00:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6351E623FE;
	Tue, 11 Apr 2023 20:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C80D3C433D2;
	Tue, 11 Apr 2023 20:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681243217;
	bh=VhP9xPAWzn39xeSSfjXrtdbx6OFmwHo1ELAJLmcTbCI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pm72csH6kXQI34Si0YafNW7FoVFVI7iqaBzH6a1PkFTUf6SREiAyYDPYDXWWT/qF8
	 CvbvLwE7WrwnxqUZmKJFFDx70uQSuiZW/K90x1hsderP8EpwORz+7LogUGnRlGaAQ2
	 wk9kYP7Bvr9xbJHr8HkaAnHLpzOzBZpC0tUpHUSVtEd4doLmTguJrpYTTgrjTJCP5/
	 FbZJXXdelvPzKeqU6KCFjS0PIEd70VjOXrU5khsqY9yg0eSXiJVFsJD/RT1LRI3MR9
	 4JCFiyoAZjEzl21cJZXmqAv8XiuI2/eZ8zGXdlmOybxOGc+GyMUs1S8QdBko3ObM4o
	 IL+bfwGZ3x4KQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A90A6E52443;
	Tue, 11 Apr 2023 20:00:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: add icache flush for nommu sigreturn trampoline
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168124321768.4909.15241149293858055772.git-patchwork-notify@kernel.org>
Date: Tue, 11 Apr 2023 20:00:17 +0000
References: <20230406101130.82304-1-mathis.salmen@matsal.de>
In-Reply-To: <20230406101130.82304-1-mathis.salmen@matsal.de>
To: Mathis Salmen <mathis.salmen@matsal.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_130018_924444_92F91F9C 
X-CRM114-Status: GOOD (  10.99  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu,  6 Apr 2023 12:11:31 +0200 you wrote:
> In a NOMMU kernel, sigreturn trampolines are generated on the user
> stack by setup_rt_frame. Currently, these trampolines are not instruction
> fenced, thus their visibility to ifetch is not guaranteed.
> 
> This patch adds a flush_icache_range in setup_rt_frame to fix this
> problem.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: add icache flush for nommu sigreturn trampoline
    https://git.kernel.org/riscv/c/8d736482749f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
