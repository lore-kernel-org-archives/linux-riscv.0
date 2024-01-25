Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD3BC47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 21:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wcufB4m6ESK2ItfLNRTh5BJJluD/Lg1oTrt6XWhEtts=; b=eJ+MkvV/peY4OT
	ofr+hK1dAqr+U4w2terjP62jlnGDE4iyHr7JEyPb1O6dabL7GKHPF0w2A4wNrMRDQ81OrSU8GitFN
	9UUlJxmwA6HA/+KhZj4+C7HWVxlRakPhNAvx+Q2IGriTRPHnYt/Vtk6JH8OtD56SGrSbARySshnvN
	UADhWL8qBwIR+PsPoja5o239L2FfLpMZq1gWSn6xgJMFAXX0ID2985r86q1PcafsQAwsqdTwbOO5p
	tvkNKJh3AgMcwJQEagsRlAovU2+biqMyZD+T2OTtdGqc2UpUx8lAoOdDemyd/2m/glmdXiB3TJy5g
	R/THixEIu9DqnVyZUE9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT7J2-000000020S1-2lEg;
	Thu, 25 Jan 2024 21:30:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT7It-000000020Na-0KIX
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 21:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC26562321;
	Thu, 25 Jan 2024 21:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E478C43399;
	Thu, 25 Jan 2024 21:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706218229;
	bh=hNYJSDfuV3N344eeLzn2sV0t/R5y/+t3qenvX0+jyEM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Tz3bvmLE/rmxmgL8u96UNpX4fNSF3kFV+WFn+GcM5qHSq+1ufb9bbd4244z9/OWH4
	 T2Br5S5wvOZ3Q4M3LifqmzIwTczMXf2aR/8CjdKBDO6F5oCg9/FSO6bWxUV6rdT685
	 4/sMPFu4ucEqpVghNR8TLFjtLqWy7SGWn14zAoGGdbbQEZQ2glBqX5W+yDPzKFrtfG
	 vzdKjyKssqrtSLrHX8PV20HkaCG8WbIjxwLGc1wpsp2jT/o624kj3Q68mpvOp1baFS
	 ZQ/e8HQU5256jE2KRGV3P/FXcR79a0Io2TaGIll69k6bhGa9KhFQQ1KrqIZMTZ9xgb
	 J8foOQUjMZa5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 48EAADC9A05;
	Thu, 25 Jan 2024 21:30:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] riscv: Increase mmap_rnd_bits_max on Sv48/57
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170621822929.6239.356777907601716533.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jan 2024 21:30:29 +0000
References: <20230929211155.3910949-4-samitolvanen@google.com>
In-Reply-To: <20230929211155.3910949-4-samitolvanen@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org,
 keescook@chromium.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_133031_208512_0812C1FF 
X-CRM114-Status: UNSURE (   9.96  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 29 Sep 2023 21:11:56 +0000 you wrote:
> Hi all,
> 
> We noticed that 64-bit RISC-V kernels limit mmap_rnd_bits to 24
> even if the hardware supports a larger virtual address space size
> [1]. These two patches allow mmap_rnd_bits_max to be changed during
> init, and bumps up the maximum randomness if we end up setting up
> 4/5-level paging at boot.
> 
> [...]

Here is the summary with links:
  - [1/2] mm: Change mmap_rnd_bits_max to __ro_after_init
    https://git.kernel.org/riscv/c/71a5849aedaa
  - [2/2] riscv: mm: Update mmap_rnd_bits_max
    https://git.kernel.org/riscv/c/7df1ff5a5cd6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
