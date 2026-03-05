Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B53FEEF312
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 07:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D0hxKdu1OXO+LcQfhuA3m6Rm3nAEmXK4V7Cs9IlFHAI=; b=kMQ/maHt6q4diV
	Xe8OPuRp7oQP7918GjB3qYsDnBkwumF8T7+YeIRJyCwFtXFFowvXb2GtMoI7fq74M45rVXmnqXhzM
	1XLup15JoerkSc13zmsEVMJMTQXUuJ+u+WMXCq0ZSoa+1vYk1yeeKyJ/LtBeq4f4g8gM+58U0u39h
	UAxrf6ZOJiDnPyd5E1nTOpKObK7Ya4woWXZRmPWemgtBuO24OofADtHCDwnVpeTxFEHVKwxAQE9lK
	sWwFiIrBqXav/e6NG0jgCMVxbBIX1Spx5UuO44G/k/8YZvcg42w5Yy8c5Wf4MNJDF5ZN4xplYIl/M
	mAi0+kAoFQ6umQp8gr5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3Xc-000000018PF-27Z9;
	Thu, 05 Mar 2026 07:54:40 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3XZ-000000018NO-0m26
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 07:54:39 +0000
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-66f3e7d9eccso5057366eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 23:54:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772697276; x=1773302076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xyHjzGnphi32H4Bte19x6wQV76UaiJqzbc3zMkJKs8=;
        b=DMGqOierOiG0feEkW69EjIoFU0HM+ei0nb2hzsBpMniMTjnSTXF2qX7Ew40B2Y7/2j
         DBvZWQqjoM/VjWUVJZqDoQZNZUKSDOknzEc+TzqwJZVJvtFq9wsVOJxhI2OtF5m7Hrf7
         7QH1F9DEpUh1E9PiatZ0lyMyLA44uJ/7pdcdC/Sj4qEHGo8trVaKorIf8htzXZN+T+1n
         9Lwd6EfAvqnxu5987EsapqgL0fKNWOhQipGPXM+pRZ1WDSFHzoLRpW5OLBZZORvoC5Dk
         jCtZ5TI5pkePauMKmNIadQ5MLN50ulDXvFCVYmHtxiLGbanMTREHphWslN3p9DhuLbTK
         ecUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbAdstNw4UswPOTrSp5VniFcMjmUKW9Wd1N1PY6fQkVVEylhGlbbjhyXXlsxD8U8XLE8Z3Em0WzScNGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEEvcKAepuQjjvb98O3xEKRCWGBp84MBWAhsHapdiHD9mn8lHe
	XQjcd0fMcsMDT2UTfY3bayH+gtpkVqwF+TQN1tXj/TFuu72APDsE+ECKcQaB6c0G
X-Gm-Gg: ATEYQzzFLf8cf5juOhqFhxUMEvSHwoTjnSnVL7sCWn2Vqfry2lcxbpUKC8TqIubgs7k
	nogdbccmE+BKJLCKmjm1uIfUFe/LUINxiP2i5KZQ4ipcfVkGS7HgdD1kZrvaKwODlSTeyi7KWuo
	jUQJuEt8VQ5el8xZcIbAuu1+g9OQNHoAhEQ7nA4L7INhE8aeQEM3gtoTEqF/7mru4pmU3NBVUb7
	k9Q1HedNTr7v/6/CV5XuT0QJdutCNXNkZNFXx9FH/U9Pn3hNJcSIwkqPU6v55PfUSe4IZaow5/u
	+EUoiApIeascM6xpGyy1+jwb2ZngzecsKPOxinNSHK4uuBJev2wuC01p79f0PN9RwrVloMGWzr3
	CdZ8eckjSlB98+MxOa+eGqj24rn+REXq/6SWoMQtjen0t+TLyKYgwlJikYdYXmI09IjjJye5xrJ
	4HgkyFQ+Iz3hgVtguie6WAce2yYpJ69Xl5f1dp/LuH6ymPf0jJuzUXWDaV3lLj
X-Received: by 2002:a05:6820:1794:b0:67a:9918:5637 with SMTP id 006d021491bc7-67b17748de0mr2717590eaf.35.1772697276077;
        Wed, 04 Mar 2026 23:54:36 -0800 (PST)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com. [209.85.160.50])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160cf239e0sm20839416fac.1.2026.03.04.23.54.35
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:54:35 -0800 (PST)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-40438e0cba6so1930214fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 23:54:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXt/hfNNX/PSaKTXRDy7ifdKz2HAMF8ld64N2PYeo/BAvCMdqIhdXpGGL7Uck4oHKgNqNDyYkSeWmrSZA==@lists.infradead.org
X-Received: by 2002:a05:6102:32c1:b0:5ff:a16b:93f9 with SMTP id
 ada2fe7eead31-5ffaae2d5b0mr1883200137.21.1772696877960; Wed, 04 Mar 2026
 23:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-14-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-14-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:47:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
X-Gm-Features: AaiRm514iMGAdfTBAVsgfVfK-GGHy9jHY4ezK-Lp3w09-JWpnENLQ0I4lkIFgvE
Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
Subject: Re: [PATCH phy-next 13/22] phy: introduce phy_get_max_link_rate()
 helper for consumers
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_235437_226392_098AA942 
X-CRM114-Status: GOOD (  21.84  )
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

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 2 +-

For the Renesas part:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -640,6 +640,12 @@ void phy_set_bus_width(struct phy *phy, int bus_width)
>  }
>  EXPORT_SYMBOL_GPL(phy_set_bus_width);
>
> +u32 phy_get_max_link_rate(struct phy *phy)
> +{
> +       return phy->attrs.max_link_rate;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_max_link_rate);

Any specific reason you are not making this a simple static inline
function, like phy_get_bus_width()?

> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy

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
