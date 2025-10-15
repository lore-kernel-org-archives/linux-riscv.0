Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3E1CCD192
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 13:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=573K9S2rgDkaXqdhmbteGC+Lki+jHrP3UlHV+50oPJw=; b=P9YIpH2Y1Eyauo
	jWbfrRDDPPePQmN5t9Gtw3dx4gxDFtYl2Qqm9/2C7VlZavOtpkvJofBFB3bSJRlZW8NnE8rIJ7ZWm
	NpZOoeu8xSEfiCkH+zGaYR1Fne7wYwcZRDrLHgvyMCU5rTcGBN3I8EWfmriODR3O/Xs2HpA6rtnsm
	gBqv0vQ8tWDUqhKXWC6NUUsAOXp9B7sGHR8tIoyiuswcc+dTyXlTngjEsBW7mz8V66wEWhqZacyNH
	Lf69TUSW6mGNz4Ny/viXSmKQhTFcjpKg1N25FmKFUhtD07MlM6LT7NTEioMofBMyMn5qQEVn6ZVi7
	+fMlCTr/A6DrKtHmKczQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91lF-00000001jGh-07dY;
	Wed, 15 Oct 2025 13:41:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91lD-00000001jGY-1TT5
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 13:41:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 94091625DE;
	Wed, 15 Oct 2025 13:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174D8C116C6;
	Wed, 15 Oct 2025 13:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760535706;
	bh=8Tz8/kXqpMNiULuP0/E6Rg1I5xQIyPrkfUQdjOvtY4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qgho6UNDGSzmVjh8u6zRS71JzTXSqZDIVq6ENT+PnLraaBPb+eznD1zErKl8Ki2Or
	 6O/8uTr4Es9MUcb7YkdpaVArrvI6k15i03Ig2N7e5iGEda2C1tBKwwyeFv4P1V0d75
	 KlOECk+y3HMnhB9UoLfl74I0Q4Hu0q+wRjJTj74aG+tPBg6k0x41Zquhj42YCeI/Io
	 MtscByVFmq2Euom+pRyYMFbnGvwCySlassHULb75c/D6ddyqEK83OF8s9AYL1lxTOe
	 2eBinkHGlttD77fJr9tSQthj4l3kU+rTozPDLRzFx/VQSe+81CzBXw8ffcIUTgsEVl
	 oAYrTgOLHGftQ==
Date: Wed, 15 Oct 2025 08:41:44 -0500
From: Rob Herring <robh@kernel.org>
To: Longbin Li <looong.bin@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <20251015134144.GA3265377-robh@kernel.org>
References: <20251012022555.6240-1-looong.bin@gmail.com>
 <20251012022555.6240-2-looong.bin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251012022555.6240-2-looong.bin@gmail.com>
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

On Sun, Oct 12, 2025 at 10:25:52AM +0800, Longbin Li wrote:
> The Sophgo CV1800/SG2000 SoC top misc system controller provides register
> access to configure related modules. It includes a usb2 phy and a dma
> multiplexer.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Signed-off-by: Longbin Li <looong.bin@gmail.com>
> ---
>  .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> new file mode 100644
> index 000000000000..d1993f2156b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV18XX/SG200X SoC top system controller
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +description:
> +  The Sophgo CV18XX/SG200X SoC top misc system controller provides
> +  register access to configure related modules.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: sophgo,cv1800b-top-syscon
> +          - const: syscon
> +          - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1

Also need 'ranges'

> +
> +patternProperties:
> +  "dma-router@154":

This allows 'foodma-router@154bar'. It's not a pattern as-is, but 
generally we don't put fixed unit-addresses into the schema. So instead, 
should be "^dma-router@[0-9a-f]+$".

> +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> +    unevaluatedProperties: false
> +
> +  "phy@48":

And similar here.

> +    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@3000000 {
> +      compatible = "sophgo,cv1800b-top-syscon", "syscon", "simple-mfd";
> +      reg = <0x03000000 0x1000>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;

Please make the example complete with child nodes.

> +    };
> +
> +...
> --
> 2.51.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
