Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE87BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 09:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQtskWt2M+jXUjZ4VUpYXimEBu0Educb3nZZVziDz0w=; b=p54Dmyd7c/2ukT
	oAxD49CYYpAYwy5/lfF14wFhl1BYAzBUlxBWWRv+Vh/nxBu/AycThzF9DAGfB+1Q+X4uvysLIPfRL
	hF2qfONZJI4PSgEcxmVdPieKwQr/84dVRLB+ggAaI//gde5Z0mnU5Mauns5ZBSLm6V2LV5hdAv68B
	2yRO/TZoAaqRzZiaPVF+gEvWHK6zVhmM2RaAdmjQ5Ykk17MlW9QgJA7LroJQWPfVS7kxdtNHu6KO8
	hNduQkGFTtAH5LXl8NeSaUumbUMSElpP2JbWFoweGBQ1VdldWAEDijs/WSU67qC5ElCiYHT3Y/PKi
	yHwnqQPcfKxc4FcAC1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA7Ut-004fzn-Ni; Wed, 19 Jan 2022 09:43:19 +0000
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA7Ur-004fxk-2b; Wed, 19 Jan 2022 09:43:18 +0000
Received: by mail-pj1-f53.google.com with SMTP id
 m8-20020a17090a4d8800b001b4f361964fso2111126pjh.3; 
 Wed, 19 Jan 2022 01:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dbd6K2EXZQ3nddK61UlQKh6WscvPVU8DNsk9wwBVt84=;
 b=auH8+NNrwTYsF5++kMmDBUxTALzCsfXXI7hBU7fEJGZyct2Yxcr0aP/J/LPksuif/o
 uArr/+nQ+jt750EMUFfhBAjYxE4U6L9RbqlWZuVyrs0mghuvRIBCykeia7sr+Esn/W1r
 PwQxsexq7wSoJBf6w92XOrInbzY900ymoELml0HNd83xX9JIpPoFVarSWLsCD2DROQX2
 YgrAINUcsTR+dcwZYZVNyFmUYWw9Q3aJ+xkcdEkP/VegQhbmJQBdwj/pORqXiJn9+Hr1
 lNCI9T4OptQAadicCCtMuC8flhIqCnFiDy5v5IDzf0ZtUxWa2pY8aZ9/sADXAqnAiU2c
 rKSQ==
X-Gm-Message-State: AOAM530pWDelKJxXdN8SCf3fdQScE7akdmy5gT5wogykwXFMBdsEtimb
 FPOeQFREMN2L7CsTd/35YvLiqCkDk3vGAfRo
X-Google-Smtp-Source: ABdhPJz2lQ7J2NBDStYt+gZVi53QH4frARNaPTw6DPUREtulRrR5OV/GhV5DCdNq55t5Qnu9/y878A==
X-Received: by 2002:a17:902:b110:b0:14a:197:dfea with SMTP id
 q16-20020a170902b11000b0014a0197dfeamr30488141plr.142.1642585395559; 
 Wed, 19 Jan 2022 01:43:15 -0800 (PST)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com.
 [209.85.216.45])
 by smtp.gmail.com with ESMTPSA id me4sm3918641pjb.26.2022.01.19.01.43.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 01:43:15 -0800 (PST)
Received: by mail-pj1-f45.google.com with SMTP id
 w12-20020a17090a528c00b001b276aa3aabso5868596pjh.0; 
 Wed, 19 Jan 2022 01:43:15 -0800 (PST)
X-Received: by 2002:a1f:384b:: with SMTP id f72mr11960099vka.0.1642585384422; 
 Wed, 19 Jan 2022 01:43:04 -0800 (PST)
MIME-Version: 1.0
References: <20220119015038.2433585-1-robh@kernel.org>
In-Reply-To: <20220119015038.2433585-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Jan 2022 10:42:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdja+XaXGP7YFfSgFCTHzOHQkuV5EF_9AFWY2tppyRWA@mail.gmail.com>
Message-ID: <CAMuHMdVdja+XaXGP7YFfSgFCTHzOHQkuV5EF_9AFWY2tppyRWA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
To: Rob Herring <robh@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Vinod Koul <vkoul@kernel.org>, 
 Georgi Djakov <djakov@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, 
 Joerg Roedel <joro@8bytes.org>, Lee Jones <lee.jones@linaro.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Jakub Kicinski <kuba@kernel.org>, 
 Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_014317_129447_A56DBE8A 
X-CRM114-Status: GOOD (  23.22  )
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

Hi Rob,

On Wed, Jan 19, 2022 at 2:50 AM Rob Herring <robh@kernel.org> wrote:

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

> Signed-off-by: Rob Herring <robh@kernel.org>

The Renesas parts look good to me.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
