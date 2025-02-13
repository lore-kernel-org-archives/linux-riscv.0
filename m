Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A85CC021A7
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 19:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3r/l3Nd+5nTEfeYFuB1yBDgsaqCKQ+L5RsdHBCqnvtg=; b=t4bOZyzBbXM+rz
	+g/LJA5hL0zZrH6o5v14+sEtKJ7SwrVDyUYZcccL+Yrf/gnTrVKX8MCh0lf5HuZJmTO1AZTqLGQtx
	mTZ+c8f+KT55h8qw6irOV7uFDIsmc7nagw6r4M8uHBjVsQx0tegni37G3lR5Dt4kv7z/TWtR1zDcC
	M3W7j/9clfsbAMorBjmxeGN2ixdXPfnD7JhODS+0Ou/LhtuSEZuqObi/pnu2dp694P/MDSl/1SIIh
	ZH5P/2gSsrDoV25kglpTcVMrUA3aCHUktO23o67jPGPQL8cK9HiiaYdwN6a//oa8HJbFfhuW5qPzf
	Mx5p9LP7rXwJ7pjrpi4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiezy-0000000CQAk-2BDh;
	Thu, 13 Feb 2025 19:35:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidyX-0000000CFFm-0Yh2
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 18:30:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A6155C563E;
	Thu, 13 Feb 2025 18:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75327C4CED1;
	Thu, 13 Feb 2025 18:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739471412;
	bh=wdaD0rz6iZsX1Rx+Et/KNnZ3uQO95gynUs5f1KOEN4U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Hk8V7IBPqJPHjhm1PwjLeaVUEeDwB5ioCZu4oJj1BPz6bJRKtZMQ0GLB4QQ1pMsKQ
	 prAUP5hmMYzBt4FRpGhgjrRh+fDp1SiSfZ2EZAhi8O7NQZP20RwDTi9QNxk8MJxO+O
	 pse+lMj8EOB13N8NW4W10WWQRMxviqZ+n0NHqA2YND1K7Lcb5iM9m5adC1hlyPuQo7
	 5isujOZeSJZHV0hxQyzXJ2gZuj39IxFWmL5O0WHgz3FhZag2EaY+g7Hlmwva61vvhJ
	 TIjFfVQH9NyLpsSuKw5gDinBOZW32ErlgS8tZs7MyOCzLMgvNC+mq5r3Lt2A9/xRjB
	 lrIPMmhCOUscA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB1EF380CEEF;
	Thu, 13 Feb 2025 18:30:42 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv/futex: sign extend compare value in atomic cmpxchg
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173947144178.1330575.8179936961826705707.git-patchwork-notify@kernel.org>
Date: Thu, 13 Feb 2025 18:30:41 +0000
References: <mvmfrkv2vhz.fsf@suse.de>
In-Reply-To: <mvmfrkv2vhz.fsf@suse.de>
To: Andreas Schwab <schwab@suse.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_103013_214830_0451B366 
X-CRM114-Status: UNSURE (   8.86  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 03 Feb 2025 11:06:00 +0100 you wrote:
> Make sure the compare value in the lr/sc loop is sign extended to match
> what lr.w does.  Fortunately, due to the compiler keeping the register
> contents sign extended anyway the lack of the explicit extension didn't
> result in wrong code so far, but this cannot be relied upon.
> 
> Fixes: b90edb33010b ("RISC-V: Add futex support.")
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> 
> [...]

Here is the summary with links:
  - riscv/futex: sign extend compare value in atomic cmpxchg
    https://git.kernel.org/riscv/c/5c238584bce5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
