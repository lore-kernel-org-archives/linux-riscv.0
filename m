Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E435CD4F39
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 13:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dzpbf+sRaOwf0bW2WwijMmYyrRdbThEy4Yc0t0QLUHA=; b=s3p9KZjvtfJJsVC2bPFC6tPe+q
	6uek88XBYM7ujkD3A5xauw9oJS0oonGS1K66do3Ht4YXqDYESU/a1ZwB5Q0k/w8a5GmFz9fC8pQGq
	xmeFr08H9F7jCA3Zhb2s4d+G3yqoXLLZBKlgjik2Eyn3qV7O5N7KJ2XrpKpiz4gTQ1YHqvgpSiN6i
	4WpUR8PBeeROroRB3yFfJuPLN/8p34LOd8ebyZ0v3j4TFWUzuya0yDcmKAYLbJZl67iPgcBLltPk0
	RXighgmJMJPluqpLXuU/qkpx0SHay/zBYeX/D1On65lA1UmgI13RpSjafrC8uAjfklFRkkWpykHcD
	GuDD1CKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVwb-00000005Zl3-1GDS;
	Thu, 14 May 2026 13:17:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVwY-00000005Zj4-2Rn0
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 13:17:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5020B4457D;
	Thu, 14 May 2026 13:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF224C2BCC7;
	Thu, 14 May 2026 13:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778764658;
	bh=OC8z690m0OzKSQjT1K52LTD9GBysSPVj4NfaluAtEFs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Th+TJHNVAUNAdpxHQUsef2I8qODWyMO+DgFOvJYbyrlSOb6SqGL5FSjGFI56oHZ0X
	 xUsQeLLQH1horXT7v/pQk+Upo/DfwaDQGsf7kyLzkWMNqJnfwTh/WkdNBHulf5GTMH
	 BwzyslXMTloQNe6HSCJvW1Jhz++D5Bkt49USNAU1a4VHkc9U1Iq/ytWT8KsVGBzN1x
	 dMU+L74LQAeBR2UoCjaN0SuG2XdziUlL7VsqusEukeJKv1fccYytkoS7aRSAyxLTwQ
	 oe3Vne4FSau45b4qk8hpr7e4da403vgZoCxcMYPqu42e1qOU8jg+VjfRzUluRHd0FQ
	 Ym5a5MJmfUO4Q==
Date: Thu, 14 May 2026 08:17:36 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
 Paul Walmsley <pjw@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260514111218.94519-11-changhuang.liang@starfivetech.com>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-11-changhuang.liang@starfivetech.com>
Message-Id: <177876464483.126011.3347880775140957613.robh@kernel.org>
Subject: Re: [PATCH v2 10/22] dt-bindings: pinctrl: Add
 starfive,jhb100-sys2-pinctrl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_061738_668237_B72B6488 
X-CRM114-Status: UNSURE (   9.70  )
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


On Thu, 14 May 2026 04:12:06 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-2(sys2) pinctrl
> controller.
> 
> System-2 domain also supports configuring the pin group voltage.
> Add relevant definitions for power-source configuration.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml | 173 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  44 +++++
>  2 files changed, 217 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml:135:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/toshiba,tc9563.example.dtb: pcie@0,0 (pci1179,0623): i2c-parent: [[4294967295, 119]] is too short
	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.example.dtb: i2c-mux3 (i2c-demux-pinctrl): i2c-parent:0: [2, 3, 4] is too long
	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,ether.example.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.example.dtb: pinctrl@13081000 (starfive,jhb100-sys1-pinctrl): gpio-ranges:1: [8] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.example.dtb: pinctrl@13080800 (starfive,jhb100-sys0h-pinctrl): gpio-ranges:1: [12] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.example.dtb: pinctrl@13080000 (starfive,jhb100-sys0-pinctrl): gpio-ranges:1: [4] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.example.dtb: dwc3@2680000 (ti,keystone-dwc3): usb@2690000:usb-phy:0: [4294967295, 4294967295] is too long
	from schema $id: http://devicetree.org/schemas/usb/ti,keystone-dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.example.dtb: dwc3@2680000 (ti,keystone-dwc3): usb@2690000: Unevaluated properties are not allowed ('usb-phy' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/ti,keystone-dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.example.dtb: usb@2690000 (snps,dwc3): usb-phy:0: [4294967295, 4294967295] is too long
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.example.dtb: usb@2690000 (snps,dwc3): Unevaluated properties are not allowed ('usb-phy' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/snps,dwc3.example.dtb: usb@4a030000 (snps,dwc3): usb-phy:0: [4294967295, 4294967295] is too long
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/snps,dwc3.example.dtb: usb@4a030000 (snps,dwc3): Unevaluated properties are not allowed ('snps,incr-burst-type-adjustment', 'usb-phy' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/usb-drd.example.dtb: usb@4a030000 (snps,dwc3): usb-phy:0: [4294967295, 4294967295] is too long
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/usb-drd.example.dtb: usb@4a030000 (snps,dwc3): Unevaluated properties are not allowed ('adp-disable', 'dr_mode', 'maximum-speed', 'otg-rev', 'phy_type', 'usb-phy' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.example.dtb: pinctrl@13082000 (starfive,jhb100-sys2-pinctrl): gpio-ranges:2: [32, 5] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260514111218.94519-11-changhuang.liang@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
