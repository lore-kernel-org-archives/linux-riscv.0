Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01919C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=O+IWxbdZuD6VdUY7potNOkYtuQCZLMc+f44TADGnzAI=; b=lEtM/9NoaR7u/Ry97C94u7em4F
	y1UGubL+bNYpljVJf8Z+z1X0F0jd1HzXW9IXl+qsyu6MCkUk0h9OQAwuilpYwXAZIZqZVeqwT6hy3
	MudwL0sPZ5Ss8KrwxjcDywqZwlxiy9xUnZBr2kcyLL7tCEt5bh7ziSmKAak3Qccc3pv7V/9WkkH8+
	p45zlJW9mMxO8deeogvZMgwm8g0cN8d3pcNf6NBTCrSN+y38H5sjvo8kaEStIsRqQcWurUoED8WF6
	kbMuL+HxICSh+s6ziS85pTLUVfni71tDXXBS273CJPrxztHaAXAP+6LH69KoERelk2+RR/sJumrIT
	jrBrK2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRCnN-00000007kWb-3mFf;
	Tue, 09 Jul 2024 15:30:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRCnM-00000007kVp-1WJ9
	for linux-riscv@bombadil.infradead.org;
	Tue, 09 Jul 2024 15:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=YDLxvM+YkWJ7to/f5LmajBldsa+Th5+t3RT63Dj8HL8=; b=UUf0guV61p95yZ/Lk/F2olJ0HE
	HGO3ssuo8n1KWxdQPqhfdkLlldKansM/F4rrKTocNTBArV8cFPR0PSiYlqZnTBXT4gI1JwTONWGd7
	gtXCr7CCTcM4nrOCJ/jv7iTL5taOixRLSwvqiS2iYvLosculrHDsN5jt0OwCrhW7L9LG+mxsIpwqK
	hukNNO/chGebS3j3b7mZs437HE14BaNuSrrJsbMuO/FEj9spTOrO57xo+wosAK4CrmvgQ8/mpwrGw
	VBHjtf+bxt3imqNalFL42LcxQV57cWe4q06pyI1ZaIabgsDI8yvPRlw8vBYh3vhtNlwJpecEyrUKj
	GO6LGe4w==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRCnI-000000081BE-3ZyI
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 15:30:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7087F61464;
	Tue,  9 Jul 2024 15:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE69AC3277B;
	Tue,  9 Jul 2024 15:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720539011;
	bh=+ZQqls9Ki3eLB72qUlI4VM01dYMXVStw5ak0Hd2lE+M=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=i7AFXYQguJeWjmOqz9Ncvilo/H7LDSdis3d86F0w4rZI+EeJPxk4CNR2fPFxI6DQt
	 E6TVsVGY+Jg0ZbgkUWIxisxs3vxApiAKTu8tBZyJ4HQ1U57IkfHImWKsHkwPyIHnxY
	 4eK4M0qupkxLG9e6jP1KoXwb9ezFoxNwj5aElhzELn4YN/Hc0bo++eKPg2XmNeL4dK
	 DpU8XcM1iwRXblkDKcy5YP1EVgh0J/76imAX3vRGhpxGtHY7qdGHpuEGFna+Scve5D
	 9p1B/fGT/cditH56ZHavrfxnyVKqLCGa9O0ZM/2GOog1lft1YcsR07sBeFL3Ljr6h0
	 WtZwQD/ZPxy2g==
Date: Tue, 09 Jul 2024 09:30:09 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Inochi Amaoto <inochiama@outlook.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
 Chao Wei <chao.wei@sophgo.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Chen Wang <unicorn_wang@outlook.com>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240709-sg2002-v3-0-af779c3d139d@bootlin.com>
References: <20240709-sg2002-v3-0-af779c3d139d@bootlin.com>
Message-Id: <172053886159.3452537.17376675816752046144.robh@kernel.org>
Subject: Re: [PATCH v3 0/5] Add board support for Sipeed LicheeRV Nano
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_163017_126469_B11F33DF 
X-CRM114-Status: GOOD (  13.64  )
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


On Tue, 09 Jul 2024 12:07:15 +0200, Thomas Bonnefille wrote:
> The LicheeRV Nano is a RISC-V SBC based on the Sophgo SG2002 chip. Adds
> minimal device tree files for this board to make it boot to a basic
> shell.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
> Changes in v3:
> - Remove /dts-v1/ directive from sg2002.dtsi file
> - Add disable-wp property to sdhci node to avoid having a write
>   protected SD card
> - Drop changes in cv18xx.dtsi and cv1800b.dtsi
> - Add fallback compatible to cv1800b in SDHCI node of sg2002.dtsi
> - Link to v2: https://lore.kernel.org/r/20240612-sg2002-v2-0-19a585af6846@bootlin.com
> 
> Changes in v2:
> - Add SDHCI support
> - Change device tree name to match the Makefile
> - Add oscillator frequency
> - Add aliases to other UARTs
> - Add aliases to GPIOs
> - Move compatible for SDHCI from common DT to specific DT
> - Link to v1: https://lore.kernel.org/r/20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com
> 
> ---
> Thomas Bonnefille (5):
>       dt-bindings: interrupt-controller: Add SOPHGO SG2002 plic
>       dt-bindings: timer: Add SOPHGO SG2002 clint
>       dt-bindings: riscv: Add Sipeed LicheeRV Nano board compatibles
>       riscv: dts: sophgo: Add initial SG2002 SoC device tree
>       riscv: dts: sophgo: Add LicheeRV Nano board device tree
> 
>  .../interrupt-controller/sifive,plic-1.0.0.yaml    |  1 +
>  .../devicetree/bindings/riscv/sophgo.yaml          |  5 ++
>  .../devicetree/bindings/timer/sifive,clint.yaml    |  1 +
>  arch/riscv/boot/dts/sophgo/Makefile                |  1 +
>  .../boot/dts/sophgo/sg2002-licheerv-nano-b.dts     | 54 ++++++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/sg2002.dtsi             | 32 +++++++++++++
>  6 files changed, 94 insertions(+)
> ---
> base-commit: d20f6b3d747c36889b7ce75ee369182af3decb6b
> change-id: 20240515-sg2002-93dce1d263be
> 
> Best regards,
> --
> Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y sophgo/sg2002-licheerv-nano-b.dtb' for 20240709-sg2002-v3-0-af779c3d139d@bootlin.com:

arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: mmc@4310000: compatible: ['sophgo,sg2002-dwcmshc', 'sophgo,cv1800b-dwcmshc'] is too long
	from schema $id: http://devicetree.org/schemas/mmc/snps,dwcmshc-sdhci.yaml#
arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: mmc@4310000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/snps,dwcmshc-sdhci.yaml#






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
