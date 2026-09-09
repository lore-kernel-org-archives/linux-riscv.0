Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2ABDC79FAD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 12:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DNoM7/Lit9J3NnjyPkqSV2GdSIQMyU0R9zn4lWoCvI4=; b=pXvU+55KdIgzQC
	kZmMzn3H+nX8DzXA0t9Nd1tQYalg9rU9iqjHRoDfm9LJChosxY15lM9fGYS/dpyraQaIPT3zaOzOt
	gGwnH8yb4kI49Qa9wo2r8n3N2gNcEjSBXcppEyjO9ifm4yFBqZX2ZhuPNAwEcEMH/BZWOonkijfCi
	dHTgo7DzKdZ1tsihiZ+fDLRf4uhmBj5RuTerIkyjb1zXWBbbrXECPdk1Z4kitocCPgToN/SNwoaPU
	gzzH6MMwZtBCPEGAFI6yVUcTLddJREcVdkZxzjNVcAq2aLIc4yVrP0dbeQkPi/vv6vXAdudpvzvQe
	d7APBGz8lMTNj4QXftJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Hc2-0000000BgcE-2QLu;
	Wed, 09 Sep 2026 12:41:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Hbz-0000000Bgbs-3nnN
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 12:41:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 59BDD60211;
	Wed,  9 Sep 2026 12:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66621F00A3A;
	Wed,  9 Sep 2026 12:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788957671;
	bh=eea7Tw/rKYWMs597FSDSjSw6xQI7sFewc43KlItmITs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QFQ/xCjJcZHynRxe3uihPCU1hGFQdaAEFbcn76EkIFlJFA8kVhhyoWdulJjY3IoFE
	 xZ4jj/w7RbuvRbZLBkFw0/mRHkJXAoiuxVe/xDqE9KK4IN01NEotAbMFZKy4KAPAB0
	 jrWnZrkPepUsSCHaSlHPheHmMPyGRQxX+uWchWNhcqjIT5IxekaSGKsfjUomRw3dFl
	 24iGdCIz2T/Bs262dY6zyqolUxRwwzr0ocGqL/V5csNNCKucosPq0Ql8v2FVkYoa7x
	 Z6OQaM2oFcFgEV7My2j5vrVyF5BPEaf5nR3i7tXqyoIbdlS/zcnBUa/ZG76gRBWBqn
	 ozsJ5pYXnPSWQ==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Frank Li <Frank.Li@kernel.org>, Jia Wang <wangjia@ultrarisc.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dmaengine@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
References: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
Subject: Re: (subset) [PATCH v2 00/10] riscv: Add device tree support for
 UltraRISC DP1000
Message-Id: <178895766221.2174329.15770056766507822412.b4-ty@kernel.org>
Date: Wed, 09 Sep 2026 18:11:02 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.3
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


On Mon, 07 Sep 2026 17:54:39 +0800, Jia Wang wrote:
> Add Devicetree support for the UltraRISC DP1000 RISC-V SoC and two
> DP1000-based motherboards: Shenzhen Rongda M0 and Milk-V Titan.
> 
> DP1000 integrates eight UltraRISC CP100 CPU cores.  The SoC description
> includes the CPU and cache topology, CLINT, PLIC, clock controller,
> pinctrl, GPIO, four UARTs, two SPI controllers, four I2C controllers,
> three PCIe root complexes, GMAC, and the DMA controller.
> 
> [...]

Applied, thanks!

[07/10] dt-bindings: dma: snps,dw-axi-dmac: Add UltraRISC DP1000 compatible
        commit: 09149a59a6aef7853a3750e4b303f20637cf7a8a

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
