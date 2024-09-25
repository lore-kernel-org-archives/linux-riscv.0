Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8CFCF9C79
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 14:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ncsB9HLgw5Nfc9vvkkOn6to8uCk+3EBLbQi3vcV3uU0=; b=I9cZXDMz7KX2fsf/pdps9sIenF
	FsUSHtIXrt0dBD3jZbTcFav+UWoBJPQHKSmXSM+lNiTwzuq3DSs0nhv2lN0ezwODm1l9lwu0T0uqO
	mkBhdlrB9YKOVDPbcnZTZluPkUoedPDbLZkZ3h9Uwu5a8JO5DufjPXVXkj2obcgYJkbd/d4XxDwxF
	gZomUupIGM1V3e7/htPTAS3dK7WOMux1ejpHUKyBPzrJoPtL/iSc6x2KIDpG86skGFEkkWQ1Hgm+5
	D9l7Eh1NCW/7ny6pE++I3IAQj8ig3IrvICO4Y9zC5+DdTOnr+SnLnPVzUdTbwYgHn49fDSpQpL67E
	AdQV5xAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stTAa-00000005fwp-3ale;
	Wed, 25 Sep 2024 14:39:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stT8F-00000005fKA-1y7i
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 14:36:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D8AC45C5DFD;
	Wed, 25 Sep 2024 14:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E026DC4CEC3;
	Wed, 25 Sep 2024 14:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727275002;
	bh=JWmdh7A01tfztYB9pqxCAJiTL8p44I/Kc7cDX8hcRIo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=T9FsN7sRoR0szzFVuu9nIQRq0qy8q+DLT0k5B1kV256MTRrEGkDeL9GJ1t4SPDItw
	 dvFjZX2FADcny4kqznGxavW61J/NpL9JIJGdr+6bytLo7Bj1QeCc4zGZpGxfVPaHks
	 ukydyrbMap3O1Tku+e2+o6mtIWGLQK3tbVAmJ5I78dH/wcJEbX1NdIffNitx0qyqui
	 I/ZGtklzTemACkCijfm3tk24Uv58/Q7wEEufVrVPqw4ZYS9jk+FmocYAXEEsE7I14z
	 OnbvDkpiZ7iZPG0ao2W1abiqkSFMiRdLlMMjM4YcnUYiwhC6/JHdkNQu1ONLu/OrFg
	 v/4iAVX/1NTeA==
Date: Wed, 25 Sep 2024 09:36:41 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: yuning.liang@deepcomputing.io, Conor Dooley <conor@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Drew Fustini <drew@beagleboard.org>, 
 Heiko Stuebner <heiko.stuebner@cherry.de>, gregkh@linuxfoundation.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, rafal@milecki.pl, 
 dhs@frame.work, linux-riscv@lists.infradead.org, 
 Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Michael Zhu <michael.zhu@starfivetech.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, huiming.qiu@deepcomputing.io, 
 ams@frame.work
In-Reply-To: <20240925053123.1364574-4-sandie.cao@deepcomputing.io>
References: <20240925053123.1364574-4-sandie.cao@deepcomputing.io>
Message-Id: <172727480703.1213985.11388868881210687280.robh@kernel.org>
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: add framework dts
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_073643_693407_75FFBF3B 
X-CRM114-Status: GOOD (  15.65  )
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


On Wed, 25 Sep 2024 13:31:23 +0800, Sandie Cao wrote:
> Add framework dts to support RISC-V Framework Laptop 13 Mainboard.
> 
> 
> DeepComputing is creating a RISC-V Framework Laptop 13 Mainboard
> powered by a StarFive JH7110 processor.This is a developer-focused
> product, aimed at making tinkering with RISC-V more accessible.
> The Mainboard is under development and we'll share more on functionality,
> compatibility, and availability as the program progresses.
> 
> For this Mainboard, the Model name in Framework is Framework FRANME0000;
> the Model name in DeepComputing is DeepComputing fm7110.
> 
> The board features:
> 
> - JH7110 SoC
> - 8 GiB LPDDR4 DRAM
> - 1x Type-c(PD3.0:60W Max;usb3.2 Gen1;usb2.0;DP1.4:4K@30Hz/2.5K@60Hz)
> - 1x Type-c(PD3.0:60W Max,usb3.2 Gen1;usb2.0)
> - 2x Type-c(usb3.2 Gen1;usb2.0)
> - 1x eMMC slot Support 32G/128G
> - 1x MicroSD slot
> - 1x QSPI Flash
> - 1x PCIe Wi-Fi (Support AMD RZ616 Wi-Fi 6E,Intel Wi-Fi 6E AX210 No vPro)
> 
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  arch/riscv/boot/dts/starfive/Makefile         |  1 +
>  .../boot/dts/starfive/jh7110-framework.dts    | 34 +++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-framework.dts
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


New warnings running 'make CHECK_DTBS=y starfive/jh7110-framework.dtb' for 20240925053123.1364574-4-sandie.cao@deepcomputing.io:

arch/riscv/boot/dts/starfive/jh7110-framework.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
	'deepcomputing,fm7110' is not one of ['beagle,beaglev-starlight-jh7100-r0', 'starfive,visionfive-v1']
	'deepcomputing,fm7110' is not one of ['milkv,mars', 'pine64,star64', 'starfive,visionfive-2-v1.2a', 'starfive,visionfive-2-v1.3b']
	'starfive,jh7100' was expected
	from schema $id: http://devicetree.org/schemas/riscv/starfive.yaml#
arch/riscv/boot/dts/starfive/jh7110-framework.dtb: /: failed to match any schema with compatible: ['deepcomputing,fm7110', 'starfive,jh7110']






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
