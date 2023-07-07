Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0AEC001B0
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 15:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VSJ8URFRZbwJ/Z7IP3+SFOT2uuXvELG0KnqNTt9P6Ck=; b=zK8qgA/K+ZIAc3
	wtFncHOUS+8ZLP7tgzYPCGv8xQYET98m3nXyZqoXEZf3wpGWFNfw+fVkxomEMVl1k3B9qn+UXBFMs
	F7wOzH4luLiOiWwuRZJMTM78aryZgUDWLcr+Uxv4p3g09rGYK5r9/iFeJ+yAz3pcF7ruu+jlbCGuj
	eaIuSPVgAKdbPvIPMuco46PunRaD9q2Ufx7pBNmUAhwVT+UglQjbyMbJvwZYsVmq/uR5G66xpDb56
	QiT6m4KW+A+a64T49hq0BhdhiJb4mqHZjrRt1Esw+rxNRpM4y0PBw1+jX5WdujXNx4tU2lRHBjkgK
	FYYqYBBAjwp3CqbqAejw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHn6L-004zFF-3D;
	Fri, 07 Jul 2023 15:10:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHn6H-004zDD-1B
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 15:10:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1835C6145E;
	Fri,  7 Jul 2023 15:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F88DC433C8;
	Fri,  7 Jul 2023 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688742623;
	bh=2dh4tnVkPfE/NzvB3pEYoTiSBYTXVvMwmr877tZQ0Ic=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ICetrvfi1hW/2srHYb3SFLoBmdGXeN5OsIDMJHSm7oDNexAzcIRUnbRve1jaCYT6M
	 j7BZS3+Z4K6wRa7m2po5Y0fx/skuAb50FYoG1D61eERZGZwMYKNBPH0o4xXTX2xzPZ
	 K9Nr2jgtht0cLyDmrdNttVDDtmJe9AM9OGlQ66FKdoblaGCeHYjiiKEspvxdwOvUej
	 AExCh0HzCPPTx1tWbglABOZLaXN3YF9CJcjsuXfvQddXIpeF3uk4ZnGHJHKEH2OIsu
	 mVJ/9a0b5yy32cjgjgvFsMNwvj17mgM5MNRWhMLxXGCvJ5SIa7vHRVGoJ6JL6YZ8x3
	 ELVgEIlQ4pwKw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 54507E53801;
	Fri,  7 Jul 2023 15:10:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] riscv: some CMO alternative related clean up
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168874262334.15275.18352096242766499021.git-patchwork-notify@kernel.org>
Date: Fri, 07 Jul 2023 15:10:23 +0000
References: <20230614165504.532-1-jszhang@kernel.org>
In-Reply-To: <20230614165504.532-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_081025_448792_B354FBFA 
X-CRM114-Status: UNSURE (   7.80  )
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

On Thu, 15 Jun 2023 00:55:01 +0800 you wrote:
> This series consists of clean up patches of the "riscv: Reduce
> ARCH_KMALLOC_MINALIGN to 8" series[1]. Per Catalin suggestion, I will
> submit the enabling of riscv ARCH_KMALLOC_MINALIGN 8 in next
> development window. However, the cleanups are good for submitting
> now.
> 
> PS: Conor's reviewed-by tag is included.
> 
> [...]

Here is the summary with links:
  - [1/3] riscv: errata: thead: only set cbom size & noncoherent during boot
    https://git.kernel.org/riscv/c/31ca5d49264b
  - [2/3] riscv: mm: mark CBO relate initialization funcs as __init
    https://git.kernel.org/riscv/c/3b472f860c5c
  - [3/3] riscv: mm: mark noncoherent_supported as __ro_after_init
    https://git.kernel.org/riscv/c/8500808a991f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
