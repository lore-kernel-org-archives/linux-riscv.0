Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4C4C5AE5D
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 08:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t4zJSYkkI23Aomo4m0PaiTnkSgbMxGCpSDpbQxQeC3M=; b=PP85uQMf31PzDqfLc5kVBgz3em
	Sr5hADfgQY3K3dffK8bB2Rwf0XoIU/tgOrYs6BQMGkg5Oi3hN5UPpUJCc/zj/XvkQfJdDmlAxG+qo
	0FeQzYGZP1fzDS1vkunBPXhxzwrJhhy8QHzVFgpwbZItePrhWgjUC9sGl212m78e1QTw2hgRCBq+V
	E2FMXk5iLW6T1dg10gz/dS0TMR5og4f+v3JQnI3OgK/OtvGq8HauE6N/IrfLbN5PXTKRI/O9QGTSX
	ShBOf8gii0Dn3IHDhRIN6GeTq3z7IjhBDPuz2EfK0bJLF+NIkG02R7HJLY00Hw/KO5lTSNlzlhv0g
	B4kvJlww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLDl-0000000BGN7-2JQ3;
	Mon, 10 Aug 2026 08:18:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLDk-0000000BGM5-2OXC
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 08:18:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 07FDB60254;
	Mon, 10 Aug 2026 08:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8779E1F00A3D;
	Mon, 10 Aug 2026 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786349935;
	bh=voSYQybsySkGQkTw1+t7MCYlEUEMiHXsca6jcPqvV74=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=OeXYeHaXeQpIabWYYARzPOFIwMfEcM6kfw/YVgzmGUbSt9KVf2zesJY4byEcJb7B8
	 GV3HP1zMwWV5+EEA5vmTiaoTxmBsNMIhIWyJxtQ63P+q9kC/DxaR0AqiM0Ocr8QaAl
	 YxWGicDMAADcQAa326XpjT1fKvi1tcAj86dVjoH4lhEuXL9SG2JCjQqXJP9WTAvjmh
	 R53g8gIcMjq3qsBybf8WWfJg9f4N+Ft/yi9o/RZAYMaUsC0OdlgQS2/jLm0UwpOKMJ
	 iW8qAx6oIBN6e8HlxK4U0ZzQE4OHFsNFb02VwO0x0AZTUtB9bd9ya/DGRkSU5PZ27t
	 xUkkK7PUVVmTQ==
Date: Mon, 10 Aug 2026 03:18:54 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-gpio@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 linux-riscv@lists.infradead.org
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260810063650.239303-16-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-16-changhuang.liang@starfivetech.com>
Message-Id: <178634992688.1016154.3852418862095471474.robh@kernel.org>
Subject: Re: [PATCH v5 15/21] dt-bindings: pinctrl: Add
 starfive,jhb100-per2-pinctrl
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


On Sun, 09 Aug 2026 23:36:44 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per2-pinctrl.yaml | 168 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  33 ++++
>  2 files changed, 201 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.example.dtb: pinctrl@11bc2000 (starfive,jhb100-per2-pinctrl): gpio-ranges:1: [31] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260810063650.239303-16-changhuang.liang@starfivetech.com

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
