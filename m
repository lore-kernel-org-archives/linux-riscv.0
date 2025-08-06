Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BCCCA0EC0
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 17:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/WP8mvbjRBdYNCRSNf28G0IEuiKgJbe5hdZA926/Y0=; b=TLRPFuLKoqNHnI
	Rpjur1Tt6R7fcbnK9++zA/zCdIQS5b8pL/VnavMc8rSfSNdUvNy11jaC3yWf0uHAI1nXcAn1YTUjN
	KjvWGtPehxmz1OxmqHoOM0/SIXV4YWz4r7ldKLMRaLInfrvubnbevV414HT+kAll74hlRjArnu8Xg
	ErL2lnfXdOVxTKwdm0tkKIWKrFB1CTI7lvC2Je+6jt0NlnMfQ/7xUi7ZJniXgZ6LmXFXaOEGowAfJ
	YcPCwWLycq2F1PY79yH8EUXcydmMLKJqpvmzPCFdqBBs7hfXDP5Z0XkoSj9loVSyMOezKOxRqhuDw
	VFYu/4X+PiySmVdtkEmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhnx-0000000FtO9-2nLc;
	Wed, 06 Aug 2025 17:19:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhjp-0000000FsEb-3JKU
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 17:15:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8021E44C2C;
	Wed,  6 Aug 2025 17:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617BEC4CEE7;
	Wed,  6 Aug 2025 17:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754500541;
	bh=5gTmnwipvuK0mCh6kDXIbQ1cXlp5XEVZRIIYS+AQmMk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mQYaaw+jAz5cAeOhBO8a8FUFLCV9+yIzqsyAzWoqvsdoffIkqXEcKroIlbw/5QEbk
	 ngHrwY7j77qzA9Wa+drhLApd5kswPJ2JeUfQUUO+xVrUHO5A3Amb1qF1me+736R7Y0
	 dfY2Nc0tZnjgxHDDyro+jZJrzgBgPGBNdbdmrX2+8v4c/C++/PrA6OBkQB+2PM5qd8
	 n9hIhlgHNFJLmHe5pSoZl05hgvLWaSDl7TDbWZ2CVKmtB3HzyQVtBCECS36m6Wi3yd
	 1GTo4W7Rd5rx0NbNxUSQFaxOFSN4zsPyp2Qc0ffL3PaCeGe1g1jrQ61fZ/RDeS9KAT
	 3A6a/qpfRX7mA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70EEC383BF63;
	Wed,  6 Aug 2025 17:15:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] riscv: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 header files
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175450055499.2863135.2738368758577957268.git-patchwork-notify@kernel.org>
Date: Wed, 06 Aug 2025 17:15:54 +0000
References: <20250606070952.498274-1-thuth@redhat.com>
In-Reply-To: <20250606070952.498274-1-thuth@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 atish.patra@linux.dev, anup@brainfault.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_101541_849186_EC8F26C5 
X-CRM114-Status: UNSURE (   9.72  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Fri,  6 Jun 2025 09:09:50 +0200 you wrote:
> The kernel Makefiles define the __ASSEMBLY__ macro to provide
> a way to use headers in both, assembly and C source code.
> However, all the supported versions of the GCC and Clang compilers
> also define the macro __ASSEMBLER__ automatically already when compiling
> assembly code, so some kernel headers are using __ASSEMBLER__ instead.
> With regards to userspace code, this seems also to be constant source
> of confusion, see for example these links here:
> 
> [...]

Here is the summary with links:
  - [v2,1/2] riscv: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
    https://git.kernel.org/riscv/c/c47963980ba6
  - [v2,2/2] riscv: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
    https://git.kernel.org/riscv/c/b5eb1f12a416

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
