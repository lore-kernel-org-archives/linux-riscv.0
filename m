Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B177606F6B3
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o7wyRU1L;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sw2wvSa9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eSMuNF94sZNE5HOyNmfq+9/MvU277DHkyxy5tgD/7sA=; b=o7wyRU1LkTyAqBcGLhBb8oGUiz
	3ZDH5oC3Q1fIn+7LNn4s1lc0IN7KTPSTY6r/+FJ5w66Spx7qnQ6pKNheEG3ubmIKrEXjkP26N9D3C
	jVNVXZrc5oXJ47nCbq4eO5PTaHUW+1LyQwXmasyRt5UDh1VvQvQeY4sohFBvELBFxUQM7jLtGN/D4
	M35IZdfNEDyxNYMhyYcbjBTBMAwY5ezIybljkYXubGRI4B7AO/qfeBRGmoaYp04vo/naMTTaeeSYu
	WLgO2p8eFw4pk2W5lfO5JJ8cGFczFztFMxD14UAzyt043ZPUrv0S2j/1ge9nWSO4pp9c6/4/XmQOf
	yn4q5y9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrj-0000000F3U3-3PuA;
	Sun, 01 Nov 2026 22:17:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrD-0000000F1bv-1Yzp
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F0F6644009;
	Sun,  1 Nov 2026 22:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5BBD1F00A1A;
	Sun,  1 Nov 2026 22:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571414;
	bh=HltbMUNV2mL7CmzUNbC48/jDW0dqtweL2/SgQbNH2V0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Sw2wvSa9SHk+5nIAcZtroRIwKn3V8PzpfgbTLlVEV2B7Xsn//R4odyY0lpJuvkfxl
	 NUZRIwvOhsHBhiPm4aKwcK/KKj3SJoyTiRkThQXKWOCyMxiNH0czjnItiMBrcqFga7
	 uuczREcVU5lBB+gyieVoJQUbYjoYHae2v3rLcILiOpCvWoFXuRaWQn0K5Q/kHvzBTZ
	 7pABNP2hcIomqaTsjurf04sAXjbEbAJtS5ik2OrgzBtbk8OsoUZ/jXIyzmR7cCJIyQ
	 383vUSbItJnXYvFwIhgBanuA94ScjhOdY/FSt2V66ReLpmbDYJ9lM4+t4c4cA36L5q
	 FvbztgSLAHKsQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA53838003B8;
	Sun,  1 Nov 2026 22:16:54 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/10] riscv: Add device tree support for UltraRISC
 DP1000
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357141329.2624073.10814218023350815293.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:53 +0000
References: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
In-Reply-To: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, daniel.lezcano@kernel.org,
 tglx@kernel.org, samuel.holland@sifive.com, anup@brainfault.org,
 broonie@kernel.org, andi.shyti@kernel.org, mika.westerberg@linux.intel.com,
 Eugeniy.Paltsev@synopsys.com, vkoul@kernel.org, Frank.Li@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@sifive.com, conor@kernel.org,
 linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
 dmaengine@vger.kernel.org, conor.dooley@microchip.com
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to riscv/linux.git (fixes)
by Vinod Koul <vkoul@kernel.org>:

On Mon, 07 Sep 2026 17:54:39 +0800 you wrote:
> Add Devicetree support for the UltraRISC DP1000 RISC-V SoC and two
> DP1000-based motherboards: Shenzhen Rongda M0 and Milk-V Titan.
> 
> DP1000 integrates eight UltraRISC CP100 CPU cores.  The SoC description
> includes the CPU and cache topology, CLINT, PLIC, clock controller,
> pinctrl, GPIO, four UARTs, two SPI controllers, four I2C controllers,
> three PCIe root complexes, GMAC, and the DMA controller.
> 
> [...]

Here is the summary with links:
  - [v2,01/10] dt-bindings: vendor-prefixes: Add shenrongda
    (no matching commit)
  - [v2,02/10] dt-bindings: riscv: cpus: Add UltraRISC CP100 compatible
    (no matching commit)
  - [v2,03/10] dt-bindings: riscv: Add UltraRISC DP1000 board compatibles
    (no matching commit)
  - [v2,04/10] dt-bindings: timer: Add UltraRISC DP1000 CLINT
    (no matching commit)
  - [v2,05/10] spi: dt-bindings: snps,dw-apb-ssi: Add compatible for UltraRISC DP1000 SoC
    (no matching commit)
  - [v2,06/10] dt-bindings: i2c: dw: Add compatible for UltraRISC DP1000 SoC
    https://git.kernel.org/riscv/c/3d067add1281
  - [v2,07/10] dt-bindings: dma: snps,dw-axi-dmac: Add UltraRISC DP1000 compatible
    https://git.kernel.org/riscv/c/58a66a560aa1
  - [v2,08/10] riscv: dts: ultrarisc: Add initial device tree for UltraRISC DP1000
    (no matching commit)
  - [v2,09/10] riscv: dts: ultrarisc: Add Shenzhen Rongda M0 board device tree
    (no matching commit)
  - [v2,10/10] riscv: dts: ultrarisc: Add Milk-V Titan board device tree
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
