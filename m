Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917F9C41513
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 23:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6iErPkFGdcb7fkqjzz5QPtCXEspTZwEjROo7u6mDAaA=; b=dGFjLOLRC0ff+g
	+GL0mgGy8Ys8kY2iv9X9LypJapOc0jThKPzjOJwEgim2HYlipmbst1OyNROnGtT6Y+KZ6rueI6Y2L
	0nxIFV8zUvVuTsjIBOyQsF+8x/iA7ScQglsRCe/W7XtzeZB1wRdNc+RKNjAcR8Zf17kdn4s6pCU/9
	v8A/WaBZYJxgkw/ls64jLRMlhAtCQaqvqNlBG6GlbmiUYFbgudQ0pnCrM0rPj0IjFT2WmVGvxtt3Q
	ItuCfu+0yw5IFtNFojy11S1euz3OJG2iFWPPmN1ycKYD7L6/28TioJnG9IhtQ6DIr0MvhrWrfDj1q
	S+nBazJaUWcyeLvh7saA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vkY-00000004VUF-1Tzt;
	Wed, 22 May 2024 23:52:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vkL-00000004VMy-3VP6
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 23:51:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB16762C04;
	Wed, 22 May 2024 23:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 036FEC4AF13;
	Wed, 22 May 2024 23:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716421908;
	bh=crYCel4T6v30YoWlgBUMmOcR90sSWioAG7Sjj6wBSyA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rY+EvH/vLojwdYlLZD3p+/oCLF1WAVA778rZPE9k37JyisSH/9qkiM3+mBvJBiPwY
	 yeWsAwUqfvBosNWRaQL0fZDd721/pw8N5NuC1Y4eq7Vl2/ZqMWRFOAoz2KCdJnK1LN
	 JHLJQf5tfxcR7UGHA8mR7G1ccY5mSPhF9TXjdMesCgQIYoi22+X6yld9BiMSYIXmaA
	 eu9c1ws2tbV5Yxwkr0gSqPtHk5aIgIQqviqV/Dq7iV0LsAVNs864QUlxoY8HkRLG74
	 8J6WcVcjKPvVY3R7SflQmkQ6j4n3i5e1UHGDOn3hOnhqHhm9p0dcLLZxtuPI0KW7eH
	 8rHeHRnzS9wvQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EA49FC43618;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] ftrace: riscv: move from REGS to ARGS
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171642190795.9409.3531878731027938184.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:51:47 +0000
References: <20240405142453.4187-1-puranjay@kernel.org>
In-Reply-To: <20240405142453.4187-1-puranjay@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: linux-riscv@lists.infradead.org, alexghiti@rivosinc.com,
 andy.chiu@sifive.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, rostedt@goodmis.org, mhiramat@kernel.org,
 mark.rutland@arm.com, samitolvanen@google.com, guoren@kernel.org,
 leyfoon.tan@starfivetech.com, debug@rivosinc.com,
 jeeheng.sia@starfivetech.com, suagrfillet@gmail.com, bjorn@rivosinc.com,
 cleger@rivosinc.com, viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, puranjay12@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_165150_109825_072A59DC 
X-CRM114-Status: UNSURE (   9.67  )
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

On Fri,  5 Apr 2024 14:24:53 +0000 you wrote:
> This commit replaces riscv's support for FTRACE_WITH_REGS with support
> for FTRACE_WITH_ARGS. This is required for the ongoing effort to stop
> relying on stop_machine() for RISCV's implementation of ftrace.
> 
> The main relevant benefit that this change will bring for the above
> use-case is that now we don't have separate ftrace_caller and
> ftrace_regs_caller trampolines. This will allow the callsite to call
> ftrace_caller by modifying a single instruction. Now the callsite can
> do something similar to:
> 
> [...]

Here is the summary with links:
  - ftrace: riscv: move from REGS to ARGS
    https://git.kernel.org/riscv/c/aa4cc1761cca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
