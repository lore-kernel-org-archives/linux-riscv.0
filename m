Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE805CD4F39
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 13:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=U7JGo6dU2lkXXjAD6xRql0B6Dj/c2JgTY9uBFligzv0=; b=MmPhDhts+bBUrwiRPgBIlLoPsw
	awOjYPj/ftm3ogLHMYzVnKvx3xqhMPF2mssPbAMDHUJvSCe+n3A8iQ2TtDUmeG7P6dfz6gqiCiXwO
	EUEQeEn5MyfHlJgj47YszjRKbOm6LP/rqDcgqvwCD3lP4q8We0t3DcE7piUDXZWzV/mf7PIZGQ7xz
	gB8gTJPhJ1AoJcU1so63vvOTZXUdVzhuYN9+uf+loVqAzKuURv22Rey/jWLv5fOhzZAvlpIaFUWeA
	wa5rsL1kAWCqBqf/peiTBRPH0hhLCV/cul7kK95njdcEhhVa9auJYMYCvpGabsEiYbRctk+G5Ri2n
	Kxf3dVEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVwd-00000005Zm6-1be7;
	Thu, 14 May 2026 13:17:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVwa-00000005Zka-35Ey
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 13:17:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74CA74193F;
	Thu, 14 May 2026 13:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E19C4AF09;
	Thu, 14 May 2026 13:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778764660;
	bh=GObrIIIdUQnUTyY00TmCyUaSAxI2d6e1/JLrHcUU5oo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Tm/V4dsuECEiuPujwxpr0b4ong+u+xFx3mj/oEoRR43obSYPCj4wxI0WTwnk6Q4sd
	 Q6Me/s3E7zxJfrBxeOV3bIZhbjtCzG6+5WAFB7quM/zFMGkVQMky6MN2Jt90vLRXhM
	 utREwd6mBBu464GMWmw/czAIrjvXsKF8tVJ9g2qTRuOCkKdW4nSehoDQaORUZZRCL1
	 OrAYCubrLSvCE8Ff3qeCFjGnLnl1zgpTk6z3nc7Kugml6Sk8THqTos/ejlLgjFff7v
	 s3Llt+WBIwglN/I0FDZX/muo2iYI3ocM7qgVtNOValTl4bYjyd0qEw9J/yiw1mV5eM
	 nEAW3qamuGPCg==
Date: Thu, 14 May 2026 08:17:38 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-gpio@vger.kernel.org, 
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260514111218.94519-21-changhuang.liang@starfivetech.com>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-21-changhuang.liang@starfivetech.com>
Message-Id: <177876464652.126062.7793320832597254733.robh@kernel.org>
Subject: Re: [PATCH v2 20/22] dt-bindings: pinctrl: Add
 starfive,jhb100-per3-pinctrl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_061740_813186_1EC01CB3 
X-CRM114-Status: UNSURE (   9.63  )
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


On Thu, 14 May 2026 04:12:16 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-3(per3) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per3-pinctrl.yaml | 173 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
>  2 files changed, 187 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml:135:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml:134:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml:134:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml:135:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/toshiba,tc9563.example.dtb: pcie@0,0 (pci1179,0623): i2c-parent: [[4294967295, 119]] is too short
	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.example.dtb: i2c-mux3 (i2c-demux-pinctrl): i2c-parent:0: [2, 3, 4] is too long
	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,ether.example.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
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
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.example.dtb: pinctrl@13081000 (starfive,jhb100-sys1-pinctrl): gpio-ranges:1: [8] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.example.dtb: pinctrl@11bc2400 (starfive,jhb100-per2pok-pinctrl): gpio-ranges:1: [18] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.example.dtb: pinctrl@13080800 (starfive,jhb100-sys0h-pinctrl): gpio-ranges:1: [12] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.example.dtb: pinctrl@11bc2000 (starfive,jhb100-per2-pinctrl): gpio-ranges:1: [31] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.example.dtb: pinctrl@11c42000 (starfive,jhb100-per3-pinctrl): gpio-ranges:1: [11] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.example.dtb: pinctrl@11a0a000 (starfive,jhb100-per0-pinctrl): gpio-ranges:2: [32, 28] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.example.dtb: pinctrl@11b42000 (starfive,jhb100-per1-pinctrl): gpio-ranges:2: [32, 4] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260514111218.94519-21-changhuang.liang@starfivetech.com

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
