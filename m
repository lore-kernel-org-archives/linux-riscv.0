Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E210CC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 10:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DAcY++rWFL6H9fRaqypO06lCeB7loIGvOa5jcelIC58=; b=EY0NxLy231rUqY
	LAHe8LF52XtETrAIqG1EomYZTV+c5m6A3n7AsWRunhXLNgppuaoZQUvgvojGLUgfzeZ8cmBr9gBvS
	ZqxYJN2JeIyuEvjYVrK7DEj/drxOmMDfGwnIIEy7nGHw7e/npjZtz38MUvI24m/foWDkhLs2oMtAt
	pDqqIncLxTNMLQAaBO1EWBcRJW532zrY/IDcfn/KYqJqPQrpO6u6mBfyG0WYRYhRrR4eIcISmcimT
	hlffnPk7AEYs67QMvuLdq3bz+G948jr1BwzRlUPQER3vZGnmjvzlU4cnDVOc0dMMASQXPHFnw9FlW
	gNu123HvXshzo6WezaTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA8Jv-004xQq-Dm; Wed, 19 Jan 2022 10:36:03 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA8Jg-004xKQ-KO; Wed, 19 Jan 2022 10:35:51 +0000
Received: by mail-ed1-x531.google.com with SMTP id a18so9076235edj.7;
 Wed, 19 Jan 2022 02:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OSDFZdcVmsxc9n5bq5153WrX2NPdR5H36ptL4DF/Ld8=;
 b=YzN3hIDiV3bsIYsBRldtIUseIA+Xg7yiUwxhkQBN4CpuDkGRGuFL7tAwCFTPYxhsRL
 HPHBSnHmlPJjpHnwXFn3XLaO3n9wa1rhK6vn59VsHIzMFUB6Jaq/3jsmguiQSKRchg1F
 Rt8vJSiYrulpQPWwPqPi3M8d7DsPrMLpe1PuuNpPMpczmmAtVSklZu+pQaTuoZw/CFJz
 zmTnBvK6MUoD+sXbx5PZpdbapVrA4zutuPKb+I0hcI1WoSE1tZMwas+pgK6nHJrD6hKt
 eeU6QEdcKx7a9glyGv2v53ut+S9OpX/JqVokRLDZ4YgZwe4DtxLJ2DYjxyR/R4KjvJPB
 tM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OSDFZdcVmsxc9n5bq5153WrX2NPdR5H36ptL4DF/Ld8=;
 b=L/569ED4kPzH+yCfkzDzPoyTC5IBQ17/NiOaPFCqLBla/bkI7Wkf8fmaAB490nL+mv
 zcgErFv2geJUYiQcezFLVuwXIT7Ika0HmKje5B5VkoPRPNvQfO4n6Fp+uJ+oZ34DAC33
 hpVNe4xOlbZd4E0tRenqkfOhAu9rq4x76Nx5U0/JXHKFZKGLuOPF0jbF+8O+mVPBuRp2
 +/cQcNwvBttcn8Z6d4peJb4iMPy2EvzjfBxAI22LGchf70omRF+lYx+96eoOtfgAW22N
 4oFrkMO8gDkMaTvLSebWD7Cw6xYOxU/YW7jz2yZ0k3NkFigTgJP+JITTfiKsiy5d6WSL
 Zx1Q==
X-Gm-Message-State: AOAM531k0bmR3UANYyI3hkkXz311O4lMWkgKM4/y/9nCbqaUSZKbKOuc
 fFfvVqLnr9/aKqW3iNX+p60=
X-Google-Smtp-Source: ABdhPJxftTapCLkxAI0MUlBNg1QEZq+09+lN2uAiNmyiN4LnLKb1WAquBvnPN+ndGN2eyHqbgIspAw==
X-Received: by 2002:a05:6402:4310:: with SMTP id
 m16mr13576339edc.344.1642588546591; 
 Wed, 19 Jan 2022 02:35:46 -0800 (PST)
Received: from skbuf ([188.25.255.2])
 by smtp.gmail.com with ESMTPSA id go41sm6349344ejc.200.2022.01.19.02.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 02:35:46 -0800 (PST)
Date: Wed, 19 Jan 2022 12:35:42 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Vinod Koul <vkoul@kernel.org>, Georgi Djakov <djakov@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Jakub Kicinski <kuba@kernel.org>, Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Kalle Valo <kvalo@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Mark Brown <broonie@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org,
 linux-pm@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
 netdev@vger.kernel.org, linux-can@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
Message-ID: <20220119103542.el3yuqds6ihpkthn@skbuf>
References: <20220119015038.2433585-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220119015038.2433585-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_023548_716120_E4EE0F30 
X-CRM114-Status: GOOD (  17.78  )
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

On Tue, Jan 18, 2022 at 07:50:38PM -0600, Rob Herring wrote:
> The 'phandle-array' type is a bit ambiguous. It can be either just an
> array of phandles or an array of phandles plus args. Many schemas for
> phandle-array properties aren't clear in the schema which case applies
> though the description usually describes it.
> 
> The array of phandles case boils down to needing:
> 
> items:
>   maxItems: 1
> 
> The phandle plus args cases should typically take this form:
> 
> items:
>   - items:
>       - description: A phandle
>       - description: 1st arg cell
>       - description: 2nd arg cell
> 
> With this change, some examples need updating so that the bracketing of
> property values matches the schema.
> ---
(...)
> diff --git a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> index 702df848a71d..c504feeec6db 100644
> --- a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> @@ -34,6 +34,8 @@ properties:
>        full routing information must be given, not just the one hop
>        routes to neighbouring switches
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      maxItems: 1
>  
>    ethernet:
>      description:

For better or worse, the mainline cases of this property all take the
form of:

arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
				link = <&switch1port9 &switch2port9>;
				link = <&switch1port10 &switch0port10>;
arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
						link = <&switch1port6
							&switch2port9>;
						link = <&switch1port5
							&switch0port5>;
arch/arm/boot/dts/vf610-zii-scu4-aib.dts
						link = <&switch1port10
							&switch3port10
							&switch2port10>;
						link = <&switch3port10
							&switch2port10>;
						link = <&switch1port9
							&switch0port10>;

So not really an array of phandles.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
