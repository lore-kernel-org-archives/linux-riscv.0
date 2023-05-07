Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC17BC77B75
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 22:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=npL9sXxsRK4nNvlAEhTUS57uNms8DqMsruBfIrTD1Uw=; b=boyKk75sm8tpGs
	32x0z9IerwL7+IHpe1LmU6QSQS9DnTH+Df5NVZr/2O5lM4UPWeGKqtJ2qqSqc0Nm5P0cfZMXKYPD2
	hyfMo2mJKpCUWko1NJxSSoS834nNbUChO5unQTydCrJYYz0EWXppLVlEpNazFFbXE43K0q047v/22
	yF7js3O34N7NNVz+uQ+/T3ps2xE+niJllL7U4I5+Sawq8Z9A80YhYEscBKrc4edrTXOfASnbkBktu
	kqkYmHJMLff9SbAt57hoJXO5fr3IougbUWNNgghyC/oynHAlOiaAfnP9no39b0jneEwEb3PVFTUZL
	yvOPFP20nxzaKAjaILEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvn4C-00GmYJ-2D;
	Sun, 07 May 2023 22:41:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvn47-00GmWS-2S;
	Sun, 07 May 2023 22:41:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84FA44B3;
	Sun,  7 May 2023 15:41:53 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D0203F663;
	Sun,  7 May 2023 15:41:05 -0700 (PDT)
Date: Sun, 7 May 2023 23:40:49 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Maxime Ripard <mripard@kernel.org>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/5] dt-bindings: spi: sun6i: add DT bindings for
 Allwinner R329/D1/R528/T113s SPI
Message-ID: <20230507234049.3f285450@slackpad.lan>
In-Reply-To: <20230507150345.1971083-2-bigunclemax@gmail.com>
References: <20230507150345.1971083-1-bigunclemax@gmail.com>
	<20230507150345.1971083-2-bigunclemax@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_154115_909661_E4D6639D 
X-CRM114-Status: GOOD (  16.98  )
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

On Sun,  7 May 2023 18:03:33 +0300
Maksim Kiselev <bigunclemax@gmail.com> wrote:

Hi,

> Listed above Allwinner SoCs has two SPI controllers. First is the regular
> SPI controller and the second one has additional functionality for
> MIPI-DBI Type C.
> 
> Add compatible strings for these controllers
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml   | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> index de36c6a34a0f..ab2d8a03011e 100644
> --- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> @@ -19,6 +19,7 @@ properties:
>  
>    compatible:
>      oneOf:
> +      - const: allwinner,sun50i-r329-spi
>        - const: allwinner,sun6i-a31-spi
>        - const: allwinner,sun8i-h3-spi
>        - items:
> @@ -28,6 +29,12 @@ properties:
>                - allwinner,sun50i-h616-spi
>                - allwinner,suniv-f1c100s-spi
>            - const: allwinner,sun8i-h3-spi
> +      - items:
> +          - enum:
> +              - allwinner,sun20i-d1-spi
> +              - allwinner,sun20i-d1-spi-dbi
> +              - allwinner,sun50i-r329-spi-dbi
> +          - const: allwinner,sun50i-r329-spi

So this is still not right: It allows:
"allwinner,sun20i-d1-spi-dbi", "allwinner,sun50i-r329-spi"
which it shouldn't, but more importantly disallows the three string
version that is introduced in patch 5/5, which makes dtbs_check fail.
So we need to fix this. I think the simplest is probably:

+      - items:
+          - enum:
+              - allwinner,sun20i-d1-spi
+              - allwinner,sun50i-r329-spi-dbi
+          - const: allwinner,sun50i-r329-spi
+      - items:
+          - const: allwinner,sun20i-d1-spi-dbi
+          - const: allwinner,sun50i-r329-spi-dbi
+          - const: allwinner,sun50i-r329-spi

Maybe there is a shorter sequence.
This assumes we go with the three-string combo, of course.

Cheers,
Andre


>  
>    reg:
>      maxItems: 1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
