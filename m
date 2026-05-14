Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17ADDCD4851
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 13:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+z91g1Qm8MZxcJaIIKCroxoGuq3FhOwUTPI59aNQFXs=; b=Lk4OK9zX2olouzK3RszwkcCLX0
	+Os9niW7edisn8C2C9Gy/U6HIH2W04XY6viK12fG6Wh/4c7RsBbD+aMZFtOkX1He4PrjjSeH1maQg
	71cPzMZN0XfOd+0hA1S1Lyg4mxr9yAZ6MNjvZlIwyy7mMuLopfI1kdwNCCn4Ul/Ck93X4uEjCAPVO
	85VocnL2/qfeXl9PWm+DZxsqhYekDEhA54DF5zRXdB5Eyb0gHZYb8t0Eo1cWbs9TBjQyk7zMMpC3Y
	u+KUJ988fR8fbJ4XLE52uXV5CfVOZCFa+O//jkRm6e/vK1SKpv5R8sFtGRD+nGf1aZrT8ojLT5TnM
	S0bDfUPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVwZ-00000005Zjn-0tij;
	Thu, 14 May 2026 13:17:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVwW-00000005ZhQ-1X2r
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 13:17:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A7FD4458F;
	Thu, 14 May 2026 13:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DBFC2BCB8;
	Thu, 14 May 2026 13:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778764656;
	bh=OZd9t7xxIbOqEzwQ69KCLTtN+MSPuLLUOwMETkKoynY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eB/mAagInUXV0Y+nQ0wuTyxsAjHLqgSecgy/AM9EtPtEjXHxPAj+eH7b5gRi2ApRX
	 QxEXWhp25zjFGUbAuP441PS75/JWpIDZu9INYci1sOjRB6ZD7VRDW3po+qPiSGunaW
	 E64NFjx7oPjsb8Us3YR3/NEqzzvWjjwhwckIa98DZqO5ayePqUjq9zwbK3Cp2Ek4Zy
	 c/nd+KpvsmlwLmx4TcauI2rWsNVbaC7Pde7VfkBdFQrOenQAxV3WTQYEqkZdcxNIyE
	 TTXK1wwayzNXHXz6iZxfpB66A3dYYRw0SqihoMoCXOpSr2v8mbMQNq2ulCA2VFEOEP
	 TOcLpQwF4Nk1Q==
Date: Thu, 14 May 2026 08:17:33 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260514111218.94519-19-changhuang.liang@starfivetech.com>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-19-changhuang.liang@starfivetech.com>
Message-Id: <177876464318.125951.10267446970822310753.robh@kernel.org>
Subject: Re: [PATCH v2 18/22] dt-bindings: pinctrl: Add
 starfive,jhb100-per2pok-pinctrl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_061736_443983_C4EBBEA6 
X-CRM114-Status: UNSURE (   8.81  )
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


On Thu, 14 May 2026 04:12:14 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2 Power OK
> (per2pok) pinctrl controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../starfive,jhb100-per2pok-pinctrl.yaml      | 173 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  20 ++
>  2 files changed, 193 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml:134:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.example.dtb: pinctrl@11bc2000 (starfive,jhb100-per2-pinctrl): gpio-ranges:1: [31] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.example.dtb: pinctrl@11bc2400 (starfive,jhb100-per2pok-pinctrl): gpio-ranges:1: [18] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260514111218.94519-19-changhuang.liang@starfivetech.com

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
