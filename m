Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D92D29C2F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 14:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZ5Wye1bAuKR8R2MlHldz2F052hHmlMC4jw7KTVcpcI=; b=h0kjNhVMGKNO0v
	5L4SoLBK0eGkaKovq0K+kltc1NZMJUMtzE2xGf/0dk2NNOT5Yo9Fk5DZiGUSOjyqlVk0EQVGge6Zp
	6Fn4mcYl1FA1earxW1+8sZRhFE9aXirv77dr/skJgM96oqKjeKMLta+JzwTjck2zDfKGTdUiqT5u6
	DPpvw1mfOkZ1WIo/j1l1M6KvxkMFxuFclei3CmiKoPNFmXbbl+88fH4c4+NGD+N70MygUXHF8oXb1
	ESYH27fFgETAgwbXAvoHHOJ4z/vYhZDv7Lljd5qSL/yOZjzAlrYOsYHvXo/nsgmYFSoWjKmZVv6Au
	auvsiWsKBCiSDIXIHxLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqBg-00000002FPZ-3Aeh;
	Mon, 19 Jan 2026 14:25:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqBe-00000002FOK-1JI4
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 14:24:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FFFC43CF1;
	Mon, 19 Jan 2026 14:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A31C19423;
	Mon, 19 Jan 2026 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768832697;
	bh=wNeKi6j82dbnM7fQoJ4uMc+HpcMGH000iz3AbHKbBK4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TiNNyWi5WhMQW+msa2UoKApyOBNB6SCXAYxwAjnCrIi9YxjcfXeDapSQ5ieVO+vNt
	 MV85qWjUKu0NLqro5J2/1I1dTrMnNR0n8qspvCXmYNaot7hm0lpl4lnfkyVdM8viL5
	 m2wrochU5IR16IMiwSMGaVnRsi0dSHOb7Jhgav9ECAb4HSjPsRzh2IjNeBHFGc0klX
	 hvX6ONtv04AH9cPpF7luKa14MhLIt7bDh/UXwuYP/rmekvnumtc2qA+lJOK4WFAGOJ
	 Cal/+aAwWFH6W/oCk89W5MLEJRCx01XVmsUgICf/rHxesl6uMxGphLd8LLWB6Lsvod
	 0mVgrVLHJdaKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F16553A55FAF;
	Mon, 19 Jan 2026 14:21:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] riscv: Use 64-bit variable for output in
 __get_user_asm
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176883248678.1426077.647982484224558012.git-patchwork-notify@kernel.org>
Date: Mon, 19 Jan 2026 14:21:26 +0000
References: <20260116-riscv-wa-llvm-asm-goto-outputs-assertion-failure-v3-1-55b5775f989b@kernel.org>
In-Reply-To: <20260116-riscv-wa-llvm-asm-goto-outputs-assertion-failure-v3-1-55b5775f989b@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, alex@ghiti.fr,
 palmer@dabbelt.com, nick.desaulniers+lkml@gmail.com, morbo@google.com,
 justinstitt@google.com, craig.topper@sifive.com, llvm@lists.linux.dev,
 patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_062458_370861_D99762CE 
X-CRM114-Status: UNSURE (   7.91  )
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
by Paul Walmsley <pjw@kernel.org>:

On Fri, 16 Jan 2026 15:44:34 -0700 you wrote:
> After commit f6bff7827a48 ("riscv: uaccess: use 'asm_goto_output' for
> get_user()"), which was the first commit that started using asm goto
> with outputs on RISC-V, builds of clang built with assertions enabled
> start crashing in certain files that use get_user() with:
> 
>   clang: llvm/lib/CodeGen/SelectionDAG/SelectionDAGBuilder.cpp:12743: Register FollowCopyChain(MachineRegisterInfo &, Register): Assertion `MI->getOpcode() == TargetOpcode::COPY && "start of copy chain MUST be COPY"' failed.
> 
> [...]

Here is the summary with links:
  - [v3] riscv: Use 64-bit variable for output in __get_user_asm
    https://git.kernel.org/riscv/c/bdce162f2e57

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
