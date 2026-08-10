Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94825C5AC82
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 08:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sKnb1kp9TY2lvulwm7w3u1L+4I50B3KBQlXhxq4AiMY=; b=ZzazPclN6pAhPorCZGu6rgmat7
	32MR3eY3M7zMV5+QynWeAe8C57rOcPAmpjrstw0d9Vk7y5N1TjZ2Chsx49F7viRlFQ3m8fGPoiutz
	7tR7+62Yu8aI8ybJriRJv7oEUZNAr7TUCx3Q3CJJeH8O9+57KWAaFJxhUFCpdDQCv23vOoKIwA2xH
	uWSheZgErtYeSGmGRRJ1Q+AAzYQqHjOFwITnuMFI8fLnagMlGsvf9bVrKm7RxEamZK/GFPLHvbFFC
	J4THOGubwZcyvPgli4Z3SiuN4B/Qi5Mb+B/mC5C3IFXFP2GHktDMEDIt/A6eHpTdCRLJTeH3eR5q8
	LGxOc6XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLDi-0000000BGKI-0SW9;
	Mon, 10 Aug 2026 08:18:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLDg-0000000BGJa-2zEE
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 08:18:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1136F600AB;
	Mon, 10 Aug 2026 08:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9434A1F00A3D;
	Mon, 10 Aug 2026 08:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786349931;
	bh=zsbvzpOdwPJ1RyoVXPhUIn0xSG6eiE3sItoM/JvSSG0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=JMLKkpzAzuT54dnA6mBpO+ii1Yt7MtSNVbgtaQz/dEp/zRlxFNxXuYMo6lqDYycJy
	 Mwxy+21MTyRXLXyA+fBUXijvMC3wxahx2TSZYn8BsOkV8FIhsqWOmACikPb37F8m6P
	 5yp1POk64hD22+QCelSPCaRZetdg7kufQqsp0fKvFFgZ7uhB/6tAxGP5FoxXIG0fq6
	 NAn/N4px1d/1k6sAQE35dM5jd0t9coBtwTUP+QXNmUbzc9CA2NNVmDDBneMTcIVjAW
	 Fbz05DN05UtAj5r6gjB2F7k2MW5eSvxhNA9X1SBjLI0oc0dZ/kqmDiOjvu7KKk5M3e
	 Pl1wQK/n6wYqg==
Date: Mon, 10 Aug 2026 03:18:50 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Paul Walmsley <pjw@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org, 
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Bartosz Golaszewski <brgl@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260810063650.239303-6-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-6-changhuang.liang@starfivetech.com>
Message-Id: <178634992084.1015192.2135350891770274269.robh@kernel.org>
Subject: Re: [PATCH v5 05/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0h-pinctrl
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


On Sun, 09 Aug 2026 23:36:34 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-0 host(sys0h) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../starfive,jhb100-sys0h-pinctrl.yaml        | 162 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
>  2 files changed, 176 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.example.dtb: pinctrl@13080800 (starfive,jhb100-sys0h-pinctrl): gpio-ranges:1: [12] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260810063650.239303-6-changhuang.liang@starfivetech.com

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
