Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A379EC7619A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 21:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=og70gm9qhmtApbCQ9CI4EFYHD0dk7hZ/LGP/uzkSlgc=; b=OREITDr1lcFsIi
	SwJLCEwUUL1/M+t6zb19uGojEYd206iUt6yhSJUl1kjxrw2Rz3tDEdxnpIoBM5GwrtLNRtdRu1RIw
	J1RRuhibSjZJIEEGiAmj+dsgzyE7pcJ7nOczQjeoO10GwOiL25zRVoLmo1xqHkFg0h64N7GMa2PAp
	F4l8eXGI92TZafmPIQxmFLD9MluZYW99MNLKbbss9xgpHa77kO42rpcF9vNQjwMcP/O1w5eGCgBvQ
	dO0zSkH9qeLnN8jdeDK13ENzDJ5ECKgcw6A437hXZ5nEZ2tjkfkVPKuNSxp+XYAr4YkxvQx2zI0hQ
	OWKhr5mWAPr9nqqtR+5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phzXN-0055ut-1h;
	Thu, 30 Mar 2023 21:10:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phzXJ-0055u2-2g
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 21:10:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BE2BAB82A39;
	Thu, 30 Mar 2023 21:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 666F9C433A7;
	Thu, 30 Mar 2023 21:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680210618;
	bh=O+cjS7yD8pHdzp5zgruktqo14qk19j88CY4jY2VsQ60=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XsQZrw4qX2tAz1ujPErzk7Jd3b0KRFzPlz6dPw5oJVkkL3kizsBhwQkTrF4Z+oDPk
	 tluXzJa9qA5ysmfMm7Ab9kwE/8I/z8woScFX2U5o3/7YfvKGcGt9MVq9uVDLfI5JiW
	 /x/7DanIoJrxEJth8NXlSJDXfZYWUpbntWnuDkfW1Xr2iUQQwuUQl1a62cEU2y4a2w
	 Z0zHKTlgdv77IbChVhadvsGKlKMG5v9VEt3uRN+cJgGELY/oloVOnX6fhPVBXtKM3c
	 4RuYDYp8kXPH+aXOZFKwzf6ATRS5tmaLbsKqAjx1H37t25wXyy16J0/0m+CFjVABKs
	 5j33IkwbFQuSA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 52B31E2A03F;
	Thu, 30 Mar 2023 21:10:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1 0/2] RISC-V: Fixes for riscv_has_extension[un]likely()'s
 alternative dependency
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168021061833.10339.16976818508528489046.git-patchwork-notify@kernel.org>
Date: Thu, 30 Mar 2023 21:10:18 +0000
References: <20230324100538.3514663-1-conor.dooley@microchip.com>
In-Reply-To: <20230324100538.3514663-1-conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, conor@kernel.org,
 paul.walmsley@sifive.com, heiko.stuebner@vrull.eu, ajones@ventanamicro.com,
 apatel@ventanamicro.com, jszhang@kernel.org, Jason@zx2c4.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_141022_051474_D7F8AA69 
X-CRM114-Status: GOOD (  13.40  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 24 Mar 2023 10:05:37 +0000 you wrote:
> Here's my attempt at fixing both the use of an FPU on XIP kernels and
> the issue that Jason ran into where CONFIG_FPU, which needs the
> alternatives frame work for has_fpu() checks, could be enabled without
> the alternatives actually being present.
> 
> For the former, a "slow" fallback that does not use alternatives is
> added to riscv_has_extension_[un]likely() that can be used with XIP.
> Obviously, we want to make use of Jisheng's alternatives based approach
> where possible, so any users of riscv_has_extension_[un]likely() will
> want to make sure that they select RISCV_ALTERNATIVE.
> If they don't however, they'll hit the fallback path which (should,
> sparing a silly mistake from me!) behave in the same way, thus
> succeeding silently. Sounds like a
> 
> [...]

Here is the summary with links:
  - [v1,1/2] RISC-V: add non-alternative fallback for riscv_has_extension_[un]likely()
    https://git.kernel.org/riscv/c/1aa866931b80
  - [v1,2/2] RISC-V: always select RISCV_ALTERNATIVE for non-xip kernels
    https://git.kernel.org/riscv/c/1ee7fc3f4d0a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
