Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719B7CF9C72
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mA694F63z/iGyPSSmFzaHMhfCzoPoYanrwbvHMQDd+Q=; b=H8uuYQuQKcp6gmlk/nbldA13sG
	x6fp0qkIiPLlTCFORx3G1R3payOJ44yfurvtzzJyiEQQyzBfOdpklK73hSveK2Fg+jzjJFL3Yw6Tw
	AOERhnHuwTwztPYX/d6u0BDt2xTZWA1nxmBnIAyONZGIWeMzrtIGgWtgBHSM19SEG2yVGl5ZaXwlL
	PZEb5ufuFvMN5hLA5D7EG1FS5lF8R6kWqpb87MEGMg8C7bbbOsUwd9V5IIEF+oQ5kWV1yplmclREd
	bhK4Mb5iAyje2xcTDDR/2iYfV6u4prcRwZbUGhSLFN17aHlC4b4m1n8NT/815FsmgX4FC/J0eAauc
	MbpvYOvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st9qb-00000002zr8-00Kw;
	Tue, 24 Sep 2024 18:01:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st9qW-00000002zq1-1u3M
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 18:01:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0C045A437F3;
	Tue, 24 Sep 2024 18:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A3FC4CEC4;
	Tue, 24 Sep 2024 18:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727200866;
	bh=vE8pGVYwDVIrlIjKoF6T0212mB8n6SPYkRCwr61rAUw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=aAqnMEyEu0uCAmz3kn+7IUO3/RB2QOyeS8oYiE9bDkCZXnPdlkSCkZxg53/BA8NXm
	 9iI/dz08QotnMxwXZY53r0cEaGM3YM/FX1UQmPw0A0yQjOWL7InId3K4E2Kz+cLfil
	 Zae2E9R+y0ofIaIoU3xQPPgxCvTOQJ1TGYP8YBCjp2SGn/8we61MDb70v7KqJW6v0h
	 5012T6eLvZ3ZgjKXNyCVjCEpGAYqkEOSWHZuqtirKTDf6Hm8Y7PNO3UJsIqKyBPc9W
	 jTzOKtSstllbY5a7lhpC2Jv5v4v9UFtEKJwcnrI4JDo17ek7KkPsJJ2PI7UosP0fho
	 CIO2/qMpUxs9Q==
Date: Tue, 24 Sep 2024 13:01:05 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: "David S . Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 William Qiu <william.qiu@starfivetech.com>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, linux-can@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20240922145151.130999-3-hal.feng@starfivetech.com>
References: <20240922145151.130999-1-hal.feng@starfivetech.com>
 <20240922145151.130999-3-hal.feng@starfivetech.com>
Message-Id: <172720086189.2892.16772874968651869906.robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: can: Add CAST CAN Bus Controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_110108_581523_B5D056A4 
X-CRM114-Status: GOOD (  10.20  )
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


On Sun, 22 Sep 2024 22:51:48 +0800, Hal Feng wrote:
> From: William Qiu <william.qiu@starfivetech.com>
> 
> Add bindings for CAST CAN Bus Controller.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../bindings/net/can/cast,can-ctrl.yaml       | 106 ++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/can/cast,can-ctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/can/cast,can-ctrl.yaml:27:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240922145151.130999-3-hal.feng@starfivetech.com

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
