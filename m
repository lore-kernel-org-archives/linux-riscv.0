Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D26CA0FFE
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Aug 2025 00:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/PI+/e4uV82rUAFKvJ7o8YHI5kmmGq/Eu6XEv1CPYhg=; b=Qs0EfdSrB+9JD0UIAW4RsHtE6w
	6treQZtIj/Ke8irzmXi0a9R4we/ysTGj3wdcn6zYwbM+qBGJw5qoSNBS94Yme4TppEKzTL+csj/QG
	PCKCrlVa5n8u9Nw5xqxc62avPVPcikorqsUz02Y3ru3pjAivsNK2M+JS077bUqoVbJHh2vbAJaWe6
	xxQskXcDT2BsyLhNmeGen4kAs5AhZHIRZGT9odANMwwJPmLboLe2jO0/ywNeDY+lLV6V2edsIjJ7c
	Ao+7JOC92JEJq3qCEQW5Mr6M6yRWbWGYzEhVaIBXHmDWJdLaov1vyTaiQDePCrOfoNsOFjcqHjR6t
	i0E10C5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9iD-000000076Q4-3bZY;
	Sat, 30 Aug 2025 00:44:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us04n-000000061D5-224p;
	Fri, 29 Aug 2025 14:27:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2724545517;
	Fri, 29 Aug 2025 14:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FB7C4CEF9;
	Fri, 29 Aug 2025 14:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756477657;
	bh=wezfen2NyW1g63oJmTankGv6tGgS4A3qTbITYW8tay8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=fEh/s44CthjHB264VbrUi5WgkrsPckj8N6QbxdPs4Q8+RqzXOkjJUyF0YrM/Q/QtT
	 ZQDjqBiReYDgPSa2y0IBNnbB09vlBZ1C38BXIA8SwUMBMhCPsmjpUAB7DrZCrLbLB/
	 8jGKvcmKZS48I7vGCc0ioEqVs0H/DHvNpyY5yvnmQn14pJ8cesXIIS/mVDdBh3+QSu
	 TUZ9wsSJYLIduG/Jl+ThdJI/QiZauUYzG9Cz+qFeIUWqdciXPuF7j7eTTNK3JywMl6
	 1tojvB73Nxwdbio7ugvf04dpVfYI5Skp8t1TGmnfATNZz1caFYi7a+gErGV0ygaYmm
	 C9JQqRXcaj5gQ==
Date: Fri, 29 Aug 2025 09:27:36 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Albert Ou <aou@eecs.berkeley.edu>
To: Lukas Schmid <lukas.schmid@netcube.li>
In-Reply-To: <20250829123800.1232645-1-lukas.schmid@netcube.li>
References: <20250829123800.1232645-1-lukas.schmid@netcube.li>
Message-Id: <175647746592.734566.14945277763815880419.robh@kernel.org>
Subject: Re: [PATCH v6 0/5] Add support for NetCube Systems Nagami SoM and
 its carrier boards
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_072737_562752_DE4E992F 
X-CRM114-Status: GOOD (  23.39  )
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


On Fri, 29 Aug 2025 14:37:53 +0200, Lukas Schmid wrote:
> This series adds support for the NetCube Systems Nagami SoM and its
> associated carrier boards, the Nagami Basic Carrier and the Nagami Keypad
> Carrier.
> 
> Changes in v6:
>   - Add 'usb0-enable-hog' to the som to enable the USB-OTG port by default
>   - Update the keypad carrier dts to match actual board revision
> 
> Changes in v5:
>   - Re-add the non-removable property to the ESP32 interface
>   - Add the mmc-pwrseq node for the ESP32 to initialize the ESP32 correctly
>   - Remove the unused ehci0 and ohci0 nodes from the Keypad Carrier since
>     USB port is peripheral only
> 
> Changes in v4:
>   - Disable the default interfaces on the card-edge but keep the pinctrl
>     definitions for them
>   - Split the pinctrl definitions for the SPI interface into the basic spi
>     pins and the hold/wp pins
>   - Move some mmc0 properties to the Basic Carrier dts
>   - Remove non-removable property from the ESP32 interface
>   - Fix typo in the keypad matrix definition
> 
> Changes in v3:
>   - Add missing dcxo node to the SoM dtsi
>   - Rename the multi-led node
>   - Change dr_mode to "peripheral" for the Keypad Carrier
> 
> Changes in v2:
>  - Squash the binding patches into one patch
>  - Fix formatting of the phy node in the SoM dtsi
>  - Add description on where the phy is located in the SoM dtsi
>  - Fix the phy address in the SoM dtsi
>  - Move the carrier bindings into the same description as enums
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
> Lukas Schmid (5):
>   dt-bindings: arm: sunxi: Add NetCube Systems Nagami SoM and carrier
>     board bindings
>   riscv: dts: allwinner: d1s-t113: Add pinctrl's required by NetCube
>     Systems Nagami SoM
>   ARM: dts: sunxi: add support for NetCube Systems Nagami SoM
>   ARM: dts: sunxi: add support for NetCube Systems Nagami Basic Carrier
>   ARM: dts: sunxi: add support for NetCube Systems Nagami Keypad Carrier
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |   8 +
>  arch/arm/boot/dts/allwinner/Makefile          |   3 +
>  ...n8i-t113s-netcube-nagami-basic-carrier.dts |  67 +++++
>  ...8i-t113s-netcube-nagami-keypad-carrier.dts | 156 +++++++++++
>  .../allwinner/sun8i-t113s-netcube-nagami.dtsi | 249 ++++++++++++++++++
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  48 ++++
>  6 files changed, 531 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-basic-carrier.dts
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dts
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi
> 
> --
> 2.39.5
> 
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250828 (best guess, 2/3 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/allwinner/' for 20250829123800.1232645-1-lukas.schmid@netcube.li:

arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dtb: pinctrl@2000000 (allwinner,sun20i-d1-pinctrl): 'usb0-enable-hog' does not match any of the regexes: '^([rs]-)?(([a-z0-9]{3,}|[a-oq-z][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$', '^pinctrl-[0-9]+$', '^vcc-p[a-ilm]-supply$'
	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun4i-a10-pinctrl.yaml#
arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dtb: /soc/i2c@2502800/keypad@34: failed to match any schema with compatible: ['ti,tca8418']
arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-basic-carrier.dtb: pinctrl@2000000 (allwinner,sun20i-d1-pinctrl): 'usb0-enable-hog' does not match any of the regexes: '^([rs]-)?(([a-z0-9]{3,}|[a-oq-z][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$', '^pinctrl-[0-9]+$', '^vcc-p[a-ilm]-supply$'
	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun4i-a10-pinctrl.yaml#






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
