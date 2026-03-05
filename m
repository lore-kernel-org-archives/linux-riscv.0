Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E70F30924
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Subject:Cc:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1npfeEVEYmyq5FRK3bD+pqz2cDykPQraOR7jHH4MBNU=; b=Vua9zsWtTtuMKFe2tZA1T2kUEH
	ZyWsz8/maq5Ru4WiDctMCEkxye9pA47XQ11f4PrnzLIjTt4rRfh8a0VAtggo8VT8QiJpdtM+GOTze
	jrzMMlg1CImLWLmcE7RVoYCHxgFANUllRTLkQMxHbVX24oY4ZjoBA4I1EipmZDohgO1TYsa9Zo8MW
	yLDdxqa1FwMK9Sd0eRv48ZkXBw/tuGEqDGx1BPCcBznaOnpyoxhB+vuPamKX+U3cjn6A+uCRTKqEZ
	36KO57AWl5wxqw0cnnCWUyS6bb/niVkICK1hbnNkreCgouqe0fByLgIJllB7oaZL3ad1jnH5Hheld
	RkjuHFfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy58C-00000001Pds-0JHj;
	Thu, 05 Mar 2026 09:36:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy58A-00000001PcS-0HcE
	for linux-riscv@bombadil.infradead.org;
	Thu, 05 Mar 2026 09:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Content-Type:Mime-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Mbidr/A9XxccdAFsJsVKLL2bBtmGRz8XUrt7LUMLgOs=; b=dl2ong5NzZGjHxK3+LR4jXgVul
	OHC6KBy2eYlHoj3X1bKIRpHfH2lElUgPW9/M4dfKa2VVwhPDDf871qF22T9lNqVZ4OnxGQhfDtKWJ
	56J1Nvwpk/MIf77sCqVOOLMoUagkt3XzsuXcQoz1d856kdHx77UcTBSTaDyq7EomZ6p0egPBEPXoe
	4PAILZahNruS6+UuouBHws21Yq5rspNbKLEipuUgjDsKOaE0789tfFS/mMX2Q9MlPNhzWnMDzrWie
	9fvmVB3tjFuToRRTZV50mIkRtgAghjfqpXjiQfmvXnn35FgxR3wxXP323m7gtZl0PmRJuJQLrsJGr
	+zuR4z8Q==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy586-00000006M3q-3UAq
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 09:36:28 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-439af7d77f0so4252872f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 01:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772703385; x=1773308185; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mbidr/A9XxccdAFsJsVKLL2bBtmGRz8XUrt7LUMLgOs=;
        b=N0S3IsyCKkyFGJvcjWmFM714EtFQIbnd6KXtK5vBVkCbblFSAjIwodqNiXIvbK+17B
         LPL5czAhCCdebfOh5IpP+PpRp2uO1v2WdaJQcLlPw3eJ9Py0QinlDSm4s1hZAREYNVbi
         p9NB4YuXDtBOYGFq0xIq24LnULchX6e+/VFz0r8yrylKaBTBpBtko+dmc3xHKyn5gH5B
         5h8BPZWou7EqqudPqvzgcP+LBnjQh1u8ahLrasXw1fqU5o0v/HzlceI5sszy+FlP2GY+
         EggKaYhiNsBL1Q0f3dFYmCgI5ARiiWZpS9SI7lgrA29Z4rKwVUL2JRzThVNc0T8/r/2K
         Vvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772703385; x=1773308185;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mbidr/A9XxccdAFsJsVKLL2bBtmGRz8XUrt7LUMLgOs=;
        b=O67qsOnZKg3WJcHABmhNzUmyoBDZsJaA6buaRCb+X3xWzzETdcTrKL+eZ1TfElZHiF
         qOaVNbs+oy97v5BlhwbMRbR7L8aGu9yN9jpSYBWlFKKP7620AxH24e4Y9MV1/g40+1Qa
         fK72uQjy/p3MvoZrpSae9GYZdibMmZodhZGNiA7s6Dwbqoc1SZTtxpKJFYv9uD2kXG+f
         dpUdM9zm0MrLt8Xk/S2j+bW8NR98zZgL2BMGjR3Ecor4I5J/w+7j48hOOzDk3Gqn/b5b
         N1fj5kTnwVrByZ/2WxUoRYDAE1R+iYq/LH/MUnU7DPAJeEKAV1bmwnYAihmRAbxidmO5
         HS6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJ0hvho5Rm03+1A+vMUYkqLYOxU2dVsh5yVAd3z1gs7yYZ0/lHfU8ziU3fwDZ65CT5AoSO3xArlRKUjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyibtyQv8ApUuu+yvYK3Xx2XAFaaiVpE9zdzbwTvuIXbf1s3PYb
	FTelr3dIGBSoO/rKKToTpyl7tjqy/5nuDlvpwj4gl9xT0G5Im8y6EGX53+KxiY4F/hk=
X-Gm-Gg: ATEYQzxN3XpTVwXTDvlpUmE6DyFVJZi2gC4CWm1IkziidFh4VMEIbm/z0hOSfsLcO+q
	ISYWtofrjMys5+a/3gZ1sg2y3xyqvhZ+AzdUU6BAZnKXkdcyGnQIy/1z420pEsMvbhDE8k488eO
	JY/MK2URkBSSB+7z6sAeMh2I9ZvT6/xK00hmT6A9T8M0VQ+ZXDQAp4ISF48TrRRNOJZ+bbtQXln
	7eX7XDgA3HTFQ0Gxn9XijgUuQlmwU7YtTCplweqsJ/8rbXZqaqGtXwPPnV7Edu9J34me8L0tiG4
	iWHC1kyt9ObLxFYBz4OZmdo9E0PN6yt2HOb0Sn49ZhAP5LNB9JqYFpQL9AzTrEweMjkSbyDeTAb
	b8WcOuA8dI4nbei9pa8QIZHH8S6kBUBymXAzetARn87+cF5JTL8NhW0+MHbi2Tp5iOV4IYN0WSQ
	jvhg9aSUiVnN/eAAo=
X-Received: by 2002:a05:6000:144f:b0:439:b564:7a6c with SMTP id ffacd0b85a97d-439c7f6a2c9mr9158913f8f.4.1772703384539;
        Thu, 05 Mar 2026 01:36:24 -0800 (PST)
Received: from localhost ([195.52.25.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c2f7eca1sm14966458f8f.11.2026.03.05.01.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:36:22 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 05 Mar 2026 10:36:14 +0100
Message-Id: <DGUQWFYCPRQZ.17SO07GXW2DYA@baylibre.com>
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>,
 <linux-phy@lists.infradead.org>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-can@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-ide@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
 <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <netdev@vger.kernel.org>, <spacemit@lists.linux.dev>,
 <UNGLinuxDriver@microchip.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Marc Kleine-Budde" <mkl@pengutronix.de>,
 "Vincent Mailhol" <mailhol@kernel.org>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Markus Schneider-Pargmann" <msp@baylibre.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>
Subject: Re: [PATCH phy-next 13/22] phy: introduce phy_get_max_link_rate()
 helper for consumers
X-Mailer: aerc 0.21.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-14-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-14-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_093626_987695_C62E1548 
X-CRM114-Status: GOOD (  24.52  )
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
Content-Type: multipart/mixed; boundary="===============5070857329265801518=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5070857329265801518==
Content-Type: multipart/signed;
 boundary=b895f1e89350da7f8491f35b99d431866030fe6df54b62358155e9918430;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--b895f1e89350da7f8491f35b99d431866030fe6df54b62358155e9918430
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Mar 4, 2026 at 6:57 PM CET, Vladimir Oltean wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: Vincent Mailhol <mailhol@kernel.org>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Cc: Markus Schneider-Pargmann <msp@baylibre.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 4 ++--
>  drivers/gpu/drm/bridge/synopsys/dw-dp.c             | 2 +-
>  drivers/net/can/at91_can.c                          | 2 +-
>  drivers/net/can/flexcan/flexcan-core.c              | 2 +-
>  drivers/net/can/m_can/m_can_platform.c              | 2 +-
>  drivers/net/can/rcar/rcar_canfd.c                   | 2 +-
>  drivers/phy/phy-core.c                              | 6 ++++++
>  include/linux/phy/phy.h                             | 6 ++++++
>  8 files changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/driver=
s/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index a8b6ae58cb0a..ed7ed82ddb64 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -1300,7 +1300,7 @@ static u32 cdns_mhdp_get_training_interval_us(struc=
t cdns_mhdp_device *mhdp,
> =20
>  static void cdns_mhdp_fill_host_caps(struct cdns_mhdp_device *mhdp)
>  {
> -	unsigned int link_rate;
> +	u32 link_rate;
> =20
>  	/* Get source capabilities based on PHY attributes */
> =20
> @@ -1308,7 +1308,7 @@ static void cdns_mhdp_fill_host_caps(struct cdns_mh=
dp_device *mhdp)
>  	if (!mhdp->host.lanes_cnt)
>  		mhdp->host.lanes_cnt =3D 4;
> =20
> -	link_rate =3D mhdp->phy->attrs.max_link_rate;
> +	link_rate =3D phy_get_max_link_rate(mhdp->phy);
>  	if (!link_rate)
>  		link_rate =3D drm_dp_bw_code_to_link_rate(DP_LINK_BW_8_1);
>  	else
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 4ab6922dd79c..79c72ee8e263 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -536,7 +536,7 @@ static int dw_dp_link_parse(struct dw_dp *dp, struct =
drm_connector *connector)
> =20
>  	link->revision =3D link->dpcd[DP_DPCD_REV];
>  	link->rate =3D min_t(u32, min(dp->plat_data.max_link_rate,
> -				    dp->phy->attrs.max_link_rate * 100),
> +				    phy_get_max_link_rate(dp->phy) * 100),
>  			   drm_dp_max_link_rate(link->dpcd));
>  	link->lanes =3D min_t(u8, phy_get_bus_width(dp->phy),
>  			    drm_dp_max_lane_count(link->dpcd));
> diff --git a/drivers/net/can/at91_can.c b/drivers/net/can/at91_can.c
> index 58da323f14d7..b56db253f02d 100644
> --- a/drivers/net/can/at91_can.c
> +++ b/drivers/net/can/at91_can.c
> @@ -1126,7 +1126,7 @@ static int at91_can_probe(struct platform_device *p=
dev)
>  	can_rx_offload_add_timestamp(dev, &priv->offload);
> =20
>  	if (transceiver)
> -		priv->can.bitrate_max =3D transceiver->attrs.max_link_rate;
> +		priv->can.bitrate_max =3D phy_get_max_link_rate(transceiver);
> =20
>  	if (at91_is_sam9263(priv))
>  		dev->sysfs_groups[0] =3D &at91_sysfs_attr_group;
> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/fle=
xcan/flexcan-core.c
> index f5d22c61503f..3a4307bc1d61 100644
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
> @@ -2211,7 +2211,7 @@ static int flexcan_probe(struct platform_device *pd=
ev)
>  	priv->transceiver =3D transceiver;
> =20
>  	if (transceiver)
> -		priv->can.bitrate_max =3D transceiver->attrs.max_link_rate;
> +		priv->can.bitrate_max =3D phy_get_max_link_rate(transceiver);
> =20
>  	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3) {
>  		priv->irq_boff =3D platform_get_irq(pdev, 1);
> diff --git a/drivers/net/can/m_can/m_can_platform.c b/drivers/net/can/m_c=
an/m_can_platform.c
> index 56da411878af..73525be6566b 100644
> --- a/drivers/net/can/m_can/m_can_platform.c
> +++ b/drivers/net/can/m_can/m_can_platform.c
> @@ -132,7 +132,7 @@ static int m_can_plat_probe(struct platform_device *p=
dev)
>  	}
> =20
>  	if (transceiver)
> -		mcan_class->can.bitrate_max =3D transceiver->attrs.max_link_rate;
> +		mcan_class->can.bitrate_max =3D phy_get_max_link_rate(transceiver);
> =20
>  	priv->base =3D addr;
>  	priv->mram_base =3D mram_addr;
> diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rca=
r_canfd.c
> index eaf8cac78038..645d5671705d 100644
> --- a/drivers/net/can/rcar/rcar_canfd.c
> +++ b/drivers/net/can/rcar/rcar_canfd.c
> @@ -1885,7 +1885,7 @@ static int rcar_canfd_channel_probe(struct rcar_can=
fd_global *gpriv, u32 ch,
>  	priv->channel =3D ch;
>  	priv->gpriv =3D gpriv;
>  	if (transceiver)
> -		priv->can.bitrate_max =3D transceiver->attrs.max_link_rate;
> +		priv->can.bitrate_max =3D phy_get_max_link_rate(transceiver);
>  	priv->can.clock.freq =3D fcan_freq;
>  	dev_info(dev, "can_clk rate is %u\n", priv->can.clock.freq);
> =20
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index a1aff00fba7c..89f7410241aa 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -640,6 +640,12 @@ void phy_set_bus_width(struct phy *phy, int bus_widt=
h)
>  }
>  EXPORT_SYMBOL_GPL(phy_set_bus_width);
> =20
> +u32 phy_get_max_link_rate(struct phy *phy)
> +{

All of the can drivers that would use this function are checking phy
before assigning the max_link_rate:

  if (transceiver)
          priv->can.bitrate_max =3D transceiver->attrs.max_link_rate;

Would it be reasonable to have

  if (!phy)
          return 0;

in this function to be able to drop these individual checks of the
drivers? This would be similar to clk_get_rate() which does the same
check and return 0 for convenience.

Best
Markus

> +	return phy->attrs.max_link_rate;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_max_link_rate);
> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 36307e47760d..af9c3e795786 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -57,6 +57,7 @@ int phy_notify_disconnect(struct phy *phy, int port);
>  int phy_notify_state(struct phy *phy, union phy_notify state);
>  int phy_get_bus_width(struct phy *phy);
>  void phy_set_bus_width(struct phy *phy, int bus_width);
> +u32 phy_get_max_link_rate(struct phy *phy);
>  #else
>  static inline struct phy *phy_get(struct device *dev, const char *string=
)
>  {
> @@ -256,6 +257,11 @@ static inline int phy_get_bus_width(struct phy *phy)
>  static inline void phy_set_bus_width(struct phy *phy, int bus_width)
>  {
>  }
> +
> +static inline u32 phy_get_max_link_rate(struct phy *phy)
> +{
> +	return 0;
> +}
>  #endif /* IS_ENABLED(CONFIG_GENERIC_PHY) */
> =20
>  #endif /* __PHY_CONSUMER_H */


--b895f1e89350da7f8491f35b99d431866030fe6df54b62358155e9918430
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaalOjxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlPc
SwEAt3Fg0ly9qnS+HJQv96JGhcc9ssPHPspnN0LcoiUH76oBAJJ1UWuuXcnIsBb3
namewJQN1U0nDnFUFRtJbSq49LcK
=6g8b
-----END PGP SIGNATURE-----

--b895f1e89350da7f8491f35b99d431866030fe6df54b62358155e9918430--


--===============5070857329265801518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5070857329265801518==--

