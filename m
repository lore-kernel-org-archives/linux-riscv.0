Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6E8C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 16:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t7P2423kwxMHHaeGwamwN/J16eeCEuvaTPZ/k2/5PUE=; b=n3efkrAlt9UVkq
	mg6ikT4nXcFOCmJE2GJmoGMYuYxsn23ZzkkaDeEzM23IGUmxmb1roPlzFtSYuJUu7Em8QluxySf4Y
	0tTU6XB+cNCle6Qqj745GELXpgXVtqho+ZD08RoOC9O2uZCldJy+erEui4etFZTgq729uNihtjBo8
	aeppah3A3oDc75bih50U6QGHsF/1nxNNL/VG69j63Y/OdFstW3ZGN/VOXvYtcOxSDOKMifHtSXJ7Y
	MEoX7EiFiKHxBC21RE7CfxYKevOhXX1GT2KzNdfrDcYs9HI/9xXeB6bx6uLBvbvWXlYR8hNi6rhRM
	t3boLiYvCku9A3AWqYug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYpws-0000000FuX9-3qFb;
	Tue, 30 Jul 2024 16:43:42 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYpwq-0000000FuWC-15Jn
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 16:43:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 58D39CE112C;
	Tue, 30 Jul 2024 16:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A552AC32782;
	Tue, 30 Jul 2024 16:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722357813;
	bh=rM6iSBoLqvdC9i7j/uLVUpFr+05gFmWXkBFCh8kha7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rKI6qJkX/lXCuCu2TSLnOMaoIDsXR54jK5DEM2wqQHohfBFcM59fY263xIPMMgX0d
	 dvIVbeO/bxqe6CWTqpAY2u0Z7h42JMpWSuHEJCL3Hf3b6YeJgqfzHOA+/AoBWpzm1L
	 S8FV3PKtG07d5q5ETsBWUb4DcDKqxx7kzsMX7hJk7vy2tpaZ1T9/V44Y5lY5T/Qmyp
	 x09v7iuXPIzyCIPkX/5XmIEkpaJ8M2/1dzysGN2hrIYcvlmU1Sq1WMnMb2J+Nofcar
	 EX8z3McX6hbJwuDHjnqtNaVVUZRqUSFpHNcwQPlKdE0vD57u2gNAndJM4WDBoS1FxB
	 3RScm4quK+J+Q==
Date: Tue, 30 Jul 2024 10:43:32 -0600
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Drew Fustini <dfustini@baylibre.com>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo
 CV1800 series SoC.
Message-ID: <20240730164332.GA1501290-robh@kernel.org>
References: <IA1PR20MB4953B8B0014FA82A8E141CB0BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953C9FF856D6076FB1F8641BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953C9FF856D6076FB1F8641BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_094340_694941_49FFE95B 
X-CRM114-Status: GOOD (  19.82  )
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

On Mon, Jul 29, 2024 at 09:02:27AM +0800, Inochi Amaoto wrote:
> Add pinctrl support for Sophgo CV1800 series SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  .../pinctrl/sophgo,cv1800-pinctrl.yaml        | 120 +++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv1800b.h |  63 +++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv1812h.h | 127 ++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv18xx.h  |  19 +++
>  include/dt-bindings/pinctrl/pinctrl-sg2000.h  | 127 ++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-sg2002.h  |  79 +++++++++++
>  6 files changed, 535 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1800b.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1812h.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv18xx.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2000.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2002.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> new file mode 100644
> index 000000000000..a94ff6fb785e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/sophgo,cv1800-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV1800 Pin Controller
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sophgo,cv1800b-pinctrl
> +      - sophgo,cv1812h-pinctrl
> +      - sophgo,sg2000-pinctrl
> +      - sophgo,sg2002-pinctrl
> +
> +  reg:
> +    items:
> +      - description: pinctrl for system domain
> +      - description: pinctrl for rtc domain
> +
> +  reg-names:
> +    items:
> +      - const: sys
> +      - const: rtc
> +
> +  resets:
> +    maxItems: 1
> +
> +patternProperties:
> +  '-cfg$':
> +    type: object
> +    description:
> +      A pinctrl node should contain at least one subnode representing the
> +      pinctrl groups available on the machine.
> +
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        description: |
> +          Each subnode will list the pins it needs, and how they should
> +          be configured, with regard to muxer configuration, bias, input
> +          enable/disable, input schmitt trigger, slew-rate, drive strength
> +          and bus hold state. In addition, all pins in the same subnode
> +          should have the same power domain. For configuration detail,
> +          refer to https://github.com/sophgo/sophgo-doc/.
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +
> +        properties:
> +          pinmux:
> +            description: |
> +              The list of GPIOs and their mux settings that properties in the
> +              node apply to. This should be set using the GPIOMUX or GPIOMUX2
> +              macro.
> +
> +          bias-pull-up:
> +            type: boolean
> +
> +          bias-pull-down:
> +            type: boolean
> +
> +          drive-strength-microamp:
> +            description: typical current when output high level.
> +
> +          input-schmitt-microvolt:
> +            description: typical threshold for schmitt trigger.
> +
> +          power-source:
> +            description: power supplies at X mV.
> +            enum: [ 1800, 3300 ]
> +
> +          slew-rate:
> +            description: slew rate for output buffer (0 is fast, 1 is slow)
> +            enum: [ 0, 1 ]
> +
> +          bias-bus-hold:
> +            type: boolean

Drop 'type'. It already has one defined.

> +
> +        required:
> +          - pinmux
> +          - power-source
> +
> +        additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
> +
> +    pinctrl@3001000 {
> +        compatible = "sophgo,cv1800b-pinctrl";
> +        reg = <0x03001000 0x1000>,
> +              <0x05027000 0x1000>;
> +        reg-names = "sys", "rtc";
> +
> +        uart0_cfg: uart0-cfg {
> +            uart0-pins {
> +                pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> +                         <PINMUX(PIN_UART0_RX, 0)>;
> +                bias-pull-up;
> +          			drive-strength-microamp = <10800>;

Mixed spaces and tabs.

With those fixed,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +                input-schmitt-microvolt = <0>;
> +                power-source = <3300>;
> +                slew-rate = <0>;
> +            };
> +        };
> +    };
> +
> +...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
