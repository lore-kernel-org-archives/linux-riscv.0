Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F75C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Nov 2022 22:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/knI4apx97L7SKoEnhg2pEOjEWLcSb8G2+ZI8jRokk=; b=MVp5XJbBinc0+q
	JS0AGjJRjROOzclIkXF5DXhydECseDw2yqiLP7PAL1X2FZ6w2YkXOY9cSJPTdNRwpaOXL1hGd72A/
	bF52jBJotg0aV0elPAH7Nhp1svA9XoMzCtvj7fc1iRvDtuXUblWTYmTW/LzG9umX4Imo1UZlqmnNT
	cIGQQzwoiECDxyrPWJh2mBUaEOKNGeS0MrNA237darnAiv4bu/qgphgv+kWcmLVXrYziPZQh40uId
	hzQTtx0xyKKG5xC61EIQA5FIXG1LrmiFgES2lVek1TCHDYFSN99vDrAxusgCFgscURr/XxgG4lWgY
	FM5TisIXP4UxKqXCyOmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmvp-000AQx-61; Thu, 17 Nov 2022 22:00:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmvm-000AMp-CS
	for linux-riscv@lists.infradead.org; Thu, 17 Nov 2022 22:00:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 145DDB82210;
	Thu, 17 Nov 2022 22:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2208C433D6;
	Thu, 17 Nov 2022 22:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668722418;
	bh=EQGEv3Nu7IK3z1Y1+oz4Z5dM0RTYZ7IZ6JOUOFqyWpA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PlyUkU2rJlK8veAqTZ/BsmBiuQABXeQ/8jd+06iDO56ADr0q87u3AUFLjFA8KmURw
	 19Gx4WG7VHpf6VPPYkebRU/nllZg3sPVqznmkzMlU22XQuCbSWj+Vt9gR3DO+/a3Ws
	 nco0VDSdOFHXTCmAdmbdGrdRFeGsB3e93zEFRnDV4zPuKSGdw3LsY+wZuitEVdvqEQ
	 3aMB2bhIQiPRGshBp6yDJWpivQ9ieTopLd1QqvxFWiT4aD7JYxt/QXTDVdG5Dc/sSr
	 sdtiKk+Q/l9SlBzfiV3RNrV/RVV36ODgPiQXEFHlx77UE29YeDTZ92q9mI1YzXlaEH
	 J3uRR7nGwlJwQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 93E4CE270D5;
	Thu, 17 Nov 2022 22:00:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] RZ/Five: Enable ADC/CANFD/I2C/OPP/Thermal Zones/TSU
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <166872241859.10037.9436719894893258084.git-patchwork-notify@kernel.org>
Date: Thu, 17 Nov 2022 22:00:18 +0000
References: <20221115105135.1180490-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221115105135.1180490-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lad@ci.codeaurora.org, Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-riscv@lists.infradead.org, geert+renesas@glider.be,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 magnus.damm@gmail.com, conor.dooley@microchip.com,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, biju.das.jz@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_140022_586536_72D213FE 
X-CRM114-Status: UNSURE (   9.91  )
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

On Tue, 15 Nov 2022 10:51:32 +0000 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This patch series aims to enable support for below blocks
> on RZ/Five SoC/SMARC EVK:
> - ADC
> - CANFD
> - I2C
> - OPP
> - Thermal Zones
> - TSU
> 
> [...]

Here is the summary with links:
  - [1/3] riscv: Kconfig: Enable cpufreq kconfig menu
    https://git.kernel.org/riscv/c/effae0e3d9e1
  - [2/3] riscv: dts: renesas: r9a07g043f/rzfive-smarc-som: Enable ADC/OPP/Thermal Zones/TSU
    (no matching commit)
  - [3/3] riscv: dts: renesas: rzfive-smarc: Enable CANFD/I2C
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
