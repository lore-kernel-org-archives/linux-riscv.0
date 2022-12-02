Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01634C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 19:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5e3VEel8haDLtqjDJCmHirFh/525UDuJqIHRi84rsbU=; b=WLrT8hjmZoiu7p
	FddFix0TRlzlYCz3HYJqHsd8V8uUtxo+VzUljrtIeLamiBO56YRtMT81dc+MiMQC+lkAuhHLuyqmL
	ynmZNE8c9NyqKmVTlItGm1TFXKTY/rJ62uJdzb2ZRwdzpF/j+k7Ws5YrTT7U8Sa3FzDuv0ddn7hEk
	7cr68fuATX8YEV6tY9q5km4IsuruTo2ORQ8PcaG5q8qOg8kMe9QfTrRCqbEJdRWxZlWuW6S3pEU6G
	HJjw4X9lKUo/YnyT353uAxofyuqAcgPx0MCb27fViP+lKyQvx+aC8heK3/5VrNQg9n17cA+XYGkA2
	AaGzH5ljGdRLhISBX1mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1BGs-000qCi-LX; Fri, 02 Dec 2022 19:00:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1BGm-000q9r-G6
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 19:00:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CADB1B82237;
	Fri,  2 Dec 2022 19:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67320C433B5;
	Fri,  2 Dec 2022 19:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670007617;
	bh=If0m8v1brmMDcVp3BHUNVEs197Sy9gAdV8ES1Njbxbs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rJh7egSiMtfUfFIs91xYk+l3hKxnd1GXELQk1R9dC1GQQphG4vVtfKCcCUQr2+kN1
	 dMgZ5UmA+bZ/XyK+5Q51yIuBxfG72EcOkwyRR8aY3611VZQW9T8PAvrTGsZcDr/+Um
	 E/Wc025NTyytX6J++VFok3M54wX7UE9+WYrU6K5TEPPtqWuSASJFhRvGvdYf3fEOoT
	 uDWwI4SBJxOUK0tiAmJzi0MIT0egfjjAAknm84lswIhVoVJSD8/1fllCa6SXvMBp9Y
	 NocHDIKg4f1kFtMU7wz9IlasEga19MqPrQK3C+dU6oYsXVbsaYegNZuoAlyMMSz4KR
	 tSTGVE4GGTH4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 480C2E21EEF;
	Fri,  2 Dec 2022 19:00:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/8] Basic device tree support for StarFive JH7110 RISC-V
 SoC
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167000761729.13669.16471163583440376052.git-patchwork-notify@kernel.org>
Date: Fri, 02 Dec 2022 19:00:17 +0000
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
In-Reply-To: <20221118011714.70877-1-hal.feng@starfivetech.com>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 conor@kernel.org, palmer@dabbelt.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, ben.dooks@sifive.com, tglx@linutronix.de,
 maz@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
 p.zabel@pengutronix.de, linus.walleij@linaro.org,
 emil.renner.berthing@canonical.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_110020_757964_7CCAB569 
X-CRM114-Status: GOOD (  12.38  )
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

On Fri, 18 Nov 2022 09:17:06 +0800 you wrote:
> The original patch series "Basic StarFive JH7110 RISC-V SoC support" [1]
> is split into 3 patch series. They respectively add basic clock&reset,
> pinctrl and device tree support for StarFive JH7110 SoC. These patch
> series are independent, but the Visionfive2 board can boot up successfully
> only if all these patches series applied. This one adds basic device
> tree support. This patch series is pulled out from the patch 1~6 and
> patch 27~30 of v1 [1]. You can simply get or review the patches at the
> link [2].
> 
> [...]

Here is the summary with links:
  - [v2,1/8] dt-bindings: riscv: Add StarFive JH7110 SoC and VisionFive2 board
    (no matching commit)
  - [v2,2/8] dt-bindings: timer: Add StarFive JH7110 clint
    (no matching commit)
  - [v2,3/8] dt-bindings: interrupt-controller: Add StarFive JH7110 plic
    (no matching commit)
  - [v2,4/8] dt-bindings: sifive,ccache0: Support StarFive JH7110 SoC
    (no matching commit)
  - [v2,5/8] soc: sifive: ccache: Add StarFive JH7110 support
    (no matching commit)
  - [v2,6/8] riscv: dts: starfive: Add initial StarFive JH7110 device tree
    (no matching commit)
  - [v2,7/8] riscv: dts: starfive: Add StarFive JH7110 VisionFive2 board device tree
    (no matching commit)
  - [v2,8/8] RISC-V: defconfig: Enable CONFIG_SERIAL_8250_DW
    https://git.kernel.org/riscv/c/6925ba3d9b8c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
