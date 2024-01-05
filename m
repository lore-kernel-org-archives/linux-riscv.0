Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1A0C4707B
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 21:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJDKDpFjp/r1wdT9wS4Ow7V86q9koShJw9IuFq4BxDQ=; b=TKpOoN3VdfSeFW
	5kr1fCjAKsKbnWIdRjSeFPE9V+R+nVvR1UTjFDimtnUP+ye9Vt0v+/qocUWmrcBc3Z+QvPd1yt6Yc
	NMUIIwX+jeiTNAanl5/XEB5uPiptTbtZJSprRodjQyIDQ250VfOn1yQWjDs55JRY1DdnS4C2HBbmT
	vMBxGNLnL1DYVZrAPzV8vYdzEWw/UzikA63UrL8xQBeBtHayffUBamgoH1HRca4bbNXI+q843siAw
	Ck9RQHLs4Y4Bxv1M/gTT/0ngK+85BuC7Rs4pkfBteS6tHFHBWGlF0FKMV+FrgxD3l//XhktTRdFkh
	IpK1isrHKtkE8ALzxP7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLs5M-000Iwm-1a;
	Fri, 05 Jan 2024 21:50:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLs5H-000Iti-2M
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 21:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 79ABDB81D49;
	Fri,  5 Jan 2024 21:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC639C433C9;
	Fri,  5 Jan 2024 21:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704491427;
	bh=H9hR3FkvycpyNXOxYKUDOK9MTvCW3Ociac7lvOMCFmM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SJNNrVlSj6R9Rka2yzMoUnvoqIU8do4WEq1OHEh+PXHLk/eGHR1AGY35Mzd8FbkAP
	 iEmA06bzN/6LO+65UnX6dhqfto/70E5S4m3aHGpDrtbn2F0KYjy0MtfgBXC6Y4hyWf
	 40uB4Cjf2TpnSqoXLGSjnqMVmgO9qQzU3U7fcvyQG1mhk6qYo85v7lxkpJazSeDhx1
	 ecZAx0C2FfW+yXuGbTWMNoEkerj/rRjQcWFuglwtOpLxKooHVoI5Ej/n+s4i4y+dSw
	 U3bOi2qKqin/5PoTh0TDnj6vepNW7AoWTwkU1O6yc3iBnP9RXazwGmsnOADCWJvXDP
	 8xbR69fIa/klg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B7B71DCB6D8;
	Fri,  5 Jan 2024 21:50:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/4] RISC-V: hwprobe: Introduce which-cpus
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170449142774.26226.5996649817397365731.git-patchwork-notify@kernel.org>
Date: Fri, 05 Jan 2024 21:50:27 +0000
References: <20231122164700.127954-6-ajones@ventanamicro.com>
In-Reply-To: <20231122164700.127954-6-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, evan@rivosinc.com,
 conor.dooley@microchip.com, apatel@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_135031_929497_2DD95888 
X-CRM114-Status: UNSURE (   9.87  )
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

On Wed, 22 Nov 2023 17:47:01 +0100 you wrote:
> This series introduces a flag for the hwprobe syscall which effectively
> reverses its behavior from getting the values of keys for a set of cpus
> to getting the cpus for a set of key-value pairs.
> 
> Change since v2[1]:
>  - Rebased on v6.7-rc1 to get green on patchwork (dropped a couple
>    patches that were merged with [2])
>  - Added an r-b from Conor
> 
> [...]

Here is the summary with links:
  - [v3,1/4] RISC-V: hwprobe: Clarify cpus size parameter
    https://git.kernel.org/riscv/c/36d842d654be
  - [v3,2/4] RISC-V: Move the hwprobe syscall to its own file
    https://git.kernel.org/riscv/c/53b2b22850e1
  - [v3,3/4] RISC-V: hwprobe: Introduce which-cpus flag
    https://git.kernel.org/riscv/c/e178bf146e4b
  - [v3,4/4] RISC-V: selftests: Add which-cpus hwprobe test
    https://git.kernel.org/riscv/c/ef7d6abb2cf5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
