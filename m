Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FF8C52D7D
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 14:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ACzkipAsGcTAy37VDQy17dT0pGjvmNACjlRcXeAQBe8=; b=GP3Oo7oPkTcMUG
	WdtaF0KuAoW+O4DK6b6IMBCTLVVfKMzi7gpahzXirQwo6irxE0/jjsVkhD0+w4VQu6k6GhAN1X/n+
	WCB9IXLWDHp++2UgNW9z4q5re2YfhQT1ec1cAPqrsQp3I6TQF+VfpXdfDjim4VALiWzf36Z8mFFS0
	/az4plWcLtVGCgKemzCkiFgOKfa7mASjFkEchIxwufPxl++d4c8rwbf1GumTOTo13yRflBYiJPI3E
	2FBQQlp1b4pjfF1AT3ouOGmeK9kHtKLbwf+st2xe9nOaX7mYxBi9BgVWo0PgBg6If1v36wyW7q79H
	jXYcwslPaN1CnytKvb5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seEhx-00000007DhL-35HV;
	Wed, 14 Aug 2024 14:10:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seEhu-00000007DfK-1UC0
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 14:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47A1361A9D;
	Wed, 14 Aug 2024 14:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1472DC4AF11;
	Wed, 14 Aug 2024 14:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723644633;
	bh=KdgwpVZN4uMBbr71j9vE0petOsSpXyckYOOAL7K8sQ4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=exksjn/Enaqn+WwSi1BZlTscDfpk98P3YHgxVXlHEQa83TlfoYkiYsdAHid2XdVVA
	 QIgEGMuoySCw69KG+0LfeZCem8NspAHXtUw6G4S3F9s6BeEA+xOPgWf0XMhfrgX3Zb
	 dSbPiituiEm127KRnrdO2JhJPMPoEgcP6l4cGItVJCbroNVD3ASDTNPkCO7TZVk7AC
	 MenuL1z2ndl5AKRGeg0+TMNnrY4U60ocblER3+OojkFAa02v6QHrBv99Y0ux0N7HvX
	 Dgeoqb5ZFzlTxgRnnyBxDBXZI3mWxGMeaeIlwXnimAqU3LbcPcyxQu4p6KFkTueof7
	 J7YIjOSnOpanQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70EB138232A8;
	Wed, 14 Aug 2024 14:10:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/4] RISC-V: Parse DT for Zkr to seed KASLR
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172364463227.2278280.4833968885789479932.git-patchwork-notify@kernel.org>
Date: Wed, 14 Aug 2024 14:10:32 +0000
References: <20240709173937.510084-1-jesse@rivosinc.com>
In-Reply-To: <20240709173937.510084-1-jesse@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, ardb@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, alexghiti@rivosinc.com, conor.dooley@microchip.com,
 masahiroy@kernel.org, twd2.me@gmail.com, christophe.jaillet@wanadoo.fr,
 samitolvanen@google.com, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, vishal.moola@gmail.com, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_071034_509422_0F0D3DAF 
X-CRM114-Status: UNSURE (   9.39  )
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

On Tue,  9 Jul 2024 13:39:33 -0400 you wrote:
> Add functions to pi/fdt_early.c to help parse the FDT to check if
> the isa string has the Zkr extension. Then use the Zkr extension to
> seed the KASLR base address.
> 
> The first two patches fix the visibility of symbols.
> 
> V1 -> V2:
>  - Add RISC-V: pi: Force hidden visibility for all symbol references
>  - Add RISC-V: pi: Add kernel/pi/pi.h
>  - Rewrite archrandom_early.c to parse DT over checking the csr
> V2 -> V3:
>  - Add RISC-V: lib: Add pi aliases for string functions
>  - Rewrite isa_string_contains in third patch
> 
> [...]

Here is the summary with links:
  - [v4,1/4] RISC-V: pi: Force hidden visibility for all symbol references
    https://git.kernel.org/riscv/c/14c3ec67236b
  - [v4,2/4] RISC-V: lib: Add pi aliases for string functions
    https://git.kernel.org/riscv/c/d57e19fcbf3f
  - [v4,3/4] RISC-V: pi: Add kernel/pi/pi.h
    https://git.kernel.org/riscv/c/b3311827155a
  - [v4,4/4] RISC-V: Use Zkr to seed KASLR base address
    https://git.kernel.org/riscv/c/945302df3de1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
