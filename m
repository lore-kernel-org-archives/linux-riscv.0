Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299E6C54E6A
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 12:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=boZ44zH9d5GdXQsPXG4u/Z1XRXyyu/v9jVZoWbHx2Ok=; b=l2/1hdcrhjFXDc
	JDp2t9naawjDBHnjfSfBYAxxUOTk3uAoYxmKRTFpwafOGgbk1rExoHGSYpe8LETV0RVSWOqF192fJ
	lPTYI08cat8RJutBjNFiMbfiuLeKaYqowuYv/hLLVeC9OFJoEUdDqp6/7q0VBETx5CN7o10zcnJCw
	ilpOqLn2DxbmQk6QkuKWvSvJse31G50oM+Vu8sqnG8DnDuzGxi6eOqrZLD+ozeqgt0XN5QcK7l0vz
	n6fexp8liSPqIL//ZTzp1Y3a8E0OsdItVQKgALXXKP5lKc37cEzPALxRX57fqnjRxd6kg70nxDjQ8
	KdOyahcmhMm30hElMdvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkkEO-0000000EFlA-3nDQ;
	Thu, 14 Mar 2024 12:30:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkkED-0000000EFeK-3rvw;
	Thu, 14 Mar 2024 12:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69EAD61546;
	Thu, 14 Mar 2024 12:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0781EC433A6;
	Thu, 14 Mar 2024 12:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710419432;
	bh=CrTSWvnI80HBCf2z8Oy2nHbmglsJV2g15ydY/Fnd+/0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oG+C/r13TmKdzhAlJcO0u+vL0vp9yOVmJ0g/oiKWmipU+n6rJquFJCWqrNOQSQ2k4
	 ccIcGlpXIeboz94YUQO3bvjZFHoQJ6QV7wUhmBeJTFg5AWNmPZJYvIZIrJsFwFY2of
	 OIDxH2h1iJBf+ExBpnRAcKnFNtoX8rVXNSVgbDEoVlaoUHKsiFD1FrD6Tj7O9vsH/i
	 bk0FxwUKy6ccBHLapb0AVzUUOBDcALyYpl6oV9SH4llTH7PkbUQmxG8XfVK3qfK+BC
	 mJ2zLPRrgeNtsRC/QnH5pih+YJGWb/AwwBnL8wrVtonOOJpKYURuS/S2mY0VJCAJFt
	 54/cvGAWu8vMw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E921DD95055;
	Thu, 14 Mar 2024 12:30:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v9 00/10] Support Andes PMU extension
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171041943194.26728.3807889559884607630.git-patchwork-notify@kernel.org>
Date: Thu, 14 Mar 2024 12:30:31 +0000
References: <20240222083946.3977135-1-peterlin@andestech.com>
In-Reply-To: <20240222083946.3977135-1-peterlin@andestech.com>
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_053035_117351_6998204D 
X-CRM114-Status: UNSURE (   8.64  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, unicorn_wang@outlook.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, jszhang@kernel.org, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org, wefu@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 22 Feb 2024 16:39:36 +0800 you wrote:
> Hi All,
> 
> This patch series introduces the Andes PMU extension, which serves the
> same purpose as Sscofpmf and Smcntrpmf. Its non-standard local interrupt
> is assigned to bit 18 in the custom S-mode local interrupt enable and
> pending registers (slie/slip), while the interrupt cause is (256 + 18).
> 
> [...]

Here is the summary with links:
  - [v9,01/10] riscv: errata: Rename defines for Andes
    https://git.kernel.org/riscv/c/be5e8872b3fb
  - [v9,02/10] irqchip/riscv-intc: Allow large non-standard interrupt number
    https://git.kernel.org/riscv/c/96303bcb401c
  - [v9,03/10] irqchip/riscv-intc: Introduce Andes hart-level interrupt controller
    https://git.kernel.org/riscv/c/f4cc33e78ba8
  - [v9,04/10] dt-bindings: riscv: Add Andes interrupt controller compatible string
    https://git.kernel.org/riscv/c/b88727d554f0
  - [v9,05/10] riscv: dts: renesas: r9a07g043f: Update compatible string to use Andes INTC
    https://git.kernel.org/riscv/c/95113bb70515
  - [v9,06/10] perf: RISC-V: Eliminate redundant interrupt enable/disable operations
    https://git.kernel.org/riscv/c/ea0e0178e101
  - [v9,07/10] perf: RISC-V: Introduce Andes PMU to support perf event sampling
    https://git.kernel.org/riscv/c/bc969d6cc96a
  - [v9,08/10] dt-bindings: riscv: Add Andes PMU extension description
    https://git.kernel.org/riscv/c/61609bf2b29d
  - [v9,09/10] riscv: dts: renesas: Add Andes PMU extension for r9a07g043f
    https://git.kernel.org/riscv/c/270fc77e7b0e
  - [v9,10/10] riscv: andes: Support specifying symbolic firmware and hardware raw events
    https://git.kernel.org/riscv/c/f5102e31c209

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
