Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F67CCF9E3
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 00:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6OyAiZjLdXREvrviyjM2NVIbMUNJqJB9DLKjkgAV/g=; b=vmGvHhMCcrhY0u
	uSXMU4eYNXXXe6uVHBE314tPzODMeAGyDiMep1a8zKNbHEQVflGJPX28UkgtoLkdGA5AeTRz0cGPm
	RIDXm24U1bhXjep3UosGpj3i2IULKMpGIMBHO+xxsMGkC/2EV4QvoECaRR6ps6Q7fPVlU2pnwMUF6
	25sZn0n3fuekI4ns40lcd4lSoLZsGefvV2jC3Gk3SbrTm7RdKdPAMtt3H5U/l1DMO9Q3WTHKqhILt
	BBSM2NaIcqQjoCdkgE9EHTvKNbonObnX3/uug8zTbUPgl0Zgjo/mOFb9X+uBg2pGZjRCuJHCZDfbr
	y5QjU1AgK/5JLzRDllyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHXB9-00000001o4x-0cdq;
	Sat, 08 Nov 2025 00:51:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHXB6-00000001o3P-1xjf
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 00:51:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 82AFF41747;
	Sat,  8 Nov 2025 00:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F39C116B1;
	Sat,  8 Nov 2025 00:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762563099;
	bh=X65BSM7S8OpvSv2313E9aYYD5lZwDf8OKqldRYlKw7M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Fqyfe4fmm7PeEVnVCbpwIwdsaGziIAnYGuaQrD2B0AhEIL0L45oiJbi1IE1t/V1I0
	 G1C1a5Ky4KmUQB+3PK6v9IHuM/yppWU4nUmg4/14gVlt84FBATGLfQqZgXoI2eGO5A
	 wMyIULLnPK4ow0J9IbAzg4dTcw/QECb51VgYvycrRUijVNie0fNpmQ9VKtnOUYHqRz
	 wMYFbpUrRmWz8oaosZqbDCMvgR8szfDV9rG3lXL6AWsaQHt9hUTAUv5LAUgHuRXwS1
	 oJPgT2+xFUssTrbvTRnEx7JxFcxpl8dYR3dv8oCyfkaqQOXIieKmQJWHklYtHP9qeu
	 rRijJ+IpVUwZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD5E3A40FC8;
	Sat,  8 Nov 2025 00:51:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH fixes] riscv: Fix CONFIG_AS_HAS_INSN for new .insn usage
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176256307124.1206494.4272115513323337188.git-patchwork-notify@kernel.org>
Date: Sat, 08 Nov 2025 00:51:11 +0000
References: <20251107-riscv-fix-new-insn-usage-v1-1-9a186c5928a0@kernel.org>
In-Reply-To: <20251107-riscv-fix-new-insn-usage-v1-1-9a186c5928a0@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 alex@ghiti.fr, nick.desaulniers+lkml@gmail.com, morbo@google.com,
 justinstitt@google.com, ajones@ventanamicro.com, ben.dooks@codethink.co.uk,
 llvm@lists.linux.dev, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_165140_547960_37C1A51A 
X-CRM114-Status: UNSURE (   5.84  )
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
by Paul Walmsley <pjw@kernel.org>:

On Fri, 07 Nov 2025 14:56:59 -0700 you wrote:
> After commit 44aa25c000b4 ("riscv: asm: use .insn for making custom
> instructions"), builds using LLVM older that 19 or binutils older than
> 2.38 fail with:
> 
>   arch/riscv/include/asm/vdso/processor.h: Assembler messages:
>   arch/riscv/include/asm/vdso/processor.h:27: Error: unrecognized opcode `0x100000f'
>   arch/riscv/include/asm/vdso/processor.h:27: Error: unrecognized opcode `0x100000f'
>   arch/riscv/include/asm/vdso/processor.h:27: Error: unrecognized opcode `0x100000f'
>   arch/riscv/include/asm/vdso/processor.h:27: Error: unrecognized opcode `0x100000f'
>   make[4]: *** [scripts/Makefile.build:287: arch/riscv/kernel/vdso/vgettimeofday.o] Error 1
> 
> [...]

Here is the summary with links:
  - [fixes] riscv: Fix CONFIG_AS_HAS_INSN for new .insn usage
    https://git.kernel.org/riscv/c/dc20452e6caf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
