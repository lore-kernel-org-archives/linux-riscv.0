Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC5EC5AD4E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 08:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cNNpJdGD4mxGmhcMgmr6u33D1Y8l8OhwQA/W+S522zo=; b=CVF9E9K3q/UFfhaiy5QY1lhCRa
	37/G7wxfg4iiwCE9ay6ZahA5DI7/FKdPTdts4svX47W2SVliH2ZHqnwEmjgRVcpFa3P6UhFIu3t/Z
	Zip6lmDRqaAQz1BRU/yymROPwsQKMBmdDHgiiOj9gZWaYPno1zGmlTyLYLwvWJ8UlinY6yZfaU6yg
	GzlZnnGQkcLv2dIbrh9xiaLMTtyIWgVUKz+kuglieW8ExcfTAfeu6foJ0hD1iM83w6Neu+HNATUAk
	QBWgYdB6WeonTx78D9RDFOd/v8uitg3s8XC4Dbg52FMprp+8Da+F1GRQMu5RoNXHIV0ovvf/2gra0
	uqzvkU/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLDj-0000000BGLK-1M2i;
	Mon, 10 Aug 2026 08:18:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLDi-0000000BGKL-2MNr
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 08:18:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 04405600BC;
	Mon, 10 Aug 2026 08:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865CE1F00A3F;
	Mon, 10 Aug 2026 08:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786349933;
	bh=w5TmhqduLxJhLY/20/Yh3esA5TuvEJmnXf0uqG3F2/I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=CTrUaKY3MKo3xIPliZwE11ufzUhs2ZhUdIi9Hhg5+n2rRAAqOSQ88gD/Que44NI0M
	 +MB4IciVoyFYTTmg0mZLlp2PisWRkI6vvcH2EOKh+LMivgFVANiX8Nb6Jc6R+voHex
	 l3TXkbboXzPT1TyAfLx5z0bv1NW0dfddzObna9E2502yaWob+JdNjQfgJDkvSYeBS0
	 xfHTgY3Soy0BjTcdHw1ZBYkztTaQK++6mc2pYHo7lIyp9TuVfyv4D1Y8kWb0lY8hXV
	 ir3Ah4o9CNOvcc/gdADL6X6g1f44QaCw+RuqjI+sf8F/c3tG0WC50eQv3A3sHDfDpC
	 AOc8pWlcpXoKw==
Date: Mon, 10 Aug 2026 03:18:52 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260810063650.239303-12-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-12-changhuang.liang@starfivetech.com>
Message-Id: <178634992385.1015685.8678439562395483337.robh@kernel.org>
Subject: Re: [PATCH v5 11/21] dt-bindings: pinctrl: Add
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


On Sun, 09 Aug 2026 23:36:40 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per0-pinctrl.yaml | 180 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  62 ++++++
>  2 files changed, 242 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.example.dtb: pinctrl@11a0a000 (starfive,jhb100-per0-pinctrl): gpio-ranges:2: [32, 28] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260810063650.239303-12-changhuang.liang@starfivetech.com

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
