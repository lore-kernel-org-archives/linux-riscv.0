Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252D3EB64DB
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 01:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CH2y9Ma3iGde1kxJYav/g0v+9jFOyXdERWVj32SMmUM=; b=F+b4seWXnuceQm
	nkXUaJ6w6IiceJk0NMwNktseN2SbFYRTR0XT0IHdRutua81uSpF8OZPbx2k1u9EH1DDlXCKZsqa63
	6KvPczSYcCRMXrDD8djFnG/FXFCtjO9Qzuh1oEueXI6JSlAB3uESXJXTh/+IbmZFCmGT/wcFqYhpk
	I5dhfc0w4jnEvEljS7QGbkpPRR+AuJVW7ykEWEkCLfrfQyZR6P5IfwFPJEoP9pmrKPDW9yCxG9bSt
	/D6uco46Ih7wFcB78RhU1P8WWZC+WwOAfKJHMnOtF/XHJ1hHmJiN3ocRbFRU1vxxH0QYvyKNHitDE
	jrCIUhjBfvPDMNZ15zXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPjU-009pYg-1n;
	Tue, 20 Jun 2023 01:00:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPjO-009pUX-0H
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 01:00:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1992760EC9;
	Tue, 20 Jun 2023 01:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 045F6C433CA;
	Tue, 20 Jun 2023 01:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687222824;
	bh=wKn3JK30iCELZzAybdtpR5nHk34wWPJ1QywkzzhvQ0k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=F7Ydm/tK+13fLP9A9NcnuVJC950Qz765+hxiBCCuSw5NBR9HnXzPpKf3yEfKt2luk
	 WjLNeteyf8hshL0a7b16KTCEYWQ0F7VA/LMGbFCfgtIZV+WQ/cfWhE4V/p9MoF70dT
	 Ou27prk09vZr8p+pw46UArC39zsniH5bBw/9abVr05D3oodZQ/yaxDyNhGDEss45uN
	 T2wbxNKh95UufklR8PagZNoPYcLFyppjMZLMw8vnYcVsyabkqLLYVa2U8ULu512N00
	 eWM+Bw6MJp1MM1/MPLmsUWo6a9RemcSR5QErv0iKp65RtD7N4Uh58k4l9lu7iyKMBy
	 A6qQViXvRbiqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D6011C561EE;
	Tue, 20 Jun 2023 01:00:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/3] RISC-V: Export Zba, Zbb to usermode via hwprobe
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168722282387.22807.6974446089239901729.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 01:00:23 +0000
References: <20230509182504.2997252-1-evan@rivosinc.com>
In-Reply-To: <20230509182504.2997252-1-evan@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com,
 apatel@ventanamicro.com, aou@eecs.berkeley.edu, corbet@lwn.net,
 abrestic@rivosinc.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, conor.dooley@microchip.com,
 coelacanthus@outlook.com, jszhang@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, heiko.stuebner@vrull.eu, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_180026_172780_3D155DFC 
X-CRM114-Status: GOOD (  13.08  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue,  9 May 2023 11:25:00 -0700 you wrote:
> This change detects the presence of Zba, Zbb, and Zbs extensions and exports
> them per-hart to userspace via the hwprobe mechanism. Glibc can then use
> these in setting up hwcaps-based library search paths.
> 
> There's a little bit of extra housekeeping here: the first change adds
> Zba and Zbs to the set of extensions the kernel recognizes, and the second
> change starts tracking ISA features per-hart (in addition to the ANDed
> mask of features across all harts which the kernel uses to make
> decisions). Now that we track the ISA information per-hart, we could
> even fix up /proc/cpuinfo to accurately report extension per-hart,
> though I've left that out of this series for now.
> 
> [...]

Here is the summary with links:
  - [v2,1/3] RISC-V: Add Zba, Zbs extension probing
    https://git.kernel.org/riscv/c/c6699baf1064
  - [v2,2/3] RISC-V: Track ISA extensions per hart
    https://git.kernel.org/riscv/c/82e9c66e81c8
  - [v2,3/3] RISC-V: hwprobe: Expose Zba, Zbb, and Zbs
    https://git.kernel.org/riscv/c/c0baf321038d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
