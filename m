Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CC7C5AD4E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 08:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tQ1TRs4Ignhp80DTO1+W/Arf3mKACrzhl6h3qvDb2wY=; b=aVNdBuJ29ozoImGhQStRdGviOu
	BQHJhl8sxT91CJF2UM3nJ09YZyBtxx+PjPqHch5EzSyyOjowqBKmhNWRunuV4TtbeCF/d4095Qs3Q
	ORTzGDItOWjHDFAm7gvYmhAWibCSlldnkr3PRXCSyl80TiYcil1fz/1KYMVe/mBBwhcTiIE1oRO+4
	Jc975t4jpzFfFOgeHAj0Ey79B77AkfoBB8oetcjp4ejbIrfVmTj/eZH+ECWJt32xUBgVmVI94Hqft
	SfNYbRU+ztiz9gH1urSxhiQ6jNH6tD6yXPoERc2g4WPq8Gbwc+hjAGhyaPPrtYUIsIVrQD1h/R+Sm
	cIUvteKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLDm-0000000BGO7-2qq4;
	Mon, 10 Aug 2026 08:18:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLDl-0000000BGMV-0xMW
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 08:18:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC8B144F6C;
	Mon, 10 Aug 2026 08:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884C61F00A3A;
	Mon, 10 Aug 2026 08:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786349936;
	bh=MBOxvzFvzqzYrkTgs+h4l3HsL4fIXNlewyBtSxQMax0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=emvcmeltCBGI/OJ2D0jL+Ak/k1lfbmODttBmGcRSvggj1XbTtZ/uYNpfzork/567i
	 AXypBwenK+4SrVvGqUIMWtgPicJ57WIah7f7PfIwInsCLkvkqYf7uydSCg7hx1dpjD
	 1cZe8J92ITq+Oifn1utuYd0YVuSQZ8891/vQRFjH6q7P7em7pxcHbDZuRSRn+zRgY+
	 XxV9KmWpwfhcM3p3qf6/CYIl4qj4P2OxdZZRhKPIXZh4MEvKNbLeeWXjFZw9PmvSga
	 DBJFrNn61Y9bBxYv0OedtTU2ZvI+hTtCeuUQ3qZ7E5lfKYxMFkVBuTJF3Tot1xg2l1
	 xRadpOc1GTwmw==
Date: Mon, 10 Aug 2026 03:18:55 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, linux-kernel@vger.kernel.org, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 linux-gpio@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260810063650.239303-18-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-18-changhuang.liang@starfivetech.com>
Message-Id: <178634992843.1016409.38224131283215948.robh@kernel.org>
Subject: Re: [PATCH v5 17/21] dt-bindings: pinctrl: Add
 starfive,jhb100-per2pok-pinctrl
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


On Sun, 09 Aug 2026 23:36:46 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2 Power OK
> (per2pok) pinctrl controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../starfive,jhb100-per2pok-pinctrl.yaml      | 162 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  20 +++
>  2 files changed, 182 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.example.dtb: pinctrl@11bc2400 (starfive,jhb100-per2pok-pinctrl): gpio-ranges:1: [18] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260810063650.239303-18-changhuang.liang@starfivetech.com

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
