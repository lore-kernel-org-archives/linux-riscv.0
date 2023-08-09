Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA6FC0015E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 14:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9DFoXWrbFC/OEk7By7jID1icY0mwiifIRh3ioIVtEu8=; b=BxydQIzW3sNemv
	fF2TdvA2maJOS1WFMF41TXWWKPUDFTJy3huaiUXa3Mmac1r6jOUL633FVxVZIMizV+Ezckl1QQNf2
	Xmk7BBewz7SR8C0kI5gAPDJEg6DElzXkLT+AJsnlDVcwmPYdumLAqGYrzgd3NAXppnvQlQtV5KCwQ
	bA/PN/cbEuWynQWx8gbLImBjNbETsW/7KM2UF7RmU1Kk09oI8PoDhnF0orlhVkMCx0WcNuBIk71WV
	zn7CAtdUUkcyM+b3qzNyTALa5JGXAEDsgwY/ipg2D+UrYWm6RHItwiJaA274MnNzwqe6yP0qyb1Ry
	qkTQg2aFkOLG4euTfdUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTk32-0058fk-2L;
	Wed, 09 Aug 2023 14:20:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTk2z-0058eT-16
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 14:20:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 152296304B;
	Wed,  9 Aug 2023 14:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71D47C433C8;
	Wed,  9 Aug 2023 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691590823;
	bh=GYLw4R5ZP8Asgcy8c4U/E68U/BEFVITI0t4kAXKKJyg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iKoG6qTXz/QDY3IA7SBUrPMHv1yumYmq9dr1nWznwbiiUREaEEODsonj0tKjJtG26
	 oUeDXJMsUhldhBBOu0tA7hyL014NQKCVk7Xa/bnz9nNKndCybta98L7ERaut4PuRqB
	 A01zbT8H/DzlpnfsRiHWvRI5x+4PAsRy2KpPtHmnRTm9GoRsNIz5DiaaibAgeNcGjO
	 FoFFVnZW7gSHV0XVOcKP93ubOR0+zb3zucOlktFTKqoKa3BpWRHauTWK72xuJU+0T7
	 rxlv8S+oX1TkqUQjk48Iw7aL2bB8UZ989sSs3DRpKiP9EKgwaCzXkZAMuX35Lf3Z3y
	 lG/5t5F0mqEJw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 576A0E3308F;
	Wed,  9 Aug 2023 14:20:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 00/11] RISC-V: Probe DT extension support using
 riscv,isa-extensions & riscv,isa-base
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169159082335.5601.13810785902879648545.git-patchwork-notify@kernel.org>
Date: Wed, 09 Aug 2023 14:20:23 +0000
References: <20230713-target-much-8ac624e90df8@wendy>
In-Reply-To: <20230713-target-much-8ac624e90df8@wendy>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org,
 robh+dt@kernel.org, evan@rivosinc.com, krzysztof.kozlowski+dt@linaro.org,
 paul.walmsley@sifive.com, heiko.stuebner@vrull.eu, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_072025_482495_AA9C3B22 
X-CRM114-Status: GOOD (  16.02  )
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

On Thu, 13 Jul 2023 13:10:58 +0100 you wrote:
> Hey,
> 
> Based on my latest iteration of deprecating riscv,isa [1], here's an
> implementation of the new properties for Linux. The first few patches,
> up to "RISC-V: split riscv_fill_hwcap() in 3", are all prep work that
> further tames some of the extension related code, on top of my already
> applied series that cleans up the ISA string parser.
> Perhaps "RISC-V: shunt isa_ext_arr to cpufeature.c" is a bit gratuitous,
> but I figured a bit of coalescing of extension related data structures
> would be a good idea. Note that riscv,isa will still be used in the
> absence of the new properties. Palmer suggested adding a Kconfig option
> to turn off the fallback for DT, which I have gone and done. It's locked
> behind the NONPORTABLE option for good reason.
> 
> [...]

Here is the summary with links:
  - [v5,01/11] RISC-V: Provide a more helpful error message on invalid ISA strings
    https://git.kernel.org/riscv/c/230598939678
  - [v5,02/11] RISC-V: don't parse dt/acpi isa string to get rv32/rv64
    https://git.kernel.org/riscv/c/67270fb388fe
  - [v5,03/11] RISC-V: drop a needless check in print_isa_ext()
    https://git.kernel.org/riscv/c/131033689da2
  - [v5,04/11] RISC-V: shunt isa_ext_arr to cpufeature.c
    https://git.kernel.org/riscv/c/8135ade32c0d
  - [v5,05/11] RISC-V: repurpose riscv_isa_ext array in riscv_fill_hwcap()
    https://git.kernel.org/riscv/c/37f988dcec05
  - [v5,06/11] RISC-V: add missing single letter extension definitions
    https://git.kernel.org/riscv/c/c30556e318cc
  - [v5,07/11] RISC-V: add single letter extensions to riscv_isa_ext
    https://git.kernel.org/riscv/c/effc122ad176
  - [v5,08/11] RISC-V: split riscv_fill_hwcap() in 3
    https://git.kernel.org/riscv/c/4265b0ec5ee7
  - [v5,09/11] RISC-V: enable extension detection from dedicated properties
    https://git.kernel.org/riscv/c/90700a4fbfaf
  - [v5,10/11] RISC-V: try new extension properties in of_early_processor_hartid()
    https://git.kernel.org/riscv/c/c98f136aedbd
  - [v5,11/11] RISC-V: provide Kconfig & commandline options to control parsing "riscv,isa"
    https://git.kernel.org/riscv/c/496ea826d1e1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
