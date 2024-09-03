Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70828CD37AB
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 19:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TvRaYTI0S7eW91WrvevFC44zzhS0Rkk3wQqErMgpy6c=; b=Oe1Lpk2xM87Pv4
	TQOpKSRH6kOscPJ1CQbxY7mrpGJ6dMshHQWxrOhlaEnaVofR7tj+pqbvAy/z2rM6NIzrq6YXxEHh+
	DjHqQ/gSEYqs3cT0J2fjZDGQMzyA8aTLC6w2Kbtvtdn0UFSC5sA3ywBeV6H0Jac1FAyhV8uM5e9Uv
	eHGGdqt/XRntdxD8UpHxFmgD/X8Ux22OKineOHV4ilk0nmC8y8ci1WTmJ403xpQHngnTzHrnxYeSJ
	rTxmDvErAPlBA4KUX+ktFFXy7xLkh+zkmgtkPtUrGu6qhTxCHlW4UwbbnJeleGaHzKZyX15LCHQSZ
	7UuMxXZLrncKDdpC1QlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slYvE-00000001Z7F-3NZ0;
	Tue, 03 Sep 2024 19:10:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slYvB-00000001Z62-3hTT
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 19:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E237C5C4117;
	Tue,  3 Sep 2024 19:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03834C4CEC5;
	Tue,  3 Sep 2024 19:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725390633;
	bh=bi02hKY9TT2lgBGhRmTMgwKwEPLQd/+wT7G/ZLU/UDc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=m2OB85uy3/ByOiuTgWLvMWJg9SQVFnrfC+BBdRug0UlmmL/Nsb2LamUihzVtmAwmd
	 51YRQth7CM1M/Gk/MEJrqUuwTA2TyrMnB98MvdxSIjpgVJfK4E8ciGxL/DqrvBeE6q
	 VC4eihS0HvI8viVkQBsuBWk+qNHbCwePm8AGNFhcvPd8J0QeEgyWg3VpRv0d3vcsxw
	 QFAx719cV1OZLbErNUTA/lHH8Yg1gRMOwuknz32BD/FqOOlQAPl1FiGhdUr19Y3k8w
	 UDd+9TT558wlHtSgEKnQy1PeYx4/MkRNJlW2z/tqIj598YhCA7EDURvJlUYAeLGbr0
	 EUcm59Fq2kIAQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB95C3822D69;
	Tue,  3 Sep 2024 19:10:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes v2] riscv: Fix RISCV_ALTERNATIVE_EARLY
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172539063376.409367.11331685769005840751.git-patchwork-notify@kernel.org>
Date: Tue, 03 Sep 2024 19:10:33 +0000
References: <20240829165048.49756-1-alexghiti@rivosinc.com>
In-Reply-To: <20240829165048.49756-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 heiko@sntech.de, philipp.tomsich@vrull.eu, linux-kernel@vger.kernel.org,
 conor.dooley@microchip.com,
 syzbot+cfbcb82adf6d7279fd35@syzkaller.appspotmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_121033_982510_0001B6BF 
X-CRM114-Status: UNSURE (   7.85  )
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

On Thu, 29 Aug 2024 18:50:48 +0200 you wrote:
> RISCV_ALTERNATIVE_EARLY will issue sbi_ecall() very early in the boot
> process, before the first memory mapping is setup so we can't have any
> instrumentation happening here.
> 
> In addition, when the kernel is relocatable, we must also not issue any
> relocation this early since they would have been patched virtually only.
> 
> [...]

Here is the summary with links:
  - [-fixes,v2] riscv: Fix RISCV_ALTERNATIVE_EARLY
    https://git.kernel.org/riscv/c/1ff95eb2bebd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
