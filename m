Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEDBC0015E
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 23:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyJK4gW3AU/Sdjgaoap37lPOPkbKQM+2wUyEucrUHDo=; b=P/2OhCDd+bAzpC
	Q9fnL1es94mf3BccpoNluELrYf/z9+PE+OlA8gEs1OD/fYHLuzStp5awghOHyCkcKxH9WNi7XHgm5
	W0X9VctvcJZgm2bAjbH0l3hh5wsy7JUZ+yQCj3gPJIuv5rffxnoaBDEtxBE9sOpajoboaBzXarOFm
	xVdxacI34nZ9ADCyBf3OQKR9VpBUu4zysYvCCAX3oR6RUrRtict8BbV7ZMShVYimyx5lVKssptS0W
	gWx96MSaTGFvriRPmm9wCbG+Fm9wBS9wC/MChFPqGIHWtk6XkdVTBNvPoDIxbvmyKrtZXV49FETfr
	H4cnlneezCn+OMoVggLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHCGR-00HOLy-33;
	Wed, 05 Jul 2023 23:50:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHCGO-00HOJJ-0f
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 23:50:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C195617AC;
	Wed,  5 Jul 2023 23:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C4C8C433C7;
	Wed,  5 Jul 2023 23:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688601022;
	bh=dgXQEhdOdm8Y9HQ7BRI3NqcsjIWDbxMCk69RUHbOSWk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dCFDTpVawFPZDWwMeLUlZl3+wm089lS5dcOC5grNJ+72BcuEaOa1oA9e4PpYqF1OC
	 4cGQkMuzHX9Ni11AAaV5Iv9Iu13dfzBMwb1uC2s6/0nySsH0v0r0Dy7C3jdPNM8QtC
	 Lp5AWa/WlE56DlwdZz9v1LDLFaqvuUf6QIU9c4Hz6Gxxm87wrIWGh7F0zosAlXfpTr
	 SoFZRkGmZsbDT2txlI4pFS9tCboA2QScLF2SWbd1if/6ZU/Sv35k+FhF0VEuPldCsy
	 nIzCFOrYbGZjsuMLHN4TrTP1ahTMFP0uN98OjTKwOD4e1tMzHNc/ZoyaxLLmOVeRGW
	 WnAcI/yp+CeOw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 840C5C64459;
	Wed,  5 Jul 2023 23:50:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Enable ARCH_SUSPEND_POSSIBLE for s2idle
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168860102253.23922.13316871741173468585.git-patchwork-notify@kernel.org>
Date: Wed, 05 Jul 2023 23:50:22 +0000
References: <20230529101524.322076-1-songshuaishuai@tinylab.org>
In-Reply-To: <20230529101524.322076-1-songshuaishuai@tinylab.org>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor@kernel.org,
 suagrfillet@gmail.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_165024_305065_59D507C6 
X-CRM114-Status: UNSURE (   9.50  )
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

On Mon, 29 May 2023 18:15:24 +0800 you wrote:
> With this configuration opened, the basic platform-independent s2idle is
> provided by the sole "s2idle" string in `/sys/power/mem_sleep`.
> 
> At the end of s2idle, harts will hit the `wfi` instruction or enter the
> SUSPENDED state through the sbi_cpuidle driver. The interrupt of possible
> wakeup devices will be kept to wake the system up.
> 
> [...]

Here is the summary with links:
  - riscv: Enable ARCH_SUSPEND_POSSIBLE for s2idle
    https://git.kernel.org/riscv/c/c1f048a6bd7d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
