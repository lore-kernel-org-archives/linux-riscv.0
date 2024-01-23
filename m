Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D91C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 17:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9iWeuq5E4LlRsB3EwfWB/Npy4mW9ERfo9sNPRf6bn4k=; b=G9ZKznmRkKVgev
	1Pv4fy5QXuKJYNbv4uTWNsUCPoXeVQ/PX9qj+N7GIvbWOePJ7gTMcZy1a5hrTDTnD9v92Q4QX99Vu
	y8Hr8ezG8gUIfn40SxxTzBzPVknDFaD9pgEd8QdjaimZqOiEQgSHcHVsb3wPPR90YnOvmzsqpBR8Z
	4aKq/SlLhy1DWumJ+aSoDwA9AlH9e1y/Vy3zpCU1JQhxsCjsuR13FSnoDiz72oB+KjbsAU+Bumgws
	eZjFVi4FBoAR+xAPrt6rcYTSSRfB2g7EKAsEB3V8/XSRLGjtHs+zqNZSksunxhhA5ZdVFkBuT5nYf
	dNqsgw3BVtIFsDbbaxRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSKvR-00HaNq-02;
	Tue, 23 Jan 2024 17:51:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSKvN-00HaLn-0U
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 17:51:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9624D61EBA;
	Tue, 23 Jan 2024 17:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBB36C433C7;
	Tue, 23 Jan 2024 17:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706032230;
	bh=Fg0kjr4p02yeL0dd3zpR20S3rY7QojmBvz5b3eZjGMY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=txpf10q3NNT5p/ZbgP37oRGugwd240cA5vlkhPPYdaRJzCLdrHhvFpUFCPEMJvdAD
	 xHdEDErc2MfD1gyre6Yn+ca6xxFLR7yr+85zx0RdnnL1BCGGswRkJAsvES7qddTc1d
	 jXwQsyD0oj1QSTgwEO6jGiRAiOhSdWqr5z9gsN/UngCkaXRVzgkj/LJaQuHuds8K8n
	 iMR4tJaYy4qu9h+/Y9z2w6Gk+HhYN1ICqFGRoUhk8bLLes+8SCbMZLCV39Zd4Ndqs6
	 83fxqyG93y/qRDVzoRnByqO4vwlsEz+ZMRxeV8YOyxJO6VIvepdfJuTlcVfjkUmvu7
	 K32Es2dZEBglQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D1D0CDFF762;
	Tue, 23 Jan 2024 17:50:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 00/10] RISC-V crypto with reworked asm files
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170603222985.30461.5962076100762100573.git-patchwork-notify@kernel.org>
Date: Tue, 23 Jan 2024 17:50:29 +0000
References: <20240122002024.27477-1-ebiggers@kernel.org>
In-Reply-To: <20240122002024.27477-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, andy.chiu@sifive.com,
 ardb@kernel.org, christoph.muellner@vrull.eu, heiko@sntech.de,
 jerry.shih@sifive.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 phoebe.chen@sifive.com, hongrong.hsu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_095101_230596_1A493F22 
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun, 21 Jan 2024 16:19:11 -0800 you wrote:
> This patchset, which applies to v6.8-rc1, adds cryptographic algorithm
> implementations accelerated using the RISC-V vector crypto extensions
> (https://github.com/riscv/riscv-crypto/releases/download/v1.0.0/riscv-crypto-spec-vector.pdf)
> and RISC-V vector extension
> (https://github.com/riscv/riscv-v-spec/releases/download/v1.0/riscv-v-spec-1.0.pdf).
> The following algorithms are included: AES in ECB, CBC, CTR, and XTS modes;
> ChaCha20; GHASH; SHA-2; SM3; and SM4.
> 
> [...]

Here is the summary with links:
  - [v3,01/10] RISC-V: add helper function to read the vector VLEN
    (no matching commit)
  - [v3,02/10] RISC-V: add TOOLCHAIN_HAS_VECTOR_CRYPTO
    https://git.kernel.org/riscv/c/34ca4ec628de
  - [v3,03/10] RISC-V: hook new crypto subdir into build-system
    https://git.kernel.org/riscv/c/178f3856436c
  - [v3,04/10] crypto: riscv - add vector crypto accelerated AES-{ECB,CBC,CTR,XTS}
    https://git.kernel.org/riscv/c/eb24af5d7a05
  - [v3,05/10] crypto: riscv - add vector crypto accelerated ChaCha20
    https://git.kernel.org/riscv/c/bb54668837a0
  - [v3,06/10] crypto: riscv - add vector crypto accelerated GHASH
    https://git.kernel.org/riscv/c/600a3853dfa0
  - [v3,07/10] crypto: riscv - add vector crypto accelerated SHA-{256,224}
    https://git.kernel.org/riscv/c/8c8e40470ffe
  - [v3,08/10] crypto: riscv - add vector crypto accelerated SHA-{512,384}
    https://git.kernel.org/riscv/c/b3415925a08b
  - [v3,09/10] crypto: riscv - add vector crypto accelerated SM3
    https://git.kernel.org/riscv/c/563a5255afa2
  - [v3,10/10] crypto: riscv - add vector crypto accelerated SM4
    https://git.kernel.org/riscv/c/b8d06352bbf3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
