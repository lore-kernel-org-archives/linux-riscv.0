Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0E2C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vcbVG0aPSLKjytILh174Ty4Unf4kteqsHk+ISyAmCRc=; b=Y7P8Mb9pew8iHm
	6QsjIrVotPEj5LNZF/4yx5EjJdBLQiUy9qUBVZIv9p46QXC+8alRixKujBdyTTwZ1j+pa4cyUULQq
	pHuCGfQIa3O9zU48Sf/z7GD619zGAdic6dS8AtufFcmEEw0BqDZE6smoBLtl//LjY5JHjQt9vruyO
	0b1oLbTyHfX8hvOpRnOJNwOPQmQfNao1JzSgkIlgqHWBX/Qx42icWiFGF8ojSrZpM5p/lvqhkRhQx
	aS9BPhO2zHP65eYqNL0zDioGpu2ETlYzJYaMVdoRaaWLkIaQ9CztxGOoDUZxMvRl3QPOQveRWU6Rn
	j/LsiXfvr1u9IHDrzl0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DCY-00AsKQ-DD; Thu, 08 Dec 2022 09:28:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3CwH-00Afz0-FU; Thu, 08 Dec 2022 09:11:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 329CC61E2E;
	Thu,  8 Dec 2022 09:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AFDDC433C1;
	Thu,  8 Dec 2022 09:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670490691;
	bh=eB4ZBzqRKY2P+/+kH7tim6V7TrIqU7mlpztlV40cPFU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=PHwu2bk4WOCZYFh8XO3jtWg/Pqk7EEQQjg33qH6C+4xAIGzOCLb9mTyZPJNKenFKo
	 22Tz49fpit01wAbYhQoch29pUGvrdFyc56IqREzb/3ZFkO6Ew1hUfM7eljfGv/VKr3
	 BPmKjO/WI8WMSz7locQd3+fD8Xq6Vov/4VvXJGhgjJdEjC/3QZXno3fpgw10qpapE0
	 B+KWpPk2e9BtlSulZzHDCwkokUFo24XuJji5J0V3o9ExtUjINHnyL6X8+PsogYCzZO
	 gHndsRDdhhWB8CMm7/VHXWcENBVU4I36xOXK1Ssifwc1kiHf+B6IOw4jZnJRSk/aCA
	 ua3TxYplb88XA==
Date: Thu, 08 Dec 2022 10:10:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
CC: Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-arm-kernel@lists.infradead.org,
 Andre Przywara <andre.przywara@arm.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Guo Ren <guoren@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_11/12=5D_riscv=3A_Add_the?= =?US-ASCII?Q?_Allwinner_SoC_family_Kconfig_option?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20221208090237.20572-12-samuel@sholland.org>
References: <20221208090237.20572-1-samuel@sholland.org> <20221208090237.20572-12-samuel@sholland.org>
Message-ID: <3480FA50-B88E-4BD9-8E9F-27F231C2BAC6@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_011133_686448_D2930C26 
X-CRM114-Status: GOOD (  12.12  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>

On 8 December 2022 10:02:36 GMT+01:00, Samuel Holland <samuel@sholland.org> wrote:
>Allwinner manufactures the sunxi family of application processors. This
>includes the "sun8i" series of ARMv7 SoCs, the "sun50i" series of ARMv8
>SoCs, and now the "sun20i" series of 64-bit RISC-V SoCs.
>
>The first SoC in the sun20i series is D1, containing a single T-HEAD
>C906 core. D1s is a low-pin-count variant of D1 with co-packaged DRAM.
>
>Most peripherals are shared across the entire chip family. In fact, the
>ARMv7 T113 SoC is pin-compatible and almost entirely register-compatible
>with the D1s.
>
>This means many existing device drivers can be reused. To facilitate
>this reuse, name the symbol ARCH_SUNXI, since that is what the existing
>drivers have as their dependency.
>
>Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>Reviewed-by: Guo Ren <guoren@kernel.org>
>Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>Tested-by: Heiko Stuebner <heiko@sntech.de>
>Signed-off-by: Samuel Holland <samuel@sholland.org>
>---
>
>Changes in v3:
> - ARCH_SUNXI depends on MMU && !XIP_KERNEL
>
>Changes in v2:
> - Sort Kconfig as if we had done s/SOC_/ARCH_/ for future-proofing
>
> arch/riscv/Kconfig.socs | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>
>diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>index 69774bb362d6..f655dea86d69 100644
>--- a/arch/riscv/Kconfig.socs
>+++ b/arch/riscv/Kconfig.socs
>@@ -26,6 +26,16 @@ config SOC_STARFIVE
> 	help
> 	  This enables support for StarFive SoC platform hardware.
> 
>+config ARCH_SUNXI
>+	bool "Allwinner sun20i SoCs"
>+	depends on MMU && !XIP_KERNEL
>+	select ERRATA_THEAD
>+	select SIFIVE_PLIC
>+	select SUN4I_TIMER
>+	help
>+	  This enables support for Allwinner sun20i platform hardware,
>+	  including boards based on the D1 and D1s SoCs.
>+
> config SOC_VIRT
> 	bool "QEMU Virt Machine"
> 	select CLINT_TIMER if RISCV_M_MODE

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
