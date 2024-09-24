Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D2BCF9C6B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 20:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nYSufutl7PIkTrvPxVqVZ4SOpOTRc+mIbwcPJvF7WqE=; b=nft/2MjKIF2vfO
	/jPSl1YeKCVfW/pIGLY8KJ6ZjoYFIsmnh30399eUdNz7GeownbpixrKo00DYlWi4YABinrX4FAAwk
	EyTMQDe+SQNpTVwoSopU3jWY6xVxTgrb+vw/7m5SZKCwo6R7VOFIDmUoxgQZwrK/xkFCdnIALB83p
	X3ZlSs4sqSACZmZUzUUcwMdqEfM0OIfjEQdYmnYLZMw1/EPbwM4F1/JR+5mvj4IIWzo+0rG8tn5GX
	lweZOLOhpJqP2VMo1XTFfuiEMB7DlSdUbOiAjFxnM7pWlZbxRR23MzMALV8KEfcjaff5NryUcvFTk
	b1b2dk/A1+HluQvI0kjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stBkf-00000003CXC-3Ehl;
	Tue, 24 Sep 2024 20:03:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stBkc-00000003CWb-22Yk
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 20:03:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5B30AA4385F;
	Tue, 24 Sep 2024 20:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E249DC4CEC5;
	Tue, 24 Sep 2024 20:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727208189;
	bh=R0j0vt/5KEvJ6KPsF46C/J5isU7kapggx/Y2JT+dCQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I40NqvGcHj+Ogr7wl2beQyU8lmJAtLl3TjQB1Pbxxmh8vWAMEGGMUtMyCLUV6Sajs
	 ppX118DSIaKekLOuo7XKToArUJ9yetUjkOa2TlPz1v8Ga/7ptuH5b8NpvICWdMpV9f
	 iB12NGrdzaeEVyoSH7if/RZs2qG+4wB/wsd19eDk9UcArtHQLEMQTxWkACSUuOsIOk
	 pUcgXt8hyJh7girLA0b/Lz/V9bUMQ/zm5GFXJT1ZktcelkSoAy0NZsLKQRhXTiJCni
	 McsvguBvOcwkZ63wf5P0bat4YeOq+L4quZX9GbrNCJ0wyvtcLJXFoiMiLyNQNTKNUa
	 5PK/eJCBeL9iQ==
Date: Tue, 24 Sep 2024 15:03:08 -0500
From: Rob Herring <robh@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	William Qiu <william.qiu@starfivetech.com>,
	devicetree@vger.kernel.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: can: Add CAST CAN Bus Controller
Message-ID: <20240924200308.GA24484-robh@kernel.org>
References: <20240922145151.130999-1-hal.feng@starfivetech.com>
 <20240922145151.130999-3-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240922145151.130999-3-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_130310_679877_0468AFBA 
X-CRM114-Status: GOOD (  18.82  )
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

On Sun, Sep 22, 2024 at 10:51:48PM +0800, Hal Feng wrote:
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
> diff --git a/Documentation/devicetree/bindings/net/can/cast,can-ctrl.yaml b/Documentation/devicetree/bindings/net/can/cast,can-ctrl.yaml
> new file mode 100644
> index 000000000000..2870cff80164
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/can/cast,can-ctrl.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/can/cast,can-ctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CAST CAN Bus Controller
> +
> +description:
> +  This CAN Bus Controller, also called CAN-CTRL, implements a highly
> +  featured and reliable CAN bus controller that performs serial
> +  communication according to the CAN protocol.
> +
> +  The CAN-CTRL comes in three variants, they are CC, FD, and XL.
> +  The CC variant supports only Classical CAN, the FD variant adds support
> +  for CAN FD, and the XL variant supports the Classical CAN, CAN FD, and
> +  CAN XL standards.
> +
> +maintainers:
> +  - William Qiu <william.qiu@starfivetech.com>
> +  - Hal Feng <hal.feng@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - starfive,jh7110-can
> +      - const: cast,can-ctrl-fd-7x10N00S00

What's the 7x10...? Perhaps some explanation on it.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +      - const: timer
> +      - const: core
> +
> +  resets:
> +    minItems: 3
> +
> +  reset-names:
> +    items:
> +      - const: apb
> +      - const: timer
> +      - const: core
> +
> +  starfive,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to System Register Controller syscon node
> +          - description: offset of SYS_SYSCONSAIF__SYSCFG register for CAN controller
> +          - description: shift of SYS_SYSCONSAIF__SYSCFG register for CAN controller
> +          - description: mask of SYS_SYSCONSAIF__SYSCFG register for CAN controller
> +    description:
> +      Should be four parameters, the phandle to System Register Controller
> +      syscon node and the offset/shift/mask of SYS_SYSCONSAIF__SYSCFG register
> +      for CAN controller.

This just repeats what the schema says. More useful would be what you 
need to access/control in this register.

Rob


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
