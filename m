Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFB5C001B0
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 14:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1a8KcCL8nunSB9ZAhGbESQO9GuiJYV9CxUaLfl8OJPI=; b=GBrlWuZb0kuyvx
	TZq+Ymd0Z/46HLMvhE4+j0ubqsT7zDKutHoMLqaf+2SomTJGoI4lhkYAC9WWeJXMoq9VxCA3b+SNk
	e2QysAbHwpGWidBggp+9mKDa5M3coIwuzBps2FeUNTm8cYuoCOpyXQ4Sqq2/TKcx2K7WTL2Ibg1nv
	ev8wpbrHPPUPJiUH8Nof3bDxJg1+iMYtBUMtZnf0wPkQJSd/wv9Ubs4bzzVUWSYww2nBpaP6pyskB
	lYR1Tqb4R6Hf7P45nUQNRnyzAfdCsymjR2aAIByXEAABhyghaNjX9XPZVDBWQXWGL/k1frawTzEvo
	ihzT+9KLwGkuaL+wR8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTk34-0058gG-12;
	Wed, 09 Aug 2023 14:20:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTk2z-0058eZ-1c
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 14:20:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9213463792;
	Wed,  9 Aug 2023 14:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82F39C433C9;
	Wed,  9 Aug 2023 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691590823;
	bh=hRfZueMl4NMwyHkHFGihvLCgiJFxeSZASc0mte3oji0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NmOD5dOGP21qN+kGFvVv+KXLc00qxgW8oOFQD4eYbDl6QUXcF48BT6l8kB/M0gZYO
	 sRqF8PSTJtThQbpjAgmCUvCxmOn+i/PTldNrD7ECZ8r+SOkm6DRR6ekVFGvJb9KTgt
	 6h4sMu/rpw7/Jk8Y4jff1QTFqEhsJ5mVQbEsEoH6oPdKwfmyMRhBCRCmf5Rg0uK1Ql
	 fASngWMBIUHavnysA8YbxLgreBCJdhivrHX17murbI9haPnfU8bvWuABrWhPamMiYK
	 XQHuVceh4YbTQ/FVzUs4GoSEQC4d5ie9BrT7td4f+yDXha4lgJs3EleZSkTQmBGofh
	 6XvDbp8wzytmg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6B9ECE33093;
	Wed,  9 Aug 2023 14:20:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] RISC-V: cpu: refactor deprecated strncpy
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169159082343.5601.4592059782635361468.git-patchwork-notify@kernel.org>
Date: Wed, 09 Aug 2023 14:20:23 +0000
References: <20230802-arch-riscv-kernel-v2-1-24266e85bc96@google.com>
In-Reply-To: <20230802-arch-riscv-kernel-v2-1-24266e85bc96@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 keescook@chromium.org, ndesaulniers@google.com,
 linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_072025_607449_F6A745FA 
X-CRM114-Status: UNSURE (   8.37  )
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

On Wed, 02 Aug 2023 00:21:58 +0000 you wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> Favor not copying strings onto stack and instead use strings directly.
> This avoids hard-coding sizes and buffer lengths all together.
> 
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> 
> [...]

Here is the summary with links:
  - [v2] RISC-V: cpu: refactor deprecated strncpy
    https://git.kernel.org/riscv/c/12d61a1bc28e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
