Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168B3C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 19:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxgr4kg+a0eAyjE5WPsJGeS9vha9agpFbecryQ0pbMM=; b=lqRZlyo1lup1OD
	/eV3PzLw1HRtk/S/XjJVchPMTDJuYGvRATzKxL03e/Y5pnT00rEx7ETtwRExfMQWO+zAUG8TLbZD7
	LTNQag22r+qX/p6LJU6LiEc20rk53xI9QmtC9j1qk2IzJiNXlrIgPZzxC9Sn+2bTi8qQhi20Qvu8/
	tj0+z8hFO4fttPC+ZbwZcjFDqIb625LRqma8bWEs0bi9Jt67+6igkBGvgg4V2bdbY8S+lympmVbn2
	U/6AXpQwZSyD0piVCOQXvslA8Uug578+LALosvvhq+gx92gOOWMR+6e+OtxhFilOos4Pv+gdarZa4
	DGGAoMDoAFK3BmFCag6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8o8g-002LoU-VI; Tue, 05 Jul 2022 19:23:14 +0000
Received: from mail-io1-f51.google.com ([209.85.166.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8o8e-002LnS-L4
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 19:23:14 +0000
Received: by mail-io1-f51.google.com with SMTP id u20so12055096iob.8
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 12:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H5eyFsH62ZCOMR5j44c7qDXl+L0Xiqo5oRXL7/M/n9U=;
        b=TcTUj1ASc4YsNlXjA80ugALD3hRlPBfZl4n3IjTla9kWafX8PiXzwQgvfSvIZ8upDy
         mG3PaUhOvpzY/gAB9U4eOXyxvaPPmXinGhUNHMRTTG8iEXjHxcT9Fr1RgDTXvaHql/zD
         vgC1BLp7Jt5P8459llI81qDkaoaAH/l75ZVdSs4KJWkTwbu5Jb5IsrKZcaD/N4rJ9Jsb
         xN9hoz8jKbrQJWzumSMlPIykbbq2hENJzXV9T+wkeKKbSUe8Py1QNhtuM3ImJ2dbbQRQ
         ptA3T9asch643g+9+kMwXhaVQZBoncZZ1ObG7/5G2k9/BtfUTNiMAmsXz/2yiVzjS6FV
         F86g==
X-Gm-Message-State: AJIora8m1ISVHOnn2tSf/i+32TDiEZd+2Y+GHhN2SUWstT5doRF+uA2e
	MWqaOp/ziLzEwUDpKlWmFA==
X-Google-Smtp-Source: AGRyM1u0fHCnFee1kEPRUg0SqoCFPI8COBha8zPrSVGZ62b76/VvOoRH5cPG5r4Gv3xkb5zkrF1YIg==
X-Received: by 2002:a05:6638:3014:b0:317:9daf:c42c with SMTP id r20-20020a056638301400b003179dafc42cmr22147925jak.10.1657048990513;
        Tue, 05 Jul 2022 12:23:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c1-20020a6bfd01000000b00675139dbff9sm14725537ioi.48.2022.07.05.12.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:23:10 -0700 (PDT)
Received: (nullmailer pid 2477219 invoked by uid 1000);
	Tue, 05 Jul 2022 19:23:07 -0000
Date: Tue, 5 Jul 2022 13:23:07 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Serge Semin <fancer.lancer@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Niklas Cassel <niklas.cassel@wdc.com>, 
	Dillon Min <dillon.minfei@gmail.com>, Jose Abreu <joabreu@synopsys.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 05/14] dt-bindings: memory-controllers: add canaan
 k210 sram controller
Message-ID: <20220705192307.GA2471961-robh@kernel.org>
References: <20220701192300.2293643-1-conor@kernel.org>
 <20220701192300.2293643-6-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220701192300.2293643-6-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_122312_733438_F3C07ABE 
X-CRM114-Status: GOOD (  21.55  )
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

On Fri, Jul 01, 2022 at 08:22:51PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The k210 U-Boot port has been using the clocks defined in the
> devicetree to bring up the board's SRAM, but this violates the
> dt-schema. As such, move the clocks to a dedicated node with
> the same compatible string & document it.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../memory-controllers/canaan,k210-sram.yaml  | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
> new file mode 100644
> index 000000000000..82be32757713
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/canaan,k210-sram.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan K210 SRAM memory controller
> +
> +description: |

Don't need '|'.

> +  The Canaan K210 SRAM memory controller is initialised and programmed by
> +  firmware, but an OS might want to read its registers for error reporting
> +  purposes and to learn about the DRAM topology.

How the OS going to do that? You don't have any way defined to access 
the registers.

Also, where is the SRAM address itself defined?

> +
> +maintainers:
> +  - Conor Dooley <conor@kernel.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - canaan,k210-sram
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: sram0 clock
> +      - description: sram1 clock
> +      - description: aisram clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: sram0
> +      - const: sram1
> +      - const: aisram
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/k210-clk.h>
> +    memory-controller {
> +        compatible = "canaan,k210-sram";
> +        clocks = <&sysclk K210_CLK_SRAM0>,
> +                 <&sysclk K210_CLK_SRAM1>,
> +                 <&sysclk K210_CLK_AI>;
> +        clock-names = "sram0", "sram1", "aisram";
> +    };
> -- 
> 2.37.0
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
