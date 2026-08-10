Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55663C5AD7B
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 08:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZxD1+U3+3FDKM7ZHmkC6SAyc5EC8uNCt/sL08UT9dKw=; b=xUKkcupJOk9tcVPs97uZVB2n9W
	8ZiLPVLYZNWntXBhqo+dHBSUvYODu7G1bB8BA8CC0SCc+v99bV7R17ggUx0rMn+ZeSCUcvLV+Tnw1
	CsGLxA3Al4Dl0QwZxK52FVX1l4Fb0lWnPgOUPq9oj9fSBGbRbSRlLCUg/iISnQFmUSFtJqdl3oKr7
	RvVQW5AptH/w9DNIIEx01jRXoYW/WBs/EDvp6JzRBdLp1Dqq+4l/LBK2R02D9B0s1NbAkkSuxZsJx
	hN4sdptcAmhaxOdW86m+Umn2UI0jiOLVXYHiwL+XstqO8fYlLd9iKT7AqKZGJu1c3I2zwFE0ZbtiZ
	BOqIeRWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLDg-0000000BGJW-0653;
	Mon, 10 Aug 2026 08:18:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLDf-0000000BGJL-0RXM
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 08:18:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D7A98405D9;
	Mon, 10 Aug 2026 08:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9317F1F00A3A;
	Mon, 10 Aug 2026 08:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786349930;
	bh=t5hQzkM8kqZsALP2IzAn1KYkxb1hxLJQ+U5fl5TA/gA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=Alaw2iRlY3lHayBoBEmQdpBiMhSGkabQnbM8kgL/0SkaXHe7LxcHA60JghV1w1fZy
	 m/6SIuNuKWc3+J+tZidruFuW7gXBYlElFpoSeRgAw22cJcMh9pxCVr5qylGq/lp6HJ
	 2raf8RdKN50nNqyF4E42guVqc3/gb37D9iiOqQvsLRGy3PVFzByIwYzlxDhSrRW7B6
	 B5+TvGsm4sfuUPzuIpTAx8rwmtj6qvfOUaS4WNfwCECXw1PrufC2NHHPjICbDdKIPD
	 7mvSA3HcME+3H4FTQHwdwkWdoSyZsnIdrP9ag51gwVuBtI2oxlFPAxteEFMv8C+ry7
	 z2h4FX5u5cDcQ==
Date: Mon, 10 Aug 2026 03:18:49 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Bartosz Golaszewski <brgl@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260810063650.239303-4-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-4-changhuang.liang@starfivetech.com>
Message-Id: <178634991918.1014951.7989635238440361454.robh@kernel.org>
Subject: Re: [PATCH v5 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
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


On Sun, 09 Aug 2026 23:36:32 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 164 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  17 ++
>  2 files changed, 181 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.example.dtb: pinctrl@13080000 (starfive,jhb100-sys0-pinctrl): gpio-ranges:1: [4] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260810063650.239303-4-changhuang.liang@starfivetech.com

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
