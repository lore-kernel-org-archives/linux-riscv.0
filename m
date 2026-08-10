Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF1DC5AC82
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 08:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=twJVOQM3xIDihqai6Sz3jEW+5f3spX+lRVitncwsQVY=; b=o8iTWaZqyoYypWnrhkh7qETnU0
	PjEF2iwKXF1Pw7MHTLYWFTDwkgBjoIcVtOzYkjJKo987MVeR9ykIuc7JUzsqun5zKvp3F5ocFhoZa
	GNoiav/ngmYZgdiV5XTpDSOUYcW5pQ0lK+NR8sMsYPz62VTzBDs4AEHx2Tk3lwUTdwmu1hbexpWT5
	RROzLj3Wewdkw0/LT/JIOUUq+0WTQXc17GAAdEoY4ncUny+yAzGtXU9uhZP7HbKvajmbiAVTwnj7U
	5AxTRb7lSYrl44OLte36DrmsErSUQKBM23ntQLXBtfYCDYnvxTdjMPJLwQtlrYbkzXW6uWjHBVC85
	WL2oipsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLDm-0000000BGOB-3Iyr;
	Mon, 10 Aug 2026 08:18:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLDm-0000000BGNn-0Qu3
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 08:18:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE05640B0C;
	Mon, 10 Aug 2026 08:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783791F00A3E;
	Mon, 10 Aug 2026 08:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786349937;
	bh=16GdKRirYa/a3qq5+CzoQN7C2wPXdk5VZ3g+Hd884Mo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=MG+cswrLEu4XgsyTn8jcxz0ZuVPEfpy1c6B64fezZcBJedjNy0krGd7nymKyQJCi/
	 URrBlm+AuGuyBxfX1pVA0Qv95MedbWNtE2jpnxyA1tFMpdREVM2hKLIkAsO10K+3iq
	 1XlaEyaMrjoTlBDftOHCFpNN4dwUY1YHuOfEDI9ZiouGLg+qIu0uUEU6RTFzHzKxN5
	 RHxjnl7Ls1HtbAfpUMDfi1ece9lIuC1XzIw2xxtHrSZdno7Zz9BHX3dWiZFOiZ91ot
	 6xO/RyPR++iUmsW7YIylN4mYG1O1v4ucG9d5mmqItL/sPukz/Df1CGwG+2nLBrd/6U
	 QtdamwwBZCS/g==
Date: Mon, 10 Aug 2026 03:18:56 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260810063650.239303-20-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-20-changhuang.liang@starfivetech.com>
Message-Id: <178634992981.1016673.12958798845773014034.robh@kernel.org>
Subject: Re: [PATCH v5 19/21] dt-bindings: pinctrl: Add
 starfive,jhb100-per3-pinctrl
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


On Sun, 09 Aug 2026 23:36:48 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-3(per3) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per3-pinctrl.yaml | 166 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
>  2 files changed, 180 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.example.dtb: pinctrl@11c42000 (starfive,jhb100-per3-pinctrl): gpio-ranges:1: [11] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260810063650.239303-20-changhuang.liang@starfivetech.com

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
