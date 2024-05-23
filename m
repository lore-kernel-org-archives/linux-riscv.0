Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2504BC25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 18:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ha3P7hLcqHX4jwtb+jXCRaPJ2I32aZt+LbVNP5PUp7c=; b=dq3hKHRy7cwGq/
	RM1TU440hq535XNYplaGnC8y3fSvR04eNJDaSAhqAFNUhqzYxMprayv3ahqWDfucciQb0XRuzS6gp
	bjnubELPEW2vuVnX4OgtXLMfdE7DZIl8vg0Qja/AtZp/ZSHlzlviUm9Mzyamr4t/UUiRxWYfsFMk5
	d53HM+zqbkACXVKPuL10xjaSt9KdQ7D575tjXUhXieScX2i4+7F7UatydNOXE9Qqh09oTfXnM6vOT
	pJtnqMDapmqSWMbNdCeExP3Brwe46wY/rI528JDTHytxraOllgtjZbG6s5niw9TVbCVOYfFcF8ij/
	50y6rv3kwZlXC0i2Jorg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sACk3-00000006xUT-3AoS;
	Thu, 23 May 2024 18:00:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sACk0-00000006xTi-43sl
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 18:00:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 029C6CE16E0;
	Thu, 23 May 2024 18:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 375C1C3277B;
	Thu, 23 May 2024 18:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716487233;
	bh=LPuvBxy3iF5eqbTEUy7UQgJ9ro1OJVRiXbhQTYzW4BU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WWyACaHvCcfSiW7Ac4wmfxxD63inDTSeTQasgttg15eqpjaWjoMX6sBR/bwKGnUWT
	 9DbS8DwB3QAPriD2RywSRG3igxM1Mzp0ZFVmkeHC3fW2RXfY18ckiOqXod//4SHPux
	 vGR42czNI55h8SOJRlBYh8KGUIPuOdO6Abvz91OiNVh4nSCblRzHFFpVxkIHxx3rrq
	 fjbB4cwCRjPkab6E23zz0cKyYBbtS+bafbJ58ZZrvqqOjtNAQIy4K8QV48bLeBpAvx
	 ZOlicjpQ/6gklqHRbGbqaR1q0Wl7cnhOQqrMs2CFXIavIKjDcqxUa6VgXfhI+iRwrg
	 m/RUeAf0PAHvQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 16D73C43617;
	Thu, 23 May 2024 18:00:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix early ftrace nop patching
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171648723308.17418.17188308425434687140.git-patchwork-notify@kernel.org>
Date: Thu, 23 May 2024 18:00:33 +0000
References: <20240523115134.70380-1-alexghiti@rivosinc.com>
In-Reply-To: <20240523115134.70380-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mhiramat@kernel.org, mark.rutland@arm.com, parri.andrea@gmail.com,
 bjorn@rivosinc.com, conor.dooley@microchip.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_110037_230073_43B6AEF4 
X-CRM114-Status: UNSURE (   8.96  )
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

On Thu, 23 May 2024 13:51:34 +0200 you wrote:
> Commit c97bf629963e ("riscv: Fix text patching when IPI are used")
> converted ftrace_make_nop() to use patch_insn_write() which does not
> emit any icache flush relying entirely on __ftrace_modify_code() to do
> that.
> 
> But we missed that ftrace_make_nop() was called very early directly when
> converting mcount calls into nops (actually on riscv it converts 2B nops
> emitted by the compiler into 4B nops).
> 
> [...]

Here is the summary with links:
  - riscv: Fix early ftrace nop patching
    https://git.kernel.org/riscv/c/6ca445d8af0e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
