Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB496C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 15:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lB6F6wCJpmFngeMlV0A3MBXyWeUxEzETDU5IxtU+7RY=; b=sUbvtNWJU7GZaF
	fJ/WgiU8OMeIjuyEwoPOX0VXei1vClTvafTgFm+OPdQkW7NxQviXPG9i53m5jivH5D1fPIGCCRReW
	s7iBTkGuwTk/8hlsrizkpMpvn7FngaE+UuG9rnoI1wFqxpLninH7m1Qcs6Pal37M3N3U6dRddT0n7
	lNn9MgDBDyVxSKcEIx0ON1X0/O1se4gm/l7dPUFLqb94KiNtdp5f3Af5gD/ENrRAeYQTpU5O/BhMd
	jCqi6h6HNV7EJUKDopN44didYg6xhjDGlZ1PWpzETbpOc80rhdHfgRUtpjQmuHlDVHNimflidFfjz
	twl/3tp/XwVS6HsXnTTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rprYQ-0000000EUjC-0dCL;
	Thu, 28 Mar 2024 15:20:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rprYN-0000000EUhz-1sru
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 15:20:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4658FCE2BC1;
	Thu, 28 Mar 2024 15:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BF6FC433F1;
	Thu, 28 Mar 2024 15:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711639228;
	bh=jTAzDTiUZK9YosY1rfWt3V+wutEmog7rEf70mVoUnPQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VbTZ9kTsOT4a0gug/069OrFubPXyX5RXEarFN6Mg/DhRqR5szDvhx/GdOQs7TBVHT
	 AB/QAl/bG3FaBDzam9KDnkeNAZf1CiSI0rA7jr9VF6c0TU3mNau8DkPL1ZnK4eJYEj
	 0gPhkuWG802nmLovc7YN2UAi40/tPfKGU36edXu1DuUTy6nDB4tqkA5kuTB3AtlksB
	 94qsKUn4xapAusHi5NnGdydeKqAG/99U9g4Y3aQHSUPpNfSX/dHNhKA/Rq3G6tX/uD
	 GV7jat7K0MQgBga5i1NanNZD38r/Iu9B7WmNuYWa5oAHM3HgLbf7GZkKCfN7/twAvG
	 GbuUo6kUDGx1g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6994CC43168;
	Thu, 28 Mar 2024 15:20:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: compat_vdso: align VDSOAS build log
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171163922842.29744.11808016865919276594.git-patchwork-notify@kernel.org>
Date: Thu, 28 Mar 2024 15:20:28 +0000
References: <20231117125843.1058553-1-masahiroy@kernel.org>
In-Reply-To: <20231117125843.1058553-1-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_082031_719386_9BDBE4FC 
X-CRM114-Status: UNSURE (   5.92  )
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

On Fri, 17 Nov 2023 21:58:43 +0900 you wrote:
> Add one more space after "VDSOAS" for better alignment in the build log.
> 
> [Before]
> 
>   LDS     arch/riscv/kernel/compat_vdso/compat_vdso.lds
>   VDSOAS arch/riscv/kernel/compat_vdso/rt_sigreturn.o
>   VDSOAS arch/riscv/kernel/compat_vdso/getcpu.o
>   VDSOAS arch/riscv/kernel/compat_vdso/flush_icache.o
>   VDSOAS arch/riscv/kernel/compat_vdso/note.o
>   VDSOLD  arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
>   VDSOSYM include/generated/compat_vdso-offsets.h
> 
> [...]

Here is the summary with links:
  - riscv: compat_vdso: align VDSOAS build log
    https://git.kernel.org/riscv/c/7115ff4a8bfe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
