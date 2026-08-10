Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C71C5B560
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 08:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=snK9ic1Tb1snTaptS8MPwaDC2WPSFJr0ycejC2qQvCA=; b=XXypRUOHuWefabV0P0RarymV/+
	T6Uvor3UcWN7fZZuFMaab6ZMFYrg74OMcKjiLvj00dJWELFmN1Ia/4uR3e+EeKoYeFHg/MTv73DrB
	Kk22m566QUbwsThvGlB3/X6tyno1kptWlvH2mqm6XH5TngVrTVzmTmMriWlDl9ec+vamPL10Z7Oif
	jR59IOF2E5AKhs71iP1tOJDcBIYHowQv8s8X12jr9ninqsJs8Fqjp8VHgYjeUhJ5Kf/Gfa4d4cQUV
	RdsOWSEgxJLlHPkjvxlz/6mqm1lQVvAmOQSPxXSMv5Cs9O+db5/ygi6ezgBbLCGfqoa9kpj8XL6ZB
	C4H/cA/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLDj-0000000BGL8-0spP;
	Mon, 10 Aug 2026 08:18:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLDh-0000000BGK8-31Gc
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 08:18:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1069E60052;
	Mon, 10 Aug 2026 08:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B971F00A3E;
	Mon, 10 Aug 2026 08:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786349932;
	bh=bL5iDnQSLurIbEG5A0MWo7orrQQ3W86EhZH7bR17TfY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=OyR+sTmEd71E8PVLwQUKeBmQm9aeq2HCCypicT/nI1JMqVMkLYFp7QABXVm3xj7g3
	 jvPWYx6464LCo1pOs16cYkprs+HZjNFI3P/1alqzV4p1GVxlLCwMaeg3Y/v55uxtMy
	 uySX2MBayrdywhkZawLaVnokqslXbSVhBgCvaNU6x5YP4c6vFVcCdElxVm1EE04epU
	 v3s1rbwL1SImDYH4pKOLi5uYTltKn1Zb2LaptMDhoB23luLAWb8NH2tAZt8QAFUgKe
	 RsCK0V5mbGF2EhgaAkSQRgQ2hmlm0sRes83f8+lKf5HRQt0wxBs9gP52MLh1+sLex8
	 1Jr3z8ziXD1SA==
Date: Mon, 10 Aug 2026 03:18:51 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Emil Renner Berthing <kernel@esmil.dk>, Linus Walleij <linusw@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bartosz Golaszewski <brgl@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-kernel@vger.kernel.org, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260810063650.239303-10-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-10-changhuang.liang@starfivetech.com>
Message-Id: <178634992239.1015459.10158155030303832333.robh@kernel.org>
Subject: Re: [PATCH v5 09/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys2-pinctrl
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


On Sun, 09 Aug 2026 23:36:38 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-2(sys2) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml | 166 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  39 ++++
>  2 files changed, 205 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.example.dtb: pinctrl@13082000 (starfive,jhb100-sys2-pinctrl): gpio-ranges:2: [32, 5] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.example.dtb: pinctrl@13081000 (starfive,jhb100-sys1-pinctrl): gpio-ranges:1: [8] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260810063650.239303-10-changhuang.liang@starfivetech.com

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
