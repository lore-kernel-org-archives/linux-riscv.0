Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1674AC4321E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 20:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Me6TJVgktlwT63EzjQPCKHRq1LJlr7umI64Zg8kJ4JM=; b=zxN5mpsZcIqgov
	NVW4nKKxq1tTHH5Nih3opf4DdWjPDK4hdyBU6GmGXw2o0emeWEI7WTvo61HWLfanasCQsKACYplI7
	NfAn2LiLFTJSVvJyFf6PKGbQuxl72/nZyBW1bQ9O7NdK61rklOvBFhp43OPCpIKU4dio6xSTGJZKH
	zhDxZnUvjzB7YUZm4CUf+fmABe4OEJS0fyzcmAK/TtK4Snb5AWtZKLWSdWv6QCuy0F3pwugiF3Ko1
	cxpV12lf+Y9ONkFKY/L9Zo+BIjKk04PjZ6bMxuOP5WiUn0RopWcvTsCDiI3szIIhSrmeP1r8z/XDA
	GINqCb1IpMnJTmPNa1hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlAJ-004OaR-ER; Mon, 28 Nov 2022 20:55:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlAG-004OZd-GD; Mon, 28 Nov 2022 20:55:46 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ozlA5-000801-38; Mon, 28 Nov 2022 21:55:33 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stanislav Jakubek <stano.jakubek@gmail.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 03/12] dt-bindings: riscv: Add Allwinner D1/D1s board compatibles
Date: Mon, 28 Nov 2022 21:55:31 +0100
Message-ID: <7181632.DvuYhMxLoT@diego>
In-Reply-To: <20221125234656.47306-4-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-4-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_125544_566858_4DBDC2F9 
X-CRM114-Status: GOOD (  16.76  )
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

Am Samstag, 26. November 2022, 00:46:47 CET schrieb Samuel Holland:
> Several SoMs and boards are available that feature the Allwinner D1 or
> D1s SoC. Document their compatible strings.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

> ---
> 
> Changes in v2:
>  - Add MangoPi MQ (non-Pro) board
> 
>  .../devicetree/bindings/riscv/sunxi.yaml      | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sunxi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sunxi.yaml b/Documentation/devicetree/bindings/riscv/sunxi.yaml
> new file mode 100644
> index 000000000000..9edb5e5992b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/sunxi.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/sunxi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner RISC-V SoC-based boards
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> +  - Samuel Holland <samuel@sholland.org>
> +
> +description:
> +  Allwinner RISC-V SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: Dongshan Nezha STU SoM
> +        items:
> +          - const: 100ask,dongshan-nezha-stu
> +          - const: allwinner,sun20i-d1
> +
> +      - description: D1 Nezha board
> +        items:
> +          - const: allwinner,d1-nezha
> +          - const: allwinner,sun20i-d1
> +
> +      - description: ClockworkPi R-01 SoM and v3.14 board
> +        items:
> +          - const: clockwork,r-01-clockworkpi-v3.14
> +          - const: allwinner,sun20i-d1
> +
> +      - description: ClockworkPi R-01 SoM, v3.14 board, and DevTerm expansion
> +        items:
> +          - const: clockwork,r-01-devterm-v3.14
> +          - const: clockwork,r-01-clockworkpi-v3.14
> +          - const: allwinner,sun20i-d1
> +
> +      - description: Lichee RV SoM
> +        items:
> +          - const: sipeed,lichee-rv
> +          - const: allwinner,sun20i-d1
> +
> +      - description: Carrier boards for the Lichee RV SoM
> +        items:
> +          - enum:
> +              - sipeed,lichee-rv-86-panel-480p
> +              - sipeed,lichee-rv-86-panel-720p
> +              - sipeed,lichee-rv-dock
> +          - const: sipeed,lichee-rv
> +          - const: allwinner,sun20i-d1
> +
> +      - description: MangoPi MQ board
> +        items:
> +          - const: widora,mangopi-mq
> +          - const: allwinner,sun20i-d1s
> +
> +      - description: MangoPi MQ Pro board
> +        items:
> +          - const: widora,mangopi-mq-pro
> +          - const: allwinner,sun20i-d1
> +
> +additionalProperties: true
> +
> +...
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
