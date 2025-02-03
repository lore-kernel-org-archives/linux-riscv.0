Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0973C02197
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 19:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSf2r/uaolaHwuNwRJfZIAytSq1bPFvkv0u4JIr2vrk=; b=2SLpD0waeXypuw
	QTwXWLLCT0NJyGcQmZlvPJMWWpxO4dqfjkBo7QagzEZZQgeXsplgk/iZAPK/csidQ3wyYiKuC0ZqU
	+zsO29YZuMC0AzZXUg8JW1UgjEnmf6Xa2uJs3+C8Lyi6QUseCBGfJIc/G2Ha1DSgZCYs75OnRLJpy
	crGpExCyR4Ae+vZd73vSs8kUSW6iqwZUPVNn0DpYcD+x6rIYBlBJd1mY8YU5MIgWggS1E0TMCYg0U
	ZuJNRg8bfJLVhOEMrvmcAxloVQVwy5M9QHni9JCRkgeXips6r0WOfKb38neKK8SF3gWXAQW0+9JQg
	xby0UlL2BNMosQvZ2gOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1ub-0000000GQ5T-4AUv;
	Mon, 03 Feb 2025 19:15:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1uY-0000000GQ4S-24s2
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:15:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 611635C6791;
	Mon,  3 Feb 2025 19:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDDEC4CED2;
	Mon,  3 Feb 2025 19:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610108;
	bh=CbxsuWIv8VDWrnmls2vfuqVQB78ke4z+CYI65G16m2s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ErK7o7xObNb9MWkMXICLbCujWlewHxytKj49aMyDvOiDTHB+hH/lMulpTdFf/OWid
	 XeJuHRoSzzcNVTeLkaJyZJH3oKLDsc9OXUmc+Yvnuvi6fd68awZo5JwGh1hxoXoXmD
	 ZqfR3f7odxlyI02lIRG8HsqFm78f8VWRnusRPhm0KX/GRQ0daYRKHWCSanq0uj3DQy
	 k+T/SyQ0+r6UxdZJsDwo1asgeM8VZMB1z5ECsBwJCNEPhdUpnBjteMDEk4i7bnfxbl
	 AvdwvdD0flje15IGuCF4aRBBVQukQO7HiH6Gw/kQVQaoDypBEWXUF8Azq6AHdL1aBe
	 CTyzC/UHBRWuw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33ECA380AA67;
	Mon,  3 Feb 2025 19:15:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 00/10] riscv: add initial support for SpacemiT K1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861013603.3409359.4773072632762735715.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:36 +0000
References: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
In-Reply-To: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, cyy@cyyself.name, daniel.lezcano@linaro.org,
 tglx@linutronix.de, samuel.holland@sifive.com, anup@brainfault.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, lkundrak@v3.sk,
 devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, jesse@rivosinc.com, conor.dooley@microchip.com,
 inochiama@outlook.com, zhangmeng.kevin@spacemit.com, jszhang@kernel.org,
 matthias.bgg@kernel.org, kevin.z.m@hotmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111510_622518_054CC316 
X-CRM114-Status: GOOD (  11.22  )
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
by Yixun Lan <dlan@gentoo.org>:

On Tue, 30 Jul 2024 00:28:03 +0000 you wrote:
> SpacemiT K1 is an ideal chip for some new extension such as RISC-V Vector
> 1.0 and Zicond evaluation now. Add initial support for it to allow more
> people to participate in building drivers to mainline for it.
> 
> This kernel has been tested upon Banana Pi BPI-F3 board on vendor U-Boot
> bootflow generated by Armbian SDK[1] and patched OpenSBI[2] to enable
> Zicboz, which does not in the vendor dts on its U-Boot. Then successfully
> booted to busybox on initrd with this log[3].
> 
> [...]

Here is the summary with links:
  - [v5,01/10] dt-bindings: vendor-prefixes: add spacemit
    (no matching commit)
  - [v5,02/10] dt-bindings: riscv: Add SpacemiT X60 compatibles
    https://git.kernel.org/riscv/c/16c9147e6a6c
  - [v5,03/10] dt-bindings: riscv: add SpacemiT K1 bindings
    https://git.kernel.org/riscv/c/244fe889b950
  - [v5,04/10] dt-bindings: timer: Add SpacemiT K1 CLINT
    https://git.kernel.org/riscv/c/e5164af2a2fe
  - [v5,05/10] dt-bindings: interrupt-controller: Add SpacemiT K1 PLIC
    https://git.kernel.org/riscv/c/562272a287d5
  - [v5,06/10] dt-bindings: serial: 8250: Add SpacemiT K1 uart compatible
    https://git.kernel.org/riscv/c/dfe6d083edff
  - [v5,07/10] riscv: add SpacemiT SoC family Kconfig support
    https://git.kernel.org/riscv/c/8814aa123adb
  - [v5,08/10] riscv: dts: add initial SpacemiT K1 SoC device tree
    https://git.kernel.org/riscv/c/d8fe64691955
  - [v5,09/10] riscv: dts: spacemit: add Banana Pi BPI-F3 board device tree
    https://git.kernel.org/riscv/c/d60d57ab6b2a
  - [v5,10/10] riscv: defconfig: enable SpacemiT SoC
    https://git.kernel.org/riscv/c/21bef40ad121

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
