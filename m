Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D949C52D6D
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 16:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/D/u5mEomEPtoJTgYPYsLeLJE/l4v7ZEmmPJhN1ezk=; b=0T8TJ3Q617fuYZ
	3gMQvvdVhgdrD2VVaeZ3218IKcSnrbuB+iEKDurtQ2bZwU6cvtDsgc+3RtUWLF1b2nDDwyAiwe0ob
	4PPAId0B7LGQMD2FTOHrViiHk2UGlSX2Ri7APa6I0EN7bImJAaaFNoR6j44wfqG4dikLdCboZ0+c1
	2fCSXjq5JTCmuEWdq5M4QOS5AvLCGdYc2bqJOMLzVKoiHXeU8CGwxBd1uGyCTSRcKnZvHLBuiL8c0
	0CvH/gz6J+XhfoSev0IF/n7W1WKVJcv3qYIA3m6+6Uue5YX83P2bD63KB6WQZ1mI6eSLOCP79Vs4i
	LThMAdL4Iz8voHLGCR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYs5-000000067Yp-19bF;
	Thu, 01 Aug 2024 16:41:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYr3-000000067By-2Mye
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 16:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 79AB6CE1A6D;
	Thu,  1 Aug 2024 16:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2257C4AF15;
	Thu,  1 Aug 2024 16:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722530437;
	bh=HAo9NcZ5gBVJdxi7mT2lxsm7n1PGizrceEYRoxr1jhM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nUIGn0UbkXa5ky+E1NmdkvUY8ZB70+B3f3LUxIM5BNdvKK5HUGkpcv32IpgqlYuTg
	 6sY8pEt8OLoRHk29mVacPyRLSNFpuM04QtOMrW6jDKoNSGZj+KgNLdsus/wDPYBWCD
	 Ix+bITR1dzQ5dcsNUwCUf3hmHy4ThMk0vT0BkW1VbbIU/nUOa6qThUPjSfO2V2qV8y
	 qRpA8c2v9lIjuF9buSMLTbGX/gl04+7qxP8sfhgq4uSHY1NakhvfUe0meJrf7A4+J5
	 QD1Cz1giu3kPNSV/XPhqc/TGutSm0D6wGLOHBRkZPiysBcfutoVj2Dymj4xtxLVH3w
	 LGORMZufQa/IQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C13DDE8877E;
	Thu,  1 Aug 2024 16:40:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] riscv/purgatory: align riscv_kernel_entry
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172253043778.13740.15276670775860897839.git-patchwork-notify@kernel.org>
Date: Thu, 01 Aug 2024 16:40:37 +0000
References: <20240719170437.247457-1-cyrevolt@gmail.com>
In-Reply-To: <20240719170437.247457-1-cyrevolt@gmail.com>
To: Daniel Maslowski <cyrevolt@googlemail.com>
Cc: linux-riscv@lists.infradead.org, bjorn@rivosinc.com, cleger@rivosinc.com,
 alexghiti@rivosinc.com, cyrevolt@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_094041_873735_38C92607 
X-CRM114-Status: UNSURE (   9.84  )
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

On Fri, 19 Jul 2024 19:04:37 +0200 you wrote:
> When alignment handling is delegated to the kernel, everything must be
> word-aligned in purgatory, since the trap handler is then set to the
> kexec one. Without the alignment, hitting the exception would
> ultimately crash. On other occasions, the kernel's handler would take
> care of exceptions.
> This has been tested on a JH7110 SoC with oreboot and its SBI delegating
> unaligned access exceptions and the kernel configured to handle them.
> 
> [...]

Here is the summary with links:
  - [v3] riscv/purgatory: align riscv_kernel_entry
    https://git.kernel.org/riscv/c/fb197c5d2fd2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
