Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DEBC25B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=r+kW8wT2CrD/R4oyVZeoLpWkS92MXg7jk4OEtmu2r+M=; b=CLT68ZpQdiLtvYmq0UaSJ4BYIY
	gP1gjqSlDZCpBByj5rlxvareKfEcTPzP21WZcjiPdPa2sy9lqvlxkNLTXu1C8rK00EGDiavuq2ZLK
	TVISSWOxLSBZP5jWRjGlLdke6XMQpNLoSQWEMr71IJeXLOpLnBv0baDruHmyX30aDsA9oYZAOO6HB
	CP+y+1v/d0ogG6gxNTTkR779cLjo09XNOVzsGfkQxLZ5QIppWZxw3TPiS/szVDGMoQdT7NTnS2TF5
	8WBWmTmaGDwOQUCJQlLrY6i13ZX7NZlhuWyaIsczAFkgDv/mdqMKu16oB2BOi6PMxhrZDfG1WaxHy
	pzcWLJfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0pY-00000001Zkq-2Og3;
	Tue, 28 May 2024 17:41:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0pU-00000001ZjX-3Yyq
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 17:41:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3ED79622BA;
	Tue, 28 May 2024 17:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CA8C4AF09;
	Tue, 28 May 2024 17:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716918103;
	bh=e+BPjxe3d8PDjUGG2dqqLNc9UzdlT+DF7Tk18em5PEk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=U7OLECoCWbZiaYv+ryxiyHK1n+Y0z/uH3yfXA6PVTjY/g6ij6djKqsjTCe+cffQGY
	 IouzQ5ETeMSItUIxySzKTiQoWxOE16q/nUehVNwRo/P+79uqhLVMKYskfWki4d/02T
	 sTXGXacuSwsWUIT3XIePlA+tTmkNvHyYS6aQOngKWrn7HRzZdzKpnW5zNLpOn1u4SF
	 Hv9Df/Q1zvidvjytHUQl9bRNxl9+i8JfMiJfV1/8/P1UOMV1Q/qhhH5iDa4jqQ7R/9
	 qvo9IfiLXANgo5awACX4faw6ujMh6g94vZYLurtC/FkQuCnBcb39GFoTIRi228+gXs
	 rfVkrxsxBGugw==
Date: Tue, 28 May 2024 12:41:42 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Chao Wei <chao.wei@sophgo.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Inochi Amaoto <inochiama@outlook.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org, 
 Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com>
References: <20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com>
Message-Id: <171691793360.1180650.2832719288980549545.robh@kernel.org>
Subject: Re: [PATCH 0/5] Add board support for Sipeed LicheeRV Nano
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_104145_002032_FCC69F9A 
X-CRM114-Status: GOOD (  13.38  )
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


On Mon, 27 May 2024 12:28:16 +0200, Thomas Bonnefille wrote:
> The LicheeRV Nano is a RISC-V SBC based on the Sophgo SG2002 chip. Adds
> minimal device tree files for this board to make it boot to a basic
> shell.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
> Thomas Bonnefille (5):
>       dt-bindings: interrupt-controller: Add SOPHGO SG2002 plic
>       dt-bindings: timer: Add SOPHGO SG2002 clint
>       dt-bindings: riscv: Add Sipeed LicheeRV Nano board compatibles
>       riscv: dts: sophgo: Add initial SG2002 SoC device tree
>       riscv: dts: sophgo: Add LicheeRV Nano board device tree
> 
>  .../interrupt-controller/sifive,plic-1.0.0.yaml    |  1 +
>  .../devicetree/bindings/riscv/sophgo.yaml          |  4 +++
>  .../devicetree/bindings/timer/sifive,clint.yaml    |  1 +
>  arch/riscv/boot/dts/sophgo/Makefile                |  1 +
>  .../boot/dts/sophgo/sg2002-lichee-rv-nano.dts      | 25 ++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/sg2002.dtsi             | 30 ++++++++++++++++++++++
>  6 files changed, 62 insertions(+)
> ---
> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
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


New warnings running 'make CHECK_DTBS=y sophgo/sg2002-lichee-rv-nano.dtb' for 20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com:

arch/riscv/boot/dts/sophgo/sg2002-lichee-rv-nano.dtb: oscillator: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
