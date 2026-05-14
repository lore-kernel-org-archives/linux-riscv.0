Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1EBCD4F39
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 13:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6n7FjPlymuqrfKeEBKzR3PoTGe5VYj44M+IYKbcIxWA=; b=ErtfsT6/8Gcu4aAP/LvZcXndE1
	dSf63R5i5y9xvhxJskgONbTXCXA/AwqGAXdCzpv6k3l+iNSfwhaok1rMAr45KnuTegmMsHcYuBsb1
	9yWPiINoMQtTyawfY+vGiJoP9yOwkwnBby1uDr/y1xdSg2UQj4W4s+QZOvnik8a6H7tquT7IyxlAt
	5qmEHLbwglVcjxzKq8ANbsDL/wSXg7L/uZn1rYxvjm8cHgEuVHBSydARO7tXEUU8eeuHW78Rr8k0j
	SLgAyU7aYkIdUE9U5ae2VFwmvjq7kECJKZ7bG+lw4ncsanFLEQAFXqemIvoWGO00Iac1wxVKAiGg6
	N1F3GIzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVwR-00000005Zfh-3xPZ;
	Thu, 14 May 2026 13:17:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVwP-00000005ZfD-1wDh
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 13:17:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 190AD43704;
	Thu, 14 May 2026 13:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEED8C2BCB8;
	Thu, 14 May 2026 13:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778764649;
	bh=JabA8iVrRmdRx3/WY9m7cqceq4n9VeeE63bzUTTwXOs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=MJAq4mOoJIhX7kLmBSG9hecTxDHn/mOKyTxgVMNy8oM7G9TUhuMjOxwmeIn5nE9Iy
	 jrwkx4PpFFOBbDrHIfgnbSfKCGQNFHbARL6urn6wX5e6/p1EMEY/DFx20fxZyhF9sd
	 SahDQ30QOieqXcULH2uLqBlN393cszTQ/0gVtNBxAA899tx8x2SwxLyfXVWHGb7AbS
	 CO/02s9604aG1Sk8zncaUCsXiojhvKn8SvPBDglxjOZAe8j3WHwcJ/INppKU3PS7jU
	 /MMOOLWaNP42vI8qpuEtqcTG3zOmfMLcaG/qWBRfwn1E4aAFLyHUyQsD9K9tBOLr3P
	 DBoSy6T/wMNSQ==
Date: Thu, 14 May 2026 08:17:26 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Emil Renner Berthing <kernel@esmil.dk>, Linus Walleij <linusw@kernel.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260514111218.94519-7-changhuang.liang@starfivetech.com>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-7-changhuang.liang@starfivetech.com>
Message-Id: <177876463825.125803.11297264723733467391.robh@kernel.org>
Subject: Re: [PATCH v2 06/22] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0h-pinctrl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_061729_536871_84E684D1 
X-CRM114-Status: UNSURE (   9.19  )
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


On Thu, 14 May 2026 04:12:02 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-0 host(sys0h) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../starfive,jhb100-sys0h-pinctrl.yaml        | 174 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
>  2 files changed, 188 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.example.dtb: pinctrl@13080800 (starfive,jhb100-sys0h-pinctrl): gpio-ranges:1: [12] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.example.dtb: pinctrl@13080000 (starfive,jhb100-sys0-pinctrl): gpio-ranges:1: [4] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260514111218.94519-7-changhuang.liang@starfivetech.com

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
