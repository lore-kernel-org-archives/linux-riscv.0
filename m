Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EA3C55174
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 13:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kD4GsMStxmKaxKKLXMFJyn7Kc51u476s3Sfj8j8TJ6M=; b=fY1NPhyBP+0IXW
	r+Ff/YTJScFUw4ssNwKESAJDhdeDLPptj66QNTue35riZImcj/fP1ta5EVm4ubYMNljVNyVSAP/HH
	o0dk3q1/cUILamjioX8XGj5pgWF1Dl3Ifds/6xeL2fbpKgvF1NMerwGuiMqU1kM/P9gQiWScG75gf
	1CciAkfzcqP6w0a2gW8kC3NL5moIhlg25wwpgL3/qwOJxGxKJ/RaZLOEEc068lBN1soyto6EWxWct
	MRgjeBey+/5ZmN5mo1f5hYc8G5TadjV6U3gziCLpM4tswU/2ZkARQT0q5A3w7QYFruYSiDV0eeIQs
	7QCWtsxPGAFyy6J7dYCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsh8e-00000009Pmw-21oS;
	Sat, 08 Aug 2026 13:31:00 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsh8b-00000009PmA-3OV4
	for linux-riscv@lists.infradead.org;
	Sat, 08 Aug 2026 13:30:59 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-cb01d87597cso17295a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 08 Aug 2026 06:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786195857; x=1786800657; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6zYCYgrPHJ1R0IyDM9ZJHQW95fmf52/M7XVvd8snhDU=;
        b=RvM2L+eVTE3dJONTBxEncLOeOKDdHINbZ8l/+rRCpEOFP/AQhQQvl68Xz2F49p/U7V
         FmIrOQpbrKjhSJqhZjVbbNq4I0QaajXhFNRmVsYy2VqjwTFIps6HbzvaXnpwMPf2weEe
         CGLEmrE1OLNZZNCPo0XCcu7zR7E+IXJRNc7vxIQvTwhMjr2U1g84BBu1V6j2AaaLb2j+
         r/ljojxG8Vd+nYt157iC6TfhUjfYV9UDOh5XzVg8eXWPPXi44w5V6oV6XhG1aE0oXQuD
         86toMTw3LuYWaM49ORBhZsrOnjW3nTyQrPI5tejhoUxHRqWWS24wu0S+NAIzTgcgIUH5
         +a2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786195857; x=1786800657;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zYCYgrPHJ1R0IyDM9ZJHQW95fmf52/M7XVvd8snhDU=;
        b=nfypVLaS6NiRgfUWVljktqnQoPqwL4zeyvSco8zR0LeCcLtBTvypZWUIC/AavaL48c
         Dzk6Av7Gmbgt9I/tknNmiCArWFYvcitMUCaWSAKybizClLU1TeiavJyWhPkMwjwDLFCI
         bDxnwehbpwgH+FWXF0+pQbA5LxWA6iM3a4eGVQ5Dpx6L/p15DAjPFHxpd+VzxCakiN4h
         DYz9dZHZBMGJuV8vFc8yAvzDmiuCHusMGkscZzdCtXHR136i2skVZOGr/WtDCFMjVjus
         jXFEfB2ybrsH+wi3Y0fcS+Uwo7sCews6EqQ4Ox5ANrxn0Eehba2cwCy9/jE4FxRi6TyR
         liKA==
X-Forwarded-Encrypted: i=1; AHgh+Rr5IKFNc1WABO5UcUVfkfy0avlHl2ZJSesUM1u19sHwUb7B3bBQrmBWCqJ9GK/gySNfXkPeUeWddDi9lg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2yzV1KH3s4mYkYA2SE1cUp/d3TXdFOIWCb83ElkyNqyEWjkTG
	SvlLTEzHWgU8iQr5GWs7pCm5dvwC2+D2ibdd1wfYoTyI+VAHXdOXTDJf
X-Gm-Gg: AR+sD10GtfXqaAjKRIZnBuy8oisnUtSlsqV/l7C3QQrF8a3XdQ8nooxDp13KnqLQ3v6
	H/CKHbd2GAgeEc2WWv1WSQV+N4s7MH56jl2fRUWxkZm0ho2KuOH8oYfR1MxQxqXwIrCzydn5Drq
	udGFkCpaKqcsgpDe6e7z5F1WpO8tOh8sY/KqRxUVgia7JDuOZ+I3Y+eL8LGWn01gl5q1Vmi0k+M
	Jt4UTjDVX6U9K72zBUR2LVQUX47w/pz3H1xs5iwK8+zZ5rlX4TNFLnrKjdu68hKjButXvVdwbGP
	Z1+MTMDPtEtDF7F9MuZf5DP9zsh1xRpN54sXYnmUzzljzAtoXl5GRMiHodwlwkQygMAMEGMRCpk
	VGKNmggfWjur3/bXQJd4DVOC5hzVdSBRJor+bmqDLWY8hp+zpy2TczVfLjcxOsXDzHRrpj3wWmb
	0sufx8ZyH1szVQHqWYeMz0QoOQOMTx5Dq6YsBuySMyB/htQbuxDA==
X-Received: by 2002:a05:6a00:240c:b0:842:3838:cb03 with SMTP id d2e1a72fcca58-84f6b778b44mr5395163b3a.11.1786195856790;
        Sat, 08 Aug 2026 06:30:56 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51e9a9sm2125357b3a.37.2026.08.08.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 06:30:56 -0700 (PDT)
Date: Sat, 08 Aug 2026 21:30:52 +0800
Message-ID: <b66d3009f9cf310ca0f068999bd475ac.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 12/17] drm/spacemit: add Innosilicon DP/eDP
 controller bridge driver
In-Reply-To: <5537a40f12e80b89e330f37032016de6f3b9f4c7.camel@pengutronix.de>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-12-6de34d80e86c@gmail.com>
 <5537a40f12e80b89e330f37032016de6f3b9f4c7.camel@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_063057_854230_A44FCCCF 
X-CRM114-Status: GOOD (  30.47  )
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

Hi Philipp,

On Mon, 27 Jul 2026 09:49:58 +0200, Philipp Zabel wrote:
> On Sa, 2026-07-25 at 00:51 -0400, Cody Kang via B4 Relay wrote:
> > From: Cody Kang <codykang.hk@gmail.com>
> >
> > Add the DP/eDP controller that sits downstream of the Saturn DPU. Two
> > identical instances share one compatible; the eDP-vs-DP role is board
> > wiring, so it is taken from the devicetree: an eDP panel always sits
> > under an aux-bus child node, an external DP connector never does.
> >
> > The link is driven through the generic PHY framework, so the controller
> > never touches a PLL register. The controller's HPD interrupt is gated by
> > the DP pixel clock, which can be off exactly when a plug has to be
> > caught, so the connector is also polled and the interrupt path re-reads
> > the live level when it does fire.
> >
> > Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> > ---
> >  drivers/gpu/drm/spacemit/Kconfig            |   19 +
> >  drivers/gpu/drm/spacemit/Makefile           |    3 +
> >  drivers/gpu/drm/spacemit/spacemit_inno_dp.c | 2443 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/spacemit/spacemit_inno_dp.h |  328 ++++
> >  4 files changed, 2793 insertions(+)
> >
> [...]
> > diff --git a/drivers/gpu/drm/spacemit/spacemit_inno_dp.c b/drivers/gpu/drm/spacemit/spacemit_inno_dp.c
> > new file mode 100644
> > index 000000000000..e88731d9b18b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/spacemit/spacemit_inno_dp.c
> > @@ -0,0 +1,2443 @@
> [...]
> > +static int inno_dp_probe(struct platform_device *pdev)
> > +{
> [...]
> > +	dp->reset = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
>
> Since this is only asserted in probe and deasserted in remove, you
> could use devm_reset_control_get_optional_exclusive_deasserted() [1].

Thanks for the review. Will do in v2. The binding marks resets as
required, which means I shouldn't use _optional in the first place.
I will use the non-optional devm_reset_control_get_exclusive_deasserted().

> [1] https://docs.kernel.org/driver-api/reset.html#c.devm_reset_control_get_optional_exclusive_deasserted
>
> > +	if (IS_ERR(dp->reset)) {
> > +		ret = dev_err_probe(dev, PTR_ERR(dp->reset),
> > +				    "failed to get reset\n");
> > +		return ret;
> > +	}
> > +
> > +	dp->pxclk = devm_clk_get(dev, "pxclk");
> > +	if (IS_ERR(dp->pxclk)) {
> > +		ret = dev_err_probe(dev, PTR_ERR(dp->pxclk),
> > +				    "failed to get pxclk\n");
> > +		return ret;
> > +	}
> > +
> > +	if (dp->edp_mode) {
> > +		dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
> > +		/*
> > +		 * OP_DETECT is required: without it
> > +		 * drm_bridge_connector_detect() hard-codes CONNECTED for any
> > +		 * eDP connector and fbdev wedges at bind.
> > +		 */
> > +		dp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> > +				 DRM_BRIDGE_OP_HPD;
> > +	} else {
> > +		dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
> > +		/*
> > +		 * No OP_HPD: the HPD interrupt is gated by the DP pixel clock.
> > +		 * Leaving it out marks the connector POLL_CONNECT |
> > +		 * POLL_DISCONNECT instead.
> > +		 */
> > +		dp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> > +				 DRM_BRIDGE_OP_MODES;
> > +	}
> > +
> > +	if (dp->reset) {
>
> This check is not necessary, reset_control_deassert() handles NULL
> pointers.
>
> > +		ret = reset_control_deassert(dp->reset);
>
> If the _deasserted() variant is used above, this can be removed and the
> reset control doesn't need to be stored in dp.
>
> > +		if (ret) {
> > +			dev_err(dev, "failed to deassert reset: %d\n", ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> [...]
> > +	return 0;
> > +
> > +err_clk:
> > +	clk_disable_unprepare(dp->pxclk);
> > +err_reset:
> > +	if (dp->reset)
> > +		reset_control_assert(dp->reset);
>
> Same as above. Remove the unnecessary check or manual assertion
> entirely.

Agree, all of these will be fixed in v2.

Cody

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
