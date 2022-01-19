Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0EEC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 07:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDYkAVxoyUbrQQp2r11/D7C5x+o6vaaubJEM3Ka2U7I=; b=heuvxpwnCVtmDt
	shMy1lhR8PXPSvaXawgdrRC86WtccfpA++viBgJ+2CdzUARyyYpovqBpyIk89at9saOR5vMmMjACr
	S3al0DxPmv2X5hANsB7h2F7oIDbTC2GRrrEbrod59Rr/b5q/DPB+RP5trEYmSQM0Locd8JVjrvKir
	qVldvZEYJrUliBnTb224aBt90PGQh+8bS1/InAbAifYiogpbG0SPL4D0vR9I3zhCzZnsU9PH9MO6c
	sRiCkiCL5doJMKsw6BAanwaPvvMb+8+C5JAtjugAqvs1H+AKQbG5El7YZZ2tbeZhCR3GCFip/i+zb
	EVjajN8TDnhtxE2gEHYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA5dW-004Drq-Ne; Wed, 19 Jan 2022 07:44:06 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA5dU-004Dpo-42
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 07:44:05 +0000
Received: by mail-pg1-x533.google.com with SMTP id t32so1654004pgm.7
 for <linux-riscv@lists.infradead.org>; Tue, 18 Jan 2022 23:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wgsNFzNpSSdccSgxfw+zCKaHdZrvmLN4TxH4pmEqHFM=;
 b=p+cHoZyZ/KxchMwriiVowMDalr/duztSsP8wupwGCXnhLANZc8nlOxi8DRiXRCJMIe
 ThXD3VtztapjDQndPVMlgQCNBGdaB/6GtGter/A53dpnPy0/ro9sY23pR2hrOCNdpJ6x
 A4o4u75fhuW3Mo06+JGLmcZyvqLXji4TLjjrijhdVwv1S53EEBqkn8vl1ndTRxbd3dZz
 uybHANAtOcV/NY4/riEthmOAO/ZD0wmVB13Z8eWzwiHuCL/kM8zjRhZyQ+O10QzOw4WU
 8T8YqXxpWNqIHjpyLGArRjsnP8Y9EWKTmKSTB1lK98Rd0uAtb5HaP0a2q3DyQSfNmTwM
 RKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wgsNFzNpSSdccSgxfw+zCKaHdZrvmLN4TxH4pmEqHFM=;
 b=D0nvWUv6zxSHSwn6A61HU7q+L2r5tWXn6RwvqhrYaGv/DwtP9g2ywAoI6xFmMB3i9Y
 A/Vyq0ySNDRJktUTdRr4t6jJwIR7liTmd3e+EmMiB6ftZSR3if8WLTGLdUzWu9ZqKFvs
 4K9vFVEU/ZIq2Gw/bcDMvNJy3hyr4eqW27/E8Tquqx8QRcnonkv4lbxjWTPBHwP9Vtbi
 ts0sG5LuqqkHipekJAW/r896LZ3VpWSLAqhO3xHcFUu1Vw7/0e6YYPOd0m9aziTvinw3
 ODEXflRRLTdDokFOnCQ6kV/EWqaqmJDOEpsR91Hv0pVi8U9JsVmBKvZ5XAORQHQPejTW
 C9Cw==
X-Gm-Message-State: AOAM531ntt1cdRw0t4adSemwpJpgG+VI2eGs+QVwpyh9j7FaNHt9h2Sk
 iCERO/cLGKqWZAEJGRfdrtO/zA==
X-Google-Smtp-Source: ABdhPJyNKcbiEGUcgkz9zXpAgkBgubu/10nRg7X8eh23rlI2iY9kKxwwNMydTTsODjGuMFGY0jhtqA==
X-Received: by 2002:a05:6a00:88f:b0:4bc:3b4e:255a with SMTP id
 q15-20020a056a00088f00b004bc3b4e255amr29453525pfj.79.1642578242462; 
 Tue, 18 Jan 2022 23:44:02 -0800 (PST)
Received: from localhost ([223.184.90.234])
 by smtp.gmail.com with ESMTPSA id g14sm16984301pgp.76.2022.01.18.23.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 23:44:01 -0800 (PST)
Date: Wed, 19 Jan 2022 13:14:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
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
 Vladimir Oltean <olteanv@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
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
Message-ID: <20220119074400.rqldtq6wqo73lqqg@vireshk-i7>
References: <20220119015038.2433585-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220119015038.2433585-1-robh@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_234404_241285_9A8BA18C 
X-CRM114-Status: GOOD (  14.26  )
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

On 18-01-22, 19:50, Rob Herring wrote:
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
> 

>  .../devicetree/bindings/opp/opp-v2-base.yaml  |  2 +
>  .../bindings/power/power-domain.yaml          |  4 +

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
