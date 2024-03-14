Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A89C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 12:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQnLk94WqzOWscbgmYfHheAr+wD6Pw9mkFUXlbtVUtA=; b=z1P35VAeDe9qGz
	jFjhrcsX7WMwhs1G+atqQ/zzeLhE/p0GRT4ksvNi50O0xdNL2tz+ottckvUDqaVkzl1YVhNlWDG4o
	hb4KdvCqJ6MsvgaB4U4wmYMGyUJQjt/u1A9LPxhV+nN6gRPLgNnPIviOwNguSJmwarV/OaIzDt8w5
	USSTWtfNEQMyjzWYwwAuv/96ob/Rl7UuuRc/gHTkKneRGZz3dZcXNd7bfwiDenGeXxa7+0koxXstY
	ndly9GN9l6cZlFkCfzikW2lpn1aAZzdVmjTxccfVEOanAcEWf7X9d36QzzgB+smsGsl4OSeVmEAvz
	X2xOK7d+mnAwZLV4eAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkkEQ-0000000EFmE-1AYL;
	Thu, 14 Mar 2024 12:30:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkkEF-0000000EFej-1Qts
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 12:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C7D80CE1DAA;
	Thu, 14 Mar 2024 12:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10E2FC43390;
	Thu, 14 Mar 2024 12:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710419432;
	bh=ZfYdgQYYHUKBjDat7ZMzQdGoJdurRPJ2XJ2xHAHrl0k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fvZy+mwdyc+wi8ZKZlrat5Iavdozk1eOUJq027QwMf1q4vElyuHBKQUk53/y+IrjA
	 dkh1XtQCx9Oh8rP2VvqQmulX9otGgVzP22b3y/E2yCeA9ldN6pFuBXvsew1gKL4t/9
	 +mHw3CVMPBcsFg0kuE9BrYcAo56JuaK/H5YMUyhO0mthCQq+q0XNffKgJESzgwXdet
	 SODh7t4dD9cdhNy2joxs/xxthWTu2IhIjCZD3prqOPTn8vxv3LT9V/p6BJe/sNQuRD
	 6tEero+cAZlwGze+34IMsyZV0vgJa8OR5YC8gi+VUZPxjaVrwlApwMW9sRyzIIYee/
	 DvLC14o6z7q3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 02D22D84BB4;
	Thu, 14 Mar 2024 12:30:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v9 0/4] riscv: Use Kconfig to set unaligned access speed
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171041943200.26728.3861424010420812739.git-patchwork-notify@kernel.org>
Date: Thu, 14 Mar 2024 12:30:32 +0000
References: <20240308-disable_misaligned_probe_config-v9-0-a388770ba0ce@rivosinc.com>
In-Reply-To: <20240308-disable_misaligned_probe_config-v9-0-a388770ba0ce@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_053035_767082_FB1DAB0F 
X-CRM114-Status: UNSURE (   8.97  )
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
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, ebiggers@kernel.org, conor.dooley@microchip.com, evan@rivosinc.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, cleger@rivosinc.com, linux-riscv@lists.infradead.org, lohr85@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 08 Mar 2024 10:25:54 -0800 you wrote:
> If the hardware unaligned access speed is known at compile time, it is
> possible to avoid running the unaligned access speed probe to speedup
> boot-time.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
> Changes in v9:
> - Clarify wording for RISCV_MISALIGNED Kconfig option
> - Link to v8: https://lore.kernel.org/r/20240307-disable_misaligned_probe_config-v8-0-55d696cb398b@rivosinc.com
> 
> [...]

Here is the summary with links:
  - [v9,1/4] riscv: lib: Introduce has_fast_unaligned_access()
    https://git.kernel.org/riscv/c/5a83e7313ee1
  - [v9,2/4] riscv: Only check online cpus for emulated accesses
    https://git.kernel.org/riscv/c/313130c62cf1
  - [v9,3/4] riscv: Decouple emulated unaligned accesses from access speed
    https://git.kernel.org/riscv/c/6e5ce7f2eae3
  - [v9,4/4] riscv: Set unaligned access speed at compile time
    https://git.kernel.org/riscv/c/f413aae96cda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
