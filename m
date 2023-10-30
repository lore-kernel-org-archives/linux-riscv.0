Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF31C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 01:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rRC35XaHfcxF0sAkq6XyYt2PeMgudFwVx7bWH1m99As=; b=WOoXKPodozl3fZ
	+ttgG5FRWaHgZXFg8fgY0Sh8PDK7nBbTuVYSBQ3pbV/gPv/MKy2Sha+O+h0wU1JdDyaXqxsuomRUr
	N5xi+7F10JHvz97DWLzTkvAvyXtoE+Wv1xkjbxpX/OiPJseiiALJTqd/azrXN2peLpmxEYd2hwjxc
	Fp2/QyqK3FZFAEdtWm+Y0P9riUzOky211VvI6iHX1OVz81y0Ha8kgw9hTarVspNSYeCsBdIpx40QD
	t4kESpoESXkMptbp+WwQnN+7LnmQNx8MwltCPKc6FpPuJ8CGkvRMKyxVM9ugNQFwfx+35VYjV29lT
	ArX2pPXBd1BRDjLVwb9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxHDu-002OgQ-1U;
	Mon, 30 Oct 2023 01:37:46 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxHDr-002Ofu-0E;
	Mon, 30 Oct 2023 01:37:44 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1dceb2b8823so1997559fac.1;
        Sun, 29 Oct 2023 18:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698629857; x=1699234657;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xlMGuUk+qnsLF+L/nJQTBfbm1MmfORWq7xKQHDc9EXw=;
        b=ihYjed0s5P9Zat4q0zBeM8FMox2JVx0QjFe1FWRVKjA4RxqAke21gnuvVDCkh4MtkJ
         3ofvI1ssbw+nfM9SsPW7YlulPogu73+XR4ahCiJy8jmsW3JZqlvZzFoVHvLeGPok40in
         1ubHni/fQyX34kE3vHtGcbNHJLJt5TnnxQNHi2mzIZxwnAcuZqUEI8xi3gXU6HFg97Yo
         c9cHKb1JgmzejDwSEvfVh1odKkGluHMxGNLNAt1OIv8vQiYvRQ+blSBoHvOk3H5uJpO4
         ZWkbCb1/26yWLtl4YxzhWXSxKfN4Pr4hlPTo25+To8p8zj3VN/tTIzl+jdBuqKGGFk3N
         JhLg==
X-Gm-Message-State: AOJu0YyBTHc7k4XNP/3dsT2AsG6QEu0Mm6HdVAufH7FbK9KH92Q5mtav
	rS187hFtQTNN6nP5VQScMw==
X-Google-Smtp-Source: AGHT+IEZOFMr5EN0MHiSMfj7O+mvk+nZJRx3Z3xGz3bf8eovU7M0pK4cWM0M+2uMsKvCWYSf9lROTw==
X-Received: by 2002:a05:6871:5a9a:b0:1e9:ae60:de68 with SMTP id oo26-20020a0568715a9a00b001e9ae60de68mr6512318oac.26.1698629856926;
        Sun, 29 Oct 2023 18:37:36 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n3-20020a056870e40300b001ea17894928sm1372256oag.21.2023.10.29.18.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 18:37:36 -0700 (PDT)
Received: (nullmailer pid 3840493 invoked by uid 1000);
	Mon, 30 Oct 2023 01:37:34 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Eric Dumazet <edumazet@google.com>, Richard Cochran <richardcochran@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Samin Guo <samin.guo@starfivetech.com>, netdev@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, kernel@collabora.com, "David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-kernel@lists.infradead.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20231029042712.520010-5-cristian.ciocaltea@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-5-cristian.ciocaltea@collabora.com>
Message-Id: <169855920979.2226136.3264200658228005554.robh@kernel.org>
Subject: Re: [PATCH v2 04/12] dt-bindings: net: starfive,jh7110-dwmac: Add
 JH7100 SoC compatible
Date: Sun, 29 Oct 2023 20:37:34 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_183743_114270_F20F72D2 
X-CRM114-Status: GOOD (  13.48  )
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


On Sun, 29 Oct 2023 06:27:04 +0200, Cristian Ciocaltea wrote:
> The Synopsys DesignWare MAC found on StarFive JH7100 SoC is quite
> similar to the newer JH7110, but it requires only two interrupts and a
> single reset line.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 74 +++++++++++++------
>  2 files changed, 54 insertions(+), 21 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.example.dtb: ethernet@c9410000: compatible: 'oneOf' conditional failed, one must be fixed:
	'starfive,jh7100-dwmac' was expected
	'amlogic,meson-gxbb-dwmac' is not one of ['starfive,jh7110-dwmac']
	'snps,dwmac-5.20' was expected
	from schema $id: http://devicetree.org/schemas/net/starfive,jh7110-dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.example.dtb: ethernet@c9410000: reg: [[3376480256, 65536], [3364046144, 8]] is too long
	from schema $id: http://devicetree.org/schemas/net/starfive,jh7110-dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.example.dtb: ethernet@c9410000: clocks: [[4294967295], [4294967295], [4294967295], [4294967295]] is too short
	from schema $id: http://devicetree.org/schemas/net/starfive,jh7110-dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.example.dtb: ethernet@c9410000: clock-names:1: 'pclk' was expected
	from schema $id: http://devicetree.org/schemas/net/starfive,jh7110-dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.example.dtb: ethernet@c9410000: clock-names:2: 'ptp_ref' was expected
	from schema $id: http://devicetree.org/schemas/net/starfive,jh7110-dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.example.dtb: ethernet@c9410000: clock-names:3: 'tx' was expected
	from schema $id: http://devicetree.org/schemas/net/starfive,jh7110-dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.example.dtb: ethernet@c9410000: clock-names: ['stmmaceth', 'clkin0', 'clkin1', 'timing-adjustment'] is too short
	from schema $id: http://devicetree.org/schemas/net/starfive,jh7110-dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.example.dtb: ethernet@c9410000: 'resets' is a required property
	from schema $id: http://devicetree.org/schemas/net/starfive,jh7110-dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.example.dtb: ethernet@c9410000: 'reset-names' is a required property
	from schema $id: http://devicetree.org/schemas/net/starfive,jh7110-dwmac.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231029042712.520010-5-cristian.ciocaltea@collabora.com

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
