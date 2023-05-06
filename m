Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E70C77B73
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 21:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qxc4fDqU0RLUuYqM7GyvS3mxCMyz0NJoSJ9td3ud890=; b=GvJC61aRjxxiW9
	UtVYnL4ClHJNnjOPA/IEfKK1c3r5CpWlSr8WkJUfJkRl648VfnN1Ntxb9DQLtOnNxT9UFoVdCoLni
	YpUI8+8vYQAriN5fpDjdjfCqee0LdvJgDG5szbuhMGKNGRfVNDQ7V5wrHvtuvM2aI4DQFjdUX1ci4
	1JF1sIZHyvTlPcmH3HwC8wt+Rk2PsOqamefc0ep0HzKN7Yd0ZSxjnp7pnojrxio/58MqUD8+X8gx2
	quxnAwKTWPAy4pKIEOdOTx9pgMEK5N7AUXiVX12rKNmfJbvHU9NsEv3eqQUyFHc87EfoHd9cqH/9v
	6nlaBqVRpaeU/wcn4jGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvPwE-00EROp-1T;
	Sat, 06 May 2023 21:59:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvPwA-00ERLt-09;
	Sat, 06 May 2023 21:59:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82AB91FB;
	Sat,  6 May 2023 15:00:13 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FF7B3F5A1;
	Sat,  6 May 2023 14:59:25 -0700 (PDT)
Date: Sat, 6 May 2023 22:59:11 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Mark Brown <broonie@kernel.org>, Rob
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
Subject: Re: [PATCH v2 5/6] dt-bindings: spi: sun6i: add DT bindings for
 Allwinner D1/R528/T113s SPI
Message-ID: <20230506225911.7ac3198e@slackpad.lan>
In-Reply-To: <20230506073018.1411583-6-bigunclemax@gmail.com>
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
	<20230506073018.1411583-6-bigunclemax@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_145930_134808_6631261F 
X-CRM114-Status: GOOD (  12.78  )
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

On Sat,  6 May 2023 10:30:13 +0300
Maksim Kiselev <bigunclemax@gmail.com> wrote:

> Allwinner D1/R528/T113s SPI has the same as R329 controllers
> 
> Add compatible string for this controller

Please fold this into patch 1/6, and adjust accordingly to cover all
the combinations.

Cheers,
Andre

> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>  .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> index 2c1b8da35339..164bd6af9299 100644
> --- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> @@ -30,6 +30,10 @@ properties:
>                - allwinner,sun50i-h616-spi
>                - allwinner,suniv-f1c100s-spi
>            - const: allwinner,sun8i-h3-spi
> +      - items:
> +          - enum:
> +              - allwinner,sun20i-d1-spi
> +          - const: allwinner,sun50i-r329-spi
>  
>    reg:
>      maxItems: 1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
