Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F46C98321
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 12:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gYlpK4ydfNs9ciNh/j586QHLkP0FGLrqA+CVc3biOik=; b=y42L35KjjFi7LX
	IMhMYOd57y0rL6YMmdg/C26qhYcetBKt4WZAinZKWtne1hLiHgaVL8v1vyUMNt/lFfXzuFmIibku3
	SuUZBQnXtijteLL0/QPNOm1JaKP8IRa3zDZASWcDNFcWCl3ii254Rms60L7dYPMfUtTsW8axrL2pU
	X9KpoSOuMICkDC7vhjGbubl3WBxpSN5IqT7q0AMW1Bg4Z4ePUK4ImDLU8GXHo+bkCGAXv4mA0iMso
	h4//HrlFGuy3qZMlxkKyiVLczk0g1To9iq4AYwP+A1p7NRssErLAWaJ9j7V6VveG0X2cCRGDH+f9h
	Rp3JC3cGs6GgAlQNLfzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5L7-0000000DM5k-3Ndd;
	Fri, 25 Sep 2026 12:47:45 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5Kz-0000000DM0O-26Nw
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 12:47:42 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912d3920so6542345e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 05:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790340455; x=1790945255; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVgejJErSi/df8/6avC+kCC2kZbgZL+1y5/eEh1fX5I=;
        b=RY4+Pxn59wsor4m5G30G6lelwdvxY+SP9I7gE8ydAQxEI2sEUaQ87OwtQ7JPO3tebe
         MspalvXufDkG4dOKTnOxuCNmmKk+9wZeF0iT2yoYnc3ZtrDCvVsg5EYjJonFZMMOtQIa
         tvtcCa93KrGyGiNWoO4zui1b/ORfnUUBgMhPbyxYtUZSYstz9Lsuzm55dJsPbkh04CbQ
         4JkvT0FSFx1CAmNOyuA5ouMro9kDZkGx3GMort77K0BeaUaS5btmizNUyjz/udDbYmEi
         sPTggDNj1to0FDFvJ92WeaYWI3pFz4lNz9QNcy60+YVB8SFYNaOWfu7CRkxOnhLzJT2j
         GGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340455; x=1790945255;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVgejJErSi/df8/6avC+kCC2kZbgZL+1y5/eEh1fX5I=;
        b=RzbEAqXr7WWPVxxOEWKUZ/NrJ8T4yU6J0mqPsrptMVXvMn1twZcoh8QJI2/oaiEvL+
         9HPIRSkuBi/PRvPXqQ8kqjC2Lxg5oUjS1/Fw59RU2aELQjZW3jGCPSgrQMzAaV10b17J
         q9wojG6ZqhvXjWA2RxydZ554IMquymCvjbusofy1xphg1pmsz307uRUny4U9SaNvTPAM
         cTqLr7DSvqUTOb2BiU2HsnEoFs7zmhthZiHS91mMOnbnbSyufR9EStXmBIHKRLEgk++l
         A0jxwEtH5ea/+igAqQOp7Lr/Vqz3xp7BjwgrV6Kq/k730P0ngboLL/uHX3IbnfOZ/n6s
         +eZg==
X-Forwarded-Encrypted: i=1; AKwUvBwDNBX2eFjhx/iLtzu7QZx0NvpxKRda0YdYDIaHoeK4+78ch6L9A8lBYqdh8U12Gemp/0oN+mCddCcA8g==@lists.infradead.org
X-Gm-Message-State: AFuF++kZcDsoFAYB4qVWAsYyTxtCK7gr8HNTe3kJp8A0s8dRxeVtFpOT
	m+BDyyAlyO5ln0w2T1bj835pW7klSigUZNEzF1kvzUbXjhCM5+YR/Q72Vpt/R8Y12bs=
X-Gm-Gg: AYBFou2ePrwaOmeisn6Y1edxLUnx/wX6xbmVqRdcTWPHNzX8Ykw9eed/u8jYmHaLtEq
	Nuar3OumvVnzqknOZ6x/058vvRYYxvssMghZHDncg2KTsCtkJRcsimOvWIifTrluKdL65s5sFcD
	H4dCAxkpoISo9tnBsXSChwWdvs3DcuECEEXXFPydzlNmSrgni18ND6PIJJaS0QOOlyJDdPTO1l0
	KMwWCdVnOxq3uHH1xbV8gvPlPlD9csXma6OMcGbpekJWHnfkGxe4DiIrPen1YVLlevwbDV+sAdb
	uTzkTh4N6Gn0PLw7qehPrJeaZILww4sGPiRdLk7oa/FZx1pxvjN+EpMVuosu5l3H/1OwZx51Yxq
	BweQG8cuAmZ33NNTreyEUZzS1leQJCZYC8NaJzauHCyd+wgBx9oqyEv93HEg7g2fvWPfMYKh0V0
	SkQcthTQQlkReU6gpvuu54r/U1CwRldViTnP3xpBsUZfBWo1tK9PLNRZfcOV64EaUObEqSvwuCu
	iR/Wzy9VoisQKNzDw==
X-Received: by 2002:a05:600c:6090:b0:49e:6e94:7cae with SMTP id 5b1f17b1804b1-49fe670424cmr91000685e9.28.1790340455565;
        Fri, 25 Sep 2026 05:47:35 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff27eabc1sm58460335e9.15.2026.09.25.05.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:47:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, Vinod Koul
 <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona
	Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Emil
 Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Heiko
	Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mfd@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
 <maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>, Michal Wilczynski
 <m.wilczynski@samsung.com>
Subject: Re: [PATCH v3 13/19] clk: starfive: jh7110-vout: Allow pixel clock
 rate propagation
In-Reply-To: <20260904-jh7110-clean-send-v3-13-484f9ae72715@samsung.com>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132733eucas1p1a6529cb2ea97bc75c9cd190d1ba901c0@eucas1p1.samsung.com>
 <20260904-jh7110-clean-send-v3-13-484f9ae72715@samsung.com>
Date: Fri, 25 Sep 2026 14:47:30 +0200
Message-ID: <1j5wzt8plp.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_054737_601396_944E0583 
X-CRM114-Status: GOOD (  15.65  )
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

On ven. 04 sept. 2026 at 15:27, Michal Wilczynski <m.wilczynski@samsung.com> wrote:

> The dc8200_pix0 and dc8200_pix1 MUXes feed the display controller, and
> the rate they carry is ultimately produced by the HDMI PHY, which
> registers hdmitx0_pixelclk as a clock provider.
>
> Add CLK_SET_RATE_PARENT to both MUXes so a rate requested on them
> reaches that parent, instead of being clamped to whatever rate the
> parent already happens to run at.
>
> Co-developed-by: Dominique Belhachemi <db@domibel.de>
> Signed-off-by: Dominique Belhachemi <db@domibel.de>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/clk/starfive/clk-starfive-jh7110-vout.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-vout.c b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> index bad20d5d794a72f071b4d547b7304786a8ba9afa..aeba42cd3c44ba205ced52b1826d2d2de82ad78f 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> @@ -40,10 +40,12 @@ static const struct jh71x0_clk_data jh7110_voutclk_data[] = {
>  	JH71X0_GATE(JH7110_VOUTCLK_DC8200_AXI, "dc8200_axi", 0, JH7110_VOUTCLK_VOUT_TOP_AXI),
>  	JH71X0_GATE(JH7110_VOUTCLK_DC8200_CORE, "dc8200_core", 0, JH7110_VOUTCLK_VOUT_TOP_AXI),
>  	JH71X0_GATE(JH7110_VOUTCLK_DC8200_AHB, "dc8200_ahb", 0, JH7110_VOUTCLK_VOUT_TOP_AHB),
> -	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX0, "dc8200_pix0", 0, 2,
> +	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX0, "dc8200_pix0",
> +		    CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, 2,

I see that you've added CLK_SET_RATE_NO_REPARENT following a previous
sashiko advice.

Note that saying it will 'hijack' the parent without it is kind of
strong. It is fine to let a mux reparent while setting a rate, as long
as you understand the possible consequences for the rest of the tree.

Regardless

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

>  		    JH7110_VOUTCLK_DC8200_PIX,
>  		    JH7110_VOUTCLK_HDMITX0_PIXELCLK),
> -	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX1, "dc8200_pix1", 0, 2,
> +	JH71X0_GMUX(JH7110_VOUTCLK_DC8200_PIX1, "dc8200_pix1",
> +		    CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, 2,
>  		    JH7110_VOUTCLK_DC8200_PIX,
>  		    JH7110_VOUTCLK_HDMITX0_PIXELCLK),
>  	/* LCD */
>
> -- 
> 2.34.1
>

-- 
Jerome

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
