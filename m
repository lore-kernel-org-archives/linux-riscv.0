Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB23FC54E58
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 01:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=syeOt7E1+KlICXKjrSUGc0KaNGi4F8ktKAxxrTX6G4Q=; b=lcD4/1cfJoZ3q5
	1LdGZ1vFfrpLYLR/sP37yKcjaybWbfsY0B8OttXZrnNOX3WUKKM/1o+vu57PWzB3HC/eNs6SKC+yP
	rFt4dsZXWQNp3MRiXu+XLk5y/fel4QSpvKZy7BjFz5N0Wy8jz7qUwqqldH2L91NuHd8xtzyHP2+1K
	3b61AllNxJwA9G/jssGZ7f42c1xvP/IXHzWrclzVfwsxK+jXOCI+n8P9tXEDCQOkbcn1YmUS18giW
	Sin1QfPGn9a2JWEuEB1B0mEnz8aG5oLdb2t2Et0Re+w1UAQb4rPBU1Jce9jaaiJOBWPNOu0b2izI8
	dy6u2SiYodtxuADDAG+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn7Zj-00000001Tdv-442V;
	Thu, 21 Mar 2024 01:50:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn7Zg-00000001TcJ-3b78
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 01:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 132EDCE1282;
	Thu, 21 Mar 2024 01:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48563C43390;
	Thu, 21 Mar 2024 01:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710985829;
	bh=9QAmHWjXpCP5yazUkb4ulnyleTCzmdF6cKhVhuhzJV4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=McXJZvbUsvNhxJhepixjJImLBuTcbrqbYLgnIzSXo+BQaKs1wyjDrSRyajLrQn5YP
	 ya3GSnJUr98K+mW+Rjt1AtzLgmdlo0bscKgPqrBUXoKZtMYRM6bBPN292EUOUX/U3y
	 K41Oyv2IWRDmLLYfxZNsnBurScIRGHZMgxyPDQLpsiVVSjF9KnHlMmEf1JmEdys1VJ
	 fgoQAWQJxX5EriabdQD6XTSaySv/VGDI/WD7FUgNZn07PI3Pow6F2UXj65yGBxTGTT
	 aSXFbOdi8AWXY4iiYMuxMv19f+rwqe83kPk7PE3hShtii9v6i9CsfNgMo7Xq8N/cM3
	 COUeC3BhY72Tg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2F285D84BB0;
	Thu, 21 Mar 2024 01:50:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix syscall wrapper for >word-size arguments
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171098582918.5796.14005594073931825434.git-patchwork-notify@kernel.org>
Date: Thu, 21 Mar 2024 01:50:29 +0000
References: <20240311193143.2981310-2-samitolvanen@google.com>
In-Reply-To: <20240311193143.2981310-2-samitolvanen@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, keescook@chromium.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, raj.khem@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_185033_094066_9B8C7294 
X-CRM114-Status: UNSURE (   8.39  )
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

On Mon, 11 Mar 2024 19:31:44 +0000 you wrote:
> The current syscall wrapper macros break 64-bit arguments on
> rv32 because they only guarantee the first N input registers are
> passed to syscalls that accept N arguments. According to the
> calling convention, values twice the word size reside in register
> pairs and as a result, syscall arguments don't always have a
> direct register mapping on rv32.
> 
> [...]

Here is the summary with links:
  - riscv: Fix syscall wrapper for >word-size arguments
    https://git.kernel.org/riscv/c/a9ad73295cc1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
