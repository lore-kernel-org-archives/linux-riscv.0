Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97190C3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 17:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yVf2atxUojXD76AW5BXzFxZ/qGpgfdriVFp5HPsqZBo=; b=OvZKyTIzSqRt/0
	8RRWUS7gt+eCVczuxIkejdZ8dHqtF2dOjPzmyuYhDxWwLf96Bi+NpoU85PwK0sgiRuFaUIgwomggy
	yDncz1j3RUK/3UZdW212JVCTI/Qa/mZJB+a+6oVlR5qJN4a9lLlj2PgdR5qjhf3h5KDLyYUw1v7FH
	zOS0NJmXpjG2mk5GMEgnHZ5IgYmK8JxoBsBSuMTI5jJudKhOjNEtqMeeRAer80iMSbyH2gwfZxa1f
	2FjmqbYxdWzef0cZ1LZjQ84heZBxV6hDMWE0IDqQDFr+q6SxVhCTvg9yVMhkvCaziyalk/snPKtop
	Bhcrberp4VMkGUaX125A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4vw-00000001NNR-2rhz;
	Thu, 08 May 2025 17:21:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4T3-00000001K5K-3Ytv
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 16:51:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 711385C6247;
	Thu,  8 May 2025 16:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56570C4CEE7;
	Thu,  8 May 2025 16:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746723088;
	bh=0k+Wh6+uCGMO9uLN2T6ncyytOn1upByjcEkNa1fx1r4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ejoa2BEdUlP1DbdY+j6d/ljdnXRtQ1JbuAIfWusXbXKwEX2fAuyovjXR4W6Ae76iB
	 K38V/ZVWGLbXs1xCy6gk+awFa54Rf1FxM+pA7SEMwyHQdjtXBLBBIsRZKr310lDAbR
	 kihI2OY/f3f/wrzvZj0R1ayWyPLh/OnpZT6MIEcooHaLQJaWUQYK2jHBGZSaoEIV7K
	 B3FHNQPprAa9LUrjKJhEoMbJkMusxLL7mUsQK/cIgq3Pf7lpskw8TxB/nBUsU9oE6Y
	 FfCfGnvoHs8lEhvhnxA+Nje7AMklgjO2s9qIJzoSlO/Liq3TqHGc8te/hGkPFfXQ0X
	 adn+WSXQ/Dlgg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34016380AA70;
	Thu,  8 May 2025 16:52:08 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/5] riscv: misaligned: fix interruptible context and add
 tests
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174672312700.2976395.88758017141795080.git-patchwork-notify@kernel.org>
Date: Thu, 08 May 2025 16:52:07 +0000
References: <20250422162324.956065-1-cleger@rivosinc.com>
In-Reply-To: <20250422162324.956065-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, shuah@kernel.org,
 ajones@ventanamicro.com, samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_095129_939344_1837AAAC 
X-CRM114-Status: GOOD (  10.63  )
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

This series was applied to riscv/linux.git (fixes)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Tue, 22 Apr 2025 18:23:07 +0200 you wrote:
> This series fixes misaligned access handling when in non interruptible
> context by reenabling interrupts when possible. A previous commit
> changed raw_copy_from_user() with copy_from_user() which enables page
> faulting and thus can sleep. While correct, a warning is now triggered
> due to being called in an invalid context (sleeping in
> non-interruptible). This series fixes that problem by factorizing
> misaligned load/store entry in a single function than reenables
> interrupt if the interrupted context had interrupts enabled.
> In order for misaligned handling problems to be caught sooner, add a
> kselftest for all the currently supported instructions .
> 
> [...]

Here is the summary with links:
  - [v2,1/5] riscv: misaligned: factorize trap handling
    (no matching commit)
  - [v2,2/5] riscv: misaligned: enable IRQs while handling misaligned accesses
    https://git.kernel.org/riscv/c/453805f0a28f
  - [v2,3/5] riscv: misaligned: use get_user() instead of __get_user()
    https://git.kernel.org/riscv/c/897e8aece3c8
  - [v2,4/5] Documentation/sysctl: add riscv to unaligned-trap supported archs
    (no matching commit)
  - [v2,5/5] selftests: riscv: add misaligned access testing
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
