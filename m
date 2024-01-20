Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5039C47DDB
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 21:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCTO0t0FwlmAT+sXaU1ieri8FRHpBtsmhw76fpEH8YU=; b=wC0qyz8aapYNzK
	CVl2bnLHMPEgHuRxCpOsP9PwWXnrtaKGs6tDrcFOjAAG+PPTRFa5PGCi21lydyEfsW2+H/3sDw2UO
	Dp/vXUoqXDLv11tMo5CEe/T5ZWTcB8eK5KDgQfliUuHUz2H0dJoJCwPd3cMYpYnIgh+4krqiJXvPj
	xD4zRJ4XHfUcuN7P8C3Amt0FeVRPk/vVKs/O/IiijikvCeeM/SbeY/l185vzT5SSTlIwwUVKgZ5Y+
	TPzgUsgM4kFW9/MYCbh284iRLhalM8L2CCED5iwGqj6wJuyVsJvw+GrHo3WIx+5auczN998leOKzB
	B4ZqTWaEh6YalC9qYMAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbf-008OcF-0N;
	Sat, 20 Jan 2024 21:10:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbL-008OFd-1s
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 21:10:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8AE61CE1C1B;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FC8EC43330;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784999;
	bh=tBihYQAUnauvx11/kprMMa7zEBfkVJTlWEglY1n6W24=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a2Ni8GajTJBMZhYjI/P1Gb1obqmTNY8oiBOjL/gc25l6/9JWBrkswOROVMAiU1ELz
	 qMgDyFGlwBMTunLLCthgMEtCKVoR3zibtD3dHXuju5NA6ma4S7gbUYR7G0ZzLD7CJi
	 nfczKrWkZQjn02b6dktq9bpOT5E6ocX0e7GkcCcEINEFxRt4JXQSA5IOKK6RZ7GI60
	 WQtdy4odT7xT7xR2ZXy+cVn56WP/+OEngZsL+z4IkAczCPpo9UI9m3Z2JJg2hUea4m
	 4kFAYe7Q/+R4+DJ3hZYXYP0II7ukaGha1aHmaJsC7PXBkphki9YjNdSyCFLy0jM1eh
	 GLB2fWOAO3ldA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1F34CD8C985;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix build error on rv32 + XIP
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578499912.24348.17976593950031551472.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:59 +0000
References: <20240118212120.2087803-1-alexghiti@rivosinc.com>
In-Reply-To: <20240118212120.2087803-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, rdunlap@infradead.org,
 sfr@canb.auug.org.au, linux-next@vger.kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, haxel@fzi.de,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_131003_883061_605921E6 
X-CRM114-Status: UNSURE (   9.80  )
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

On Thu, 18 Jan 2024 22:21:20 +0100 you wrote:
> commit 66f1e6809397 ("riscv: Make XIP bootable again") restricted page
> offset to the sv39 page offset instead of the default sv57, which makes
> sense since probably the platforms that target XIP kernels do not
> support anything else than sv39 and we do not try to find out the
> largest address space supported on XIP kernels (ie set_satp_mode()).
> 
> But PAGE_OFFSET_L3 is not defined for rv32, so fix the build error by
> restoring the previous behaviour which picks CONFIG_PAGE_OFFSET for rv32.
> 
> [...]

Here is the summary with links:
  - riscv: Fix build error on rv32 + XIP
    https://git.kernel.org/riscv/c/66f962d8939f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
