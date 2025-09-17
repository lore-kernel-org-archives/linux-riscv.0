Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23CCCAC59F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 23:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SESAVGxX/NhqY7Allb7YsHX/mRKILw0dMwYFbE7CtB4=; b=llpvvz4FlvKTqA
	DBXOU68CDmHkWkVk3RPj6djUU6ejA5xVaxYAuOD96eZL37sAF/5fhwonummJ5EJTiGiVOkhy7/ZM5
	RGbsOoETn8Yt6kkplqmN/4s8UO4MGuEHiPtkqk6VVc0Sofl6BjzCqTusr6Raqqx7ZDhZp1SVAgq1G
	yk/6czcFuKapQtu9H9ToKvqMlJ/7xccWF073VJpSYmx2EvVlCAiOnCas0cBjgm8uHTBeFD4BDL9v3
	L9VmxOOrQgHC43VeINEY7d9x6yfLaNtf+d877KsLP47ORBllQMfDb0wCISwanm8K2vkQPiVCEaBAh
	QI6FRIjJV4p1MaC+2R3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz1N5-0000000FTXT-0u6S;
	Wed, 17 Sep 2025 23:15:31 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz1N2-0000000FTWN-1OUR
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 23:15:29 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 34C21341EBA;
	Wed, 17 Sep 2025 23:15:24 +0000 (UTC)
Date: Thu, 18 Sep 2025 07:15:20 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Message-ID: <20250917231520-GYA1269891@gentoo.org>
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-2-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250917220724.288127-2-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_161528_406697_5C99A234 
X-CRM114-Status: GOOD (  19.66  )
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

Hi Alex,

On 17:07 Wed 17 Sep     , Alex Elder wrote:
> Add support for the SPI controller implemented by the SpacemiT K1 SoC.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../bindings/spi/spacemit,k1-spi.yaml         | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
> new file mode 100644
> index 0000000000000..5abd4fe268da9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K1 SoC Serial Peripheral Interface (SPI)
> +
> +maintainers:
> +  - Alex Elder <elder@kernel.org>
> +
> +description:
> +  The SpacemiT K1 SoC implements a SPI controller that has two 32-entry
> +  FIFOs, for transmit and receive.  Details are currently available in
> +  section 18.2.1 of the K1 User Manual, found in the SpacemiT Keystone
> +  K1 Documentation[1].  The controller transfers words using PIO.  DMA
> +  transfers are supported as well, if both TX and RX DMA channels are
> +  specified,
> +
> +  [1] https://developer.spacemit.com/documentation
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - spacemit,k1-spi
one enum is effectively equal to const..
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Core clock
> +      - description: Bus clock
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: bus
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  dmas:
> +    items:
> +      - description: RX DMA channel
> +      - description: TX DMA channel
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +      - const: tx
> +
> +  spacemit,k1-ssp-id:
> +    description: SPI controller number
> +    $ref: /schemas/types.yaml#/definitions/uint32
could you explain a little bit why this vendor specific property should
be introduced? I took a look at the code, and didn't get the reason
behind.. or what's the problem of simply using "pdev->id"?

we should really be careful to introduce vendor specific property..

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +
> +    #include <dt-bindings/clock/spacemit,k1-syscon.h>
> +    spi3: spi@d401c000 {
label not needed for DT example
> +        compatible = "spacemit,k1-spi";
> +        reg = <0xd401c000 0x30>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        clocks = <&syscon_apbc CLK_SSP3>,
> +                 <&syscon_apbc CLK_SSP3_BUS>;
> +        clock-names = "core",
> +                      "bus";
> +        resets = <&syscon_apbc RESET_SSP3>;
> +        interrupts-extended = <&plic 55>;
> +        spacemit,k1-ssp-id = <3>;
> +        dmas = <&pdma 20>,
> +               <&pdma 19>;
> +        dma-names = "rx",
> +                    "tx";
..
> +        status = "disabled";
ditto, drop it
> +    };
> -- 
> 2.48.1
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
