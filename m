Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0312CD4851
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 13:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ik0gHnuQ0zB7C3VlvDJIONzUrBfKHjw+Cl9Ti20HZg4=; b=Kkk4IiNfMSJebNQ0zaDcicx67L
	3x6S3d9hq+IrsSIwQZPUGdAzmzYBOrT1G8UgC6zLoMrVcOYxvRuVHyzMKWhFlodPo87XCPdJdc4Rj
	zsLfuFXiRvXYjWh5VeC14hdlQ8I5BDvkWIuwHQQR7UMBBRIWwgT7VrnHCoQGQbJuwXI2BVlk9KT9d
	QjYdX6Aqbe4heaEclws+46ucE1GHtqljDarBKkW11AnO3IJEVRFBgNW7Hs+tCATtkPvpUeFE+7xoo
	6OFzGIX+o2oPE+01A6KwhyRej9tibij480UiuvBVbiOfmoUVTwXCwF/daudCGRzGyhelOU7XOj1ie
	dqcsIHNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVwU-00000005ZgZ-07jh;
	Thu, 14 May 2026 13:17:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVwS-00000005Zff-0XVz
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 13:17:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C95860132;
	Thu, 14 May 2026 13:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BEEC2BCB8;
	Thu, 14 May 2026 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778764651;
	bh=GK+pcqSgFJkVn54Slq5nyvwaQWsp/qlPoexNRpOCAOg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Bun2uiHXReT3cQ7hmE4On5Pj6AgD0axSugnB/1bEulhqpU5DEnwxUymmAQhqfOUg0
	 HDxAQoAESbU47r3YR4F8pw2rXCslvM5mRFN08hqvseanirCI2kGd+AA8Io2gK2xFBb
	 CXNLYIvS4uz7O7djvZTWnIGWoDdhjdboQcXZ/1Q4zSgbc7WLlqKL8nMHkQxQviw+M1
	 1qoDxpTl0iEaYnFKa03UR1tOUvBQ+Ft0RB5pZ4x9wKZ/KeZ4h+g3h3MLuG/9WOkwip
	 vdHvfZfBplaL035BR64XA3tRkkmhiihxo22Nh+pMaLRS9O7hUfIMsxythdg09VZo+z
	 mHQR4hblNjFOg==
Date: Thu, 14 May 2026 08:17:29 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Bartosz Golaszewski <brgl@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260514111218.94519-13-changhuang.liang@starfivetech.com>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-13-changhuang.liang@starfivetech.com>
Message-Id: <177876463989.125858.724905267935459432.robh@kernel.org>
Subject: Re: [PATCH v2 12/22] dt-bindings: pinctrl: Add
 starfive,jhb100-per0-pinctrl
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


On Thu, 14 May 2026 04:12:08 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per0-pinctrl.yaml | 176 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  62 ++++++
>  2 files changed, 238 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml:135:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.example.dtb: pinctrl@11a0a000 (starfive,jhb100-per0-pinctrl): gpio-ranges:2: [32, 28] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.example.dtb: pinctrl@13081000 (starfive,jhb100-sys1-pinctrl): gpio-ranges:1: [8] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.example.dtb: pinctrl@13082000 (starfive,jhb100-sys2-pinctrl): gpio-ranges:2: [32, 5] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260514111218.94519-13-changhuang.liang@starfivetech.com

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
