Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2992C4708E
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 20:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2MjT2Zf0wp8aoxMqXrf9fJxiuJVAWRjKdw6EMmjpwE=; b=N9vC8e9nsKn/QT
	5MTW99XIYn5zVamVyCAP9egZmRu8BgaxoW73rY4lt4y5BFwAIoK1TQNQjHhCW5BMAhR3ET+lpZ5OS
	vO1eDbpl1XHFIVrOFbW8a55Hy/Foe3PkncCimHGaXCFL2qiGLDe/oA/Abngv52jsNipv+StiIaXI/
	0Jdut6qtunK9YJqLN7iVOCD+bb+1DBNGkSWlaD+2XB5YR3POoihgo/c+bAxvU5jiTHCrIJlByZAEJ
	huo6fJXhJ2lHK8JjpmGcQO4c5FP5MnuZ+NK7S/9tFvvp8I39wuQgPSvTUMHkJf1ouCp3FyaEtZ5U2
	2PR16Vs2s7HFx14onqYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyeBE-00AEKg-0T;
	Thu, 02 Nov 2023 20:20:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyeBB-00AEHI-1h
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 20:20:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 67162CE12FF;
	Thu,  2 Nov 2023 20:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9524AC433CB;
	Thu,  2 Nov 2023 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698956430;
	bh=/Jk4SW/f5xx+2dCCe9o3KRpOAlbxu1h1a0OcLPsZ/k4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JO1PGddk/p1vr3oQaI15o/+9emSk7AstQiP3Oz6MqXce53cdsc1g7qoscJpBO4Jby
	 eD3TX4l1hWF0/KDKG0+CnnurAOvsVV0tZjMJegSvpUpWmSsowKyZWHuZa5ZMNid6mS
	 0cv7cRJG/azS0gsYtxhai9S6AjQtUpX9+uShZqAUIlFDyRRDBER64mWEUodHMXG+N6
	 NahSCUFTlp74z2tqaBSZnLwUFv9oWbD3w5YkB0M/xJNVwdPpwP8G82qILJNUWt9uo1
	 yaGeGxFrkEb82EyPKx1UN0dtT0Tf3x0zs4QU02HhSJbEQ8chUMfMhSMMifzeFQUxAY
	 opmswFtA3iLPA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 76D1EEAB08B;
	Thu,  2 Nov 2023 20:20:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: hwprobe: Fix vDSO SIGSEGV
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169895643048.22248.514127597835305748.git-patchwork-notify@kernel.org>
Date: Thu, 02 Nov 2023 20:20:30 +0000
References: <20231010165101.14942-2-ajones@ventanamicro.com>
In-Reply-To: <20231010165101.14942-2-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, evan@rivosinc.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 conor.dooley@microchip.com, apatel@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_132037_758344_EE6649A8 
X-CRM114-Status: UNSURE (   8.66  )
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

On Tue, 10 Oct 2023 18:51:02 +0200 you wrote:
> A hwprobe pair key is signed, but the hwprobe vDSO function was
> only checking that the upper bound was valid. In order to help
> avoid this type of problem in the future, and in anticipation of
> this check becoming more complicated with sparse keys, introduce
> and use a "key is valid" predicate function for the check.
> 
> Fixes: aa5af0aa90ba ("RISC-V: Add hwprobe vDSO function and data")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> 
> [...]

Here is the summary with links:
  - RISC-V: hwprobe: Fix vDSO SIGSEGV
    https://git.kernel.org/riscv/c/899376e85ae5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
